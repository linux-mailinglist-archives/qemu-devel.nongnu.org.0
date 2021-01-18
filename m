Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A577C2FA076
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 13:53:45 +0100 (CET)
Received: from localhost ([::1]:35784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1U2S-00073p-Mi
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 07:53:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l1U1K-0006Fh-Cl; Mon, 18 Jan 2021 07:52:35 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:38014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l1U1H-0002VB-2r; Mon, 18 Jan 2021 07:52:34 -0500
Received: by mail-pj1-x1031.google.com with SMTP id x20so4351301pjh.3;
 Mon, 18 Jan 2021 04:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=DGEwHl5uKzCqTXAfi3qkJIwWXtFlZgCvJmIZgVk56A8=;
 b=miMv8tXyRzc8QzaEBPvWrpy26IbsPLjCLyYlOfO8R4pQTo5eUzolTdRTY570Tu4LAm
 69jtMjxtXmG1fSyPxr4pAK43sYpGqIR7Tm1J9pMkbvW78m71ovWS1Mxh8vWejIeIV7bM
 852uGlj7NvU78XBtpNTnfVu39fUSediFyIcRxep7t3jpptI+A66eNPMt2IOCT8T2oLt5
 0T1qMN0OPFRaTEC8cPlheCoBnrcnXHpFpE4+7ORYTTwXx45MwGW8Ba8BWpP2dk9i9W83
 ZPgvATp088IFGQArLxKpe+O+LuALYC7wdgngasR67/IIMHYefN3ya5KUfm6SM6WD/JBN
 LoJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DGEwHl5uKzCqTXAfi3qkJIwWXtFlZgCvJmIZgVk56A8=;
 b=bAN2H016/Z3XlyyqFwUtv/mDRMOPUF4kkoZRjbqme4pMkgYyRRMXxBEERK1H7BDFcK
 HpmOmOxgjL4Q9jpkBopu88EhDLbPbulyRS8OB+P1MzoyED3nILPpL1wO1TlsP0KMGHt9
 Ols7olGgfe3JwOoQQCYVml9VVIA5VDZ02P+5AKm/LSC1XjDuvUOvr4PpbuEsO+OwtzRF
 cPUabxl2VpppWXbm7TLkwfd28jxEWVL6cffSV8s92ezDq7sCM79VAj9iACpUNlHoLqaF
 YrdN4vmh1kKVifCtocX5uiZIK/lsx04F56411CwDpX9v+kQ5tgAEErB6t6X6wOuhw7Sx
 Z2CQ==
X-Gm-Message-State: AOAM531UVT+/6wfSk4R8Mobo3JVryQN+35lhSBf8oQtr8m0L5zAKF0d2
 Xh8bPE2M+Ya3mpQBy59FhBQ=
X-Google-Smtp-Source: ABdhPJyVETb5cWgaXyD98mN5qDWaXdsTbQZ1JNshNx02c9O5+c3Vurcaq2xz/Tc8Y/IRNPo77vRLbg==
X-Received: by 2002:a17:90a:de13:: with SMTP id
 m19mr16781460pjv.171.1610974349395; 
 Mon, 18 Jan 2021 04:52:29 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id g17sm16524416pgg.78.2021.01.18.04.52.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 18 Jan 2021 04:52:29 -0800 (PST)
Date: Mon, 18 Jan 2021 21:52:27 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v2 06/12] hw/block/nvme: rename PMR/CMB shift/mask fields
Message-ID: <20210118125227.GF18718@localhost.localdomain>
References: <20210118094705.56772-1-its@irrelevant.dk>
 <20210118094705.56772-7-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210118094705.56772-7-its@irrelevant.dk>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pj1-x1031.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-01-18 10:46:59, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Use the correct field names.
> 
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  include/block/nvme.h | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/include/block/nvme.h b/include/block/nvme.h
> index 86d7fc2f905c..f3cbe17d0971 100644
> --- a/include/block/nvme.h
> +++ b/include/block/nvme.h
> @@ -35,8 +35,8 @@ enum NvmeCapShift {
>      CAP_CSS_SHIFT      = 37,
>      CAP_MPSMIN_SHIFT   = 48,
>      CAP_MPSMAX_SHIFT   = 52,
> -    CAP_PMR_SHIFT      = 56,
> -    CAP_CMB_SHIFT      = 57,
> +    CAP_PMRS_SHIFT     = 56,
> +    CAP_CMBS_SHIFT     = 57,
>  };
>  
>  enum NvmeCapMask {
> @@ -49,8 +49,8 @@ enum NvmeCapMask {
>      CAP_CSS_MASK       = 0xff,
>      CAP_MPSMIN_MASK    = 0xf,
>      CAP_MPSMAX_MASK    = 0xf,
> -    CAP_PMR_MASK       = 0x1,
> -    CAP_CMB_MASK       = 0x1,
> +    CAP_PMRS_MASK      = 0x1,
> +    CAP_CMBS_MASK      = 0x1,
>  };
>  
>  #define NVME_CAP_MQES(cap)  (((cap) >> CAP_MQES_SHIFT)   & CAP_MQES_MASK)
> @@ -81,10 +81,10 @@ enum NvmeCapMask {
>                                                             << CAP_MPSMIN_SHIFT)
>  #define NVME_CAP_SET_MPSMAX(cap, val) (cap |= (uint64_t)(val & CAP_MPSMAX_MASK)\
>                                                             << CAP_MPSMAX_SHIFT)
> -#define NVME_CAP_SET_PMRS(cap, val)   (cap |= (uint64_t)(val & CAP_PMR_MASK)   \
> -                                                           << CAP_PMR_SHIFT)
> -#define NVME_CAP_SET_CMBS(cap, val)   (cap |= (uint64_t)(val & CAP_CMB_MASK)   \
> -                                                           << CAP_CMB_SHIFT)
> +#define NVME_CAP_SET_PMRS(cap, val)   (cap |= (uint64_t)(val & CAP_PMRS_MASK)  \
> +                                                           << CAP_PMRS_SHIFT)
> +#define NVME_CAP_SET_CMBS(cap, val)   (cap |= (uint64_t)(val & CAP_CMBS_MASK)  \
> +                                                           << CAP_CMBS_SHIFT)

Oh, it would have been better folded into [3/12] patch, though.

Changes are looking good to me to represent "Supported".

Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>

>  
>  enum NvmeCapCss {
>      NVME_CAP_CSS_NVM        = 1 << 0,
> -- 
> 2.30.0
> 
> 

