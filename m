Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B5C65F2E2
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 18:37:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDU0j-00021m-ER; Thu, 05 Jan 2023 12:26:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pDU0g-0001wC-Ge
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 12:26:34 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pDU0e-0008Sx-Kq
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 12:26:34 -0500
Received: by mail-wr1-x431.google.com with SMTP id d17so17077392wrs.2
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 09:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=AdHSPQSczbUuoRKgIlFqzxucRe1TAenhs+NxOxWGVPk=;
 b=tlAgcucWFYGlkghijEm/ErsWSomRiZeK7SxWcc2r/2AQaOJvHYra3so3jdbvw9T8P/
 FcP3BzPmcs52it2LuXW0eUPxwg5vNzrY2Z4aKzmY7wGGdqwFw/G8CNdxl0s/Rlwr7GcW
 qUR+mBAcdyM7X55lEQSLjlTp6xcDHG1nHDMPFYPEF7ycWFaFCyEtQMO/KUIX+pg8soOU
 TxFw1eM3mD5Pbuey8hs6iGxd0sXBrPJ5AfitVVL6dSPtBSSEEbt5uEUXiEHeGr17CPcp
 7YjS9fGvA1j+jn9IC7sHGs7AZJxhPmSSPTTODgB0pqfmgwp1rFibHg8kA/Fq1gHehp+j
 VNqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AdHSPQSczbUuoRKgIlFqzxucRe1TAenhs+NxOxWGVPk=;
 b=jsomOC6jWDxZLwxAIUqX5WTIrXXREGxCKC0CTszBZK8BPRCM6/GN0T4yagto7ct1Z2
 aH5mzd9FlOUBoH2brkK/Tl4jP0ziGsM7azeB4eorYBnufzlZS88P60MTehptNE/TPjNg
 H+DQHLd/nKr+QOG62A5bda4jqgBOVZuLr8/M/aCTWjhs2RjiuGZNReehxM8ylSipRO0K
 htXnCVnCAXwUoRML/f3ycrZy5dP1S4rzBjimyo9WM2bEwrEnJPcCb+fJfLzTdsbhAkI5
 nuhAZY/mtDed8jdHQ7QLHppJWNQLmbVvBEpXfjXFdHwZx0P46SjxNYxq4LWfeDMCD7aQ
 w5Nw==
X-Gm-Message-State: AFqh2kqcJ9LUVpRiLr8OUGJ62IyvxpD8gGpVgynrbBnvprRhv+ZyDBfG
 HQ1ShS2Yrm3BkY9poSzKZm50pw==
X-Google-Smtp-Source: AMrXdXv6TBoATzMtN3NGTyH3CYpFjg6yWJEW/8z3Cje4GoKJDyfscTuDt1VLJyATRkfL03BnYVqEAg==
X-Received: by 2002:a5d:4a52:0:b0:292:8bae:586c with SMTP id
 v18-20020a5d4a52000000b002928bae586cmr147444wrs.0.1672939590756; 
 Thu, 05 Jan 2023 09:26:30 -0800 (PST)
Received: from google.com (44.232.78.34.bc.googleusercontent.com.
 [34.78.232.44]) by smtp.gmail.com with ESMTPSA id
 v3-20020a5d4a43000000b0026fc5694a60sm36531073wrs.26.2023.01.05.09.26.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 09:26:30 -0800 (PST)
Date: Thu, 5 Jan 2023 17:26:26 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH] hw/arm/smmuv3: Add GBPA register
Message-ID: <Y7cIQqc19+Phb/CV@google.com>
References: <20221219125720.1369027-1-smostafa@google.com>
 <Y7VxFpoTjwNaolTG@myrica>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7VxFpoTjwNaolTG@myrica>
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=smostafa@google.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Jean,

Thanks for taking the time to look into this.

On Wed, Jan 04, 2023 at 12:29:10PM +0000, Jean-Philippe Brucker wrote:
> Hi Mostafa,
> 
> On Mon, Dec 19, 2022 at 12:57:20PM +0000, Mostafa Saleh wrote:
> > GBPA register can be used to globally abort all
> > transactions.
> > 
> > Only UPDATE and ABORT bits are considered in this patch.
> 
> That's fair, although it effectively implements all bits since
> smmuv3_translate() ignores memory attributes anyway
> 
> > 
> > It is described in the SMMU manual in "6.3.14 SMMU_GBPA".
> > ABORT reset value is IMPLEMENTATION DEFINED, it is chosen to
> > be zero(Do not abort incoming transactions).
> > 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  hw/arm/smmuv3-internal.h |  4 ++++
> >  hw/arm/smmuv3.c          | 14 ++++++++++++++
> >  include/hw/arm/smmuv3.h  |  1 +
> >  3 files changed, 19 insertions(+)
> > 
> > diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> > index bce161870f..71f70141e8 100644
> > --- a/hw/arm/smmuv3-internal.h
> > +++ b/hw/arm/smmuv3-internal.h
> > @@ -79,6 +79,10 @@ REG32(CR0ACK,              0x24)
> >  REG32(CR1,                 0x28)
> >  REG32(CR2,                 0x2c)
> >  REG32(STATUSR,             0x40)
> > +REG32(GBPA,                0x44)
> > +    FIELD(GBPA, ABORT,        20, 1)
> > +    FIELD(GBPA, UPDATE,       31, 1)
> > +
> >  REG32(IRQ_CTRL,            0x50)
> >      FIELD(IRQ_CTRL, GERROR_IRQEN,        0, 1)
> >      FIELD(IRQ_CTRL, PRI_IRQEN,           1, 1)
> > diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> > index 955b89c8d5..2843bc3da9 100644
> > --- a/hw/arm/smmuv3.c
> > +++ b/hw/arm/smmuv3.c
> > @@ -285,6 +285,7 @@ static void smmuv3_init_regs(SMMUv3State *s)
> >      s->gerror = 0;
> >      s->gerrorn = 0;
> >      s->statusr = 0;
> > +    s->gbpa = 0;
> >  }
> >  
> >  static int smmu_get_ste(SMMUv3State *s, dma_addr_t addr, STE *buf,
> > @@ -663,6 +664,11 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
> >          goto epilogue;
> >      }
> >  
> > +    if (FIELD_EX32(s->gbpa, GBPA, ABORT)) {
> > +        status = SMMU_TRANS_ABORT;
> > +        goto epilogue;
> > +    }
> > +
> 
> GBPA is only taken into account when SMMU_CR0.SMMUEN is 0 (6.3.9.6 SMMUEN)
> 
I missed that, will update it in V2.

