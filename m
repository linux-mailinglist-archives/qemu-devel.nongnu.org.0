Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F1449E344
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 14:22:54 +0100 (CET)
Received: from localhost ([::1]:46894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD4jl-0007Ap-0c
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 08:22:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD4XZ-0008WD-RO
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 08:10:18 -0500
Received: from [2a00:1450:4864:20::334] (port=37771
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD4XV-00018g-82
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 08:10:17 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso5873219wmj.2
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 05:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1rZQ5esTkxzKHytCpRPxBUfzrgYv3Tl+hAU0ANpzRQg=;
 b=iC0fwsYoQgTbSVHMfR1vryth0ujUGuVVVMDNeNsT/MQC5gnbgBrQqN5KyZb5XH9dfq
 5h5R2HrPkIeMFpJi9tc0/jDDeRbbVPYWilfWmkhB/Vh8XWx/XdVDev7+fHmS+HhQpAwT
 9uRd6dAMPRpgUCmDtPbKUQFrWep7C9s4AoilaMpnQCVJvUjwrO7sjKggcsTMP7FRtYah
 7PhXxi/oReUjwfXhyU2/+eavfey7JWY1hYksHiPI7oE7k29ikBxELbZDyvPACc4gzYo4
 FhC/8lYQxR+i0Pzu7TBJ65oRR1wYDitZ4/iQxsSVeuUn5QCBqyLmZNz28DdTMvS1csmy
 jWMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1rZQ5esTkxzKHytCpRPxBUfzrgYv3Tl+hAU0ANpzRQg=;
 b=FYE3mGj8Bq/maYjsTn4+u2xCt+vIeNWuYgrFf9t6I+16z5QSVbA8TXQJC0uTuom1L0
 BeEOOTos/yoVRiMbwici1CYc0hEKVOBEsgLe6RHT+EQ/I+ztZjILg6i82y/sQj0rhr7Y
 x4CURa5pnSvXxCjLpRz9Ja0k2OW3ydhNxgSNkRQclQtPQnA1YH9lcZu4lE6MQQYKbnEP
 jvFPSDm1aihygVbqZFkaCKVHH6sHBG3qQH2wlrqVd4EUuKS9hbeIngmEtGGswCcjU/Hb
 dA3rDDpLfzw1TtbTMVME82pH3VOW8favLfuXlMwtEroLMrUP7NRYU3+z4zTteO9A0PjI
 OXHQ==
X-Gm-Message-State: AOAM531+avovmMjOuqKj6tA0qlSFhNqjWj2tvsbYPo7u5NxLvH2fKKR1
 YrCPm/s0eLCpQmzWWpKBqc9tcb+s516XF69B3H8KcbU/W38=
X-Google-Smtp-Source: ABdhPJxZLONWHmgPTwkqMPry434GOrafvE+AUNGiaz5ad/q7rTg2GOXIsTOflWQAo4+W5dJfstxp3ZTOGpnB8LxhMTA=
X-Received: by 2002:a05:600c:1e0f:: with SMTP id
 ay15mr3163635wmb.133.1643289011257; 
 Thu, 27 Jan 2022 05:10:11 -0800 (PST)
MIME-Version: 1.0
References: <20181102171638.24069-1-peter.maydell@linaro.org>
 <20181102171638.24069-11-peter.maydell@linaro.org>
In-Reply-To: <20181102171638.24069-11-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Jan 2022 13:10:00 +0000
Message-ID: <CAFEAcA-YALm-nA-nbCuBjZUyy-Q9+G6Hj_oS7FMq7Pdv_HfTug@mail.gmail.com>
Subject: Re: [Qemu-devel] [PULL 10/10] hw/arm: versal: Add a virtual Xilinx
 Versal board
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 2 Nov 2018 at 17:24, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Add a virtual Xilinx Versal board.
>
> This board is based on the Xilinx Versal SoC. The exact
> details of what peripherals are attached to this board
> will remain in control of QEMU. QEMU will generate an
> FDT on the fly for Linux and other software to auto-discover
> peripherals.

Hi Edgar; I was just looking at the Versal board code for
something else I was working on, and I noticed a bug that's been
there since it was added in this patch:

> +    s->binfo.ram_size = machine->ram_size;
> +    s->binfo.kernel_filename = machine->kernel_filename;
> +    s->binfo.kernel_cmdline = machine->kernel_cmdline;
> +    s->binfo.initrd_filename = machine->initrd_filename;
> +    s->binfo.loader_start = 0x0;
> +    s->binfo.get_dtb = versal_virt_get_dtb;
> +    s->binfo.modify_dtb = versal_virt_modify_dtb;
> +    if (machine->kernel_filename) {
> +        arm_load_kernel(s->soc.fpd.apu.cpu[0], &s->binfo);
> +    } else {
> +        AddressSpace *as = arm_boot_address_space(s->soc.fpd.apu.cpu[0],
> +                                                  &s->binfo);
> +        /* Some boot-loaders (e.g u-boot) don't like blobs at address 0 (NULL).
> +         * Offset things by 4K.  */
> +        s->binfo.loader_start = 0x1000;
> +        s->binfo.dtb_limit = 0x1000000;
> +        if (arm_load_dtb(s->binfo.loader_start,
> +                         &s->binfo, s->binfo.dtb_limit, as) < 0) {
> +            exit(EXIT_FAILURE);
> +        }
> +    }

The board init code only calls arm_load_kernel() if machine->kernel_filename
is set. This is a bug, because calling arm_load_kernel() is mandatory
for board code -- it is the place where we set up the reset handler
that resets the CPUs, so if you don't call it the CPU objects don't
get reset.

thanks
-- PMM

