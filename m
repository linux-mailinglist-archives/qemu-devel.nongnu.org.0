Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F0417B72A
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Mar 2020 08:05:44 +0100 (CET)
Received: from localhost ([::1]:60168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jA73G-0000T9-Vx
	for lists+qemu-devel@lfdr.de; Fri, 06 Mar 2020 02:05:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52571)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1jA71N-0008NI-1u
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 02:03:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1jA71L-0001g1-9t
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 02:03:44 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:35214
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1jA71L-0001WA-3D; Fri, 06 Mar 2020 02:03:43 -0500
Received: from host86-162-6-80.range86-162.btcentralplus.com ([86.162.6.80]
 helo=[192.168.1.65]) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1jA71U-00017F-8P; Fri, 06 Mar 2020 07:03:52 +0000
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <cover.1583017348.git.balaton@eik.bme.hu>
 <f7f6bca9-ce20-cc3d-5366-1e947d729c21@ilande.co.uk>
 <bdbef976-a853-7178-8163-579e4bf9e2e0@ilande.co.uk>
 <alpine.BSF.2.22.395.2003011731130.95594@zero.eik.bme.hu>
 <57ff6676-5054-d3f6-f4fc-6ff02b09019f@ilande.co.uk>
 <alpine.BSF.2.22.395.2003011902490.28669@zero.eik.bme.hu>
 <alpine.BSF.2.22.395.2003011951370.28669@zero.eik.bme.hu>
 <38cb0f83-79fc-7021-38fc-c1e28c3c0fa0@ilande.co.uk>
 <alpine.BSF.2.22.395.2003012202330.79908@zero.eik.bme.hu>
 <9ce6d135-4169-96ae-c457-1131b4510c49@ilande.co.uk>
 <alpine.BSF.2.22.395.2003022145430.47473@zero.eik.bme.hu>
 <2a39ccab-e4d4-8172-9a1d-0bc089e0104c@ilande.co.uk>
 <alpine.BSF.2.22.395.2003032356230.41934@zero.eik.bme.hu>
 <a579c016-fd6c-ad4f-c091-2286265c9a57@ilande.co.uk>
 <alpine.BSF.2.22.395.2003042227190.70853@zero.eik.bme.hu>
 <b3bce0d3-3ab3-7fb3-ed3c-60f1f19159d6@ilande.co.uk>
 <alpine.BSF.2.22.395.2003060007040.48868@zero.eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Autocrypt: addr=mark.cave-ayland@ilande.co.uk; keydata=
 mQENBFQJuzwBCADAYvxrwUh1p/PvUlNFwKosVtVHHplgWi5p29t58QlOUkceZG0DBYSNqk93
 3JzBTbtd4JfFcSupo6MNNOrCzdCbCjZ64ik8ycaUOSzK2tKbeQLEXzXoaDL1Y7vuVO7nL9bG
 E5Ru3wkhCFc7SkoypIoAUqz8EtiB6T89/D9TDEyjdXUacc53R5gu8wEWiMg5MQQuGwzbQy9n
 PFI+mXC7AaEUqBVc2lBQVpAYXkN0EyqNNT12UfDLdxaxaFpUAE2pCa2LTyo5vn5hEW+i3VdN
 PkmjyPvL6DdY03fvC01PyY8zaw+UI94QqjlrDisHpUH40IUPpC/NB0LwzL2aQOMkzT2NABEB
 AAG0ME1hcmsgQ2F2ZS1BeWxhbmQgPG1hcmsuY2F2ZS1heWxhbmRAaWxhbmRlLmNvLnVrPokB
 OAQTAQIAIgUCVAm7PAIbAwYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQW8LFb64PMh9f
 NAgAuc3ObOEY8NbZko72AGrg2tWKdybcMVITxmcor4hb9155o/OWcA4IDbeATR6cfiDL/oxU
 mcmtXVgPqOwtW3NYAKr5g/FrZZ3uluQ2mtNYAyTFeALy8YF7N3yhs7LOcpbFP7tEbkSzoXNG
 z8iYMiYtKwttt40WaheWuRs0ZOLbs6yoczZBDhna3Nj0LA3GpeJKlaV03O4umjKJgACP1c/q
 T2Pkg+FCBHHFP454+waqojHp4OCBo6HyK+8I4wJRa9Z0EFqXIu8lTDYoggeX0Xd6bWeCFHK3
 DhD0/Xi/kegSW33unsp8oVcM4kcFxTkpBgj39dB4KwAUznhTJR0zUHf63LkBDQRUCbs8AQgA
 y7kyevA4bpetM/EjtuqQX4U05MBhEz/2SFkX6IaGtTG2NNw5wbcAfhOIuNNBYbw6ExuaJ3um
 2uLseHnudmvN4VSJ5Hfbd8rhqoMmmO71szgT/ZD9MEe2KHzBdmhmhxJdp+zQNivy215j6H27
 14mbC2dia7ktwP1rxPIX1OOfQwPuqlkmYPuVwZP19S4EYnCELOrnJ0m56tZLn5Zj+1jZX9Co
 YbNLMa28qsktYJ4oU4jtn6V79H+/zpERZAHmH40IRXdR3hA+Ye7iC/ZpWzT2VSDlPbGY9Yja
 Sp7w2347L5G+LLbAfaVoejHlfy/msPeehUcuKjAdBLoEhSPYzzdvEQARAQABiQEfBBgBAgAJ
 BQJUCbs8AhsMAAoJEFvCxW+uDzIfabYIAJXmBepHJpvCPiMNEQJNJ2ZSzSjhic84LTMWMbJ+
 opQgr5cb8SPQyyb508fc8b4uD8ejlF/cdbbBNktp3BXsHlO5BrmcABgxSP8HYYNsX0n9kERv
 NMToU0oiBuAaX7O/0K9+BW+3+PGMwiu5ml0cwDqljxfVN0dUBZnQ8kZpLsY+WDrIHmQWjtH+
 Ir6VauZs5Gp25XLrL6bh/SL8aK0BX6y79m5nhfKI1/6qtzHAjtMAjqy8ChPvOqVVVqmGUzFg
 KPsrrIoklWcYHXPyMLj9afispPVR8e0tMKvxzFBWzrWX1mzljbBlnV2n8BIwVXWNbgwpHSsj
 imgcU9TTGC5qd9g=
