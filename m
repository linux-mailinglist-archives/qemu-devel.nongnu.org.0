Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B698D4730EB
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 16:52:16 +0100 (CET)
Received: from localhost ([::1]:48910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwncd-0008Vz-Sx
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 10:52:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mwnZA-00053R-2v
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 10:48:40 -0500
Received: from [2a00:1450:4864:20::335] (port=53878
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mwnZ5-00039Z-6r
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 10:48:39 -0500
Received: by mail-wm1-x335.google.com with SMTP id y196so12234420wmc.3
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 07:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uFOb//suq8hHcDGeC6dx/+f14Nrn5k+ZlOf6eBQBe9A=;
 b=QdpNZM2+WZ7/yY6cjeqj7U1LGMD//Y0OCA/z/DDkrYN7oSUKL6pbatgAZELKPLTUWE
 aygdU667YCpxB+4c11TOX5W0gO/AANtIw1crA8NQFvJT9G1xVNDIDmBC2fpJdEytYVre
 KU9+2IOw/LQh6q8gvswqZc7NDEExuwUXOUgQEbYGE7c+2F3dEQ06s4ErdEy4KhA/oISQ
 fhEeNkWCSEGNu23TEYAFPsrxnwr19XwdplhZLm2e5ec3jS2Mz+C0A2zhCq3vqU5x5l6E
 ryIm8uMsOVZPaWy05Yu+2xsgrJ9obutXaysfGmGTc9bu9YzaUXStIX8/e21sYR5ci7Ws
 UksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uFOb//suq8hHcDGeC6dx/+f14Nrn5k+ZlOf6eBQBe9A=;
 b=e1dOq67+veNkw0sSrySijuaNGy3ydMyNTSztRKRT1qJohsNmiN1o2T+r+sMgWPcKve
 ykDe8mbTX2z5JnsNLq0gU1z6r0uHMf9lwGcldYbDBth4lvMnEXtn9pPS/w/J+SpWbqp3
 FZLcchCRMDB7KoJPex3p4Lv+/RrIAMZxJvJ62uw9PXkHO2z3uX5X9Flnczgdp2pTDdFX
 4l6CSCeGadgVbqOpYc5plZbrYkGZlvqkWW33a2gj/BackZkIAeGARcgQjcKdf5HrA/5K
 f4dWIcyz5y5yYx0vVSEMp04Gj2EhqbDkg/k+13eYRRIyYn6vzdLDQ8ZjORs1wi8MSPrA
 V1Yw==
X-Gm-Message-State: AOAM530GlgC2DYr8vFhTKHsBocNehY/dF71VbTv20ExblMcDLwLpX5WR
 4oQQcn2a71iMlMmuscUeU+BfRbLJbr1QXE2L5Nt9Ng==
X-Google-Smtp-Source: ABdhPJyQhYraBNEbXwyoqWuNNSb/sJX2mMwlPVxM4jcDcQXnQimGa5WCNIN9JB6bU3J0TLoLt/PKmZij6Is4ugX8450=
X-Received: by 2002:a05:600c:3486:: with SMTP id
 a6mr38114473wmq.32.1639410513243; 
 Mon, 13 Dec 2021 07:48:33 -0800 (PST)
MIME-Version: 1.0
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-27-peter.maydell@linaro.org>
 <871r2gk0sq.fsf@linaro.org>
In-Reply-To: <871r2gk0sq.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Dec 2021 15:48:21 +0000
Message-ID: <CAFEAcA8bbi1s-fNv73ZGy9KYPaoM2WjZFW=hF0+ZcRsY7Nvf9w@mail.gmail.com>
Subject: Re: [PATCH 26/26] hw/intc/arm_gicv3_its: Factor out "find address of
 table entry" code
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 13 Dec 2021 at 15:00, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > The ITS has several tables which all share a similar format,
> > described by the TableDesc struct: the guest may configure them
> > to be a single-level table or a two-level table. Currently we
> > open-code the process of finding the table entry in all the
> > functions which read or write the device table or the collection
> > table. Factor out the "get the address of the table entry"
> > logic into a new function, so that the code which needs to
> > read or write a table entry only needs to call table_entry_addr()
> > and then perform a suitable load or store to that address.
> >
> > Note that the error handling is slightly complicated because
> > we want to handle two cases differently:
> >  * failure to read the L1 table entry should end up causing
> >    a command stall, like other kinds of DMA error
> >  * an L1 table entry that says there is no L2 table for this
> >    index (ie whose valid bit is 0) must result in us treating
> >    the table entry as not-valid on read, and discarding
> >    writes (this is mandated by the spec)
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > This is a worthwhile refactoring on its own, but still more
> > so given that GICv4 adds another table in this format.
> > ---
> >  hw/intc/arm_gicv3_its.c | 212 +++++++++++++---------------------------
> >  1 file changed, 70 insertions(+), 142 deletions(-)
> >
> > diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> > index 3bcc4c3db85..90a9fd3b3d4 100644
> > --- a/hw/intc/arm_gicv3_its.c
> > +++ b/hw/intc/arm_gicv3_its.c
> > @@ -83,44 +83,62 @@ static uint64_t baser_base_addr(uint64_t value, uin=
t32_t page_sz)
> >      return result;
> >  }
> >
> > +static uint64_t table_entry_addr(GICv3ITSState *s, TableDesc *td,
> > +                                 uint32_t idx, MemTxResult *res)
> > +{
>
> It seems odd to have a uint64_t return type when....
>
> > +    /*
> > +     * Given a TableDesc describing one of the ITS in-guest-memory
> > +     * tables and an index into it, return the guest address
> > +     * corresponding to that table entry.
> > +     * If there was a memory error reading the L1 table of an
> > +     * indirect table, *res is set accordingly, and we return -1.
> > +     * If the L1 table entry is marked not valid, we return -1 with
> > +     * *res set to MEMTX_OK.
> > +     *
> > +     * The specification defines the format of level 1 entries of a
> > +     * 2-level table, but the format of level 2 entries and the format
> > +     * of flat-mapped tables is IMPDEF.
> > +     */
> > +    AddressSpace *as =3D &s->gicv3->dma_as;
> > +    uint32_t l2idx;
> > +    uint64_t l2;
> > +    uint32_t num_l2_entries;
> > +
> > +    *res =3D MEMTX_OK;
> > +
> > +    if (!td->indirect) {
> > +        /* Single level table */
> > +        return td->base_addr + idx * td->entry_sz;
> > +    }
> > +
> > +    /* Two level table */
> > +    l2idx =3D idx / (td->page_sz / L1TABLE_ENTRY_SIZE);
> > +
> > +    l2 =3D address_space_ldq_le(as,
> > +                              td->base_addr + (l2idx * L1TABLE_ENTRY_S=
IZE),
> > +                              MEMTXATTRS_UNSPECIFIED, res);
> > +    if (*res !=3D MEMTX_OK) {
> > +        return -1;
> > +    }
> > +    if (!(l2 & L2_TABLE_VALID_MASK)) {
> > +        return -1;
> > +    }
>
> We can return signed results. I guess implicit conversion takes care of
> it but I wonder if it would be cleaner to return an int (or maybe
> compare against UNINT64_MAX =3D=3D INVALID_TABLE_ENTRY)?

-1 is only there to be a "definitely not a valid address" value,
and it's less typing than UINT64_MAX.

-- PMM

