Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 888E1559A5A
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 15:29:55 +0200 (CEST)
Received: from localhost ([::1]:60334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4jNi-0007KJ-Lh
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 09:29:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jMW-0006G8-7v; Fri, 24 Jun 2022 09:28:40 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:41386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jMU-0002Uk-Oi; Fri, 24 Jun 2022 09:28:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:References:Cc:To:From:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hPVCKdGsDA57z0x6GJijWzBj0TpPu6hl6+8W6ZSBlFk=; b=giXxg3utz5m736jvqbHMM4V60i
 OOK7dO6mOQ7NX3hE/rQ2qryZObd+dnU1kQ1q1lmjUN+synV9ua0RL611ANO1GNgalzKkK38VknxLj
 3OK7ddikXRvUPqs0dhaePmQleqt8cZgrxjUHHV+x/P/ESdIM12qQcSmglcNVO776CxM6zYGjrIQxq
 vUpmMexJga/kLDa6RawXmPga+fRNO3vEY7NpMUH0Bks657yY7Fl7QhohNKu9CRdi5QZJe4uebVAkI
 fcUeSjNF4SHNCFEkur0eiEgO4S8UkKzMjGqZk/2HdMPf+5wuR1IGYVi9eaM4EhhMDnaqZL7RSH4ra
 LOyHVf62MrhNaK3K2yzRftBckrSDDDZ9K3RmbyxbqXM0qxuWRz/h27OtV3HWjBySeVd6zzNk3md4c
 KCVKc0ojL8vP2MGKvPeuxMtFygOoCvSKXgGg5pRfCxvF+rLPpcmdB3V+l0ve8b0SS+6/IU2ILFRDI
 cAV/pUZ+kQwmdkvp0REPzFi5IeiJXZt1JztezvMl82Q91tDoxmBMpUTU3IHp4mcF9Ua+rfjpVk2gw
 KpYcQ3zjsbpMsKNvmPvM9aY4Prmj5qZm3Sqn5b2GQzzawQDw0E509QpqpqrCXC6haA39Ds83en2AY
 pg/nXu0wuH5EiS4AB0VZPofYosOJ6QBYz4NJ983JM=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jL5-0002xg-G5; Fri, 24 Jun 2022 14:27:15 +0100
Message-ID: <1b95daf6-8a51-1ae3-4a55-a2136c3278e5@ilande.co.uk>
Date: Fri, 24 Jun 2022 14:28:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com,
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-28-mark.cave-ayland@ilande.co.uk>
 <CAFEAcA8Rp9ta7zvcpxeg7YrgYD_EDp+t1CMU67pHDQHr2JeQXw@mail.gmail.com>
 <39580972-c586-4822-b761-4b99772c8ed6@ilande.co.uk>
In-Reply-To: <39580972-c586-4822-b761-4b99772c8ed6@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 27/50] pckbd: alter i8042_mm_init() to return a I8042_MMIO
 device
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 10/06/2022 08:04, Mark Cave-Ayland wrote:

> On 09/06/2022 11:58, Peter Maydell wrote:
> 
>> On Sun, 22 May 2022 at 19:19, Mark Cave-Ayland
>> <mark.cave-ayland@ilande.co.uk> wrote:
>>>
>>> This exposes the I8042_MMIO device to the caller to allow the register memory
>>> region to be mapped outside of i8042_mm_init().
>>>
>>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>>
>> I'm not sure where best to put this review comment in the patchseries,
>> so I'll just note it here: I see that at the end of the series we end
>> up with an i8042_mm_init() which is just "create a device with qdev_new,
>> set properties, realize it, and connect its gpio lines". Since that
>> function has exactly one callsite (in hw/mips/jazz.c) I think we should
>> add a patch on the end that gets rid of i8042_mm_init() entirely in
>> favour of the board doing all the "create and wire up device" code inline.
> 
> I actually have a patch to do this in the follow-up part 2 series locally. The aim 
> was to get part 1 merged first (which is removing the update callback and the 
> opaque), and then finish tidying up the QOM modelling of the devices in part 2.
> 
> However since part 1 has been posted, both Hervé and Helge have mentioned that they 
> wouldn't mind if there was a migration break for the hppa and MIPS magnum machines. 
> As this does save a bit of work for the I8042_MMIO device, I'll see if it is easy 
> enough to bring forward into part 1.

After a bit of experimentation I think deferring this to part 2 is the easiest 
solution here: even though there is a patch to remove the "base" property again for 
the I8042_MMIO_DEVICE, that solution still feels cleaner than scattering the 
migration compatibility across multiple series.


ATB,

Mark.

