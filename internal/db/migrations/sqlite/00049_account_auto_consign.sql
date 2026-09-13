-- +goose Up
ALTER TABLE cookies ADD COLUMN auto_consign INTEGER NOT NULL DEFAULT 0;
-- 存量账号按原有 auto_confirm 习惯回填：原来开自动发货的账号升级后行为不变（发消息且转已发货）。
UPDATE cookies SET auto_consign = auto_confirm;

-- +goose Down
ALTER TABLE cookies DROP COLUMN auto_consign;
