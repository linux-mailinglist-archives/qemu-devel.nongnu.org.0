Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D863F5385
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 00:53:34 +0200 (CEST)
Received: from localhost ([::1]:56156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIIou-0006Or-SA
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 18:53:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mIImt-0005Ai-CK
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 18:51:27 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:46075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mIImr-0007gz-VG
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 18:51:27 -0400
Received: by mail-il1-x130.google.com with SMTP id v2so18648635ilg.12
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 15:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MbG9SX4fy8GNi2sLiNZwRvi+yALV3R7gnVDgRco3UZY=;
 b=IjMOJlTDT7dg5j/meewhnfPoiXVA5x35b9kFktwXtCFQvGSyM4gA4d1TZYf3mmUvYw
 mVU4O6id5NLdu6ntyt//fN5dw8Rge1/iSp+UCcd+xlxHtySOx8V5+OIAsAbseYiTPIn8
 ey23Ti48DAOjxAWB/f/o0fnQA5rooWNy3qLTjL6S/WbfVZqL46bEoxtAyBrKBvGHVi35
 ky4rOI6QhoyMv0q2jjLGnMa8I5DP1vDfhLJOqCzRVE4nrLuzsNmcDE79GzWAXl5mMx68
 514r8M664YGCYbk9aQBg6T4jt71Vx7QHze9bnKQVNU2sLP/hxakdY89FDYxzYW0Egm91
 F76Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MbG9SX4fy8GNi2sLiNZwRvi+yALV3R7gnVDgRco3UZY=;
 b=ZllV4df1+N5uSgmN8LuN1A70eQS9Urlxd8tSaFzH8KlWxDwJVNn0P6iPj51Nq5qi+6
 MYczKoCSxyG9cZsjS/BWptoI3ih0vAwUnFuflUJEVJkQ3xWy1Cr50RHScAdPCLfSyisQ
 44AucOHdZ57l9LmH9TZwPudTTvvyvb9RY4FbrF6b37Hx37Kl2zOg40a7+boTci2ikyyg
 uDOqUbHzhbY4V3vVSKP6JotM9neinEjj/r/BA8l51iVh+6YT+sr2IGN8aYH7P3ZeLCfC
 IjhEqXT/6ufRxIXnejh8w/9ze6PsE7FVvXh2QpZnrl3ObxcGpxuwQbdCD51fYAoG5oj8
 wAqQ==
X-Gm-Message-State: AOAM5307lmD03IfjFsDBzorthrX6MUOCOafycLFFgWerTZDS7t3wAcdx
 +qP6w2RQZwu5EqpRZr1x6KDCgGdSA76Y+iBGsGc=
X-Google-Smtp-Source: ABdhPJyVIqnulKIuXGg+BsV839LO70FQ4pLntLXsNqjcdaaofeMyrZPD+9BkqIa4OEe3aaUEzXU0tdamPQDtPSnqauo=
X-Received: by 2002:a92:8707:: with SMTP id m7mr24655498ild.177.1629759084542; 
 Mon, 23 Aug 2021 15:51:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210823181132.2205367-1-philipp.tomsich@vrull.eu>
 <20210823181132.2205367-2-philipp.tomsich@vrull.eu>
In-Reply-To: <20210823181132.2205367-2-philipp.tomsich@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 24 Aug 2021 08:50:58 +1000
Message-ID: <CAKmqyKPyLYi+3fR-6efeLFRKaKv5HDFEATgGmrmh+VE=Zi3Vpg@mail.gmail.com>
Subject: Re: [PATCH v4 01/14] target/riscv: Add x-zba, x-zbb,
 x-zbc and x-zbs properties
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::130;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x130.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 24, 2021 at 4:12 AM Philipp Tomsich
<philipp.tomsich@vrull.eu> wrote:
>
> The bitmanipulation ISA extensions will be ratified as individual
> small extension packages instead of a large B-extension.  The first
> new instructions through the door (these have completed public review)
> are Zb[abcs].
>
> This adds new 'x-zba', 'x-zbb', 'x-zbc' and 'x-zbs' properties for
> these in target/riscv/cpu.[ch].
>
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
> (no changes since v3)
>
> Changes in v3:
> - Split off removal of 'x-b' property and 'ext_b' field into a separate
>   patch to ensure bisectability.
>
>  target/riscv/cpu.c | 4 ++++
>  target/riscv/cpu.h | 4 ++++
>  2 files changed, 8 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 991a6bb760..c7bc1f9f44 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -585,6 +585,10 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
>      /* This is experimental so mark with 'x-' */
>      DEFINE_PROP_BOOL("x-b", RISCVCPU, cfg.ext_b, false),
> +    DEFINE_PROP_BOOL("x-zba", RISCVCPU, cfg.ext_zba, false),
> +    DEFINE_PROP_BOOL("x-zbb", RISCVCPU, cfg.ext_zbb, false),
> +    DEFINE_PROP_BOOL("x-zbc", RISCVCPU, cfg.ext_zbc, false),
> +    DEFINE_PROP_BOOL("x-zbs", RISCVCPU, cfg.ext_zbs, false),
>      DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
>      DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
>      DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index bf1c899c00..7c4cd8ea89 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -293,6 +293,10 @@ struct RISCVCPU {
>          bool ext_u;
>          bool ext_h;
>          bool ext_v;
> +        bool ext_zba;
> +        bool ext_zbb;
> +        bool ext_zbc;
> +        bool ext_zbs;
>          bool ext_counters;
>          bool ext_ifencei;
>          bool ext_icsr;
> --
> 2.25.1
>
>

