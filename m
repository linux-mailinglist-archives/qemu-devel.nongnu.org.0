Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5128E31864F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 09:28:56 +0100 (CET)
Received: from localhost ([::1]:36228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA7LL-0006zT-7c
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 03:28:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1lA7Fq-0004Bx-S0; Thu, 11 Feb 2021 03:23:15 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:51828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1lA7Fo-0000eA-Ok; Thu, 11 Feb 2021 03:23:14 -0500
Received: from [172.16.11.100] (tiramisu.bar.greensocs.com [172.16.11.100])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 4B76621C36;
 Thu, 11 Feb 2021 08:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1613031788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vvgTWfNoPK0f8vjhzwUgtdHrpBO85iPgkl6dsyu939A=;
 b=4WQcciSQCeJN9GxOnuZwxtIvG7sfLDxVTdJ+IioHKf0NcO/ajRP1BwzkW/lB65ckNl8k3Z
 1GADTSIm2UWDaYOKrRiQ9W/OCJLIhI7I8FQa+fYVJGDLswgZBzeUI/8yiCLq3ic1P378qx
 JQfwzoLP7tvHmEeb/oVspcwzZCxujOE=
Subject: Re: [PATCH v1 1/1] hw/arm: versal: Use nr_apu_cpus in favor of hard
 coding 2
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
References: <20210210142048.3125878-1-edgar.iglesias@gmail.com>
 <20210210142048.3125878-2-edgar.iglesias@gmail.com>
From: Luc Michel <luc.michel@greensocs.com>
Message-ID: <efd5d4ba-dbd9-8f87-1dd7-f0543e3e4e62@greensocs.com>
Date: Thu, 11 Feb 2021 09:23:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210210142048.3125878-2-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=luc.michel@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.211,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, frederic.konrad@adacore.com, qemu-arm@nongnu.org,
 komlodi@xilinx.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/21 3:20 PM, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Use nr_apu_cpus in favor of hard coding 2.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
>   hw/arm/xlnx-versal.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
> index b0777166e8..628e77ef66 100644
> --- a/hw/arm/xlnx-versal.c
> +++ b/hw/arm/xlnx-versal.c
> @@ -67,10 +67,10 @@ static void versal_create_apu_gic(Versal *s, qemu_irq *pic)
>       gicbusdev = SYS_BUS_DEVICE(&s->fpd.apu.gic);
>       gicdev = DEVICE(&s->fpd.apu.gic);
>       qdev_prop_set_uint32(gicdev, "revision", 3);
> -    qdev_prop_set_uint32(gicdev, "num-cpu", 2);
> +    qdev_prop_set_uint32(gicdev, "num-cpu", nr_apu_cpus);
>       qdev_prop_set_uint32(gicdev, "num-irq", XLNX_VERSAL_NR_IRQS + 32);
>       qdev_prop_set_uint32(gicdev, "len-redist-region-count", 1);
> -    qdev_prop_set_uint32(gicdev, "redist-region-count[0]", 2);
> +    qdev_prop_set_uint32(gicdev, "redist-region-count[0]", nr_apu_cpus);
>       qdev_prop_set_bit(gicdev, "has-security-extensions", true);
>   
>       sysbus_realize(SYS_BUS_DEVICE(&s->fpd.apu.gic), &error_fatal);
> 

