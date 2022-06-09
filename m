Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDC9544E11
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 15:52:01 +0200 (CEST)
Received: from localhost ([::1]:57444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzIZs-0003ws-6w
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 09:52:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1nzGJl-0004ub-3s; Thu, 09 Jun 2022 07:27:13 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:38348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1nzGJi-0004iV-Mn; Thu, 09 Jun 2022 07:27:12 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6C9C51FE15;
 Thu,  9 Jun 2022 11:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1654774028; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GCcpzS+5lWmo8xsVxkXG21BoNPtcEJ5wooOWoIPeqDM=;
 b=uIJ2yJBaL+kIcuKDN2YsjQQc9KwqWf4GRACkxUq6BleYXl8FOh3SzaWdiDAND32v0j0gKo
 yRwnQuNDYjABwZEUDeWsorH+lMN9rFPXTllfaj1EfKPIGjJFiI0igLJ20L3413tCzjS8TQ
 WBlWk0GFtUoRFOpgLTV6ki/CNUypqgQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1654774028;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GCcpzS+5lWmo8xsVxkXG21BoNPtcEJ5wooOWoIPeqDM=;
 b=Gjx247ccut+HWg93xdZvQjs+J/YxzFoTtsoGknZuSSG8DxoolZBQ6gD4NExzr6zXxPjQk1
 2Q/xrrEMqm/LFdBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1AB5B13456;
 Thu,  9 Jun 2022 11:27:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zkOwBAzZoWJvHwAAMHmgww
 (envelope-from <cfontana@suse.de>); Thu, 09 Jun 2022 11:27:08 +0000
Message-ID: <209c7aaf-bc7b-cbc2-c6d0-002bbe31258a@suse.de>
Date: Thu, 9 Jun 2022 13:27:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] disas: Remove libvixl disassembler
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Stefan Weil <sw@weilnetz.de>
References: <20220603164249.112459-1-thuth@redhat.com>
 <07f021e7-1346-c6b3-3bd1-ef0d0f0e2ff5@suse.de>
 <52c51ac4-5598-faf2-d5e5-638cab0dc1fd@redhat.com>
 <7ae17984-89c4-2247-57a7-fde6206e41e0@redhat.com>
 <03a1e04e-45c7-5002-6920-d04e29fd48fd@redhat.com>
 <YqG2Anwtba+MfxfH@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <YqG2Anwtba+MfxfH@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 6/9/22 10:57, Daniel P. Berrangé wrote:
> On Thu, Jun 09, 2022 at 10:47:24AM +0200, Thomas Huth wrote:
>> On 08/06/2022 17.51, Paolo Bonzini wrote:
>>> On 6/3/22 19:35, Thomas Huth wrote:
>>>> On 03/06/2022 19.26, Claudio Fontana wrote:
>>>>> On 6/3/22 18:42, Thomas Huth wrote:
>>>>>> The disassembly via capstone should be superiour to our old vixl
>>>>>> sources nowadays, so let's finally cut this old disassembler out
>>>>>> of the QEMU source tree.
>>>>>>
>>>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>>>
>>>>> agreed, one thought: at the time I added this thing, I had to
>>>>> add C++ compilation support,
>>>>> maybe something we can now drop if there are no more C++ users?
>>>>
>>>> I thought about that, too, but we still have disas/nanomips.cpp left
>>>> and the Windows-related files in qga/vss-win32/* .
>>>
>>> That is pure C++ so it does not need the extra complication of "detect
>>> whether the C and C++ compiler are ABI-compatible" (typically due to
>>> different libasan/libtsan implementation between gcc and clang).  So
>>> it's really just nanoMIPS that's left.
>>
>> Ok, so the next theoretical question is: If we get rid of the nanomips.cpp
>> file or convert it to plain C, would we then simplify the code in configure
>> again (and forbid C++ for the main QEMU code), or would we rather keep the
>> current settings in case we want to re-introduce more C++ code again in the
>> future?
> 
> It doesn't feel very compelling to have just 1 source file that's
> C++ in QEMU. I'm curious how we ended up with this nanomips.cpp
> file - perhaps it originated from another project that was C++
> based ?
> 
> The code itself doesn't look like it especially needs to be using
> C++. There's just 1 class there and every method is associated
> with that class, and external entry point from the rest of QEMU
> is just one boring method. Feels like it could easily have been
> done in C.
> 
> Personally I'd prefer it to be converted to C, and if we want to
> add any C++ in future it should be justified & debated on its
> merits, rather than as an artifact of any historical artifacts
> such as the code in configure happening to still exist.
> 
> With regards,
> Daniel

I'll take a look at it, maybe I can turn it to C fairly quickly.

Ciao,

Claudio

