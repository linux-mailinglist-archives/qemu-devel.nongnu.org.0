Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9008B5E6371
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 15:18:43 +0200 (CEST)
Received: from localhost ([::1]:54028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obM6E-0000QL-04
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 09:18:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1obLaQ-0003ZA-B0
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 08:45:55 -0400
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d]:42842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1obLaI-0000pQ-VD
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 08:45:46 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 906041F8F7;
 Thu, 22 Sep 2022 12:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663850741; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KDThP5Re//40pAyXN+jutQ3eRR12YdoQInb7FbgTzZA=;
 b=d31PyTHp2vWGMijWrKfzRJk44nFF3xmHrIWObtygIftqE2piRWaXXec+nQjuqaixNDwY0m
 J7ga1S5pVgVJM6EIfztY0d2oPH/D9QFV92VAZHt+EYKxGFJSVCYKpqeQfBAoMdl7pODDiR
 y+YXEDYFf2SpGrYfPA5UBzokB3CdaQo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663850741;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KDThP5Re//40pAyXN+jutQ3eRR12YdoQInb7FbgTzZA=;
 b=gRLnf3S4c/M5CHX+FseSTure9FIFoQjuxpX9x45cLDFdvJO60mrfHp+tG0B3Mt1Luk0mj9
 NRevMWVoY5ydZMDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3A5D01346B;
 Thu, 22 Sep 2022 12:45:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id RAfLDPVYLGOOYQAAMHmgww
 (envelope-from <cfontana@suse.de>); Thu, 22 Sep 2022 12:45:41 +0000
Message-ID: <4a656f0f-1497-5569-e562-f537b115daf3@suse.de>
Date: Thu, 22 Sep 2022 14:45:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v4 2/3] module: add Error arguments to module_load_one and
 module_load_qom_one
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, dinechin@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20220908183012.17667-1-cfontana@suse.de>
 <20220908183012.17667-3-cfontana@suse.de> <877d23ekj0.fsf@pond.sub.org>
 <76775f64-e49a-1c3c-0d73-10d93eff34e4@amsat.org>
 <87y1ucdirx.fsf@pond.sub.org> <cc2c5e14-f0a0-4415-9fe1-d7811ee27850@suse.de>
 <878rmc54cw.fsf@pond.sub.org> <Yywcs7CpKDxahOSM@redhat.com>
 <87leqb4ul9.fsf@pond.sub.org> <5f5921fe-6d4f-490b-4328-702a45973bbc@suse.de>
 <87bkr7mvgr.fsf@pond.sub.org>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <87bkr7mvgr.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d;
 envelope-from=cfontana@suse.de; helo=smtp-out2.suse.de
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.893,
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

On 9/22/22 14:42, Markus Armbruster wrote:
> Claudio Fontana <cfontana@suse.de> writes:
> 
>> On 9/22/22 11:38, Markus Armbruster wrote:
>>> Daniel P. Berrangé <berrange@redhat.com> writes:
>>>
>>>> On Thu, Sep 22, 2022 at 08:07:43AM +0200, Markus Armbruster wrote:
>>>>> Ease of use matters, too.  When sticking to the rule leads to awkward
>>>>> code, we should stop and think.  Should we deviate from the rule?  Or
>>>>> can we avoid that by tweaking the interface?
>>>>>
>>>>> Philippe's proposed interface sticks to the rule.
>>>>
>>>> The cost is that when you see a  function   dosomething(true|false) as
>>>> a reader you often have no idea what the effect of true vs false is
>>>> on the behaviour of that function. You resort to looking at the
>>>> API docs and/or code.  This is where C would really benefit from
>>>> having named parameters like as  dosomething(ignore_errors=true|false)
>>>> is totally obvious. Anyway, I digress.
>>>
>>> Right.  Quoting myself: "If having to pass a flag turns out to to be a
>>> legibility issue, we can have wrapper functions."  :)
>>
>> There is something more fundamental that seems to be missed by most in this conversation,
>> ie the distinction between the normal execution path and the error path.
>>
>>
>>>
>>>>> Another interface that does: return -1 for error, 0 for module not found
>>>>> (no error), and 1 for loaded.
>>>>
>>>> IMHO this pattern is generally easier to understand when looking at
>>>> the callers, as the fatal error scenario is always clear.
>>>>
>>>> That said I would suggest neither approach as the public facing
>>>> API. Rather stop trying to overload 3 states onto an error reporting
>>>> pattern that inherantly wants to be 2 states. Instead just have
>>>> distinct methods
>>>
>>> Like these:
>>>
>>>>   bool module_load_one(const char *prefix, const char *name, Error *errp)
>>>>   bool module_try_load_one(const char *prefix, const char *name, Error *errp)
>>>>
>>>> other names are available for the second, eg module_load_one_optional()
>>>
>>> module_load_one_if_there()?
>>
>> And what do you do with the caller that needs to _know_ whether the module was "there" or not?
>>
>> This is losing this information along the way, and the callers NEED it.
>>
>> I really invite, with no offense intended,
> 
> None taken!
> 
>>                                            to read the hunks of my patch and the callers,
>> there are occasions where we need to _know_ if the module was there or not, and act depending on the context.
>>
>> The information about "bool is_there" needs to be passed to the caller.
> 
> If you have callers that need to distinguish between not found, found
> but bad, found and good, then return three distinct values.
> 
> I proposed to return -1 for found but bad (error), 0 for not found (no
> error), and 1 for loaded (no error).

That is fine too.

I think it would be better to completely make the return value separate from the Error,
and really treat Error as an exception and not mix it up with the regular execution,

but if it is the general consensus that I am the only one seeing this conflation problem we can model it this way too.

> 
>>> By the way, the "one" in "module_load_one" & friends feels redundant.
>>> When I see "module_load", I assume it loads one module.
>>
>> there is a module_load_all.
> 
> Libc has fcloseall() and fclose().  Clear enough, isn't it?
> 
> [...]
> 


