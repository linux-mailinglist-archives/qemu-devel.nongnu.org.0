Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AFA5E7F8B
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 18:18:33 +0200 (CEST)
Received: from localhost ([::1]:53628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oblNn-0000u5-GH
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 12:18:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oblGe-0002J2-Mv
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 12:11:09 -0400
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d]:44390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oblGc-0003uW-Ic
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 12:11:08 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EEFB41F88D;
 Fri, 23 Sep 2022 16:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663949463; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dtv+ItMnRBZEdTKUU2Yaz7H4XPS0TB0rQ3VKdkBGQQA=;
 b=eJNC2VxNkFkH9mb5Q77lqA9Zt/5brDpuvyuhvIU9QP5XtyD+CdhcPQ3Dzmy9CzzXcvuC3A
 FfOQ0fU0lqAMH6VyGHwOpj4NVwwSplzSZoKFuRo4DSg7p21IJp0rDCTr9CEa+p3RiYTxfN
 uyBY0zYemRfsLBD0AYkicUma8E0ROUc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663949463;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dtv+ItMnRBZEdTKUU2Yaz7H4XPS0TB0rQ3VKdkBGQQA=;
 b=QjdG7762U4MjxID6YclvkedxnIufXu0pzakzbAYUAeEwaKK6d0D0E1HloGxy4VhxHZqwUW
 LsQ/mB+h9BISc4DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 89E3613A00;
 Fri, 23 Sep 2022 16:11:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id nP+ZH5faLWO4SwAAMHmgww
 (envelope-from <cfontana@suse.de>); Fri, 23 Sep 2022 16:11:03 +0000
Message-ID: <5da95c13-c2e3-c5a2-c194-dcfc9ee3d875@suse.de>
Date: Fri, 23 Sep 2022 18:11:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v5 3/4] module: add Error arguments to module_load and
 module_load_qom
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org, dinechin@redhat.com, Gerd Hoffmann
 <kraxel@redhat.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <20220923145131.21282-1-cfontana@suse.de>
 <20220923145131.21282-4-cfontana@suse.de> <Yy3V95eCse+PP2bA@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <Yy3V95eCse+PP2bA@redhat.com>
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

On 9/23/22 17:51, Daniel P. Berrangé wrote:
> On Fri, Sep 23, 2022 at 04:51:30PM +0200, Claudio Fontana wrote:
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
> 
> 
> 
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
> 
> The rv == 0 case could be treated the same as rv > 0

Not really, there is no need to do the loop again if rv == 0.
I mean it doesn't hurt, but Richard explicitly asked to remove redundant execution in these cases.

