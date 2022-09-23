Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2752F5E77AB
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 11:51:50 +0200 (CEST)
Received: from localhost ([::1]:38354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obfLX-0004jx-Qm
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 05:51:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1obfAL-0003uG-TG
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 05:40:14 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:41434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1obfAJ-00049D-L5
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 05:40:13 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 231E021A63;
 Fri, 23 Sep 2022 09:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663926005; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=87JawTsH7MrOZXkLJpqSYz3K6KG+i264VGhzCwQQv8Q=;
 b=Zb4rU0S+jEnmIs0PkOs3Rc1yNsXFQGFu7zJnZdUaY1VL1y1WL6bSCJvS+G2NbLt4k/qdGW
 qJtAMMHuImnNHnX9LK04RD7OH+Rf8Ig3NdeUDN7C7sCaYqkZjC6pX1YYYnayrSEUa75tu6
 mg3323cZ5rysdzJC+s4xv6YGbxx2WZs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663926005;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=87JawTsH7MrOZXkLJpqSYz3K6KG+i264VGhzCwQQv8Q=;
 b=IZMlLCxRKNfjsodWEkgn/7hOM4Bw7R68NUQycChpvVlzwcEJjvJxy+hPVtFKN5nul1snD7
 4ky0eag4uK4+8iBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D815713A00;
 Fri, 23 Sep 2022 09:40:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id a6+IM/R+LWMVKgAAMHmgww
 (envelope-from <cfontana@suse.de>); Fri, 23 Sep 2022 09:40:04 +0000
Message-ID: <6ee5c99e-7f17-c449-ce4b-8a0a304f4012@suse.de>
Date: Fri, 23 Sep 2022 11:40:04 +0200
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
 <87leqbjx28.fsf@pond.sub.org> <a30470e4-a861-c88e-e1ef-dfeae3352ad6@suse.de>
 <87edw2hd15.fsf@pond.sub.org>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <87edw2hd15.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
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

On 9/23/22 07:31, Markus Armbruster wrote:
> Claudio Fontana <cfontana@suse.de> writes:
> 
>> On 9/22/22 16:36, Markus Armbruster wrote:
>>> Claudio Fontana <cfontana@suse.de> writes:
>>>
>>>> On 9/22/22 15:20, Markus Armbruster wrote:
>>>>> Claudio Fontana <cfontana@suse.de> writes:
>>>>>
>>>>> [...]
>>>>>
>>>>>> I think it would be better to completely make the return value separate from the Error,
>>>>>> and really treat Error as an exception and not mix it up with the regular execution,
>>>>>>
>>>>>> but if it is the general consensus that I am the only one seeing this conflation problem we can model it this way too.
>>>>>
>>>>> It's a matter of language pragmatics.  In Java, you throw an exception
>>>>> on error.  In C, you return an error value.
>>>>>
>>>>> Trying to emulate exceptions in C might be even more unadvisable than
>>>>> trying to avoid them in Java.  Best to work with the language, not
>>>>> against it.
>>>>>
>>>>> Trouble is the error values we can conveniently return in C can't convey
>>>>> enough information.  So we use Error for that.  Just like GLib uses
>>>>
>>>> Right, we use Error for that and that's fine, but we should use it _only Error_ for that.
>>>>
>>>> Ie map the Exceptions directly to Error.
>>>>
>>>> So:
>>>>
>>>> try {
>>>>
>>>>   rv = function_call(...);
>>>>
>>>>   use_return_value(rv);
>>>>
>>>> } catch (Exception e) {
>>>>
>>>>   /* handle exceptional case */
>>>>
>>>> }
>>>>
>>>> becomes
>>>>
>>>> rv = function_call(..., Error **errp);
>>>>
>>>> if (errp) {
>>>>   /* handle exceptional case */
>>>> }
>>>>
>>>> use_return_value(rv);
>>>
>>> This is simply not the intended use of Error.
>>>
>>> Also, "trying to emulate exceptions in C might be even more unadvisable
>>> than trying to avoid them in Java."
>>>
>>>> Instead we mix up the Exception code path and the regular code path, by having rv carry a mix of the Exception and regular return value,
>>>> and this creates problems and confusion.
>>>
>>> "In C, you return an error value."
>>>
>>>> If we put a hard line between the two, I think more clarity emerges.
>>>
>>> Maybe, but consistency matters.  Clarity doesn't emerge in isolation.  
>>> Deviating from prevailing usage tends to confuse.
>>>
>>>>> GError.
>>>>>
>>>>> More modern languages do "return error value" much better than C can.  C
>>>>> is what it is.
>>>>>
>>>>> We could certainly argue how to do better than we do now in QEMU's C
>>>>> code.  However, the Error API is used all over the place, which makes
>>>>> changing it expensive.  "Rethinking the whole Error API" (your words)
>>>>> would have to generate benefits worth this expense.  Which seems
>>>>> unlikely.
>>>>>
>>>>> [...]
>>>>>
>>>>
>>>> This is all fine, the problem is how we remodel this in C.
>>>>
>>>> This is how I see the next steps to clarify my position:
>>>>
>>>> short term:
>>>>
>>>> - keep the existing API with the existing assumptions, use a separate argument to carry the pointer to the actual return value (where the function return value as provided by the language is used to return if an exception was generated or not, as we assume today).
>>>
>>> We don't actually need separate values for "actual return value" and
>>> "success vs. failure" here.  We can easily encode them in a single
>>
>> Yes, we do, it would avoid the confusion that we see as soon as people look at the module_load_one code the first time.
>>
>>> return value.  This is *common* in C, for better or worse.
>>
>> We make our own life difficult, by wasting the very precious space of the return value that should be used to provide the meaning of the function,
>>
>> and using it to provide a completely useless and redundant bool return value, that by your own definition,
>> is just "errp != NULL".
> 
> *errp != NULL, except that doesn't work when the caller NULL to errp.


This is a solvable detail. If the caller passes NULL it is unlikely to make this check after the call.
Checking for the exceptions could even be a macro that solves this.

> 
>> The very precious and scarce return value of the C function is completely wasted.
> 
> I think you're tilting at windmills :)


I have no idea what you mean.


> 
> error.h again:
> 
>  * - Whenever practical, also return a value that indicates success /
>  *   failure.  This can make the error checking more concise, and can
>  *   avoid useless error object creation and destruction.  Note that
>  *   we still have many functions returning void.  We recommend
>  *   • bool-valued functions return true on success / false on failure,
>  *   • pointer-valued functions return non-null / null pointer, and
>  *   • integer-valued functions return non-negative / negative.
> 
> This does *not* ask you to waste the return value on a bool indicating
> success.  It asks you to use error values whenever practical, and
> recommends common ones, namely:


This is good text, I might have misunderstood you before then.

> 
>      • When a function returns a non-negative integer on success, use
>        negative integers to signify failure.
> 
>      • When a function returns a non-null pointer on success, use a null
>        pointer to signify failure.
> 
>      • When a function has nothing to return, make it return true on
>        success, and false on failure.
> 
> Such use of return values is idiomatic C.
> 
> When a function can return any value of its return type on success,
> there are no error values left.  Unless we can tweak the return type to
> accomodate error values, say widen it from unsigned char to int, we're
> outside "when practical" territory.
> 
> [...]
> 

Interesting, this text contradicts what was implied before (quoting you):

>>>> Functions that set an error on some failures only tend to be awkward: in
>>>> addition to checking the return value for failure, you have to check
>>>> @errp for special failures.  This is particularly cumbersome when it
>>>> requires a @local_err and an error_propagate() just for that.  I
>>>> generally prefer to return an error code and always set an error.


And this may even be inferred from error.h around line 60, just before the snipped you quoted above.

Quoting error.h around line 60:

 * - On success, the function should not touch *errp.  On failure, it                                                                       
 *   should set a new error, e.g. with error_setg(errp, ...), or                                                                            
 *   propagate an existing one, e.g. with error_propagate(errp, ...).    

The problem is, there is no definition of what "success" and "failure" mean in error.h.
And in this absence of definition, it is easy to assume this is connected with the return value of the function,
and mix up the return value of what the function is trying to do (in this case load a module),
with whether an error/exception was generated when trying to do so.

The issue I think happened here specifically is that seeing a "bool" in the return value triggers a pattern in most readers,
and even reading the snippet above in error.h would quickly lead one to believe that the bool return value seen is connected with the errp.

In the original patch, the meaning and definition attached to the bool return value (as I documented in the code comments),
was "returns true if module found and loaded, and false otherwise".

When seeing

bool function(..., Error **errp);

a short-circuit seems to happen, making assumptions about the meaning of the boolean return value, as if connected to the errp.

That is why when changing this to an int, suddenly people seem more comfortable with it, and I think this is independent of the extended range of the return values.

In any case, returning -1, 0 or 1 is fine, it solves the problem at hand, and I think by virtue of the fact that we are using an int instead of the bool,
this will force more thinking from the reader and avoid the short-circuit presented here.

Thanks,

Claudio















