Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6772DFC10
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 13:56:30 +0100 (CET)
Received: from localhost ([::1]:50550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krKjl-0006BM-8r
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 07:56:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1krKj0-0005mQ-JD
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 07:55:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:58130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1krKiz-0002so-2y
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 07:55:42 -0500
X-Gm-Message-State: AOAM5339vkxuOzHich1HOa2xRAuzYLDk7vS70YoYTGYTCh1DFWY65Ifg
 WPjA01hHRhvjCeiStmcwmCiIfgKAINhf0iRA7JM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608555339;
 bh=1HiAAAZcRaf6kxt2wHOcXSRRHiYlXdblXnqO2ThJwpc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=JtwXbaxviokO/5al5h1AvwxXitybDpLdP2C/fRkOGga7Y9CeN6kxsY7UAIlWby+YX
 iccnMZ9EFUUtp57zO/D+F9b08lwWD3v1bv40IISxgJbjVASxbdnI87ToI/o8sMPYLP
 CwkUOVytwZ6DoJ9o1CSw3aV5t3eciXcxcCtgU0MwvOnx9ip/2WtD3iHemKAjz+3K6W
 XxbJKNWAIE402w4dgGuX5KmtzVWXY7KHSsjBC4qtnj4wkADFzb4Pz8kIujBu/y1TlW
 nDW0XkFw5fPBZMe/mvMDDU4EsQl4/pcplzE1fTCNjtJuAiEWYq1dnemfkE4XAZCCh0
 sox5XWyBT38vQ==
X-Google-Smtp-Source: ABdhPJxFO7iY9FwTwjQTkmmH4oa90escGBeU6U/rmLBsyy/WMM6X3Bkj/cU7vhlCs8hOV7rcyiJfqkNklMEehh5lcBg=
X-Received: by 2002:a92:2912:: with SMTP id l18mr16024380ilg.173.1608555338859; 
 Mon, 21 Dec 2020 04:55:38 -0800 (PST)
MIME-Version: 1.0
References: <20201214003215.344522-1-f4bug@amsat.org>
 <20201214003215.344522-7-f4bug@amsat.org>
In-Reply-To: <20201214003215.344522-7-f4bug@amsat.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 21 Dec 2020 20:55:27 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6QG2ce=KeyubucWz344MV9h-1xaMoZMgjF-qA4OS1DxQ@mail.gmail.com>
Message-ID: <CAAhV-H6QG2ce=KeyubucWz344MV9h-1xaMoZMgjF-qA4OS1DxQ@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] linux-user: Add support for MIPS Loongson 2F/3A
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=198.145.29.99; envelope-from=chenhuacai@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Huacai Chen <chenhuacai@kernel.org>

On Mon, Dec 14, 2020 at 8:32 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Userland ELF binaries using Loongson SIMD instructions have the
> HWCAP_LOONGSON_MMI bit set [1].
> Binaries compiled for Loongson 3A [2] have the HWCAP_LOONGSON_EXT
> bit set for the LQ / SQ instructions.
>
> [1] commit 8e2d5831e4b ("target/mips: Legalize Loongson insn flags")
> [2] commit af868995e1b ("target/mips: Add Loongson-3 CPU definition")
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  linux-user/elfload.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 0836e72b5ac..a64050713f2 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -1024,6 +1024,8 @@ static uint32_t get_elf_hwcap(void)
>      GET_FEATURE_REG_EQU(CP0_Config0, CP0C0_AR, CP0C0_AR_LENGTH,
>                          2, HWCAP_MIPS_R6);
>      GET_FEATURE_REG_SET(CP0_Config3, 1 << CP0C3_MSAP, HWCAP_MIPS_MSA);
> +    GET_FEATURE_INSN(ASE_LMMI, HWCAP_LOONGSON_MMI);
> +    GET_FEATURE_INSN(ASE_LEXT, HWCAP_LOONGSON_EXT);
>
>      return hwcaps;
>  }
> --
> 2.26.2
>

