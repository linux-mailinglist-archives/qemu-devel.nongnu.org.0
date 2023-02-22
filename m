Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BDA69F2B8
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 11:30:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUmMv-00087j-1x; Wed, 22 Feb 2023 05:29:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1pUmMo-000879-L3
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 05:28:56 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1pUmMm-0003f1-NN
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 05:28:54 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 5DA6B5C0131;
 Wed, 22 Feb 2023 05:28:45 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 22 Feb 2023 05:28:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1677061725; x=
 1677148125; bh=eZKeWnPgCycYzzVWpyMcerij37Eh4qovBoiaYF157Pk=; b=i
 1CHDyn70VXpYg+OGM2sQy/5VPoF70EmwKhqK5Vyqy3zckl0CGc+CwT48+0Rmzck2
 T35b0z/Yt+dJF/F8JxYo5aNPD510wZrUuX8TfyXUenXGgvT3SctJou9A/YwN+ZF+
 akvZhwmEHFRYsHheFrMD3yBVyA8ebI+m/7YQznW1TQlP4go2bfvMDaq1DCJjk0YG
 UF9DGQXKUrU1/tsSXeEXoDI5fg+DV6hzU6xAGJ+etCCgw9SfcbkL0Lnmi0hKh3iE
 MqSXV6o/euhevGaVbq02E3rX8kur2hLMJ5Q5SlXM0BTWsYRlI3O3bzVwhIjA5SgA
 p75fETj3Bh5PK4EjcI8rg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1677061725; x=
 1677148125; bh=eZKeWnPgCycYzzVWpyMcerij37Eh4qovBoiaYF157Pk=; b=A
 Stafb2JMo6cq6v9/l1+g7d746Y5KEK/iKhWad+L4jq3H99Mggh4DaWT3cf7G0dJV
 9IkLZnyPv6Cud2BSThAS5KbCmOVW17fmJq+s5qNv95RzYIb5PQh8KUw+S0JR+hd2
 ZJhPcPGnWPkRMqQxHA3rO90TXAazv8NjY03L+2VD4SQ0uvc6+e4fGAEfbEEbQRYj
 inBjxfLgYMP2u8mk6S5ISat2R6gu0YcGk/JFnQ+oa8wop5PgGfesh1EaDUY5oNju
 yXbQj7q0vIgrGaQk9ybylQyMnHSjeyn3LUJ62MrY/Vf2QysUnT9eTWlr1JyP/3HT
 f6dPW6AjQQ0VbG7yjg5Lg==
X-ME-Sender: <xms:Xe71Y-nAhN6rD7b_lqeZbhiecEkhcUbmBVmHrUoMCUPqMA2xSoA10A>
 <xme:Xe71Y12VmTAnHvUbP96qEZKcqOK0DfWF2RT7D7xJfZak_DO0WiHBoV81Lleippe_r
 6fR4WpDAVWPa404KWQ>
X-ME-Received: <xmr:Xe71Y8p-svx9MOlbsqufHX7uG9hTshLKX6d270QS8RTvVWXdz8-AKkRqyhyOvUAiQt5Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudejledgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurheptggguffhjgffvefgkfhfvffosehtqhhmtdhhtdejnecuhfhrohhmpeflihgr
 gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
 cuggftrfgrthhtvghrnhepuddtjeffteetfeekjeeiheefueeigeeutdevieejveeihfff
 ledvgfduiefhvddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:Xe71YynkBEmCZK2XdETzGLfGZ-wOGQa8jcSS8d2bN4tC_xJMOGSo_g>
 <xmx:Xe71Y82_IZzCPFaeWK1rjZyv7S_tEItLaEEw-Qa3SQBgMtdrtsCM3g>
 <xmx:Xe71Y5t0k-TWvkgJmA6dKk-dpgg5YZgIaIrJMkiOK9KdU0m9F9OpMg>
 <xmx:Xe71Y5_rmv8pPcYAnA0rpNcmHlv6-mNHDcCnucDM_FiywBbpUaXItA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Feb 2023 05:28:43 -0500 (EST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.300.101.1.3\))
Subject: Re: [PATCH] linux-user/mips: Low down switchable NaN2008 requirement
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20230211173401.13902-1-jiaxun.yang@flygoat.com>
Date: Wed, 22 Feb 2023 10:28:31 +0000
Cc: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Content-Transfer-Encoding: quoted-printable
Message-Id: <AB7D213A-2A88-42E5-B142-BA6127103FCF@flygoat.com>
References: <20230211173401.13902-1-jiaxun.yang@flygoat.com>
To: BALATON Zoltan via <qemu-devel@nongnu.org>
X-Mailer: Apple Mail (2.3731.300.101.1.3)
Received-SPF: pass client-ip=66.111.4.28; envelope-from=jiaxun.yang@flygoat.com;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Ping=EF=BC=9F

> 2023=E5=B9=B42=E6=9C=8811=E6=97=A5 17:34=EF=BC=8CJiaxun Yang =
<jiaxun.yang@flygoat.com> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> Previously switchable NaN2008 requires fcsr31.nan2008 to be writable
> for guest. However as per MIPS arch spec this bit can never be =
writable.
> This cause NaN2008 ELF to be rejected by QEMU.
>=20
> NaN2008 can be enabled on R2~R5 processors, just make it available
> unconditionally.
>=20
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> linux-user/mips/cpu_loop.c | 3 +--
> 1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
> index d5c1c7941d..b5c2ca4a3e 100644
> --- a/linux-user/mips/cpu_loop.c
> +++ b/linux-user/mips/cpu_loop.c
> @@ -301,8 +301,7 @@ void target_cpu_copy_regs(CPUArchState *env, =
struct target_pt_regs *regs)
>     }
>     if (((info->elf_flags & EF_MIPS_NAN2008) !=3D 0) !=3D
>         ((env->active_fpu.fcr31 & (1 << FCR31_NAN2008)) !=3D 0)) {
> -        if ((env->active_fpu.fcr31_rw_bitmask &
> -              (1 << FCR31_NAN2008)) =3D=3D 0) {
> +        if (!(env->insn_flags & ISA_MIPS_R2)) {
>             fprintf(stderr, "ELF binary's NaN mode not supported by =
CPU\n");
>             exit(1);
>         }
> --=20
> 2.37.1 (Apple Git-137.1)
>=20


