Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D03552FA08A
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 13:57:33 +0100 (CET)
Received: from localhost ([::1]:40402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1U68-0000hs-S8
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 07:57:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l1U4K-00086u-I4; Mon, 18 Jan 2021 07:55:40 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:36863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l1U4D-0003pe-OV; Mon, 18 Jan 2021 07:55:40 -0500
Received: by mail-pl1-x629.google.com with SMTP id e9so4448135plh.3;
 Mon, 18 Jan 2021 04:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=rFdkwm43N0ehrZzsoTx7OEWiO5k4Ca/xg7NQ//dJsV0=;
 b=DqRMRQuwvMJlpb8g7ojDAymnRLATk+749lkIFeYon9+X8eZ16REH9tBGWwDisD+1mQ
 XgM/VIbrw7N5RiGwkID7HBNXmXthSXvN5c73eSTGzAKOBcYk9qgimhgi5nx19P9IgAdf
 sQqNbGd+eDqNQv3l/vTYYSeKKDw9+EKybMN9JV7v7Fsx4/B2dMyzf25AAAwRWTI8KSZo
 iEU8dbRycF3JfWG2s6J/Q4d986zXAZPrdttGOHTstRgUjWX7mmsyy+ER/hSmJZ2TZfOP
 2uvkT81fhZb1IUkqQTR6IN6unoSgJaHvoN383/qPvGJU8GmBhtXV+iMmPDEzgtwzRdXh
 yp3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rFdkwm43N0ehrZzsoTx7OEWiO5k4Ca/xg7NQ//dJsV0=;
 b=VYtYBOvj2DLVTJ95F3Iy2vxMep+8BXv0VMg5KVVodGgo8+IOHo47ZucvaYsrKOX9sb
 zNnQCAeuo2wL/bEX1pULMi9QYz2eT0mgwOuMrlDJGx0T+yR1/ENa861lR2tjMzgBYZOJ
 oeteUiFrdTF+vCXe84zW3+xH/v5f54fWuOKib/5/4P13T4mYWhaL08DH1a0cFeV3lgw6
 8kZ6n+U+6nssxTBJCJuLsTiAa1FeD+flCLwehQh3RppFt0YW61PpPTAIcMxGWxKC5XeQ
 5flToEVBuwY/XmiWU/i9KvK2j78/4GTEK/q2p9mco18q7sLwDZCeBwUSgPCB7H4t6bs1
 jyhw==
X-Gm-Message-State: AOAM531GP44bZDXQ5pUJZ3+8oJYtcpjvSwQckNJsm522b2kgS9j5K68k
 AYijCz0rx/mnppQ2dpWWr1I=
X-Google-Smtp-Source: ABdhPJwomsSiXe92CeMG8O85Okb0Df+T1kOJLb3/rUIn7EIAL1O8EJ/0diQ0EWP/P2XZuQRpm7qjDA==
X-Received: by 2002:a17:90b:4c8e:: with SMTP id
 my14mr14819285pjb.30.1610974531559; 
 Mon, 18 Jan 2021 04:55:31 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id w192sm3756050pff.181.2021.01.18.04.55.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 18 Jan 2021 04:55:31 -0800 (PST)
Date: Mon, 18 Jan 2021 21:55:29 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v2 07/12] hw/block/nvme: remove redundant zeroing of PMR
 registers
Message-ID: <20210118125529.GG18718@localhost.localdomain>
References: <20210118094705.56772-1-its@irrelevant.dk>
 <20210118094705.56772-8-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210118094705.56772-8-its@irrelevant.dk>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pl1-x629.google.com
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

On 21-01-18 10:47:00, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> The controller registers are initially zero. Remove the redundant
> zeroing.
> 
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/block/nvme.c | 35 -----------------------------------
>  1 file changed, 35 deletions(-)
> 
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index f3bea582b3c0..9ee9570bb65c 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -4179,43 +4179,8 @@ static void nvme_init_cmb(NvmeCtrl *n, PCIDevice *pci_dev)
>  
>  static void nvme_init_pmr(NvmeCtrl *n, PCIDevice *pci_dev)
>  {
> -    /* PMR Capabities register */
> -    n->bar.pmrcap = 0;
> -    NVME_PMRCAP_SET_RDS(n->bar.pmrcap, 0);
> -    NVME_PMRCAP_SET_WDS(n->bar.pmrcap, 0);
>      NVME_PMRCAP_SET_BIR(n->bar.pmrcap, NVME_PMR_BIR);
> -    NVME_PMRCAP_SET_PMRTU(n->bar.pmrcap, 0);
> -    /* Turn on bit 1 support */

This comment says that PMRWBM [1]th bit is set to PMRCAP below :).

>      NVME_PMRCAP_SET_PMRWBM(n->bar.pmrcap, 0x02);
> -    NVME_PMRCAP_SET_PMRTO(n->bar.pmrcap, 0);
> -    NVME_PMRCAP_SET_CMSS(n->bar.pmrcap, 0);
> -
> -    /* PMR Control register */
> -    n->bar.pmrctl = 0;
> -    NVME_PMRCTL_SET_EN(n->bar.pmrctl, 0);
> -
> -    /* PMR Status register */
> -    n->bar.pmrsts = 0;
> -    NVME_PMRSTS_SET_ERR(n->bar.pmrsts, 0);
> -    NVME_PMRSTS_SET_NRDY(n->bar.pmrsts, 0);
> -    NVME_PMRSTS_SET_HSTS(n->bar.pmrsts, 0);
> -    NVME_PMRSTS_SET_CBAI(n->bar.pmrsts, 0);
> -
> -    /* PMR Elasticity Buffer Size register */
> -    n->bar.pmrebs = 0;
> -    NVME_PMREBS_SET_PMRSZU(n->bar.pmrebs, 0);
> -    NVME_PMREBS_SET_RBB(n->bar.pmrebs, 0);
> -    NVME_PMREBS_SET_PMRWBZ(n->bar.pmrebs, 0);
> -
> -    /* PMR Sustained Write Throughput register */
> -    n->bar.pmrswtp = 0;
> -    NVME_PMRSWTP_SET_PMRSWTU(n->bar.pmrswtp, 0);
> -    NVME_PMRSWTP_SET_PMRSWTV(n->bar.pmrswtp, 0);
> -
> -    /* PMR Memory Space Control register */
> -    n->bar.pmrmsc = 0;
> -    NVME_PMRMSC_SET_CMSE(n->bar.pmrmsc, 0);
> -    NVME_PMRMSC_SET_CBA(n->bar.pmrmsc, 0);
>  
>      pci_register_bar(pci_dev, NVME_PMRCAP_BIR(n->bar.pmrcap),
>                       PCI_BASE_ADDRESS_SPACE_MEMORY |
> -- 
> 2.30.0
> 
> 

