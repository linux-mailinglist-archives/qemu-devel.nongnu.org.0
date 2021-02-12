Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAAB319D4D
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 12:23:02 +0100 (CET)
Received: from localhost ([::1]:50740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAWXN-0005dI-PV
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 06:23:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAWUV-0003zs-Ld
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 06:20:03 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:32850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAWUT-0006ET-LL
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 06:20:03 -0500
Received: by mail-ej1-x636.google.com with SMTP id jt13so2277531ejb.0
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 03:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=Lve7dpICVmMuYk/dTxbhJ3NggBKtPwRUvp7xp/DvJMw=;
 b=VRdz6LL4WoCEjSoLL0UMVKUhKqC0gP4U99SyO5JuUub0OPFrCyaM6HSHIep4tIbMfj
 vb/Opa3l0L/vm29Kt003/q29miFU/YvN798x8CGUqFgq8keFaEMoe4jt+qRjDjPwM2Jj
 YFtKGVpnYMFAsi+iDmxE5dl4G89WlAVLZ1GDGULVF5CEMdFQMplDc+cDqeGaeVEZxHzO
 yTHPaQrvlcZs6QKitd1ADs9ViTgrza4oDStXR5cGU5Kv1tpJCxm96zGzBxbi9R0aoBNS
 l3DSk6XOOk7YdHV8TO8qYvqfSGB4CsxbjRuLvSWGmllZTClmVi8qovBh05COxWr1hzAP
 Sf+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=Lve7dpICVmMuYk/dTxbhJ3NggBKtPwRUvp7xp/DvJMw=;
 b=ewfocI09UKzFJN3Ular1mMPCZd4nBNNzDALsPJ53rWJL47vh/ND/GQ+TbQXo5mSIrv
 Xxz0F3BucDxQyJc9CkXJlAD2ejbubPLd8TFcbhtghd/wjRI6xRWep1aqWIqEpE5Ge4NA
 vw/ilIXUxinmW59uH2jsaE32cy5HrRdfEWZUJ4MbPTSAoUsf9LWWysxt+QDfi/MyhnTU
 SD4eswN8c60NzodM57sKOOzba9FUfjLGbPGjmIW4Wz2Ft15OVmru2Cg0ybSPzmV/bRWz
 trNai2xvwbtbcGivuI/1EskikaI8Di6aRlDiwd7hVWzMetbjlHzo43BD+EWpRVmNC/Z6
 tr/Q==
X-Gm-Message-State: AOAM533X+Jv4qHG+NqHJk1apS+/fdyKjvuCCby2zxPD33n2AOysigJLy
 gIbD/sQLnVo6rLb0+kuIKE2igtq2xkRiUCjwUvYF/71LuiEhwg==
X-Google-Smtp-Source: ABdhPJyVFj5nzz0WQD3qqf5P2G+9eo2HQjc3U33UhU+sanV7NUwFup5t/a2qDQNGToSy6u/TiduqRBDoVF6BnvTh+hU=
X-Received: by 2002:a17:906:184e:: with SMTP id
 w14mr2573056eje.56.1613128799477; 
 Fri, 12 Feb 2021 03:19:59 -0800 (PST)
MIME-Version: 1.0
References: <20210205170019.25319-1-peter.maydell@linaro.org>
 <20210205170019.25319-21-peter.maydell@linaro.org>
In-Reply-To: <20210205170019.25319-21-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Feb 2021 11:19:48 +0000
Message-ID: <CAFEAcA-zM5iQQwbKpAwRKuv5upDguxRthzmhJVzaJ7sn4jmp2Q@mail.gmail.com>
Subject: Re: [PATCH 20/24] hw/arm/mps2-tz: Add new mps3-an524 board
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 5 Feb 2021 at 17:00, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Add support for the mps3-an524 board; this is an SSE-200 based FPGA
> image, like the existing mps2-an521.  It has a usefully larger amount
> of RAM, and a PL031 RTC, as well as some more minor differences.
>
> In real hardware this image runs on a newer generation of the FPGA
> board, the MPS3 rather than the older MPS2.  Architecturally the two
> boards are similar, so we implement the MPS3 boards in the mps2-tz.c
> file as variations of the existing MPS2 boards.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/mps2-tz.c | 136 +++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 132 insertions(+), 4 deletions(-)
>
> diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
> index 17173057af2..aa57c4b2596 100644
> --- a/hw/arm/mps2-tz.c
> +++ b/hw/arm/mps2-tz.c
> @@ -27,11 +27,13 @@
>   * http://infocenter.arm.com/help/topic/com.arm.doc.dai0505b/index.html
>   * Application Note AN521:
>   * http://infocenter.arm.com/help/topic/com.arm.doc.dai0521c/index.html
> + * Application Note AN524:
> + * https://developer.arm.com/documentation/dai0524/latest/
>   *
>   * The AN505 defers to the Cortex-M33 processor ARMv8M IoT Kit FVP User Guide
>   * (ARM ECM0601256) for the details of some of the device layout:
>   *   http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ecm0601256/index.html
> - * Similarly, the AN521 uses the SSE-200, and the SSE-200 TRM defines
> + * Similarly, the AN521 and AN524 use the SSE-200, and the SSE-200 TRM defines
>   * most of the device layout:
>   *  http://infocenter.arm.com/help/topic/com.arm.doc.101104_0100_00_en/corelink_sse200_subsystem_for_embedded_technical_reference_manual_101104_0100_00_en.pdf
>   *

Just noticed that I forgot one place in this header comment that needs
updating; this trivial fragment also should be squashed in:

--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -16,6 +16,7 @@
  * This source file covers the following FPGA images, for TrustZone cores:
  *  "mps2-an505" -- Cortex-M33 as documented in ARM Application Note AN505
  *  "mps2-an521" -- Dual Cortex-M33 as documented in Application Note AN521
+ *  "mps2-an524" -- Dual Cortex-M33 as documented in Application Note AN524
  *
  * Links to the TRM for the board itself and to the various Application
  * Notes which document the FPGA images can be found here:


thanks
-- PMM

