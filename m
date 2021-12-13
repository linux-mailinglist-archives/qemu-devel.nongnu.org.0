Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CC6473010
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 16:05:46 +0100 (CET)
Received: from localhost ([::1]:58190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwmtd-0007DF-7O
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 10:05:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mwmoF-00005r-P6
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 10:00:11 -0500
Received: from [2a00:1450:4864:20::431] (port=37545
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mwmoC-0002b2-NE
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 10:00:11 -0500
Received: by mail-wr1-x431.google.com with SMTP id d9so27568926wrw.4
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 07:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=9Sk2SEed8i5Y84SlzdYdLUNzpGg6Jf5LsfmLli9Gpus=;
 b=ma5DNh4dzD0L2PAursM68VOow5WZisj6F+jGiiW46r243BubqruDNyMGSz4KlFuZtZ
 XuuYVqSMWmVDmjgoRg8jhMASrG+uS03zf8Addrc1WRefLg+ZHzOBor9oOkj5ftmml9XG
 O+2g6mS8/e5cDE0m688WJbO+/YGj5qDUxiCOJReNiNv6joXJYo2QxYavf5J/0AzcdbWg
 sUuGQVarMrGHh5YCvneAw6/3hAtF03O1DB39o8DvNKy8u7aYphhkwytPKTg3jHMxw5zX
 o+e1nSsB5YzlhGbRnjlpHa5SH/8zpnIksm0DhbERSDejj6lukahPCrAD+C+UfnU/CmaS
 6pXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=9Sk2SEed8i5Y84SlzdYdLUNzpGg6Jf5LsfmLli9Gpus=;
 b=DQKk1n8KLKOa8BBX5WqSbiW4fwcSihKlKIY9XcXxKHGN6l7uOYUqMXuboDshKW+x9f
 RjekR5oYcqV8BPwuDCGZZZA6TnP9uz0gvgBIwCzEBCsBB89PNK9M65XtImGtBSz6VUAC
 jQeRNQnHi13Ta1+vB3DXPs5FSWtql7d3YA07oB8Nuvw7/ZhS5LhD4EwtuRr8QibxteK/
 DuRGALYpK9AgZ0i86ITPrI2OMenR3tCWBWbtzATBLKMogsMaqURp7FMPuRcWFWyco5Dc
 pbjcjAd7EwuVp7j0I15v3ZhBRh64GSDAq58P0AhzNgd+MMigd2+3W8BQmOoT7CJ0DbhL
 jT/Q==
X-Gm-Message-State: AOAM532HlfAY0ZigW5/vmBfLXp4go+Wt0vw6tEO69KPHAeNAbRI2+V5G
 dMX4S6+fDTllbjZch1EtyHG58w==
X-Google-Smtp-Source: ABdhPJz++RT2SH9GO9wztuDJTAmJj0NFFuN/KPNw/ycizW9rWv31oCIPoAQOop7ycrQ4I00ScQimPw==
X-Received: by 2002:adf:e90d:: with SMTP id f13mr18069829wrm.685.1639407606876; 
 Mon, 13 Dec 2021 07:00:06 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j40sm7570431wms.16.2021.12.13.07.00.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 07:00:06 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7F9AB1FF96;
 Mon, 13 Dec 2021 15:00:05 +0000 (GMT)
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-27-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 26/26] hw/intc/arm_gicv3_its: Factor out "find address
 of table entry" code
Date: Mon, 13 Dec 2021 14:53:26 +0000
In-reply-to: <20211211191135.1764649-27-peter.maydell@linaro.org>
Message-ID: <871r2gk0sq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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


Peter Maydell <peter.maydell@linaro.org> writes:

> The ITS has several tables which all share a similar format,
> described by the TableDesc struct: the guest may configure them
> to be a single-level table or a two-level table. Currently we
> open-code the process of finding the table entry in all the
> functions which read or write the device table or the collection
> table. Factor out the "get the address of the table entry"
> logic into a new function, so that the code which needs to
> read or write a table entry only needs to call table_entry_addr()
> and then perform a suitable load or store to that address.
>
> Note that the error handling is slightly complicated because
> we want to handle two cases differently:
>  * failure to read the L1 table entry should end up causing
>    a command stall, like other kinds of DMA error
>  * an L1 table entry that says there is no L2 table for this
>    index (ie whose valid bit is 0) must result in us treating
>    the table entry as not-valid on read, and discarding
>    writes (this is mandated by the spec)
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This is a worthwhile refactoring on its own, but still more
> so given that GICv4 adds another table in this format.
> ---
>  hw/intc/arm_gicv3_its.c | 212 +++++++++++++---------------------------
>  1 file changed, 70 insertions(+), 142 deletions(-)
>
> diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> index 3bcc4c3db85..90a9fd3b3d4 100644
> --- a/hw/intc/arm_gicv3_its.c
> +++ b/hw/intc/arm_gicv3_its.c
> @@ -83,44 +83,62 @@ static uint64_t baser_base_addr(uint64_t value, uint3=
2_t page_sz)
>      return result;
>  }
>=20=20
> +static uint64_t table_entry_addr(GICv3ITSState *s, TableDesc *td,
> +                                 uint32_t idx, MemTxResult *res)
> +{

It seems odd to have a uint64_t return type when....

> +    /*
> +     * Given a TableDesc describing one of the ITS in-guest-memory
> +     * tables and an index into it, return the guest address
> +     * corresponding to that table entry.
> +     * If there was a memory error reading the L1 table of an
> +     * indirect table, *res is set accordingly, and we return -1.
> +     * If the L1 table entry is marked not valid, we return -1 with
> +     * *res set to MEMTX_OK.
> +     *
> +     * The specification defines the format of level 1 entries of a
> +     * 2-level table, but the format of level 2 entries and the format
> +     * of flat-mapped tables is IMPDEF.
> +     */
> +    AddressSpace *as =3D &s->gicv3->dma_as;
> +    uint32_t l2idx;
> +    uint64_t l2;
> +    uint32_t num_l2_entries;
> +
> +    *res =3D MEMTX_OK;
> +
> +    if (!td->indirect) {
> +        /* Single level table */
> +        return td->base_addr + idx * td->entry_sz;
> +    }
> +
> +    /* Two level table */
> +    l2idx =3D idx / (td->page_sz / L1TABLE_ENTRY_SIZE);
> +
> +    l2 =3D address_space_ldq_le(as,
> +                              td->base_addr + (l2idx * L1TABLE_ENTRY_SIZ=
E),
> +                              MEMTXATTRS_UNSPECIFIED, res);
> +    if (*res !=3D MEMTX_OK) {
> +        return -1;
> +    }
> +    if (!(l2 & L2_TABLE_VALID_MASK)) {
> +        return -1;
> +    }

We can return signed results. I guess implicit conversion takes care of
it but I wonder if it would be cleaner to return an int (or maybe
compare against UNINT64_MAX =3D=3D INVALID_TABLE_ENTRY)?

--=20
Alex Benn=C3=A9e

