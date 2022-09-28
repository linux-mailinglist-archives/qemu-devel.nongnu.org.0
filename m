Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E94185EDE12
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 15:47:28 +0200 (CEST)
Received: from localhost ([::1]:32836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odXPM-0007Fe-0f
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 09:47:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1odVmI-0006bS-0Z
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 08:03:02 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:36406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1odVmE-0001xt-PG
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 08:03:00 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 07DD81FA40;
 Wed, 28 Sep 2022 12:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664366573; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pfcfz93xrZm3HxaxmEVVigp7u5/qmu1R8aSpKp4xn30=;
 b=X1d2hpzf11f+sXdWmUkY95yvztvbqmxgmWGkVUDvKfGWZ73e17/QMENndGm4L0HYCOw4l3
 yQ8P5Jg1MlsOAvSqY2TJH26vucq8sOeyjGr5YWUPhWJKMXnqUp8g+5xaSIxWVLedlzRM7d
 S3YDBlppkOcUUJIOXfs6Ueny6cMZBZo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664366573;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pfcfz93xrZm3HxaxmEVVigp7u5/qmu1R8aSpKp4xn30=;
 b=7GdF2aE+SNFsgHaKo+jwLi1xzrQbgpbwwOv6uKbQUtZRF7DfZybdJLMxDOYH+b9mewxpAg
 7LR/JApF9+Lw93Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4DD6913677;
 Wed, 28 Sep 2022 12:02:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wx0FAeo3NGN1MwAAMHmgww
 (envelope-from <cfontana@suse.de>); Wed, 28 Sep 2022 12:02:50 +0000
Message-ID: <3487e03f-30dc-6545-4d24-cfee9ad15642@suse.de>
Date: Wed, 28 Sep 2022 14:02:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v7 3/5] module: add Error arguments to module_load and
 module_load_qom
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, dinechin@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2eBerrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220927133825.32631-1-cfontana@suse.de>
 <20220927133825.32631-4-cfontana@suse.de> <87zgejybu4.fsf@pond.sub.org>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <87zgejybu4.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

On 9/28/22 13:31, Markus Armbruster wrote:
> Claudio Fontana <cfontana@suse.de> writes:
> 
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
>>  -1 on module load error, and errp is set with the error
>>   0 on module or one of its dependencies are not installed
>>   1 on module load success
>>   2 on module load success (module already loaded or built-in)
> 
> Two changes, if I understand things correctly:
> 
> 1. Convert to Error API from fprintf(stderr, ...)
> 
> 2. Return a more useful value
> 
> Right?

Yes.

> 
> Do you add any new errors here that weren't reported before?  Just

Yes.

> trying to calibrate my expectations before I dig into the actual patch.
> 
>> module_load_qom_one has been introduced in:
>>
>> commit 28457744c345 ("module: qom module support"), which built on top of
>> module_load_one, but discarded the bool return value. Restore it.
>>
>> Adapt all callers to emit errors, or ignore them, or fail hard,
>> as appropriate in each context.
>>
>> Some memory leaks also fixed as part of the module_load changes.
> 
> Where?

I misinterpreted the use of g_hash_table_add, so there is a fix for me here too (module_name should not be freed as the g_hash_table_add takes ownership).
The g_* API is a bit messy here, as the ownership and whether the key is freed depends on how the table was created (supplying a free function or not).

However, the code in the loop following the g_hash_table_add may "return false;" from the function directly,
skipping the cleanup code:

g_hash_table_add(loaded_modules, module_name);

-    for (modinfo = module_info; modinfo->name != NULL; modinfo++) {
-        if (modinfo->arch) {
-            if (strcmp(modinfo->name, module_name) == 0) {
-                if (!module_check_arch(modinfo)) {
-                    return false;
-                }
-            }
-        }
     }

So there is no chance to free at:

-    if (!success) {
-        g_hash_table_remove(loaded_modules, module_name);
-        g_free(module_name);
      }

But, I should not have taken the g_free(...) out of the test, will fix.



