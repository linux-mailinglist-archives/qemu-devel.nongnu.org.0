Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8088F5E77DE
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 12:02:59 +0200 (CEST)
Received: from localhost ([::1]:33360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obfWL-0002it-U4
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 06:02:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1obfEV-0007N3-I1
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 05:44:32 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:41976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1obfEP-0005RO-8e
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 05:44:30 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 31D7221A47;
 Fri, 23 Sep 2022 09:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663926264; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EoRJq4U3rhll1jnnHSpCKE6vugiYhyKLFyCiEGhZRto=;
 b=HywZsRfHb8Us4b6pXWPMXXTAbLwVPQPw95LBw2a9OSBlJEMgTl7FzcFOpsSDAACUeav1Kl
 5a9V2yFiZrVDpIhnK1jaxJ22OoikmcvDs1VHee34YaWCNrfYL5JhN2NuHna9DbQfv6w2Ca
 svSNM+tQMG1B/oDNfIC1T6XehPzhsSQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663926264;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EoRJq4U3rhll1jnnHSpCKE6vugiYhyKLFyCiEGhZRto=;
 b=VLNQva9pMA08dFKU/YmFg1zRdAq1r1N3cHl6SE7yYCcBZxHhRjwjNaYGDKsst1t56Sn40d
 voW7oyPy+6jk2aAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C06DA13A00;
 Fri, 23 Sep 2022 09:44:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SnewLPd/LWO3KwAAMHmgww
 (envelope-from <cfontana@suse.de>); Fri, 23 Sep 2022 09:44:23 +0000
Message-ID: <7ebed330-2e71-b393-7a75-c6e91a85549b@suse.de>
Date: Fri, 23 Sep 2022 11:44:23 +0200
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
References: <76775f64-e49a-1c3c-0d73-10d93eff34e4@amsat.org>
 <87y1ucdirx.fsf@pond.sub.org> <cc2c5e14-f0a0-4415-9fe1-d7811ee27850@suse.de>
 <878rmc54cw.fsf@pond.sub.org> <Yywcs7CpKDxahOSM@redhat.com>
 <87leqb4ul9.fsf@pond.sub.org> <5f5921fe-6d4f-490b-4328-702a45973bbc@suse.de>
 <87bkr7mvgr.fsf@pond.sub.org> <Yyx3Pc89tbqBliM0@redhat.com>
 <87wn9vig40.fsf@pond.sub.org> <YyyV5tBk/JHUVfyl@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <YyyV5tBk/JHUVfyl@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 9/22/22 19:05, Kevin Wolf wrote:
> Am 22.09.2022 um 17:27 hat Markus Armbruster geschrieben:
>> Kevin Wolf <kwolf@redhat.com> writes:
>>
>>> Am 22.09.2022 um 14:42 hat Markus Armbruster geschrieben:
>>
>> [...]
>>
>>>> If you have callers that need to distinguish between not found, found
>>>> but bad, found and good, then return three distinct values.
>>>>
>>>> I proposed to return -1 for found but bad (error), 0 for not found (no
>>>> error), and 1 for loaded (no error).
>>>
>>> My intuition with this one was that "not found" is still an error case,
>>> but it's an error case that we need to distinguish from other error
>>> cases.
>>>
>>> Is this one of the rare use cases for error classes?
>>
>> If I remember correctly, "not found" is not actually an error for most
>> callers.  If we make it one, these callers have to error_free().  Minor
>> annoyance, especially when you have to add an else just for that.
> 
> AIUI most callers don't actually need the three way distinction, but

Right, this is why I initially modeled this as:

return value true -> found and loaded
return value false -> not found or error: (check *errp != NULL) to distinguish between the two.


> just success (may or may not be loaded now) and error.
> 
> The example for a caller that needs it was dmg. But with the changes
> after review, it won't be using the return code for this any more
> either.
> 
>> Even if we decide to make it an error, I would not create an error class
>> for it.  I like
>>
>>     rc = module_load_one(..., errp);
>>     if (rc == -ENOENT) {
>>         error_free(*errp);
>>     } else if (rc < 0) {
>>         return;
>>     }
>>
>> better than
>>
>>     Error *err = NULL;
>>
>>     module_load_one(..., &err);
>>     if (err && err->class == ERROR_CLASS_NOT_FOUND) {
>>         error_free(err);
>>     } else if (err) {
>>         error_propagate(errp, err);
>>         return;
>>     }
> 
> That's a good point, we can use the return code to distinguish the cases.
> 
>> I respect your intuition.  Would it still say "error case" when the
>> function is called module_load_if_exists()?
> 
> I guess no, then it becomes a second success case.
> 
>> Hmm, another thought... a need to distinguish error cases can be a
>> symptom of trying to do too much in one function.  We could split this
>> into "look up module" and "actually load it".
> 
> Might become slightly inconvenient. On the other hand, we can still have
> a simpler wrapper function that works for the majority of cases where a
> boolean result for the combined operation is enough.
> 
> Kevin
> 


