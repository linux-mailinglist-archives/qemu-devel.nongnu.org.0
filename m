Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF13350511
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 18:50:10 +0200 (CEST)
Received: from localhost ([::1]:57180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRe2i-0005xZ-Gm
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 12:50:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lRe16-0005OV-Vo
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 12:48:29 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:39835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lRe0z-0003TO-9Y
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 12:48:28 -0400
Received: by mail-qk1-x730.google.com with SMTP id q26so19987868qkm.6
 for <qemu-devel@nongnu.org>; Wed, 31 Mar 2021 09:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BrmnjGY9rSiZddWV346h4yTdcmLnWqqZAebcGSlU9uA=;
 b=JEiQ4C7GvFYFhI3GPfedozUMWeRDhKhP6ZQQ9DjPYuuXkT+s0vlvIyd1iGi0ffmbWs
 HlohaYPdI80XiRva+mB5CvJDM9FS8C5n49s9nbiPm2rIO3pxNVjKqALFvmy3NqZlB8xM
 WZ8DNqlfv8GR65o+QiB/Qi37IyeeI9K0BLZKUYVPEqgvbg3rnIWI7o5YRHFNiedaFZgN
 J+IwfyXYi3MRAaE8rONfW3nRHdFj736dOCv3b705FwefXt55dXTtMdKoPQY5YEPMp+JM
 yI13Qh16VPYBgz4ARls8gTFOX4DN69Xx+CsjjKsPVuEUgTiAjo9uMqrNeAFoXromcLXx
 JMBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BrmnjGY9rSiZddWV346h4yTdcmLnWqqZAebcGSlU9uA=;
 b=Vs0qN/cO3CPeSZM+mX0oMKPklfTdiIHIeLWYsltSQrOKVdBncEq51oHnZrXcus+nWs
 YuBP+TTnq53fKC5DhmZLfsXFWIyB/tLS1Bftg9yxCCrRFwqZa+TFs567Jxq1F1JDF1db
 DRRR7/ryPFWokFepBj8OL1xI629U+iCi/1nzfmu64G690Txn/RVYTpZDQJQkvvcpP3Ur
 gbDEo4oYXbMOJGo5L8uX/Gk8g0pjQh/nDydfw7h0lGEQ1Jq417ZvPSQbaDg71Jf51Xtt
 kCD2QrzWuiyQr+CCyzYbSV+USQZ/yJ3pZa6eI1Ju1+/9Raf52W7ykh7Jod/tqs1H0BeR
 +luw==
X-Gm-Message-State: AOAM533/IqfqFcl2//x8OKHvqVvSKDvvXIAK7ZatFD7vm9kztK5g9vyD
 NzuX0iOnCXw6d23FdkvwUFzSdQ==
X-Google-Smtp-Source: ABdhPJw1D/PPnrtsrXL0B02nlF550XEWRDSPxoDb5eq42gSIBM/BO4c+a0hohhqhEWuFdMKiD8eSkA==
X-Received: by 2002:ae9:e40b:: with SMTP id q11mr4120024qkc.318.1617209296982; 
 Wed, 31 Mar 2021 09:48:16 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-23-174-92-28-28.dsl.bell.ca. [174.92.28.28])
 by smtp.gmail.com with ESMTPSA id z89sm1764484qtd.5.2021.03.31.09.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 09:48:16 -0700 (PDT)
