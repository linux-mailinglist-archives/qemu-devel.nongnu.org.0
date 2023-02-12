Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 410F5693777
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 13:52:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRBpU-0003Ik-65; Sun, 12 Feb 2023 07:51:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRBpR-0003II-Jl; Sun, 12 Feb 2023 07:51:37 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRBpP-0004QF-HY; Sun, 12 Feb 2023 07:51:37 -0500
Received: by mail-ed1-x52b.google.com with SMTP id d40so8344034eda.8;
 Sun, 12 Feb 2023 04:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MtKGmqoR8FgUp/OWyPdYDv+JFsJJ0yOsTpYRGG3YPXQ=;
 b=ANHVfopwYeURChEV1oVEjZPeh5eYO95XdE1ufugSPwzTRwbWn7YqCdg1CnL5hNfxIH
 VV3UIowtQmB0gEu36LRBPr4vtFfn6/f4QoZJJB/6FG3LfgRg4fJqUaH/f/tR9JNVDEc+
 rTssK5tnIGJ9Ad8ZWvSoRRatsTZZ0iA9sC0JcUaP+yb8Lb846c5O48nlADitvBnqHu5u
 BmD12V6O4AaQX2/y9V4XwLg/WbNvZ+vrFFlM6U5WmvE/ZGbpl1/KsaXfK1fCTF2bjOG+
 JyOBcrr3nCcSTq0LDIugg4nexGoEdJ4hwT4+9BI6FaGw67vGHGHH73qCeLfSxpBmJNUz
 +bgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MtKGmqoR8FgUp/OWyPdYDv+JFsJJ0yOsTpYRGG3YPXQ=;
 b=X+anZ4an0zr9LQbHakNVOwx2eSuNFKp5ZXO1pQfgyB3u/BA/ZwYPn8Zzv6OyPLoQdz
 vB17yP1IwpyXhR91RxModLJ78/P892Eu/0tZQ5kdSwIwRGNAJbdOFjXOB6yF1hkjKrSX
 a5gTBS0DKj/iBiopbpEw6F4LUFcv6ucDZqXHMiYW/jIBnxsUhGDP60ttpDKqs3AUh3jf
 ckmHUnpRANLylTkzjrYWAhK+ryXJcvu+xmqS70N71O3uhZMO5Mu1f049LKDINj06LRRW
 Xj7uDhr9cqF2kuR+UTDlg89D970cHAC6GyLS+l9j5ENOSKZUie9RBbTaXnYsUUJIMtNe
 YQqg==
X-Gm-Message-State: AO0yUKV2NsznOhDn7BaZ+ARQc2McTNm1jNtp7WEgFuAmV4cvihnJZfoL
 KKyfGvdq7X0g3tm2/LKCqLY=
X-Google-Smtp-Source: AK7set/EVPvATzu+PfYUX+7Qx5h8813o6tRMRt/hiiNfZg+FDLzUPaehhRH1ITVD9GIUnC1i6EZ91A==
X-Received: by 2002:a50:9310:0:b0:4ac:be7c:4bf9 with SMTP id
 m16-20020a509310000000b004acbe7c4bf9mr2254808eda.10.1676206292562; 
 Sun, 12 Feb 2023 04:51:32 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-011-172-153.77.11.pool.telefonica.de.
 [77.11.172.153]) by smtp.gmail.com with ESMTPSA id
 m3-20020a50d7c3000000b0049e1f167956sm5149505edj.9.2023.02.12.04.51.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Feb 2023 04:51:32 -0800 (PST)
