Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED4F39AEBD
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 01:35:59 +0200 (CEST)
Received: from localhost ([::1]:44822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lowsY-0006so-Qj
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 19:35:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lowrY-00063T-TL
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 19:34:56 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:40759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lowrU-0000g6-NK
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 19:34:56 -0400
Received: by mail-il1-x136.google.com with SMTP id b14so6888704ilq.7
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 16:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xoKBSvOHRjxBh3Xhae6nl3zslgdY34GFxp4VLxfsv4U=;
 b=DooH9GlsU0n3uDPQLkB7V/JFGUNafpRcS+OPct+B7T3Hq4T0xMdwpHclpi0tOg5zwW
 +CSaPks8krNR4aoxKDUl+Fall5QN9xO1IefnrcEkordwmhkcZ2fH3kTxfuzAUq6JCqNA
 w+vVX5SjPGoRvcFGE0PKFqlZ/5TCUKs1cZVYcNUPkAphqkoJF+wEqYqaw75m7JD/8h+X
 uuC93jTHMQB6eMELVsbvZjUYtEkLZHBKs0xStcovhOToxtc0DCEjEVrj5zd6SULGUep8
 SuQE6EyVRSLfgbzSwJ2P5ExTREu6WwkHm7tZBImJjs2ilSS1Xc0FjktjsQgHVxYqdOL4
 vZCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xoKBSvOHRjxBh3Xhae6nl3zslgdY34GFxp4VLxfsv4U=;
 b=VlcAX26vkVkwoLI0+NC6O/mafHeOcffpF5Kv/12iI86OHQ2tKdLHWIH1YqX44oHPb2
 0wbTu2+9Q2A226c5mAlR1R0yVoRplto+ihrKdoKIkA1YBiMkLj/YiSwy8vsgpT5g4cfV
 fRSXrf0ozgAEUqfi6gzpts7LQ8ws80ywhm90JlCXlEEaZA0cJMJh8l9tGo5arf4sZY4T
 sTx758MZmEHRHEl3FMdAoMRPDHbuuJ23ohQYMfiDfysbmjaehOS1OkuAOAGTqHQsypC3
 LPxkDM5L56wyMiUWybzoCif9vFcyFvq4pJsvwuQCTSMdUcZ5ObsGV6fWp08rf/L4bNSP
 EkBg==
X-Gm-Message-State: AOAM531W8L01lktvYSJpwSmdPSaacdK29NkIV8BLv73hPti5FjUzsJEC
 7iPVDlzoUCETSjOqsK9y5voh+fB7mw4b161Hv7E=
X-Google-Smtp-Source: ABdhPJzJ3UrJI/gTBf+IUjL0NDuAsPmUanfCLRBSaDVJLileNKZmAEtnmiQiGnmNh2GbbAHAf1cp/tKIiPpUTv9tZ70=
X-Received: by 2002:a05:6e02:eac:: with SMTP id
 u12mr1509769ilj.177.1622763291179; 
 Thu, 03 Jun 2021 16:34:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210603090310.2749892-1-f4bug@amsat.org>
 <20210603090310.2749892-2-f4bug@amsat.org>
In-Reply-To: <20210603090310.2749892-2-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 4 Jun 2021 09:34:25 +1000
Message-ID: <CAKmqyKMVOrb2db0A7w2QeAru7yBJFu_RR=fjc7L5tbhy8s1uKA@mail.gmail.com>
Subject: Re: [PATCH 1/6] target/microblaze: Use the IEC binary prefix
 definitions
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x136.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 3, 2021 at 7:03 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> IEC binary prefixes ease code review: the unit is explicit.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/microblaze/mmu.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/target/microblaze/mmu.c b/target/microblaze/mmu.c
> index cc40f275eaf..1481e2769f1 100644
> --- a/target/microblaze/mmu.c
> +++ b/target/microblaze/mmu.c
> @@ -19,14 +19,15 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "qemu/units.h"
>  #include "cpu.h"
>  #include "exec/exec-all.h"
>
>  static unsigned int tlb_decode_size(unsigned int f)
>  {
>      static const unsigned int sizes[] =3D {
> -        1 * 1024, 4 * 1024, 16 * 1024, 64 * 1024, 256 * 1024,
> -        1 * 1024 * 1024, 4 * 1024 * 1024, 16 * 1024 * 1024
> +        1 * KiB, 4 * KiB, 16 * KiB, 64 * KiB, 256 * KiB,
> +        1 * MiB, 4 * MiB, 16 * MiB
>      };
>      assert(f < ARRAY_SIZE(sizes));
>      return sizes[f];
> --
> 2.26.3
>
>

