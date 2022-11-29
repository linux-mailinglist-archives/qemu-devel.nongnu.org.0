Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 805E063C6C2
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 18:50:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p04jW-00049i-9a; Tue, 29 Nov 2022 12:49:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p04jA-00044o-LO
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 12:49:14 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p04j8-00019f-EZ
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 12:49:04 -0500
Received: by mail-pl1-x62a.google.com with SMTP id d6so14153672pll.7
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 09:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5k7VTBT2vf6sHA5398chNOluBdFuuQn0BEfIFP+YJgA=;
 b=KiyIKNYKUp3X0KBxo1EoA65OicqYBxj+rpc2SFu0b2bNdVYPus5nIaJVu9j6NrvJSa
 XOII4T22H/6L7Fdv/qMflS0AHKUwd6A4FhOThP6Q9DTt6EbZAwqtYu6r4hF+k0M848Eg
 OtDoh+MDyc1K32hUjxlH/FFs1JcQ+T6rrFwcBZDYCSMay5mNRbjidBxqs4wQ8xRBrPQA
 KOJ2hjNsnXV51Za0S4g48gyGBBTv0Z5B5TKkMu3KJnWxgCcpIq9ARCFGiAmNhLCfR/+U
 scmkOVC0935d+EacpL/NtX/Dv8up1Vr1W8XJ6wnnacuk1I66e+IuGjezB3mf9sKegyvB
 /dNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5k7VTBT2vf6sHA5398chNOluBdFuuQn0BEfIFP+YJgA=;
 b=kYbqh2tu+qQYUwhtrnEEc71t6ucfkNFuH8eATMYinazWatEj791E3rJqUHe10e3Ctd
 PDDndyoBl08c+UqG5NJ8giIgAEwlGG15JVV8SkKdqGT6ehIsorzG0U+JCTI9tpB+EBiV
 9bAh5KKfRW8skIKsqPPZk9OoFHGIUxzyFThbmCP2c8vIaaysRfakqEbEJhn40mjLzGxK
 0HS3OleeBsRbxXT7F6ZkOuRdv75gWhNKaQowDdIfW9NjZNIfXvwxanpLeQbzOBp7J9pr
 z53/tiluIgU1LzGjzlpUIg96GsNu4CH64ambsT7aY8PbPNCIIIYEKwz88HCUyAwHkqcV
 vR8Q==
X-Gm-Message-State: ANoB5pnyK2JL5DbhI91kcTWDk5edaQL6aawICyQqsJYxdbIdGj/NY5D+
 qnISdyZr6R9Teo/91jAYNGamADK2TvhHra3Ua8dySA==
X-Google-Smtp-Source: AA0mqf5Z6vHNhEQrjk6rk7zcfslVnnJOm8+ldWT6nG6tAGw9zHzvERnfTkbqhJ4bF2BBq1+hZZfCUAmmCFM6fmAjDoY=
X-Received: by 2002:a17:902:b691:b0:188:5240:50ec with SMTP id
 c17-20020a170902b69100b00188524050ecmr38472222pls.168.1669744139419; Tue, 29
 Nov 2022 09:48:59 -0800 (PST)
MIME-Version: 1.0
References: <20221129160724.75667-1-schspa@gmail.com>
In-Reply-To: <20221129160724.75667-1-schspa@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Nov 2022 17:48:48 +0000
Message-ID: <CAFEAcA8mH8ZuyRvCAbgDCK_Rr7=SFXLSxgsc_ATOjo9XRnBOMw@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] hw/arm/boot: set initrd with #address-cells type
 in fdt
To: Schspa Shi <schspa@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62a.google.com
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

On Tue, 29 Nov 2022 at 16:07, Schspa Shi <schspa@gmail.com> wrote:
>
> We use 32bit value for linux,initrd-[start/end], when we have
> loader_start > 4GB, there will be a wrong initrd_start passed
> to the kernel, and the kernel will report the following warning.
>
> [    0.000000] ------------[ cut here ]------------
> [    0.000000] initrd not fully accessible via the linear mapping -- please check your bootloader ...
> [    0.000000] WARNING: CPU: 0 PID: 0 at arch/arm64/mm/init.c:355 arm64_memblock_init+0x158/0x244
> [    0.000000] Modules linked in:
> [    0.000000] CPU: 0 PID: 0 Comm: swapper Tainted: G        W          6.1.0-rc3-13250-g30a0b95b1335-dirty #28
> [    0.000000] Hardware name: Horizon Sigi Virtual development board (DT)
> [    0.000000] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    0.000000] pc : arm64_memblock_init+0x158/0x244
> [    0.000000] lr : arm64_memblock_init+0x158/0x244
> [    0.000000] sp : ffff800009273df0
> [    0.000000] x29: ffff800009273df0 x28: 0000001000cc0010 x27: 0000800000000000
> [    0.000000] x26: 000000000050a3e2 x25: ffff800008b46000 x24: ffff800008b46000
> [    0.000000] x23: ffff800008a53000 x22: ffff800009420000 x21: ffff800008a53000
> [    0.000000] x20: 0000000004000000 x19: 0000000004000000 x18: 00000000ffff1020
> [    0.000000] x17: 6568632065736165 x16: 6c70202d2d20676e x15: 697070616d207261
> [    0.000000] x14: 656e696c20656874 x13: 0a2e2e2e20726564 x12: 0000000000000000
> [    0.000000] x11: 0000000000000000 x10: 00000000ffffffff x9 : 0000000000000000
> [    0.000000] x8 : 0000000000000000 x7 : 796c6c756620746f x6 : 6e20647274696e69
> [    0.000000] x5 : ffff8000093c7c47 x4 : ffff800008a2102f x3 : ffff800009273a88
> [    0.000000] x2 : 80000000fffff038 x1 : 00000000000000c0 x0 : 0000000000000056
> [    0.000000] Call trace:
> [    0.000000]  arm64_memblock_init+0x158/0x244
> [    0.000000]  setup_arch+0x164/0x1cc
> [    0.000000]  start_kernel+0x94/0x4ac
> [    0.000000]  __primary_switched+0xb4/0xbc
> [    0.000000] ---[ end trace 0000000000000000 ]---
> [    0.000000] Zone ranges:
> [    0.000000]   DMA      [mem 0x0000001000000000-0x0000001007ffffff]
>
> To fix it, we can change it to #[address/size]-cells type.
>
> Signed-off-by: Schspa Shi <schspa@gmail.com>

Thanks for the respin; I've applied this version to my
target-arm-for-8.0 branch.

-- PMM

