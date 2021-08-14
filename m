Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A363EBFCC
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Aug 2021 04:41:54 +0200 (CEST)
Received: from localhost ([::1]:47946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEjcP-0002Ph-4p
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 22:41:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1mEjbI-00016s-VE
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 22:40:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:57380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1mEjbG-0006td-U3
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 22:40:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5E93760EE4
 for <qemu-devel@nongnu.org>; Sat, 14 Aug 2021 02:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628908839;
 bh=SAha39pYTQjwawyz8R6VmLBz0A0xDZvLlcu2YMg8TYY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=UzxvD4wDWiK2++nW0G8+JT8qWUsiGbxpqg9jZm9in85EcySoZWt4fHOcnfNhRX0XS
 cfgd2vmB+AblKgWXBUKp+cHjBPlCRKfLzUgGjmYHaRGbOAmzPOjjUW2yqeLTEwFHzO
 pGCHcDPXZx+uzGvP2/DR8Zwp9eRxMgzMuy0PpXCLqsWpACltgCU4cJb7T0JMPiz33b
 xEcFTaUIlFmHYW7Yhdqm4JGeNPpy1V6ojKNFZTzHDVJyAE4Hjjqd3V2Vzi8bhd/WHS
 N6pz6rrK0N0Iz/kdAR6G1ohzJgFCyA3vtn/TKph1NAjstN9NFhj9UxMs4Y+xiI3wsp
 zhTzIBRmqjWEw==
Received: by mail-io1-f52.google.com with SMTP id f11so15772929ioj.3
 for <qemu-devel@nongnu.org>; Fri, 13 Aug 2021 19:40:39 -0700 (PDT)
X-Gm-Message-State: AOAM531j5g6Bv+frfxKKKl+jiSO6K1c+TfmqEUE7O8sertyggrNIvoP3
 ffSm5+T32DTKKfvnVaO7T8kv15sy9KDtDnw1rxk=
X-Google-Smtp-Source: ABdhPJz48IP5EpGhnUX6YTjobb1OTOtXnaD3NbmlYMBIOspkWpbpmUOOK4ZL1ViERYh817a1gBsrbSE0C1Il/j1rFjM=
X-Received: by 2002:a02:c502:: with SMTP id s2mr5044324jam.135.1628908838843; 
 Fri, 13 Aug 2021 19:40:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210813110149.1432692-1-f4bug@amsat.org>
 <20210813110149.1432692-2-f4bug@amsat.org>
In-Reply-To: <20210813110149.1432692-2-f4bug@amsat.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 14 Aug 2021 10:40:27 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7qj9QNYJtOKPAtp+UV7DjDypFvhhD3fsj-UfNLUFyz=g@mail.gmail.com>
Message-ID: <CAAhV-H7qj9QNYJtOKPAtp+UV7DjDypFvhhD3fsj-UfNLUFyz=g@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/mips: Document Loongson-3A CPU definitions
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=198.145.29.99; envelope-from=chenhuacai@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -77
X-Spam_score: -7.8
X-Spam_bar: -------
X-Spam_report: (-7.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

On Fri, Aug 13, 2021 at 7:01 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Document the cores on which each Loongson-3A CPU is based (see
> commit af868995e1b, "target/mips: Add Loongson-3 CPU definition").
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  target/mips/cpu-defs.c.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/mips/cpu-defs.c.inc b/target/mips/cpu-defs.c.inc
> index e03b2a998cd..c6ab3af190e 100644
> --- a/target/mips/cpu-defs.c.inc
> +++ b/target/mips/cpu-defs.c.inc
> @@ -805,7 +805,7 @@ const mips_def_t mips_defs[] =3D
>          .mmu_type =3D MMU_TYPE_R4000,
>      },
>      {
> -        .name =3D "Loongson-3A1000",
> +        .name =3D "Loongson-3A1000", /* Loongson-3A R1, GS464-based */
>          .CP0_PRid =3D 0x6305,
>          /* 64KB I-cache and d-cache. 4 way with 32 bit cache line size. =
 */
>          .CP0_Config0 =3D MIPS_CONFIG0 | (0x1 << CP0C0_AR) | (0x2 << CP0C=
0_AT) |
> @@ -835,7 +835,7 @@ const mips_def_t mips_defs[] =3D
>          .mmu_type =3D MMU_TYPE_R4000,
>      },
>      {
> -        .name =3D "Loongson-3A4000", /* GS464V-based */
> +        .name =3D "Loongson-3A4000", /* Loongson-3A R4, GS464V-based */
>          .CP0_PRid =3D 0x14C000,
>          /* 64KB I-cache and d-cache. 4 way with 32 bit cache line size. =
 */
>          .CP0_Config0 =3D MIPS_CONFIG0 | (0x1 << CP0C0_AR) | (0x2 << CP0C=
0_AT) |
> --
> 2.31.1
>