Message-ID: <071fff0a-e922-502d-da18-2572f73cecdf@ilande.co.uk>
Date: Fri, 6 Mar 2020 07:03:25 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <alpine.BSF.2.22.395.2003060007040.48868@zero.eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.162.6.80
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 2/2] via-ide: Also emulate non 100% native mode
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:41c9:1:41f::167
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
Cc: qemu-block@nongnu.org, philmd@redhat.com, qemu-devel@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>, John Snow <jsnow@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/03/2020 23:35, BALATON Zoltan wrote:

>> I just a quick look at the PCI specification and found this interesting paragraph in
>> the section about "Interrupt Line":
>>
>>
>> "The Interrupt Line register is an eight-bit register used to communicate interrupt
>> line routing information. The register is read/write and must be implemented by any
>> device (or device function) that uses an interrupt pin. POST software will write the
>> routing information into this register as it initializes and configures the system."
>>
>> "The value in this register tells which input of the system interrupt controller(s)
>> the device's interrupt pin is connected to. The device itself does not use this
>> value, rather it is used by device drivers and operating systems. Device drivers and
>> operating systems can use this information to determine priority and vector
>> information. Values in this register are architecture-specific [43]."
>>
>> [43] For x86 based PCs, the values in this register correspond to IRQ numbers (0-15)
>> of the standard dual 8259 configuration. The value 255 is defined as meaning
>> "unknown" or "no connection" to the interrupt controller. Values between 15 and 254
>> are reserved.
>>
>>
>> The key part here is "The device itself does not use this value, rather it is used by
>> device drivers and operating systems" since this immediately tells us that the
>> existing code in hw/ide/via.c which uses the interrupt line value for IRQ routing is
>> incorrect and should be removed.
> 
> On real hardware this may be true but in QEMU how would it otherwise raise the
> correct interrupt line the guest expects? This probably does not matter for pegasos2
> but I think is needed for 100% native mode used with the fulong2e so it gets the IRQ
> it expects.

That's easy - remember that both the PCI and IRQ interrupts are separate pins on the
chip, so all that needs to be done is expose the legacy IRQ via qdev and use that to
wire it up to your interrupt controller.

>> If we do that the next question is how does the VIA know whether the use the PCI
>> interrupt or the legacy interrupt? Another look at the datasheet showed that there is
> 
> I don't think via-ide ever uses a PCI interrupt, if you look at its datasheet the
> description of the prog-if reg (0x9) says in native mode irq is programmable via
> config reg 0x3c which then lists all the ISA IRQs as possible values, default 14 and
> 0 meaning disable.
> 
>> another possibility: PCI configuration space register 0x3d (Interrupt pin) is
>> documented as having value 0 == Legacy IRQ routing which should be the initial value
>> on reset, but QEMU incorrectly sets it to 1 which indicates PCI IRQ routing.
> 
> The VT8231 docs say this should always read 1 but may be this is somehow set to 0 on
> the Pegasos2. What does that mean? Should we use this value instead of the feature
> bit to force using legacy interrupts? We'd still need a property in via-ide to set
> this reg or is it possible to set it from board code overriding the default after
> device is created? That would allow to drop patch 1. I can try this.

