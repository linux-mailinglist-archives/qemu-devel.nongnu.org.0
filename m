Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB115BC507
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 11:11:02 +0200 (CEST)
Received: from localhost ([::1]:55018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaCns-0006Ia-Na
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 05:11:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oaCOx-00049D-H7
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 04:45:16 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:44352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oaCOu-00055T-4k
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 04:45:14 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E565C1FA24;
 Mon, 19 Sep 2022 08:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663577107; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kbekQtxZViBiZk0jOnwBOPTbCVt3R5J/RB8J6EtzgiI=;
 b=WMIAma21Cep3YMdJZj00jOAB2eSzxCFMrcQCXnb4d27jOIFrPQ64GtR8yFNwOu8R7W0kEJ
 9mI9D88RdYIIyMpoG4xJKZxnfzSNydN1OZbGdit9K2v1j5zfK+8i/mH3Fh28ohs/vcDadX
 HA5AO+YjjTvGBiCxsez5Nbgv/A8qi2g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663577107;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kbekQtxZViBiZk0jOnwBOPTbCVt3R5J/RB8J6EtzgiI=;
 b=kbLJfzAGXrDNCMOB2P30mGnd1EZlnBhcfYioF1CuW1/853GyiKiD9H9RC85uJwAocE9okf
 HAdKE5ZmRpAGBaAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7FCBE13A96;
 Mon, 19 Sep 2022 08:45:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id P7FAHRMsKGPjQQAAMHmgww
 (envelope-from <cfontana@suse.de>); Mon, 19 Sep 2022 08:45:07 +0000
Message-ID: <63cfdc69-a326-51ea-78d1-ec1975be0298@suse.de>
Date: Mon, 19 Sep 2022 10:45:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v4 2/3] module: add Error arguments to module_load_one and
 module_load_qom_one
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, dinechin@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2eBerrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220908183012.17667-1-cfontana@suse.de>
 <20220908183012.17667-3-cfontana@suse.de> <877d23ekj0.fsf@pond.sub.org>
 <bc88027a-41bb-aef4-fd64-fcc367bf179d@suse.de> <87illnbdk5.fsf@pond.sub.org>
 <f4ff63d4-ff53-7e40-44fe-083aec1a98e3@suse.de> <87r10793sj.fsf@pond.sub.org>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <87r10793sj.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -80
