Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC6C6834A8
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 19:05:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMuy3-0007eI-EU; Tue, 31 Jan 2023 13:02:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pMuxK-0007BU-T3
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 13:02:08 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pMuxI-0000lY-R1
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 13:02:06 -0500
Received: by mail-wm1-x334.google.com with SMTP id o36so4926306wms.1
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 10:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uIOuO/yNbXA8WfJahX7qDRn0aBT+rJ1JzBBeh2SQApw=;
 b=E3LhzRravI1dSKm1DjqNZSzfeeFRG6QzKSdnjegTpPcvU+5tKCeDVws7LGPoNLBYlR
 NezNhFcbU4hVr6bTAQNIdKglLtv1mUkkgl8YVVRuZwGANmWCUiK4jthfGikTbA0sCeGJ
 /8r9pAw4Sd44fiCBbp7326bJ37XQCp63ZLF21dmHGjgg65qsyQOY6gufWRpUfBDYwXTw
 WSeGhVfiZLjEKJyglf477OYVsYjd7fWx2goye/rNcqWn+dYRld77P86FzEThHxA2uSfS
 vDdhNV0Ud862hWESqG6ySfGcaGiy2Ze6S1hGHQX04QMHVT3Y05f2/YuGiCUW/+meb5yz
 HvSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uIOuO/yNbXA8WfJahX7qDRn0aBT+rJ1JzBBeh2SQApw=;
 b=NL6UNkjcxLrlvIWa+XhhS1OvCzERWdLrwe+GPNibz37IXD+d1hRavTfvAyekg/G0Wk
 g/YHMHX1bxS7gca6VyFQARErizqO4gAWnfbIN0RVXjTVbvH1/D5U7LdyxCCYhZ2A8coD
 yKF6EXU9C1yrP682uMxc8cmDb0bOgx2HVQD1qf5cjgqstJUbGumhgPs6tUZzxoE534GW
 F40SJil6c52xg3d2inMH0XwDtmxKft6RYzzpL6IRDwckNA/nXaSUs0OwpzBmS7FT1tLI
 A/xEOjynDNquCjqcke0r99CfsU4A2+U2XqdZwzRwfU5194Sm5Yb8YxCQiy04ELs1q3at
 HiYw==
X-Gm-Message-State: AO0yUKXme2eMYT7bE+nV1+Ed/a5FY1O0VaCkJ8pq1I1FKGFK0lTlzQXT
 MOVf8AowILkIyWkT6Vsn1bhbjLGB334ZS9g4PybL5A==
X-Google-Smtp-Source: AK7set+4khTVx5lyvD/XEyjjH6k7njepxPenEuwpSjZiNwmJYDCfCBq51TVWNyj5XxZtwmCPT7Y1bUwD7+BHx+9Mlj4=
X-Received: by 2002:a05:600c:4689:b0:3dd:1c45:792f with SMTP id
 p9-20020a05600c468900b003dd1c45792fmr329133wmo.57.1675188122335; Tue, 31 Jan
 2023 10:02:02 -0800 (PST)
MIME-Version: 1.0
References: <20230124195945.181842-1-christoph.muellner@vrull.eu>
 <20230124195945.181842-9-christoph.muellner@vrull.eu>
 <48ff4151-25d9-4b4d-d50a-6516000599c7@linaro.org>
In-Reply-To: <48ff4151-25d9-4b4d-d50a-6516000599c7@linaro.org>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Date: Tue, 31 Jan 2023 19:01:49 +0100
Message-ID: <CAEg0e7iyrSovYGYT4Q7Kexbqw02Yf2890e9p6p09g==yyY_bLQ@mail.gmail.com>
Subject: Re: [PATCH v3 08/14] RISC-V: Adding T-Head MemPair extension
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko.stuebner@vrull.eu>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Nelson Chu <nelson@rivosinc.com>, 
 Kito Cheng <kito.cheng@sifive.com>, Cooper Qu <cooper.qu@linux.alibaba.com>, 
 Lifang Xia <lifang_xia@linux.alibaba.com>,
 Yunhai Shang <yunhai@linux.alibaba.com>, 
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-wm1-x334.google.com
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

On Tue, Jan 24, 2023 at 9:44 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 1/24/23 09:59, Christoph Muellner wrote:
> > +static bool gen_loadpair_tl(DisasContext *ctx, arg_th_pair *a, MemOp memop,
> > +                            int shamt)
> > +{
> > +    TCGv rd1 = dest_gpr(ctx, a->rd1);
> > +    TCGv rd2 = dest_gpr(ctx, a->rd2);
> > +    TCGv addr1 = tcg_temp_new();
> > +    TCGv addr2 = tcg_temp_new();
> > +
> > +    addr1 = get_address(ctx, a->rs, a->sh2 << shamt);
> > +    if ((memop & MO_SIZE) == MO_64) {
> > +        addr2 = get_address(ctx, a->rs, 8 + (a->sh2 << shamt));
> > +    } else {
> > +        addr2 = get_address(ctx, a->rs, 4 + (a->sh2 << shamt));
> > +    }
> > +
> > +    tcg_gen_qemu_ld_tl(rd1, addr1, ctx->mem_idx, memop);
> > +    tcg_gen_qemu_ld_tl(rd2, addr2, ctx->mem_idx, memop);
> > +    gen_set_gpr(ctx, a->rd1, rd1);
> > +    gen_set_gpr(ctx, a->rd2, rd2);
>
> Since dest_gpr may return cpu_gpr[n], this may update the rd1 before recognizing the
> exception that the second load may generate.  Is that correct?

Solved in v4 by using temporaries.

>
> The manual says that rd1, rd2, and rs1 must not be the same, but you do not check this.

Fixed in v4.

Thank you!

>
>
> r~

