Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A63476A34
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 07:03:19 +0100 (CET)
Received: from localhost ([::1]:50216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxjrK-0008Ax-7o
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 01:03:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mxjnl-0006UA-MD
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 00:59:38 -0500
Received: from [2a00:1450:4864:20::32c] (port=52027
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mxjnk-0001lw-9E
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 00:59:37 -0500
Received: by mail-wm1-x32c.google.com with SMTP id z206so3949660wmc.1
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 21:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yrYb7Y57MNJ1ypAuWPYKmsktjE8dfNJSOS27DVuDDwo=;
 b=sXKpLls3yqgPgKMZB5zDmjaoPpg1ZUfxbUL3Dt2cGQWBw1o2shoUMRIlHyyZEnGu4V
 WjyW5xAaLGC5atrTetWch2KnZp3AGdYcD8tMU9D+M40p8GZLmWD8meBoLopqYFGskcrm
 8QT77Yxc/w3qlli/UcdC9sjBBGJ61R4A3s3fiTxBWk450t/5uxBi7psZtXM7RFCJn2uO
 1/M5tSRtV63A6DOvYZYoEbg4lkPrIQ22hV+glF8l6d0S3Y/d1WMMA7E26trlyGt3+qIU
 ysJsZ3p05fqVN18kEQos/xSeRt6kkc5GlLIQyw+RLU31JvuIJvFCXBwRF0pjH6+1LjDQ
 XFCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yrYb7Y57MNJ1ypAuWPYKmsktjE8dfNJSOS27DVuDDwo=;
 b=e15W8fj/gtu9Hue065HM11lzrWZivCrHIrrIX/WmAXSPIGNHRT+ARtJwmZQhms3qm8
 yNuRbn/vHhyTSEgwoZwMsUDLpzZUwn/ozCgvP5RMjOouNSCSGJLvPW0B2iqpC01zk3xi
 VseApyDlbrTvXd4YBl+ecHB7uwUO2s+twQEIREnnPbJfZ5Y//FVl+9FT9pWjTFTbCMrX
 /pzs26HUDBsAu+BBolg9riJKBsC0lUP6t2vRheIFMm5iN1GNcvpS0gZGNPaNByvA+z3D
 W8fIBeuR2J171a3VB7hMxLGLyuj+ClVtHo03XFrRqr7IaIazvsuX6T8fkmCvOqy63Pss
 7zKA==
X-Gm-Message-State: AOAM533AjWmkJxSxLkOY7Lzv25BuxZne1Tk33Phd5MUtjw2e1l8bYFtd
 JqKRckV97TCM3Tdnpao7Ffy2ime0BS9Nw1KYfDzc3w==
X-Google-Smtp-Source: ABdhPJwJjuLKRli1inWgYXf/V6WGJco/XX7oHBTLoOXmboz1R2G3z5xHVXjUMWUaic22R98orbFAYyVD1wqO5/ZhAhE=
X-Received: by 2002:a7b:c7cd:: with SMTP id z13mr3400480wmk.59.1639634374324; 
 Wed, 15 Dec 2021 21:59:34 -0800 (PST)
MIME-Version: 1.0
References: <20211216045427.757779-1-alistair.francis@opensource.wdc.com>
 <20211216045427.757779-6-alistair.francis@opensource.wdc.com>
In-Reply-To: <20211216045427.757779-6-alistair.francis@opensource.wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 16 Dec 2021 11:29:23 +0530
Message-ID: <CAAhSdy3OkjDtwdN8g6Ea=soCAXb=tO=je4zb7zRRXVoj-CXmxg@mail.gmail.com>
Subject: Re: [PATCH v2 5/9] target/riscv: Mark the Hypervisor extension as non
 experimental
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::32c;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Alistair Francis <alistair23@gmail.com>, Bin Meng <bmeng.cn@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 16, 2021 at 10:27 AM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> The Hypervisor spec is now frozen, so remove the experimental tag.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Regards,
Anup

> ---
>  target/riscv/cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index f812998123..1edb2771b4 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -626,6 +626,7 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("c", RISCVCPU, cfg.ext_c, true),
>      DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
>      DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
> +    DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, false),
>      DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
>      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
>      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
> @@ -639,7 +640,6 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("x-zbb", RISCVCPU, cfg.ext_zbb, false),
>      DEFINE_PROP_BOOL("x-zbc", RISCVCPU, cfg.ext_zbc, false),
>      DEFINE_PROP_BOOL("x-zbs", RISCVCPU, cfg.ext_zbs, false),
> -    DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
>      DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
>      DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
>      DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
> --
> 2.31.1
>
>

