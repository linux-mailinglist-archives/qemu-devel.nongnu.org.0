Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAFF20EB6B
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jun 2020 04:23:23 +0200 (CEST)
Received: from localhost ([::1]:53184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jq5vd-0006f4-L4
	for lists+qemu-devel@lfdr.de; Mon, 29 Jun 2020 22:23:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jq5us-0006AM-BI; Mon, 29 Jun 2020 22:22:34 -0400
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144]:43501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jq5uq-0006cc-3Q; Mon, 29 Jun 2020 22:22:34 -0400
Received: by mail-il1-x144.google.com with SMTP id i18so16326141ilk.10;
 Mon, 29 Jun 2020 19:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iAtzfb6HK6niDjgdGddE290RcftHecegNU15sau7i+M=;
 b=SliVfQWyJVhUOmf1Ip+BzDGAu9rw8h2rG6i4nqWgCmgsP+ymwnXPoNRQ8k+881np0m
 fkzEhSGbDD2VN9o41VJDQ1pLBD9UtuXuQ6ik3g6A8TJoSx8pqlYAM6m1vNBpKWxGCRTA
 qW6F2osnXDSnOVme8UK1dWl1MqwficIek/NjA+ZTYwrLxBXRi1wjLukRuJkrZ+W8QLti
 ZbQdWst7UA4sNg8G2XHocjEd9ZSA2HLdK6g9AMKbQuRqveZrgR44T08fvgiwd4+aNXMv
 9jZaEJzMLYpQGo5oyiihmhNx/H1FU893NgNrzLZkdISP2cke4+44KZeqk8ma47FMr8yC
 iPrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iAtzfb6HK6niDjgdGddE290RcftHecegNU15sau7i+M=;
 b=HsTwruYQ3rQK36tv7fTAmcnl3z+v7YLwcfyGxFak8OmM5ewGeCWnejpZhXAixna09b
 9MLt0FdEaBYJKXr/SL1LMXfQgXc7+6ng1xDFPWo8XBN5IoVmNCRbCVzDYN6vimGssdTr
 GluR+TsDoneV/8CsBMERoV6iixA8eDCcFEz3z2v/cVJfSVNDzmnLLnVX1optj6SGcRUG
 pr/xdjLR3+A7E75NavwGsFO0/c15YwchpWhsDlLuKM/VQazRnq+P/jjr8ZY2p6tzaQBO
 fVPYdD3y0wfT/k1pdgo46FSh+L9wJCBdN5uJxI3PcACbNZnwoDpR/wjWFGHHunk1GvJb
 UFdw==
X-Gm-Message-State: AOAM530qk5WmX4KKSUnxipfyRNdtBdhcOOxtBSTSz7bl2Wr6ZFpsIuDA
 iBWLddY0qfc8cK+nJeBY8+E01lWZR7HVzIzgLHE=
X-Google-Smtp-Source: ABdhPJy8NBaElK2NbfiuqHyhFIZeXS36J5fHJTCMvw/EgPA3ORBuQvYUxphsp4eTWXBrIfenUAb6uTl0rOJam3u1SEo=
X-Received: by 2002:a92:c213:: with SMTP id j19mr511002ilo.40.1593483750691;
 Mon, 29 Jun 2020 19:22:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200617213415.22417-1-dmitry.fomichev@wdc.com>
 <20200617213415.22417-6-dmitry.fomichev@wdc.com>
In-Reply-To: <20200617213415.22417-6-dmitry.fomichev@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 29 Jun 2020 19:12:47 -0700
Message-ID: <CAKmqyKO-O5kVkb-mKmBeCCtmaS8uR+0oau=5FfS_gYrXXX0nHA@mail.gmail.com>
Subject: Re: [PATCH v2 05/18] hw/block/nvme: Introduce the Namespace Types
 definitions
To: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::144;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x144.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Niklas Cassel <niklas.cassel@wdc.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, Qemu-block <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Keith Busch <kbusch@kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Maxim Levitsky <mlevitsky@redhat.com>,
 Matias Bjorling <matias.bjorling@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 17, 2020 at 2:47 PM Dmitry Fomichev <dmitry.fomichev@wdc.com> wrote:
