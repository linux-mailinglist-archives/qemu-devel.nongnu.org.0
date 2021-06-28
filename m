Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E205F3B6ACC
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 00:05:29 +0200 (CEST)
Received: from localhost ([::1]:40616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxzNg-0007xP-QU
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 18:05:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lxzMT-00070S-Oa
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 18:04:13 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:39612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1lxzMQ-0003nZ-NZ
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 18:04:13 -0400
Received: by mail-qk1-x731.google.com with SMTP id j184so29135831qkd.6
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 15:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wgoo+pEKOSEou1TtqRefcsq064yJ7WZCulP0BW99HMA=;
 b=rOY80B6JZQ6ZpIaweDUEzFtDEM5dZwa6CZUKnU0CCwJ6saHxP+kEGAA90XJbB1H7Wt
 DlOFkOx6wtOZz5wkXQ/Y+AH5qrLTRfXvakyx6dzBn3RnQu17H4tnXtE92VB2yqX7SnJ5
 42d9ZwYTuM7TjYh1bCs5ejTfkDDCi46eBGDyxm7WxAvqVbKnvnBK1wXWMQa9ZsxgZq+X
 E5tLPpHVWVuHytWJ8VS97rVp3YqgMMxk0gux/BTAlZmexCEz4obo9cBYlnNr3q9Dcuqs
 AkfgqwtNhranDhFfnf5BWaoKYf81EfdXWhFPSUrItb28rP4WCBvyBDqZbxk7CXP4d+gB
 2qlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Wgoo+pEKOSEou1TtqRefcsq064yJ7WZCulP0BW99HMA=;
 b=huOlR6NmGmht9I4VqRU7nVahbD3wA6kJof4JbK9WXEppD8jvoyeRRSDFflipxdhAYw
 4dAqzSUG/uqnRkENQz4Uh17CcLwwqQSsOqSJKB5W6Lh4YW7VxNj5hZxF0zsDr54f/NG6
 NG2I/iW6pCEdgdTLqtveis17dlF96oB/dklhO/5j7KLd3x/6MU1B6EY4lvBiHzjKG1+w
 +hKEbAHRwIp3CTiXXDbvbnuZlbn+l0nOdIrYETGP4FLsh1Pb7+AcYkVVpeLW6tvKStPG
 EN4+w4A+5KJHQB9wjGuzlWmT3brGqRJaKgyXFB3JrcjMdTEwNvn0UE4hpft13fa8KERE
 T2QQ==
X-Gm-Message-State: AOAM530UOkCzoVFC+0Wl7X/6PcUKPFY7fz5ncN3QC+yy5hlcy+335kSx
 zwfZy1BK/4Z5YvVGx+jLzS6TXg==
X-Google-Smtp-Source: ABdhPJzswjSpTh1pVJ1VSG2bfx++fcMV8vjdVjTDwxq92WdoRZxdFT1NOg+bzSUx1G8TIpWqEyTBVQ==
X-Received: by 2002:a05:620a:294a:: with SMTP id
 n10mr27586935qkp.164.1624917849561; 
 Mon, 28 Jun 2021 15:04:09 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.gmail.com with ESMTPSA id m3sm11446352qkh.135.2021.06.28.15.04.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 15:04:09 -0700 (PDT)
Message-ID: <e4f1d0d2cfb359ae98af9be55338e2176b55ed8e.camel@linaro.org>
Subject: Re: [PATCH v4 4/8] hw/intc: GICv3 ITS Command processing
From: shashi.mallela@linaro.org
To: Eric Auger <eauger@redhat.com>, peter.maydell@linaro.org,
 leif@nuviainc.com,  rad@semihalf.com
Date: Mon, 28 Jun 2021 18:04:08 -0400
In-Reply-To: <417632ff-7de6-b092-5853-a7df225a30c3@redhat.com>
References: <20210602180042.111347-1-shashi.mallela@linaro.org>
 <20210602180042.111347-5-shashi.mallela@linaro.org>
 <bed8a5fa-2963-07c8-eefa-00f28a7401eb@redhat.com>
 <2425778b1d615d72153233cb321cf56677ebba5a.camel@linaro.org>
 <417632ff-7de6-b092-5853-a7df225a30c3@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x731.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Eric,

Have taken care of the pending & latest "process_int" comment(below) by
renaming it to process_its_cmd to keep it more generic since it is also
handles other ITS commands and interrupt trigger both by INT command as
well as GITS_TRANSLATER write.Have added comments for this function as
well.

Will be sharing the updated patchset with all comments addressed soon.

Thanks
Shashi

On Mon, 2021-06-21 at 12:13 +0200, Eric Auger wrote:
> 
> On 6/16/21 11:02 PM, shashi.mallela@linaro.org wrote:
> > Hi Eric,
> > 
> > Please find my responses inline (below):-
> > 
> > On Sun, 2021-06-13 at 17:55 +0200, Eric Auger wrote:
> > > Hi Shashi,
> > > 
> > > On 6/2/21 8:00 PM, Shashi Mallela wrote:
> > > > Added ITS command queue handling for MAPTI,MAPI
> > > > commands,handled
> > > > ITS
> > > > translation which triggers an LPI via INT command as well as
> > > > write
> > > > to GITS_TRANSLATER register,defined enum to differentiate
> > > > between
> > > > ITS
> > > > command interrupt trigger and GITS_TRANSLATER based interrupt
> > > > trigger.
> > > > Each of these commands make use of other functionalities
> > > > implemented to
> > > > get device table entry,collection table entry or interrupt
> > > > translation
> > > > table entry required for their processing.
> > > > 
> > > > Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> > > > ---
> > > >  hw/intc/arm_gicv3_its.c            | 334
> > > > +++++++++++++++++++++++++++++
> > > >  hw/intc/gicv3_internal.h           |  12 ++
> > > >  include/hw/intc/arm_gicv3_common.h |   2 +
> > > >  3 files changed, 348 insertions(+)
> > > > 
> > > > diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> > > > index 6551c577b3..82bb5b84ef 100644
> > > > --- a/hw/intc/arm_gicv3_its.c
> > > > +++ b/hw/intc/arm_gicv3_its.c
> > > > @@ -28,6 +28,13 @@ struct GICv3ITSClass {
> > > >      void (*parent_reset)(DeviceState *dev);
> > > >  };
> > > >  
> > > > +typedef enum ItsCmdType {
> > > > +    NONE = 0, /* internal indication for GITS_TRANSLATER write
> > > > */
> > > > +    CLEAR = 1,
> > > > +    DISCARD = 2,
> > > > +    INT = 3,
> > > > +} ItsCmdType;
> > > Add a comment to explain what this enum stand for. This sounds
> > > misleading to me versus the command IDs. Why don't you use the
> > > cmd id
> > > then and add NONE?
> > This is an internal enum used to distinguish between interrupt
> > triggered via command queue and interrupt triggered via
> > gits_translater
> > write.Will add the same comment in code.
> > Since NONE is only 1 command applicable for GITS_TRANSLATER,started
> > with it so that in the future if any further command queue commands
> > have to be added we can just extend the numbering.
> > > > +
> > > >  static uint64_t baser_base_addr(uint64_t value, uint32_t
> > > > page_sz)
> > > >  {
> > > >      uint64_t result = 0;
> > > > @@ -49,6 +56,315 @@ static uint64_t baser_base_addr(uint64_t
> > > > value,
> > > > uint32_t page_sz)
> > > >      return result;
> > > >  }
> > > >  
> > > > +static bool get_cte(GICv3ITSState *s, uint16_t icid, uint64_t
> > > > *cte,
> > > > +                    MemTxResult *res)
> > > > +{
> > > > +    AddressSpace *as = &s->gicv3->dma_as;
> > > > +    uint64_t l2t_addr;
> > > > +    uint64_t value;
> > > > +    bool valid_l2t;
> > > > +    uint32_t l2t_id;
> > > > +    uint32_t max_l2_entries;
> > > > +    bool status = false;
> > > > +
> > > > +    if (s->ct.indirect) {
> > > > +        l2t_id = icid / (s->ct.page_sz / L1TABLE_ENTRY_SIZE);
> > > > +
> > > > +        value = address_space_ldq_le(as,
> > > > +                                     s->ct.base_addr +
> > > > +                                     (l2t_id *
> > > > L1TABLE_ENTRY_SIZE),
> > > > +                                     MEMTXATTRS_UNSPECIFIED,
> > > > res);
> > > > +
> > > > +        if (*res == MEMTX_OK) {
> > > > +            valid_l2t = (value >> VALID_SHIFT) & VALID_MASK;
> > > > +
> > > > +            if (valid_l2t) {
> > > > +                max_l2_entries = s->ct.page_sz / s-
> > > > >ct.entry_sz;
> > > > +
> > > > +                l2t_addr = value & ((1ULL << 51) - 1);
> > > > +
> > > > +                *cte =  address_space_ldq_le(as, l2t_addr +
> > > > +                                    ((icid % max_l2_entries) *
> > > > GITS_CTE_SIZE),
> > > > +                                    MEMTXATTRS_UNSPECIFIED,
> > > > res);
> > > > +           }
> > > > +       }
> > > > +    } else {
> > > > +        /* Flat level table */
> > > > +        *cte =  address_space_ldq_le(as, s->ct.base_addr +
> > > > +                                     (icid * GITS_CTE_SIZE),
> > > > +                                      MEMTXATTRS_UNSPECIFIED,
> > > > res);
> > > > +    }
> > > > +
> > > > +    if (*cte & VALID_MASK) {
> > > > +        status = true;
> > > > +    }
> > > > +
> > > > +    return status;
> > > > +}
> > > > +
> > > > +static MemTxResult update_ite(GICv3ITSState *s, uint32_t
> > > > eventid,
> > > > uint64_t dte,
> > > > +                              uint64_t itel, uint32_t iteh)
> > > why not introducing an ite struct instead of the h/l args?based
> > > on
> > > the same reason for packing individual fields within bit
> > > positions
> > > instead of using more memory to store the same fields as struct
> > > members.
> > Will create an ite struct with existing itel & iteh as members and
> > retain their bit fields processing to avoid extra params being
> > passed.
> > > > +{
> > > > +    AddressSpace *as = &s->gicv3->dma_as;
> > > > +    uint64_t itt_addr;
> > > > +    MemTxResult res = MEMTX_OK;
> > > > +
> > > > +    itt_addr = (dte >> 6ULL) & ITTADDR_MASK;
> > > > +    itt_addr <<= ITTADDR_SHIFT; /* 256 byte aligned */
> > > > +
> > > > +    address_space_stq_le(as, itt_addr + (eventid *
> > > > sizeof(uint64_t)),
> > > > +                         itel, MEMTXATTRS_UNSPECIFIED, &res);
> > > > +
> > > > +    if (res == MEMTX_OK) {
> > > > +        address_space_stl_le(as, itt_addr + ((eventid +
> > > > sizeof(uint64_t)) *
> > > > +                             sizeof(uint32_t)), iteh,
> > > > MEMTXATTRS_UNSPECIFIED,
> > > > +                             &res);
> > > > +    }
> > > > +   return res;
> > > > +}
> > > > +
> > > > +static bool get_ite(GICv3ITSState *s, uint32_t eventid,
> > > > uint64_t
> > > > dte,
> > > > +                    uint16_t *icid, uint32_t *pIntid,
> > > > MemTxResult
> > > > *res)
> > > > +{
> > > > +    AddressSpace *as = &s->gicv3->dma_as;
> > > > +    uint64_t itt_addr;
> > > > +    bool status = false;
> > > > +    uint64_t itel = 0;
> > > > +    uint32_t iteh = 0;
> > > > +
> > > > +    itt_addr = (dte >> 6ULL) & ITTADDR_MASK;
> > > > +    itt_addr <<= ITTADDR_SHIFT; /* 256 byte aligned */
> > > > +
> > > > +    itel = address_space_ldq_le(as, itt_addr + (eventid *
> > > > sizeof(uint64_t)),
> > > > +                                MEMTXATTRS_UNSPECIFIED, res);
> > > > +
> > > > +    if (*res == MEMTX_OK) {
> > > > +        iteh = address_space_ldl_le(as, itt_addr + ((eventid +
> > > > +                                    sizeof(uint64_t)) *
> > > > sizeof(uint32_t)),
> > > > +                                    MEMTXATTRS_UNSPECIFIED,
> > > > res);
> > > > +
> > > > +        if (*res == MEMTX_OK) {
> > > > +            if (itel & VALID_MASK) {
> > > > +                if ((itel >> ITE_ENTRY_INTTYPE_SHIFT) &
> > > > GITS_TYPE_PHYSICAL) {
> > > > +                    *pIntid = (itel >> ITE_ENTRY_INTID_SHIFT)
> > > > &
> > > > +                               ITE_ENTRY_INTID_MASK;
> > > > +                    *icid = iteh & ITE_ENTRY_ICID_MASK;
> > > > +                    status = true;
> > > > +                }
> > > > +            }
> > > > +        }
> > > > +    }
> > > > +    return status;
> > > > +}
> > > > +
> > > > +static uint64_t get_dte(GICv3ITSState *s, uint32_t devid,
> > > > MemTxResult *res)
> > > maybe the code would be more readable if you were returning a
> > > strcut
> > > for
> > > dte/cte instead of uint64_t. The decoding of the fields would be
> > > done
> > > here instead?
> > Both dte and cte are 8 bytes and hence chose a single uint64_t to
> > efficiently utilize the applicable bit fields in the variable
> > instead
> > of a struct(either with bitfields to match the current field
> > layouts
> > within dte/cte/ite entries or use more memory variables within the
> > struct to hold each individual dte/cte/ite fields)
> > > > +{
> > > > +    AddressSpace *as = &s->gicv3->dma_as;
> > > > +    uint64_t l2t_addr;
> > > > +    uint64_t value;
> > > > +    bool valid_l2t;
> > > > +    uint32_t l2t_id;
> > > > +    uint32_t max_l2_entries;
> > > > +
> > > > +    if (s->dt.indirect) {
> > > > +        l2t_id = devid / (s->dt.page_sz / L1TABLE_ENTRY_SIZE);
> > > > +
> > > > +        value = address_space_ldq_le(as,
> > > > +                                     s->dt.base_addr +
> > > > +                                     (l2t_id *
> > > > L1TABLE_ENTRY_SIZE),
> > > > +                                     MEMTXATTRS_UNSPECIFIED,
> > > > res);
> > > > +
> > > > +        if (*res == MEMTX_OK) {
> > > > +            valid_l2t = (value >> VALID_SHIFT) & VALID_MASK;
> > > > +
> > > > +            if (valid_l2t) {
> > > > +                max_l2_entries = s->dt.page_sz / s-
> > > > >dt.entry_sz;
> > > > +
> > > > +                l2t_addr = value & ((1ULL << 51) - 1);
> > > > +
> > > > +                value =  address_space_ldq_le(as, l2t_addr +
> > > > +                                   ((devid % max_l2_entries) *
> > > > GITS_DTE_SIZE),
> > > > +                                   MEMTXATTRS_UNSPECIFIED,
> > > > res);
> > > > +            }
> > > > +        }
> > > > +    } else {
> > > > +        /* Flat level table */
> > > > +        value = address_space_ldq_le(as, s->dt.base_addr +
> > > > +                                     (devid * GITS_DTE_SIZE),
> > > > +                                     MEMTXATTRS_UNSPECIFIED,
> > > > res);
> > > > +    }
> > > > +
> > > > +    return value;
> > > > +}
> > > I think a common helper could be defined for get_cte and get_dte.
> > was just trying to keep the code modular for getting dte and cte
> > instead of various if else's within a common helper 
> > > > +
> > > > +static MemTxResult process_int(GICv3ITSState *s, uint64_t
> > > > value,
> > > > +                               uint32_t offset, ItsCmdType
> > > > cmd)
> > > this is a bit misleanding as INT is a command. You should rename
> > > it I
> > > think. Also it is not really homogeneous with other cmds, ie. you
> > > have
> > > process_mapti, process_mapd, process_mac and all the remaining
> > > cmds
> > > are
> > > handled though this one? At least add a doc comment to explain
> > > what
> > > it does.
> > the naming of this function is along the lines of other ITS
> > commands
> > i.e process_xxx format where xxx is the actual ITS command.
> > There is no connection between handling of
> > process_mapd,process_mapc
> > with process_int.Each of them handle their respective command
> > processing independently.
> Well I am not big fan of keeping that name ;-) but well.
> > > > +{
> > > > +    AddressSpace *as = &s->gicv3->dma_as;
> > > > +    uint32_t devid, eventid;
> > > > +    MemTxResult res = MEMTX_OK;
> > > > +    bool dte_valid;
> > > > +    uint64_t dte = 0;
> > > > +    uint32_t max_eventid;
> > > > +    uint16_t icid = 0;
> > > > +    uint32_t pIntid = 0;
> > > > +    bool ite_valid = false;
> > > > +    uint64_t cte = 0;
> > > > +    bool cte_valid = false;
> > > > +    uint64_t itel = 0;
> > > > +    uint32_t iteh = 0;
> > > > +
> > > > +    if (cmd == NONE) {
> > > > +        devid = offset;
> > > > +    } else {
> > > > +        devid = (value >> DEVID_SHIFT) & DEVID_MASK;
> > > > +
> > > > +        offset += NUM_BYTES_IN_DW;
> > > > +        value = address_space_ldq_le(as, s->cq.base_addr +
> > > > offset,
> > > > +                                     MEMTXATTRS_UNSPECIFIED,
> > > > &res);
> > > > +    }
> > > > +
> > > > +    if (res != MEMTX_OK) {
> > > > +        return res;
> > > > +    }
> > > > +
> > > > +    eventid = (value & EVENTID_MASK);
> > > > +
> > > > +    dte = get_dte(s, devid, &res);
> > > > +
> > > > +    if (res != MEMTX_OK) {
> > > > +        return res;
> > > > +    }
> > > > +    dte_valid = dte & VALID_MASK;
> > > > +
> > > > +    if (dte_valid) {
> > > > +        max_eventid = (1UL << (((dte >> 1U) & SIZE_MASK) +
> > > > 1));
> > > THE DTE format is implementation defined, and the decoding is
> > > hard to
> > > follow because it is documented somewhere else.
> > The decoding of fields within each of dte,cte and ite has been
> > explained as comments in gicv3_internal.h via
> > GITS_DTE_SIZE,GITS_CTE_SIZE, ITS_ITT_ENTRY_SIZE defines
> > > > +
> > > > +        ite_valid = get_ite(s, eventid, dte, &icid, &pIntid,
> > > > &res);
> > > > +
> > > > +        if (res != MEMTX_OK) {
> > > > +            return res;
> > > > +        }
> > > > +
> > > > +        if (ite_valid) {
> > > > +            cte_valid = get_cte(s, icid, &cte, &res);
> > > > +        }
> > > > +
> > > > +        if (res != MEMTX_OK) {
> > > > +            return res;
> > > > +        }
> > > instead of having this process_int() helper, why not having a
> > > helper
> > > doing just the decoding phase, ie.
> > > get_dte -> get_ite -> get_cte and collect the relevant info and
> > > collect
> > > error and then keep the actual cmd processing in the switch?
> > As explained previously chose to keep the code modular instead of a
> > large monolothic structure with all the functionality in 1 place.
> > process_cmdq handles the command queue (and their read/write
> > offsets)
> > while the individual ITS command handling is done by respective
> > functions
> 
> OK That's not my opinion but it is not a blocker anyway ;-)
> > > > +    }
> > > > +
> > > > +    if ((devid > s->dt.max_devids) || !dte_valid || !ite_valid
> > > > ||
> > > > +            !cte_valid || (eventid > max_eventid)) {
> > > > +        qemu_log_mask(LOG_GUEST_ERROR,
> > > > +                      "%s: invalid interrupt translation table
> > > > attributes "
> > > > +                      "devid %d or eventid %d\n",
> > > > +                      __func__, devid, eventid);
> > > the msg does not necessarily match the error case. You mention
> > > ITT
> > > issue
> > > whereas the problem may come from invalid DTE, CTE, or even
> > > devid.
> > will change it to consider the missing cases
> > > > +        /*
> > > > +         * in this implementation,in case of error
> > > > +         * we ignore this command and move onto the next
> > > > +         * command in the queue
> > > > +         */
> > > so you don't return an error?
> > yes we dont,we just ignore this command and move onto next one in
> > the
> > queue
> > > > +    } else {
> > > > +        /*
> > > > +         * Current implementation only supports rdbase ==
> > > > procnum
> > > > +         * Hence rdbase physical address is ignored
> > > > +         */
> > > > +        if (cmd == DISCARD) {
> > > > +            /* remove mapping from interrupt translation table
> > > > */
> > > > +            res = update_ite(s, eventid, dte, itel, iteh);
> > > iteh and itel always are 0, why not use a struct ite with valid
> > > field
> > > unset.
> > based on the same reason for packing individual fields within bit
> > positions instead of using more memory to store the same fields as
> > struct members.
> > I could however create an ite struct with existing itel & iteh as
> > members and retain their bit fields processing. 
> > > > +        }
> > > > +    }
> > > > +
> > > > +    return res;
> > > > +}
> > > > +
> > > > +static MemTxResult process_mapti(GICv3ITSState *s, uint64_t
> > > > value,
> > > > +                                 uint32_t offset, bool
> > > > ignore_pInt)
> > > > +{
> > > > +    AddressSpace *as = &s->gicv3->dma_as;
> > > > +    uint32_t devid, eventid;
> > > > +    uint32_t pIntid = 0;
> > > > +    uint32_t max_eventid, max_Intid;
> > > > +    bool dte_valid;
> > > > +    MemTxResult res = MEMTX_OK;
> > > > +    uint16_t icid = 0;
> > > > +    uint64_t dte = 0;
> > > > +    uint64_t itel = 0;
> > > > +    uint32_t iteh = 0;
> > > > +    uint32_t int_spurious = INTID_SPURIOUS;
> > > > +
> > > > +    devid = (value >> DEVID_SHIFT) & DEVID_MASK;
> > > > +    offset += NUM_BYTES_IN_DW;
> > > > +    value = address_space_ldq_le(as, s->cq.base_addr + offset,
> > > > +                                 MEMTXATTRS_UNSPECIFIED,
> > > > &res);
> > > > +
> > > > +    if (res != MEMTX_OK) {
> > > > +        return res;
> > > > +    }
> > > > +
> > > > +    eventid = (value & EVENTID_MASK);
> > > > +
> > > > +    if (!ignore_pInt) {
> > > > +        pIntid = (value >> pINTID_OFFSET) & pINTID_MASK;
> > > > +    }
> > > > +
> > > > +    offset += NUM_BYTES_IN_DW;
> > > > +    value = address_space_ldq_le(as, s->cq.base_addr + offset,
> > > > +                                 MEMTXATTRS_UNSPECIFIED,
> > > > &res);
> > > > +
> > > > +    if (res != MEMTX_OK) {
> > > > +        return res;
> > > > +    }
> > > > +
> > > > +    icid = value & ICID_MASK;
> > > > +
> > > > +    dte = get_dte(s, devid, &res);
> > > > +
> > > > +    if (res != MEMTX_OK) {
> > > > +        return res;
> > > > +    }
> > > > +    dte_valid = dte & VALID_MASK;
> > > > +
> > > > +    max_eventid = (1UL << (((dte >> 1U) & SIZE_MASK) + 1));
> > > Again I think you would gain in readibility if get_cte were to
> > > return
> > > a
> > > struct and you would avoid code duplication.
> > Like mentioned earlier, preferred to use a single uint64_t for cte
> > (and
> > dte) instead of a struct (either with bitfields to match the
> > current
> > field layouts within dte/cte/ite entries or use more memory
> > variables
> > within the struct to hold each individual dte/cte/ite fields).The
> > layout of all these functions follows the pseudocde format defined
> > under each ITS command in the spec.
> > > > +
> > > > +    if (!ignore_pInt) {
> > > > +        max_Intid = (1UL << (FIELD_EX64(s->typer, GITS_TYPER,
> > > > IDBITS) + 1));
> > > > +    }
> > > > +
> > > > +    if ((devid > s->dt.max_devids) || (icid > s-
> > > > >ct.max_collids)
> > > > +            !dte_valid || (eventid > max_eventid) ||
> > > > +            (!ignore_pInt && ((pIntid < GICV3_LPI_INTID_START)
> > > > ||
> > > > +               (pIntid > max_Intid)))) {
> > > > +        qemu_log_mask(LOG_GUEST_ERROR,
> > > > +                      "%s: invalid interrupt translation table
> > > > attributes "
> > > > +                      "devid %d or icid %d or eventid %d or
> > > > pIntid
> > > > %d\n",
> > > > +                      __func__, devid, icid, eventid, pIntid);
> > > > +        /*
> > > > +         * in this implementation,in case of error
> > > > +         * we ignore this command and move onto the next
> > > > +         * command in the queue
> > > > +         */
> > > > +    } else {
> > > > +        /* add ite entry to interrupt translation table */
> > > > +        itel = (dte_valid & VALID_MASK) | (GITS_TYPE_PHYSICAL
> > > > <<
> > > > +                                           ITE_ENTRY_INTTYPE_S
> > > > HIFT
> > > > );
> > > > +
> > > > +        if (ignore_pInt) {
> > > > +            itel |= (eventid << ITE_ENTRY_INTID_SHIFT);
> > > > +        } else {
> > > > +            itel |= (pIntid << ITE_ENTRY_INTID_SHIFT);
> > > > +        }
> > > > +        itel |= (int_spurious << ITE_ENTRY_INTSP_SHIFT);
> > > > +        iteh |= icid;
> > > > +
> > > > +        res = update_ite(s, eventid, dte, itel, iteh);
> > > > +    }
> > > > +
> > > > +    return res;
> > > > +}
> > > > +
> > > >  static MemTxResult update_cte(GICv3ITSState *s, uint16_t icid,
> > > > bool valid,
> > > >                                uint64_t rdbase)
> > > >  {
> > > > @@ -295,8 +611,10 @@ static void process_cmdq(GICv3ITSState *s)
> > > >  
> > > >          switch (cmd) {
> > > >          case GITS_CMD_INT:
> > > > +            res = process_int(s, data, cq_offset, INT);
> > > >              break;
> > > >          case GITS_CMD_CLEAR:
> > > > +            res = process_int(s, data, cq_offset, CLEAR);
> > > >              break;
> > > >          case GITS_CMD_SYNC:
> > > >              /*
> > > > @@ -313,10 +631,13 @@ static void process_cmdq(GICv3ITSState
> > > > *s)
> > > >              res = process_mapc(s, cq_offset);
> > > >              break;
> > > >          case GITS_CMD_MAPTI:
> > > > +            res = process_mapti(s, data, cq_offset, false);
> > > >              break;
> > > >          case GITS_CMD_MAPI:
> > > > +            res = process_mapti(s, data, cq_offset, true);
> > > >              break;
> > > >          case GITS_CMD_DISCARD:
> > > > +            res = process_int(s, data, cq_offset, DISCARD);
> > > >              break;
> > > >          default:
> > > >              break;
> > > > @@ -472,7 +793,20 @@ static MemTxResult
> > > > gicv3_its_translation_write(void *opaque, hwaddr offset,
> > > >                                                 uint64_t data,
> > > > unsigned size,
> > > >                                                 MemTxAttrs
> > > > attrs)
> > > >  {
> > > > +    GICv3ITSState *s = (GICv3ITSState *)opaque;
> > > >      MemTxResult result = MEMTX_OK;
> > > > +    uint32_t devid = 0;
> > > > +
> > > > +    switch (offset) {
> > > > +    case GITS_TRANSLATER:
> > > > +        if (s->ctlr & ITS_CTLR_ENABLED) {
> > > > +            devid = attrs.requester_id;
> > > > +            result = process_int(s, data, devid, NONE);
> > > > +        }
> > > > +        break;
> > > > +    default:
> > > > +        break;
> > > > +    }
> > > >  
> > > >      return result;
> > > >  }
> > > > diff --git a/hw/intc/gicv3_internal.h
> > > > b/hw/intc/gicv3_internal.h
> > > > index 0932a30560..ce45cd0ef6 100644
> > > > --- a/hw/intc/gicv3_internal.h
> > > > +++ b/hw/intc/gicv3_internal.h
> > > > @@ -324,6 +324,13 @@ FIELD(MAPC, RDBASE, 16, 32)
> > > >  #define ITTADDR_MASK              ((1ULL << ITTADDR_LENGTH) -
> > > > 1)
> > > >  #define SIZE_MASK                 0x1f
> > > >  
> > > > +/* MAPI command fields */
> > > > +#define EVENTID_MASK              ((1ULL << 32) - 1)
> > > > +
> > > > +/* MAPTI command fields */
> > > > +#define pINTID_OFFSET              32
> > > > +#define pINTID_MASK               ((1ULL << 32) - 1)
> > > > +
> > > >  #define VALID_SHIFT               63
> > > >  #define VALID_MASK                1ULL
> > > >  
> > > > @@ -344,6 +351,11 @@ FIELD(MAPC, RDBASE, 16, 32)
> > > >   * vPEID = 16 bits
> > > >   */
> > > >  #define ITS_ITT_ENTRY_SIZE            0xC
> > > > +#define ITE_ENTRY_INTTYPE_SHIFT        1
> > > > +#define ITE_ENTRY_INTID_SHIFT          2
> > > > +#define ITE_ENTRY_INTID_MASK         ((1ULL << 24) - 1)
> > > > +#define ITE_ENTRY_INTSP_SHIFT          26
> > > > +#define ITE_ENTRY_ICID_MASK          ((1ULL << 16) - 1)
> > > >  
> > > >  /* 16 bits EventId */
> > > >  #define ITS_IDBITS                   GICD_TYPER_IDBITS
> > > > diff --git a/include/hw/intc/arm_gicv3_common.h
> > > > b/include/hw/intc/arm_gicv3_common.h
> > > > index 1fd5cedbbd..0715b0bc2a 100644
> > > > --- a/include/hw/intc/arm_gicv3_common.h
> > > > +++ b/include/hw/intc/arm_gicv3_common.h
> > > > @@ -36,6 +36,8 @@
> > > >  #define GICV3_MAXIRQ 1020
> > > >  #define GICV3_MAXSPI (GICV3_MAXIRQ - GIC_INTERNAL)
> > > >  
> > > > +#define GICV3_LPI_INTID_START 8192
> > > > +
> > > >  #define GICV3_REDIST_SIZE 0x20000
> > > >  
> > > >  /* Number of SGI target-list bits */
> > > > 
> > > Thanks
> > > 
> > > Eric
> > > 
> Thanks
> 
> Eric
> 


