Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A84473B750B
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 17:19:18 +0200 (CEST)
Received: from localhost ([::1]:40606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyFW9-0002hz-4c
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 11:19:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyFUa-0001xW-6h
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 11:17:40 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:39427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyFUY-00072I-Em
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 11:17:39 -0400
Received: by mail-ed1-x529.google.com with SMTP id j11so6295630edq.6
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 08:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=p1H/zadupZpMJDLuEL2puClu6Ke2qM3ZkkXF6xJnGv0=;
 b=HC/Ewis95Hptf4HnEZxT1PE14gFcfaINucLhpnbXQjmPRv/ulchQdlqRpLcoXhpqoI
 EdgpXL23oYln0t4gB1jrWaAqAbjwKhz1B1uU1Qrx5cQk7XeYzn/hyqyZWq1k5nGm9mJd
 sEm7y96ncUaHglvs0a5n/aTh9eIccOOKX81STg1cF9iLngSLA6g4mIdWfrGY0aVO3pAo
 eUCPlIUoKKE8PJ3CniQ/8ZQGvsLv7V0BAe4aGtu2m+bQER3VZABwpGAfmwEeMfVixG3t
 uLuI1LfdiY0/6wykh54SI32kuQPTGth2Yyrh8kSu2e0X3/CbMGm486HJxDhtQ1ExjZA1
 JBzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=p1H/zadupZpMJDLuEL2puClu6Ke2qM3ZkkXF6xJnGv0=;
 b=qeK5GAmLPsPqMS2dzH/I8k63Ca8BNEXAtm2HdNZPipawchfNy68xuuyQnmUWWhZ3OM
 Srk1yxDg9IhNdkMCW/wz40nO5LxGEbzIifKvZHjiZJibtV2KOJ5O3uRKH27L4RLooPV0
 Jy0XpPVPnpoMs1NGkeJYRqSaApz4qhju2HH+B06QSAHTOUtXwp9rdM4eMaohPZOiIxy8
 H8h6Pj+Xoltw2vetL0Wo0Sw+yzAMXQNS2dfPN3oKhzsnv5Fbx0GJyNjbGHwYRcXvZJvb
 4xIBEo5dMczzAUrmkxuLeeLx7Gl9ms/0lSJcAuQ3p9tJEkTiomMt74lymR/IHZaFHfnT
 11uA==
X-Gm-Message-State: AOAM531FMV3VYUTGXK78jvio2hTaYdOGkjgmN1Ux2MZ6SHJ1cY7h3Jga
 1Q3MVysFw5FyOKlB4dMqs0IFYsNU0EVWwv8lj8Airg==
X-Google-Smtp-Source: ABdhPJwg0yic9uYj4gfQl18KuU7u4+gtnTGc2tQXzbpGZQ7TsBMTwQlS0QpRtXn5mPYnPvLdj9HUBiAuDv/x+LBKLYA=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr39931822edt.100.1624979856824; 
 Tue, 29 Jun 2021 08:17:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210619091342.3660495-1-f4bug@amsat.org>
 <20210619091342.3660495-2-f4bug@amsat.org>
In-Reply-To: <20210619091342.3660495-2-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Jun 2021 16:16:59 +0100
Message-ID: <CAFEAcA-hnZjzZp+k7-9CT5gaqTvri049fOuk0HCHk7tvD8eJ9Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] coverity-scan: Remove lm32 / unicore32 targets
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 19 Jun 2021 at 10:13, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> lm32 has been removed in commit 9d49bcf6992 ("Drop the deprecated
> lm32 target"), and unicore32 in 4369223902a ("Drop the deprecated
> unicore32 target").
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  scripts/coverity-scan/COMPONENTS.md | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/scripts/coverity-scan/COMPONENTS.md b/scripts/coverity-scan/=
COMPONENTS.md
> index 02a3447dab0..183f26a32c9 100644
> --- a/scripts/coverity-scan/COMPONENTS.md
> +++ b/scripts/coverity-scan/COMPONENTS.md
> @@ -21,9 +21,6 @@ hppa
>  i386
>    ~ (/qemu)?((/include)?/hw/i386/.*|/target/i386/.*|/hw/intc/[^/]*apic[^=
/]*\.c)
>
> -lm32
> -  ~ (/qemu)?((/include)?/hw/lm32/.*|/target/lm32/.*|/hw/.*/(milkymist|lm=
32).*)
> -
>  m68k
>    ~ (/qemu)?((/include)?/hw/m68k/.*|/target/m68k/.*|(/include)?/hw(/.*)?=
/mcf.*)
>
> @@ -60,9 +57,6 @@ tilegx
>  tricore
>    ~ (/qemu)?((/include)?/hw/tricore/.*|/target/tricore/.*)
>
> -unicore32
> -  ~ (/qemu)?((/include)?/hw/unicore32/.*|/target/unicore32/.*)
> -
>  9pfs
>    ~ (/qemu)?(/hw/9pfs/.*|/fsdev/.*)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

NB that somebody will have to manually make the changes to the Coverity con=
fig
on the website as well.

thanks
-- PMM