X-Spam_score: -8.1
X-Spam_bar: --------
X-Spam_report: (-8.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.657,
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

On 9/19/22 10:17, Markus Armbruster wrote:
> Claudio Fontana <cfontana@suse.de> writes:
> 
>> On 9/16/22 16:26, Markus Armbruster wrote:
>>> Claudio Fontana <cfontana@suse.de> writes:
>>>
>>>> On 9/16/22 11:27, Markus Armbruster wrote:
>>>>> Claudio Fontana <cfontana@suse.de> writes:
> 
> [...]
> 
>>>>>> diff --git a/block.c b/block.c
>>>>>> index bc85f46eed..8b610c6d95 100644
>>>>>> --- a/block.c
>>>>>> +++ b/block.c
>>>>>> @@ -464,7 +464,14 @@ BlockDriver *bdrv_find_format(const char *format_name)
>>>>>>      /* The driver isn't registered, maybe we need to load a module */
>>>>>>      for (i = 0; i < (int)ARRAY_SIZE(block_driver_modules); ++i) {
>>>>>>          if (!strcmp(block_driver_modules[i].format_name, format_name)) {
>>>>>> -            block_module_load_one(block_driver_modules[i].library_name);
>>>>>> +            Error *local_err = NULL;
>>>>>> +            if (!block_module_load_one(block_driver_modules[i].library_name,
>>>>>> +                                       &local_err)) {
>>>>>> +                if (local_err) {
>>>>>> +                    error_report_err(local_err);
>>>>>> +                }
>>>>>> +                return NULL;
>>>>>> +            }
>>>>>>              break;
>>>>>>          }
>>>>>>      }
>>>>>
>>>>> Before the patch, bdrv_find_format() fails silently[*].
>>>>>
>>>>> Afterwards, it reports an error on some failures, but not on others.
>>>>> Sure this is what we want?
>>>>
>>>> Yes, I am sure. It only reports an error if an error exists.
>>>> When a module is not present, no error should be printed in this context.
>>>
>>> Callers commonly look like this (this one is in bdrv_fill_options()):
>>>
>>>         drv = bdrv_find_format(drvname);
>>>         if (!drv) {
>>>             error_setg(errp, "Unknown driver '%s'", drvname);
>>>             return -ENOENT;
>>>         }
>>>
>>> where @errp is a parameter.
>>>
>>> The patch changes bdrv_find_format() to report some failures with
>>> error_report_err().  This is effectively the same anti-pattern I pointed
>>> out below, starting with "Uh-oh": use of error_report() or equivalent
>>> within a function with an Error ** parameter.
>>>
>>> If the "Unknown driver" Error object is ultimately passed to
>>> error_report_err(), we report two errors if module loading fails, else
>>> one.
>>>
>>> Emitting two error messages for the same problem, a useful one and a
>>> useless one, is bad UI, but it's arguably still better than just a
>>> useless one.
>>
>> I'll see if it makes sense to merge them.
>> I wanted to avoid removing the existing Unknown driver / or Unknown Protocol errors
>> which people might be relying on.
> 
> Error messages are not a stable interface, because if we made it one,
> we'd be stuck with sub-optimal error messages forever.
> 
> Sometimes, people rely on them anyway, and if we're aware of it, we may
> choose to provide a grace period before we make their latently broken
> code manifestly broken.
> 
>>> But what if a caller wants to handle errors without reporting them?
>>> This is a legitimate use of the Error API.  No go, we spam stderr
>>> regardless.
>>
>> I suppose the Error API can be directed to something else than stderr?
> 
> Absolutely.
> 
> Callers can handle the error as they see fit.  This is a core design
> feature, see "Separation of concerns" below.
> 
> For instance,
> 
> (1) When executing an HMP command, and the error makes the command fail,
> the monitor core handles the error by reporting it to the command's
> monitor.
> 
> (2) When executing a QMP command, and the error makes the command fail,
> the monitor core handles the error by sending it to the QMP client.
> 
> (3) When the error is recoverable, say by trying something else instead,
> we don't report the error at all (except perhaps via some tracepoint).
> 
> If you use error_report() or equivalent within such code, then:
> 
> (1) Works as intended, both messages go the command's monitor.
> 
> (2) The caller wants errors to go to the QMP client, but the
> error_report() goes to stderr instead.
> 
> (3) The caller wants to silence errors, but the error_report() spams
> stderr anyway.
> 
>>> What if a caller wants to report the error in some other way, say write
>>> it to a log file?  No go, we still spam stderr.
>>>
>>> The patch breaks on of the Error API's design maxims.  error.h's big
>>> comment:
>>>
>>>  * - Separation of concerns: the function is responsible for detecting
>>>  *   errors and failing cleanly; handling the error is its caller's
>>>  *   job.  [...]
>>>
>>> The patch changes bdrv_find_options() to no longer satisfy this rule: it
>>> doesn't leave handling entirely to the caller anymore.
>>>
>>> You might argue that no existing caller does such things.
> 
> Actually, I'm pretty sure this is used by QMP commands.
> 
>>>                                                            Fine.  Then
>>> I'll ask you to document that bdrv_fill_options() may only be used in
>>> certain ways, unlike other functions using the Error API.  Same for all
>>> the other affected functions.  And then Kevin will probably NAK the
>>> whole thing :)
>>>
>>>>>> @@ -976,7 +983,11 @@ BlockDriver *bdrv_find_protocol(const char *filename,
>>>>>>      for (i = 0; i < (int)ARRAY_SIZE(block_driver_modules); ++i) {
>>>>>>          if (block_driver_modules[i].protocol_name &&
>>>>>>              !strcmp(block_driver_modules[i].protocol_name, protocol)) {
>>>>>> -            block_module_load_one(block_driver_modules[i].library_name);
>>>>>> +            Error *local_err = NULL;
>>>>>> +            if (!block_module_load_one(block_driver_modules[i].library_name,
>>>>>> +                                       &local_err) && local_err) {
>>>>>
>>>>> Break the line before && local_err, please, like you do elsewhere.
>>>>
>>>> This is to avoid hitting the 80 chars on one line, as warned by checkpatch. Should I disregard checkpatch, is it not used anymore?
>>>
>>> Elsewhere, you format like this:
>>>
>>>                  if (!block_module_load_one(block_driver_modules[i].library_name,
>>>                                             &local_err)
>>>                      && local_err) {
>>>
>>> Better, isn't it?
>>
>> I would not say so, I have no preference, but I can change it.
>>
>>>
>>>>
>>>>>
>>>>>> +                error_report_err(local_err);
>>>>>> +            }
>>>>>>              break;
>>>>>>          }
>>>>>>      }
>>>>>
>>>>> Uh-oh: error_report() or equivalent in a function with an Error **
>>>>> parameter.  This is almost always wrong.  Shouldn't you pass the error
>>>>> to the caller?
>>>>
>>>> I guess this is the "almost" case. No I should not pass anything back.
>>>>
>>>> The Error **errp parameter of bdrv_find_protocol, and the Error local_err parameter inside it are different errors.
>>>>
>>>> The first is about whether a protocol has been found or not.
>>>> The second is about whether there was an error during the load of a module.
>>>>
>>>> No, local_err should not be passed back to the caller in my view. The error passed back to the caller is errp and is already set correctly.
>>>
>>> Part of bdrv_find_protocol()'s (unstated) contract is "either succeed
>>> and return non-null, or fail, return null, and set an error."
>>>
>>> This is pretty much ubiquitous among Error-using functions.  error.h's
>>> big comment:
>>>
>>>  * - On success, the function should not touch *errp.  On failure, it
>>>  *   should set a new error, e.g. with error_setg(errp, ...), or
>>>  *   propagate an existing one, e.g. with error_propagate(errp, ...).
>>>
>>> Note there is no third case "except on some failures, don't set an
>>> error".
>>>
>>> Of course, bdrv_find_protocol() might be an exception, i.e. I still owe
>>> you proof of my claim about its contract.  So let's examine callers:
>>>
>>> * print_block_option_help() in qemu-img.c:
>>>
>>>             proto_drv = bdrv_find_protocol(filename, true, &local_err);
>>>             if (!proto_drv) {
>>>                 error_report_err(local_err);
>>>                 qemu_opts_free(create_opts);
>>>                 return 1;
>>>             }
>>>
>>>   If bdrv_find_protocol() returns null without setting @local_err,
>>>   error_report_err() will crash.
>>
>> I don't see how this patch changes anything here, or why it relates to this code at all.
>>
>> No, this patch does not change bdrv_find_protocol() unwritten claim about the Error parameter.
>>
>> I think you should re-read the code honestly.
> 
> First, you're right, I got confused, and my analysis is wrong.  I missed
> the && local_err after !block_module_load_one().  I believe I spotted it
> only later, and then asked for it to be put on its own line, but missed
> its significance for what I had already written.
> 
> Second, your reply was of the sort that can depress your review
> priority.  Permanently when it becomes a pattern.  Hear me out.
> 
> It is obvious that you put significant time into this patch.  It is also
> obvious that you made it with care.  Mistakes remain a possibility;
> writing good patches is hard.  That's why we review.
> 
> Reviewing patches, even good ones is hard.  Review should be a
> conversation between the patch submitter and the reviewers, where the
> participants try to help each other along.
> 
> I put significant time into a careful review of this patch.  I misread
> it in at least one spot, and saw a problem that isn't.  I needed you to
> tell me that I'm wrong and help me understand.
> 
> Simply telling me to re-read the code is not helpful, and borders on
> disrespect (not intended I presume).  What would have been helpful is
> shooting a hole in my analysis, say by demonstrating that
> bdrv_find_protocol() cannot fail without setting an error.
> 
> [...]
> 
>>> I think the root of the problems with this patch is that you convert the
>>> FOO_module_load_one() functions to the Error API without propagating the
>>> error far enough.  It really needs to go all the way up.
>>>
>>
>> I respecfully disagree. Sometimes I think we need to be practical; there is for sure further improvement possible,
>> a redesign of the Error API to be more consistent with return values,
>> rethinking about use of qdev_new vs try_qdev_new() etc,
>>
>> but in my view the series is complete and self-consistent
>> (and btw fixes an actual bug in your CentOS docker / kubevirt).
>>
>> I'll review all the changes and see if merging some errors make sense in some cases, but generally I would recommend against it.
>>
>> Further improvements can and should be done but in my view should not be part of this series,
>> I cannot honestly take at the moment that kind of work item.
> 
> Some issues predate your patch.  They way loadable modules work is
> clearly not good.
> 
> A patch that improves error reporting in some cases without making
> things worse elsewhere could be acceptable even if it doesn't address
> the existing problems comprehensively.  As you wrote, we need to be
> practical.
> 
> That said, error_report() & friends from within a QMP command is a
> fairly big no-no.  Such issues might push this patch into "makes things
> worse elsewhere" territory.  Reserving judgement.
> 

Hi Markus, sorry for the harsh response last week, it comes from a position of lack of time,
and the expectation that Richard's review would be enough.

I don't have (and I suspect no one that is not 100% working on qemu "upstream" and cannot hang around IRC channels or such)
good visibility of what happens to patches after they are reviewed like in this case,
so this makes the process in my view overall quite unpredictable and seems to require a lot of time investment for even the smallest change.

That is why I would generally prefer smaller chunks of work to be committed incrementally, each series self-contained,
rather than hundred-patch series that I expect to lose momentum or get lost.

There are things we can fine tune here, but I see some of the changes you propose as going beyond what a fix for the acute problem really requires,
so if this series requires a lot of work in your view for even the minimal fix to be done, I think we will need someone else to step in and expand on the work,

or we will have to keep the fix as downstream-only for now, and I'll try to find more time to invest early next year.

Thanks,

Claudio


