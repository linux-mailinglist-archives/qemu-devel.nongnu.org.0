Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C232B2FA1
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Nov 2020 19:24:36 +0100 (CET)
Received: from localhost ([::1]:32942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ke0Dz-0006xY-8O
	for lists+qemu-devel@lfdr.de; Sat, 14 Nov 2020 13:24:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ke0Cq-0005uI-UQ
 for qemu-devel@nongnu.org; Sat, 14 Nov 2020 13:23:24 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:37273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ke0Cp-0007pe-Dt
 for qemu-devel@nongnu.org; Sat, 14 Nov 2020 13:23:24 -0500
Received: by mail-oi1-f193.google.com with SMTP id m17so14243051oie.4
 for <qemu-devel@nongnu.org>; Sat, 14 Nov 2020 10:23:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DMEnSKvvfoJ3rY2s6SLAVXz4kTAMI7Kmkd8s/4McuTM=;
 b=hAazpAcLenegQUuJftFge/pyYUHh1H/bQR0/tyLSE1u3YTxylf9rhKOCzgscPfvesm
 ozxFF+8nIcPTLNEx9MrbqwwTJxF+PhQwP9mUVegM5ftAt5Qwl2Z5QOaOncvXd4wzOvZ6
 H2i9upw82hW19TcdcUmD3PoOnXF3z6+vpQdOyyFW/4Vvxg8FJ6YN1qVJcdFmz+r1gpJ+
 aH9ubVb1mau3SAk+Qjg49AjxDTvtoFUt5cQgMcitueA+B60VLd6vqoAH7HjuvrUEdejr
 TL42bh2f0ZSYGBS6P2MFBuAFvrNXUh/IRcuEBgqoddq+TPbjAyroHbND7LiSSYxe5dRI
 nPjQ==
X-Gm-Message-State: AOAM530uAredP4rQddG3VcgB9MzEijxeaCSg373dsTUhGS60+Eqf1O1A
 rTF770xOotsP5EUsQEUI6qcKsyjlGtup6qm8E2g=
X-Google-Smtp-Source: ABdhPJzuhMaubnwkbr0UU197WDvt14J2Yq+Ym/gl/8MhzYxu9mOmtIrfjO0crP5EGa2lT4EK1QjXutS/a++PX6HoBXk=
X-Received: by 2002:aca:314d:: with SMTP id x74mr5216429oix.46.1605378201746; 
 Sat, 14 Nov 2020 10:23:21 -0800 (PST)
MIME-Version: 1.0
References: <1547830785-7079-1-git-send-email-aleksandar.markovic@rt-rk.com>
 <1547830785-7079-13-git-send-email-aleksandar.markovic@rt-rk.com>
In-Reply-To: <1547830785-7079-13-git-send-email-aleksandar.markovic@rt-rk.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Sat, 14 Nov 2020 19:23:10 +0100
Message-ID: <CAAdtpL7TtuFBRcB0no8EQLcyuRd+YLR12Mv-q2wb0MBPkEdw0g@mail.gmail.com>
Subject: Re: [Qemu-devel] [PULL v2 12/12] target/mips: Introduce 32 R5900
 multimedia registers
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>,
 Fredrik Noring <noring@nocrew.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.167.193;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-oi1-f193.google.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/14 13:23:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Fredrik and Aleksandar,

On Fri, Jan 18, 2019 at 6:10 PM Aleksandar Markovic
<aleksandar.markovic@rt-rk.com> wrote:
>
> From: Fredrik Noring <noring@nocrew.org>
>
> The 32 R5900 128-bit registers are split into two 64-bit halves:
> the lower halves are the GPRs and the upper halves are accessible
> by the R5900-specific multimedia instructions.
>
> Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>
> Signed-off-by: Fredrik Noring <noring@nocrew.org>
> Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
> ---
>  target/mips/cpu.h       |  3 +++
>  target/mips/translate.c | 16 ++++++++++++++++
>  2 files changed, 19 insertions(+)
>
> diff --git a/target/mips/cpu.h b/target/mips/cpu.h
> index 21daf50..c4da7df 100644
> --- a/target/mips/cpu.h
> +++ b/target/mips/cpu.h
> @@ -429,6 +429,9 @@ struct TCState {
>
>      float_status msa_fp_status;
>
> +    /* Upper 64-bit MMRs (multimedia registers); the lower 64-bit are GPRs */
> +    uint64_t mmr[32];

FYI using MMI then migrating fails because these registers are not migrated.

> +
>  #define NUMBER_OF_MXU_REGISTERS 16
>      target_ulong mxu_gpr[NUMBER_OF_MXU_REGISTERS - 1];
>      target_ulong mxu_cr;
...

