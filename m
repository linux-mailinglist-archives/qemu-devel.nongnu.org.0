Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B39B95E68E7
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 18:57:00 +0200 (CEST)
Received: from localhost ([::1]:60002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obPVT-0005IT-Qg
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 12:56:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1obO1w-0002Ni-Vq
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 11:22:26 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c]:45658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1obO1l-0000tH-PJ
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 11:22:15 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 33A2C218FF;
 Thu, 22 Sep 2022 15:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663860132; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3HTitKtkld14jAdPXjqLA7mKLdGN8yG/fKzq85Pox0M=;
 b=rF+oZi+aMqKQ8xKeGSqqOfuIi6UqRrZU2+5iTPvtoSNyr4aCNmplJSD/Q0nhg8kcK8sHOE
 kpjNmt/n1V2QhmWmsCS+Dkmyn6ys3Ik8Y47gNpIXaZUSDpIUq1IL9IC7CLWCAMWszUD+XU
 aWCbbHDM4txq/er9HlpNybk5Gnwso9U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663860132;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3HTitKtkld14jAdPXjqLA7mKLdGN8yG/fKzq85Pox0M=;
 b=tImHwh6G3YivbllnZRGIoCPjzsXGSEIl6mjL7UdGHCVL+qoW7mrpRTryh39IC51BtB4xwA
 uBvc7+ugCOgpdeDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DA8D21346B;
 Thu, 22 Sep 2022 15:22:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id bf/ZM6N9LGMMLgAAMHmgww
 (envelope-from <cfontana@suse.de>); Thu, 22 Sep 2022 15:22:11 +0000
Message-ID: <a30470e4-a861-c88e-e1ef-dfeae3352ad6@suse.de>
Date: Thu, 22 Sep 2022 17:22:11 +0200
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
 <87bkr7mvgr.fsf@pond.sub.org> <4a656f0f-1497-5569-e562-f537b115daf3@suse.de>
 <87r103lf4y.fsf@pond.sub.org> <f7650e0c-1e18-31ac-4ed5-49777a69ba64@suse.de>
 <87leqbjx28.fsf@pond.sub.org>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <87leqbjx28.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c;
 envelope-from=cfontana@suse.de; helo=smtp-out1.suse.de
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

On 9/22/22 16:36, Markus Armbruster wrote:
> Claudio Fontana <cfontana@suse.de> writes:
> 
>> On 9/22/22 15:20, Markus Armbruster wrote:
>>> Claudio Fontana <cfontana@suse.de> writes:
>>>
>>> [...]
>>>
>>>> I think it would be better to completely make the return value separate from the Error,
>>>> and really treat Error as an exception and not mix it up with the regular execution,
>>>>
>>>> but if it is the general consensus that I am the only one seeing this conflation problem we can model it this way too.
>>>
>>> It's a matter of language pragmatics.  In Java, you throw an exception
>>> on error.  In C, you return an error value.
>>>
>>> Trying to emulate exceptions in C might be even more unadvisable than
>>> trying to avoid them in Java.  Best to work with the language, not
>>> against it.
>>>
>>> Trouble is the error values we can conveniently return in C can't convey
>>> enough information.  So we use Error for that.  Just like GLib uses
>>
>> Right, we use Error for that and that's fine, but we should use it _only Error_ for that.
>>
>> Ie map the Exceptions directly to Error.
>>
>> So:
>>
>> try {
>>
>>   rv = function_call(...);
>>
>>   use_return_value(rv);
>>
>> } catch (Exception e) {
>>
>>   /* handle exceptional case */
>>
>> }
>>
>> becomes
>>
>> rv = function_call(..., Error **errp);
>>
>> if (errp) {
>>   /* handle exceptional case */
>> }
>>
>> use_return_value(rv);
> 
> This is simply not the intended use of Error.
> 
> Also, "trying to emulate exceptions in C might be even more unadvisable
> than trying to avoid them in Java."
> 
>> Instead we mix up the Exception code path and the regular code path, by having rv carry a mix of the Exception and regular return value,
>> and this creates problems and confusion.
> 
> "In C, you return an error value."
> 
>> If we put a hard line between the two, I think more clarity emerges.
> 
> Maybe, but consistency matters.  Clarity doesn't emerge in isolation.  
> Deviating from prevailing usage tends to confuse.
> 
>>> GError.
>>>
>>> More modern languages do "return error value" much better than C can.  C
>>> is what it is.
>>>
>>> We could certainly argue how to do better than we do now in QEMU's C
>>> code.  However, the Error API is used all over the place, which makes
>>> changing it expensive.  "Rethinking the whole Error API" (your words)
>>> would have to generate benefits worth this expense.  Which seems
>>> unlikely.
>>>
>>> [...]
>>>
>>
>> This is all fine, the problem is how we remodel this in C.
>>
>> This is how I see the next steps to clarify my position:
>>
>> short term:
>>
>> - keep the existing API with the existing assumptions, use a separate argument to carry the pointer to the actual return value (where the function return value as provided by the language is used to return if an exception was generated or not, as we assume today).
> 
> We don't actually need separate values for "actual return value" and
> "success vs. failure" here.  We can easily encode them in a single

Yes, we do, it would avoid the confusion that we see as soon as people look at the module_load_one code the first time.

> return value.  This is *common* in C, for better or worse.

We make our own life difficult, by wasting the very precious space of the return value that should be used to provide the meaning of the function,

and using it to provide a completely useless and redundant bool return value, that by your own definition,
is just "errp != NULL".

The very precious and scarce return value of the C function is completely wasted.

> 
> For instance, read() returns -1 on error, 0 on EOF (which is not an
> error), and a positive value on actual read.  On error, @errno is set,
> which is a bit awkward (we wouldn't design that way today, I hope).
> 
> The interface I proposed is similar: return -1 on error, 0 on not found
> (which is not an error), and 1 on successful load.  On error, an Error
> is set via @errp.  With a name that makes it obvious that "not found" is
> not an error, there's nothing that should surprise someone
> passingly familiar with QEMU code.

This is fine too, we can do -1 on error, 0 on not found and 1 (and errp set) on Error,

especially if the long term goal of actually fixing the high level problem in the Error API (separating it from the return value, leaving it free for meaningful return values for the ordinary case)
is not agreed on.

> 
>> - long term (maybe): fix the existing API by detaching completely the return value from the exception.
> 
> As I wrote, this seems unlikely to be worth its considerable expense.

In this case, something like your suggestion would be the second best option in my view.

C

