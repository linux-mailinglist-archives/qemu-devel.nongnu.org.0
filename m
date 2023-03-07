Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4295C6AF73E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 22:09:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZeYv-0005bX-RO; Tue, 07 Mar 2023 16:09:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1pZeYm-0005ZD-SF
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:09:24 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1pZeYk-0004CG-Su
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 16:09:24 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 582EC320029B;
 Tue,  7 Mar 2023 16:09:20 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 07 Mar 2023 16:09:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
 1678223359; x=1678309759; bh=lle/aZTFo2gU6m5lvFSMOvyyK+iCiOoZAHI
 TOBlRdO0=; b=JO+XWz/votOLpTsW43exitfjNRaKSW/xLkuO80MQvhmBSDy+sXz
 UcI6XZX1JeLww3UDWcpk+UPAPu78yWoiFMqPYoS7GV9+1CXzA90D39E530+SONQS
 28nrvhzWIv4dxraZHRapV/dbqXtkwx2VM9Epqa2xT7YDjc96EIDIpUZx68NLT6lM
 uxybOk4PILkM/KRlJw2t4cGss90tua+ENb0DO5MFNy0is4vkU7HE04iJDsFSoktv
 KGSs2COUrYv3dWsiNh2tSAZYK5QAKPz9Fq4C7nAQTdBm6DwQd8QJwv65tFaYY2hX
 JdQ6oJ9pwwTftFfn1rGXO/nxoKVPyHEGMRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1678223359; x=1678309759; bh=lle/aZTFo2gU6m5lvFSMOvyyK+iCiOoZAHI
 TOBlRdO0=; b=cRxi6iZ/CDkukXXBB4qsRQc4bEX1r5xXuhkbAKiWC+vO2PdJJmT
 QpBBSZCR5jESA9YG6pOhFpIsMyWjHHWJffUN6csDYs565rZalD9Kr/UUdbIt5tNv
 NxclhoEbYMhlMF1++FW/iyNB6lCNYHHJU3XfJ3+Xa3o5MXMXMyrPeVocnLG9C6H4
 ANYu2EahncHxtU1pSI726kaSuU6poouczSLw13LfzXUb9cF3hPqzj6T8JVz29NKl
 r1Vt5QeTYd0U6odIbJmEEH7zR7ES4fOAT1fpsLONuS/QveVDSEmwy9LfESlK4zTY
 r253XWThZJVpxisIu+hhvufwNneEA8hXn+Q==
X-ME-Sender: <xms:_6cHZI7uTlt1kIz1CuWp9SYVTGypMLmYzn-poaTK869hoXnErpZNpg>
 <xme:_6cHZJ5CzSHV4CAle1jIbgFQaX6USLb0BxaWg-y1dDBjfbN32wuD6Fe5qvVGtvTEg
 H4hjVrqMdrupbI4jOk>
