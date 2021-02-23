Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B67AD322779
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 10:07:37 +0100 (CET)
Received: from localhost ([::1]:51482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lETfM-0006Qs-Q0
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 04:07:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1lETaL-0003bv-R7; Tue, 23 Feb 2021 04:02:26 -0500
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:41374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1lETaK-0007R5-7V; Tue, 23 Feb 2021 04:02:25 -0500
Received: by mail-lf1-x131.google.com with SMTP id d24so10022174lfs.8;
 Tue, 23 Feb 2021 01:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1d5KrpF2uGQA4mfYkB2T97VwW38zrUtX1brQ5yiTY+w=;
 b=McODWlTD1W02YDfoTAzSo+D0FFTU3Jy8DOD8ZTC3RZgSCAsKah/qLD+n6Km1XsLScG
 gNMHCq4QAih/ubq5pjM+meqp8Y0HVEyHpKkvPRJpVxQJ5eDxksCw+OboTyah2xsTGukJ
 SxVykDi9WZLFAXml1dGP2HO6Gkm4VzjxLnNNhPqaULJv+9pphiknFnoSONWrBBGE4x17
 kKkJqZV+tlqsTS87u9u38f59j+Mhx3P6CH5QWrg3+WRPMn71bl95AVv+cjHYBuceHhhQ
 bu/40dc17B+JDginf5kCyYoCRXZLsRhjnAXWWzoYIc6lzcD8+LekEB0y/M/hi8AT6R5O
 PUKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1d5KrpF2uGQA4mfYkB2T97VwW38zrUtX1brQ5yiTY+w=;
 b=cYo6ggoemcAQByI7/nKse9BpzhLdb39jpPeXvnGcjH9Cs+PVk64XRPWZUxxgJtnGOH
 yk+BPs1mgvbuAMok7Re3wPt6d/HVgfjwzrwa/e3Q1AGPGJR5NXgleaakpL24C0ZUn80h
 cVz1ZtlDKJMCS04knXvtV1jOBTM5qYq1UUz7Flc/aVVkct/jeFTNmIqgLUhjfQImvpLl
 dyD82rgrOF0KcChAfgDggHSrP0rwb27JSBcvhayjtOVhVjNyXDH+l8Y2A5sCGW7iPQO6
 5GARTr+JF+/32kkELC0VnPyfy02GUWsuWwlxCTQcHDDuG6N77WGbLkObBmF7zIggWZ6W
 ubgw==
X-Gm-Message-State: AOAM531fXJVacyp6pEkD6QMnmJpa1Jm9eFCbksidMpn4IYSeWFfF8sGU
 Ve7eJlCaVrNv8IMvlmr7oj8=
X-Google-Smtp-Source: ABdhPJzVWGQ+SaT7j8jeAAB/BViu+88CAUjJotDAmMQOLCDI9zdpm4XkVtLz2QgyJ9xg8GiOUC0lFA==
X-Received: by 2002:ac2:523a:: with SMTP id i26mr705789lfl.473.1614070942187; 
 Tue, 23 Feb 2021 01:02:22 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id k27sm1329835lfm.125.2021.02.23.01.02.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 01:02:21 -0800 (PST)
Date: Tue, 23 Feb 2021 10:02:21 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH v4 5/5] hw/ssi: xilinx_spips: Remove DMA related dead
 codes from zynqmp_spips
Message-ID: <20210223090221.GT477672@toto>
References: <20210222130514.2167-1-bmeng.cn@gmail.com>
 <20210222130514.2167-6-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210222130514.2167-6-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org, Francisco Iglesias <francisco.iglesias@xilinx.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 22, 2021 at 09:05:14PM +0800, Bin Meng wrote:
> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> 
> Now that the Xilinx CSU DMA model is implemented, the existing
> DMA related dead codes in the ZynqMP QSPI are useless and should
> be removed. The maximum register number is also updated to only
> include the QSPI registers.
> 
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> 
> ---
> 
> Changes in v4:
> - Modify XLNX_ZYNQMP_SPIPS_R_MAX
> 
> Changes in v3:
> - new patch: xilinx_spips: Remove DMA related code from zynqmp_qspips
> 
>  include/hw/ssi/xilinx_spips.h |  2 +-
>  hw/ssi/xilinx_spips.c         | 10 ----------
>  2 files changed, 1 insertion(+), 11 deletions(-)
> 
> diff --git a/include/hw/ssi/xilinx_spips.h b/include/hw/ssi/xilinx_spips.h
> index 3eae73480e..06bfd18312 100644
> --- a/include/hw/ssi/xilinx_spips.h
> +++ b/include/hw/ssi/xilinx_spips.h
> @@ -34,7 +34,7 @@
>  typedef struct XilinxSPIPS XilinxSPIPS;
>  
>  #define XLNX_SPIPS_R_MAX        (0x100 / 4)
> -#define XLNX_ZYNQMP_SPIPS_R_MAX (0x830 / 4)
> +#define XLNX_ZYNQMP_SPIPS_R_MAX (0x200 / 4)
>  
>  /* Bite off 4k chunks at a time */
>  #define LQSPI_CACHE_SIZE 1024
> diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
> index 8a0cc22d42..1e9dba2039 100644
> --- a/hw/ssi/xilinx_spips.c
> +++ b/hw/ssi/xilinx_spips.c
> @@ -195,13 +195,6 @@
>  #define R_GQSPI_MOD_ID        (0x1fc / 4)
>  #define R_GQSPI_MOD_ID_RESET  (0x10a0000)
>  
> -#define R_QSPIDMA_DST_CTRL         (0x80c / 4)
> -#define R_QSPIDMA_DST_CTRL_RESET   (0x803ffa00)
> -#define R_QSPIDMA_DST_I_MASK       (0x820 / 4)
> -#define R_QSPIDMA_DST_I_MASK_RESET (0xfe)
> -#define R_QSPIDMA_DST_CTRL2        (0x824 / 4)
> -#define R_QSPIDMA_DST_CTRL2_RESET  (0x081bfff8)
> -
>  /* size of TXRX FIFOs */
>  #define RXFF_A          (128)
>  #define TXFF_A          (128)
> @@ -417,9 +410,6 @@ static void xlnx_zynqmp_qspips_reset(DeviceState *d)
>      s->regs[R_GQSPI_GPIO] = 1;
>      s->regs[R_GQSPI_LPBK_DLY_ADJ] = R_GQSPI_LPBK_DLY_ADJ_RESET;
>      s->regs[R_GQSPI_MOD_ID] = R_GQSPI_MOD_ID_RESET;
> -    s->regs[R_QSPIDMA_DST_CTRL] = R_QSPIDMA_DST_CTRL_RESET;
> -    s->regs[R_QSPIDMA_DST_I_MASK] = R_QSPIDMA_DST_I_MASK_RESET;
> -    s->regs[R_QSPIDMA_DST_CTRL2] = R_QSPIDMA_DST_CTRL2_RESET;
>      s->man_start_com_g = false;
>      s->gqspi_irqline = 0;
>      xlnx_zynqmp_qspips_update_ixr(s);
> -- 
> 2.25.1
> 

