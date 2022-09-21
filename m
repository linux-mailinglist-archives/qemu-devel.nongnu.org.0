Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5905C0407
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 18:24:59 +0200 (CEST)
Received: from localhost ([::1]:35646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob2Ww-0007fK-Ht
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 12:24:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1ob2Bs-0007fS-Cf
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 12:03:12 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:38092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1ob2Bn-0007zq-DX
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 12:03:12 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DFCEA210DF;
 Wed, 21 Sep 2022 16:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663776185; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YGaYURcoX5IG3bL4GKjKiothX/vYMQXkXba1nzC11RY=;
 b=LcnLqLAezPz+UWMndNPqMFt+OgyVgE1J1bd86gh6FoACOc/4vwFAnPDX7MOi5tPCiILsGX
 YerPgaaY3TeWHI3LvquOmrask54LVx/XYekmwehsXYnpfJEkNz0UQb9Zyj5CV2ku/itC3F
 FglE1Blwy1OxbDCLsMva4sAhRZ2Ohl8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663776185;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YGaYURcoX5IG3bL4GKjKiothX/vYMQXkXba1nzC11RY=;
 b=AZMkAlpPbQ5rx4QmULKRgSKGVb64cWoxx5zPjNz9Fmnoeun4iebmw7DIh2Ko8yWmh9Zqqx
 cxWLTbGN8b05jeDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 969C913A00;
 Wed, 21 Sep 2022 16:03:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 9kxqI7k1K2O2fgAAMHmgww
 (envelope-from <cfontana@suse.de>); Wed, 21 Sep 2022 16:03:05 +0000
Message-ID: <cc2c5e14-f0a0-4415-9fe1-d7811ee27850@suse.de>
Date: Wed, 21 Sep 2022 18:03:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v4 2/3] module: add Error arguments to module_load_one and
 module_load_qom_one
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, dinechin@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2eBerrang=c3=a9?= <berrange@redhat.com>
References: <20220908183012.17667-1-cfontana@suse.de>
 <20220908183012.17667-3-cfontana@suse.de> <877d23ekj0.fsf@pond.sub.org>
 <76775f64-e49a-1c3c-0d73-10d93eff34e4@amsat.org>
 <87y1ucdirx.fsf@pond.sub.org>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <87y1ucdirx.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -80
