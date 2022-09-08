Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 083455B170B
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 10:31:49 +0200 (CEST)
Received: from localhost ([::1]:54090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWCwt-00083n-NA
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 04:31:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oWCuB-0006Fe-TC
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 04:28:59 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:43542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oWCu9-000105-Te
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 04:28:59 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4497434475;
 Thu,  8 Sep 2022 08:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662625736; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iRTFDa4I8iyS56wTtng4MACpvydF7LzYoQKgw89lMIQ=;
 b=zIzAfKmKEHMb4HlWUAMVRO8dE8LArrdCWqJQTL+u3epXK3wo2nqg+9azbeR8HR8jdsoGV7
 axG/g/Oia4Gek7aH3Bfney4SZpUAYk/KnxETNCyNoc/f3C3tNsWbjBWdSQ5XefFHxnZ8oK
 LXOqJJq+p5xHFIBC9FMYo+lEIENZYG0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662625736;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iRTFDa4I8iyS56wTtng4MACpvydF7LzYoQKgw89lMIQ=;
 b=sPh0VD/Z1lQomN0/ieK1BXWgmIeVZb8bVWYleXj8NpMNlDISqvAtYxSPRg3GAGE5wWX+i6
 Jvbe0aps4Y+ZgZCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 069151322C;
 Thu,  8 Sep 2022 08:28:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id pQFKO8enGWPDLAAAMHmgww
 (envelope-from <cfontana@suse.de>); Thu, 08 Sep 2022 08:28:55 +0000
Message-ID: <a2b8fbac-cefb-3342-3680-25274887be66@suse.de>
Date: Thu, 8 Sep 2022 10:28:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 2/3] module: add Error arguments to module_load_one and
 module_load_qom_one
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, dinechin@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20220906115501.28581-1-cfontana@suse.de>
 <20220906115501.28581-3-cfontana@suse.de>
 <1d5db132-08e3-0767-c672-df99a7aa9f3e@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <1d5db132-08e3-0767-c672-df99a7aa9f3e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -85