Message-ID: <35e6e1b000a4aae059b95ff24e83e66995e2917b.camel@linaro.org>
Subject: Re: [PATCH v1 2/8] hw/intc: GICv3 ITS register definitions added
From: shashi.mallela@linaro.org
To: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Date: Wed, 31 Mar 2021 12:48:14 -0400
In-Reply-To: <87mtur10mu.fsf@linaro.org>
References: <20210323041238.133835-1-shashi.mallela@linaro.org>
 <20210323041238.133835-3-shashi.mallela@linaro.org>
 <87mtur10mu.fsf@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-14.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x730.google.com
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
Cc: peter.maydell@linaro.org, leif@nuviainc.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, rad@semihalf.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2021-03-25 at 19:34 +0000, Alex Bennée wrote:
> Shashi Mallela <shashi.mallela@linaro.org> writes:
> 
> > Defined descriptors for ITS device table,collection table and ITS
> > command queue entities.Implemented register read/write functions,
> > extract ITS table parameters and command queue parameters,extended
> > gicv3 common to capture qemu address space(which host the ITS table
> > platform memories required for subsequent ITS processing) and
> > initialize the same in its device.
> > 
> > Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> > ---
> >  hw/intc/arm_gicv3_its.c            | 356 ++++++++++++++++++++
> >  include/hw/intc/arm_gicv3_common.h |   4 +
> >  2 files changed, 360 insertions(+)
> > 
> > diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> > index 34e49b4d63..4895d32e67 100644
> > --- a/hw/intc/arm_gicv3_its.c
> > +++ b/hw/intc/arm_gicv3_its.c
> > @@ -23,11 +23,179 @@ typedef struct GICv3ITSClass GICv3ITSClass;
> >  DECLARE_OBJ_CHECKERS(GICv3ITSState, GICv3ITSClass,
> >                       ARM_GICV3_ITS, TYPE_ARM_GICV3_ITS)
> >  
> > +typedef struct {
> > +    bool valid;
> > +    bool indirect;
> > +    uint16_t entry_sz;
> > +    uint32_t max_entries;
> > +    uint32_t max_devids;
> > +    uint64_t base_addr;
> > +} DevTableDesc;
> > +
> > +typedef struct {
> > +    bool valid;
> > +    bool indirect;
> > +    uint16_t entry_sz;
> > +    uint32_t max_entries;
> > +    uint32_t max_collids;
> > +    uint64_t base_addr;
> > +} CollTableDesc;
> > +
> > +typedef struct {
> > +    bool valid;
> > +    uint32_t max_entries;
> > +    uint64_t base_addr;
> > +} CmdQDesc;
> > +
> >  struct GICv3ITSClass {
> >      GICv3ITSCommonClass parent_class;
> >      void (*parent_reset)(DeviceState *dev);
> > +
> > +    DevTableDesc  dt;
> > +    CollTableDesc ct;
> > +    CmdQDesc      cq;
> >  };
> >  
> > +static bool extract_table_params(GICv3ITSState *s, int index)
> > +{
> > +    GICv3ITSClass *c = ARM_GICV3_ITS_GET_CLASS(s);
> > +    uint16_t num_pages = 0;
> > +    uint8_t  page_sz_type;
> > +    uint8_t type;
> > +    uint32_t page_sz = 0;
> > +    uint64_t value = s->baser[index];
> > +
> > +    num_pages = (value & GITS_BASER_SIZE);
> > +    page_sz_type = (value >> GITS_BASER_PAGESIZE_OFFSET) &
> > +                        GITS_BASER_PAGESIZE_MASK;
> 
> So these definitions can come in the header on the same patch where
> they
> are used. Also with the FIELD macros this then becomes:
> 
>   num_pages = FIELD_EX64(value, GITS_BASER, SIZE);
>   page_sz_type = FIELD_EX64(value, GITS_BASER, PAGESIZE);
> 
> etc...
> 
> basically anywhere where you are shift and masking you should be
> using
> the FIELD macros (or at the least the extract/deposit functions).
> 
> > +
> > +    if (page_sz_type == 0) {
> > +        page_sz = GITS_ITT_PAGE_SIZE_0;
> > +    } else if (page_sz_type == 0) {
> > +        page_sz = GITS_ITT_PAGE_SIZE_1;
> > +    } else if (page_sz_type == 2) {
> > +        page_sz = GITS_ITT_PAGE_SIZE_2;
> > +    } else {
> > +        return false;
> > +    }
> > +
> > +    type = (value >> GITS_BASER_TYPE_OFFSET) &
> > +                        GITS_BASER_TYPE_MASK;
> > +
> > +    if (type == GITS_ITT_TYPE_DEVICE) {
> > +        c->dt.valid = (value >> GITS_BASER_VALID) &
> > GITS_BASER_VALID_MASK;
> > +
> > +        if (c->dt.valid) {
> > +            c->dt.indirect = (value >> GITS_BASER_INDIRECT_OFFSET)
> > &
> > +                                       GITS_BASER_INDIRECT_MASK;
> > +            c->dt.entry_sz = (value >>
> > GITS_BASER_ENTRYSIZE_OFFSET) &
> > +                                   GITS_BASER_ENTRYSIZE_MASK;
> > +
> > +            if (!c->dt.indirect) {
> > +                c->dt.max_entries = ((num_pages + 1) * page_sz) /
> > +                                                       c-
> > >dt.entry_sz;
> > +            } else {
> > +                c->dt.max_entries = ((((num_pages + 1) * page_sz)
> > /
> > +                                        L1TABLE_ENTRY_SIZE) *
> > +                                    (page_sz / c->dt.entry_sz));
> > +            }
> > +
> > +            c->dt.max_devids = (1UL << (((value >>
> > GITS_TYPER_DEVBITS_OFFSET) &
> > +                                           GITS_TYPER_DEVBITS_MASK
> > ) + 1));
> > +
> > +            if ((page_sz == GITS_ITT_PAGE_SIZE_0) ||
> > +                    (page_sz == GITS_ITT_PAGE_SIZE_1)) {
> > +                c->dt.base_addr = (value >>
> > GITS_BASER_PHYADDR_OFFSET) &
> > +                                        GITS_BASER_PHYADDR_MASK;
> > +                c->dt.base_addr <<= GITS_BASER_PHYADDR_OFFSET;
> > +            } else if (page_sz == GITS_ITT_PAGE_SIZE_2) {
> > +                c->dt.base_addr = ((value >>
> > GITS_BASER_PHYADDR_OFFSETL_64K) &
> > +                                   GITS_BASER_PHYADDR_MASKL_64K)
> > <<
> > +                                     GITS_BASER_PHYADDR_OFFSETL_64
> > K;
> > +                c->dt.base_addr |= ((value >>
> > GITS_BASER_PHYADDR_OFFSET) &
> > +                                    GITS_BASER_PHYADDR_MASKH_64K)
> > <<
> > +                                     GITS_BASER_PHYADDR_OFFSETH_64
> > K;
> > +            }
> > +        }
> > +    } else if (type == GITS_ITT_TYPE_COLLECTION) {
> > +        c->ct.valid = (value >> GITS_BASER_VALID) &
> > GITS_BASER_VALID_MASK;
> > +
> > +        /*
> > +         * GITS_TYPER.HCC is 0 for this implementation
> > +         * hence writes are discarded if ct.valid is 0
> > +         */
> > +        if (c->ct.valid) {
> > +            c->ct.indirect = (value >> GITS_BASER_INDIRECT_OFFSET)
> > &
> > +                                       GITS_BASER_INDIRECT_MASK;
> > +            c->ct.entry_sz = (value >>
> > GITS_BASER_ENTRYSIZE_OFFSET) &
> > +                                    GITS_BASER_ENTRYSIZE_MASK;
> > +
> > +            if (!c->ct.indirect) {
> > +                c->ct.max_entries = ((num_pages + 1) * page_sz) /
> > +                                      c->ct.entry_sz;
> > +            } else {
> > +                c->ct.max_entries = ((((num_pages + 1) * page_sz)
> > /
> > +                                      L1TABLE_ENTRY_SIZE) *
> > +                                      (page_sz / c->ct.entry_sz));
> > +            }
> > +
> > +            if ((value >> GITS_TYPER_CIL_OFFSET) &
> > GITS_TYPER_CIL_MASK) {
> > +                c->ct.max_collids = (1UL << (((value >>
> > +                                               GITS_TYPER_CIDBITS_
> > OFFSET) &
> > +                                               GITS_TYPER_CIDBITS_
> > MASK) + 1));
> > +            } else {
> > +                /* 16-bit CollectionId supported when CIL == 0 */
> > +                c->ct.max_collids = (1UL << 16);
> > +            }
> > +
> > +            if ((page_sz == GITS_ITT_PAGE_SIZE_0) ||
> > +                 (page_sz == GITS_ITT_PAGE_SIZE_1)) {
> > +                c->ct.base_addr = (value >>
> > GITS_BASER_PHYADDR_OFFSET) &
> > +                                            GITS_BASER_PHYADDR_MAS
> > K;
> > +                c->ct.base_addr <<= GITS_BASER_PHYADDR_OFFSET;
> > +            } else if (page_sz == GITS_ITT_PAGE_SIZE_2) {
> > +                c->ct.base_addr = ((value >>
> > GITS_BASER_PHYADDR_OFFSETL_64K) &
> > +                                   GITS_BASER_PHYADDR_MASKL_64K)
> > <<
> > +                                    GITS_BASER_PHYADDR_OFFSETL_64K
> > ;
> > +                c->ct.base_addr |= ((value >>
> > GITS_BASER_PHYADDR_OFFSET) &
> > +                                    GITS_BASER_PHYADDR_MASKH_64K)
> > <<
> > +                                    GITS_BASER_PHYADDR_OFFSETH_64K
> > ;
> > +            }
> > +        }
> > +    } else {
> > +        /* unsupported ITS table type */
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Unsupported ITS table
> > type %d",
> > +                         __func__, type);
> 
> LOG_UNIMP
> this is not LOG_UNIMP but error indication
> 
> > +        return false;
> > +    }
> > +    return true;
> > +}
> > +
> > +static bool extract_cmdq_params(GICv3ITSState *s)
> > +{
> > +    GICv3ITSClass *c = ARM_GICV3_ITS_GET_CLASS(s);
> > +    uint16_t num_pages = 0;
> > +    uint64_t value = s->cbaser;
> > +
> > +    num_pages = (value & GITS_CBASER_SIZE);
> > +
> > +    c->cq.valid = (value >> GITS_CBASER_VALID_OFFSET) &
> > +                                GITS_CBASER_VALID_MASK;
> > +
> > +    if (!num_pages || !c->cq.valid) {
> > +        return false;
> > +    }
> > +
> > +    if (c->cq.valid) {
> > +        c->cq.max_entries = ((num_pages + 1) *
> > GITS_ITT_PAGE_SIZE_0) /
> > +                                                GITS_CMDQ_ENTRY_SI
> > ZE;
> > +        c->cq.base_addr = (value >> GITS_CBASER_PHYADDR_OFFSET) &
> > +                                    GITS_CBASER_PHYADDR_MASK;
> > +        c->cq.base_addr <<= GITS_CBASER_PHYADDR_OFFSET;
> > +    }
> > +    return true;
> > +}
> > +
> >  static MemTxResult its_trans_writew(GICv3ITSState *s, hwaddr
> > offset,
> >                                 uint64_t value, MemTxAttrs attrs)
> >  {
> > @@ -126,7 +294,75 @@ static MemTxResult its_writel(GICv3ITSState
> > *s, hwaddr offset,
> >                                 uint64_t value, MemTxAttrs attrs)
> >  {
> >      MemTxResult result = MEMTX_OK;
> > +    int index;
> > +    uint64_t temp = 0;
> >  
> > +    switch (offset) {
> > +    case GITS_CTLR:
> > +        s->ctlr |= (value & ~(s->ctlr));
> > +        break;
> > +    case GITS_CBASER:
> > +        /* GITS_CBASER register becomes RO if ITS is already
> > enabled */
> > +        if (!(s->ctlr & GITS_CTLR_ENABLED)) {
> > +            s->cbaser = deposit64(s->cbaser, 0, 32, value);
> > +            s->creadr = 0;
> > +        }
> > +        break;
> > +    case GITS_CBASER + 4:
> > +        /* GITS_CBASER register becomes RO if ITS is already
> > enabled */
> > +        if (!(s->ctlr & GITS_CTLR_ENABLED)) {
> > +            s->cbaser = deposit64(s->cbaser, 32, 32, value);
> > +            if (!extract_cmdq_params(s)) {
> > +                qemu_log_mask(LOG_GUEST_ERROR,
> > +                       "%s: error extracting GITS_CBASER
> > parameters "
> > +                       TARGET_FMT_plx "\n", __func__, offset);
> > +                s->cbaser = 0;
> > +                result = MEMTX_ERROR;
> 
> LOG_UNIMP?
> this is not LOG_UNIMP but error indication
> 
> > +            } else {
> > +                s->creadr = 0;
> > +            }
> > +        }
> > +        break;
> > +    case GITS_CWRITER:
> > +        s->cwriter = deposit64(s->cwriter, 0, 32, value);
> > +        break;
> > +    case GITS_CWRITER + 4:
> > +        s->cwriter = deposit64(s->cwriter, 32, 32, value);
> > +        break;
> > +    case GITS_BASER ... GITS_BASER + 0x3f:
> > +        /* GITS_BASERn registers become RO if ITS is already
> > enabled */
> > +        if (!(s->ctlr & GITS_CTLR_ENABLED)) {
> > +            index = (offset - GITS_BASER) / 8;
> > +
> > +            if (offset & 7) {
> > +                temp = s->baser[index];
> > +                temp = deposit64(temp, 32, 32, (value &
> > ~GITS_BASER_VAL_MASK));
> > +                s->baser[index] |= temp;
> > +
> > +                if (!extract_table_params(s, index)) {
> > +                    qemu_log_mask(LOG_GUEST_ERROR,
> > +                        "%s: error extracting GITS_BASER
> > parameters "
> > +                        TARGET_FMT_plx "\n", __func__, offset);
> 
> LOG_UNIMP again?
> this is not LOG_UNIMP but error indication
> 
> > +                    s->baser[index] = 0;
> > +                    result = MEMTX_ERROR;
> > +                }
> > +            } else {
> > +                s->baser[index] =  deposit64(s->baser[index], 0,
> > 32, value);
> > +            }
> > +        }
> > +        break;
> > +    case GITS_IIDR:
> > +    case GITS_TYPER:
> > +    case GITS_CREADR:
> > +        /* RO registers, ignore the write */
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +            "%s: invalid guest write to RO register at offset "
> > +            TARGET_FMT_plx "\n", __func__, offset);
> > +        break;
> > +    default:
> > +        result = MEMTX_ERROR;
> > +        break;
> > +    }
> >      return result;
> >  }
> >  
> > @@ -134,7 +370,54 @@ static MemTxResult its_readl(GICv3ITSState *s,
> > hwaddr offset,
> >                                 uint64_t *data, MemTxAttrs attrs)
> >  {
> >      MemTxResult result = MEMTX_OK;
> > +    int index;
> >  
> > +    switch (offset) {
> > +    case GITS_CTLR:
> > +        *data = s->ctlr;
> > +        break;
> > +    case GITS_IIDR:
> > +        *data = s->iidr;
> > +        break;
> > +    case GITS_PIDR2:
> > +        *data = 0x30; /* GICv3 */
> > +        break;
> > +    case GITS_TYPER:
> > +        *data = extract64(s->typer, 0, 32);
> > +        break;
> > +    case GITS_TYPER + 4:
> > +        *data = extract64(s->typer, 32, 32);
> > +        break;
> > +    case GITS_CBASER:
> > +        *data = extract64(s->cbaser, 0, 32);
> > +        break;
> > +    case GITS_CBASER + 4:
> > +        *data = extract64(s->cbaser, 32, 32);
> > +        break;
> > +    case GITS_CREADR:
> > +        *data = extract64(s->creadr, 0, 32);
> > +        break;
> > +    case GITS_CREADR + 4:
> > +        *data = extract64(s->creadr, 32, 32);
> > +        break;
> > +    case GITS_CWRITER:
> > +        *data = extract64(s->cwriter, 0, 32);
> > +        break;
> > +    case GITS_CWRITER + 4:
> > +        *data = extract64(s->cwriter, 32, 32);
> > +        break;
> > +    case GITS_BASER ... GITS_BASER + 0x3f:
> > +        index = (offset - GITS_BASER) / 8;
> > +        if (offset & 7) {
> > +            *data = s->baser[index] >> 32;
> > +        } else {
> > +            *data = (uint32_t)s->baser[index];
> > +        }
> > +        break;
> > +    default:
> > +        result = MEMTX_ERROR;
> > +        break;
> > +    }
> >      return result;
> >  }
> >  
> > @@ -142,7 +425,52 @@ static MemTxResult its_writell(GICv3ITSState
> > *s, hwaddr offset,
> >                                 uint64_t value, MemTxAttrs attrs)
> >  {
> >      MemTxResult result = MEMTX_OK;
> > +    int index;
> >  
> > +    switch (offset) {
> > +    case GITS_BASER ... GITS_BASER + 0x3f:
> > +        /* GITS_BASERn registers become RO if ITS is already
> > enabled */
> > +        if (!(s->ctlr & GITS_CTLR_ENABLED)) {
> > +            index = (offset - GITS_BASER) / 8;
> > +            s->baser[index] |= (value & ~GITS_BASER_VAL_MASK);
> > +            if (!extract_table_params(s, index)) {
> > +                qemu_log_mask(LOG_GUEST_ERROR,
> > +                        "%s: error extracting GITS_BASER
> > parameters "
> > +                        TARGET_FMT_plx "\n", __func__, offset);
> > +                s->baser[index] = 0;
> > +                result = MEMTX_ERROR;
> > +            }
> > +        }
> > +        break;
> > +    case GITS_CBASER:
> > +        /* GITS_CBASER register becomes RO if ITS is already
> > enabled */
> > +        if (!(s->ctlr & GITS_CTLR_ENABLED)) {
> > +            s->cbaser = value;
> > +            if (!extract_cmdq_params(s)) {
> > +                qemu_log_mask(LOG_GUEST_ERROR,
> > +                       "%s: error extracting GITS_CBASER
> > parameters "
> > +                       TARGET_FMT_plx "\n", __func__, offset);
> 
> So are these all LOG_UNIMP or are they a programming failure on our
> part?
they are not LOG_UNIMP but error indications during processing which
could be due to invalid parameters passed from the driver
> 
> > +                s->cbaser = 0;
> > +                result = MEMTX_ERROR;
> > +            } else {
> > +                s->creadr = 0;
> > +            }
> > +        }
> > +        break;
> > +    case GITS_CWRITER:
> > +        s->cwriter = value;
> > +        break;
> > +    case GITS_TYPER:
> > +    case GITS_CREADR:
> > +        /* RO register, ignore the write */
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +                      "%s: invalid guest write to RO register at
> > offset "
> > +                      TARGET_FMT_plx "\n", __func__, offset);
> > +        break;
> > +    default:
> > +        result = MEMTX_ERROR;
> > +        break;
> > +    }
> >      return result;
> >  }
> >  
> > @@ -150,7 +478,29 @@ static MemTxResult its_readll(GICv3ITSState
> > *s, hwaddr offset,
> >                                 uint64_t *data, MemTxAttrs attrs)
> >  {
> >      MemTxResult result = MEMTX_OK;
> > +    int index;
> >  
> > +    switch (offset) {
> > +    case GITS_TYPER:
> > +        *data = s->typer;
> > +        break;
> > +    case GITS_BASER ... GITS_BASER + 0x3f:
> > +        index = (offset - GITS_BASER) / 8;
> > +        *data = s->baser[index];
> > +        break;
> > +    case GITS_CBASER:
> > +        *data = s->cbaser;
> > +        break;
> > +    case GITS_CREADR:
> > +        *data = s->creadr;
> > +        break;
> > +    case GITS_CWRITER:
> > +        *data = s->cwriter;
> > +        break;
> > +    default:
> > +        result = MEMTX_ERROR;
> > +        break;
> > +    }
> >      return result;
> >  }
> >  
> > @@ -250,6 +600,9 @@ static void gicv3_arm_its_realize(DeviceState
> > *dev, Error **errp)
> >      GICv3ITSState *s = ARM_GICV3_ITS_COMMON(dev);
> >  
> >      gicv3_its_init_mmio(s, &gicv3_its_control_ops,
> > &gicv3_its_trans_ops);
> > +
> > +    address_space_init(&s->gicv3->sysmem_as, s->gicv3->sysmem,
> > +                        "gicv3-its-sysmem");
> >  }
> >  
> >  static void gicv3_its_reset(DeviceState *dev)
> > @@ -259,6 +612,9 @@ static void gicv3_its_reset(DeviceState *dev)
> >  
> >      if (s->gicv3->cpu->gicr_typer & GICR_TYPER_PLPIS) {
> >          c->parent_reset(dev);
> > +        memset(&c->dt, 0 , sizeof(c->dt));
> > +        memset(&c->ct, 0 , sizeof(c->ct));
> > +        memset(&c->cq, 0 , sizeof(c->cq));
> >  
> >          /* set the ITS default features supported */
> >          s->typer = GITS_TYPER_PHYSICAL |
> > (GITS_TYPER_ITT_ENTRY_SIZE <<
> > diff --git a/include/hw/intc/arm_gicv3_common.h
> > b/include/hw/intc/arm_gicv3_common.h
> > index 91491a2f66..b0f2414fa3 100644
> > --- a/include/hw/intc/arm_gicv3_common.h
> > +++ b/include/hw/intc/arm_gicv3_common.h
> > @@ -226,12 +226,16 @@ struct GICv3State {
> >      int dev_fd; /* kvm device fd if backed by kvm vgic support */
> >      Error *migration_blocker;
> >  
> > +    MemoryRegion *sysmem;
> > +    AddressSpace sysmem_as;
> > +
> >      /* Distributor */
> >  
> >      /* for a GIC with the security extensions the NS banked
> > version of this
> >       * register is just an alias of bit 1 of the S banked version.
> >       */
> >      uint32_t gicd_ctlr;
> > +    uint32_t gicd_typer;
> >      uint32_t gicd_statusr[2];
> >      GIC_DECLARE_BITMAP(group);        /* GICD_IGROUPR */
> >      GIC_DECLARE_BITMAP(grpmod);       /* GICD_IGRPMODR */
> 
> 


