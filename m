Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C60175940
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Mar 2020 12:11:21 +0100 (CET)
Received: from localhost ([::1]:58748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8iym-0004vL-6P
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 06:11:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59482)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luc.michel@greensocs.com>) id 1j8ivD-0002pv-Vm
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 06:07:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <luc.michel@greensocs.com>) id 1j8ivC-0007Ve-UN
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 06:07:39 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:56684)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <luc.michel@greensocs.com>)
 id 1j8ivA-0007SP-HW; Mon, 02 Mar 2020 06:07:36 -0500
Received: from [172.16.11.100] (tiramisu.bar.greensocs.com [172.16.11.100])
 by beetle.greensocs.com (Postfix) with ESMTPSA id DEC6696F50;
 Mon,  2 Mar 2020 11:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1583147255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Oai3azEZgJsnk7o+8mf+4odbrmPXY11iaLL7A5dyM7Q=;
 b=mJJfcD3GDs/L6o//AxrPFHiGi/LtQ0aT+UA6ejpmZTBEqPpTy44sDGimLiDhxYos5QOz/s
 T4fRXssiycNXXopZrhQyC/xbIxIeoGn4asF7kpYTeCeRN+KYFJDZRZCeECRPN9OIkH9TE3
 KyZlEbcgYohApRFDyQGNYf71iGsSD5s=
Subject: Re: [PATCH v1 2/2] hw/arm: versal: Generate xlnx-versal-virt zdma FDT
 nodes
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
References: <20200227154424.6849-1-edgar.iglesias@gmail.com>
 <20200227154424.6849-3-edgar.iglesias@gmail.com>
From: Luc Michel <luc.michel@greensocs.com>
Message-ID: <d8957ece-4618-92ae-460f-9ee85161f76f@greensocs.com>
Date: Mon, 2 Mar 2020 12:07:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200227154424.6849-3-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1583147255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Oai3azEZgJsnk7o+8mf+4odbrmPXY11iaLL7A5dyM7Q=;
 b=puF7zZphEs+bBjW7Y6awqF+HmNIfabZv/4cHtnmDQWcX7HvMsjF3OYsRVS10j6fzM6oAlI
 Rc2XnLbIEMIS4JPeZRZKZ7tzshglj/OinWEP3bc6bH8HwT5pGEOH3VrmTYM/cptJulKm19
 joAzYy3YxmsCtGkiHFoANmFEQr2KD2k=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1583147255; a=rsa-sha256; cv=none;
 b=cTJnx3F0av7cWp0ztYRS+SyyHZNhFeoztEcOVMglRB7O37dNU8kSA2RIST3RMvsbYqJ7gj
 VV6vyhnmgVxq1HjMiwUgI5KwPJZgBIuKp4/HGdUwAxlCiykpvYGR/VrD3AehNqHzSmKwp0
 mboK09Dehfez4HO4o5mHCOSggO40T2k=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=luc smtp.mailfrom=luc.michel@greensocs.com
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, frederic.konrad@adacore.com, qemu-arm@nongnu.org,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/27/20 4:44 PM, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Generate xlnx-versal-virt zdma FDT nodes.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Luc Michel <luc.michel@greensocs.com>

> ---
>  hw/arm/xlnx-versal-virt.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
> index e7f4ca8bf9..878a275140 100644
> --- a/hw/arm/xlnx-versal-virt.c
> +++ b/hw/arm/xlnx-versal-virt.c
> @@ -229,6 +229,33 @@ static void fdt_add_gem_nodes(VersalVirt *s)
>      }
>  }
>  
> +static void fdt_add_zdma_nodes(VersalVirt *s)
> +{
> +    const char clocknames[] = "clk_main\0clk_apb";
> +    const char compat[] = "xlnx,zynqmp-dma-1.0";
> +    int i;
> +
> +    for (i = XLNX_VERSAL_NR_ADMAS - 1; i >= 0; i--) {
> +        uint64_t addr = MM_ADMA_CH0 + MM_ADMA_CH0_SIZE * i;
> +        char *name = g_strdup_printf("/dma@%" PRIx64, addr);
> +
> +        qemu_fdt_add_subnode(s->fdt, name);
> +
> +        qemu_fdt_setprop_cell(s->fdt, name, "xlnx,bus-width", 64);
> +        qemu_fdt_setprop_cells(s->fdt, name, "clocks",
> +                               s->phandle.clk_25Mhz, s->phandle.clk_25Mhz);
> +        qemu_fdt_setprop(s->fdt, name, "clock-names",
> +                         clocknames, sizeof(clocknames));
> +        qemu_fdt_setprop_cells(s->fdt, name, "interrupts",
> +                               GIC_FDT_IRQ_TYPE_SPI, VERSAL_ADMA_IRQ_0 + i,
> +                               GIC_FDT_IRQ_FLAGS_LEVEL_HI);
> +        qemu_fdt_setprop_sized_cells(s->fdt, name, "reg",
> +                                     2, addr, 2, 0x1000);
> +        qemu_fdt_setprop(s->fdt, name, "compatible", compat, sizeof(compat));
> +        g_free(name);
> +    }
> +}
> +
>  static void fdt_nop_memory_nodes(void *fdt, Error **errp)
>  {
>      Error *err = NULL;
> @@ -427,6 +454,7 @@ static void versal_virt_init(MachineState *machine)
>      fdt_add_uart_nodes(s);
>      fdt_add_gic_nodes(s);
>      fdt_add_timer_nodes(s);
> +    fdt_add_zdma_nodes(s);
>      fdt_add_cpu_nodes(s, psci_conduit);
>      fdt_add_clk_node(s, "/clk125", 125000000, s->phandle.clk_125Mhz);
>      fdt_add_clk_node(s, "/clk25", 25000000, s->phandle.clk_25Mhz);
> 

