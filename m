Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E000017BCE8
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Mar 2020 13:37:54 +0100 (CET)
Received: from localhost ([::1]:35988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jACEk-0002MF-0Q
	for lists+qemu-devel@lfdr.de; Fri, 06 Mar 2020 07:37:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55303)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <atar4qemu@gmail.com>) id 1jACE1-0001r3-VY
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 07:37:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <atar4qemu@gmail.com>) id 1jACE0-00068h-QL
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 07:37:09 -0500
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:45173)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <atar4qemu@gmail.com>)
 id 1jACDy-00060I-Gr; Fri, 06 Mar 2020 07:37:06 -0500
Received: by mail-ed1-x542.google.com with SMTP id h62so2294078edd.12;
 Fri, 06 Mar 2020 04:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iRX84Kx5boJMIKi0fSkMnnHXncvgLQwJWw5rXb2MQ38=;
 b=h4oZCJYvr6paTJPbKaPq8r2TX7nHhRwnFTECaxKaxflNH+4BimDQ9AXpyr5NDs/bXE
 9BH//lH7w7m3sEbaR0lCBIZpwBwsPa9behxZxvgJM54x4LdAnppeKGlpzoFmWvEPVwNe
 wriZh4YMBE75Ugn+5b63VtxcU0DjrKCM5ov+Y1gPJ8+UNStpNjx7atGjoq3kw85ZnqCb
 zazGpg2tvzoxFxenHUhjxBUZ67KLjWs588aiva/IarTUBiUGzXOfzhPhfi02q9i/g7bG
 GeWhUAUbMyyLZMiARrM6QQnppEgMxE/4pibTB3ENM3DIrH/xtbBcd+fRFZubxKseKoB7
 Xqmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iRX84Kx5boJMIKi0fSkMnnHXncvgLQwJWw5rXb2MQ38=;
 b=BvcvXuPsrz/ttX5hAmqmsQOkvPrhjA90jSHd7SwzQaN42NHiy8qcQmU8cAmrTCuDjd
 QgM8HUZF0cHOMssKOd2qZM1W7Lj3F1l8n5My/qPSl36ij5UkmmucX9XfSbtgkjnNfxhq
 PN4mg35viaoHoCvup/VM93kkvCIRKKN48Q1Hv5LRfo035yZCpD9wVVnL87EFXHTRU6Kv
 mvyg/MBpqSjX11Q6TMXYCU94OASjetfNWDwgj/v9j0kVuydh8IsUMr2wm6uawQ0AMiAe
 XXoD7BjL5u8vRnNthW7b1rjg0E+iGPDaHGNCqQbGByP/Ja3ayzJX1iu7lI2Iwt7Q04LE
 T2+A==
X-Gm-Message-State: ANhLgQ2oMkLAmLj8Mlw7yeJErD9UHe/WMyveB+vldSmGvbJYIGGR3rZ/
 Mm1+MmJG6sXf2JPVQfnYSVw+cc/oCvUPhu8AVq207Hl6
X-Google-Smtp-Source: ADFU+vuxPWwOB9AbaB8XY7UiBYxSKpp5rtBRZx9eQQi4AoWu1aKucNzsvCPXNrg1A/6OSby1Tho4Pb/yTduHvUrTT5k=
X-Received: by 2002:a17:907:20e4:: with SMTP id
 rh4mr2617575ejb.51.1583498225179; 
 Fri, 06 Mar 2020 04:37:05 -0800 (PST)
MIME-Version: 1.0
References: <cover.1583017348.git.balaton@eik.bme.hu>
 <32bb2eab213344151ca342bab5db2cf8c2758fb7.1583017348.git.balaton@eik.bme.hu>
 <f7f6bca9-ce20-cc3d-5366-1e947d729c21@ilande.co.uk>
 <bdbef976-a853-7178-8163-579e4bf9e2e0@ilande.co.uk>
 <alpine.BSF.2.22.395.2003011731130.95594@zero.eik.bme.hu>
 <57ff6676-5054-d3f6-f4fc-6ff02b09019f@ilande.co.uk>
In-Reply-To: <57ff6676-5054-d3f6-f4fc-6ff02b09019f@ilande.co.uk>
From: Artyom Tarasenko <atar4qemu@gmail.com>
Date: Fri, 6 Mar 2020 13:36:53 +0100
Message-ID: <CACXAS8DLFbcfE8gTX6fnr-3MmbtxHdR77oQet+RsFPFQC42AJQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] via-ide: Also emulate non 100% native mode
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::542
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
Cc: qemu-block@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi guys,

On Sun, Mar 1, 2020 at 6:54 PM Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> On 01/03/2020 16:42, BALATON Zoltan wrote:
>
> >> The other part I'm not sure about is that I can't see how via_ide_set_irq() can ever
> >> raise a native PCI IRQ - comparing with my experience on cmd646, should there not be
> >> a pci_set_irq(d, level) at the end?
> >
> > According to my tests with several guests it seems the via-ide does not seem to use
> > PCI interrupts as described in the previous reply, only either legacy IRQ14 and 15 or
> > one ISA IRQ line set by a config reg in native mode (except on Pegasos2). This may be
> > due to how it's internally connected in the southbridge chip it's part of or some
> > other platform specific quirk, I'm not sure.
>
> I think this is the key part here: how does via-ide switch between legacy and native
> mode? For CMD646 this is done by setting a bit in PCI configuration space, and I'd
> expect to see something similar here.

I haven't read the complete discussion yet, but  checked how it's done
in OFW. OFW did definitely work on via boards. Surprisingly OFW
Switches all IDE boards into native mode the same way:

my-space 9 + dup " config-b@"  $call-parent
    05 or  swap  " config-b!"  $call-parent

HTH

-- 
Regards,
Artyom Tarasenko

SPARC and PPC PReP under qemu blog: http://tyom.blogspot.com/search/label/qemu

