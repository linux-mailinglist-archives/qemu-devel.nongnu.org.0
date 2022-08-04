Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA0B5896A1
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 05:40:50 +0200 (CEST)
Received: from localhost ([::1]:50696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJRj6-00057M-VR
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 23:40:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1oJRgr-0003WC-Dn
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 23:38:29 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:44649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1oJRgp-0003zB-Lo
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 23:38:29 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-31f661b3f89so188774587b3.11
 for <qemu-devel@nongnu.org>; Wed, 03 Aug 2022 20:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=lEOsg01e72X+e2XElKTpENTvkkh2wbxJR/rekjuSPRk=;
 b=jjXJmcJ+9S+ws7yz63oifoupVBJSlfTthfkhJJMTKIE79EgrJHhWLiTwUjnVSctLAu
 ziJQVNa9vsc9IalpaZVlzyOvLj6rhx7cD95NzvexAvXGm6PzIRQk8dXignyHQ4mA21Ll
 u+r/h+gE77Kk8rXPzf+Ilm8mQW+vLEvfgo5TicKJquiVtJ1xTrzUNRdWXcGo4gnb3YJR
 EZ6MZzpQs7VGWFSN/1HF3fg9mat5JNhUs86nabkAdodq5RTKD8ZUGsX90qUiBkUuL/Ys
 vEN67Bm3x8U6zG7FrUpbb9qrSSc5mv1/CkK4BwVRWuNDuv2Y9X6a+CgSCyO1R+YVzl9a
 qnHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=lEOsg01e72X+e2XElKTpENTvkkh2wbxJR/rekjuSPRk=;
 b=PnQ1+uMsfzwwXnj1hbWRr+6zyuGnpsHAK+4YPV6VoBwNQxfy98zHBnkzibHW3ckeDc
 yM29pfm/rvMni+hhFk6ns8uNsImfK/UrVkkLQrcscN6nVk2OjYv62TsHQI/jLFgSzfPd
 akpsi+jDJDo/HF7eGlx7udc9wqylRFwhbg6dpP+QrCBMO8BRTHXrFvNrcjwy+gKJxH1T
 fhg1CH/c5raK+jIpB4doLqsRBO3wISKAvfYU+nxwhM77SCKUkKwXwvrO9Y9WxC+jwWCV
 clUlwSqTekUJfB2YTjygNdi4z4JNh/baVC2Yji6pN7vsl5Cw8T3Tm284c3a5BljbizhX
 oV4A==
X-Gm-Message-State: ACgBeo1YPiLu1BFh7THpVnAwGZ0ZYgotTXqfn6LFFLPYAwGwjFWcyivu
 m4364YTJX4OTOr8yTgrq3EYEoY5mZBjY3tg7F2iphQ==
X-Google-Smtp-Source: AA6agR6rSYozRagBuqpJkG3Q8f8Frg4fYQ/ZAXVe4oQnpjuPc5xamaqWSCGaW7j1jo3SUgHS9C+F0Gl+nQrEWZ0pG8s=
X-Received: by 2002:a81:b717:0:b0:322:9a3a:4d53 with SMTP id
 v23-20020a81b717000000b003229a3a4d53mr26320802ywh.427.1659584306203; Wed, 03
 Aug 2022 20:38:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220803123652.3700-1-liweiwei@iscas.ac.cn>
In-Reply-To: <20220803123652.3700-1-liweiwei@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 4 Aug 2022 09:08:14 +0530
Message-ID: <CAAhSdy0t+iNs8__nUytjuLAcX=FkVyT712+LJ9grmVRpi+cBdA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Fix priority of csr related check in
 riscv_csrrw_check
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com, 
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org, wangjunqiang@iscas.ac.cn, 
 lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2607:f8b0:4864:20::112a;
 envelope-from=anup@brainfault.org; helo=mail-yw1-x112a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 3, 2022 at 6:16 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> Normally, riscv_csrrw_check is called when executing Zicsr instructions.
> And we can only do access control for existed CSRs. So the priority of
> CSR related check, from highest to lowest, should be as follows:
> 1) check whether Zicsr is supported: raise RISCV_EXCP_ILLEGAL_INST if not
> 2) check whether csr is existed: raise RISCV_EXCP_ILLEGAL_INST if not
> 3) do access control: raise RISCV_EXCP_ILLEGAL_INST or RISCV_EXCP_VIRT_
> INSTRUCTION_FAULT if not allowed
>
> The predicates contain parts of function of both 2) and 3), So they need
> to be placed in the middle of riscv_csrrw_check
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>  target/riscv/csr.c | 44 +++++++++++++++++++++++++-------------------
>  1 file changed, 25 insertions(+), 19 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 0fb042b2fd..d81f466c80 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -3270,6 +3270,30 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
>      /* check privileges and return RISCV_EXCP_ILLEGAL_INST if check fails */
>      int read_only = get_field(csrno, 0xC00) == 3;
>      int csr_min_priv = csr_ops[csrno].min_priv_ver;
> +
> +    /* ensure the CSR extension is enabled. */
> +    if (!cpu->cfg.ext_icsr) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    if (env->priv_ver < csr_min_priv) {
> +        return RISCV_EXCP_ILLEGAL_INST;

This line breaks nested virtualization because for nested virtualization
to work, the guest hypervisor accessing h<xyz> and vs<xyz> CSRs from
VS-mode should result in a virtual instruction trap not illegal
instruction trap.

Regards,
Anup

> +    }
> +
> +    /* check predicate */
> +    if (!csr_ops[csrno].predicate) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    if (write_mask && read_only) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    RISCVException ret = csr_ops[csrno].predicate(env, csrno);
> +    if (ret != RISCV_EXCP_NONE) {
> +        return ret;
> +    }
> +
>  #if !defined(CONFIG_USER_ONLY)
>      int csr_priv, effective_priv = env->priv;
>
> @@ -3290,25 +3314,7 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
>  #endif
> -    if (write_mask && read_only) {
> -        return RISCV_EXCP_ILLEGAL_INST;
> -    }
> -
> -    /* ensure the CSR extension is enabled. */
> -    if (!cpu->cfg.ext_icsr) {
> -        return RISCV_EXCP_ILLEGAL_INST;
> -    }
> -
> -    /* check predicate */
> -    if (!csr_ops[csrno].predicate) {
> -        return RISCV_EXCP_ILLEGAL_INST;
> -    }
> -
> -    if (env->priv_ver < csr_min_priv) {
> -        return RISCV_EXCP_ILLEGAL_INST;
> -    }
> -
> -    return csr_ops[csrno].predicate(env, csrno);
> +    return RISCV_EXCP_NONE;
>  }
>
>  static RISCVException riscv_csrrw_do64(CPURISCVState *env, int csrno,
> --
> 2.17.1
>
>

