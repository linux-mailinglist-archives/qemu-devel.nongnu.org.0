Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E96861268B
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 02:07:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oovq9-00071K-7F; Sat, 29 Oct 2022 20:06:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1oovq6-0006w3-Jp
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 20:06:10 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1oovq1-0002o1-W5
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 20:06:10 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id EC7E05C007C;
 Sat, 29 Oct 2022 20:06:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sat, 29 Oct 2022 20:06:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1667088363; x=
 1667174763; bh=CDlQ823Yd5+LmwdqTc8iC2kdZCxR66ns+9Y/QszO2I0=; b=M
 OfOa6MZdvn/MqVdQvtBHjkn6BBo5WP6R3/jkaXXz5yKaLY3DYUYtwplyd+o9yKcn
 8JxOXnrp2TsmjZZ1Y3iIO7U9xxxgDKqXiCRdeagJJzGoHGN0ATfTwWZkCV5WKOQg
 hkawUh90OGsglDLONX3/I4bFo5Ighc1oAMDu4wKn2vSawkVUfv+7s/rETnyut+fY
 hszpXnF/ghy0NgI9Uyx5B2c9KX321MuViRqjV7tsMZlHbXNLJhHyOCkD3977LB7a
 qNQMXrKMXhj2Mpgv2FjJ5aZMzCrnhl8ThJvqFpWANWTHZEAYk3/jzrcUCsB2KGVn
 Htvqz1Jn7B9/y73+Gu+cA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667088363; x=
 1667174763; bh=CDlQ823Yd5+LmwdqTc8iC2kdZCxR66ns+9Y/QszO2I0=; b=q
 pm8dlkZugBsFdFZZxGmiK/4gxauNy4yqPPutr6XMxYehykKkl+2qu+jmcR8nb6YJ
 hkeX0E3zZJfUn+K9XFC25UQL5aYvcbKPImZkEYSzReKKawukWJOTRBuoZVM3yMtX
 mn0+/kJzt1UZygrytgjPNNgcuT1gUWXiibX8ZGuBvRKPD4qz1F5hR4fye5xaKeE4
 8jyauYbiOm+xGX24wpeTdYpmyQWgbEPwLYWXsAFjd50gfxv5DXLpCDwIQ1Ox/md7
 Y4/Du1H0FhcqwKJNWHsmhTp524VDngQtD4SGBdokUoQx77z1TQ3Shs0hZI1QAgQO
 avo8Rw8cFssfERcipUgWQ==
X-ME-Sender: <xms:679dYwTz-LhC-1diD5oom1jNIebF8eALFa542kXPrsKR8ZREY4wn6Q>
 <xme:679dY9ws-zO1FN2JpSiL5DmFoC5n1BRYMG1EcPlalk1SMz8NoN9G0g2bRfSKIFNQ_
 nrgh4SL2PxnE_AruJA>
X-ME-Received: <xmr:679dY90ZcOacs_1ZLpKnRPbS0th6zVvj0tH0fUYZiGyoLsipmXGcKZCaxTD3eWS2hncp>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrtdelgdefudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpegtggfuhfgjffevgffkfhfvofesthhqmhdthhdtjeenucfhrhhomheplfhirgig
 uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
 ggtffrrghtthgvrhhnpeejvdejuefhheehkeelgfeiveelvdekhfduvdekueffteegieev
 keehhfdvjefgtdenucffohhmrghinhepghhithhhuhgsrdgtohhmpdgrohhstgdrihhone
 cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgig
 uhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:679dY0D9lpe9aikTOXVSPil1T8rEvP3G4RybDAf90uC5J0ldRVZ-EQ>
 <xmx:679dY5gYFWZWPh-ykG66peF1CnMv9dACQkPH7-KAN4UGMYZzUe7wgA>
 <xmx:679dYwqlGmhN6Wj62LRniq--SwUlUYKs_6wo3NL95gzuN5cvuWQKJA>
 <xmx:679dY8ugwfVvT2FaQmpAb7bz335302pisI8iiU2VF0MHRUOFk8RErw>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 29 Oct 2022 20:06:02 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.300.51\))
Subject: Re: [PATCH 1/3] target/mips: Set CP0St_{KX, SX, UX} for Loongson-2F
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <f924f4c8-3e57-c412-874e-51ff8c578d59@linaro.org>
Date: Sun, 30 Oct 2022 01:05:51 +0100
Cc: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, pavel.dovgalyuk@ispras.ru
Content-Transfer-Encoding: quoted-printable
Message-Id: <401D3908-5616-4C4E-9D3B-3F40DE0A26E7@flygoat.com>
References: <20221029020030.13936-1-jiaxun.yang@flygoat.com>
 <20221029020030.13936-2-jiaxun.yang@flygoat.com>
 <5101ed53-5138-d40e-559e-1a3fd76a8c94@linaro.org>
 <2999BC9E-D7B6-4D17-9A28-E441B2C06E63@flygoat.com>
 <f924f4c8-3e57-c412-874e-51ff8c578d59@linaro.org>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
