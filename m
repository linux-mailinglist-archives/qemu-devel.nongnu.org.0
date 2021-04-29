Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B659C36F308
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 01:44:00 +0200 (CEST)
Received: from localhost ([::1]:51736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcGK7-0006Ud-QC
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 19:43:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lcGEJ-0003SY-Sz
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 19:38:01 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:33402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lcGEB-0002O3-IY
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 19:37:58 -0400
Received: by mail-qk1-x729.google.com with SMTP id o5so69047373qkb.0
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 16:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yxs3g63Bfu7uw+P6905bkCJPUzMrtjNPO0AuFdpm0iE=;
 b=Huxtqn0/GTYVPHh9Dpt2z+Vsek/W4qA5G/NL+YyNuEtOQ8Ey3eP5Z4/2o3pCzg8ltB
 lkyy0ZuQjVl3ORL6qxR5KrKEWmtK/mknVJBrXu9QxPsJalXqjN0WxuCoHEXOAP3anAwL
 p22HYvjL8heWz7g8wrrqqgaB2eAzQyh56Hn2uS9S2ycWeVD1o/DwbYNZvCZHxF5kIHyF
 UF5KXrkyMbk/q6BM+E0iFK7FyIUkbo1p1GNWcH3w0D6AfSospP1ZLIjNnLVFgXqtiTeF
 51S0fL7e160rhlp69fi82ZIx4ILgkiu//LaRK/fbslAaeCWNy3LUe1J79X/b0hTMc9z7
 RpdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yxs3g63Bfu7uw+P6905bkCJPUzMrtjNPO0AuFdpm0iE=;
 b=h8+T23pXrMWEJcegHFTFUW7Ob7HI8QAoJjAh1iDU3UJ7QnZ43k6kEs1A2+fgvCfTti
 bejVHOdWfRIX4UNmfkSHZzQmWKgW/KCwEF9CcHRknvmhcmg0QQWtzxRn5+kxRuBG7Xsn
 wWtTvJbzISj2wjZbnJkEVizxaMFXlQWXxRdIe4aWe5+p03VlPenZ3Yg+qoTUDepWx8J3
 T7ACK5iQiAcNQ61ib+G6+UYUmP8JSiOWa0yGRqkKzVjlzk0JmftP1tCsCdehGeCm2JKj
 t+Gky6J0wczBb6+q678ChGxGaX51VqB0ZFLtehxWF0rnI9+IpWPibXMeVWziP4+LP1Iy
 dJRw==
X-Gm-Message-State: AOAM5324mSpCggvVrj7KC5eC++oyIFzlPp1IcppI9fdcHIiQU4aGyXaC
 Q7XeECnQyNUX+kvB55q7t3Ajag==
X-Google-Smtp-Source: ABdhPJw23wfC5wd1fO5neswyVWIV6/c9Mbwt1p3xy6sGfuvdqIPWY1tI4CC8U1bccVc1AWK/Hkt2lw==
X-Received: by 2002:a37:7e03:: with SMTP id z3mr2365459qkc.367.1619739468320; 
 Thu, 29 Apr 2021 16:37:48 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-23-174-92-28-28.dsl.bell.ca. [174.92.28.28])
 by smtp.gmail.com with ESMTPSA id j129sm102518qkf.110.2021.04.29.16.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 16:37:47 -0700 (PDT)
