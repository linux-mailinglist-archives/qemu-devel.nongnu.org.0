Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9D03DA934
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 18:36:31 +0200 (CEST)
Received: from localhost ([::1]:44242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m991K-0000W0-T3
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 12:36:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1m990S-0008D1-Dx
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 12:35:36 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:53332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1m990Q-0003xf-Om
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 12:35:36 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2579D223DD;
 Thu, 29 Jul 2021 16:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627576533; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x6Nh0IG1kZO5mqcAu0n2rxZiR7pwfuqB2jWANCEzHYw=;
 b=pvh4M/8u4on0VHm98qhWXZGQhF42MYpU5XGl2LWsnbQb0YtaWfSoD9xFaUYBF+z5MrKbqd
 dOu/7ZCLAc4goXykZHgj6DxxWQI5j08qwfHPz6XDI1IQjjBtN0f+G8heZB4E/SM6JJoSwp
 hUipwkzQQdjsnTexIgIjxTYZFuLZA0g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627576533;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x6Nh0IG1kZO5mqcAu0n2rxZiR7pwfuqB2jWANCEzHYw=;
 b=bJJPDwN+Ag6Q5tXLMCH4yqbuzNyuicReteUQTZD9rUWoY0K+BLXYRbnS0Vxjrb6mqOcN/L
 Yf16445ftBDBLICQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C522513BD0;
 Thu, 29 Jul 2021 16:35:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id bN53LtTYAmHRPwAAMHmgww
 (envelope-from <cfontana@suse.de>); Thu, 29 Jul 2021 16:35:32 +0000
Subject: Re: modular tcg
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Alex Bennee <alex.bennee@linaro.org>
References: <20210722220952.17444-1-jziviani@suse.de>
 <20210722220952.17444-2-jziviani@suse.de>
 <c26fc6f4-341f-c66f-5384-c811e1342891@suse.de>
 <20210723095231.sfbkhdwdg43nedkk@sirius.home.kraxel.org>
 <4b5c010f-1365-e746-c269-9b9e48771f7b@suse.de>
 <6a3940a4-ca70-343b-5724-0f8f59d6fde4@suse.de>
 <20210723124858.rh63jh2esxahib4e@sirius.home.kraxel.org>
 <20210729091407.n7bdlyw5rsievdch@sirius.home.kraxel.org>
 <f264970b-b12c-4e36-548f-d2411c7e3842@suse.de>
 <20210729102955.k34jqpetqy6owivr@sirius.home.kraxel.org>
 <75a7378d-63b2-d1d7-c7e1-ca4d13cf01cb@suse.de>
 <6514e353-fca6-98a7-cb35-46a90c37389b@amsat.org>
 <71567414-d0e3-8f5b-d4d3-b34caa8c1f59@suse.de>
 <fdd11497-f802-fd37-0ede-347f6fc97263@amsat.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <7c73a09f-f14f-cf73-ad3d-ba61c6933945@suse.de>
Date: Thu, 29 Jul 2021 18:35:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <fdd11497-f802-fd37-0ede-347f6fc97263@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Liang Yan <lyan@suse.com>, pbonzini@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org,
 "Jose R. Ziviani" <jziviani@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/29/21 4:59 PM, Philippe Mathieu-Daudé wrote:
> On 7/29/21 4:22 PM, Claudio Fontana wrote:
>> On 7/29/21 1:34 PM, Philippe Mathieu-Daudé wrote:
>>> On 7/29/21 12:44 PM, Claudio Fontana wrote:
>>>> On 7/29/21 12:29 PM, Gerd Hoffmann wrote:
>>>>>   Hi,
>>>>>
>>>>>> And another comment: I think we should have some progress on ARM with
>>>>>> the kvm/tcg split and with the KConfig of boards, before we continue
>>>>>> here.
>>>>>
>>>>> Why?  This can easily be tacked in parallel.  We can flip the switch
>>>>> for modular tcg per target in meson.build.
>>>>>
>>>>> take care,
>>>>>   Gerd
>>>>>
>>>>
>>>> Because in the end we need to do this for ARM too and for the other archs too (s390 is already ok),
>>>>
>>>> and in order to be sure not to end up in a dead-end, I think it would be good to have at least a sketch for the other archs as well..
>>>>
>>>> Just my 2c ofc, I think really here still ARM is behind, and we should help it catch up.
>>>>
>>>> If I had more time I would have pushed more on the ARM series, but.. yeah.
>>>
>>> IIUC Alex is waiting 6.2 release to respin.
>>>
>>
>> How does the Kconfig for ARM improvements go? I mean I think those improvements (enabling only compatible boards with the chosen accelerators) are important for both tcg-kvm split and possibly for modularization of ARM accelerators too right?
> 
> I think we all (Alex/you/me) reached the same point where builds work
> but current the testing framework isn't ready for non-TCG or
> modularized-TCG so the CI ends failing.
> 
> I don't want to push for 'CI build-only' because most of the annoying
> problems were from runtime (interfaces not resolved, ... which are
> important when using modules or board with unavailable devices).
> 
> I tried to address that with a QMP command to query accelerators but
> there is a disagreement whether we should query for available/built-in/
> loaded/modularized-but-not-installed/...). At this point I think I
> fairly understand the technical problems but misunderstand the big
> picture here, in particular w.r.t. management apps. I spent too many
> time on this to appear enthusiastic, sorry.
> 

The Kconfig thing also depended on the querying the accelerator part, or not?

I mean, was there the idea was "I want to build only the ARM boards that are compatible with the accel options I chose",
which is totally sensible, and removes all the need for workarounds in the tcg/kvm split series Alex is now maintaining.

I think you actually had a solution for quering the accelerators btw, and the problem was just caching the result to improve the performance?

Thanks,

Claudio






