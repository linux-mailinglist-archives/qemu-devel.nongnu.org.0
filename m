Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F192BA2F7
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 08:21:25 +0100 (CET)
Received: from localhost ([::1]:36248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg0jT-0002ru-K3
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 02:21:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kito.cheng@sifive.com>)
 id 1kfwhY-0001zu-9r
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 22:03:08 -0500
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:38113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kito.cheng@sifive.com>)
 id 1kfwhV-0002ZJ-ST
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 22:03:08 -0500
Received: by mail-lf1-x129.google.com with SMTP id 74so11371198lfo.5
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 19:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t/Ys/xJo1D0GDr4lm7gChBDQhQe3xfedAd9KyZb/D+k=;
 b=WrMaOz1iCuhcJDRHh8J8qCWNPX4cZoNxGeX2LCFpfzN2qHV8JrcCLe/p6kuCukTSVK
 yVQV6qmnOPRDD1xOU8zLajt40ed2Mb409jVJbD9AM17By5Pm+ksdtpR1rNadQjvaXqgu
 bvOLtNIbQ/w9RWRJBq4NHb+Y4iaaytryw8k6ddIaJx0dyh21jsjR+Y4tqYvILcKu4e35
 RWsMfbeW21nmna8C2kC/UqDfevYbz6MAufgJcfuUbib6n14Sm4BY1y0HvaW5GKxzR39t
 1eEhNtjzUNb5P1D5ULi8FOnHNc7GExf+0rpbcAk8JwTSfEvH0p93gY6t/FWa+R1gK3aK
 hllA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t/Ys/xJo1D0GDr4lm7gChBDQhQe3xfedAd9KyZb/D+k=;
 b=TwGxSNpRf/t7Ie6m5/aqqbZjNPG9o0n/HcVL9megSDcU+oK7hccw35Ko+RxPT1lMM8
 dtSiaIeSt/5Blig8m/9pX81+W29Gj+a12EOBDd6MB3GxQz0CvvvqaT7ffpfbrbir4W/w
 r49sFmh46SHQ5fQYtNFcGJ1DomcdHIHsgyeDJpmg1I75Cn8NwbdIE7arm8xUMJ7tDOuO
 6a1oe1veVlAbjuMlSJXOZif4T1MTw2XHmUg7ONWutmsNuTAXRyFuIjt5focLw8c67yXL
 6Ezv6gjofANjr8iUPUyUFhzXy+BaMzgJojxlAuDJvZeZk3KKsKhJ/GpCJHQGDa5STqlq
 n7bw==
X-Gm-Message-State: AOAM5332ZKiQ4Me5JPuKDB1t2JuwbSYj6+pdTc6DhGsr8zjyyh5UdqfU
 n5tgATM712hwg78TXltYInAM5UrWlBN8MNDrHJMVjQ==
X-Google-Smtp-Source: ABdhPJxWnrBKjw5ZK33fLTG0JQrcX3E6LetZAPJR/O0KL1iWy7iejtEbYlQB+GYl3W0OJ2mDvNDTNfNtbxgbrBnfO6E=
X-Received: by 2002:a19:505d:: with SMTP id z29mr6730876lfj.106.1605841382957; 
 Thu, 19 Nov 2020 19:03:02 -0800 (PST)
MIME-Version: 1.0
References: <20201118083044.13992-1-frank.chang@sifive.com>
 <20201118083044.13992-16-frank.chang@sifive.com>
In-Reply-To: <20201118083044.13992-16-frank.chang@sifive.com>
From: Kito Cheng <kito.cheng@sifive.com>
Date: Fri, 20 Nov 2020 11:02:51 +0800
Message-ID: <CALLt3TgGATbAK5TFw-QBUFYTcC_CeAZ1AkMeeYuqgVxcyktT7g@mail.gmail.com>
Subject: Re: [RFC 15/15] target/riscv: rvb: support and turn on B-extension
 from command line
To: frank.chang@sifive.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=kito.cheng@sifive.com; helo=mail-lf1-x129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 20 Nov 2020 02:15:20 -0500
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
Cc: qemu-riscv@nongnu.org, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-devel@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 0bbfd7f4574..bc29e118c6d 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -438,6 +438,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>          if (cpu->cfg.ext_h) {
>              target_misa |= RVH;
>          }
> +        if (cpu->cfg.ext_b) {
> +            target_misa |= RVB;
> +        }
>          if (cpu->cfg.ext_v) {
>              target_misa |= RVV;
>              if (!is_power_of_2(cpu->cfg.vlen)) {
> @@ -515,6 +518,7 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
>      DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
>      /* This is experimental so mark with 'x-' */
> +    DEFINE_PROP_BOOL("x-b", RISCVCPU, cfg.ext_b, true),

I think the default value should be false?

>      DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
>      DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
>      DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),

