Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C31612529
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 21:51:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oorrM-0001KU-FK; Sat, 29 Oct 2022 15:51:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1oorrK-0001De-Ai
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 15:51:10 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1oorrF-00088b-8r
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 15:51:10 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 4B5543200302;
 Sat, 29 Oct 2022 15:51:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sat, 29 Oct 2022 15:51:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1667073062; x=
 1667159462; bh=x4GpZVHiv5H0Zy0VuSh689Z/f6IKT+jKtrYD7zuvJj0=; b=X
 XgTYXdHDkpF9iydDmwWp8hWpj9aLZq3Sx4OeOsOiwjFlRp2CV//E/W/EFr5vkNbc
 SVeTJdl1SYipHSro7+BJJ2qvS1KgeIC83/dpKjho5ES2Ox6yq/E6JpwfNg/Uj3p1
 sTRvd4XyjAS1XrWKXz2//VD543k12w9h3z1x8GwaR2VsBrsWWQoWc3JG+09jDN/b
 hlG2mAJBuLlNLhexTde+ubOIzj9K6LweX8BtLtqi56EvRUFrpmq4HiGZ3ppT1i8a
 68ij3xYbqPgyeydOMkl4BWcMg62Y+z0ZPXLpedOL8W6SKRQOMd7r8e5S0N5qWUAs
 /nRH+30A6TMKQoEn5yazw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667073062; x=
 1667159462; bh=x4GpZVHiv5H0Zy0VuSh689Z/f6IKT+jKtrYD7zuvJj0=; b=A
 fniT0mcjq847L0SN6RYno4SpSRcH8uVc2nK6YFiX6EcScmZCAIvtqRN6Vbk/dT2x
 ifCjuxZ+uk8rolyD72onZ8w87Y9ZgZq6iG0LJ3rUGin5474C0AJb3HPMqpQzCoGL
 f6ph9YhiOAmb/F4wm5o2YfeXVTbcxtRYpbn58utbTzYRk1XFlz52iT/9fDog8WsR
 70qHrjNZJIHx6yokGUtGWKqi1o59tzASis1pcx96C2REDjwsg+ZAwgqV3Dw4b7dq
 BvRIXoSzDWV4fS6a2Xq9pfFDWNYozQyG6G5uL6ZQsYfPp8mWlGnbwO9/LmdBbNqk
 quf/DDTT/ArLRYuH+FVsQ==
X-ME-Sender: <xms:JoRdY5kKBIV6RljO1cfAm1tXPjyweuZNaGsBXrwSFg_-UW1LgngFPQ>
 <xme:JoRdY00VQP-8sFtWV12BlNtXg6GufUJNbDUHE6siMlGcWJZvgT6iHJEv9S4XW3gRb
 rrcP3_zRGVAIzIxuDg>
X-ME-Received: <xmr:JoRdY_qXyKFWBpzP68JaUCV1i0TtN8xBZ3shoGWQJrm0lCDQ5PPgjy1KnCewaEt-hqvQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrtdekgddugeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurheptggguffhjgffvefgkfhfvffosehtqhhmtdhhtdejnecuhfhrohhmpeflihgr
 gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
 cuggftrfgrthhtvghrnhepuddtjeffteetfeekjeeiheefueeigeeutdevieejveeihfff
 ledvgfduiefhvddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:JoRdY5m9TkYv27vtNHvG4475cUixTbR30vtpxAQraSvczFIhdlxZLA>
 <xmx:JoRdY330LWGn73jGiXwzkgj9-dzMLiep5IlWJGvxnmvDzWE0KA2GMQ>
 <xmx:JoRdY4sDXPRZcOpZTLqjq8VgAYm1xuKgkwyJHzOim9Shy_N69w2HQQ>
 <xmx:JoRdY1A0oseY0N2M4Wj-r80B8yXw4BoddG3NItw40AGnNBefJTEXoA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 29 Oct 2022 15:51:01 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.300.51\))
Subject: Re: [PATCH 1/3] target/mips: Set CP0St_{KX, SX, UX} for Loongson-2F
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <5101ed53-5138-d40e-559e-1a3fd76a8c94@linaro.org>
Date: Sat, 29 Oct 2022 20:50:50 +0100
Cc: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, pavel.dovgalyuk@ispras.ru
Content-Transfer-Encoding: quoted-printable
Message-Id: <2999BC9E-D7B6-4D17-9A28-E441B2C06E63@flygoat.com>
References: <20221029020030.13936-1-jiaxun.yang@flygoat.com>
 <20221029020030.13936-2-jiaxun.yang@flygoat.com>
 <5101ed53-5138-d40e-559e-1a3fd76a8c94@linaro.org>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
X-Mailer: Apple Mail (2.3731.300.51)
Received-SPF: pass client-ip=64.147.123.24;
 envelope-from=jiaxun.yang@flygoat.com; helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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



> 2022=E5=B9=B410=E6=9C=8829=E6=97=A5 18:44=EF=BC=8CPhilippe =
Mathieu-Daud=C3=A9 <philmd@linaro.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On 29/10/22 04:00, Jiaxun Yang wrote:
>> As per "Loongson-2F processor user manual", CP0St_{KX, SX, UX}
>> should is not writeable and hardcoded to 1.
>> Without those bits set, kernel is unable to access XKPHYS address
>> segmant. So just set them up on CPU reset.
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> ---
>>  target/mips/cpu.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>> diff --git a/target/mips/cpu.c b/target/mips/cpu.c
>> index d0a76b95f7..a870901bfa 100644
>> --- a/target/mips/cpu.c
>> +++ b/target/mips/cpu.c
>> @@ -304,6 +304,12 @@ static void mips_cpu_reset(DeviceState *dev)
>>      env->CP0_EntryHi_ASID_mask =3D (env->CP0_Config5 & (1 << =
CP0C5_MI)) ?
>>              0x0 : (env->CP0_Config4 & (1 << CP0C4_AE)) ? 0x3ff : =
0xff;
>>      env->CP0_Status =3D (1 << CP0St_BEV) | (1 << CP0St_ERL);
>> +    if (env->insn_flags & INSN_LOONGSON2F) {
>> +        /* Loongson-2F has those bits hardcoded to 1 */
>> +        env->CP0_Status |=3D (1 << CP0St_KX) | (1 << CP0St_SX) |
>> +                            (1 << CP0St_UX);
>> +    }
>=20
> Don't we want to update CP0_Status_rw_bitmask in Loongson-2F
> entry in mips_defs[] instead?

Write to those bits is already disabled by CP0_Status_rw_bitmask. =
However real hardware
had those bits set to 1 but QEMU default them to 0=E2=80=A6

Enable writing to those bits can also make kernel work but it mismatches =
actual hardware
behavior.

Thanks.
---
Jiaxun Yang


