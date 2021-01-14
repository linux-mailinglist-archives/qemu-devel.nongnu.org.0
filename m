Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B4F2F63FA
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 16:15:03 +0100 (CET)
Received: from localhost ([::1]:52222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l04L0-0001T7-1M
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 10:15:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l04F7-0004Vn-TO
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 10:08:57 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:34598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l04F6-0003Rl-85
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 10:08:57 -0500
Received: by mail-wr1-x436.google.com with SMTP id q18so6144740wrn.1
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 07:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tik8ZSv6saMdPxRlaY6QPjJUYRigL7WptUcRZqSbJRc=;
 b=tFp7fSRbW9Uw6Bt+ZVKEqHXOkFQWo8iyvX2DVLUXK3Qblb30WQBUcKilhnsIsoUECe
 6ASgh44YtrqJm5a2xtsxQfuTUeuqbxh6PELlofLjF5DEdfWUHcuJfYfrnUxdsBHkt4ZJ
 jAPiEl5OqQ0MES208lw4HwV+WBww6BHstTbP/Ju1uVfZl9cBQhxkho9MHG1d9ZPPDnIq
 SAobvk9vfYdti54FOSZQUv4x7+fIY+yNnpH4wX37D4cb2+8K7SYtlsladPuga0wNb70r
 Q0a/7mrfAj6lN/Fowabglda0MdJNo4s5/aY55VlpRLhItyPcPyb2frrcKy4igzckJVzG
 WHlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tik8ZSv6saMdPxRlaY6QPjJUYRigL7WptUcRZqSbJRc=;
 b=UPXvYeNhnwM3BmQ9JWogPFKpiIiooEG+iL6mGu2jDuMtNRUMvVfqORO+WtbGsiPiM0
 CRU9OIn2D5qDTSv8vlvwJD85u24WwDFMTF83FOXVOct8GbVlpkUk9++xveku5iPpNbAV
 aBUAjR33GmhtZdFnh7t8sPRzVn6nl+Bgj+062fRvS8VK1QDOX2CLV53aYvhMstvGZfJM
 WL7RTJehjaJndpQaLDBU9QFMywWZitkYvFRETJdlrMwIdlMcTrIGBTcAYeNa8AChYii4
 hgkSuwPdZdIg1DwdVqcL6Pt3jMzp5BlaX3otW4t76STBgx+XVaRUjYqwSH7Wl1sGOXOu
 O9sQ==
X-Gm-Message-State: AOAM531EFOZV5Vbsl6PILFioAkcTwhRaTOOkPCDYDgPlvTU0nJYRNF39
 JNksBj3h4gDikHwEfKGnt4s=
X-Google-Smtp-Source: ABdhPJzAlRA9mj6IL/NLo1MYn6e7XPRnRFumxz52ZAuOWgL9CILcpKxyqUJTWY5fyEkKw4oZ7AKcJA==
X-Received: by 2002:a5d:4241:: with SMTP id s1mr8433623wrr.269.1610636931828; 
 Thu, 14 Jan 2021 07:08:51 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id j13sm8388150wmi.36.2021.01.14.07.08.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 07:08:50 -0800 (PST)
Subject: Re: [PATCH v2 1/2] hw/intc: Add Loongson Inter Processor Interrupt
 controller
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20210114013147.92962-1-jiaxun.yang@flygoat.com>
 <20210114013147.92962-2-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8d1047c5-9049-6b4e-edb7-386de792f4cb@amsat.org>
Date: Thu, 14 Jan 2021 16:08:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114013147.92962-2-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.237,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jiaxun,

On 1/14/21 2:31 AM, Jiaxun Yang wrote:
> Loongson IPI controller is a MMIO based simple level triggered
> interrupt controller. It will trigger IRQ to it's upstream
> processor when set register is written.
> 
> It also has 4 64bit mailboxes to pass boot information to
> secondary processor.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  include/hw/intc/loongson_ipi.h |  20 ++++
>  hw/intc/loongson_ipi.c         | 174 +++++++++++++++++++++++++++++++++
>  hw/intc/Kconfig                |   3 +
>  hw/intc/meson.build            |   1 +
>  hw/intc/trace-events           |   4 +
>  5 files changed, 202 insertions(+)
>  create mode 100644 include/hw/intc/loongson_ipi.h
>  create mode 100644 hw/intc/loongson_ipi.c
...

Thanks for addressing v1 comments.

> +static void loongson_ipi_init(Object *obj)
> +{
> +    struct loongson_ipi *p = LOONGSON_IPI(obj);
> +
> +    sysbus_init_irq(SYS_BUS_DEVICE(obj), &p->parent_irq);
> +
> +    memory_region_init_io(&p->mmio, obj, &pic_mmio_ops, p,
> +                          "loongson.ipi", R_END * 4);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &p->mmio);
> +    qemu_register_reset(ipi_reset, p);

A SysBusDevice should use DeviceReset. qemu_register_reset()
should be restricted to non-SysBusDevice devices. If there
are no other comments on this series, I can fix this when
applying.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +}
> +
> +static const TypeInfo loongson_ipi_info = {
> +    .name          = TYPE_LOONGSON_IPI,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(struct loongson_ipi),
> +    .instance_init = loongson_ipi_init,
> +};

