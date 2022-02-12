Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 336F64B3840
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 22:48:09 +0100 (CET)
Received: from localhost ([::1]:50084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJ0FU-0005zt-6b
	for lists+qemu-devel@lfdr.de; Sat, 12 Feb 2022 16:48:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nJ0Di-0004kQ-Sr
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 16:46:18 -0500
Received: from [2a00:1450:4864:20::62e] (port=44564
 helo=mail-ej1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nJ0Dh-0002yz-5r
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 16:46:18 -0500
Received: by mail-ej1-x62e.google.com with SMTP id p14so5519330ejf.11
 for <qemu-devel@nongnu.org>; Sat, 12 Feb 2022 13:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:user-agent:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=bfa+FIKnn2LMtA7QmpPpFSoPkIxAVU8K5q3gGJUXJYo=;
 b=L/pITnMJs0RCd7ivAQVqs/ZPdEFCcLaMlt/ZNgZ05yM7KzzSM2rDTT04fKhzykaIyy
 UV7WYUvjLgjrntbERftKlc6r+CiwmsBxt8gyM7ZiSZhfHOLackoXrBn4vMs2+R1hlXdn
 Fk5VfRdDNh9qmYRCam1fCsbNpP41Gtvc9XAEyWnFlV8HmrrgHvBhpV8kWPRkLOh4ulv7
 RSgTDGvmtiPDmmeGaAAy3DKCsreVp3XWXC+ITfO9lM9n4Q5JK7JFQbOKYIYSSMXX5WzH
 RoxuJQdLVAq4e4vFwWr8oe/k2bMvz2ddNLOhBcUmGZKLDSStw19tuG4GD7cQrEiipx6u
 /36w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:user-agent:in-reply-to
 :references:message-id:mime-version:content-transfer-encoding;
 bh=bfa+FIKnn2LMtA7QmpPpFSoPkIxAVU8K5q3gGJUXJYo=;
 b=7Jvr/lUbXyOMSTyy+nRzyWOLpqr1FLY+tsagDyl7OA8nZRN+7PDW4vJ2pNgB4TICph
 0Q3+iK7OOk/1UNWXItGY8/CTYCaZgv8c7zZ8vMPP4c+vL6lQYaGMdlC62PBG3hxbzit4
 7Oq5PNISm9rYfNxd1UMAyUCILaG3SIquXC0MZsYGxkPjcUdRtzDn88xNwgLvYXabZnOh
 yxISl+RoEbPbJ268G3VMu1TgpYIIWEFJ/i/5627BMP4CSIdZvjK/WU9E35ws3MTeTcbS
 iBZEM6pgY3/vi/g8CZPQ09zw05hhN70DjcCX5y0E3sjfiGkXeZSwrnDcRx5sccJ2MQsR
 SWNw==
X-Gm-Message-State: AOAM530+A72zh/dB1ftncikC8vB9HgMsLAg7JKsnVGVBNYt3Az5iy034
 06RB1gDCRwpKQl9boUtd4x4=
X-Google-Smtp-Source: ABdhPJzvb8ngcvxNWJ94oQEEjPxD85ihnoLmFMgEumbLGw1Pl9ugyjmNMmW6bOnjoBUDTJO2LqPfOA==
X-Received: by 2002:a17:906:748a:: with SMTP id
 e10mr2823352ejl.107.1644702375163; 
 Sat, 12 Feb 2022 13:46:15 -0800 (PST)
Received: from ?IPv6:::1?
 (200116b846c2ee00259c31142d14c23c.dip.versatel-1u1.de.
 [2001:16b8:46c2:ee00:259c:3114:2d14:c23c])
 by smtp.gmail.com with ESMTPSA id p5sm7408748ejr.105.2022.02.12.13.46.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 12 Feb 2022 13:46:14 -0800 (PST)
Date: Sat, 12 Feb 2022 22:46:12 +0100
From: Bernhard Beschow <shentey@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_4/5=5D_isa/piix4=3A_Fix_PCI?=
 =?US-ASCII?Q?_IRQ_levels_to_be_preserved_in_VMState?=
User-Agent: K-9 Mail for Android
In-Reply-To: <CAFEAcA_N6cuszzr+Afn2ed47t5tWTaayYqu3Nx2wuR8jVciP_Q@mail.gmail.com>
References: <20220212113519.69527-1-shentey@gmail.com>
 <20220212113519.69527-5-shentey@gmail.com>
 <ebb5f8ad-64dc-8349-4d1c-7d8b623d60b2@eik.bme.hu>
 <CAFEAcA9BBFHH7eqzB_zW-VDZWuXDEkYUb=P1ocPn_UyaZZFZ3w@mail.gmail.com>
 <c389b3a-bde6-9dae-557b-b8db541d1a@eik.bme.hu>
 <CAFEAcA_N6cuszzr+Afn2ed47t5tWTaayYqu3Nx2wuR8jVciP_Q@mail.gmail.com>
Message-ID: <8DC0ECF7-F539-40B1-B3BA-E95C50658480@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 12=2E Februar 2022 19:30:43 MEZ schrieb Peter Maydell <peter=2Emaydell@l=
inaro=2Eorg>:
>On Sat, 12 Feb 2022 at 17:02, BALATON Zoltan <balaton@eik=2Ebme=2Ehu> wro=
te:
>>
>> On Sat, 12 Feb 2022, Peter Maydell wrote:
>> > On Sat, 12 Feb 2022 at 13:42, BALATON Zoltan <balaton@eik=2Ebme=2Ehu>=
 wrote:
>> >> By the way the corresponding member in struct PIIXState in
>> >> include/hw/southbridge/piix=2Eh has a comment saying:
>> >>
>> >>      /* This member isn't used=2E Just for save/load compatibility *=
/
>> >>      int32_t pci_irq_levels_vmstate[PIIX_NUM_PIRQS];
>> >>
>> >> and only seems to be filled in piix3_pre_save() but never used=2E So=
 what's
>> >> the point of this then? Maybe piix3 also uses a bitmap to store thes=
e
>> >> levels instead? There's a uint64_t pic_levels member above the unuse=
d
>> >> array but I haven't checked the implementation=2E
>> >
>> > I think what has happened here is that originally piix3 used
>> > the same implementation piix4 currently does -- where it stores
>> > locally the value of the (incoming) PCI IRQ levels, and then when it =
wants
>> > to know the value of the (outgoing) PIC IRQ levels it loops round
>> > to effectively OR together all the PCI IRQ levels for those PCI
>> > IRQs which are configured to that particular PIC interrupt=2E
>> >
>> > Then in commit e735b55a8c11 (in 2011) piix3 was changed to call
>> > pci_bus_get_irq_level() to get the value of a PCI IRQ rather than
>> > looking at its local cache of that information in the pci_irq_levels[=
]
>> > array=2E This is the source of the "save/load compatibility" thing --
>> > before doing a vmsave piix3_pre_save() fills in that field so that
>> > it appears in the outbound data stream and thus a migration from
>> > a new QEMU to an old pre-e735b55a8c11 QEMU will still work=2E (This
>> > was important at the time, but could probably be cleaned up now=2E)
>> >
>> > The next commit after that one is ab431c283e7055bcd, which
>> > is an optimization that fixes the equivalent of the "XXX: optimize"
>> > marker in the gt64120_pci_set_irq()/piix4 code -- this does
>> > something slightly more complicated involving the pic_levels
>> > field, in order to avoid having to do the "loop over all the
>> > PCI IRQ levels" whenever it needs to set/reset a PIC interrupt=2E
>> >
>> > We could pick up one or both (or none!) of these two changes
>> > for the piix4 code=2E (If we're breaking migration compat anyway
>> > we wouldn't need to include the save-load compat part of
>> > the first change=2E)
>>
>> I'm not sure I fully get this=2E Currently (before this series) PIIX4St=
ate
>> does not seem to have any fields to store irq state (in hw/isa/piix4=2E=
c):
>>
>> struct PIIX4State {
>>      PCIDevice dev;
>>      qemu_irq cpu_intr;
>>      qemu_irq *isa;
>>
>>      RTCState rtc;
>>      /* Reset Control Register */
>>      MemoryRegion rcr_mem;
>>      uint8_t rcr;
>> };
>>
>> Patch 1 in this series introduces that by moving it from MaltaState=2E =
Then
>> we could have a patch 2 to clean it up and change to the way piix3 does=
 it
>> and skip introducing the saving of this array into the migration state=
=2E It
>> may still break migration but not sure if MaltaState was saved already =
so
>> this may be already missing from migration anyway and if we do the same=
 as
>> piix3 then maybe we don't need to change the piix4 state either (as thi=
s
>> is saved as part of the PCIHost state?) but I don't know much about thi=
s
>> so maybe I'm wrong=2E
>
>Yeah, that would work -- we weren't saving the old gt64xxx_pci=2Ec
>pci_irq_levels[] global, so we don't break anything that wasn't
>already broken by not putting the newly-introduced PIIX4State
>array into migration state=2E Then when we do the equivalent of
>e735b55a8c11 the array can just be deleted again=2E (We can't
>conveniently switch to using pci_bus_get_irq_level() before doing
>patch 1 of this series, because we need the pointer to the
>piix4 device object and gt64120_pci_set_irq() is only passed
>a pointer directly to a qemu_irq array=2E)
>
>> In any case PIIX3 and PIIX4 state seem to be different so there's no
>> reason to worry aobut compatibility between them=2E
>
>Yep, that's right=2E The only reasons to copy changes from piix3
>are (a) because they're worth having in themselves and (b)
>because having the two devices be the same is maybe less
>confusing=2E (b)'s a pretty weak reason, and (a) depends on
>the individual change=2E In this case I think making the equivalent
>of e735b55a8c11 is worthwhile because it saves us having an
>extra array field and migrating it, and the change is pretty
>small=2E For ab431c283e7055bcd you could argue either way -- it's
>clearly a better way to structure the irq handling, but it's only
>an optimisation, not a bug fix=2E

e735b55a8c11 seems like a very elegant way for fixing migration of the IRQ=
 levels=2E I'll have a look=2E

Regards,
Bernhard
>
>-- PMM


