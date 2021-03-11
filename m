Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76352337FD0
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 22:44:35 +0100 (CET)
Received: from localhost ([::1]:50354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKT6g-0006O3-Ga
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 16:44:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lKT5X-0005j3-0T; Thu, 11 Mar 2021 16:43:23 -0500
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:44235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lKT5V-00048r-Du; Thu, 11 Mar 2021 16:43:22 -0500
Received: by mail-io1-xd2c.google.com with SMTP id 81so23544640iou.11;
 Thu, 11 Mar 2021 13:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qywYbhsLgzrHCXc6c6o7KQhf8hv4FYtFnKoH6Pq5Wu4=;
 b=bhX0m7mHvzizSw+QR9KymuGuNg9pxR8k3q3+8QdLyCRO5vSsd6LbCG69YhnOILV9U3
 QWxstKsc/dVOS2Vs6Y5T+w9opyfXzpVnJ2DZAEfwdty4qxBziA66K/stNOapzdSTQk8t
 +gnaqpX9/odcTJu65y2krch8A+TbjtR3jnOXpiHvZP88QbK78EJ+wngv51ozeLhu9iXR
 FqvmewL97EjMcuwKIZFn2Oocw8YkEqSqIoxMjNEO2z03AIsw3nqQZlWBqbErx1Zgvw3S
 cB4TVTRfdH+Pu08LfzhfE9LT7qK5DKDvYsx954V6x6GOsXgkUcpQsi2DlOViYe7IAnut
 2TVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qywYbhsLgzrHCXc6c6o7KQhf8hv4FYtFnKoH6Pq5Wu4=;
 b=rd7j+Xhrpes1zC6/STgrkkVeJE0OlrT7AdYasQ2gp3rh4TJBQLXfCJM/76j0OTByMo
 oye7+OBeowPGfwzu65LNnV7EJDeIZH4Z3Ngxf/sbKro2cy0Ov3t3Yqtwnhwc8VKdDLWl
 OuSz2KA9TNmMYU+zK450CpQD2BuXh+TOsoooY6PC+eMGVILhF3+qwSPW1AvsMxt7Ri0H
 6HrM8+bev1MxSPvceMbSx1Aje4ASY92lvmtOpK1Yf4ySBJWB3y/2HCFYN0U2PLbyRKMf
 JdRPMm5ROjN2x3mbh9l67f/yCyCpePBMX9zdGlC2LMIp6weTWB4LeCgV2sWd/YSLv5Hk
 RcfQ==
X-Gm-Message-State: AOAM531RBLJzVlox/KAkcSuRoIPlDZsop2IbkoQDZ5jKC3OrJLScebKU
 TZaJue8HMWUDLzAAzxZ38zzSsuZxxaR4ayGuupY=
X-Google-Smtp-Source: ABdhPJy/XjFYpBe4Ry6tyZaMPHfsWT9FR69AUs9pHVezV5Nl3s94vZbZ8L2vKSrzb5cIaLe81rupi/fW+oUw41EuQhA=
X-Received: by 2002:a5d:9459:: with SMTP id x25mr8006985ior.176.1615499000080; 
 Thu, 11 Mar 2021 13:43:20 -0800 (PST)
MIME-Version: 1.0
References: <20210310221208.167990-1-alexander.wagner@ulal.de>
In-Reply-To: <20210310221208.167990-1-alexander.wagner@ulal.de>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 11 Mar 2021 16:41:58 -0500
Message-ID: <CAKmqyKP_TnxAnqRbgLWbcu3s9fQKingHfX1ADWG=_3hYTHk2VA@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: Fix OT IBEX reset vector
To: Alexander Wagner <alexander.wagner@ulal.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 10, 2021 at 5:23 PM Alexander Wagner
<alexander.wagner@ulal.de> wrote:
>
> The IBEX documentation [1] specifies the reset vector to be "the most
> significant 3 bytes of the boot address and the reset value (0x80) as
> the least significant byte".
>
> [1] https://github.com/lowRISC/ibex/blob/master/doc/03_reference/exception_interrupts.rst
>
> Signed-off-by: Alexander Wagner <alexander.wagner@ulal.de>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/opentitan.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
> index e168bffe69..ca4c1be6f6 100644
> --- a/hw/riscv/opentitan.c
> +++ b/hw/riscv/opentitan.c
> @@ -120,7 +120,7 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
>                              &error_abort);
>      object_property_set_int(OBJECT(&s->cpus), "num-harts", ms->smp.cpus,
>                              &error_abort);
> -    object_property_set_int(OBJECT(&s->cpus), "resetvec", 0x8090, &error_abort);
> +    object_property_set_int(OBJECT(&s->cpus), "resetvec", 0x8080, &error_abort);
>      sysbus_realize(SYS_BUS_DEVICE(&s->cpus), &error_abort);
>
>      /* Boot ROM */
> --
> 2.25.1
>
>

