Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7843D531139
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 15:53:57 +0200 (CEST)
Received: from localhost ([::1]:60762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt8VQ-00085J-Kd
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 09:53:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nt8Ti-000705-FU
 for qemu-devel@nongnu.org; Mon, 23 May 2022 09:52:10 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:37756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nt8Tf-0003bR-Ud
 for qemu-devel@nongnu.org; Mon, 23 May 2022 09:52:09 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id v71so25501598ybi.4
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 06:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0fEqwDnkXMzHaJze/joGmtMrBz1RiVRvPrAHSDu9gwg=;
 b=VnWO/t6M7IMxQDVNETBRtqUpaOod4Ja9CXHFSas+9g+IdeT+PRCwlLYPMRwLTn1VNL
 AHKElkzN3AY1DFo7+YrEX9ZFx7rl/KSHm/7311DVvSnzjwBITtNRiT/UBtx6LO2vSFgw
 EEw5r6h+EWGk9Y9edV5W9xnaDClp75VbLYAaO3Vaem/DXDjy5VQVLJ1Eohc0camkpnYI
 XWtxV7MN4r9uXWCYXLOk7VCKHeK4+FyjunGnsqJg9TopwAbDeqfwRbb14Rg02IWqHTGd
 wuiDtHWelJKvV8RMhxvXV5wSxUQoEje8KVq9+YN4cgitw2X3YHUvtGRICh7dqZ+fagQy
 cPvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0fEqwDnkXMzHaJze/joGmtMrBz1RiVRvPrAHSDu9gwg=;
 b=Yg5ZSpkjZI1yxjxLmeBFL2okjGYxgrh1iEucxzgX4C5AuUup10+3fZ/eXUGH2JIITp
 27BlYighrlCe51Gl75ezu3UrfQcIioNtBG5nmnv9CNQOqmDsyKts9UK4Fme5tPeV4FwW
 k0gZ0hXOKfj39DsWb4sa+ay3eOkYyJKs1d4TDWH25kwK6/6fQ6MAh9NkWWWOQV2jQBki
 NLchJQ6xdaVt+4MTeLb701qsLxm2lCHh09Sk04gZ+AewkrzCJ+gWk/HR//EGlGCrrRfX
 GMYmJv7VnHPOcwsNEPMehprU4f62kUPp2HEG5dcc1kpcQz/79wkwfSa/xfp6oGsvFEFf
 CYIA==
X-Gm-Message-State: AOAM530NGFBmfSRjJb34ZP+vQmdvejOl/dwOrKSACxk6yORw3hMLkYsG
 gE8RjrG+PxspV0L1sVlkNzJWQ4LZqpCVw6xN1trYgA==
X-Google-Smtp-Source: ABdhPJypXq98MSBJe/KFW1MHFuqrvb1BmyF2OJddq7gIByIhYg0hnI8SP7fiB2Cye02imidukHXBDaPL2ohoFcOfi6g=
X-Received: by 2002:a5b:c08:0:b0:64f:de42:5ecc with SMTP id
 f8-20020a5b0c08000000b0064fde425eccmr5345745ybq.85.1653313926842; Mon, 23 May
 2022 06:52:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220519153829.356889-1-fkonrad@amd.com>
 <20220519153829.356889-3-fkonrad@amd.com>
In-Reply-To: <20220519153829.356889-3-fkonrad@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 May 2022 14:51:55 +0100
Message-ID: <CAFEAcA-v6fr3tqSKNuc5T3X=Wnp8+UHsUHqKFWzYgg41p1_G1g@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] xlnx_dp: Introduce a vblank signal
To: Frederic Konrad <fkonrad@amd.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, edgar.iglesias@gmail.com, 
 alistair@alistair23.me, saipava@xilinx.com, edgari@xilinx.com, 
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>, 
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 19 May 2022 at 16:39, Frederic Konrad <fkonrad@amd.com> wrote:
>
> From: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
>
> Add a periodic timer which raises vblank at a frequency of 30Hz.
>
> Signed-off-by: Sai Pavan Boddu <saipava@xilinx.com>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> Changes by fkonrad:
>   - Switched to transaction-based ptimer API.
>   - Added the DP_INT_VBLNK_START macro.
> Signed-off-by: Frederic Konrad <fkonrad@amd.com>
> ---


> @@ -107,6 +108,8 @@ struct XlnxDPState {
>       */
>      DPCDState *dpcd;
>      I2CDDCState *edid;
> +
> +    ptimer_state *vblank;
>  };

The ptimer has internal state which needs to be considered in
migration. This means you need to either include it in the device
vmstate struct (there is a VMSTATE_PTIMER macro for this), or
else set it up again in a post-load hook. Otherwise if you do
a migration or state save/load when the timer is running then
on resume the timer won't be running when it should.

Apologies for not noticing this in my first review.

-- PMM

