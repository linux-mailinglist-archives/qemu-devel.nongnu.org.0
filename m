Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE919687FEC
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 15:24:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNaVF-0002mK-RE; Thu, 02 Feb 2023 09:23:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1pNaVD-0002lh-Q9
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 09:23:51 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1pNaVB-0002Si-UL
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 09:23:51 -0500
Received: by mail-ej1-x630.google.com with SMTP id k4so6476139eje.1
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 06:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=95bby94AAssQhd1vnsOSOZ0gdUvKeiRIAMcf3sYDskU=;
 b=KTIKsqb/sccIYhJ4mdiTX7dXmI8ExTM9r0EGIVH5VkDv0T6h6tQzLymZfxO1sdNwLg
 tK/y2pZFaC1zmqtfnd9Bu2sQcNZ0zBht28vQ8xqYRdN+S6TtbDQPTK1NOJvePyxXiFrl
 zgsrdhTlGqatys8Ya/B5o+m1kzfoO8o8MmZUYeq1IgcwNDCh02Q+o16mySppqJjGxtJu
 frvE17NvareH9RXOweGt5aYNuH8tkzJsnclgtSLGT8zmJV3bS6NvytsRkK5EJheAV6jp
 wTGXqKsrIplo95KWB75wq29Kmur5XndAYUDTioZoC9VPf19zGUEKbc2n8RLc2fekC8kg
 3qOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=95bby94AAssQhd1vnsOSOZ0gdUvKeiRIAMcf3sYDskU=;
 b=EilgtkTR8RwucCDh3dXwvUVHmfDnMf/G5tlfXCYHRtK2hq02cQqEbS0WJEsnm1tUGj
 8umUCtxMnMUsIgl/UZn8++GzfrEk/0vmY9d8jyk1v7DTRl6k8+LygFYA8T5Pu/a3WYVs
 jup3fF6118xmLBHaWpqu/ZYkMI9rzayw4d/DGBqRnJ//fXRdYHPafAUbcJXQN165ntRo
 /weq2ZH6jgdMHT+oaXzCrufP11DD9Ek5ukVCxUhfKaafaJr4yXzY0ZYUXwgd96BkAxzk
 e6pAhhFqzKX3nzi2+aO5q0f/mUnNpG+Rt16Z5g/n8RMNZTcrTGa90JHwvLtEsuTeUbd2
 NECg==
X-Gm-Message-State: AO0yUKUf3KbmWcwAOzAnOUIne4D3F6BYVYKXr/YM2EdP4S4mRrGKgnMC
 KTRUn4USzkDwfNBrwXee7K+E+2BdtZf1TnvVqww16w==
X-Google-Smtp-Source: AK7set9zmsyEs8oLKZd8/A5vYqXgeS+QNlSzxBTdvsg2bhw3K+qlqYFHlCB9eejYCUiQaFrRvY9yE6LTJb+OBpuEk4s=
X-Received: by 2002:a17:906:b001:b0:878:4cc7:ed23 with SMTP id
 v1-20020a170906b00100b008784cc7ed23mr2089501ejy.14.1675347828096; Thu, 02 Feb
 2023 06:23:48 -0800 (PST)
MIME-Version: 1.0
References: <20230202124230.295997-1-lawrence.hunter@codethink.co.uk>
 <20230202124230.295997-11-lawrence.hunter@codethink.co.uk>
In-Reply-To: <20230202124230.295997-11-lawrence.hunter@codethink.co.uk>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Thu, 2 Feb 2023 15:23:37 +0100
Message-ID: <CAAeLtUC3OrdKY8FptTq5Wc32EeHwZjAdrVqaM948fwPaSCMjEA@mail.gmail.com>
Subject: Re: [PATCH 10/39] target/riscv: expose zvkb cpu property
To: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
Cc: qemu-devel@nongnu.org, dickon.hood@codethink.co.uk, 
 nazar.kazakov@codethink.co.uk, kiran.ostrolenk@codethink.co.uk, 
 frank.chang@sifive.com, palmer@dabbelt.com, alistair.francis@wdc.com, 
 bin.meng@windriver.com, pbonzini@redhat.com, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-ej1-x630.google.com
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

On Thu, 2 Feb 2023 at 13:42, Lawrence Hunter
<lawrence.hunter@codethink.co.uk> wrote:
>
> From: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
>
> Signed-off-by: Nazar Kazakov <nazar.kazakov@codethink.co.uk>

You might want to squash this onto the patch that first introduces the property.

Reviewed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>

> ---
>  target/riscv/cpu.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index bd34119c75..35790befc0 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1082,6 +1082,8 @@ static Property riscv_cpu_extensions[] = {
>
>      DEFINE_PROP_BOOL("zmmul", RISCVCPU, cfg.ext_zmmul, false),
>
> +    DEFINE_PROP_BOOL("zvkb", RISCVCPU, cfg.ext_zvkb, false),
> +
>      /* Vendor-specific custom extensions */
>      DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOps, false),
>
> --
> 2.39.1
>