X-Spam_score: -8.6
X-Spam_bar: --------
X-Spam_report: (-8.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.199,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi Richard, thanks for looking at this,

On 9/8/22 10:11, Richard Henderson wrote:
> On 9/6/22 12:55, Claudio Fontana wrote:
>> improve error handling during module load, by changing:
>>
>> bool module_load_one(const char *prefix, const char *lib_name);
>> void module_load_qom_one(const char *type);
>>
>> to:
>>
>> bool module_load_one(const char *prefix, const char *name, Error **errp);
>> bool module_load_qom_one(const char *type, Error **errp);
>>
>> module_load_qom_one has been introduced in:
>>
>> commit 28457744c345 ("module: qom module support"), which built on top of
>> module_load_one, but discarded the bool return value. Restore it.
>>
>> Adapt all callers to emit errors, or ignore them, or fail hard,
>> as appropriate in each context.
>>
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> ---
>>   audio/audio.c         |   6 +-
>>   block.c               |  12 +++-
>>   block/dmg.c           |  10 ++-
>>   hw/core/qdev.c        |  10 ++-
>>   include/qemu/module.h |  10 +--
>>   qom/object.c          |  15 +++-
>>   softmmu/qtest.c       |   6 +-
>>   ui/console.c          |  19 +++++-
>>   util/module.c         | 155 ++++++++++++++++++++++++++++++------------
>>   9 files changed, 182 insertions(+), 61 deletions(-)
>>
>> diff --git a/audio/audio.c b/audio/audio.c
>> index 76b8735b44..4f4bb10cce 100644
>> --- a/audio/audio.c
>> +++ b/audio/audio.c
>> @@ -72,6 +72,7 @@ void audio_driver_register(audio_driver *drv)
>>   audio_driver *audio_driver_lookup(const char *name)
>>   {
>>       struct audio_driver *d;
>> +    Error *local_err = NULL;
>>   
>>       QLIST_FOREACH(d, &audio_drivers, next) {
>>           if (strcmp(name, d->name) == 0) {
>> @@ -79,7 +80,10 @@ audio_driver *audio_driver_lookup(const char *name)
>>           }
>>       }
>>   
>> -    audio_module_load_one(name);
>> +    if (!audio_module_load_one(name, &local_err) && local_err) {
>> +        error_report_err(local_err);
>> +    }
> 
> Why would local_err not be set on failure?  Is this the NOTDIR thing?  I guess this is 

Right, we need to distinguish the case where the module does not exist from the case where
the module exists but an error has occured while trying to load it.

In the distros we build one time with all the modules enabled, but then may deliver those modules
or not deliver them in a specific distro, or the user may or may not have installed the packages
containing those DSOs.

So failing to find a module may be just fine, while we want to report errors if a load goes wrong.
We just encountered a bug where the actual cause was hidden by the fact that no error was produced on module load.


> sufficient to distinguish the two cases...  The urge to bikeshed the return value is 
> strong.  :-)

If you find a better way let me know, this is just the first thing that came to mind to distinguish the cases, ie:

return value true -> loaded successfully

return value false -> not loaded:
                      local_err set   -> error during load
                      local_err unset -> no error, just not present

> 
>> +bool module_load_one(const char *prefix, const char *name, Error **errp);
>> +bool module_load_qom_one(const char *type, Error **errp);
> 
> Doc comments go in the header file.
> 
>> +/*
>> + * module_load_file: attempt to load a dso file
>> + *
>> + * fname:          full pathname of the file to load
>> + * export_symbols: if true, add the symbols to the global name space
>> + * errp:           error to set.
>> + *
>> + * Return value:   0 on success (found and loaded), < 0 on failure.
>> + *                 A return value of -ENOENT or -ENOTDIR means 'not found'.
>> + *                 -EINVAL is used as the generic error condition.
>> + *
>> + * Error:          If fname is found, but could not be loaded, errp is set
>> + *                 with the error encountered during load.
>> + */
>> +static int module_load_file(const char *fname, bool export_symbols,
>> +                            Error **errp)
>>   {
>>       GModule *g_module;
>>       void (*sym)(void);
>> @@ -152,16 +168,19 @@ static int module_load_file(const char *fname, bool export_symbols)
>>       int len = strlen(fname);
>>       int suf_len = strlen(dsosuf);
>>       ModuleEntry *e, *next;
>> -    int ret, flags;
>> +    int flags;
>>   
>>       if (len <= suf_len || strcmp(&fname[len - suf_len], dsosuf)) {
>> -        /* wrong suffix */
>> -        ret = -EINVAL;
>> -        goto out;
>> +        error_setg(errp, "wrong filename, missing suffix %s", dsosuf);
>> +        return -EINVAL;
>>       }
>> -    if (access(fname, F_OK)) {
>> -        ret = -ENOENT;
>> -        goto out;
>> +    if (access(fname, F_OK) != 0) {
>> +        int ret = errno;
>> +        if (ret != ENOENT && ret != ENOTDIR) {
>> +            error_setg_errno(errp, ret, "error trying to access %s", fname);
>> +        }
>> +        /* most likely is EACCES here */
>> +        return -ret;
>>       }
> 
> I looked at this a couple of days ago and came to the conclusion that the split between 
> this function and its caller is wrong.
> 
> The directory path probe loop is currently split between the two functions.  I think the 
> probe loop should be in the caller (i.e. the access call here moved out).  I think 
> module_load_file should only be called once the file is known to exist.  Which then 
> simplifies the set of errors to be returned from here.
> 
> (I might even go so far as to say module_load_file should be moved into module_load_one, 
> because there's not really much here, and it would reduce ifdefs.)

I'll attempt to integrate your suggestions.

> 
> 
> r~

Thanks!

Claudio