Message-ID: <444590421f702c420ef5e4a73ea3bfec261a53c8.camel@linaro.org>
Subject: Re: [PATCH v2 2/8] hw/intc: GICv3 ITS register definitions added
From: shashi.mallela@linaro.org
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Apr 2021 19:37:47 -0400
In-Reply-To: <937a2923445e3ff629c9799a8579c470d2636375.camel@linaro.org>
References: <20210401024152.203896-1-shashi.mallela@linaro.org>
 <20210401024152.203896-3-shashi.mallela@linaro.org>
 <CAFEAcA93tEGMAhB-ZBNu3=J+AWLehsvpwiOZQNqTqZPucYNBgg@mail.gmail.com>
 <937a2923445e3ff629c9799a8579c470d2636375.camel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-14.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x729.google.com
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
Cc: Leif Lindholm <leif@nuviainc.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2021-04-29 at 17:46 -0400, shashi.mallela@linaro.org wrote:
On Fri, 2021-04-16 at 19:54 +0100, Peter Maydell wrote:
> On Thu, 1 Apr 2021 at 03:41, Shashi Mallela <
> shashi.mallela@linaro.org> wrote:
> > Defined descriptors for ITS device table,collection table and ITS
> > command queue entities.Implemented register read/write functions,
> > extract ITS table parameters and command queue parameters,extended
> > gicv3 common to capture qemu address space(which host the ITS table
> > platform memories required for subsequent ITS processing) and
> > initialize the same in its device.
> > 
> > Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> > ---
> >  hw/intc/arm_gicv3_its.c                | 313
> > +++++++++++++++++++++++++
> >  hw/intc/arm_gicv3_its_common.c         |  42 ++++
> >  hw/intc/gicv3_internal.h               |  33 ++-
> >  include/hw/intc/arm_gicv3_common.h     |   4 +
> >  include/hw/intc/arm_gicv3_its_common.h |  28 +++
> >  5 files changed, 414 insertions(+), 6 deletions(-)
> > 
> > diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> > index 209120d102..81373f049d 100644
> > --- a/hw/intc/arm_gicv3_its.c
> > +++ b/hw/intc/arm_gicv3_its.c
> > @@ -28,6 +28,131 @@ struct GICv3ITSClass {
> >      void (*parent_reset)(DeviceState *dev);
> >  };
> > 
> > +static bool extract_table_params(GICv3ITSState *s, int index)
> > +{
> > +    uint16_t num_pages = 0;
> > +    uint8_t  page_sz_type;
> > +    uint8_t type;
> > +    uint32_t page_sz = 0;
> > +    uint64_t value = s->baser[index];
> > +
> > +    num_pages = FIELD_EX64(value, GITS_BASER, SIZE);
> > +    page_sz_type = FIELD_EX64(value, GITS_BASER, PAGESIZE);
> > +
> > +    if (page_sz_type == 0) {
> > +        page_sz = GITS_ITT_PAGE_SIZE_0;
> > +    } else if (page_sz_type == 0) {
> > +        page_sz = GITS_ITT_PAGE_SIZE_1;
> > +    } else if (page_sz_type == 2) {
> > +        page_sz = GITS_ITT_PAGE_SIZE_2;
> > +    } else {
> > +        return false;
> 
> The spec says that page_sz+type = 0b11 should be treated as 0b10.
> So we could log this as a guest error if you like but otherwise
> should handle it the same way we do 0b10.
> 
> > +    }
> 
> if (x == CONST1) {
> } else if (x == CONST2) {
> } else {
> }
> 
> is usually clearer written with switch(). (There are other instances
> of this pattern below.)
> 
> > +
> > +    type = FIELD_EX64(value, GITS_BASER, TYPE);
> > +
> > +    if (type == GITS_ITT_TYPE_DEVICE) {
> > +        s->dt.valid = FIELD_EX64(value, GITS_BASER, VALID);
> > +
> > +        if (s->dt.valid) {
> > +            s->dt.indirect = FIELD_EX64(value, GITS_BASER,
> > INDIRECT);
> > +            s->dt.entry_sz = FIELD_EX64(value, GITS_BASER,
> > ENTRYSIZE);
> > +
> > +            if (!s->dt.indirect) {
> > +                s->dt.max_entries = ((num_pages + 1) * page_sz) /
> > +                                                       s-
> > >dt.entry_sz;
> > +            } else {
> > +                s->dt.max_entries = ((((num_pages + 1) * page_sz)
> > /
> > +                                        L1TABLE_ENTRY_SIZE) *
> > +                                    (page_sz / s->dt.entry_sz));
> > +            }
> > +
> > +            s->dt.max_devids = (1UL << (FIELD_EX64(s->typer,
> > GITS_TYPER,
> > +                                                    DEVBITS) +
> > 1));
> > +
> > +            if ((page_sz == GITS_ITT_PAGE_SIZE_0) ||
> > +                    (page_sz == GITS_ITT_PAGE_SIZE_1)) {
> > +                s->dt.base_addr = FIELD_EX64(value, GITS_BASER,
> > PHYADDR);
> > +                s->dt.base_addr <<= R_GITS_BASER_PHYADDR_SHIFT;
> > +            } else if (page_sz == GITS_ITT_PAGE_SIZE_2) {
> > +                s->dt.base_addr = FIELD_EX64(value, GITS_BASER,
> > PHYADDRL_64K) <<
> > +                                  R_GITS_BASER_PHYADDRL_64K_SHIFT;
> > +                  s->dt.base_addr |= ((value >>
> > R_GITS_BASER_PHYADDR_SHIFT) &
> > +                                       R_GITS_BASER_PHYADDRH_64K_M
> > ASK) <<
> > +                                       R_GITS_BASER_PHYADDRH_64K_S
> > HIFT;
> > +            }
> > +        }
> > +    } else if (type == GITS_ITT_TYPE_COLLECTION) {
> > +        s->ct.valid = FIELD_EX64(value, GITS_BASER, VALID);
> > +
> > +        /*
> > +         * GITS_TYPER.HCC is 0 for this implementation
> > +         * hence writes are discarded if ct.valid is 0
> > +         */
> > +        if (s->ct.valid) {
> > +            s->ct.indirect = FIELD_EX64(value, GITS_BASER,
> > INDIRECT);
> > +            s->ct.entry_sz = FIELD_EX64(value, GITS_BASER,
> > ENTRYSIZE);
> > +
> > +            if (!s->ct.indirect) {
> > +                s->ct.max_entries = ((num_pages + 1) * page_sz) /
> > +                                      s->ct.entry_sz;
> > +            } else {
> > +                s->ct.max_entries = ((((num_pages + 1) * page_sz)
> > /
> > +                                      L1TABLE_ENTRY_SIZE) *
> > +                                      (page_sz / s->ct.entry_sz));
> > +            }
> > +
> > +            if (FIELD_EX64(s->typer, GITS_TYPER, CIL)) {
> > +                s->ct.max_collids = (1UL << (FIELD_EX64(s->typer,
> > GITS_TYPER,
> > +                                                         CIDBITS)
> > + 1));
> > +            } else {
> > +                /* 16-bit CollectionId supported when CIL == 0 */
> > +                s->ct.max_collids = (1UL << 16);
> > +            }
> > +
> > +            if ((page_sz == GITS_ITT_PAGE_SIZE_0) ||
> > +                 (page_sz == GITS_ITT_PAGE_SIZE_1)) {
> > +                s->ct.base_addr = FIELD_EX64(value, GITS_BASER,
> > PHYADDR);
> > +                s->ct.base_addr <<= R_GITS_BASER_PHYADDR_SHIFT;
> > +            } else if (page_sz == GITS_ITT_PAGE_SIZE_2) {
> > +                s->ct.base_addr = FIELD_EX64(value, GITS_BASER,
> > PHYADDRL_64K) <<
> > +                                    R_GITS_BASER_PHYADDRL_64K_SHIF
> > T;
> > +                s->ct.base_addr |= ((value >>
> > R_GITS_BASER_PHYADDR_SHIFT) &
> > +                                     R_GITS_BASER_PHYADDRH_64K_MAS
> > K) <<
> > +                                     R_GITS_BASER_PHYADDRH_64K_SHI
> > FT;
> > +            }
> > +        }
> > +    } else {
> > +        /* unsupported ITS table type */
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Unsupported ITS table
> > type %d",
> > +                         __func__, type);
> 
> This should never happen, because the TYPE field in a GITS_BASER
> register
> is read-only. The model should insure that the guest can never write
> to
> these bits. Then you can just assert() that the field is valid, if
> you like.
> 
> > +        return false;
> > +    }
> > +    return true;
> > +}
> > +
> > +static bool extract_cmdq_params(GICv3ITSState *s)
> > +{
> > +    uint16_t num_pages = 0;
> > +    uint64_t value = s->cbaser;
> > +
> > +    num_pages = FIELD_EX64(value, GITS_CBASER, SIZE);
> > +
> > +    s->cq.valid = FIELD_EX64(value, GITS_CBASER, VALID);
> > +
> > +    if (!num_pages || !s->cq.valid) {
> 
> Why do you think num_pages == 0 is not valid ?
> Have rectified this
> > +        return false;
> > +    }
> > +
> > +    if (s->cq.valid) {
> > +        s->cq.max_entries = ((num_pages + 1) *
> > GITS_ITT_PAGE_SIZE_0) /
> > +                                                GITS_CMDQ_ENTRY_SI
> > ZE;
> > +        s->cq.base_addr = FIELD_EX64(value, GITS_CBASER, PHYADDR);
> > +        s->cq.base_addr <<= R_GITS_CBASER_PHYADDR_SHIFT;
> > +    }
> > +    return true;
> > +}
> > +
> >  static MemTxResult its_trans_writew(GICv3ITSState *s, hwaddr
> > offset,
> >                                 uint64_t value, MemTxAttrs attrs)
> >  {
> > @@ -126,7 +251,75 @@ static MemTxResult its_writel(GICv3ITSState
> > *s, hwaddr offset,
> >                                 uint64_t value, MemTxAttrs
> > attrs)>  {
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
> 
> The spec says writes are UNPREDICTABLE, not RO. We can make an
> impdef choice to interpret that as RO for our convenience, but
> the comment should note that it is our IMPDEF choice.
> 
> > +        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
> > +            s->cbaser = deposit64(s->cbaser, 0, 32, value);
> > +            s->creadr = 0;
> > +        }
> > +        break;
> > +    case GITS_CBASER + 4:
> > +        /* GITS_CBASER register becomes RO if ITS is already
> > enabled */
> > +        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
> > +            s->cbaser = deposit64(s->cbaser, 32, 32, value);
> > +            if (!extract_cmdq_params(s)) {
> 
> You should postpone trying to parse the CBASER fields until
> the guest enables the ITS by writing to GITS_CTLR.Enabled.
> Because CBASER is a 64-bit register that can be written as two
> 32-bit halves, the guest might choose to write the two halves
> in either order, and you won't have a full valid CBASER.
> If you wait until the ITS is enabled then you know the guest
> should have written the register values completely then.
> Similarly with BASER.
> 
> > +                qemu_log_mask(LOG_GUEST_ERROR,
> > +                       "%s: error extracting GITS_CBASER
> > parameters "
> > +                       TARGET_FMT_plx "\n", __func__, offset);
> > +                s->cbaser = 0;
> 
> Clearing CBASER if the guest writes an invalid value to it
> doesn't seem right. Since you have these expanded-out structs,
> you can just treat any bogus values as if the guest had written
> VALID=0, and leave the actual guest-written value in s->cbaser.
> (In fact I think the only case when extract_cmdq_params()
> can reasonably return false is exactly when VALID=0, so in
> that case you might as well drop the bool return type from it
> completely.)
> 
> > +                result = MEMTX_ERROR;
> 
> I don't recommend using MEMTX_ERROR here for this kind of
> "the guest wrote a value to a valid register but there happened
> to be something wrong with the value it wrote". The intention
> with the arm_gicv3_dist.c code structure that you've copied
> here for the ITS was simply to use MEMTX_ERROR to capture "this
> register doesn't exist for this size" to be able to have a
> single LOG_GUEST_ERROR message for that at the top level
> function.
> 
> For more complicated stuff like this you should just report a
> suitable specific LOG_GUEST_ERROR directly in extract_cmdq_params()
> and return MEMTX_OK. (The code you have for BASER will actually
> report
> three different log messages for a single guest mistake -- once
> inside
> extract_table_params(), once in the code in this function that calls
> extract_table_params(), and then once in gicv3_its_read(). One is
> sufficient.)
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
> > +        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
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
> > +                    s->baser[index] = 0;
> > +                    result = MEMTX_ERROR;
> > +                }
> > +            } else {
> > +                s->baser[index] =  deposit64(s->baser[index], 0,
> > 32, value);
> > +            }
> > +        }
> 
> Pretty much all the remarks I made earlier about CBASER apply here
> too.
> 
> Also, 'unimplemented' BASER registers are supposed to be RES0, and
> I don't think we actually implement more than either 2 or 3, right?
> we implement only 2 BASER registers one for device table and one
for collection table
> 
> > +        break;
> > +    case GITS_IIDR:
> > +    case GITS_TYPER:
> > +    case GITS_CREADR:
> > +        /* RO registers, ignore the write */
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +            "%s: invalid guest write to RO register at offset "
> > +            TARGET_FMT_plx "\n", __func__, offset);
> > +        break;
> 
> I wouldn't personally bother explicitly reporting write-to-RO-
> register
> here: if you just let the default case handle it then the log in
> the caller will do a LOG_GUEST_ERROR for you.
> 
> > +    default:
> > +        result = MEMTX_ERROR;
> > +        break;
> > +    }
> >      return result;
> >  }
> > 
> > @@ -142,7 +382,52 @@ static MemTxResult its_writell(GICv3ITSState
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
> > +        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
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
> > +        if (!(s->ctlr & ITS_CTLR_ENABLED)) {
> > +            s->cbaser = value;
> > +            if (!extract_cmdq_params(s)) {
> > +                qemu_log_mask(LOG_GUEST_ERROR,
> > +                       "%s: error extracting GITS_CBASER
> > parameters "
> > +                       TARGET_FMT_plx "\n", __func__, offset);
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
> 
> Comments on the 32-bit write function apply here too.
> 
> >      return result;
> >  }
> > @@ -250,6 +557,9 @@ static void gicv3_arm_its_realize(DeviceState
> > *dev, Error **errp)
> >      GICv3ITSState *s = ARM_GICV3_ITS_COMMON(dev);
> > 
> >      gicv3_its_init_mmio(s, &gicv3_its_control_ops,
> > &gicv3_its_translation_ops);
> > +
> > +    address_space_init(&s->gicv3->sysmem_as, s->gicv3->sysmem,
> > +                        "gicv3-its-sysmem");
> 
> Indent here seems wrong -- the second line should be lined up with
> the first, so the '"' is below the '&'. I think I noticed some of
> this
> in patch 1 as well, so worth going through and checking that.
> 
> >  }
> > 
> >  static void gicv3_its_reset(DeviceState *dev)
> > @@ -259,6 +569,9 @@ static void gicv3_its_reset(DeviceState *dev)
> > 
> >      if (s->gicv3->cpu->gicr_typer & GICR_TYPER_PLPIS) {
> >          c->parent_reset(dev);
> > +        memset(&s->dt, 0, sizeof(s->dt));
> > +        memset(&s->ct, 0, sizeof(s->ct));
> > +        memset(&s->cq, 0, sizeof(s->cq));
> 
> Would be cleaner to first set the baser/cbaser registers to their
> reset values and then just call the function that calculates these
> struct fields based on the register values.
> 
> >          /* set the ITS default features supported */
> >          s->typer = FIELD_DP64(s->typer, GITS_TYPER, PHYSICAL,
> > diff --git a/hw/intc/arm_gicv3_its_common.c
> > b/hw/intc/arm_gicv3_its_common.c
> > index 80cc9ec6d8..9c5c71f350 100644
> > --- a/hw/intc/arm_gicv3_its_common.c
> > +++ b/hw/intc/arm_gicv3_its_common.c
> > @@ -48,6 +48,42 @@ static int gicv3_its_post_load(void *opaque, int
> > version_id)
> >      return 0;
> >  }
> > 
> > +static const VMStateDescription vmstate_its_dtdesc = {
> > +    .name = "arm_gicv3_its_dtdesc",
> > +    .fields = (VMStateField[]) {
> > +        VMSTATE_BOOL(valid, DevTableDesc),
> > +        VMSTATE_BOOL(indirect, DevTableDesc),
> > +        VMSTATE_UINT16(entry_sz, DevTableDesc),
> > +        VMSTATE_UINT32(max_entries, DevTableDesc),
> > +        VMSTATE_UINT32(max_devids, DevTableDesc),
> > +        VMSTATE_UINT64(base_addr, DevTableDesc),
> > +        VMSTATE_END_OF_LIST(),
> > +    },
> > +};
> > +
> > +static const VMStateDescription vmstate_its_ctdesc = {
> > +    .name = "arm_gicv3_its_ctdesc",
> > +    .fields = (VMStateField[]) {
> > +        VMSTATE_BOOL(valid, CollTableDesc),
> > +        VMSTATE_BOOL(indirect, CollTableDesc),
> > +        VMSTATE_UINT16(entry_sz, CollTableDesc),
> > +        VMSTATE_UINT32(max_entries, CollTableDesc),
> > +        VMSTATE_UINT32(max_collids, CollTableDesc),
> > +        VMSTATE_UINT64(base_addr, CollTableDesc),
> > +        VMSTATE_END_OF_LIST(),
> > +    },
> > +};
> > +
> > +static const VMStateDescription vmstate_its_cqdesc = {
> > +    .name = "arm_gicv3_its_cqdesc",
> > +    .fields = (VMStateField[]) {
> > +        VMSTATE_BOOL(valid, CmdQDesc),
> > +        VMSTATE_UINT32(max_entries, CmdQDesc),
> > +        VMSTATE_UINT64(base_addr, CmdQDesc),
> > +        VMSTATE_END_OF_LIST(),
> > +    },
> > +};
> 
> Do these really need migrating, or are they just expanded out values
> that can be recalculated from the BASER and CBASER register values?
> If so then it would be simpler to recalculate in a migration post-
> load
> function.
> have removed all the migration specific variables and implemented
> migration post-load to recalculate the required values
> 
> > +
> >  static const VMStateDescription vmstate_its = {
> >      .name = "arm_gicv3_its",
> >      .version_id = 1,
> > @@ -56,6 +92,12 @@ static const VMStateDescription vmstate_its = {
> >      .post_load = gicv3_its_post_load,
> >      .priority = MIG_PRI_GICV3_ITS,
> >      .fields = (VMStateField[]) {
> > +        VMSTATE_STRUCT(dt, GICv3ITSState, 0, vmstate_its_dtdesc,
> > +                        DevTableDesc),
> > +        VMSTATE_STRUCT(ct, GICv3ITSState, 0, vmstate_its_ctdesc,
> > +                        CollTableDesc),
> > +        VMSTATE_STRUCT(cq, GICv3ITSState, 0, vmstate_its_cqdesc,
> > +                        CmdQDesc),
> 
> As noted previously, you can't just add fields to a
> VMStateDescription;
> retaining migration compatibility requires more than that.
> 
> >          VMSTATE_UINT32(ctlr, GICv3ITSState),
> >          VMSTATE_UINT32(translater, GICv3ITSState),
> >          VMSTATE_UINT32(iidr, GICv3ITSState),
> > diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
> > index 96cfe2dff9..b7701e8ca5 100644
> > --- a/hw/intc/gicv3_internal.h
> > +++ b/hw/intc/gicv3_internal.h
> > @@ -246,13 +246,14 @@ FIELD(GITS_BASER, INNERCACHE, 59, 3)
> >  FIELD(GITS_BASER, INDIRECT, 62, 1)
> >  FIELD(GITS_BASER, VALID, 63, 1)
> > 
> > -#define GITS_BASER_PAGESIZE_4K                0
> > -#define GITS_BASER_PAGESIZE_16K               1
> > -#define GITS_BASER_PAGESIZE_64K               2
> > -
> > -#define GITS_ITT_TYPE_DEVICE                  1ULL
> > -#define GITS_ITT_TYPE_COLLECTION              4ULL
> 
> You just added these in the previous patch, don't move them
> in this one. Have patch 1 put them in the right place in the file
> to start with.
> 
> > +FIELD(GITS_CBASER, SIZE, 0, 8)
> > +FIELD(GITS_CBASER, SHAREABILITY, 10, 2)
> > +FIELD(GITS_CBASER, PHYADDR, 12, 40)
> > +FIELD(GITS_CBASER, OUTERCACHE, 53, 3)
> > +FIELD(GITS_CBASER, INNERCACHE, 59, 3)
> > +FIELD(GITS_CBASER, VALID, 63, 1)
> > 
> > +FIELD(GITS_CTLR, ENABLED, 0, 1)
> >  FIELD(GITS_CTLR, QUIESCENT, 31, 1)
> > 
> >  FIELD(GITS_TYPER, PHYSICAL, 0, 1)
> > @@ -264,6 +265,26 @@ FIELD(GITS_TYPER, PTA, 19, 1)
> >  FIELD(GITS_TYPER, CIDBITS, 32, 4)
> >  FIELD(GITS_TYPER, CIL, 36, 1)
> > 
> > +#define ITS_CTLR_ENABLED               (1U)  /* ITS Enabled */
> > +
> > +#define
> > GITS_BASER_VAL_MASK                  (R_GITS_BASER_ENTRYSIZE_MASK |
> > \
> > +                                              R_GITS_BASER_TYPE_MA
> > SK)
> > +
> > +#define GITS_BASER_PAGESIZE_4K                0
> > +#define GITS_BASER_PAGESIZE_16K               1
> > +#define GITS_BASER_PAGESIZE_64K               2
> > +
> > +#define GITS_ITT_TYPE_DEVICE                  1ULL
> > +#define GITS_ITT_TYPE_COLLECTION              4ULL
> > +
> > +#define GITS_ITT_PAGE_SIZE_0      0x1000
> > +#define GITS_ITT_PAGE_SIZE_1      0x4000
> > +#define GITS_ITT_PAGE_SIZE_2      0x10000
> > +
> > +#define L1TABLE_ENTRY_SIZE         8
> > +
> > +#define GITS_CMDQ_ENTRY_SIZE               32
> > +
> >  /**
> >   * Default features advertised by this version of ITS
> >   */
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
> 
> I think these would be better named "dma" and "dma_as", because
> from the ITS' point of view that's what they are. There's no inherent
> requirement that they be connected to the system address space in
> particular.
> 
> > +
> >      /* Distributor */
> > 
> >      /* for a GIC with the security extensions the NS banked
> > version of this
> >       * register is just an alias of bit 1 of the S banked version.
> >       */
> >      uint32_t gicd_ctlr;
> > +    uint32_t gicd_typer;
> 
> What's this for ? You shouldn't need to be adding new distributor
> state fields.
> removed
> 
> >      uint32_t gicd_statusr[2];
> >      GIC_DECLARE_BITMAP(group);        /* GICD_IGROUPR */
> >      GIC_DECLARE_BITMAP(grpmod);       /* GICD_IGRPMODR */
> > diff --git a/include/hw/intc/arm_gicv3_its_common.h
> > b/include/hw/intc/arm_gicv3_its_common.h
> > index 08bc5652ed..b7eca57221 100644
> > --- a/include/hw/intc/arm_gicv3_its_common.h
> > +++ b/include/hw/intc/arm_gicv3_its_common.h
> > @@ -43,6 +43,30 @@
> > 
> >  #define GITS_PIDR2       0xFFE8
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
> >  struct GICv3ITSState {
> >      SysBusDevice parent_obj;
> > 
> > @@ -66,6 +90,10 @@ struct GICv3ITSState {
> >      uint64_t creadr;
> >      uint64_t baser[8];
> > 
> > +    DevTableDesc  dt;
> > +    CollTableDesc ct;
> > +    CmdQDesc      cq;
> > +
> >      Error *migration_blocker;
> >  };
> > 
> > --
> > 2.27.0
> 
> thanks
> -- PMM


