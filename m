Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 283B52C4226
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 15:26:18 +0100 (CET)
Received: from localhost ([::1]:51332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khvkO-0004Cj-JO
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 09:26:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1khvjC-0003cK-Uy; Wed, 25 Nov 2020 09:25:02 -0500
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:35798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1khvjB-0004QI-8h; Wed, 25 Nov 2020 09:25:02 -0500
Received: by mail-pf1-x442.google.com with SMTP id e8so2489881pfh.2;
 Wed, 25 Nov 2020 06:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0YKonwth5B9CcTF7ErTs5ytvfI54YXFd2EyuwKgo0Pw=;
 b=QEPzPhltsD2HCNJ3JOkI7zlxoRphLY9BBCgSf8763VHVLDfq6qHB4DJSCkMGPdqzfQ
 t0nK1SvLLWNO5WdlkmK03g1rENz38W9Yi/mwo13DlYUaHPYIbXupYv8U5V9hL4IAjSyF
 Dq19aRaUjLINUZZSFU63X5mTu7rZgPhfUxq6S3aFU7E0ygnyo5d2KgvEYA2EWANFtVTu
 POh8yrMv+NimHB2dL5nW/7yG+2jvdB3/s4ID74Z8O9WPiyKpTM64SGJDM3+xDkV056Z5
 g5NN1ApOoCwdTacgbLkZsI2qbch3xM73Jd6LNzzEzozQQU0gf1cf/EpFPGxoow+N2zdz
 sE1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0YKonwth5B9CcTF7ErTs5ytvfI54YXFd2EyuwKgo0Pw=;
 b=lSv1lBwiFjd4dzxnadt5Eu2NndH1A9x7iQwicZV3TJc5CucOxHs04ww5HAtYlAlyRV
 Q8GKIQ5vFE6caa9TIwwknpYW1ePL8+Cwo8zYnzut3J2m29/TxqWgxsQdGXZc8dfbv+Xr
 GKN+IhznV65iZVnvVNfcadEELgEWKbvKf8iWcmsSpWpDw+b380FO/s1P4F4uH3JbS9yg
 Br4Y9tE9pechiqeqjOJ/t7VJsQr86p5G5Jagvcv0u7E39UlJQZeB087L5aVJAB7j0wzB
 uyobLkmEVgK2IFsmdmGfqIspWvugZE+2zZP3onTKCzxJeyspQvWFVEalOqkuiYCCg786
 yUxQ==
X-Gm-Message-State: AOAM533w5eeiYhXYxR23aZrqDD2sT+JgeVr/J3RyLy8j/NIKh1oxaMA/
 EW+mTF9AfcrEpLdLSyq+9cg=
X-Google-Smtp-Source: ABdhPJzt+msXWZXubvklxWtdpd3//Fgmp/T+MKvbGx/x2hh39T+OGuPFbCienUFbeojQwEOJpJEyww==
X-Received: by 2002:a63:194d:: with SMTP id 13mr3287072pgz.317.1606314299563; 
 Wed, 25 Nov 2020 06:24:59 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id ha21sm3066817pjb.2.2020.11.25.06.24.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 25 Nov 2020 06:24:58 -0800 (PST)
Date: Wed, 25 Nov 2020 23:24:56 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH 1/2] nvme: updated shared header for copy command
Message-ID: <20201125142456.ujotoholyodthygm@localhost.localdomain>
References: <20201124071418.12160-1-its@irrelevant.dk>
 <20201124071418.12160-2-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201124071418.12160-2-its@irrelevant.dk>
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pf1-x442.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

On 20-11-24 08:14:17, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Add new data structures and types for the Simple Copy command.
> 
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: Fam Zheng <fam@euphon.net>
> ---
>  include/block/nvme.h | 45 ++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 43 insertions(+), 2 deletions(-)
> 
> diff --git a/include/block/nvme.h b/include/block/nvme.h
> index e95ff6ca9b37..b56efd6a89af 100644
> --- a/include/block/nvme.h
> +++ b/include/block/nvme.h
> @@ -472,6 +472,7 @@ enum NvmeIoCommands {
>      NVME_CMD_COMPARE            = 0x05,
>      NVME_CMD_WRITE_ZEROES       = 0x08,
>      NVME_CMD_DSM                = 0x09,
> +    NVME_CMD_COPY               = 0x19,
>  };
>  
>  typedef struct QEMU_PACKED NvmeDeleteQ {
> @@ -603,6 +604,35 @@ typedef struct QEMU_PACKED NvmeDsmRange {
>      uint64_t    slba;
>  } NvmeDsmRange;
>  
> +enum {
> +    NVME_COPY_FORMAT_0 = 0x0,
> +};
> +
> +typedef struct NvmeCopyCmd {
> +    uint8_t     opcode;
> +    uint8_t     flags;
> +    uint16_t    cid;
> +    uint32_t    nsid;
> +    uint32_t    rsvd2[4];
> +    NvmeCmdDptr dptr;
> +    uint64_t    sdlba;
> +    uint32_t    cdw12;
> +    uint32_t    cdw13;
> +    uint32_t    ilbrt;
> +    uint16_t    lbat;
> +    uint16_t    lbatm;
> +} NvmeCopyCmd;
> +
> +typedef struct NvmeCopySourceRange {
> +    uint8_t  rsvd0[8];
> +    uint64_t slba;
> +    uint16_t nlb;
> +    uint8_t  rsvd18[6];
> +    uint32_t eilbrt;
> +    uint16_t elbatm;
> +    uint16_t elbat;
> +} NvmeCopySourceRange;
> +
>  enum NvmeAsyncEventRequest {
>      NVME_AER_TYPE_ERROR                     = 0,
>      NVME_AER_TYPE_SMART                     = 1,
> @@ -680,6 +710,7 @@ enum NvmeStatusCodes {
>      NVME_CONFLICTING_ATTRS      = 0x0180,
>      NVME_INVALID_PROT_INFO      = 0x0181,
>      NVME_WRITE_TO_RO            = 0x0182,
> +    NVME_CMD_SIZE_LIMIT         = 0x0183,
>      NVME_WRITE_FAULT            = 0x0280,
>      NVME_UNRECOVERED_READ       = 0x0281,
>      NVME_E2E_GUARD_ERROR        = 0x0282,
> @@ -831,7 +862,7 @@ typedef struct QEMU_PACKED NvmeIdCtrl {
>      uint8_t     nvscc;
>      uint8_t     rsvd531;
>      uint16_t    acwu;
> -    uint8_t     rsvd534[2];
> +    uint16_t    ocfs;
>      uint32_t    sgls;
>      uint8_t     rsvd540[228];
>      uint8_t     subnqn[256];
> @@ -854,6 +885,11 @@ enum NvmeIdCtrlOncs {
>      NVME_ONCS_FEATURES      = 1 << 4,
>      NVME_ONCS_RESRVATIONS   = 1 << 5,
>      NVME_ONCS_TIMESTAMP     = 1 << 6,
> +    NVME_ONCS_COPY          = 1 << 8,
> +};
> +
> +enum NvmeIdCtrlOcfs {
> +    NVME_OCFS_COPY_FORMAT_0 = 1 << NVME_COPY_FORMAT_0,

I'd prefer (1 << 0) to (1 << enum) which is more obvious and same style
with enum NvmeIdCtrlOncs.

But I'm fine with both cases.

Please add:

Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>