X-Mailer: Apple Mail (2.3731.300.51)
Received-SPF: pass client-ip=66.111.4.29; envelope-from=jiaxun.yang@flygoat.com;
 helo=out5-smtp.messagingengine.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



> 2022=E5=B9=B410=E6=9C=8830=E6=97=A5 00:19=EF=BC=8CPhilippe =
Mathieu-Daud=C3=A9 <philmd@linaro.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On 29/10/22 21:50, Jiaxun Yang wrote:
>>> 2022=E5=B9=B410=E6=9C=8829=E6=97=A5 18:44=EF=BC=8CPhilippe =
Mathieu-Daud=C3=A9 <philmd@linaro.org> =E5=86=99=E9=81=93=EF=BC=9A
>>>=20
>>> On 29/10/22 04:00, Jiaxun Yang wrote:
>>>> As per "Loongson-2F processor user manual", CP0St_{KX, SX, UX}
>>>> should is not writeable and hardcoded to 1.
>>>> Without those bits set, kernel is unable to access XKPHYS address
>>>> segmant. So just set them up on CPU reset.
>>>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>>> ---
>>>>  target/mips/cpu.c | 6 ++++++
>>>>  1 file changed, 6 insertions(+)
>>>> diff --git a/target/mips/cpu.c b/target/mips/cpu.c
>>>> index d0a76b95f7..a870901bfa 100644
>>>> --- a/target/mips/cpu.c
>>>> +++ b/target/mips/cpu.c
>>>> @@ -304,6 +304,12 @@ static void mips_cpu_reset(DeviceState *dev)
>>>>      env->CP0_EntryHi_ASID_mask =3D (env->CP0_Config5 & (1 << =
CP0C5_MI)) ?
>>>>              0x0 : (env->CP0_Config4 & (1 << CP0C4_AE)) ? 0x3ff : =
0xff;
>>>>      env->CP0_Status =3D (1 << CP0St_BEV) | (1 << CP0St_ERL);
>>>> +    if (env->insn_flags & INSN_LOONGSON2F) {
>>>> +        /* Loongson-2F has those bits hardcoded to 1 */
>>>> +        env->CP0_Status |=3D (1 << CP0St_KX) | (1 << CP0St_SX) |
>>>> +                            (1 << CP0St_UX);
>>>> +    }
>>>=20
>>> Don't we want to update CP0_Status_rw_bitmask in Loongson-2F
>>> entry in mips_defs[] instead?
>> Write to those bits is already disabled by CP0_Status_rw_bitmask. =
However real hardware
>> had those bits set to 1 but QEMU default them to 0=E2=80=A6
>> Enable writing to those bits can also make kernel work but it =
mismatches actual hardware
>> behavior.
>=20
> On "=E9=BE=99=E8=8A=AF 2F =E5=A4=84=E7=90=86=E5=99=A8=E7=94=A8=E6=88=B7=E6=
=89=8B=E5=86=8C (0.1 =E7=89=88, 2007 =E5=B9=B4 8 =E6=9C=88)"
> Section 5.10 Status =E5=AF=84=E5=AD=98=E5=99=A8(12) (page 57),
> CP0_Status bits 5..7 are 0.
>=20
> Can you share your "Loongson-2F processor user manual" doc?

Ah sorry the document was marked as =E2=80=9Ccompany confidential=E2=80=9D=
 so I=E2=80=99m not sure if I can share
the whole doc. It was updated in 2016 with version 1.8. The latest =
document I can find in wild
Is version 1.5 [1] but it didn=E2=80=99t cover newer chip reversions.

There is a footnote saying value of those bits was changed in later =
chips, to translate it says:

"Since LS2F04 those bits was refined to 1. As in LS2F we had implemented =
a single 64 bit addressing
model and it is mostly compatible with MIPS64 64 bit addressing =
model.=E2=80=9D

It is obvious that without KX and UX bit 64 bit kernel won=E2=80=99t =
work but my Lemote Fuloong box is running
64 bit kernel along with n64 AOSC/Retro [2] user-space rootfs. For SX =
bit as LS2F supports XSSEG it
should work as well, though nobody take MIPS supervisor mode serious :-)

[1]: https://github.com/loongson-community/docs/tree/master/2F
[2]: https://wiki.aosc.io/aosc-os/retro/intro/
---
Jiaxun Yang