Date: Sun, 12 Feb 2023 12:51:24 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
CC: John G Johnson <john.g.johnson@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>
Subject: Re: [PATCH v6 00/33] Consolidate PIIX south bridges
In-Reply-To: <75F7CD0D-1E37-41FF-B938-75D625537C6F@gmail.com>
References: <20230109172347.1830-1-shentey@gmail.com>
 <211e791a-9d37-9655-ca93-9e3bda2e21c3@linaro.org>
 <6D8095E7-E540-4D7E-B976-D71522F8664A@gmail.com>
 <752135A6-44DC-4504-8E16-C2E71EC76872@gmail.com>
 <9578e7ca-5f3d-2d00-7288-16ae486fb8c0@linaro.org>
 <36BB4E64-8163-44BA-B622-8943E1C1DCE8@gmail.com>
 <50FA07E9-C8DA-4D6E-9A87-F40BB9C2D324@gmail.com>
 <6f97d406-ff70-07b2-2477-c69420bff2a7@linaro.org>
 <75F7CD0D-1E37-41FF-B938-75D625537C6F@gmail.com>
Message-ID: <9DE39A37-9E76-4543-9BD7-D3644E305594@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 11=2E Februar 2023 16:23:10 UTC schrieb Bernhard Beschow <shentey@gmail=
=2Ecom>:
>
>
>Am 10=2E Februar 2023 17:11:06 UTC schrieb "Philippe Mathieu-Daud=C3=A9" =
<philmd@linaro=2Eorg>:
>>On 10/2/23 17:27, Bernhard Beschow wrote:
>>>=20
>>>=20
>>> Am 23=2E Januar 2023 15:51:49 UTC schrieb Bernhard Beschow <shentey@gm=
ail=2Ecom>:
>>>>=20
>>>>=20
>>>> Am 23=2E Januar 2023 09:25:51 UTC schrieb "Philippe Mathieu-Daud=C3=
=A9" <philmd@linaro=2Eorg>:
>>>>> On 20/1/23 13:22, Bernhard Beschow wrote:
>>>>>> Am 13=2E Januar 2023 17:39:45 UTC schrieb Bernhard Beschow <shentey=
@gmail=2Ecom>:
>>>>>>> Am 13=2E Januar 2023 08:46:53 UTC schrieb "Philippe Mathieu-Daud=
=C3=A9" <philmd@linaro=2Eorg>:
>>>>>>>> On 9/1/23 18:23, Bernhard Beschow wrote:
>>>>>>>>> This series consolidates the implementations of the PIIX3 and PI=
IX4 south
>>>>>>>>> bridges and is an extended version of [1]=2E The motivation is t=
o share as much
>>>>>>>>> code as possible and to bring both device models to feature pari=
ty such that
>>>>>>>>> perhaps PIIX4 can become a drop-in-replacement for PIIX3 in the =
pc machine=2E This
>>>>>>>>> could resolve the "Frankenstein" PIIX4-PM problem in PIIX3 discu=
ssed on this
>>>>>>>>> list before=2E
>>>>>>>>=20
>>>>>>>>> Bernhard Beschow (30):
>>>>>>>>>      hw/pci/pci: Factor out pci_bus_map_irqs() from pci_bus_irqs=
()
>>>>>>>>>      hw/isa/piix3: Decouple INTx-to-LNKx routing which is board-=
specific
>>>>>>>>>      hw/isa/piix4: Decouple INTx-to-LNKx routing which is board-=
specific
>>>>>>>>>      hw/mips/Kconfig: Track Malta's PIIX dependencies via Kconfi=
g
>>>>>>>>>      hw/usb/hcd-uhci: Introduce TYPE_ defines for device models
>>>>>>>>>      hw/intc/i8259: Make using the isa_pic singleton more type-s=
afe
>>>>>>>>>      hw/intc/i8259: Introduce i8259 proxy TYPE_ISA_PIC
>>>>>>>>>      hw/i386/pc: Create RTC controllers in south bridges
>>>>>>>>>      hw/i386/pc: No need for rtc_state to be an out-parameter
>>>>>>>>>      hw/i386/pc_piix: Allow for setting properties before realiz=
ing PIIX3
>>>>>>>>>        south bridge
>>>>>>>>>      hw/isa/piix3: Create USB controller in host device
>>>>>>>>>      hw/isa/piix3: Create power management controller in host de=
vice
>>>>>>>>>      hw/isa/piix3: Create TYPE_ISA_PIC in host device
>>>>>>>>>      hw/isa/piix3: Create IDE controller in host device
>>>>>>>>>      hw/isa/piix3: Wire up ACPI interrupt internally
>>>>>>>>>      hw/isa/piix3: Resolve redundant PIIX_NUM_PIC_IRQS
>>>>>>>>>      hw/isa/piix3: Rename pci_piix3_props for sharing with PIIX4
>>>>>>>>>      hw/isa/piix3: Rename piix3_reset() for sharing with PIIX4
>>>>>>>>>      hw/isa/piix3: Drop the "3" from PIIX base class
>>>>>>>>>      hw/isa/piix4: Make PIIX4's ACPI and USB functions optional
>>>>>>>>>      hw/isa/piix4: Remove unused inbound ISA interrupt lines
>>>>>>>>>      hw/isa/piix4: Use TYPE_ISA_PIC device
>>>>>>>>>      hw/isa/piix4: Reuse struct PIIXState from PIIX3
>>>>>>>>>      hw/isa/piix4: Rename reset control operations to match PIIX=
3
>>>>>>>>>      hw/isa/piix3: Merge hw/isa/piix4=2Ec
>>>>>>>>>      hw/isa/piix: Harmonize names of reset control memory region=
s
>>>>>>>>>      hw/isa/piix: Reuse PIIX3 base class' realize method in PIIX=
4
>>>>>>>>>      hw/isa/piix: Rename functions to be shared for interrupt tr=
iggering
>>>>>>>>>      hw/isa/piix: Consolidate IRQ triggering
>>>>>>>>>      hw/isa/piix: Share PIIX3's base class with PIIX4
>>>>>>>>>=20
>>>>>>>>> Philippe Mathieu-Daud=C3=A9 (3):
>>>>>>>>>      hw/mips/malta: Introduce PIIX4_PCI_DEVFN definition
>>>>>>>>>      hw/mips/malta: Set PIIX4 IRQ routes in embedded bootloader
>>>>>>>>>      hw/isa/piix4: Correct IRQRC[A:D] reset values
>>>>>>>>=20
>>>>>>>> I'm queuing the first 10 patches for now to alleviate the size of=
 this