>
> From: Niklas Cassel <niklas.cassel@wdc.com>
>
> Define the structures and constants required to implement
> Namespace Types support.
>
> Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
> Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
> ---
>  hw/block/nvme.h      |  3 ++
>  include/block/nvme.h | 75 +++++++++++++++++++++++++++++++++++++++++---
>  2 files changed, 73 insertions(+), 5 deletions(-)
>
> diff --git a/hw/block/nvme.h b/hw/block/nvme.h
> index 4f0dac39ae..4fd155c409 100644
> --- a/hw/block/nvme.h
> +++ b/hw/block/nvme.h
> @@ -63,6 +63,9 @@ typedef struct NvmeCQueue {
>
>  typedef struct NvmeNamespace {
>      NvmeIdNs        id_ns;
> +    uint32_t        nsid;
> +    uint8_t         csi;
> +    QemuUUID        uuid;
>  } NvmeNamespace;
>
>  static inline NvmeLBAF *nvme_ns_lbaf(NvmeNamespace *ns)
> diff --git a/include/block/nvme.h b/include/block/nvme.h
> index 6a58bac0c2..5a1e5e137c 100644
> --- a/include/block/nvme.h
> +++ b/include/block/nvme.h
> @@ -50,6 +50,11 @@ enum NvmeCapMask {
>      CAP_PMR_MASK       = 0x1,
>  };
>
> +enum NvmeCapCssBits {
> +    CAP_CSS_NVM        = 0x01,
> +    CAP_CSS_CSI_SUPP   = 0x40,
> +};
> +
>  #define NVME_CAP_MQES(cap)  (((cap) >> CAP_MQES_SHIFT)   & CAP_MQES_MASK)
>  #define NVME_CAP_CQR(cap)   (((cap) >> CAP_CQR_SHIFT)    & CAP_CQR_MASK)
>  #define NVME_CAP_AMS(cap)   (((cap) >> CAP_AMS_SHIFT)    & CAP_AMS_MASK)
> @@ -101,6 +106,12 @@ enum NvmeCcMask {
>      CC_IOCQES_MASK  = 0xf,
>  };
>
> +enum NvmeCcCss {
> +    CSS_NVM_ONLY        = 0,
> +    CSS_ALL_NSTYPES     = 6,
> +    CSS_ADMIN_ONLY      = 7,
> +};
> +
>  #define NVME_CC_EN(cc)     ((cc >> CC_EN_SHIFT)     & CC_EN_MASK)
>  #define NVME_CC_CSS(cc)    ((cc >> CC_CSS_SHIFT)    & CC_CSS_MASK)
>  #define NVME_CC_MPS(cc)    ((cc >> CC_MPS_SHIFT)    & CC_MPS_MASK)
> @@ -109,6 +120,21 @@ enum NvmeCcMask {
>  #define NVME_CC_IOSQES(cc) ((cc >> CC_IOSQES_SHIFT) & CC_IOSQES_MASK)
>  #define NVME_CC_IOCQES(cc) ((cc >> CC_IOCQES_SHIFT) & CC_IOCQES_MASK)
>
> +#define NVME_SET_CC_EN(cc, val)     \
> +    (cc |= (uint32_t)((val) & CC_EN_MASK) << CC_EN_SHIFT)
> +#define NVME_SET_CC_CSS(cc, val)    \
> +    (cc |= (uint32_t)((val) & CC_CSS_MASK) << CC_CSS_SHIFT)
> +#define NVME_SET_CC_MPS(cc, val)    \
> +    (cc |= (uint32_t)((val) & CC_MPS_MASK) << CC_MPS_SHIFT)
> +#define NVME_SET_CC_AMS(cc, val)    \
> +    (cc |= (uint32_t)((val) & CC_AMS_MASK) << CC_AMS_SHIFT)
> +#define NVME_SET_CC_SHN(cc, val)    \
> +    (cc |= (uint32_t)((val) & CC_SHN_MASK) << CC_SHN_SHIFT)
> +#define NVME_SET_CC_IOSQES(cc, val) \
> +    (cc |= (uint32_t)((val) & CC_IOSQES_MASK) << CC_IOSQES_SHIFT)
> +#define NVME_SET_CC_IOCQES(cc, val) \
> +    (cc |= (uint32_t)((val) & CC_IOCQES_MASK) << CC_IOCQES_SHIFT)
> +
>  enum NvmeCstsShift {
>      CSTS_RDY_SHIFT      = 0,
>      CSTS_CFS_SHIFT      = 1,
> @@ -482,10 +508,41 @@ typedef struct NvmeIdentify {
>      uint64_t    rsvd2[2];
>      uint64_t    prp1;
>      uint64_t    prp2;
> -    uint32_t    cns;
> -    uint32_t    rsvd11[5];
> +    uint8_t     cns;
> +    uint8_t     rsvd4;
> +    uint16_t    ctrlid;

Shouldn't this be CNTID?

Alistair

> +    uint16_t    nvmsetid;
> +    uint8_t     rsvd3;
> +    uint8_t     csi;
> +    uint32_t    rsvd12[4];
>  } NvmeIdentify;
>
> +typedef struct NvmeNsIdDesc {
> +    uint8_t     nidt;
> +    uint8_t     nidl;
> +    uint16_t    rsvd2;
> +} NvmeNsIdDesc;
> +
> +enum NvmeNidType {
> +    NVME_NIDT_EUI64             = 0x01,
> +    NVME_NIDT_NGUID             = 0x02,
> +    NVME_NIDT_UUID              = 0x03,
> +    NVME_NIDT_CSI               = 0x04,
> +};
> +
> +enum NvmeNidLength {
> +    NVME_NIDL_EUI64             = 8,
> +    NVME_NIDL_NGUID             = 16,
> +    NVME_NIDL_UUID              = 16,
> +    NVME_NIDL_CSI               = 1,
> +};
> +
> +enum NvmeCsi {
> +    NVME_CSI_NVM                = 0x00,
> +};
> +
> +#define NVME_SET_CSI(vec, csi) (vec |= (uint8_t)(1 << (csi)))
> +
>  typedef struct NvmeRwCmd {
>      uint8_t     opcode;
>      uint8_t     flags;
> @@ -603,6 +660,7 @@ enum NvmeStatusCodes {
>      NVME_CMD_ABORT_MISSING_FUSE = 0x000a,
>      NVME_INVALID_NSID           = 0x000b,
>      NVME_CMD_SEQ_ERROR          = 0x000c,
> +    NVME_CMD_SET_CMB_REJECTED   = 0x002b,
>      NVME_LBA_RANGE              = 0x0080,
>      NVME_CAP_EXCEEDED           = 0x0081,
>      NVME_NS_NOT_READY           = 0x0082,
> @@ -729,9 +787,14 @@ typedef struct NvmePSD {
>  #define NVME_IDENTIFY_DATA_SIZE 4096
>
>  enum {
> -    NVME_ID_CNS_NS             = 0x0,
> -    NVME_ID_CNS_CTRL           = 0x1,
> -    NVME_ID_CNS_NS_ACTIVE_LIST = 0x2,
> +    NVME_ID_CNS_NS                = 0x0,
> +    NVME_ID_CNS_CTRL              = 0x1,
> +    NVME_ID_CNS_NS_ACTIVE_LIST    = 0x2,
> +    NVME_ID_CNS_NS_DESC_LIST      = 0x03,
> +    NVME_ID_CNS_CS_NS             = 0x05,
> +    NVME_ID_CNS_CS_CTRL           = 0x06,
> +    NVME_ID_CNS_CS_NS_ACTIVE_LIST = 0x07,
> +    NVME_ID_CNS_IO_COMMAND_SET    = 0x1c,
>  };
>
>  typedef struct NvmeIdCtrl {
> @@ -825,6 +888,7 @@ enum NvmeFeatureIds {
>      NVME_WRITE_ATOMICITY            = 0xa,
>      NVME_ASYNCHRONOUS_EVENT_CONF    = 0xb,
>      NVME_TIMESTAMP                  = 0xe,
> +    NVME_COMMAND_SET_PROFILE        = 0x19,
>      NVME_SOFTWARE_PROGRESS_MARKER   = 0x80
>  };
>
> @@ -914,6 +978,7 @@ static inline void _nvme_check_size(void)
>      QEMU_BUILD_BUG_ON(sizeof(NvmeFwSlotInfoLog) != 512);
>      QEMU_BUILD_BUG_ON(sizeof(NvmeSmartLog) != 512);
>      QEMU_BUILD_BUG_ON(sizeof(NvmeIdCtrl) != 4096);
> +    QEMU_BUILD_BUG_ON(sizeof(NvmeNsIdDesc) != 4);
>      QEMU_BUILD_BUG_ON(sizeof(NvmeIdNs) != 4096);
>      QEMU_BUILD_BUG_ON(sizeof(NvmeEffectsLog) != 4096);
>  }
> --
> 2.21.0
>
>

