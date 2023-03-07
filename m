Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 795266AD88D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 08:57:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZSBH-0006M4-II; Tue, 07 Mar 2023 02:56:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pZSBF-0006Ll-U4; Tue, 07 Mar 2023 02:56:17 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pZSBE-0004eJ-FF; Tue, 07 Mar 2023 02:56:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PuaeyY3q/tNp5ut3K5Twh76exko+2p9Ow7ZN6rie6X0=; b=kRC3LEmOEyxW6YoklYzmHJJRiY
 XZAQrneDi9Wd3/hdBiw58T5/SHcunZKCZPtEarJGt4l7VUFQIBxeFi5Zdg6lqq9SiyByj30y01iqd
 J69BDtxD3w6/1QCkTNkAXnDi5WOhfbGz7DByohUU5+Pb/1Det9+rpWbRik11tfRwISbwnpFgSZgge
 QmJf1dSSC2qgSB6P//i8N7IkDXPtw0EGJHfREqpl7g95+KXdvpDVTjkOjo9hj1pP2q0JL6SRQ2e8n
 cigrR4rq4VG3fMnuhK3mifKrcu6M1J8Hgp0QUNhCkgXMfmDPMxuOUxcLZjyFrLSosLy77vr2iFvhu
 +ifuD3k4/gLVnp5itE59TRt0ZdEcT65heWrhpeJuaMNk9oF4a3btiELzpwuA+EoPkfGB73clJ3OuI
 mXGp0JJYStblf/o08WblIZu31lLIM6GWaAUaOvDzf3A3rgdnEL3GaFz8Gqz/0aMg15zortTZziNgo
 j0eXpEAF6qGQTbkQAK6hu5B57cZms4U3jM0RLbkgIizExa2p1W82V8f9zv3vpWa9hwfdUmM11lrD7
 tFLFNfBcHLG90xeK77HkqRs3Jyx9BOqs6IC4NCaRiDnuIAQ4d/0HUWXJ0RQSIg9JJ+QhaXnyr5yml
 EV2U2VRPFgbWzD4LBydtffm6X4xM0VE4HkE/mfEfA=;
Received: from [2a00:23c4:8bab:d400:2a4f:fc6b:227:2848]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pZSAZ-0004CV-UX; Tue, 07 Mar 2023 07:55:36 +0000
Message-ID: <8a73e01b-182f-e4f7-6a6b-6dbf473a09ac@ilande.co.uk>
Date: Tue, 7 Mar 2023 07:56:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 ReneEngel80@emailn.de
References: <cover.1678105081.git.balaton@eik.bme.hu>
 <42b740d38b810474948b303b0d325dc1aa054224.1678105081.git.balaton@eik.bme.hu>
 <b9400e40-b0da-c260-068b-4358933f933d@ilande.co.uk>
 <01c02da7-ce82-80cf-c7e7-27b7f6e36bdd@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <01c02da7-ce82-80cf-c7e7-27b7f6e36bdd@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8bab:d400:2a4f:fc6b:227:2848
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v8 4/6] hw/ppc/pegasos2: Fix PCI interrupt routing
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 06/03/2023 22:14, BALATON Zoltan wrote:

>> Can you explain a bit more about how the PCI interrupt lines are connected to both 
>> the MV64361 and VT8231? The reason for asking is that I see a similar pattern in 
>> the bonito board, but there I can't see how those lines would be used because they 
>> can also raise a CPU interrupt, yet it is a different one compared to the 8259.
>>
>> Given that we know from Bernhard's tests that the fuloong2e board works with 
>> pci_bus_irqs() included in via_isa_realize() which overwrites the bonito 
>> equivalent, I'm wondering if the mv_pirq array is actually needed at all and
> 
> Also I'd be cautious of tests on fuloong2e unless it was done with binary known to 
> work on real machine as we have found before that those binaries for the real machine 
> expect IDE to use IRQ 14/15 like pegasos2 guests but the e.g. the default config in 
> Linux would also work with native IRQs as documented in the datasheet but that's 
> apparently not how it really works on real hardware (proven by binaries written for 
> and tested on real hardware did not work with the model which followed the datasheet) 
> so we had to change that later to match hardware. You may remember this, it was found 
> around the time when we tested via-ide with different guests and some worked some 
> didn't with the native mode IRQs. This suggests that datasheets and tests with code 
> not verified to work on real hardware is unreliable (so are PCI standards that the 
> VIA chip apparently does not follow). So I'd only trust guests that were running on 
> the real machine.

This may have been true when these discussions occurred a couple of years ago, but 
things are different now. I'm now confident that there is no such thing as a "half 
native" mode, and in fact the confusing behaviour being exhibited was because the 
code was trying to work around the fact that the VIA device was missing PCI IRQ routing.

Can you provide details of the kernel, initrd and rootfs that you use to test the 
fuloong2e board?


ATB,

Mark.