X-ME-Received: <xmr:_6cHZHepRzP-V8QXGRPD8CpT6WVBympjFLjrrLdOKygqJzKHA-zh_fgpc5vFjZ5lsCFo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddutddgudeflecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpegtggfuhfgjffevgffkfhfvofesthhqmhdthhdtjeenucfhrhhomheplfhi
 rgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
 enucggtffrrghtthgvrhhnpedutdejffetteefkeejieehfeeuieeguedtveeijeeviefh
 ffelvdfgudeihfdvtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:_6cHZNJ9W-hQcrxvgoUysPV_mDTkBVEiZU3lu_Dj7pvat3tvzOedAg>
 <xmx:_6cHZMIC23cT8_ONNWZ7cyukz0BhjO1lJNfnwsEA6YaqRIGzIjkLiQ>
 <xmx:_6cHZOwUeRQ_YGRbbzgDg33SvIux34R9oTxq4M1cJm-yu5CO47d5Eg>
 <xmx:_6cHZGze_a3_GhltC7IYE9lPLhba4Iy245exry1WKIxQAwmqMK-Vpw>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Mar 2023 16:09:19 -0500 (EST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: [PATCH v2 2/2] hw/mips: Add MIPS virt board
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <93c0a866-74e8-8fad-07cf-79e964b73d84@linaro.org>
Date: Tue, 7 Mar 2023 21:09:08 +0000
Cc: QEMU devel <qemu-devel@nongnu.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C3FB79D4-D1B8-4A15-BC52-36BCDF2ECAE6@flygoat.com>
References: <20230304223803.55764-1-jiaxun.yang@flygoat.com>
 <20230304223803.55764-3-jiaxun.yang@flygoat.com>
 <93c0a866-74e8-8fad-07cf-79e964b73d84@linaro.org>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
X-Mailer: Apple Mail (2.3731.400.51.1.1)
Received-SPF: pass client-ip=64.147.123.20;
 envelope-from=jiaxun.yang@flygoat.com; helo=wout4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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



> 2023=E5=B9=B43=E6=9C=887=E6=97=A5 20:10=EF=BC=8CPhilippe =
Mathieu-Daud=C3=A9 <philmd@linaro.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On 4/3/23 23:38, Jiaxun Yang wrote:
>> MIPS virt board is design to utilize existing VirtIO infrastures
>> but also comptitable with MIPS's existing internal simulation tools.
>> It includes virtio-pci, virtio-mmio, pcie gpex, flash rom, fw_cfg,
>> goldfish-rtc and MIPS CPS system.
>> It should be able to cooperate with any MIPS CPU cores.
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> ---
>> v1:
>>  - Rename to virt board
>>  - Convert BIOS flash to ROM
>>  - Cleanups
>> v2:
>>  - Fix fdt flash
>>  - Remove UP variant
>> ---
>>  MAINTAINERS                             |   7 +
>>  configs/devices/mips-softmmu/common.mak |   1 +
>>  docs/system/target-mips.rst             |  22 +
>>  hw/mips/Kconfig                         |  17 +
>>  hw/mips/meson.build                     |   1 +
>>  hw/mips/virt.c                          | 916 =
++++++++++++++++++++++++
>>  6 files changed, 964 insertions(+)
>>  create mode 100644 hw/mips/virt.c
>=20
>=20
>> +static void virt_machine_init(MachineState *machine)
>> +{
>> +    MIPSVirtState *s =3D MIPS_VIRT_MACHINE(machine);
>> +    MemoryRegion *system_memory =3D get_system_memory();
>> +    const MemMapEntry *memmap =3D virt_memmap;
>> +    int i;
>> +
>> +    s->cpuclk =3D clock_new(OBJECT(machine), "cpu-refclk");
>> +    clock_set_hz(s->cpuclk, VIRT_CPU_REF_CLK_FREQ);
>> +
>> +    s->cps =3D MIPS_CPS(qdev_new(TYPE_MIPS_CPS));
>> +    object_property_set_str(OBJECT(s->cps), "cpu-type", =
machine->cpu_type,
>> +                            &error_fatal);
>> +    object_property_set_int(OBJECT(s->cps), "num-core", =
machine->smp.cpus,
>> +                            &error_fatal);
>> +    qdev_connect_clock_in(DEVICE(s->cps), "clk-in", s->cpuclk);
>> +    sysbus_realize(SYS_BUS_DEVICE(s->cps), &error_fatal);
>=20
> qemu-system-mips64el: Property 'mips-cps.num-core' not found
>=20
> I'm worried. I suppose you want this property:
>=20
>  DEFINE_PROP_UINT32("num-vp", MIPSCPSState, num_vp, 1),

Yes

>=20
> Is your series based on mainstream QEMU?


Whoops, rebasing issue not caught by CI=E2=80=A6

Accidentally leaked part of following patch into this one, was trying to =
fix SMP
support for earlier CPUs.

Apologise for this.

Thanks
- Jiaxun






