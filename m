Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A7C4AB2F2
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 01:29:29 +0100 (CET)
Received: from localhost ([::1]:54590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGruK-0006T8-GR
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 19:29:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nGrsJ-0005ln-TD
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 19:27:23 -0500
Received: from [2607:f8b0:4864:20::d2d] (port=45640
 helo=mail-io1-xd2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nGrsI-0003U4-8M
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 19:27:23 -0500
Received: by mail-io1-xd2d.google.com with SMTP id s18so14735329ioa.12
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 16:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Yd4/jcsMH7+OGbi0tGsfrSHTaZEUxnQqL1OQPVmI83c=;
 b=Hc2EPWh1m8aCwqZw4p2lrYEkDReZ3Iz/LvmzTBAjhdvvJ0AiGb7JM1uL8R8rBziQke
 hTNPR8fJRCaZM4G3NVvksItgc2O/zm842/NZoXfFywKI244neZ9Hg4jGFDDRjMzjVc/K
 53osVgSWMGRYzu8+UUo3uOYkOdgcoUupBN8aypZAoFFUTsB8zDXNgciDrVkbCF7oC+qn
 z2+PvYf4t9rM3/bxW0D32l9PCVlUxDPTberIqG6D0wAog4Tb8tKZmew+9uJrMvJiIjhz
 Ks1FzXBdC15dCNuIqk7N5lfC3Wd4btDnda9NN2iTNQU+VlitNoXsJWqwO8ssOwDOWV+a
 iupA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Yd4/jcsMH7+OGbi0tGsfrSHTaZEUxnQqL1OQPVmI83c=;
 b=STcxKWiQjjF164aUBizct5ELRKVvdFYkkiglctmmlQuGDQHfDQ0t1TbsG2NKfosGsu
 DQQAlrUipU92Qs/eCMVPIxlViia+m0nNsxhL0S8ZXBVQ5/mWx1rlwqMMT6iTdwE/UXhb
 1SqhfJzoa8QohLmUqd9PSBmmhq4XWOhUIYKBzvdEp8ALIf/bxBH+b3jw4VDxoHPKdLTu
 Wz1G0gKGmu36oZqRLigPLdsRM2v1LrUvrKyfCy6KRj03gnGNWapPUNkfipRarGBjWcro
 9A4J1qwfRQ8BhgHCsY4MVWTrvbk0bPBOjHrtG5OYqxAd80HGiTMcUFomi/J7ibliTJkr
 Iidg==
X-Gm-Message-State: AOAM530YGrJglO4ul+UZtIkml45dzc1/C5IHTbdw6zhXKrmIrpqlt11F
 7OkdFVl0XcHMA7OmU7s39AQWOA+Tl6DKRa/06to=
X-Google-Smtp-Source: ABdhPJypNzmkh3JzPNEiJ+K3vo61KCR1z6g++pgszxG0po9TxMZBtchTjfpSDGcgq4zIwdtuE/+TYPIEtwpJAKnrXLA=
X-Received: by 2002:a6b:4406:: with SMTP id r6mr4440180ioa.57.1644193640486;
 Sun, 06 Feb 2022 16:27:20 -0800 (PST)
MIME-Version: 1.0
References: <20220203193803.45671-1-f4bug@amsat.org>
 <20220203193803.45671-9-f4bug@amsat.org>
In-Reply-To: <20220203193803.45671-9-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 7 Feb 2022 10:26:54 +1000
Message-ID: <CAKmqyKPtZ+hacmY+Y2_0ZsdLft+ZPBZEeFxCwrkD7bGMBY2Jaw@mail.gmail.com>
Subject: Re: [PATCH 08/10] target: Add missing "qemu/timer.h" include
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 4, 2022 at 6:35 AM Philippe Mathieu-Daud=C3=A9 via
<qemu-devel@nongnu.org> wrote:
>
> cpu_get_host_ticks() and NANOSECONDS_PER_SECOND are declared
> in "qemu/timer.h".
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/arm/cpu.c      | 1 +
>  target/arm/helper.c   | 1 +
>  target/hppa/cpu.c     | 1 +
>  target/riscv/csr.c    | 1 +
>  target/sparc/helper.c | 1 +
>  5 files changed, 5 insertions(+)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index cdbc4cdd01..9555f6707b 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -20,6 +20,7 @@
>
>  #include "qemu/osdep.h"
>  #include "qemu/qemu-print.h"
> +#include "qemu/timer.h"
>  #include "qemu-common.h"
>  #include "target/arm/idau.h"
>  #include "qemu/module.h"
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 6dd241fbef..e39faa2a98 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -15,6 +15,7 @@
>  #include "exec/helper-proto.h"
>  #include "qemu/host-utils.h"
>  #include "qemu/main-loop.h"
> +#include "qemu/timer.h"
>  #include "qemu/bitops.h"
>  #include "qemu/crc32c.h"
>  #include "qemu/qemu-print.h"
> diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
> index 37b763fca0..5f46ba801e 100644
> --- a/target/hppa/cpu.c
> +++ b/target/hppa/cpu.c
> @@ -21,6 +21,7 @@
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "qemu/qemu-print.h"
> +#include "qemu/timer.h"
>  #include "cpu.h"
>  #include "qemu/module.h"
>  #include "exec/exec-all.h"
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index a4db40769b..45f04c701a 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -19,6 +19,7 @@
>
>  #include "qemu/osdep.h"
>  #include "qemu/log.h"
> +#include "qemu/timer.h"
>  #include "cpu.h"
>  #include "qemu/main-loop.h"
>  #include "exec/exec-all.h"
> diff --git a/target/sparc/helper.c b/target/sparc/helper.c
> index c7bcaa3a20..c4358bba84 100644
> --- a/target/sparc/helper.c
> +++ b/target/sparc/helper.c
> @@ -20,6 +20,7 @@
>  #include "qemu/osdep.h"
>  #include "cpu.h"
>  #include "exec/exec-all.h"
> +#include "qemu/timer.h"
>  #include "qemu/host-utils.h"
>  #include "exec/helper-proto.h"
>
> --
> 2.34.1
>
>