>>>>>>>> series, and I'll respin a v7 with the rest to avoid making you su=
ffer
>>>>>>>> any longer :/ Thanks for insisting in this effort and I apologize=
 it
>>>>>>>> is taking me so long=2E=2E=2E
>>>>>>>=20
>>>>>>> Okay=2E=2E=2E What's the further plan? Is there anything missing?
>>>>>>=20
>>>>>> Ping
>>>>>=20
>>>>> The plan is "I'll respin a v7 with the rest"=2E
>>>>=20
>>>> I understood that part=2E I wonder what the blocking issue is/was=2E
>>>=20
>>> The first part of this series contains piix3 changes such as the ISA p=
roxy pic and movement of rtc=2E This seems the riskier part of the series t=
o me which I'd like to get feedback on from the field rather sooner than la=
ter=2E The reason is that I can't currently forsee how fast I could react i=
f these changes were merged during (soft) freeze=2E
>>
>>What bugs me is the i8259 proxy=2E
>
>I agree that it smells like a workaround for some problem elsewhere=2E
>
>The patch introducing the proxy to piix3 could be replaced by a patch mov=
ing:
>- isa_bus_irqs() into piix3's realize method and
>- `piix3->pic =3D x86ms->gsi;` in front of the realize call of piix3=2E
>
>Would that work for you? I could respin then=2E
>
>A first test run with the pc machine seems promising=2E The Malta machine=
 would need similar treatment=2E

v7 is out which doesn't need a PIC proxy=2E

Best regards,
Bernhard

>
>Best regards,
>Bernhard
>
>>I applied your patches locally, and am
>>trying to rework to avoid using it=2E I amend a 'Co-developed-by' tag
>>to patches modified:
>>https://docs=2Ekernel=2Eorg/process/submitting-patches=2Ehtml#when-to-us=
e-acked-by-cc-and-co-developed-by
>>

