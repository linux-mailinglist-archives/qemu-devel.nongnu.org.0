Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD83D6B3283
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 01:05:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paQF9-0006fR-S3; Thu, 09 Mar 2023 19:04:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1paQEy-0006ex-8a
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 19:04:08 -0500
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1paQEw-0000pu-5b
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 19:04:07 -0500
Received: by mail-ua1-x92b.google.com with SMTP id x1so2402149uav.9
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 16:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678406645;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=USsqsFwquQTHYFH6yf+SlxEm6dK7V2KCJEPifTuJHtM=;
 b=jfHbILusEtGUqf0lj7wKeuueW3bKRokYN0huBVQZAwdQyqAFWAG7NoasIBn/Oo41Hz
 1Mi/cAc0fihAq/WvLD7lI7i039M5KJ3Pwh64d1ZHF6ewCVy+waQ5XMFqJdDRu7hZKWC3
 64fGebQoFuGGnWBhI/ZMoGDe74lV5N4FQI3wy5kZUqEUosHVjw/2LRVO0wVf3I7UBo69
 SEQxsLs+0jxXgaIMj9QMo7geoWRgWfzX9X0Pv2tolooJTRdg/viSdKfB3RxmFvLtvO/X
 S6ZyEhXyuZlsadXXdwOeNpzG/LGsEwiXbqZQikIQh/yA6cbryrzz+skIpie0qHggNciL
 vchQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678406645;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=USsqsFwquQTHYFH6yf+SlxEm6dK7V2KCJEPifTuJHtM=;
 b=n5VFaNjR2Axf6N2BbMu20f0C1oKlNpQQauCkTZ+N9dspm+cchrhFhZOlcRzHN4hOY3
 JrQVSgu2cPZ9PchLwth3gIo5Ai/f3YpuWTSdmiBUOnBk/mGrCyOATSHyZzU7SLTPrQ0k
 D5AgNjlHgaOi8gO8yL0BjAL0DkFd8afxlDYHO8ukvol53XV9DVGw2lfEIRp9e2elLjFt
 xSoR5Fb0BCwFJL4FYzMOds9H62AH41s1V+BLktTBtSj7lfLuebcTcEIsli0cPu2+0ttY
 53/SyuAaB0m9ktRnSj53jxlmn9EolqhA6I5qpcyslNYrAUYCBn0s/cSdcumtWJXdz6Dl
 eMkQ==
X-Gm-Message-State: AO0yUKXH0ECJ42LgMj5WQfmucs/iEL3LyDJ6wa7clXy1D9EfFKMQ68Wh
 6DdIJxBI/hzgPAebBuEM7rBCrzMxLsYnU2MnxNQ=
X-Google-Smtp-Source: AK7set9BHt+Jp8T+xX+rBcOsjnZIbOIs+mXQGUAL2Y/En0mAkqHvS0Jg5euZzCKU0suNfV537C6jXA8SDeFruCuF7Dg=
X-Received: by 2002:a1f:ea04:0:b0:412:611a:dce5 with SMTP id
 i4-20020a1fea04000000b00412611adce5mr15258658vkh.0.1678406645032; Thu, 09 Mar
 2023 16:04:05 -0800 (PST)
MIME-Version: 1.0
References: <f625f89c-c0d5-ad7f-778e-b717261afc53@yadro.com>
In-Reply-To: <f625f89c-c0d5-ad7f-778e-b717261afc53@yadro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 10 Mar 2023 10:03:39 +1000
Message-ID: <CAKmqyKPfNOu40vurhpupt4bjzHatZX-5Jdni0B5LX2PvwnZ0FQ@mail.gmail.com>
Subject: Re: [PATCH] Fix incorrect register name in RISC-V disassembler for
 fmv,fabs,fneg instructions
To: Mikhail Tyutin <m.tyutin@yadro.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>, 
 "Alistair.Francis@wdc.com" <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92b;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92b.google.com
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

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

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

