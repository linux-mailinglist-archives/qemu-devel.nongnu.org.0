Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3528F6F9C75
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 00:23:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvmlJ-00017H-FU; Sun, 07 May 2023 18:21:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pvmlH-00016k-FK; Sun, 07 May 2023 18:21:47 -0400
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pvmlF-0000VR-B6; Sun, 07 May 2023 18:21:47 -0400
Received: by mail-ua1-x930.google.com with SMTP id
 a1e0cc1a2514c-77d50a1c8deso1085070241.3; 
 Sun, 07 May 2023 15:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683498103; x=1686090103;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H8ZpYsO3B2gpxkbqTviQgLqUAwsslR3XzRSBgIiCcmA=;
 b=MvwJYCZYRmRdDjNGc803bgvIMVbtSYUyHxsycBVCF3kmgWw9Zsz1CcEKdkwIw6qmrg
 icWVw6XhUv8SMKJoPYTcg7b1cr08bKxwmXqfTMm+Rui4yT8CcTdZwKurr60TaJC5lCCm
 lz/RJEks6v2v79BoXjNBcA0ng6HoU3iZoheVpj+frU1AlUtNKY4muoCfU9VbQOzNp2y9
 JCszY14kY9p7lfWBYxurMLwDwwPs5mFGnXAwspSEmIGS9s0BS78LYSD59fY3uq5p02cn
 ekgC4MU1dX/FdmWIDnh1TvEam9EhV/IMxb9K8v5MsnJFNVVTLLWBpvo6yUVvp8/RG4jF
 bVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683498103; x=1686090103;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H8ZpYsO3B2gpxkbqTviQgLqUAwsslR3XzRSBgIiCcmA=;
 b=ff9J643+QRZDONMYRhJtJvZY+Jq5GCDw4rgYU2bojVz3MD9i5HZzKHe5jsDFAhYLUT
 5BPO6Z9NHEdaf0aMWMVbfwd5o0u7rMrU5uDkoPTuKu525pqyPpdmxj2IW+vW4agGVt8C
 FpNfaqpci2vJwDVUTYnGXhhjlZTsW+IsjhnpPQT3AKxIUN/7D9mgq6h/kz41p29N/IiP
 0djMbAzUQxMY82dYsVjVEk95NqTYMxTjJIIw9U8mEsQUWiZisDBKihJjvsLqdgHcMSYA
 YuKLaLcnM/5cmxbifa5FCDZPnuPtMCyeMHpXUh+gUqfko4CfHo6/zhnBYLNnxGMgTCZf
 Yfww==
X-Gm-Message-State: AC+VfDx8AoPW18TfGRLDojMkUQenEBcLfJkgM65sxr1rbWuzyrt6MA06
 cWcVxO+Upbi5Eech25esJ80w+SJN/MOsUWTjthnDgyvRzrM=
X-Google-Smtp-Source: ACHHUZ4Fvjco4ZXNxjLfvi/LlfsUEqKlntmfvoIwwYlbZLHVkca5FwcpXKmH/N+vk5MaHpLM3AIAej8FLuOBAeAtA3A=
X-Received: by 2002:a67:fac9:0:b0:426:9120:1dd4 with SMTP id
 g9-20020a67fac9000000b0042691201dd4mr2461073vsq.2.1683498103233; Sun, 07 May
 2023 15:21:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230505010241.21812-1-alistair.francis@wdc.com>
 <20230505010241.21812-87-alistair.francis@wdc.com>
In-Reply-To: <20230505010241.21812-87-alistair.francis@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 8 May 2023 08:21:17 +1000
Message-ID: <CAKmqyKM2rpOOG4r0NmbBhU79o4_DQjAD7Y1P-fx7GjTW5Z6DGg@mail.gmail.com>
Subject: Re: [PULL 86/89] target/riscv: Restore the predicate() NULL check
 behavior
To: qemu-devel@nongnu.org, qemu-stable@nongnu.org
Cc: Bin Meng <bmeng@tinylab.org>, Fei Wu <fei2.wu@intel.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, 
 Alistair Francis <alistair.francis@wdc.com>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::930;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x930.google.com
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

On Fri, May 5, 2023 at 11:08=E2=80=AFAM Alistair Francis <alistair23@gmail.=
com> wrote:
>
> From: Bin Meng <bmeng@tinylab.org>
>
> When reading a non-existent CSR QEMU should raise illegal instruction
> exception, but currently it just exits due to the g_assert() check.
>
> This actually reverts commit 0ee342256af9205e7388efdf193a6d8f1ba1a617.
> Some comments are also added to indicate that predicate() must be
> provided for an implemented CSR.
>
> Reported-by: Fei Wu <fei2.wu@intel.com>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Message-Id: <20230417043054.3125614-1-bmeng@tinylab.org>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Sorry, I didn't realise I should have done this with the PR, but this
is a good candidate for going into 8.0.1

Alistair

> ---
>  target/riscv/csr.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 865ee9efda..4451bd1263 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -3826,6 +3826,11 @@ static inline RISCVException riscv_csrrw_check(CPU=
RISCVState *env,
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
>
> +    /* ensure CSR is implemented by checking predicate */
> +    if (!csr_ops[csrno].predicate) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
>      /* privileged spec version check */
>      if (env->priv_ver < csr_min_priv) {
>          return RISCV_EXCP_ILLEGAL_INST;
> @@ -3843,7 +3848,6 @@ static inline RISCVException riscv_csrrw_check(CPUR=
ISCVState *env,
>       * illegal instruction exception should be triggered instead of virt=
ual
>       * instruction exception. Hence this comes after the read / write ch=
eck.
>       */
> -    g_assert(csr_ops[csrno].predicate !=3D NULL);
>      RISCVException ret =3D csr_ops[csrno].predicate(env, csrno);
>      if (ret !=3D RISCV_EXCP_NONE) {
>          return ret;
> @@ -4032,7 +4036,10 @@ static RISCVException write_jvt(CPURISCVState *env=
, int csrno,
>      return RISCV_EXCP_NONE;
>  }
>
> -/* Control and Status Register function table */
> +/*
> + * Control and Status Register function table
> + * riscv_csr_operations::predicate() must be provided for an implemented=
 CSR
> + */
>  riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
>      /* User Floating-Point CSRs */
>      [CSR_FFLAGS]   =3D { "fflags",   fs,     read_fflags,  write_fflags =
},
> --
> 2.40.0
>

