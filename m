Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3DA3CEFB5
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 01:26:32 +0200 (CEST)
Received: from localhost ([::1]:51798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5cec-0003rN-Sn
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 19:26:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1m5cdp-0002uU-Te; Mon, 19 Jul 2021 19:25:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:35838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1m5cdm-0004qK-AK; Mon, 19 Jul 2021 19:25:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 815CC6113B;
 Mon, 19 Jul 2021 23:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626737135;
 bh=tDpXM9nSh7JxPH3BZ1xYxCNfcbkAcGyoBOC8heH1Ihs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BvMPQgPlZj4018jpDtR4oh/sIs9ews17R4/uwFdkO1KBdMXP6iDUdhMlD4CVMGZTn
 3lyftRCyC0GDcZwFncv7Pq1ar8T4UQKrDcXNmwomeB3bvdf7Bxhsi2qe3l7mgDIxaP
 foRE8MTw+1tePdMwJWlVlm7373blulQK4afu/YKva4EfWaggq4nKbSxEtTQTHhSs9p
 poL/ppVDIMnJngRFjkdmpFBl0hksuq1XrKLCugCJ5WgGAkRbEN29JgbWQ52F7JOzt3
 rLu7NH3848+JGfaKryjeMwrSh5leBF33R6OPpnHOZXasR9XwN6WmhRPaTy3vvmU4VW
 i5BPc1ar8ywEQ==
Date: Mon, 19 Jul 2021 16:25:32 -0700
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v5 2/5] hw/nvme: use symbolic names for registers
Message-ID: <20210719232532.GA2004267@dhcp-10-100-145-180.wdc.com>
References: <20210719224647.68559-1-its@irrelevant.dk>
 <20210719224647.68559-3-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210719224647.68559-3-its@irrelevant.dk>
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -85
X-Spam_score: -8.6
X-Spam_bar: --------
X-Spam_report: (-8.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.469,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 20, 2021 at 12:46:44AM +0200, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Add the NvmeBarRegs enum and use these instead of explicit register
> offsets.

Thanks, this is a very nice cleanup. For a suggested follow-up companion
patch, we should add "ASSERT_OFFSET()" checks for each register to
enforce correct positioning of the BAR offsets at build time.

Reviewed-by: Keith Busch <kbusch@kernel.org>


> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> Reviewed-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/block/nvme.h | 29 ++++++++++++++++++++++++++++-
>  hw/nvme/ctrl.c       | 44 ++++++++++++++++++++++----------------------
>  2 files changed, 50 insertions(+), 23 deletions(-)
> 
> diff --git a/include/block/nvme.h b/include/block/nvme.h
> index 84053b68b987..77aae0117494 100644
> --- a/include/block/nvme.h
> +++ b/include/block/nvme.h
> @@ -9,7 +9,7 @@ typedef struct QEMU_PACKED NvmeBar {
>      uint32_t    cc;
>      uint8_t     rsvd24[4];
>      uint32_t    csts;
> -    uint32_t    nssrc;
> +    uint32_t    nssr;
>      uint32_t    aqa;
>      uint64_t    asq;
>      uint64_t    acq;
> @@ -31,6 +31,33 @@ typedef struct QEMU_PACKED NvmeBar {
>      uint8_t     css[484];
>  } NvmeBar;
>  
> +enum NvmeBarRegs {
> +    NVME_REG_CAP     = offsetof(NvmeBar, cap),
> +    NVME_REG_VS      = offsetof(NvmeBar, vs),
> +    NVME_REG_INTMS   = offsetof(NvmeBar, intms),
> +    NVME_REG_INTMC   = offsetof(NvmeBar, intmc),
> +    NVME_REG_CC      = offsetof(NvmeBar, cc),
> +    NVME_REG_CSTS    = offsetof(NvmeBar, csts),
> +    NVME_REG_NSSR    = offsetof(NvmeBar, nssr),
> +    NVME_REG_AQA     = offsetof(NvmeBar, aqa),
> +    NVME_REG_ASQ     = offsetof(NvmeBar, asq),
> +    NVME_REG_ACQ     = offsetof(NvmeBar, acq),
> +    NVME_REG_CMBLOC  = offsetof(NvmeBar, cmbloc),
> +    NVME_REG_CMBSZ   = offsetof(NvmeBar, cmbsz),
> +    NVME_REG_BPINFO  = offsetof(NvmeBar, bpinfo),
> +    NVME_REG_BPRSEL  = offsetof(NvmeBar, bprsel),
> +    NVME_REG_BPMBL   = offsetof(NvmeBar, bpmbl),
> +    NVME_REG_CMBMSC  = offsetof(NvmeBar, cmbmsc),
> +    NVME_REG_CMBSTS  = offsetof(NvmeBar, cmbsts),
> +    NVME_REG_PMRCAP  = offsetof(NvmeBar, pmrcap),
> +    NVME_REG_PMRCTL  = offsetof(NvmeBar, pmrctl),
> +    NVME_REG_PMRSTS  = offsetof(NvmeBar, pmrsts),
> +    NVME_REG_PMREBS  = offsetof(NvmeBar, pmrebs),
> +    NVME_REG_PMRSWTP = offsetof(NvmeBar, pmrswtp),
> +    NVME_REG_PMRMSCL = offsetof(NvmeBar, pmrmscl),
> +    NVME_REG_PMRMSCU = offsetof(NvmeBar, pmrmscu),
> +};
> +
>  enum NvmeCapShift {
>      CAP_MQES_SHIFT     = 0,
>      CAP_CQR_SHIFT      = 16,
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 28299c6f3764..8c305315f41c 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -5740,7 +5740,7 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
>      }
>  
>      switch (offset) {
> -    case 0xc:   /* INTMS */
> +    case NVME_REG_INTMS:
>          if (unlikely(msix_enabled(&(n->parent_obj)))) {
>              NVME_GUEST_ERR(pci_nvme_ub_mmiowr_intmask_with_msix,
>                             "undefined access to interrupt mask set"
> @@ -5752,7 +5752,7 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
>          trace_pci_nvme_mmio_intm_set(data & 0xffffffff, n->bar.intmc);
>          nvme_irq_check(n);
>          break;
> -    case 0x10:  /* INTMC */
> +    case NVME_REG_INTMC:
>          if (unlikely(msix_enabled(&(n->parent_obj)))) {
>              NVME_GUEST_ERR(pci_nvme_ub_mmiowr_intmask_with_msix,
>                             "undefined access to interrupt mask clr"
> @@ -5764,7 +5764,7 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
>          trace_pci_nvme_mmio_intm_clr(data & 0xffffffff, n->bar.intmc);
>          nvme_irq_check(n);
>          break;
> -    case 0x14:  /* CC */
> +    case NVME_REG_CC:
>          trace_pci_nvme_mmio_cfg(data & 0xffffffff);
>          /* Windows first sends data, then sends enable bit */
>          if (!NVME_CC_EN(data) && !NVME_CC_EN(n->bar.cc) &&
> @@ -5798,7 +5798,7 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
>              n->bar.cc = data;
>          }
>          break;
> -    case 0x1c:  /* CSTS */
> +    case NVME_REG_CSTS:
>          if (data & (1 << 4)) {
>              NVME_GUEST_ERR(pci_nvme_ub_mmiowr_ssreset_w1c_unsupported,
>                             "attempted to W1C CSTS.NSSRO"
> @@ -5809,7 +5809,7 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
>                             " of controller status");
>          }
>          break;
> -    case 0x20:  /* NSSR */
> +    case NVME_REG_NSSR:
>          if (data == 0x4e564d65) {
>              trace_pci_nvme_ub_mmiowr_ssreset_unsupported();
>          } else {
> @@ -5817,38 +5817,38 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
>              return;
>          }
>          break;
> -    case 0x24:  /* AQA */
> +    case NVME_REG_AQA:
>          n->bar.aqa = data & 0xffffffff;
>          trace_pci_nvme_mmio_aqattr(data & 0xffffffff);
>          break;
> -    case 0x28:  /* ASQ */
> +    case NVME_REG_ASQ:
>          n->bar.asq = size == 8 ? data :
>              (n->bar.asq & ~0xffffffffULL) | (data & 0xffffffff);
>          trace_pci_nvme_mmio_asqaddr(data);
>          break;
> -    case 0x2c:  /* ASQ hi */
> +    case NVME_REG_ASQ + 4:
>          n->bar.asq = (n->bar.asq & 0xffffffff) | (data << 32);
>          trace_pci_nvme_mmio_asqaddr_hi(data, n->bar.asq);
>          break;
> -    case 0x30:  /* ACQ */
> +    case NVME_REG_ACQ:
>          trace_pci_nvme_mmio_acqaddr(data);
>          n->bar.acq = size == 8 ? data :
>              (n->bar.acq & ~0xffffffffULL) | (data & 0xffffffff);
>          break;
> -    case 0x34:  /* ACQ hi */
> +    case NVME_REG_ACQ + 4:
>          n->bar.acq = (n->bar.acq & 0xffffffff) | (data << 32);
>          trace_pci_nvme_mmio_acqaddr_hi(data, n->bar.acq);
>          break;
> -    case 0x38:  /* CMBLOC */
> +    case NVME_REG_CMBLOC:
>          NVME_GUEST_ERR(pci_nvme_ub_mmiowr_cmbloc_reserved,
>                         "invalid write to reserved CMBLOC"
>                         " when CMBSZ is zero, ignored");
>          return;
> -    case 0x3C:  /* CMBSZ */
> +    case NVME_REG_CMBSZ:
>          NVME_GUEST_ERR(pci_nvme_ub_mmiowr_cmbsz_readonly,
>                         "invalid write to read only CMBSZ, ignored");
>          return;
> -    case 0x50:  /* CMBMSC */
> +    case NVME_REG_CMBMSC:
>          if (!NVME_CAP_CMBS(n->bar.cap)) {
>              return;
>          }
> @@ -5876,15 +5876,15 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
>          }
>  
>          return;
> -    case 0x54:  /* CMBMSC hi */
> +    case NVME_REG_CMBMSC + 4:
>          n->bar.cmbmsc = (n->bar.cmbmsc & 0xffffffff) | (data << 32);
>          return;
>  
> -    case 0xe00: /* PMRCAP */
> +    case NVME_REG_PMRCAP:
>          NVME_GUEST_ERR(pci_nvme_ub_mmiowr_pmrcap_readonly,
>                         "invalid write to PMRCAP register, ignored");
>          return;
> -    case 0xe04: /* PMRCTL */
> +    case NVME_REG_PMRCTL:
>          if (!NVME_CAP_PMRS(n->bar.cap)) {
>              return;
>          }
> @@ -5899,19 +5899,19 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
>              n->pmr.cmse = false;
>          }
>          return;
> -    case 0xe08: /* PMRSTS */
> +    case NVME_REG_PMRSTS:
>          NVME_GUEST_ERR(pci_nvme_ub_mmiowr_pmrsts_readonly,
>                         "invalid write to PMRSTS register, ignored");
>          return;
> -    case 0xe0C: /* PMREBS */
> +    case NVME_REG_PMREBS:
>          NVME_GUEST_ERR(pci_nvme_ub_mmiowr_pmrebs_readonly,
>                         "invalid write to PMREBS register, ignored");
>          return;
> -    case 0xe10: /* PMRSWTP */
> +    case NVME_REG_PMRSWTP:
>          NVME_GUEST_ERR(pci_nvme_ub_mmiowr_pmrswtp_readonly,
>                         "invalid write to PMRSWTP register, ignored");
>          return;
> -    case 0xe14: /* PMRMSCL */
> +    case NVME_REG_PMRMSCL:
>          if (!NVME_CAP_PMRS(n->bar.cap)) {
>              return;
>          }
> @@ -5932,7 +5932,7 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
>          }
>  
>          return;
> -    case 0xe18: /* PMRMSCU */
> +    case NVME_REG_PMRMSCU:
>          if (!NVME_CAP_PMRS(n->bar.cap)) {
>              return;
>          }
> @@ -5974,7 +5974,7 @@ static uint64_t nvme_mmio_read(void *opaque, hwaddr addr, unsigned size)
>           * from PMRSTS should ensure prior writes
>           * made it to persistent media
>           */
> -        if (addr == 0xe08 &&
> +        if (addr == NVME_REG_PMRSTS &&
>              (NVME_PMRCAP_PMRWBM(n->bar.pmrcap) & 0x02)) {
>              memory_region_msync(&n->pmr.dev->mr, 0, n->pmr.dev->size);
>          }
> -- 
> 2.32.0
> 

