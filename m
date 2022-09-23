Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7EC5E85FA
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 00:43:58 +0200 (CEST)
Received: from localhost ([::1]:34046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obrOm-0005HC-Qp
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 18:43:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1obrMi-0002au-CO
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 18:41:48 -0400
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d]:37790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1obrMf-0000Ro-9z
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 18:41:47 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6EB971F86C;
 Fri, 23 Sep 2022 22:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663972903; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yF9l5q8FLm9shF/UI7BU2KCetp6ra7+yVyJfe/XIbmA=;
 b=Rj5wwKGw9p6xSQlmaV+Z0i/uT5Z9vRGPfwPaNhOa2caalkWrtjFbNsZfxzV6CM+ZEluWxw
 W0kIUj51hFmja9+jOreSb349YTUvXw2d4IdX36Zhh/BYDWRYrBxz42HypCxQQx7VMhKE/4
 7VFVCSDLIpQ1Chx/j8GXWrqBtilPN8A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663972903;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yF9l5q8FLm9shF/UI7BU2KCetp6ra7+yVyJfe/XIbmA=;
 b=wUNzm1gFvRptuFsdyw3RcgHhQ/B7V2pAU372MJnDXLo1W1QqjN+lL6PbZRKltgEth6p4rY
 lREWT062rCvy3sCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 11D9413AA5;
 Fri, 23 Sep 2022 22:41:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wDE4Aic2LmPBRwAAMHmgww
 (envelope-from <cfontana@suse.de>); Fri, 23 Sep 2022 22:41:43 +0000
Message-ID: <7bc62936-18e7-3ac7-324d-5efd9b78c680@suse.de>
Date: Sat, 24 Sep 2022 00:41:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v5 3/4] module: add Error arguments to module_load and
 module_load_qom
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org, dinechin@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220923145131.21282-1-cfontana@suse.de>
 <20220923145131.21282-4-cfontana@suse.de>
 <ec0cea5f-fce6-6af0-1f2f-f8e7e47380d5@amsat.org>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <ec0cea5f-fce6-6af0-1f2f-f8e7e47380d5@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d;
 envelope-from=cfontana@suse.de; helo=smtp-out2.suse.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/23/22 17:28, Philippe Mathieu-Daudé wrote:
