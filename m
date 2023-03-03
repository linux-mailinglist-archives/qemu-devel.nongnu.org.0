Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B446A94E5
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 11:11:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY2M1-0008HD-1d; Fri, 03 Mar 2023 05:09:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pY2Ly-0008Gt-MT
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 05:09:30 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pY2Lx-0007JT-0o
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 05:09:30 -0500
Received: by mail-wr1-x430.google.com with SMTP id bx12so1683047wrb.11
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 02:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677838166;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Hy/d28wvWHAgRL7H5GRJPuV8/lGxnjDPDwO332dNSbc=;
 b=QYqiFA2awOrx+kkDn5q16fl8KZoH6x9DFUjwAprYMmDpUeeO+t/V13PBisp5yAUkdX
 iDrKzeTh2zDs53/G/5hHj2lDn8BS/23cJbC3uIkvYXBkbIkpIrGXeJl3iSEeCVFKjs7s
 xU6DEuDFfokNilEkpZ8i01rYAg2eMVKbt/1cjzUYcX5h6c/JGTe+BX8ql+MBdmR1J8zZ
 2NAwi+eZExiZEtHb7Cf1nC4HIElVHGKGf082wBp8gyrKDYDtrG/erRxp6tx1tzwSNnLv
 Lf7+sjFryMs/0vSLYY7YGQJOyv93VsXZCrzr3XOmsOojHc6rJj5DfXThlaTk1KZYT1iP
 PKYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677838166;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Hy/d28wvWHAgRL7H5GRJPuV8/lGxnjDPDwO332dNSbc=;
 b=ZbpSTT+5QuXJPRQNtvrSgKBXmpWzgtGHuKRIhGxP/LjfftUWgblyVEyezvlWyOq6TG
 Snutn9i9GcsdgEf22djKe/xDfKRm1GLGDW1kXC02EVfTT6EI2aYn0Q18jIuPtsS9wUJE
 75gXUtwmTjKNXdzuEi1cwZnRk9bxwsPS0GVj+N5A4oDV4O8Y53gKq9y1gDBp9Uw1IPuE
 oxUnrVT7NPC2QQm7vObjKVnOPqaoZF60kHPIE83SVBZtAZt8TMMQsNjoAI4SdnPYUYcb
 V9Y+pyZ7bmjFVz9etLUuRB/5Nwv67Ja9R6EbBw/f9MHHyHh+S0lfZxnRrV/hEK8aUgMR
 KU6w==
X-Gm-Message-State: AO0yUKWxek1T6qhWMFrOWqtB9r/KLXtk4GCi4BxKMnJ7Bb47kvLGoD19
 ajUzl/2ga1dYiugAn9GYxlWH5g==
X-Google-Smtp-Source: AK7set/zUQGsZAYIMRD+9PHS7emEtVJdIis/mKum9Xf2Pcy3ZAsonRfemtZykGmm1WiA1SwcaXgmrg==
X-Received: by 2002:a5d:6512:0:b0:2c5:5687:5ed5 with SMTP id
 x18-20020a5d6512000000b002c556875ed5mr856994wru.18.1677838166699; 
 Fri, 03 Mar 2023 02:09:26 -0800 (PST)
Received: from [192.168.59.175] (180.red-88-28-30.dynamicip.rima-tde.net.
 [88.28.30.180]) by smtp.gmail.com with ESMTPSA id
 z5-20020a5d4c85000000b002c71703876bsm1721330wrs.14.2023.03.03.02.09.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 02:09:26 -0800 (PST)
Message-ID: <84a59aed-04e2-e1fc-6862-591164473ea8@linaro.org>
Date: Fri, 3 Mar 2023 11:09:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 5/6] Add the aehd-i8259 device type.
Content-Language: en-US
To: Haitao Shan <hshan@google.com>, qemu-devel@nongnu.org
Cc: Haitao Shan <haitao.shan@google.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "open list:Android Emulator..." <emu-dev@google.com>
References: <20230303022618.4098825-1-hshan@google.com>
 <20230303022618.4098825-5-hshan@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230303022618.4098825-5-hshan@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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

On 3/3/23 03:26, Haitao Shan wrote:
> The aehd-i8259 device type represents the AEHD in kernel PICs.
> The irqchips should be always in kernel when AEHD is used.
> 
> Signed-off-by: Haitao Shan <hshan@google.com>
> ---
>   hw/i386/aehd/i8259.c     | 165 +++++++++++++++++++++++++++++++++++++++
>   hw/i386/aehd/meson.build |   1 +
>   hw/i386/pc.c             |   2 +
>   include/hw/intc/i8259.h  |   1 +
>   4 files changed, 169 insertions(+)
>   create mode 100644 hw/i386/aehd/i8259.c


> +static void aehd_pic_reset(DeviceState *dev)
> +{
> +    PICCommonState *s = PIC_COMMON(dev);
> +
> +    s->elcr = 0;
> +    pic_reset_common(s);
> +
> +    aehd_pic_put(s);
> +}
> +
> +static void aehd_pic_set_irq(void *opaque, int irq, int level)
> +{
> +    pic_stat_update_irq(irq, level);
> +    aehd_set_irq(aehd_state, irq, level);
> +}
> +
> +static void aehd_pic_realize(DeviceState *dev, Error **errp)
> +{
> +    PICCommonState *s = PIC_COMMON(dev);
> +    AEHDPICClass *kpc = AEHD_PIC_GET_CLASS(dev);
> +
> +    memory_region_init_io(&s->base_io, OBJECT(dev), NULL, NULL, "aehd-pic", 2);
> +    memory_region_init_io(&s->elcr_io, OBJECT(dev), NULL, NULL, "aehd-elcr", 1);
> +
> +
> +    kpc->parent_realize(dev, errp);
> +}

Again, this should be drastically simplified by adding a some fields &
handlers to the abstract TYPE_INKERNEL_IOAPIC class:

struct InKernelAPICCommonClass {
     APICCommonClass parent_class;

     void (*pic_put)(PICCommonState *s)
     ...
};

Eventually this could even belong to APICCommonClass, but I haven't
checked in detail.

