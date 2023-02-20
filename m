Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D996669D1C4
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 17:59:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU9Ux-0007pz-Dz; Mon, 20 Feb 2023 11:58:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pU9Uu-0007pb-QS
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 11:58:40 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pU9Ut-00014U-4O
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 11:58:40 -0500
Received: by mail-pf1-x42d.google.com with SMTP id a7so1071105pfx.10
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 08:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Yw7yk4bq95+8Xpq8ilMOh/TRO5rAzDj8Q27tmA3X2uk=;
 b=jW/ayeKBThjB2ra2JNm/MdiQWp/SibNorVWAfshq5MlSkksNesaJvLyWn786Ma3uzi
 tYV0QAwPa7gcTU6qMQr7WJOrWaJrbrDO797wYIZART4cYfOa7BxNAg2zx38PesoEWLVT
 UPfa9CIPoxefuGf4wd0yrjA9DzjnkXoT21QeQiZpKg8a2Sc/1Tw+Yf6s5HRwe7x/O1Zz
 LI1aGqsSU4ijgQTr8eBUaoPpfDhME+tHETspAMWOsvyLFziGrZ47Y6wK/X6wCQBZJkOd
 zoF5le40vacE+FoZswyG3b10uQRd+5bE1bW+B8dW7HZCUH4o5tZHJtqUBWyA9IpjMNwo
 Nrng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Yw7yk4bq95+8Xpq8ilMOh/TRO5rAzDj8Q27tmA3X2uk=;
 b=JMJAluChzVPtrcZhGSWi0QPIuhfM2dlGpNbHvjS2irHWsUgAschGp5qJ2vtvH+AIi0
 xrIkyirEC16TsoWYdTKAH9zFMFv19PiqOsB/EAY3tqpqUrTlu6eU0MDbfX2P8Jpi8sRW
 B3ca68xukUFFK/ZzU01LffBnNJk0iD2opaMeJW7cQTs0/E7p+3YnAJWottgvwQjOp6Kw
 /fA1jkw2ibML8fuWLy3ND8QXTij7S9lq7C6v+1N8WI4M+zZvMA1BI43fqrTSB09Fm82Q
 IVjM8sUAS+cLU+VOHQqD6dAwvV0MpfYoC9nOrjOM+GDfOTgb3nzGSmtzWhQeGqxUnJLA
 EPjQ==
X-Gm-Message-State: AO0yUKX0gAjc/SDHgwhoyi1cmEgmVxO/lpTb8mUNaUBWxTg1yeStmL4K
 tRIUKIneZT+jiBiAX2bFERbHxTzhiKEAdxNOQ8FwEg==
X-Google-Smtp-Source: AK7set/dvqE7DT3da+nl4d97SUPTH5AgebbJ6kE7wiy5eysz2LoVbFSEM7dRnvtDzPkzKbVpyCj/YH97oJCRvHcJITs=
X-Received: by 2002:a05:6a00:2ea6:b0:5a8:af24:b152 with SMTP id
 fd38-20020a056a002ea600b005a8af24b152mr176736pfb.3.1676912317273; Mon, 20 Feb
 2023 08:58:37 -0800 (PST)
MIME-Version: 1.0
References: <20230214163048.903964-1-richard.henderson@linaro.org>
 <20230214163048.903964-12-richard.henderson@linaro.org>
In-Reply-To: <20230214163048.903964-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Feb 2023 16:58:26 +0000
Message-ID: <CAFEAcA8fpHHoCAD59F19_-=RF=CLJzuXv-oHovpDi=OFLQ3WtA@mail.gmail.com>
Subject: Re: [PATCH 11/14] target/arm: Implement gdbstub pauth extension
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Luis Machado <luis.machado@arm.com>,
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, 14 Feb 2023 at 16:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The extension is primarily defined by the Linux kernel NT_ARM_PAC_MASK
> ptrace register set.
>
> The original gdb feature consists of two masks, data and code, which are
> used to mask out the authentication code within a pointer.  Following
> discussion with Luis Machado, add two more masks in order to support
> pointers within the high half of the address space (i.e. TTBR1 vs TTBR0).
>



> +int aarch64_gdb_get_pauth_reg(CPUARMState *env, GByteArray *buf, int reg)
> +{
> +    switch (reg) {
> +    case 0: /* pauth_dmask */
> +    case 1: /* pauth_cmask */
> +    case 2: /* pauth_dmask_high */
> +    case 3: /* pauth_cmask_high */
> +        /*
> +         * Note that older versions of this feature only contained
> +         * pauth_{d,c}mask, for use with Linux user processes, and
> +         * thus exclusively in the low half of the address space.
> +         *
> +         * To support system mode, and to debug kernels, two new regs
> +         * were added to cover the high half of the address space.
> +         * For the purpose of pauth_ptr_mask, we can use any well-formed
> +         * address within the address space half -- here, 0 and -2.
> +         */
> +        return gdb_get_reg64(buf, pauth_ptr_mask(env, -(reg & 2), ~reg & 1));

This seems pretty confusing to me. Is there a clearer way
we could write this? Pulling out a

   bool is_data = !(reg & 1);

would help, for instance.

> +    default:
> +        return 0;
> +    }

thanks
-- PMM

