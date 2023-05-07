Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 705BE6F9CAC
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 01:17:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvncz-0001NC-3f; Sun, 07 May 2023 19:17:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pvncy-0001N4-3o
 for qemu-devel@nongnu.org; Sun, 07 May 2023 19:17:16 -0400
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pvncw-0006JI-I3
 for qemu-devel@nongnu.org; Sun, 07 May 2023 19:17:15 -0400
Received: by mail-ua1-x929.google.com with SMTP id
 a1e0cc1a2514c-77e80c37af1so1021480241.0
 for <qemu-devel@nongnu.org>; Sun, 07 May 2023 16:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683501433; x=1686093433;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HSGD+EiuucVwI+BT6BCzbxfHiNT4JMn74+3qCj0G/jU=;
 b=mrlbl3j267K/Sx38LOXgv5EJKal91HpXwRBUB6avyvUOuGP8JSbRmo2MZRNVCY3YqO
 lnaWyqEe5x5mq8VBzawloUIkcmLMWMEUlLO0/31d1dxJalBSEIRi4UkDlkKo4ARNRHmZ
 FVatUzoas2jRbkIxmB8g5LLy78OOUelKEz6u8RmUomTU4Viy0GVbHozMNxGyHOCqWfZa
 TyBM6r5vBVj7rwOOqKFY8BTO2/Ng4SLDJGCzM2F9kvdPnCLfiWDJ45FaUo6usOnjVz/3
 cBX95l/yBsraqClFiOS7UYWfmmiRYRyTK3NR9b7GaPLs/chYwoXxjHS4fQFP+GK3FhZq
 awqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683501433; x=1686093433;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HSGD+EiuucVwI+BT6BCzbxfHiNT4JMn74+3qCj0G/jU=;
 b=VBajIEtuf0b1sEq6TLOFDaSqA3clvIF9yq+1tatjs6rPhFx/6W6qV4lPA9XXWvVui7
 TQAi3T5IYSwfcZ0EHdBbTH63FhtH8x5lnMh0fE12kSSImEeWhi4+6Wl/mO78pdaIeeN1
 HzriT4gC43tcAMke/UX6IBeKlbRFKDeU+jInWkAicoJYe+M4UDR4P0iiL+e1yAwVlUmq
 /AOz3MLUmKAbUYWeFwsUmAubqJ+7zBN1bAJ56RZZqy3Z/SO1d8UNRDAxykFAjCREyrRL
 NnjgYo6rgls1QwzksscLowFbTnkOsdJ2Dg0zcAKW32MwbJbymQWj02WJCbIve4KevNUP
 0S4Q==
X-Gm-Message-State: AC+VfDwDinPZcnID68ZnTC2QC1wd++5UyB3cyvcfwPy5MHeNqkThf/ZV
 hMNLiKgovzBcXOwIIwGmU3eEP15Ps9b+UyVKFDtJjMbXfwY=
X-Google-Smtp-Source: ACHHUZ6maCCCpcH1lLZYuYH9M4oLGulZUtUypoECEcRsmp1hvabkjXGl8wDavh/BwxjFp8jdNOJ0ea6ZnGtx8wLyxYY=
X-Received: by 2002:a05:6102:2ec:b0:434:7734:f7bf with SMTP id
 j12-20020a05610202ec00b004347734f7bfmr2369210vsj.18.1683501433200; Sun, 07
 May 2023 16:17:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230428093214.10289-1-peterlin@andestech.com>
