Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFC63BC50F
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 05:27:08 +0200 (CEST)
Received: from localhost ([::1]:40250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0bjk-00073k-JA
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 23:27:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1m0biS-000630-OH
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 23:25:44 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:41858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1m0biO-0006kQ-Sg
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 23:25:44 -0400
Received: by mail-qk1-x72f.google.com with SMTP id j13so18867477qka.8
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 20:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L8csNEbaAbN2g85baGbp+j9Q5WZrEJZa+yolt7ZGMrk=;
 b=jpdfp1ZJkuWuDhryii2vhbclw5pUUAqLSW0mQ0xMrhkzvT6mzeykgLpkQaGzJWPb4R
 kVq8slFR1tzoeM3aG7KvGsr+bHiEnRTEPMbW6ES++e/gEV2bM6xJy1ABE1DPI8XiUUPG
 xJZN3pUzXYWfRXUgjvN/bUABSZbHdBBcI9RZPLMR/+EoBqFLgohmJSzh9puTPXyub/gW
 s/tVyTwek/xqjy5bb+djMORbEZw/ZWb0iDwZQ3/1Ae14vnCNc4zh1W9QDMjfU86Do83j
 PABSAh6cfyRddBpqX31ZVde/hOmfHRimVfZwOtm6WpJY9X7d77Nlwz8gMRMEx/00oqT+
 nTKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L8csNEbaAbN2g85baGbp+j9Q5WZrEJZa+yolt7ZGMrk=;
 b=JR83S7zZTRfmdmRHc7sVdHgqY96TvWDUNAtpVQEys9LNHm1WubZyLibdHX7bhRSYyw
 lipwN/g/DGq9cnDyi2tuO2z7bRd19H7yotS7c9XzykmmNSCQo49HnikN9LnS3HQVNhmS
 y+0MJECjCsmWJsPL7Q2NTxssveu4hT3/RgAlC576p63z2GhqAeFNGE6hmENs75oHvAJy
 Anf7Kqu/y1PQP0PKbI/Qi8pMCF7BYhpMi6vw/0DpQYgsBlZYmhrBeULtILu/NG+yYH25
 hN72vguxWwK8dXldsC4jIHgS9TZI5NYFJAn/U05rhzbVacYGgYlp/c17cM8+2jYL9cvX
 RiJw==
X-Gm-Message-State: AOAM5326hVVL/FWQkpgVjCskIPTOCPF1otRuh9sPn18ADTy0zoRLWQKD
 4/hTmZ+AVWyU4i13jK3kTY7V+A==
X-Google-Smtp-Source: ABdhPJwJp28KdzngvWzgOR0Yy6jrf4eyQ/MObEwTfLtdGYZZvEREClRAP/xIomQ6sbkPoP9tgFcuag==
X-Received: by 2002:a05:620a:e04:: with SMTP id
 y4mr17980915qkm.196.1625541939683; 
 Mon, 05 Jul 2021 20:25:39 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.gmail.com with ESMTPSA id t7sm4118909qkm.23.2021.07.05.20.25.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 20:25:39 -0700 (PDT)
Message-ID: <287eb50c0b99a3daec986ec29ede33cb2bdfd025.camel@linaro.org>
Subject: Re: [PATCH v5 04/10] hw/intc: GICv3 ITS Command processing
From: shashi.mallela@linaro.org
To: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 05 Jul 2021 23:25:38 -0400
In-Reply-To: <bbb32d79ed60fb90128b3662ec925f60ca258e8a.camel@linaro.org>
References: <20210630153156.9421-1-shashi.mallela@linaro.org>
 <20210630153156.9421-5-shashi.mallela@linaro.org>
 <CAFEAcA-ZeKEMTp5X0VWXu+hip9ryzQLTLNwd_bsKQybyT_k7CQ@mail.gmail.com>
 <bbb32d79ed60fb90128b3662ec925f60ca258e8a.camel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x72f.google.com
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2021-07-05 at 20:47 -0400, shashi.mallela@linaro.org wrote:
> On Mon, 2021-07-05 at 15:54 +0100, Peter Maydell wrote:
> > On Wed, 30 Jun 2021 at 16:32, Shashi Mallela <
> > shashi.mallela@linaro.org> wrote:
> > > Added ITS command queue handling for MAPTI,MAPI commands,handled
> > > ITS
> > > translation which triggers an LPI via INT command as well as
> > > write
> > > to GITS_TRANSLATER register,defined enum to differentiate between
> > > ITS
> > > command interrupt trigger and GITS_TRANSLATER based interrupt
> > > trigger.
> > > Each of these commands make use of other functionalities
> > > implemented to
> > > get device table entry,collection table entry or interrupt
> > > translation
> > > table entry required for their processing.
> > > 
> > > Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> > > ---
> > > +static MemTxResult process_mapti(GICv3ITSState *s, uint64_t
> > > value,
> > > +                                 uint32_t offset, bool
> > > ignore_pInt)
> > > +{
> > > +    AddressSpace *as = &s->gicv3->dma_as;
> > > +    uint32_t devid, eventid;
> > > +    uint32_t pIntid = 0;
> > > +    uint32_t max_eventid, max_Intid;
> > > +    bool dte_valid;
> > > +    MemTxResult res = MEMTX_OK;
> > > +    uint16_t icid = 0;
> > > +    uint64_t dte = 0;
> > > +    IteEntry ite;
> > > +    uint32_t int_spurious = INTID_SPURIOUS;
> > > +    uint64_t idbits;
> > > +
> > > +    devid = ((value & DEVID_MASK) >> DEVID_SHIFT);
> > > +    offset += NUM_BYTES_IN_DW;
> > > +    value = address_space_ldq_le(as, s->cq.base_addr + offset,
> > > +                                 MEMTXATTRS_UNSPECIFIED, &res);
> > > +
> > > +    if (res != MEMTX_OK) {
> > > +        return res;
> > > +    }
> > > +
> > > +    eventid = (value & EVENTID_MASK);
> > > +
> > > +    if (!ignore_pInt) {
> > > +        pIntid = ((value & pINTID_MASK) >> pINTID_SHIFT);
> > > +    }
> > > +
> > > +    offset += NUM_BYTES_IN_DW;
> > > +    value = address_space_ldq_le(as, s->cq.base_addr + offset,
> > > +                                 MEMTXATTRS_UNSPECIFIED, &res);
> > > +
> > > +    if (res != MEMTX_OK) {
> > > +        return res;
> > > +    }
> > > +
> > > +    icid = value & ICID_MASK;
> > > +
> > > +    dte = get_dte(s, devid, &res);
> > > +
> > > +    if (res != MEMTX_OK) {
> > > +        return res;
> > > +    }
> > > +    dte_valid = dte & TABLE_ENTRY_VALID_MASK;
> > > +
> > > +    max_eventid = (1UL << (((dte >> 1U) & SIZE_MASK) + 1));
> > > +
> > > +    if (!ignore_pInt) {
> > > +        idbits = MIN(FIELD_EX64(s->gicv3->cpu->gicr_propbaser,
> > > GICR_PROPBASER,
> > > +                                IDBITS), GICD_TYPER_IDBITS);
> > 
> > I missed this the first time around, but I don't think this is
> > right.
> > Different CPUs could have different GICR_PROPBASER values, so
> > checking
> > against just one of them is wrong. The pseudocode only tests
> > LPIOutOfRange()
> > which is documented as testing "larger than GICD_TYPER.IDbits or
> > not
> > in
> > the LPI range and not 1023". So I don't think we should be looking
> > at the GICR_PROPBASER field here.
> > 
> > More generally, "s->gicv3->cpu->something" is usually going to be
> > wrong, because it is implicitly looking at CPU 0; often either
> > there
> > should be something else telling is which CPU to use (as in
> > &s->gicv3->cpu[rdbase] where the CTE told us which redistributor),
> > or we might need to operate on all CPUs/redistributors. The only
> > exception is where we can guarantee that all the CPUs are the same
> > (eg when looking at GICR_TYPER.PLPIS.)
> In that case,the validation of IDBITS(in case of ITS enabled) could
> be
> done during the write of gicr_propbaser register value itself(in
> arm_gicv3_redist.c) and the its command processing code here can just
> extract the idbits for its use.
> > thanks
> > -- PMM
Hi Peter

Please ignore my last comment.

To address this scenario,i think the feasible option would be to call
get_cte() to get the rdbase corresponding to icid value passed to mapti
command.Since each icid is mapped to a rdbase(by virtue of calling MAPC
command),if the collection table has a valid mapping for this icid we
continue processing this MAPTI command using &s->gicv3->cpu[rdbase]
applicable propbaser value to validate idbits, else return without
further processing.

Thanks
Shashi  


