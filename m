Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C93412E0365
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 01:27:56 +0100 (CET)
Received: from localhost ([::1]:56650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krVWt-0002PW-Tx
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 19:27:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1krVVf-0001xJ-GB
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 19:26:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:33114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1krVVb-0007vC-W1
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 19:26:39 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id E5761229C5
 for <qemu-devel@nongnu.org>; Tue, 22 Dec 2020 00:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608596793;
 bh=Wk0fRqNwcCtk9k0NW7vqyypgT28fEtxMEMxQzJmua8E=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=bArGgCfLnZB5SC+VH0woBk26vc5O2up5j2ZNh/PG+gpCsvqWri67U2cW741dPLMmJ
 yMyxUIrkKG6yOZ7E68pOfOGkbYDupt+H1Mdj6dZZcvCVf00qqcLJdo4TprdX+HN7vD
 mz8/pUPs20q0ue9kbKmeifDPRlfCBcoB/w2pyFmhNgVhNBg7ie15TBL5C88dbFQktZ
 rEdA5SQc1OYG7gKSCArk6QL7Tt4mT9PkuMhJwoUHuQvIiKjWUjMsI6ZuDlZNoE761J
 PxPHnR/CDPt9KCTDaBdCmKKETDQ+pYKmFLhZ3XAR6c6z1l1+2oX8s/eGqzZIdtcW2X
 somYkGmF86KdA==
Received: by mail-il1-f170.google.com with SMTP id q5so10480715ilc.10
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 16:26:32 -0800 (PST)
X-Gm-Message-State: AOAM533TGMo3mCNacxcJDr6wBVUj8N39o+sgbWZH4+CUjv4rKePblb3d
 wh46d+mBaHpCXEqkkyUBeuI5dG+mIIGYcaplIpg=
X-Google-Smtp-Source: ABdhPJxI4T6AcjaZt+Ykg5X8lf3NLBhxLd7OSHV/532tCuJxNeLuRfVCaRj/b49Aw/ZXAVyjiAarfsWSf+NRaWGQMoA=
X-Received: by 2002:a92:2912:: with SMTP id l18mr18507561ilg.173.1608596792335; 
 Mon, 21 Dec 2020 16:26:32 -0800 (PST)
MIME-Version: 1.0
References: <20201219071235.35040-1-jiaxun.yang@flygoat.com>
 <20201219071235.35040-2-jiaxun.yang@flygoat.com>
In-Reply-To: <20201219071235.35040-2-jiaxun.yang@flygoat.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 22 Dec 2020 08:26:21 +0800
X-Gmail-Original-Message-ID: <CAAhV-H49pD4bH33qg1jBrCD7eOqM20ZcR-uM=3wi9sL7N5zGXQ@mail.gmail.com>
Message-ID: <CAAhV-H49pD4bH33qg1jBrCD7eOqM20ZcR-uM=3wi9sL7N5zGXQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] hw/mips/fuloong2e: Remove define
 DEBUG_FULOONG2E_INIT
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
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
Cc: Cleber Rosa <crosa@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Huacai Chen <chenhuacai@kernel.org>

On Sat, Dec 19, 2020 at 3:13 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote=
:
>
> Seems useless....
>
> Fixes: 051c190bce5 ("MIPS: Initial support of fulong mini pc (machine con=
struction)")
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/mips/fuloong2e.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
> index 9b0eb8a314..055b99e378 100644
> --- a/hw/mips/fuloong2e.c
> +++ b/hw/mips/fuloong2e.c
> @@ -48,8 +48,6 @@
>  #include "sysemu/reset.h"
>  #include "qemu/error-report.h"
>
> -#define DEBUG_FULOONG2E_INIT
> -
>  #define ENVP_PADDR              0x2000
>  #define ENVP_VADDR              cpu_mips_phys_to_kseg0(NULL, ENVP_PADDR)
>  #define ENVP_NB_ENTRIES         16
> --
> 2.29.2