In-Reply-To: <20230428093214.10289-1-peterlin@andestech.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 8 May 2023 09:16:47 +1000
Message-ID: <CAKmqyKPZ5DKXjhMfEVPa7SWoOvtmfW+q6-V78R7b1ROOxS3GzA@mail.gmail.com>
Subject: Re: [PATCH 1/2] target: riscv: fix typos
To: Yu Chien Peter Lin <peterlin@andestech.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::929;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x929.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, Apr 28, 2023 at 7:33=E2=80=AFPM Yu Chien Peter Lin
<peterlin@andestech.com> wrote:
>
> Fix a few minor typos for PMU events.
>
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h        | 2 +-
>  target/riscv/cpu_helper.c | 2 +-
>  target/riscv/pmu.c        | 8 ++++----
>  3 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 638e47c75a..eab518542c 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -812,7 +812,7 @@ enum riscv_pmu_event_idx {
>      RISCV_PMU_EVENT_HW_INSTRUCTIONS =3D 0x02,
>      RISCV_PMU_EVENT_CACHE_DTLB_READ_MISS =3D 0x10019,
>      RISCV_PMU_EVENT_CACHE_DTLB_WRITE_MISS =3D 0x1001B,
> -    RISCV_PMU_EVENT_CACHE_ITLB_PREFETCH_MISS =3D 0x10021,
> +    RISCV_PMU_EVENT_CACHE_ITLB_READ_MISS =3D 0x10021,
>  };
>
>  /* CSR function table */
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index f88c503cf4..5d3e032ec9 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -1210,7 +1210,7 @@ static void pmu_tlb_fill_incr_ctr(RISCVCPU *cpu, MM=
UAccessType access_type)
>
>      switch (access_type) {
>      case MMU_INST_FETCH:
> -        pmu_event_type =3D RISCV_PMU_EVENT_CACHE_ITLB_PREFETCH_MISS;
> +        pmu_event_type =3D RISCV_PMU_EVENT_CACHE_ITLB_READ_MISS;
>          break;
>      case MMU_DATA_LOAD:
>          pmu_event_type =3D RISCV_PMU_EVENT_CACHE_DTLB_READ_MISS;
> diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
> index fa1e1484c2..0be0e8027b 100644
> --- a/target/riscv/pmu.c
> +++ b/target/riscv/pmu.c
> @@ -62,17 +62,17 @@ void riscv_pmu_generate_fdt_node(void *fdt, int num_c=
trs, char *pmu_name)
>     fdt_event_ctr_map[4] =3D cpu_to_be32(0x00000002);
>     fdt_event_ctr_map[5] =3D cpu_to_be32(cmask | 1 << 2);
>
> -   /* SBI_PMU_HW_CACHE_DTLB : 0x03 READ : 0x00 MISS : 0x00 type(0x01) */
> +   /* SBI_PMU_HW_CACHE_DTLB : 0x03 READ : 0x00 MISS : 0x01 type(0x01) */
>     fdt_event_ctr_map[6] =3D cpu_to_be32(0x00010019);
>     fdt_event_ctr_map[7] =3D cpu_to_be32(0x00010019);
>     fdt_event_ctr_map[8] =3D cpu_to_be32(cmask);
>
> -   /* SBI_PMU_HW_CACHE_DTLB : 0x03 WRITE : 0x01 MISS : 0x00 type(0x01) *=
/
> +   /* SBI_PMU_HW_CACHE_DTLB : 0x03 WRITE : 0x01 MISS : 0x01 type(0x01) *=
/
>     fdt_event_ctr_map[9] =3D cpu_to_be32(0x0001001B);
>     fdt_event_ctr_map[10] =3D cpu_to_be32(0x0001001B);
>     fdt_event_ctr_map[11] =3D cpu_to_be32(cmask);
>
> -   /* SBI_PMU_HW_CACHE_ITLB : 0x04 READ : 0x00 MISS : 0x00 type(0x01) */
> +   /* SBI_PMU_HW_CACHE_ITLB : 0x04 READ : 0x00 MISS : 0x01 type(0x01) */
>     fdt_event_ctr_map[12] =3D cpu_to_be32(0x00010021);
>     fdt_event_ctr_map[13] =3D cpu_to_be32(0x00010021);
>     fdt_event_ctr_map[14] =3D cpu_to_be32(cmask);
> @@ -317,7 +317,7 @@ int riscv_pmu_update_event_map(CPURISCVState *env, ui=
nt64_t value,
>      case RISCV_PMU_EVENT_HW_INSTRUCTIONS:
>      case RISCV_PMU_EVENT_CACHE_DTLB_READ_MISS:
>      case RISCV_PMU_EVENT_CACHE_DTLB_WRITE_MISS:
> -    case RISCV_PMU_EVENT_CACHE_ITLB_PREFETCH_MISS:
> +    case RISCV_PMU_EVENT_CACHE_ITLB_READ_MISS:
>          break;
>      default:
>          /* We don't support any raw events right now */
> --
> 2.34.1
>
>

