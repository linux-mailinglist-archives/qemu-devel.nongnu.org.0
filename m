Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C5D219A9
	for <lists+qemu-devel@lfdr.de>; Fri, 17 May 2019 16:15:28 +0200 (CEST)
Received: from localhost ([127.0.0.1]:49251 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRddu-0003YK-O1
	for lists+qemu-devel@lfdr.de; Fri, 17 May 2019 10:15:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40291)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>) id 1hRdcr-0003EH-RQ
	for qemu-devel@nongnu.org; Fri, 17 May 2019 10:14:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>) id 1hRdcq-0008Fq-M6
	for qemu-devel@nongnu.org; Fri, 17 May 2019 10:14:21 -0400
Received: from mail.ilande.co.uk ([46.43.2.167]:55764
	helo=mail.default.ilande.uk0.bigv.io)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1hRdcq-0008D6-En
	for qemu-devel@nongnu.org; Fri, 17 May 2019 10:14:20 -0400
Received: from host109-146-247-8.range109-146.btcentralplus.com
	([109.146.247.8] helo=[192.168.1.65])
	by mail.default.ilande.uk0.bigv.io with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
	(envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1hRdZy-000292-RM; Fri, 17 May 2019 15:11:23 +0100
To: Artyom Tarasenko <atar4qemu@gmail.com>
References: <1557003754-26473-1-git-send-email-atar4qemu@gmail.com>
	<1557003754-26473-2-git-send-email-atar4qemu@gmail.com>
	<d28ed626-f7f8-53df-208a-cbf6c06e3cc9@ilande.co.uk>
	<CACXAS8BU-OamhTL03QNuukiKvy+vpdu8VRB4gWPe2+zz2nEymA@mail.gmail.com>
	<5306bcc1-e308-05eb-9ce5-79553cee3a23@ilande.co.uk>
	<CACXAS8AAXTy1xiQp2ftjEqhkXkbn-QG6Z=6AfKFCqJhT7eDF7Q@mail.gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Openpgp: preference=signencrypt
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
Message-ID: <643f0224-1230-33c8-8b4c-a5c688872b4e@ilande.co.uk>
Date: Fri, 17 May 2019 15:12:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CACXAS8AAXTy1xiQp2ftjEqhkXkbn-QG6Z=6AfKFCqJhT7eDF7Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 109.146.247.8
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.43.2.167
Subject: Re: [Qemu-devel] [PATCH v2 1/3] lsi53c895a: hide 53c895a registers
 in 53c810
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
	qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/05/2019 16:03, Artyom Tarasenko wrote:

> On Mon, May 6, 2019 at 4:27 PM Mark Cave-Ayland
> <mark.cave-ayland@ilande.co.uk> wrote:
>>
>> On 06/05/2019 09:42, Artyom Tarasenko wrote:
>>
>>> On Sun, May 5, 2019 at 12:43 PM Mark Cave-Ayland
>>> <mark.cave-ayland@ilande.co.uk> wrote:
>>>>
>>>> On 04/05/2019 22:02, Artyom Tarasenko wrote:
>>>>
>>>>> AIX/PReP does access to the aliased IO registers of 53810.
>>>>> Implement aliasing to make the AIX driver work.
>>>>>
>>>>> Signed-off-by: Artyom Tarasenko <atar4qemu@gmail.com>
>>>>> ---
>>>>>  hw/scsi/lsi53c895a.c | 17 ++++++++++++++---
>>>>>  1 file changed, 14 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
>>>>> index da7239d..6b95699 100644
>>>>> --- a/hw/scsi/lsi53c895a.c
>>>>> +++ b/hw/scsi/lsi53c895a.c
>>>>> @@ -2271,6 +2271,9 @@ static void lsi_scsi_realize(PCIDevice *dev, Error **errp)
>>>>>      LSIState *s = LSI53C895A(dev);
>>>>>      DeviceState *d = DEVICE(dev);
>>>>>      uint8_t *pci_conf;
>>>>> +    uint64_t mmio_size;
>>>>> +    MemoryRegion *mr;
>>>>> +    uint16_t type = PCI_DEVICE_GET_CLASS(dev)->device_id;
>>>>>
>>>>>      pci_conf = dev->config;
>>>>>
>>>>> @@ -2279,13 +2282,21 @@ static void lsi_scsi_realize(PCIDevice *dev, Error **errp)
>>>>>      /* Interrupt pin A */
>>>>>      pci_conf[PCI_INTERRUPT_PIN] = 0x01;
>>>>>
>>>>> -    memory_region_init_io(&s->mmio_io, OBJECT(s), &lsi_mmio_ops, s,
>>>>> -                          "lsi-mmio", 0x400);
>>>>>      memory_region_init_io(&s->ram_io, OBJECT(s), &lsi_ram_ops, s,
>>>>>                            "lsi-ram", 0x2000);
>>>>>      memory_region_init_io(&s->io_io, OBJECT(s), &lsi_io_ops, s,
>>>>>                            "lsi-io", 256);
>>>>> -
>>>>> +    if (type == PCI_DEVICE_ID_LSI_53C895A) {
>>>>> +        mmio_size = 0x400;
>>>>> +    } else {
>>>>> +        mr = g_new(MemoryRegion, 1);
>>>>
>>>> In general these days it's worth keeping the reference to the MemoryRegion within
>>>> LSIState since then its lifecycle is more clearly defined.
>>>
>>> On the other hand, it's a PCI card, and can not be
>>> hot-plugged/removed, so the lifecycle is pretty simple here.
>>> Or am I missing something?
>>
>> Well Thomas has been working on a set of tests that for each machine will plug and
>> unplug each device via the monitor to make sure that init/realize/unrealize work
>> correctly so it would be good to ensure that these tests don't leak.
> 
> Makes sense, indeed.
> 
>> However...
>>
>>>>> +        memory_region_init_alias(mr, OBJECT(d), "lsi-io-alias", &s->io_io,
>>>>> +                                 0, 0x80);
>>>>> +        memory_region_add_subregion_overlap(&s->io_io, 0x80, mr, -1);
>>>>> +        mmio_size = 0x80;
>>>>
>>>> This feels a little strange - is it possible to see from the datasheets that the
>>>> 53C895A has 0x400 bytes MMIO whilst the 53C810 has 0x80 bytes MMIO? It's not clear to
>>>> me where the aliasing is happening.
>>>
>>> These values are empiric. For 810 it can not be more than 0x80,
>>> because the AIX does access the registers with the shift of 0x80.
>>> For  895A we did already have 0x400.
>>
>> After a bit of searching I managed to locate an 810 datasheet and in Chapter 5 it
>> clearly describes the IO space (s->io_io) as being 256 bytes in size which is the
>> same as the 895A, but with 0x80-0xff aliased onto 0x00 - 0x7f.
>>
>> It feels to me that rather than complicate things with an additional alias
>> MemoryRegion, the simplest solution would be to simply change the mask in
>> lsi_io_read() and lsi_io_write() to be 0x7f rather than 0xff if we've instantiated a
>> 810 rather than an 895A.
> 
> Initially I implemented it exactly as you suggest, via mask. But then
> I thought that memory_region_init_alias makes aliasing more obvious.
> I don't have a strong opinion on this one though.
> 
> @Paolo, what do you think?

My general feeling is that memory region aliases are more aimed at mapping areas into
different address spaces. In this particular case it seems to me that the memory
region for both devices is still 256 bytes, but it's just that internally the address
decoder ignores bit 7 on the 810.


ATB,

Mark.