Okay so this is interesting: I've been switching between the VT8231 and the VT82C686B
datasheets, and there is a difference here. You are correct in what you say above in
that the 8231 docs specify that this is set to 1, but on the 686B this is clearly not
the case.

What is rather unusual here is that both the 8231 and 686B have exactly the same
device and vendor ids, so I'm not sure how you'd distinguish between them?

>> In your previous email you included a trace of the PCI configuration accesses to the
>> via-ide device. Can you try this again with the following diff and post the same
>> output once again?
>>
>> diff --git a/hw/ide/via.c b/hw/ide/via.c
>> index 096de8dba0..db9f4af861 100644
>> --- a/hw/ide/via.c
>> +++ b/hw/ide/via.c
>> @@ -139,7 +139,7 @@ static void via_ide_reset(DeviceState *dev)
>>     pci_set_long(pci_conf + PCI_BASE_ADDRESS_2, 0x00000170);
>>     pci_set_long(pci_conf + PCI_BASE_ADDRESS_3, 0x00000374);
>>     pci_set_long(pci_conf + PCI_BASE_ADDRESS_4, 0x0000cc01); /* BMIBA: 20-23h */
>> -    pci_set_long(pci_conf + PCI_INTERRUPT_LINE, 0x0000010e);
>> +    pci_set_long(pci_conf + PCI_INTERRUPT_LINE, 0x0000000e);
>>
>>     /* IDE chip enable, IDE configuration 1/2, IDE FIFO Configuration*/
>>     pci_set_long(pci_conf + 0x40, 0x0a090600);
> 
> This does not change much:
> 
> pci_cfg_write via-ide 12:1 @0x9 <- 0xf
> pci_cfg_write via-ide 12:1 @0x40 <- 0xb
> pci_cfg_write via-ide 12:1 @0x41 <- 0xf2
> pci_cfg_write via-ide 12:1 @0x43 <- 0x35
> pci_cfg_write via-ide 12:1 @0x44 <- 0x18
> pci_cfg_write via-ide 12:1 @0x45 <- 0x1c
> pci_cfg_write via-ide 12:1 @0x46 <- 0xc0
> pci_cfg_write via-ide 12:1 @0x50 <- 0x17171717
> pci_cfg_write via-ide 12:1 @0x54 <- 0x14
> pci_cfg_read via-ide 12:1 @0x0 -> 0x5711106
> pci_cfg_read via-ide 12:1 @0x0 -> 0x5711106
> pci_cfg_read via-ide 12:1 @0x8 -> 0x1018f06
> pci_cfg_read via-ide 12:1 @0xc -> 0x0
> pci_cfg_read via-ide 12:1 @0x2c -> 0x11001af4
> pci_cfg_read via-ide 12:1 @0x3c -> 0xe
> pci_cfg_read via-ide 12:1 @0x4 -> 0x2800080
> pci_cfg_read via-ide 12:1 @0x3c -> 0xe
> pci_cfg_write via-ide 12:1 @0x3c <- 0x9
> 
> compared to
> 
>> pci_cfg_write via-ide 12:1 @0x9 <- 0xf
>> pci_cfg_write via-ide 12:1 @0x40 <- 0xb
>> pci_cfg_write via-ide 12:1 @0x41 <- 0xf2
>> pci_cfg_write via-ide 12:1 @0x43 <- 0x35
>> pci_cfg_write via-ide 12:1 @0x44 <- 0x18
>> pci_cfg_write via-ide 12:1 @0x45 <- 0x1c
>> pci_cfg_write via-ide 12:1 @0x46 <- 0xc0
>> pci_cfg_write via-ide 12:1 @0x50 <- 0x17171717
>> pci_cfg_write via-ide 12:1 @0x54 <- 0x14
>> pci_cfg_read via-ide 12:1 @0x0 -> 0x5711106
>> pci_cfg_read via-ide 12:1 @0x0 -> 0x5711106
>> pci_cfg_read via-ide 12:1 @0x8 -> 0x1018f06
>> pci_cfg_read via-ide 12:1 @0xc -> 0x0
>> pci_cfg_read via-ide 12:1 @0x2c -> 0x11001af4
>> pci_cfg_read via-ide 12:1 @0x3c -> 0x10e
>> pci_cfg_read via-ide 12:1 @0x4 -> 0x2800080
>> pci_cfg_read via-ide 12:1 @0x3c -> 0x10e
>> pci_cfg_write via-ide 12:1 @0x3c <- 0x109
> 
> firmware does not seem to care about this value.

I think this proves what I was saying about the legacy interrupt routing, but of
course this is based upon the 686B rather than the 8231.


ATB,

Mark.

