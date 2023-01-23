Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A2067739E
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 01:23:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJkbV-00034M-6g; Sun, 22 Jan 2023 19:22:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pJkbS-00033n-Iw
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 19:22:26 -0500
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pJkbR-0002mc-1o
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 19:22:26 -0500
Received: by mail-vs1-xe2f.google.com with SMTP id k6so11327346vsk.1
 for <qemu-devel@nongnu.org>; Sun, 22 Jan 2023 16:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ej78zHwWtXGe90wBXd7U5szb5uQRfTkUPAqa/0lS6U4=;
 b=RpKJEvVE/4q0n7NeQH32IWKJ2CJqnc6SQEOIJROX2Ey7b5PKMm41e1HyEVQ+3sG03x
 K8J4RV8m8VOAsBPtZP7tjHdwbhOupbd0HQ+N5V79dt+r34aAv0jMMSDz0LK48qdyZAmV
 MvN/13It4by/ainR0hkIvsTau8mR4o8Kexs/sGdrJXwbR0JPvWM3QD46cCP2Cics3Mf5
 Obn2/tNu//TCQpTVW4rMtqGxBUl3vTkgKcrBtKPZBlS42whtaQ5IqcWhqX1nUpWccQrS
 e1l4cksnMCKnG/iyIaJLi1Nc+6/EuWAcqtkbCqtpDedrkNET5TNlaRh/OhU9Y4UXhhwb
 QVLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ej78zHwWtXGe90wBXd7U5szb5uQRfTkUPAqa/0lS6U4=;
 b=JDaMqwPM7h9oriXzrM0TO/DN5bfoTUB9UW8y4EKTF35IYxUqpsnvGTTpFnUOSMdMjp
 O1B15I5+Jt4JkswQLO3ZoOmDupBXw6P7Nq4G2Ey4givqiBIeVtYaJJYdaoDtksnp7nGf
 S7WRimELYT0bwqUoRWqHBawYgR5IxKAhxhNjJ9565uZwhTg80XnFLMskd7BRt5hg6mmz
 o+JDV6aRMHAi7QWwDiyeqxJLGFxTZsNGaGX+ieOal0SQpI/UR56dCj4AtIBSXzZhN2HR
 YqqwvYjuMo3nlxnOy0Y9ZwvV+YXdtxVyf4hgExuTLKIRyqXYxy9k3y+ixOeVID6q+48N
 Jm9g==
X-Gm-Message-State: AFqh2kqbn4574OjA9OlnbE1GGC8ohHwZwTjS2WowISakLlRwejH/HQ0z
 qWJdRYIR6OdWqFcU8IPgxkwEcjJ7nYY5TLupMwQ=
X-Google-Smtp-Source: AMrXdXuSNhdFQ6xGOcjPFkNh/3Hls0nK3ChgWcx6bp633rLn7g4Yp3iig8cgMo7pCKIZ1nwLDQncYzVw6gdKP4mgB94=
X-Received: by 2002:a67:eb10:0:b0:3c9:8cc2:dd04 with SMTP id
 a16-20020a67eb10000000b003c98cc2dd04mr3191415vso.73.1674433343899; Sun, 22
 Jan 2023 16:22:23 -0800 (PST)
MIME-Version: 1.0
References: <20230120151551.1022761-1-philipp.tomsich@vrull.eu>
In-Reply-To: <20230120151551.1022761-1-philipp.tomsich@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Jan 2023 10:21:57 +1000
Message-ID: <CAKmqyKOzkNHYNMOwxyZ9iyt0G+fpBQ86JKtfZkyHY3uKqPnheA@mail.gmail.com>
Subject: Re: [PATCH v1] target/riscv: update disas.c for xnor/orn/andn and
 slli.uw
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
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

On Sat, Jan 21, 2023 at 1:16 AM Philipp Tomsich
<philipp.tomsich@vrull.eu> wrote:
>
> The decoding of the following instructions from Zb[abcs] currently
> contains decoding/printing errors:
>  * xnor,orn,andn: the rs2 operand is not being printed
>  * slli.uw: decodes and prints the immediate shift-amount as a
>             register (e.g. 'shift-by-2' becomes 'sp') instead of
>             interpreting this as an immediate
>
> This commit updates the instruction descriptions to use the
> appropriate decoding/printing formats.
>
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>

Thanks!

Applied to riscv-to-apply.next

Alistair

>
> ---
>
>  disas/riscv.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/disas/riscv.c b/disas/riscv.c
> index d216b9c39b..ddda687c13 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -1626,9 +1626,9 @@ const rv_opcode_data opcode_data[] = {
>      { "cpop", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
>      { "sext.h", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
>      { "sext.b", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> -    { "xnor", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> -    { "orn", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> -    { "andn", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> +    { "xnor", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "orn", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "andn", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
>      { "rol", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
>      { "ror", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
>      { "sh1add", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> @@ -1647,7 +1647,7 @@ const rv_opcode_data opcode_data[] = {
>      { "clzw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
>      { "clzw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
>      { "cpopw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> -    { "slli.uw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "slli.uw", rv_codec_i_sh5, rv_fmt_rd_rs1_imm, NULL, 0, 0, 0 },
>      { "add.uw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
>      { "rolw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
>      { "rorw", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> --
> 2.34.1
>
>