> 
>> audio: when attempting to load an audio module, report module load errors.
>> block: when attempting to load a block module, report module load errors.
>> console: when attempting to load a display module, report module load errors.
>>
>> qdev: when creating a new qdev Device object (DeviceState), report load errors.
>>       If a module cannot be loaded to create that device, now abort execution.
>>
>> qom/object.c: when initializing a QOM object, or looking up class_by_name,
>>               report module load errors.
>>
>> qtest: when processing the "module_load" qtest command, report errors
>>        in the load of the module.
> 
> This looks like a list of behavioral changes.  Appreciated!  It's a bit
> terse, though.  I might come back to this and suggest improvement.  But
> first, I need to understand the patch.
> 
>>
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> ---
>>  audio/audio.c         |  16 ++--
>>  block.c               |  20 +++-
>>  block/dmg.c           |  14 ++-
>>  hw/core/qdev.c        |  17 +++-
>>  include/qemu/module.h |  37 +++++++-
>>  qom/object.c          |  18 +++-
>>  softmmu/qtest.c       |   8 +-
>>  ui/console.c          |  18 +++-
>>  util/module.c         | 211 +++++++++++++++++++++++-------------------
>>  9 files changed, 235 insertions(+), 124 deletions(-)
>>
>> diff --git a/audio/audio.c b/audio/audio.c
>> index 0a682336a0..ea51793843 100644
>> --- a/audio/audio.c
>> +++ b/audio/audio.c
>> @@ -72,20 +72,24 @@ void audio_driver_register(audio_driver *drv)
>>  audio_driver *audio_driver_lookup(const char *name)
>>  {
>>      struct audio_driver *d;
>> +    Error *local_err = NULL;
>> +    int rv;
>>  
>>      QLIST_FOREACH(d, &audio_drivers, next) {
>>          if (strcmp(name, d->name) == 0) {
>>              return d;
>>          }
>>      }
>> -
>> -    audio_module_load(name);
>> -    QLIST_FOREACH(d, &audio_drivers, next) {
>> -        if (strcmp(name, d->name) == 0) {
>> -            return d;
>> +    rv = audio_module_load(name, &local_err);
>> +    if (rv > 0) {
>> +        QLIST_FOREACH(d, &audio_drivers, next) {
>> +            if (strcmp(name, d->name) == 0) {
>> +                return d;
>> +            }
>>          }
>> +    } else if (rv < 0) {
>> +        error_report_err(local_err);
>>      }
>> -
>>      return NULL;
>>  }
>>  
> 
> Before: audio_module_load() reports to stderr, but the caller can't

before: reports _some_ errors to stderr

> know.  So, error or no error, search the driver registry for the one we
> want.  Return it if found, else fail.
> 
> After: if audio_module_load() fails, report to stderr or current
> monitor, and fail.  If it could find no module or loaded one, search the
> driver registry.  Return it if found, else fail.
> 
> What if audio_module_load() fails, but a search for the driver succeeds?
> Before the patch, we succeed.  

audio_module_load() is the only way that audio_drivers can be updated and the search would return a different result.
The previous code was just lazily running the same code twice to make it simpler for the programmer in those conditions.

Afterwards, we fail.  Can this happen?

No.

> Yes: module_load() starts with
> 
>        if (!g_module_supported()) {
>            error_setg(errp, "%s", "this platform does not support GLib modules");
>            return -1;
>        }
> 
> Regression.
> 
> One way to fix: ensure module_load() cannot fail when the search will
> succeed.
> 
> Another: search first, and module_load() only if not found, then search
> again.
> 

Does not apply.

> Now let's review your use of the Error API.  Error objects should be
> passed up the call chain to the place that handles then.  The call
> chains are:
> 
> * audio_init(), which is called by
> 
>   - AUD_register_card(), which is called by a bunch of device creation
>     helpers called within machine initialization functions (I think),
>     which are called from qemu_init() via qemu_init_board() and
>     machine_run_board_init()
> 
>   - AUD_add_capture(), which is called by
> 
>     · wav_start_capture(), which is called by hmp_wavcapture on behalf
>       of HMP command wavcapture
> 
>     · audio_add(), which is called by protocol_client_msg() in respone
>       of a VNC_MSG_CLIENT_QEMU_AUDIO_ENABLE message from a VNC client (I
>       think).  Since audio_add() does return anything, its callers
>       remain oblivious of failure.
> 
>   - audio_init_audiodevs(), which is called by
>     qemu_create_early_backends(), which is called by qemu_init()
> 
> * audio_help(), which is called by
> 
>   - audio_parse_option(), which is called by qemu_init()
> 
>   - qemu_init()
> 
> * audio_handle_legacy_opts()
> 
>   - audio_init(); see above
> 
>   - audio_legacy_help(), which is called by qemu_init()
> 
> For the call chains that end in qemu_init(), error_report_err() is okay.
> Just beware of error cascades, i.e. one issue triggering multiple
> reports.  That's bad UX.  The extra reporting should predate this patch,
> which means it's no reason to reject this patch.
> 
> Likewise for call chains that end in an HMP command, because
> error_report_err() does the right thing then: it reports to the current
> monitor.  Bug fix: before the patch, it reports to stderr.  Commit
> message should mention the fix.
> 
> The problematic case is audio_add().  Reporting an error and then
> ignoring it feels wrong.  But it's how audio_add() works even before
> this patch.  Not this patch's problem to solve.
> 
>> diff --git a/block.c b/block.c
>> index 72c7f6d47d..7a94739aed 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -464,12 +464,18 @@ BlockDriver *bdrv_find_format(const char *format_name)
>>      /* The driver isn't registered, maybe we need to load a module */
>>      for (i = 0; i < (int)ARRAY_SIZE(block_driver_modules); ++i) {
>>          if (!strcmp(block_driver_modules[i].format_name, format_name)) {
>> -            block_module_load(block_driver_modules[i].library_name);
>> +            Error *local_err = NULL;
>> +            int rv = block_module_load(block_driver_modules[i].library_name,
>> +                                       &local_err);
>> +            if (rv > 0) {
>> +                return bdrv_do_find_format(format_name);
>> +            } else if (rv < 0) {
>> +                error_report_err(local_err);
>> +            }
>>              break;
>>          }
>>      }
>> -
>> -    return bdrv_do_find_format(format_name);
>> +    return NULL;
>>  }
>>  
> 
> Same regression, I think.

There is no problem here either.

> 
> Callers:
> 
> * bdrv_open_common()
> 
> * bdrv_fill_options()
> 
> * bdrv_open_inherit()
> 
> * bdrv_insert_node()
> 
> * bdrv_img_create()
> 
> * qmp_x_blockdev_amend()
> 
> * qmp_blockdev_create()
> 
> * qcow_co_create_opts()
> 
> * enable_write_target()
> 
> These all use the Error API.  Thus, we have instances of the
> "error_report() or similar from within a user of th Error API"
> anti-pattern.
> 
> Let's look more closely at just one of them: qmp_blockdev_create().
> Since we're in QMP monitor context, bdrv_find_format()'s
> error_report_err() will report a specific error to stderr, and then
> qmp_blockdev_create() will report a less specific one to the QMP client.
> This is wrong.
> 
> The obvious fix is to convert bdrv_find_format() to the Error API.
> 
> If you can't do that now, please note the issue in the commit message.
> 
>>  static int bdrv_format_is_whitelisted(const char *format_name, bool read_only)
>> @@ -976,12 +982,16 @@ BlockDriver *bdrv_find_protocol(const char *filename,
>>      for (i = 0; i < (int)ARRAY_SIZE(block_driver_modules); ++i) {
>>          if (block_driver_modules[i].protocol_name &&
>>              !strcmp(block_driver_modules[i].protocol_name, protocol)) {
>> -            block_module_load(block_driver_modules[i].library_name);
>> +            int rv = block_module_load(block_driver_modules[i].library_name, errp);
>> +            if (rv > 0) {
>> +                drv1 = bdrv_do_find_protocol(protocol);
>> +            } else if (rv < 0) {
>> +                return NULL;
>> +            }
>>              break;
>>          }
>>      }
>>  
>> -    drv1 = bdrv_do_find_protocol(protocol);
>>      if (!drv1) {
>>          error_setg(errp, "Unknown protocol '%s'", protocol);
>>      }
> 
> Same regression, I think.
> 
> bdrv_find_protocol() already uses the Error API, and your patch passes
> the Error up the chain.  Good.

This can be done here.

> 
> [...]
> 
> Out of steam for today, intend to continue later.  If you want to respin
> meanwhile, that's okay.  If you prefer to wait for me to finish
> reviewing this one, that's okay, too.
> 

I will be in vacation for two weeks, my concern is that this issue will be lost to the noise.
Will respin with the actual fixes, and hope this can be put into qemu and then move from there.

Thanks,

Claudio