> On 23/9/22 16:51, Claudio Fontana wrote:
>> improve error handling during module load, by changing:
>>
>> bool module_load(const char *prefix, const char *lib_name);
>> void module_load_qom(const char *type);
>>
>> to:
>>
>> int module_load(const char *prefix, const char *name, Error **errp);
>> int module_load_qom(const char *type, Error **errp);
>>
>> where the return value is:
>>
>>   -1 on module load error, and errp is set with the error
>>    0 on module or one of its dependencies are not installed
>>    1 on module load success
>>    2 on module load success (module already loaded or built-in)
>>
>> module_load_qom_one has been introduced in:
>>
>> commit 28457744c345 ("module: qom module support"), which built on top of
>> module_load_one, but discarded the bool return value. Restore it.
>>
>> Adapt all callers to emit errors, or ignore them, or fail hard,
>> as appropriate in each context.
>>
>> Some memory leaks also fixed as part of the module_load changes.
>>
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> ---
>>   audio/audio.c         |  16 ++--
>>   block.c               |  21 ++++-
>>   block/dmg.c           |  19 +++-
>>   hw/core/qdev.c        |   5 +-
>>   include/qemu/module.h |  37 +++++++-
>>   qom/object.c          |  18 +++-
>>   softmmu/qtest.c       |   8 +-
>>   ui/console.c          |  18 +++-
>>   util/module.c         | 211 +++++++++++++++++++++++-------------------
>>   9 files changed, 230 insertions(+), 123 deletions(-)
> 
>> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
>> index 25dfc08468..06a4bce145 100644
>> --- a/hw/core/qdev.c
>> +++ b/hw/core/qdev.c
>> @@ -147,8 +147,9 @@ bool qdev_set_parent_bus(DeviceState *dev, BusState *bus, Error **errp)
>>   
>>   DeviceState *qdev_new(const char *name)
>>   {
>> -    if (!object_class_by_name(name)) {
>> -        module_load_qom(name);
>> +    if (!module_object_class_by_name(name)) {
>> +        error_report("could not find a module for type '%s'", name);
>> +        abort();
> 
> No need to abort:
> 
>             exit(1);

Hi Philippe,

I just noticed that all the rest of the code in similar situations in object.c abort()s in these case,
never exit()s.

Do you think this case is different than the others?

The most emblematic example is in qom/object.c:

void object_initialize(void *data, size_t size, const char *typename)
{
    TypeImpl *type = type_get_by_name(typename);

#ifdef CONFIG_MODULES
    if (!type) {
        Error *local_err = NULL;
        int rv = module_load_qom(typename, &local_err);
        if (rv > 0) {
            type = type_get_by_name(typename);
        } else if (rv < 0) {
            error_report_err(local_err);
        }
    }
#endif
    if (!type) {
        error_report("missing object type '%s'", typename);
        abort();
    }

    object_initialize_with_type(data, size, type);
}


Do you think we should always exit and not abort when we don't find a type?

Just trying to avoid introducing inconsistent handling of the same situation.

Thanks,

Claudio

> 
>>       }
>>       return DEVICE(object_new(name));
>>   }
>> diff --git a/include/qemu/module.h b/include/qemu/module.h
>> index b7911ce791..c37ce74b16 100644
>> --- a/include/qemu/module.h
>> +++ b/include/qemu/module.h
>> @@ -61,16 +61,43 @@ typedef enum {
>>   #define fuzz_target_init(function) module_init(function, \
>>                                                  MODULE_INIT_FUZZ_TARGET)
>>   #define migration_init(function) module_init(function, MODULE_INIT_MIGRATION)
>> -#define block_module_load(lib) module_load("block-", lib)
>> -#define ui_module_load(lib) module_load("ui-", lib)
>> -#define audio_module_load(lib) module_load("audio-", lib)
>> +#define block_module_load(lib, errp) module_load("block-", lib, errp)
>> +#define ui_module_load(lib, errp) module_load("ui-", lib, errp)
>> +#define audio_module_load(lib, errp) module_load("audio-", lib, errp)
>>   
>>   void register_module_init(void (*fn)(void), module_init_type type);
>>   void register_dso_module_init(void (*fn)(void), module_init_type type);
>>   
>>   void module_call_init(module_init_type type);
>> -bool module_load(const char *prefix, const char *lib_name);
>> -void module_load_qom(const char *type);
>> +
>> +/*
>> + * module_load: attempt to load a module from a set of directories
>> + *
>> + * directories searched are:
>> + * - getenv("QEMU_MODULE_DIR")
>> + * - get_relocated_path(CONFIG_QEMU_MODDIR);
>> + * - /var/run/qemu/${version_dir}
>> + *
>> + * prefix:         a subsystem prefix, or the empty string ("audio-", ..., "")
>> + * name:           name of the module
>> + * errp:           error to set in case the module is found, but load failed.
>> + *
>> + * Return value:   -1 on error (errp set if not NULL).
>> + *                 0 if module or one of its dependencies are not installed,
>> + *                 1 if the module is found and loaded,
>> + *                 2 if the module is already loaded, or module is built-in.
>> + */
>> +int module_load(const char *prefix, const char *name, Error **errp);
>> +
>> +/*
>> + * module_load_qom: attempt to load a module to provide a QOM type
>> + *
>> + * type:           the type to be provided
>> + * errp:           error to set.
>> + *
>> + * Return value:   as per module_load.
>> + */
>> +int module_load_qom(const char *type, Error **errp);
>>   void module_load_qom_all(void);
>>   void module_allow_arch(const char *arch);
>>   
>> diff --git a/qom/object.c b/qom/object.c
>> index 4f834f3bf6..35ced55282 100644
>> --- a/qom/object.c
>> +++ b/qom/object.c
>> @@ -526,8 +526,13 @@ void object_initialize(void *data, size_t size, const char *typename)
>>   
>>   #ifdef CONFIG_MODULES
>>       if (!type) {
>> -        module_load_qom(typename);
>> -        type = type_get_by_name(typename);
>> +        Error *local_err = NULL;
>> +        int rv = module_load_qom(typename, &local_err);
>> +        if (rv > 0) {
>> +            type = type_get_by_name(typename);
>> +        } else if (rv < 0) {
>> +            error_report_err(local_err);
>> +        }
>>       }
>>   #endif
>>       if (!type) {
>> @@ -1033,8 +1038,13 @@ ObjectClass *module_object_class_by_name(const char *typename)
>>       oc = object_class_by_name(typename);
>>   #ifdef CONFIG_MODULES
>>       if (!oc) {
>> -        module_load_qom(typename);
>> -        oc = object_class_by_name(typename);
>> +        Error *local_err = NULL;
>> +        int rv = module_load_qom(typename, &local_err);
>> +        if (rv > 0) {
>> +            oc = object_class_by_name(typename);
>> +        } else if (rv < 0) {
>> +            error_report_err(local_err);
>> +        }
>>       }
>>   #endif
>>       return oc;
>> diff --git a/softmmu/qtest.c b/softmmu/qtest.c
>> index fc5b733c63..36e28609ff 100644
>> --- a/softmmu/qtest.c
>> +++ b/softmmu/qtest.c
>> @@ -753,12 +753,18 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
>>           qtest_sendf(chr, "OK %"PRIi64"\n",
>>                       (int64_t)qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
>>       } else if (strcmp(words[0], "module_load") == 0) {
>> +        Error *local_err = NULL;
>> +        int rv;
>>           g_assert(words[1] && words[2]);
>>   
>>           qtest_send_prefix(chr);
>> -        if (module_load(words[1], words[2])) {
>> +        rv = module_load(words[1], words[2], &local_err);
>> +        if (rv > 0) {
>>               qtest_sendf(chr, "OK\n");
>>           } else {
>> +            if (rv < 0) {
>> +                error_report_err(local_err);
>> +            }
>>               qtest_sendf(chr, "FAIL\n");
>>           }
>>       } else if (qtest_enabled() && strcmp(words[0], "clock_set") == 0) {
>> diff --git a/ui/console.c b/ui/console.c
>> index 4913c55684..4e53c3c71b 100644
>> --- a/ui/console.c
>> +++ b/ui/console.c
>> @@ -2632,7 +2632,11 @@ bool qemu_display_find_default(DisplayOptions *opts)
>>   
>>       for (i = 0; i < (int)ARRAY_SIZE(prio); i++) {
>>           if (dpys[prio[i]] == NULL) {
>> -            ui_module_load(DisplayType_str(prio[i]));
>> +            Error *local_err = NULL;
>> +            int rv = ui_module_load(DisplayType_str(prio[i]), &local_err);
>> +            if (rv < 0) {
>> +                error_report_err(local_err);
>> +            }
>>           }
>>           if (dpys[prio[i]] == NULL) {
>>               continue;
>> @@ -2650,7 +2654,11 @@ void qemu_display_early_init(DisplayOptions *opts)
>>           return;
>>       }
>>       if (dpys[opts->type] == NULL) {
>> -        ui_module_load(DisplayType_str(opts->type));
>> +        Error *local_err = NULL;
>> +        int rv = ui_module_load(DisplayType_str(opts->type), &local_err);
>> +        if (rv < 0) {
>> +            error_report_err(local_err);
>> +        }
>>       }
>>       if (dpys[opts->type] == NULL) {
>>           error_report("Display '%s' is not available.",
>> @@ -2680,7 +2688,11 @@ void qemu_display_help(void)
>>       printf("none\n");
>>       for (idx = DISPLAY_TYPE_NONE; idx < DISPLAY_TYPE__MAX; idx++) {
>>           if (!dpys[idx]) {
>> -            ui_module_load(DisplayType_str(idx));
>> +            Error *local_err = NULL;
>> +            int rv = ui_module_load(DisplayType_str(idx), &local_err);
>> +            if (rv < 0) {
>> +                error_report_err(local_err);
>> +            }
>>           }
>>           if (dpys[idx]) {
>>               printf("%s\n",  DisplayType_str(dpys[idx]->type));
> 
> Up to here:
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> I need some sugar to review the rest, bbl.
> 
>> diff --git a/util/module.c b/util/module.c
>> index ad89cd50dc..b67923a986 100644
>> --- a/util/module.c
>> +++ b/util/module.c
>> @@ -21,6 +21,7 @@
>>   #include "qemu/module.h"
>>   #include "qemu/cutils.h"
>>   #include "qemu/config-file.h"
>> +#include "qapi/error.h"
>>   #ifdef CONFIG_MODULE_UPGRADES
>>   #include "qemu-version.h"
>>   #endif
>> @@ -144,25 +145,22 @@ static bool module_check_arch(const QemuModinfo *modinfo)
>>       return true;
>>   }
>>   
>> -static int module_load_file(const char *fname, bool export_symbols)
>> +/*
>> + * module_load_dso: attempt to load an existing dso file
>> + *
>> + * fname:          full pathname of the file to load
>> + * export_symbols: if true, add the symbols to the global name space
>> + * errp:           error to set.
>> + *
>> + * Return value:   true on success, false on error, and errp will be set.
>> + */
>> +static bool module_load_dso(const char *fname, bool export_symbols,
>> +                            Error **errp)
>>   {
>>       GModule *g_module;
>>       void (*sym)(void);
>> -    const char *dsosuf = CONFIG_HOST_DSOSUF;
>> -    int len = strlen(fname);
>> -    int suf_len = strlen(dsosuf);
>>       ModuleEntry *e, *next;
>> -    int ret, flags;
>> -
>> -    if (len <= suf_len || strcmp(&fname[len - suf_len], dsosuf)) {
>> -        /* wrong suffix */
>> -        ret = -EINVAL;
>> -        goto out;
>> -    }
>> -    if (access(fname, F_OK)) {
>> -        ret = -ENOENT;
>> -        goto out;
>> -    }
>> +    int flags;
>>   
>>       assert(QTAILQ_EMPTY(&dso_init_list));
>>   
>> @@ -172,46 +170,38 @@ static int module_load_file(const char *fname, bool export_symbols)
>>       }
>>       g_module = g_module_open(fname, flags);
>>       if (!g_module) {
>> -        fprintf(stderr, "Failed to open module: %s\n",
>> -                g_module_error());
>> -        ret = -EINVAL;
>> -        goto out;
>> +        error_setg(errp, "failed to open module: %s", g_module_error());
>> +        return false;
>>       }
>>       if (!g_module_symbol(g_module, DSO_STAMP_FUN_STR, (gpointer *)&sym)) {
>> -        fprintf(stderr, "Failed to initialize module: %s\n",
>> -                fname);
>> -        /* Print some info if this is a QEMU module (but from different build),
>> -         * this will make debugging user problems easier. */
>> +        error_setg(errp, "failed to initialize module: %s", fname);
>> +        /*
>> +         * Print some info if this is a QEMU module (but from different build),
>> +         * this will make debugging user problems easier.
>> +         */
>>           if (g_module_symbol(g_module, "qemu_module_dummy", (gpointer *)&sym)) {
>> -            fprintf(stderr,
>> -                    "Note: only modules from the same build can be loaded.\n");
>> +            error_append_hint(errp,
>> +                "Only modules from the same build can be loaded.\n");
>>           }
>>           g_module_close(g_module);
>> -        ret = -EINVAL;
>> -    } else {
>> -        QTAILQ_FOREACH(e, &dso_init_list, node) {
>> -            e->init();
>> -            register_module_init(e->init, e->type);
>> -        }
>> -        ret = 0;
>> +        return false;
>>       }
>>   
>> +    QTAILQ_FOREACH(e, &dso_init_list, node) {
>> +        e->init();
>> +        register_module_init(e->init, e->type);
>> +    }
>>       trace_module_load_module(fname);
>>       QTAILQ_FOREACH_SAFE(e, &dso_init_list, node, next) {
>>           QTAILQ_REMOVE(&dso_init_list, e, node);
>>           g_free(e);
>>       }
>> -out:
>> -    return ret;
>> +    return true;
>>   }
>> -#endif
>>   
>> -bool module_load(const char *prefix, const char *lib_name)
>> +int module_load(const char *prefix, const char *name, Error **errp)
>>   {
>> -    bool success = false;
>> -
>> -#ifdef CONFIG_MODULES
>> -    char *fname = NULL;
>> +    int rv = -1;
>>   #ifdef CONFIG_MODULE_UPGRADES
>>       char *version_dir;
>>   #endif
>> @@ -219,54 +209,29 @@ bool module_load(const char *prefix, const char *lib_name)
>>       char *dirs[5];
>>       char *module_name;
>>       int i = 0, n_dirs = 0;
>> -    int ret;
>>       bool export_symbols = false;
>>       static GHashTable *loaded_modules;
>>       const QemuModinfo *modinfo;
>>       const char **sl;
>>   
>>       if (!g_module_supported()) {
>> -        fprintf(stderr, "Module is not supported by system.\n");
>> -        return false;
>> +        error_setg(errp, "%s", "this platform does not support GLib modules");
>> +        return -1;
>>       }
>>   
>>       if (!loaded_modules) {
>>           loaded_modules = g_hash_table_new(g_str_hash, g_str_equal);
>>       }
>>   
>> -    module_name = g_strdup_printf("%s%s", prefix, lib_name);
>> +    /* allocate all resources managed by the out: label here */
>> +    module_name = g_strdup_printf("%s%s", prefix, name);
>>   
>>       if (g_hash_table_contains(loaded_modules, module_name)) {
>>           g_free(module_name);
>> -        return true;
>> +        return 2; /* module already loaded */
>>       }
>>       g_hash_table_add(loaded_modules, module_name);
>>   
>> -    for (modinfo = module_info; modinfo->name != NULL; modinfo++) {
>> -        if (modinfo->arch) {
>> -            if (strcmp(modinfo->name, module_name) == 0) {
>> -                if (!module_check_arch(modinfo)) {
>> -                    return false;
>> -                }
>> -            }
>> -        }
>> -        if (modinfo->deps) {
>> -            if (strcmp(modinfo->name, module_name) == 0) {
>> -                /* we depend on other module(s) */
>> -                for (sl = modinfo->deps; *sl != NULL; sl++) {
>> -                    module_load("", *sl);
>> -                }
>> -            } else {
>> -                for (sl = modinfo->deps; *sl != NULL; sl++) {
>> -                    if (strcmp(module_name, *sl) == 0) {
>> -                        /* another module depends on us */
>> -                        export_symbols = true;
>> -                    }
>> -                }
>> -            }
>> -        }
>> -    }
>> -
>>       search_dir = getenv("QEMU_MODULE_DIR");
>>       if (search_dir != NULL) {
>>           dirs[n_dirs++] = g_strdup_printf("%s", search_dir);
>> @@ -279,46 +244,87 @@ bool module_load(const char *prefix, const char *lib_name)
>>                                '_');
>>       dirs[n_dirs++] = g_strdup_printf("/var/run/qemu/%s", version_dir);
>>   #endif
>> -
>>       assert(n_dirs <= ARRAY_SIZE(dirs));
>>   
>> -    for (i = 0; i < n_dirs; i++) {
>> -        fname = g_strdup_printf("%s/%s%s",
>> -                dirs[i], module_name, CONFIG_HOST_DSOSUF);
>> -        ret = module_load_file(fname, export_symbols);
>> -        g_free(fname);
>> -        fname = NULL;
>> -        /* Try loading until loaded a module file */
>> -        if (!ret) {
>> -            success = true;
>> -            break;
>> +    /* end of resources managed by the out: label */
>> +
>> +    for (modinfo = module_info; modinfo->name != NULL; modinfo++) {
>> +        if (modinfo->arch) {
>> +            if (strcmp(modinfo->name, module_name) == 0) {
>> +                if (!module_check_arch(modinfo)) {
>> +                    error_setg(errp, "module arch does not match: "
>> +                        "expected '%s', got '%s'", module_arch, modinfo->arch);
>> +                    goto out;
>> +                }
>> +            }
>> +        }
>> +        if (modinfo->deps) {
>> +            if (strcmp(modinfo->name, module_name) == 0) {
>> +                /* we depend on other module(s) */
>> +                for (sl = modinfo->deps; *sl != NULL; sl++) {
>> +                    int subrv = module_load("", *sl, errp);
>> +                    if (subrv <= 0) {
>> +                        rv = subrv;
>> +                        goto out;
>> +                    }
>> +                }
>> +            } else {
>> +                for (sl = modinfo->deps; *sl != NULL; sl++) {
>> +                    if (strcmp(module_name, *sl) == 0) {
>> +                        /* another module depends on us */
>> +                        export_symbols = true;
>> +                    }
>> +                }
>> +            }
>>           }
>>       }
>>   
>> -    if (!success) {
>> -        g_hash_table_remove(loaded_modules, module_name);
>> -        g_free(module_name);
>> +    for (i = 0; i < n_dirs; i++) {
>> +        char *fname = g_strdup_printf("%s/%s%s",
>> +                                      dirs[i], module_name, CONFIG_HOST_DSOSUF);
>> +        int ret = access(fname, F_OK);
>> +        if (ret != 0 && (errno == ENOENT || errno == ENOTDIR)) {
>> +            /*
>> +             * if we don't find the module in this dir, try the next one.
>> +             * If we don't find it in any dir, that can be fine too: user
>> +             * did not install the module. We will return 0 in this case
>> +             * with no error set.
>> +             */
>> +            g_free(fname);
>> +            continue;
>> +        } else if (ret != 0) {
>> +            /* most common is EACCES here */
>> +            error_setg_errno(errp, errno, "error trying to access %s", fname);
>> +        } else if (module_load_dso(fname, export_symbols, errp)) {
>> +            rv = 1; /* module successfully loaded */
>> +        }
>> +        g_free(fname);
>> +        goto out;
>>       }
>> +    rv = 0; /* module not found */
>>   
>> +out:
>> +    if (rv <= 0) {
>> +        g_hash_table_remove(loaded_modules, module_name);
>> +    }
>> +    g_free(module_name);
>>       for (i = 0; i < n_dirs; i++) {
>>           g_free(dirs[i]);
>>       }
>> -
>> -#endif
>> -    return success;
>> +    return rv;
>>   }
>>   
>> -#ifdef CONFIG_MODULES
>> -
>>   static bool module_loaded_qom_all;
>>   
>> -void module_load_qom(const char *type)
>> +int module_load_qom(const char *type, Error **errp)
>>   {
>>       const QemuModinfo *modinfo;
>>       const char **sl;
>> +    int rv = 0;
>>   
>>       if (!type) {
>> -        return;
>> +        error_setg(errp, "%s", "type is NULL");
>> +        return -1;
>>       }
>>   
>>       trace_module_lookup_object_type(type);
>> @@ -331,15 +337,24 @@ void module_load_qom(const char *type)
>>           }
>>           for (sl = modinfo->objs; *sl != NULL; sl++) {
>>               if (strcmp(type, *sl) == 0) {
>> -                module_load("", modinfo->name);
>> +                if (rv > 0) {
>> +                    error_setg(errp, "multiple modules providing '%s'", type);
>> +                    return -1;
>> +                }
>> +                rv = module_load("", modinfo->name, errp);
>> +                if (rv < 0) {
>> +                    return rv;
>> +                }
>>               }
>>           }
>>       }
>> +    return rv;
>>   }
>>   
>>   void module_load_qom_all(void)
>>   {
>>       const QemuModinfo *modinfo;
>> +    Error *local_err = NULL;
>>   
>>       if (module_loaded_qom_all) {
>>           return;
>> @@ -352,7 +367,9 @@ void module_load_qom_all(void)
>>           if (!module_check_arch(modinfo)) {
>>               continue;
>>           }
>> -        module_load("", modinfo->name);
>> +        if (module_load("", modinfo->name, &local_err) < 0) {
>> +            error_report_err(local_err);
>> +        }
>>       }
>>       module_loaded_qom_all = true;
>>   }
>> @@ -368,7 +385,10 @@ void qemu_load_module_for_opts(const char *group)
>>           }
>>           for (sl = modinfo->opts; *sl != NULL; sl++) {
>>               if (strcmp(group, *sl) == 0) {
>> -                module_load("", modinfo->name);
>> +                Error *local_err = NULL;
>> +                if (module_load("", modinfo->name, &local_err) < 0) {
>> +                    error_report_err(local_err);
>> +                }
>>               }
>>           }
>>       }
>> @@ -378,7 +398,8 @@ void qemu_load_module_for_opts(const char *group)
>>   
>>   void module_allow_arch(const char *arch) {}
>>   void qemu_load_module_for_opts(const char *group) {}
>> -void module_load_qom(const char *type) {}
>> +int module_load(const char *prefix, const char *name, Error **errp) { return 2; }
>> +int module_load_qom(const char *type, Error **errp) { return 2; }
>>   void module_load_qom_all(void) {}
>>   
>>   #endif
> 


