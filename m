Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 834194C4591
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 14:12:45 +0100 (CET)
Received: from localhost ([::1]:41556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNaOq-0004uI-De
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 08:12:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNa1H-0007ru-Tf
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 07:48:25 -0500
Received: from [2607:f8b0:4864:20::112b] (port=34083
 helo=mail-yw1-x112b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNa1F-0007zc-8W
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 07:48:23 -0500
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2d625082ae2so32370337b3.1
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 04:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mBhQK3zhWaQwixz1l2lwxZYLfIdVVXdnHwxKF/j9JOs=;
 b=MyO7emENzLigfvifaexB2bgi9KLMxaNfLY1GpYU2WjVmfKAzIS64aYl3U/pMBj9YQB
 HMxmXewID9i8BlAy2LWiPrkV2lh+0WNZz83qcwynKUaJC412NWIaW08n2gYHMIN9Lzr4
 ZU2ugSIrSfZsRXjtaFnWtvb5Zec4tLt/zf0xcjC46P/RW/knCqrcnQU7yanKrHVMY0fm
 rYmKs+4x6OIDz24DI9DRHuXyuNMb+NElv11kuk1buVTn42MqhmjfCNsuQFQgtNXOyGdh
 rUYt0Rn9zxt3mjyGTcs7IJUW51CiTs0etUEYhPACJlZQkybXCrnPxJB08FlVSPvks8y0
 sk0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mBhQK3zhWaQwixz1l2lwxZYLfIdVVXdnHwxKF/j9JOs=;
 b=3eFiG1moIJH0QzP6vRa+Y6sRnYW6WnsiZoHgZNk64C+LmlErAPlkesgqXjBi75kl07
 EEO/iiR5UmJ1LNljE3NVQe+3xz32S4+cxTO+aZhdcGX4GTWz/LONshmFQh8nfzI0OcPe
 0o/Ne82oa8XNwn+XkGtupszfl5rcHEdKJ5IJyRrBQwe9LjYgGm6Eqmf+6bZkLxx8K6R0
 DyXva3L8zvSMiGlM/as2ttNbJ4xq6WQvyt9t2BA6MwkrGscd6kJyN258x1FzXdFlk3X+
 1KKJPEwHhBLByPq7g4w5I0gGAQ+mT93Ae/QfvtxkqrV/oZHc0RnRXl3L37iD3LbRqZB7
 Xw4A==
X-Gm-Message-State: AOAM530dp6YxT5JhjkvYCYVmX9ISWpdHwaC01Go+bFyByAXyx3DUr8mX
 udxvP51aT7795KHvCw7MmM/hsse4x9q2DnzRdXuB2w==
X-Google-Smtp-Source: ABdhPJxGgfsHmPTry7/RQwbPicLKXJJJZcQhQBylgavm0rnflsRy9+z8mxw+koHZUeZDa+bEhKN7cKT7qwTGCJJHvvk=
X-Received: by 2002:a0d:d5c8:0:b0:2d5:e0a:56c0 with SMTP id
 x191-20020a0dd5c8000000b002d50e0a56c0mr7206081ywd.10.1645793300075; Fri, 25
 Feb 2022 04:48:20 -0800 (PST)
MIME-Version: 1.0
References: <20220224134901.500007-1-amir.gonnen@neuroblade.ai>
 <20220224134901.500007-5-amir.gonnen@neuroblade.ai>
In-Reply-To: <20220224134901.500007-5-amir.gonnen@neuroblade.ai>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Feb 2022 12:48:07 +0000
Message-ID: <CAFEAcA8ANLW1hKxKYZrOYA3d7be-12otK2H+6nDd-9R-PK=CDg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] hw/nios2: Machine with a Vectored Interrupt
 Controller
To: Amir Gonnen <amir.gonnen@neuroblade.ai>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Marek Vasut <marex@denx.de>, Chris Wulff <crwulff@gmail.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 24 Feb 2022 at 13:50, Amir Gonnen <amir.gonnen@neuroblade.ai> wrote:
>
> Demonstrate how to use nios2 VIC on a machine.
> Introduce a new machine "10m50-ghrd-vic" which is based on "10m50-ghrd"
> with a VIC attached and internal interrupt controller removed.
>
> When VIC is present, irq0 connects the VIC to the cpu, intc_present
> is set to false to disable the internal interrupt controller, and the
> devices on the machine are attached to the VIC (and not directly to cpu).
> To allow VIC update EIC fields, we set the "cpu" property of the VIC
> with a reference to the nios2 cpu.
>
> Signed-off-by: Amir Gonnen <amir.gonnen@neuroblade.ai>

Is a VIC a configurable option on the real hardware (well,
FPGA image, I guess) that this board is modelling ?
I couldn't find any docs on it with a quick google.

Also, I wonder if we should have a vic machine option to the
machine rather than creating a whole new machine type?

thanks
-- PMM

