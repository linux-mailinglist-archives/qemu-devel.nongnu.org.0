Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 303B06B3525
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 05:07:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paU0z-00052u-BY; Thu, 09 Mar 2023 23:05:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1paU0x-00052K-JU
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 23:05:55 -0500
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1paU0v-0003DI-Qp
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 23:05:55 -0500
Received: by mail-ua1-x935.google.com with SMTP id bx14so2723082uab.0
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 20:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678421152;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=84LHOwV0CqRO/Vled2a8spha4tV4lM7tIuIXyx0RFvA=;
 b=WiAPbVTphivm8MEbHE/352iRN8YcnFWXaiDAatc0SkBKH3s/mIpwLi6V3nPYU5h1/l
 qm7lYCDitM8noWv7KUd+yO7nPDZ8Qn+B/fuYgNkEXY/utd/dge13Rx9GDO4ZCjGHw32w
 zj42C7J8NnvjTF4Lsh8kmAj6rHQZpjrOnbM0PKoi2FaKSx2At6g8jevY5pjNLIghjJv9
 goHdwHbf8tJgUKaxGnfjYES6/Z1ynUMktBl7qJGqAeRx5IrmPE5j47jJW2EL4XCETFZD
 R3MlepF8VF+Ay0OA5Wsma0/MFY86gS/Rr1Z3qooGfQVOC8jQOlqyMw0RSDu3naGFTDeq
 VLqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678421152;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=84LHOwV0CqRO/Vled2a8spha4tV4lM7tIuIXyx0RFvA=;
 b=Jixt33jdOZu3i9dSxBSNv/CqCZRwT/ne67yB882GwBw5sMSkmdGPCKuVUxkq2b1h/a
 pSYQtewdSh4ZZlFuEwc+FimiCJTiivUBec7kJQWc8FN1XFJ/k8J5DgS4k/7NyX8juczA
 RELqEVBkFFYsb1TQqPTEULQo1qp4QDxNOC4qU3GIfpU3oTtwdMGomjk562QQtSkcx2+l
 OVw4hc40uZeqrEpxYbSP9gex3JbQJ7Q9h+CfAxV35djRYk5pP3/L7PEPPQFuyv97o/xk
 jluk6l6jC2+MtXkisbZakjCRBjAJaQUa1kwEMrE7eYVecakr5LTkiazhIwlXjYqqzBb+
 44gA==
X-Gm-Message-State: AO0yUKV0x9daV7ubLs0sVophojGIhdD42dn1jy0TzZGoYYaezGFNFk/O
 GjWtTUX4o2AVqpwLvshMuzP0diMFk6i7FuiYDWw=
X-Google-Smtp-Source: AK7set/y2y9pjw3wD8KpNaGCieOIkvtps7INlCx1hftwGHrTXS066Hpq1fbfLW+ecxLRj/SkCGGNc7AqUO3Ml9XdJlo=
X-Received: by 2002:a1f:6043:0:b0:42d:424c:aea3 with SMTP id
 u64-20020a1f6043000000b0042d424caea3mr5054366vkb.2.1678421152589; Thu, 09 Mar
 2023 20:05:52 -0800 (PST)
MIME-Version: 1.0
References: <f625f89c-c0d5-ad7f-778e-b717261afc53@yadro.com>
In-Reply-To: <f625f89c-c0d5-ad7f-778e-b717261afc53@yadro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 10 Mar 2023 14:05:26 +1000
Message-ID: <CAKmqyKNtjNsHeoRFtBE73Pw4UpTB+m5guVBe79FkYvNTUPuutg@mail.gmail.com>
Subject: Re: [PATCH] Fix incorrect register name in RISC-V disassembler for
 fmv,fabs,fneg instructions
To: Mikhail Tyutin <m.tyutin@yadro.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>, 
 "Alistair.Francis@wdc.com" <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::935;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x935.google.com
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

On Tue, Feb 28, 2023 at 12:53=E2=80=AFAM Mikhail Tyutin <m.tyutin@yadro.com=
> wrote:
>
> Fix incorrect register name in RISC-V disassembler for fmv,fabs,fneg inst=
ructions
>
> Signed-off-by: Mikhail Tyutin <m.tyutin@yadro.com>

It looks like this needs to be rebased. Do you mind rebasing it and
sending a v2?

Alistair

> ---
>   disas/riscv.c | 19 ++++++++++---------
>   1 file changed, 10 insertions(+), 9 deletions(-)
>
> diff --git a/disas/riscv.c b/disas/riscv.c
> index ddda687c13..58ad3df24d 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -1014,6 +1014,7 @@ static const char rv_vreg_name_sym[32][4] =3D {
>   #define rv_fmt_rd_offset              "O\t0,o"
>   #define rv_fmt_rd_rs1_rs2             "O\t0,1,2"
>   #define rv_fmt_frd_rs1                "O\t3,1"
> +#define rv_fmt_frd_frs1               "O\t3,4"
>   #define rv_fmt_rd_frs1                "O\t0,4"
>   #define rv_fmt_rd_frs1_frs2           "O\t0,4,5"
>   #define rv_fmt_frd_frs1_frs2          "O\t3,4,5"
> @@ -1580,15 +1581,15 @@ const rv_opcode_data opcode_data[] =3D {
>       { "snez", rv_codec_r, rv_fmt_rd_rs2, NULL, 0, 0, 0 },
>       { "sltz", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
>       { "sgtz", rv_codec_r, rv_fmt_rd_rs2, NULL, 0, 0, 0 },
> -    { "fmv.s", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> -    { "fabs.s", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> -    { "fneg.s", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> -    { "fmv.d", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> -    { "fabs.d", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> -    { "fneg.d", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> -    { "fmv.q", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> -    { "fabs.q", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> -    { "fneg.q", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> +    { "fmv.s", rv_codec_r, rv_fmt_frd_frs1, NULL, 0, 0, 0 },
> +    { "fabs.s", rv_codec_r, rv_fmt_frd_frs1, NULL, 0, 0, 0 },
> +    { "fneg.s", rv_codec_r, rv_fmt_frd_frs1, NULL, 0, 0, 0 },
> +    { "fmv.d", rv_codec_r, rv_fmt_frd_frs1, NULL, 0, 0, 0 },
> +    { "fabs.d", rv_codec_r, rv_fmt_frd_frs1, NULL, 0, 0, 0 },
> +    { "fneg.d", rv_codec_r, rv_fmt_frd_frs1, NULL, 0, 0, 0 },
> +    { "fmv.q", rv_codec_r, rv_fmt_frd_frs1, NULL, 0, 0, 0 },
> +    { "fabs.q", rv_codec_r, rv_fmt_frd_frs1, NULL, 0, 0, 0 },
> +    { "fneg.q", rv_codec_r, rv_fmt_frd_frs1, NULL, 0, 0, 0 },
>       { "beqz", rv_codec_sb, rv_fmt_rs1_offset, NULL, 0, 0, 0 },
>       { "bnez", rv_codec_sb, rv_fmt_rs1_offset, NULL, 0, 0, 0 },
>       { "blez", rv_codec_sb, rv_fmt_rs2_offset, NULL, 0, 0, 0 },
> --
> 2.34.1
>
>

