Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6EA5E6749
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 17:38:00 +0200 (CEST)
Received: from localhost ([::1]:52706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obOH0-00023c-1R
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 11:37:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1obNoh-0001vS-RH
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 11:08:44 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:54866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1obNof-0005Cq-IJ
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 11:08:43 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 358CE1F94B;
 Thu, 22 Sep 2022 15:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663859319; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gNakpuRZkH58ssOJO3aRzMGq0EGWyrwwrf/f8IlbZ3c=;
 b=qWNcE38QDsr23TQsxngjqc17/wNvDUd/ny+RuEt12sqpHhQXkJw89Hm7gqKmOxsjc/2+NM
 hspoqyTHWecBmGd58mIoCYg1haaMOXFD7RwMJLauR3Anlf2WvW7f7FHnVWQFinKBnGOrIK
 9Iw3ClBBHYWmWNzKMtb1wx9E9EfRx3w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663859319;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gNakpuRZkH58ssOJO3aRzMGq0EGWyrwwrf/f8IlbZ3c=;
 b=BlPULkRK4vAS8DPFqhxZzKKND6vvSONw2Haxxk5vTh0e5BZuTNJmGFufz8Lp0MPyelBP86
 sbC9kufdusEOXXCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E06951346B;
 Thu, 22 Sep 2022 15:08:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 3Y0cNXZ6LGNMKAAAMHmgww
 (envelope-from <cfontana@suse.de>); Thu, 22 Sep 2022 15:08:38 +0000
Message-ID: <e065de14-3b73-b7b6-0294-5f12196345f3@suse.de>
Date: Thu, 22 Sep 2022 17:08:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v4 2/3] module: add Error arguments to module_load_one and
 module_load_qom_one
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 dinechin@redhat.com, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20220908183012.17667-3-cfontana@suse.de>
 <877d23ekj0.fsf@pond.sub.org>
 <76775f64-e49a-1c3c-0d73-10d93eff34e4@amsat.org>
 <87y1ucdirx.fsf@pond.sub.org> <cc2c5e14-f0a0-4415-9fe1-d7811ee27850@suse.de>
 <878rmc54cw.fsf@pond.sub.org> <Yywcs7CpKDxahOSM@redhat.com>
 <87leqb4ul9.fsf@pond.sub.org> <5f5921fe-6d4f-490b-4328-702a45973bbc@suse.de>
 <87bkr7mvgr.fsf@pond.sub.org> <Yyx3Pc89tbqBliM0@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <Yyx3Pc89tbqBliM0@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -62
X-Spam_score: -6.3
X-Spam_bar: ------
X-Spam_report: (-6.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.893,
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

On 9/22/22 16:54, Kevin Wolf wrote:
> Am 22.09.2022 um 14:42 hat Markus Armbruster geschrieben:
>> Claudio Fontana <cfontana@suse.de> writes:
>>
>>> On 9/22/22 11:38, Markus Armbruster wrote:
>>>> Daniel P. Berrangé <berrange@redhat.com> writes:
>>>>
>>>>> On Thu, Sep 22, 2022 at 08:07:43AM +0200, Markus Armbruster wrote:
>>>>>> Ease of use matters, too.  When sticking to the rule leads to awkward
>>>>>> code, we should stop and think.  Should we deviate from the rule?  Or
>>>>>> can we avoid that by tweaking the interface?
>>>>>>
>>>>>> Philippe's proposed interface sticks to the rule.
>>>>>
>>>>> The cost is that when you see a  function   dosomething(true|false) as
>>>>> a reader you often have no idea what the effect of true vs false is
>>>>> on the behaviour of that function. You resort to looking at the
>>>>> API docs and/or code.  This is where C would really benefit from
>>>>> having named parameters like as  dosomething(ignore_errors=true|false)
>>>>> is totally obvious. Anyway, I digress.
>>>>
>>>> Right.  Quoting myself: "If having to pass a flag turns out to to be a
>>>> legibility issue, we can have wrapper functions."  :)
>>>
>>> There is something more fundamental that seems to be missed by most in this conversation,
>>> ie the distinction between the normal execution path and the error path.
>>>
>>>
>>>>
>>>>>> Another interface that does: return -1 for error, 0 for module not found
>>>>>> (no error), and 1 for loaded.
>>>>>
>>>>> IMHO this pattern is generally easier to understand when looking at
>>>>> the callers, as the fatal error scenario is always clear.
>>>>>
>>>>> That said I would suggest neither approach as the public facing
>>>>> API. Rather stop trying to overload 3 states onto an error reporting
>>>>> pattern that inherantly wants to be 2 states. Instead just have
>>>>> distinct methods
>>>>
>>>> Like these:
>>>>
>>>>>   bool module_load_one(const char *prefix, const char *name, Error *errp)
>>>>>   bool module_try_load_one(const char *prefix, const char *name, Error *errp)
>>>>>
>>>>> other names are available for the second, eg module_load_one_optional()
>>>>
>>>> module_load_one_if_there()?
>>>
>>> And what do you do with the caller that needs to _know_ whether the module was "there" or not?
>>>
>>> This is losing this information along the way, and the callers NEED it.
>>>
>>> I really invite, with no offense intended,
>>
>> None taken!
>>
>>>                                            to read the hunks of my patch and the callers,
>>> there are occasions where we need to _know_ if the module was there or not, and act depending on the context.
>>>
>>> The information about "bool is_there" needs to be passed to the caller.
>>
>> If you have callers that need to distinguish between not found, found
>> but bad, found and good, then return three distinct values.
>>
>> I proposed to return -1 for found but bad (error), 0 for not found (no
>> error), and 1 for loaded (no error).
> 
> My intuition with this one was that "not found" is still an error case,

You may consider it an "error" but it isn't in the "Exception" sense as we were discussing before.

The Error API seems to be mapping to the "Exception" concept, and in that sense module not found is not an Exception at all.

Your intuition comes I think from a historical look at the QEMU codebase,
but nowadays as QEMU gets more and more modularized, and packaged differently depending
on distributions, products, and user choices,

the "not found" is genuinely not in general an error case at all.

> but it's an error case that we need to distinguish from other error
> cases.
> 
> Is this one of the rare use cases for error classes?
> 
> Kevin
> 


