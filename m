Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D94D6D81C0
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 17:27:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk51V-0001OP-RR; Wed, 05 Apr 2023 11:26:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1pk51T-0001Nb-T0
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 11:26:07 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1pk51P-0001Vg-DY
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 11:26:07 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id E4BA232008FF;
 Wed,  5 Apr 2023 11:25:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 05 Apr 2023 11:25:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1680708357; x=1680794757; bh=PDkc5H1/GAJA5VscVt78ezIODqxl/MI79y3
 nGl2cEcM=; b=E9BO5Njd2U6L1N4B79brRclrRsNb/ZcYI71Amtf+HgAQrOArl1F
 4XXVn2ozQXcnSbzkAV9rgxTfJNSCsW1pAeltLnWj3gt7ht39VhtvBhncgfSa6M7n
 3I5CBf0He4ZK+rOI/U5Je6ZQO9rZm0S0PV5UJnJHtvQYXJjMTDKxhGGIIOEz3+jZ
 tpcPkpOX8UJW6pIQ5Ltw7hf6FT65lSGo7o6VHQqSgDt7F9dizTMzGolmgqfJ+JPp
 xrMHxGYk7GQYhGohOxCnOXSzYZZAi4cUeCOKswuqOK+tgpthexPJuWQ/A5o78W8J
 8gIMR1LwRp60YNqHrpOUM5bbUoNzA9dyX6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1680708357; x=1680794757; bh=PDkc5H1/GAJA5VscVt78ezIODqxl/MI79y3
 nGl2cEcM=; b=kMfQnbVTdL0xQA1a+AR/OuHAwr9d2/+rCQGaVMiNelGZKNalQBa
 c6qWDUc3TZYQN3j2lqu7je913qV2ADBzWHx5AgCkr2DjAKeoitmBczinTdPF044a
 K9oz6bJG/gvhLehFHaKLjxoWJ2xpHLOnytwLtOlLhB8qb72zKuUO7iTGJA/5BSB/
 8XCui/sw4kn4cDqG+n9lO8l7JpzM1EkditAHkKj1mJABhFsjAWXAN+SL+CLw+K6/
 9C66QUem0C1VWzf0K4RRrx8Bcs3snRaBHm/6gk0Yf6VJf668MFRm9Av8Zp5vzifb
 ggUm+G/DVDFuTF6vKa5+pF2nkGwESW/Us6w==
X-ME-Sender: <xms:BZMtZMshvmLzO0gakJ38yRAnMqQugFJf4uUryGILo_JZhmG0fCdPUQ>
 <xme:BZMtZJfhalballVoTtfPz6vpjNZ-G8bNYBIOYDQq9NoXqzgjt2NPZpDQHyVMU2lmq
 T5SnJumKehktM_QejU>
X-ME-Received: <xmr:BZMtZHwPxLKlXVfINbnivd0PURO8dPfJIZtmg29K_zT413R6Hi1OI4_xNWxM_ihHcbho>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejuddgkeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurheptggguffhjgffvefgkfhfvffosehtqhhmtdhhtdejnecuhfhrohhmpeflihgr
 gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
 cuggftrfgrthhtvghrnhepuddtjeffteetfeekjeeiheefueeigeeutdevieejveeihfff
 ledvgfduiefhvddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:BZMtZPNrl1azev-hZUzbk_BC9A6bqTK0w1D7xx2aoYZcoYWdW38Bag>
 <xmx:BZMtZM8MvWM9oDSPRTARHsHtSR3nlpX1R-TvPiBV50JVHOElB6Wcfg>
 <xmx:BZMtZHUKuyJrEE40ddcS1IMfrmD6YUXztBcmDWyQpmdJSK4zY8o9Vg>
 <xmx:BZMtZOJECW460yb1G3pEVqFFUO4j6S6bxCoAMkEmUI-GkHqPBy_8oQ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Apr 2023 11:25:56 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: Re: [PATCH] linux-user: Fix mips fp64 executables loading
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20230404052153.16617-1-dkovalev@compiler-toolchain-for.me>
Date: Wed, 5 Apr 2023 16:25:45 +0100
Cc: QEMU devel <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <07963D66-809E-47D7-A842-B90F991A476C@flygoat.com>
References: <20230404052153.16617-1-dkovalev@compiler-toolchain-for.me>
To: Daniil Kovalev <dkovalev@compiler-toolchain-for.me>
X-Mailer: Apple Mail (2.3731.500.231)
Received-SPF: pass client-ip=64.147.123.20;
 envelope-from=jiaxun.yang@flygoat.com; helo=wout4-smtp.messagingengine.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



> 2023=E5=B9=B44=E6=9C=884=E6=97=A5 06:21=EF=BC=8CDaniil Kovalev =
<dkovalev@compiler-toolchain-for.me> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> If a program requires fr1, we should set the FR bit of CP0 control =
status
> register and add F64 hardware flag. The corresponding `else if` branch
> statement is copied from the linux kernel sources (see =
`arch_check_elf` function
> in linux/arch/mips/kernel/elf.c).
>=20
> Signed-off-by: Daniil Kovalev <dkovalev@compiler-toolchain-for.me>

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Thanks!

> ---
> linux-user/mips/cpu_loop.c | 5 ++++-
> 1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
> index d5c1c7941d..8735e58bad 100644
> --- a/linux-user/mips/cpu_loop.c
> +++ b/linux-user/mips/cpu_loop.c
> @@ -290,7 +290,10 @@ void target_cpu_copy_regs(CPUArchState *env, =
struct target_pt_regs *regs)
>             env->CP0_Status |=3D (1 << CP0St_FR);
>             env->hflags |=3D MIPS_HFLAG_F64;
>         }
> -    } else  if (!prog_req.fre && !prog_req.frdefault &&
> +    } else if (prog_req.fr1) {
> +        env->CP0_Status |=3D (1 << CP0St_FR);
> +        env->hflags |=3D MIPS_HFLAG_F64;
> +    } else if (!prog_req.fre && !prog_req.frdefault &&
>           !prog_req.fr1 && !prog_req.single && !prog_req.soft) {
>         fprintf(stderr, "qemu: Can't find a matching FPU mode\n");
>         exit(1);
> --=20
> 2.40.0
>=20


