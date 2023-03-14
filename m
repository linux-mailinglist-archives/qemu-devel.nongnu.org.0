Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E1F6B895F
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 05:15:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbw32-0008Au-Jv; Tue, 14 Mar 2023 00:14:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pbw30-0008AW-Ua
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 00:14:02 -0400
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pbw2z-0002M3-46
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 00:14:02 -0400
Received: by mail-vs1-xe2f.google.com with SMTP id o32so12934250vsv.12
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 21:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678767239;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V8nIneNnY/XDbHc+5LtA7JL3WxxOqdyd13ytdsCo//o=;
 b=CaWCikL1M0XR0GWyBbDnHxfco5GNGD56iJFj5Wr17dpYyodu0O69gzTBrs7fPcuM+O
 nX6QcW5brY40No2wjBa9MsmfMTHDpoW5mcNGcqAzsFVFxfNsjvk7vxssf9MNpz0Pcgjl
 zIZ0X8x3hdoZBSkyju14Vyr89xy4Gcujz2n2AASOsZZh4LqvvMbOkAniGlKLQRveXjmX
 We5HBz16rYJm8m6y4E1MeZurmfL1iJhxFy9he9PFWRirr6ZwXiepmW53dLtPDLePzhqN
 c+3rTFMCAzqXZ2Cy46JL2h6BjrrwPQrB7f6xKFgzLiossmhT56E6aHLEyvqHbuK8hVoU
 jimw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678767239;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V8nIneNnY/XDbHc+5LtA7JL3WxxOqdyd13ytdsCo//o=;
 b=v846DYUQXZpfgN8u9ZRkeOu65+aRfHYUU4ap0+K61EEwEtP5JCF/2xYPgEqKau+fno
 GFgPrxEqwi1i6y3W5Vk+LnL7tPKoBLvyP0pkKKIx3m9od7zLGmoGFmpSnPAn1uXh7HDM
 vfc180BVgw6Q4ghDYJr4OQ3ENozC7ttDe06o+rjNZ3Lhk0/x2tVZ6g5OKxBIpA+QctqE
 +dpFcMJ3skJV2ND8NHnlx/MN1mxj4BsNDGPGjSt82EW+gqm4m01Jb3kK6N6Q7CegL6lE
 3+CdW/bRCRLEMXBrkJRCXRU3Q7/p5o9LF2PxctLTqhDpKRqnKc2znqUzR1vpkKnMBmV8
 En9g==
X-Gm-Message-State: AO0yUKUv76CaFWdRFremFEyX43srR/DfOlHB7LRgirFeQDgT3CgT/Uya
 j1jB2iKcu6Ybopg2ZbEhOTB+4Ur7eknMEObc5Hw=
X-Google-Smtp-Source: AK7set/Mww/lbvVh8cUxMzJVw6LAZJeEijIpOPGP4n1BcNjRaZThK/xv4SFJpadukagEAPjgUCKfm+PSPkB6K5ubAyY=
X-Received: by 2002:a67:db97:0:b0:412:2ed6:d79b with SMTP id
 f23-20020a67db97000000b004122ed6d79bmr23158604vsk.3.1678767239583; Mon, 13
 Mar 2023 21:13:59 -0700 (PDT)
MIME-Version: 1.0
References: <3454991f-7f64-24c3-9a36-f5fa2cc389e1@yadro.com>
In-Reply-To: <3454991f-7f64-24c3-9a36-f5fa2cc389e1@yadro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 14 Mar 2023 14:13:33 +1000
Message-ID: <CAKmqyKOei71Mk41VHMevJDdeSqX2BL005Q9LJ4oxgrEMvX=JOw@mail.gmail.com>
Subject: Re: [PATCH v2] Fix incorrect register name in disassembler for
 fmv,fabs,fneg instructions
To: Mikhail Tyutin <m.tyutin@yadro.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, palmer@dabbelt.com,
 Alistair.Francis@wdc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2f;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2f.google.com
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

On Sat, Mar 11, 2023 at 5:00=E2=80=AFAM Mikhail Tyutin <m.tyutin@yadro.com>=
 wrote:
>
> Fix incorrect register name in RISC-V disassembler for fmv,fabs,fneg
> instructions
>
> Signed-off-by: Mikhail Tyutin <m.tyutin@yadro.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>   disas/riscv.c | 19 ++++++++++---------
>   1 file changed, 10 insertions(+), 9 deletions(-)
>
> diff --git a/disas/riscv.c b/disas/riscv.c
> index 54455aaaa8..882594c1be 100644
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
>

