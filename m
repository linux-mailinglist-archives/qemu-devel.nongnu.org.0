Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 378212D964F
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 11:33:15 +0100 (CET)
Received: from localhost ([::1]:49404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kolAI-0002Ec-A4
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 05:33:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kol7l-0001K8-3L
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 05:30:37 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:34783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kol7f-0001ww-Oy
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 05:30:36 -0500
Received: by mail-ej1-x642.google.com with SMTP id g20so21872297ejb.1
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 02:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j635r0UkwSYwxlFcjApHjQqQdaRZ5LaIZNtJODTTfjI=;
 b=D92scb6GApqLry48ecyHyCf3TLOUCHUn3i2e4l4hWWNa+46nPRl9tB43ZYLUpIQ79h
 S83rTtBuEIOIlCYr7pkkKk4j+IF5hPGEFbrn6RxVGLUvxd2lSbi/0oVAPla9KfW0OfgA
 DnuG5GUTErKvduq58J43h9/O0w49xAuZuM6WSyrRcC0035rCvCCVUHgTCDOz0D/mNYl2
 x7a/bFJZQvO1WB1DD7cDWzctnctiS2RJbf6YV5KyjOzWeyeN/QStLHvjiypIak1qaHR2
 xSt4KG2Y+ztl3U2kXau1JcDzqag4tOhYKCAOzVJliSs/XNkZw4Nj+xGMfYnIHRrwJv2v
 MYvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j635r0UkwSYwxlFcjApHjQqQdaRZ5LaIZNtJODTTfjI=;
 b=U1RfOeiToqUBWnZ4OhGFBPwfyoC4noHzZPPE2hBAmDyZNBk42OMTLyrONIxlstf6+p
 E3T04a2xKYBEnPERB/8uE/VAA6pPRyYkC34P+WQbGAwAuXRg+6jItOAwth1zw4nY4tBo
 +IXtxQHDV32QmqtINhoIPPhcJTiDvh3kfSLmSn3+QP3A8/qk/Rzn8niI9U3N0TNN3a9v
 a84yb8q0q0tqQTsPNZJRsH5V5pCb465N6DP1lC9/TCqdIX04d5DXc6p+wTlp00v8zaz4
 Ymo57Fd466J5HygYPaKHMGlWFp5D71Fq3xqTEDBToIVIcQocyke3WLWghiQqTTItKExJ
 M2Rg==
X-Gm-Message-State: AOAM530+8oYR8GPCsbeCjPQ2T4L6PliDURy1r+FeFRZ+lQ4ZF6kgI+QE
 wFh/gLoUyu+hjSxa1c/jNWhBB09pUZFFpp1oSZzPuA==
X-Google-Smtp-Source: ABdhPJxUZCYas6uMXmAKivyMRSCQajRq8Wq0EJlSnDgt+Dc6NfQaAAgtnMmP8FHRJpARNk7jI40H5Q4b5WGmLwINkik=
X-Received: by 2002:a17:906:31d2:: with SMTP id
 f18mr21813190ejf.407.1607941829146; 
 Mon, 14 Dec 2020 02:30:29 -0800 (PST)
MIME-Version: 1.0
References: <1603891979-11961-1-git-send-email-mihai.carabas@oracle.com>
 <1603891979-11961-6-git-send-email-mihai.carabas@oracle.com>
In-Reply-To: <1603891979-11961-6-git-send-email-mihai.carabas@oracle.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Dec 2020 10:30:18 +0000
Message-ID: <CAFEAcA8EE6Vz_VikBg5dyFru-fKomSd4rcUopkM7tF=Heh01Vw@mail.gmail.com>
Subject: Re: [PATCH 5/6] pvpanic : update pvpanic document
To: Mihai Carabas <mihai.carabas@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
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
Cc: Peng Hao <peng.hao2@zte.com.cn>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 28 Oct 2020 at 14:26, Mihai Carabas <mihai.carabas@oracle.com> wrote:
>
> From: Peng Hao <peng.hao2@zte.com.cn>
>
> Add mmio mode as a pci device support info in docs/specs/pvpanic.txt.
>
> Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
> Signed-off-by: Mihai Carabas <mihai.carabas@oracle.com>
> ---
>  docs/specs/pvpanic.txt | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/docs/specs/pvpanic.txt b/docs/specs/pvpanic.txt
> index a90fbca..4258922 100644
> --- a/docs/specs/pvpanic.txt
> +++ b/docs/specs/pvpanic.txt
> @@ -1,7 +1,7 @@
>  PVPANIC DEVICE
>  ==============
>
> -pvpanic device is a simulated ISA device, through which a guest panic
> +pvpanic device is a simulated device, through which a guest panic
>  event is sent to qemu, and a QMP event is generated. This allows
>  management apps (e.g. libvirt) to be notified and respond to the event.
>
> @@ -9,6 +9,9 @@ The management app has the option of waiting for GUEST_PANICKED events,
>  and/or polling for guest-panicked RunState, to learn when the pvpanic
>  device has fired a panic event.
>
> +The pvpanic device can be implemented as an ISA device (using IOPORT),
> +or, since qemu 4.0, as a PCI device.

Version number is outdated here. I would simply say "or as a PCI device".

> +
>  ISA Interface
>  -------------
>
> @@ -24,6 +27,13 @@ bit 1: a guest panic has happened and will be handled by the guest;
>         the host should record it or report it, but should not affect
>         the execution of the guest.
>
> +PCI Interface
> +-------------
> +
> +The PCI interface is similar to the ISA interface except that it uses an MMIO
> +address space provided by its BAR0.

You should be specific about the access width(s) permitted here --
is the access to the register 8-bit only, 32-bit-only, or what ?

> For example, the arm virt machine may
> +enable a pvpanic device by adding '-device pvpanic-pci' to the command line.

No need to be specific to Arm virt here.
"Any machine with a PCI device can enable a pvpanic device by adding
'-device pvpanic-pci' to the command line."


> +
>  ACPI Interface
>  --------------

thanks
-- PMM

