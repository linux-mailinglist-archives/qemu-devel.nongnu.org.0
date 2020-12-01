Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB18E2CA167
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 12:35:39 +0100 (CET)
Received: from localhost ([::1]:57264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk3wY-0006JO-TQ
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 06:35:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk3vc-0005sc-7K
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 06:34:40 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:40839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk3va-00089Z-AB
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 06:34:39 -0500
Received: by mail-ej1-x641.google.com with SMTP id x16so3402617ejj.7
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 03:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QcG9t0DHNFyb4hFsLdWcKwlpbINfSaGkIwI1Prq59tI=;
 b=ac6kSbzfIAAU1YQJeojyVyvtIJhhm3znuFhtvvn93kW//gxqrLBxxFqAUCgHkXA4+H
 ILCeTZnwIqcw9bQ4SjUcDNXAfdAFxGSPGVeXaivQlwCjPmXwQInFciU8ZvzvMsY1Hs3V
 FVQkB6l6vjhLhqf4wd0UtPjcJPLPjeruxmWd8yHfviQcHDTOp/oEX6/Fv/iglKIG2Qvx
 Op1BpnXOFAUubwqfr3N9vQO9BH30qwtBKhMTc123OfP0zS29GstBoNx8NeU3FIYpZxJn
 w81o4/Zj9kKMczLcgu41eeAJM4zBJ6WJWh6GtxW9uRanst60+zjdfi6v/TLXDVIvHlF2
 Rhcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QcG9t0DHNFyb4hFsLdWcKwlpbINfSaGkIwI1Prq59tI=;
 b=IqPwgfjxNOJPgr3zHrnBUl0TEIOBkLMS9RAzjVZ55sAqSs8ZdSkQj70FY5zSPyeUDd
 HNo3RpaVo8kZeE0g3AuhKqMb9qIPuTnosSamPE+o7DllNjgofcNtMUHPBaUqBAGlc6AW
 XQfxC1rFbkxDyKw8JyIW0ilx8Mm5kR165PPG6mAwhYMcywFVumtqlC14900d79kGWSuD
 a+xGjaI75Zcf+wxqKZL79CHt/sv9lvbA8lf+YBCR45Mp8xeizLi5Lm0+2t3WnJprUmwD
 O2jHge5WJVJ/I1kcDWpmSh+nmPVe8fRSWcH2Ih2ZZwqkQTahoDp2q0RRtgvu4mNTJv8L
 zfUw==
X-Gm-Message-State: AOAM532UydvMH0sS43IG7Zg+IUhog5e9+XEqcMNZPMmFUE1Ylw7DyREh
 +Uq2nelb6rVx3LK7RkN80bqOt7DoraKDFeqls/wdkw==
X-Google-Smtp-Source: ABdhPJy+qUGH5S1GKSKd2ERgdHDabX6sKFlUcUTY/gsuzMQO4XjTHncv5dK2TmHjG6HcrODWvGq0o/cx8ZpuPNFdR2E=
X-Received: by 2002:a17:906:1542:: with SMTP id
 c2mr2397357ejd.382.1606822476618; 
 Tue, 01 Dec 2020 03:34:36 -0800 (PST)
MIME-Version: 1.0
References: <1606811915-8492-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1606811915-8492-5-git-send-email-sai.pavan.boddu@xilinx.com>
In-Reply-To: <1606811915-8492-5-git-send-email-sai.pavan.boddu@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Dec 2020 11:34:25 +0000
Message-ID: <CAFEAcA-esWWXWx-kfz=UvVsydU5siFvx-=u42DTW4n42YLu_jA@mail.gmail.com>
Subject: Re: [PATCH v14 4/4] arm: xlnx-versal: Connect usb to virt-versal
To: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x641.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Francisco Eduardo Iglesias <figlesia@xilinx.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Vikram Garhwal <fnuv@xilinx.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Paul Zimmerman <pauldzim@gmail.com>, Sai Pavan Boddu <saipava@xilinx.com>,
 Edgar Iglesias <edgari@xilinx.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ying Fang <fangying1@huawei.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 1 Dec 2020 at 08:34, Sai Pavan Boddu <sai.pavan.boddu@xilinx.com> wrote:
>
> From: Vikram Garhwal <fnu.vikram@xilinx.com>
>
> Connect VersalUbs2 subsystem to xlnx-versal SOC, its placed

Typo : "VersalUSB2".


> in iou of lpd domain and configure it as dual port host controller.
> Add the respective guest dts nodes for "xlnx-versal-virt" machine.
>
> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>

Code looks OK but I'll let somebody else from Xilinx review the detail.

> +static void fdt_add_usb_xhci_nodes(VersalVirt *s)
> +{
> +    const char clocknames[] = "bus_clk\0ref_clk";
> +    char *name = g_strdup_printf("/usb@%" PRIx32, MM_USB2_CTRL_REGS);
> +    const char compat[] = "xlnx,versal-dwc3";
> +
> +    qemu_fdt_add_subnode(s->fdt, name);
> +    qemu_fdt_setprop(s->fdt, name, "compatible",
> +                         compat, sizeof(compat));
> +    qemu_fdt_setprop_sized_cells(s->fdt, name, "reg",
> +                                 2, MM_USB2_CTRL_REGS,
> +                                 2, MM_USB2_CTRL_REGS_SIZE);
> +    qemu_fdt_setprop(s->fdt, name, "clock-names",
> +                         clocknames, sizeof(clocknames));
> +    qemu_fdt_setprop_cells(s->fdt, name, "clocks",
> +                               s->phandle.clk_25Mhz, s->phandle.clk_125Mhz);
> +    qemu_fdt_setprop(s->fdt, name, "ranges", NULL, 0);
> +    qemu_fdt_setprop_cell(s->fdt, name, "#address-cells", 2);
> +    qemu_fdt_setprop_cell(s->fdt, name, "#size-cells", 2);
> +    qemu_fdt_setprop_cell(s->fdt, name, "phandle", s->phandle.usb);
> +    g_free(name);
> +
> +    {
> +        const char irq_name[] = "dwc_usb3";
> +        const char compat[] = "snps,dwc3";

Minor coding style side note, but I'm not hugely fond of
code blocks in the middle of functions just for declaring
variables. You could either put these variable declarations
at the top of the function, or if you think the code in the
block is self contained and worth putting in its own function
you could do that.

thanks
-- PMM