X-Spam_score: -8.1
X-Spam_bar: --------
X-Spam_report: (-8.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.702,
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

On 9/21/22 14:16, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
> 
>> On 16/9/22 11:27, Markus Armbruster wrote:
>>> Claudio Fontana <cfontana@suse.de> writes:
>>>
>>>> improve error handling during module load, by changing:
>>>>
>>>> bool module_load_one(const char *prefix, const char *lib_name);
>>>> void module_load_qom_one(const char *type);
>>>>
>>>> to:
>>>>
>>>> bool module_load_one(const char *prefix, const char *name, Error **errp);
>>>> bool module_load_qom_one(const char *type, Error **errp);
>>>>
>>>> module_load_qom_one has been introduced in:
>>>>
>>>> commit 28457744c345 ("module: qom module support"), which built on top of
>>>> module_load_one, but discarded the bool return value. Restore it.
>>>>
>>>> Adapt all callers to emit errors, or ignore them, or fail hard,
>>>> as appropriate in each context.
>>>
>>> How exactly does behavior change?  The commit message is mum on the
>>> behavior before the patch, and vague on the behavior afterwards.
>>>
>>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>>>> ---
>>>>   audio/audio.c         |   9 ++-
>>>>   block.c               |  15 ++++-
>>>>   block/dmg.c           |  18 +++++-
>>>>   hw/core/qdev.c        |  10 ++-
>>>>   include/qemu/module.h |  38 ++++++++++--
>>>>   qom/object.c          |  18 +++++-
>>>>   softmmu/qtest.c       |   6 +-
>>>>   ui/console.c          |  18 +++++-
>>>>   util/module.c         | 140 ++++++++++++++++++++++++------------------
>>>>   9 files changed, 194 insertions(+), 78 deletions(-)
>>
>>>> diff --git a/include/qemu/module.h b/include/qemu/module.h
>>>> index 8c012bbe03..78d4c4de96 100644
>>>> --- a/include/qemu/module.h
>>>> +++ b/include/qemu/module.h
>>>> @@ -61,16 +61,44 @@ typedef enum {
>>
>>>>   
>>>>   void module_call_init(module_init_type type);
>>>> -bool module_load_one(const char *prefix, const char *lib_name);
>>>> -void module_load_qom_one(const char *type);
>>>> +
>>>> +/*
>>>> + * module_load_one: attempt to load a module from a set of directories
>>>> + *
>>>> + * directories searched are:
>>>> + * - getenv("QEMU_MODULE_DIR")
>>>> + * - get_relocated_path(CONFIG_QEMU_MODDIR);
>>>> + * - /var/run/qemu/${version_dir}
>>>> + *
>>>> + * prefix:         a subsystem prefix, or the empty string ("audio-", ..., "")
>>>> + * name:           name of the module
>>>> + * errp:           error to set in case the module is found, but load failed.
>>>> + *
>>>> + * Return value:   true on success (found and loaded);
>>>> + *                 if module if found, but load failed, errp will be set.
>>>> + *                 if module is not found, errp will not be set.
>>>
>>> I understand you need to distingush two failure modes "found, but load
>>> failed" and "not found".
>>>
>>> Functions that set an error on some failures only tend to be awkward: in
>>> addition to checking the return value for failure, you have to check
>>> @errp for special failures.  This is particularly cumbersome when it
>>> requires a @local_err and an error_propagate() just for that.  I
>>> generally prefer to return an error code and always set an error.
>>
>> I notice the same issue, therefore would suggest this alternative
>> prototype:
>>
>>    bool module_load_one(const char *prefix, const char *name, 
>>              bool ignore_if_missing, Error **errp);
>> which always sets *errp when returning false:
>>
>>   * Return value:   if ignore_if_missing is true:
>>   *                   true on success (found or missing), false on
>>   *                   load failure.
>>   *                 if ignore_if_missing is false:
>>   *                   true on success (found and loaded); false if
>>   *                   not found or load failed.
>>   *                 errp will be set if the returned value is false.
>>   */
> 
> I think this interface is less surprising.
> 
> If having to pass a flag turns out to to be a legibility issue, we can
> have wrapper functions.
> 

To me it seems even more confusing tbh. Do we have more ideas? Richard?

bool module_load_one(const char *prefix, const char *name, Error **errp);

In my mind we should really say,

RETURN VALUE: a bool with the meaning: "was a module loaded? true/false"

ERROR: The Error parameter tells us: "was there an error loading the module?"

Makes sense to me, but maybe someone has a better one.

Btw, as an aside, for the general Error API pattern, if the bool return value and Error != NULL should be always related 1:1,
It would have been better to design it with only one of those informing about the error (Error, as it carries the additional Error information, besides the information that Error != NULL),
and remove the extra degree of freedom for a return value that at this point (in the current code) carries ZERO additional useful information.

We could have designed the API to use the return value as... an actual return value for solving the domain problem at hand,
and use only the Error parameter for the error path.

Ie the API standard pattern could have been, instead of bool function(Error **),

return_value_type_t function_that_can_fail(function_arguments, ..., Error **errp);

and then leave both return_value_type_t and the function_arguments for the normal function operation.

rv = function_that_can_fail(errp);
if (errp != NULL) {
    /* handle the error */
}
if (rv > 7) {
    /* handle the return value */
}

Would it not be better to handle the Error path and the normal return value separately?

With this pattern in mind, this specific case would then not be surprising to anyone,
and we would not have to start cooking up booleans to start passing to each function to say how errors should be treated,
as nobody would expect the bool returned to mean anything related with the Error path.

But this again would be rethinking the whole Error API.

We should in any case do the right thing in this specific case, and this specific case (handling module load errors vs modules not installed),
is not served well by the current code, whether it went through this attentive abstract principles scrutiny or not (seems not to me).

Thanks,

Claudio