> meaning the diff merely needs to be
> 
>    audio_module_load(name, &local_err)
>    if (rv < 0) {
>      error_report_err(local_err);
>      return NULL;.
>    }
> 
>>      return NULL;
>>  }
>>  
>> diff --git a/block.c b/block.c
>> index 72c7f6d47d..0390ece056 100644
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
> 
> Again,  rv ==0 can be handled the same as rv > 0
> 
> 
>> @@ -976,12 +982,17 @@ BlockDriver *bdrv_find_protocol(const char *filename,
>>      for (i = 0; i < (int)ARRAY_SIZE(block_driver_modules); ++i) {
>>          if (block_driver_modules[i].protocol_name &&
>>              !strcmp(block_driver_modules[i].protocol_name, protocol)) {
>> -            block_module_load(block_driver_modules[i].library_name);
>> +            Error *local_err = NULL;
>> +            int rv = block_module_load(block_driver_modules[i].library_name, &local_err);
>> +            if (rv > 0) {
>> +                drv1 = bdrv_do_find_protocol(protocol);
>> +            } else if (rv < 0) {
>> +                error_report_err(local_err);
>> +            }
> 
> Likewise rv == 0 vs rv > 0

same here, this approach was there around v2, but I changed this, to avoid calling bdrv_do_find_protocol() again
if we did not load the module successfully, as we already know it will fail.
> 
> 
> 
>> diff --git a/block/dmg.c b/block/dmg.c
>> index 007b8d9996..e84a7a44a3 100644
>> --- a/block/dmg.c
>> +++ b/block/dmg.c
>> @@ -434,6 +434,8 @@ static int dmg_open(BlockDriverState *bs, QDict *options, int flags,
>>      uint64_t plist_xml_offset, plist_xml_length;
>>      int64_t offset;
>>      int ret;
>> +    int module_rv;
>> +    Error *local_err = NULL;
>>  
>>      ret = bdrv_apply_auto_read_only(bs, NULL, errp);
>>      if (ret < 0) {
>> @@ -446,8 +448,21 @@ static int dmg_open(BlockDriverState *bs, QDict *options, int flags,
>>          return -EINVAL;
>>      }
>>  
>> -    block_module_load("dmg-bz2");
>> -    block_module_load("dmg-lzfse");
>> +    module_rv = block_module_load("dmg-bz2", &local_err);
>> +    if (module_rv < 0) {
>> +        error_report_err(local_err);
>> +        return -EINVAL;
>> +    } else if (module_rv == 0) {
>> +        warn_report("dmg-bz2 module not present, bz2 decomp unavailable");
>> +    }
>> +    local_err = NULL;
>> +    module_rv = block_module_load("dmg-lzfse", &local_err);
>> +    if (module_rv < 0) {
>> +        error_report_err(local_err);
>> +        return -EINVAL;
>> +    } else if (module_rv == 0) {
>> +        warn_report("dmg-lzfse module not present, lzfse decomp unavailable");
>> +    }
> 
> THis is the wrong place for these warnings, it'll spam
> stdout, even if the file opened doesn't use bz2/lzfse.
> 
> The real problem is the later code which appears to
> silently ignore data blocks if the lzfse/bz2 modules
> are not loaded, instead of using error_report.

Yes, the right place for the warning is a bit unknown to me though in the block code
as I mentioned elsewhere in the thread, Kevin seems to understand what the right handling should be,
maybe he can do an after-patch I could attach or merge in the series..

> 
> 
>> diff --git a/qom/object.c b/qom/object.c
>> index 4f834f3bf6..35ced55282 100644
>> --- a/qom/object.c
>> +++ b/qom/object.c
>> @@ -526,8 +526,13 @@ void object_initialize(void *data, size_t size, const char *typename)
>>  
>>  #ifdef CONFIG_MODULES
>>      if (!type) {
>> -        module_load_qom(typename);
>> -        type = type_get_by_name(typename);
>> +        Error *local_err = NULL;
>> +        int rv = module_load_qom(typename, &local_err);
>> +        if (rv > 0) {
>> +            type = type_get_by_name(typename);
>> +        } else if (rv < 0) {
>> +            error_report_err(local_err);
>> +        }
> 
> Again no need to distinguish rv == 0 from rv > 0

same answer here. I don't feel strongly, just saying, I changed this as a result of the review process.

> 
>> @@ -1033,8 +1038,13 @@ ObjectClass *module_object_class_by_name(const char *typename)
>>      oc = object_class_by_name(typename);
>>  #ifdef CONFIG_MODULES
>>      if (!oc) {
>> -        module_load_qom(typename);
>> -        oc = object_class_by_name(typename);
>> +        Error *local_err = NULL;
>> +        int rv = module_load_qom(typename, &local_err);
>> +        if (rv > 0) {
>> +            oc = object_class_by_name(typename);
>> +        } else if (rv < 0) {
>> +            error_report_err(local_err);
>> +        }
> 
> Same comment

same

> 
>> diff --git a/softmmu/qtest.c b/softmmu/qtest.c
>> index fc5b733c63..36e28609ff 100644
>> --- a/softmmu/qtest.c
>> +++ b/softmmu/qtest.c
>> @@ -753,12 +753,18 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
>>          qtest_sendf(chr, "OK %"PRIi64"\n",
>>                      (int64_t)qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
>>      } else if (strcmp(words[0], "module_load") == 0) {
>> +        Error *local_err = NULL;
>> +        int rv;
>>          g_assert(words[1] && words[2]);
>>  
>>          qtest_send_prefix(chr);
>> -        if (module_load(words[1], words[2])) {
>> +        rv = module_load(words[1], words[2], &local_err);
>> +        if (rv > 0) {
>>              qtest_sendf(chr, "OK\n");
>>          } else {
>> +            if (rv < 0) {
>> +                error_report_err(local_err);
>> +            }
>>              qtest_sendf(chr, "FAIL\n");
>>          }
> 
> This change means the 'module_load' command is totally silent

If rv == 0, qtest will do

qtest_sendf(chr, "FAIL\n");

but will not report an error message.

Should we?


> if  'rv == 0', but the code appears to try to read a response
> line which will now never arrive AFAICT.
> 
> In the context of 'modules-test.c' I think it is fine to treat
> rv == 0 the same as rv > 0 and thus print 'OK'.
> 
> 
> 
> Perhaps I've overlooked something, but I'm not seeing a reason
> we need module_load() to return 4 different return values. It
> looks like every caller would work with a boolean success/fail
> 
> 
> With regards,
> Daniel


