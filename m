Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF3D2E036A
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 01:29:42 +0100 (CET)
Received: from localhost ([::1]:59084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krVYb-0003RR-Rz
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 19:29:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1krVX4-0002oV-1g
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 19:28:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:33584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1krVX1-00005Y-MQ
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 19:28:05 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 65060229C5
 for <qemu-devel@nongnu.org>; Tue, 22 Dec 2020 00:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608596881;
 bh=JStX7+dUIvKonoiRpd4e1RDpxzEP4ktmJ3uNhtokaL8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=EkO/TY0FDA/MDTDfcgN9eY8lwkL5gbmAZfDPjwX7Jbnzbow0U07+IB0hlGHRgl+tt
 xIUyEnjI1jLJxGGlKZQY8TZ3FBbOPFdWBeq9w/E7VdhXvyWrjNWwmFpb8JxO2LW/c7
 v03HdpGmYfbD750nTja85kRLAnaiYCfPBlN5yUjUB1Bkc8Dq5SAtioyflb9pgOiisu
 vlk9wS8QuoQsQiwOtcU8T+ZAhaDK7oFMXCFgWvDHUUtL1dOCMqnDgmpQwhGFxt/Vjb
 RwhRtF08YmF5xSt+3oWEYjO/2mk+6fpfyg99GlVKes0LTgIYQFCiqqFzmAgqkwXwR+
 OLU0jSaGf+A3A==
Received: by mail-il1-f170.google.com with SMTP id r17so10466856ilo.11
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 16:28:01 -0800 (PST)
X-Gm-Message-State: AOAM531ujcbbEYQpl4CYO+QDX5h0GpKqbJ1IsB4HPFTG46x0tIho0w0L
 OkGVQa0Q5ClnmELWjLvq+uQgq0SdzwgpWJEWSAI=
X-Google-Smtp-Source: ABdhPJz5tR4gMfr2xGBZZ3uxXqbCzG4Hjvl8m/Skt1T2wrFxQE/kPVYK3fRfVojFUQbyC508uscyl1rVTYDgUqEt98A=
X-Received: by 2002:a92:870b:: with SMTP id m11mr17946031ild.134.1608596880884; 
 Mon, 21 Dec 2020 16:28:00 -0800 (PST)
MIME-Version: 1.0
References: <20201219071235.35040-1-jiaxun.yang@flygoat.com>
 <20201219072139.39347-1-jiaxun.yang@flygoat.com>
In-Reply-To: <20201219072139.39347-1-jiaxun.yang@flygoat.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 22 Dec 2020 08:27:49 +0800
X-Gmail-Original-Message-ID: <CAAhV-H631FcMgQeaJW=R_fGqbUYkmuLj46jEUugiy47pT3+E=Q@mail.gmail.com>
Message-ID: <CAAhV-H631FcMgQeaJW=R_fGqbUYkmuLj46jEUugiy47pT3+E=Q@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] hw/mips/fuloong2e: Remove unused env entry
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
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

On Sat, Dec 19, 2020 at 3:22 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
> modetty and busclock is not handled by kernel and the parameter
> here seems unreasonable.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  hw/mips/fuloong2e.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
> index d846ef7b00..c4843dd15e 100644
> --- a/hw/mips/fuloong2e.c
> +++ b/hw/mips/fuloong2e.c
> @@ -159,10 +159,8 @@ static uint64_t load_kernel(CPUMIPSState *env)
>      }
>
>      /* Setup minimum environment variables */
> -    prom_set(prom_buf, index++, "busclock=33000000");
>      prom_set(prom_buf, index++, "cpuclock=100000000");
>      prom_set(prom_buf, index++, "memsize=%"PRIi64, loaderparams.ram_size / MiB);
> -    prom_set(prom_buf, index++, "modetty0=38400n8r");
>      prom_set(prom_buf, index++, NULL);
>
>      rom_add_blob_fixed("prom", prom_buf, prom_size, ENVP_PADDR);
> --
> 2.29.2