> >      cfg = smmuv3_get_config(sdev, &event);
> >      if (!cfg) {
> >          status = SMMU_TRANS_ERROR;
> > @@ -1170,6 +1176,10 @@ static MemTxResult smmu_writel(SMMUv3State *s, hwaddr offset,
> >      case A_GERROR_IRQ_CFG2:
> >          s->gerror_irq_cfg2 = data;
> >          return MEMTX_OK;
> > +    case A_GBPA:
> > +        /* Ignore update bit as write is synchronous. */
> 
> We could also ignore a write that has Update=0, since that's required for
> SMMUv3.2+ implementations (6.3.14.1 Update procedure)

I will add it in V2.

> > +        s->gbpa = data & ~R_GBPA_UPDATE_MASK;
> 
> Do we need to synchronize with concurrent transactions here?
> I couldn't find if QEMU already serializes MMIO writes and IOMMU
> translation.
> 
> "Transactions arriving at the SMMU after completion of a GPBA update are
> guaranteed to take the new attributes written." The guest tests completion
> by reading the Update bit:
> 
> 	vCPU (host CPU 0)		Device thread (host CPU 1)
> 
> 	(a) read GBPA.abort = 1
> 	(b) write GBPA.{update,abort} = {1,0}
> 	(c) read GBPA.update = 0
> 	(d) launch DMA			(e) execute DMA
> 					(f) translation must read GBPA.abort = 0
> 
> I guess memory barriers after (b) and before (f) would ensure that. But I
> wonder if SMMUEN also needs additional synchronization, and in that case a
> rwlock would probably be simpler.
> 

From what I see, it does with qemu_global_mutex.
smmu_write_mmio: acquired from context of io_writex
smmuv3_translate: acquired from context of os_host_main_loop_wait
So I'd assume this should be fine. (I also checked with GDB)

However, if I missed something, and we need to synchronize, I think this
would also be a bug in SMMUEN.
As it is written from smmu_write_mmio and read at smmuv3_translate the
same way as GBPA.

And as described here (6.3.9.6 SMMUEN)
Completion of an Update of SMMUEN from 0 to 1 ensures that:
-Configuration written to SMMU_(S_)CR2 has taken effect.
-All new transactions will be treated with STE configuration relevant to
their stream, and will not undergo SMMU bypass.

So it will suffer from the same problem.

Thanks,
Mostafa

> Thanks,
> Jean
> 
> > +        return MEMTX_OK;
> >      case A_STRTAB_BASE: /* 64b */
> >          s->strtab_base = deposit64(s->strtab_base, 0, 32, data);
> >          return MEMTX_OK;
> > @@ -1318,6 +1328,9 @@ static MemTxResult smmu_readl(SMMUv3State *s, hwaddr offset,
> >      case A_STATUSR:
> >          *data = s->statusr;
> >          return MEMTX_OK;
> > +    case A_GBPA:
> > +        *data = s->gbpa;
> > +        return MEMTX_OK;
> >      case A_IRQ_CTRL:
> >      case A_IRQ_CTRL_ACK:
> >          *data = s->irq_ctrl;
> > @@ -1495,6 +1508,7 @@ static const VMStateDescription vmstate_smmuv3 = {
> >          VMSTATE_UINT32_ARRAY(cr, SMMUv3State, 3),
> >          VMSTATE_UINT32(cr0ack, SMMUv3State),
> >          VMSTATE_UINT32(statusr, SMMUv3State),
> > +        VMSTATE_UINT32(gbpa, SMMUv3State),
> >          VMSTATE_UINT32(irq_ctrl, SMMUv3State),
> >          VMSTATE_UINT32(gerror, SMMUv3State),
> >          VMSTATE_UINT32(gerrorn, SMMUv3State),
> > diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
> > index f1921fdf9e..9899fa1860 100644
> > --- a/include/hw/arm/smmuv3.h
> > +++ b/include/hw/arm/smmuv3.h
> > @@ -46,6 +46,7 @@ struct SMMUv3State {
> >      uint32_t cr[3];
> >      uint32_t cr0ack;
> >      uint32_t statusr;
> > +    uint32_t gbpa;
> >      uint32_t irq_ctrl;
> >      uint32_t gerror;
> >      uint32_t gerrorn;
> > -- 
> > 2.39.0.314.g84b9a713c41-goog
> > 
> > 

