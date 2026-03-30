return {
    'nvim-orgmode/orgmode',
    event = 'VeryLazy',
    ft = { 'org' },
    config = function()
        -- Setup orgmode
        require('orgmode').setup({
            org_agenda_files = {'~/org/*'},
            org_default_notes_file = '~/org/refile.org',
            org_log_into_drawer = 'LOGBOOK',
            org_capture_templates = {
                t = {
                    description = 'Task',
                    template = '* TODO %?\n  %u'
                },
                l = {
                    description = '[Maker]log',
                    template = '* %?',
                    target = '~/org/Makerlog.org',
                    datetree = true,
                },
            }
        })
    end,
}
