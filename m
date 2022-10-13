Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4B35FD990
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 14:51:14 +0200 (CEST)
Received: from localhost ([::1]:46350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oixg9-0005C9-DG
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 08:51:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gourry.memverge@gmail.com>)
 id 1oixQo-0000Kv-6N
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:35:22 -0400
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844]:40675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gourry.memverge@gmail.com>)
 id 1oixQk-0003Tr-GG
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:35:21 -0400
Received: by mail-qt1-x844.google.com with SMTP id h24so527451qta.7
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 05:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gozgW6W4zcxbp7BYJvo59EouJU4f/yerB3KkmxDpsx8=;
 b=FJA5ppSNG4xaKAGyTpVrxLWoJIhWpSU6tM9oxiik7uNlpHe5FG1ikbISzXmssLzm81
 g1WuGn4QUV2q8vJg/KuajCCSzVmdXNr5fKgwJT3RP+8Ev72c+RxeW3QMXDFUSRW27gSA
 9qX5qK05fAwMWAONsvwry2zkGjc8qS7ETsXB3Fl4aY5p/3rQTBiGrNgAOKeENehJEHPm
 pwglM1W0wT+N383LmFJRxI6/rIxweDWR3mWjS4aIofiv2IqmCaVeJKnOePTEaNDL9yw3
 7AbJogT3eQKV12vKzXW5UYpUNYWRGT0X8bIDMhd3bGpaDLZk0V5xkaBzVzPbEKHQVvmB
 zRbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gozgW6W4zcxbp7BYJvo59EouJU4f/yerB3KkmxDpsx8=;
 b=uzc0NGXHoN1teYzgNONUJeKVSTgGwC0KS+6vHpTxx6aKTwYSYrJhBkKb0guBns+gQt
 +IcetYN8cOw2qDYsPzNNjB2SRcUc+3TFUdprRB2UsTNOs08+6OpDe3hppTzf0s4BgUg4
 kRE8do1ASrPZXqVZep7xV6LE4rpQLzVqvjtHkdiHNMVqUnnebJXowrTp2pJVg65vn26D
 dcvaUyOZh7ix4gZzwu85B4UjE/7Zt22LJH2w765rJ/fE1OhP8poWYT7tXsjJ2OP7hS+0
 8e3ZloVPsmVrV2lK+aq1qZaFJHTtcE54QyelPb0e2FwM3spiwuFBXKFo6Vrgm+r1ZXsb
 4cyw==
X-Gm-Message-State: ACrzQf0H8Z7cTzORfFJiaCvFqugGHYW5+CjJ3EWLnKFGghK+yaOZuV9T
 CESTW04rDF8IX2IWTlwuyQ==
X-Google-Smtp-Source: AMsMyM5T5X4/5hiCtyI5IbuIYTXINSAus/WICqfXG2JFz0CTadvo+fatND4Ka7rXWscCJRxUcsIdjg==
X-Received: by 2002:a05:622a:18b:b0:35d:5ba6:ef55 with SMTP id
 s11-20020a05622a018b00b0035d5ba6ef55mr26772763qtw.603.1665664515311; 
 Thu, 13 Oct 2022 05:35:15 -0700 (PDT)
Received: from fedora (pool-173-79-56-208.washdc.fios.verizon.net.
 [173.79.56.208]) by smtp.gmail.com with ESMTPSA id
 y11-20020ac8128b000000b0039a275607c3sm8575516qti.55.2022.10.13.05.35.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 05:35:14 -0700 (PDT)
Date: Thu, 13 Oct 2022 08:35:13 -0400
From: Gregory Price <gourry.memverge@gmail.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-devel@nongnu.org, linux-cxl@vger.kernel.org,
 Alison Schofield <alison.schofield@intel.com>,
 Davidlohr Bueso <dave@stgolabs.net>, a.manzanares@samsung.com,
 Ben Widawsky <bwidawsk@kernel.org>,
 Gregory Price <gregory.price@memverge.com>, mst@redhat.com,
 hchkuo@avery-design.com.tw, cbrowy@avery-design.com, ira.weiny@intel.com
Subject: Re: [PATCH v7 4/5] hw/mem/cxl-type3: Add CXL CDAT Data Object Exchange
Message-ID: <Y0gGAW6eRPuv1Y3b@fedora>
References: <20221007152156.24883-5-Jonathan.Cameron@huawei.com>
 <20221012182120.174142-1-gregory.price@memverge.com>
 <20221013095749.0000052d@huawei.com>
 <CAD3UvdRYH2NVck-kLYLQcBym-5TY0WXWj7vCzcRi5yEuVfgzcQ@mail.gmail.com>
 <20221013125313.00007016@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221013125313.00007016@huawei.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::844;
 envelope-from=gourry.memverge@gmail.com; helo=mail-qt1-x844.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


fwiw this is what my function looked like after the prior changes, very
similar to yours proposed below

static int ct3_build_cdat_table(CDATSubHeader ***cdat_table,
                                void *priv)
{
    CXLType3Dev *ct3d = priv;
    MemoryRegion *vmr = NULL, *pmr = NULL;
    uint64_t dpa_base = 0;
    int dsmad_handle = 0;
    int num_ents = 0;
    int cur_ent = 0;
    int ret = 0;

    if (ct3d->hostvmem) {
        vmr = host_memory_backend_get_memory(ct3d->hostvmem);
        if (!vmr)
            return -EINVAL;
        num_ents += CT3_CDAT_SUBTABLE_SIZE;
    }
    if (ct3d->hostpmem) {
        pmr = host_memory_backend_get_memory(ct3d->hostpmem);
        if (!pmr)
            return -EINVAL;
        num_ents += CT3_CDAT_SUBTABLE_SIZE;
    }
    if (!num_ents) {
        return 0;
    }

    *cdat_table = g_malloc0(num_ents * sizeof(*cdat_table));
    if (!*cdat_table) {
        return -ENOMEM;
    }

    /* Volatile aspects are mapped first */
    if (vmr) {
        ret = ct3_build_cdat_subtable(*cdat_table, vmr, dsmad_handle++,
                                      false, dpa_base);
        if (ret < 0) {
            goto error_cleanup;
        }
        dpa_base = vmr->size;
        cur_ent += ret;
    }
    /* Non volatile aspects */
    if (pmr) {
        /* non-volatile entries follow the volatile entries */
        ret = ct3_build_cdat_subtable(&(*cdat_table)[cur_ent], pmr,
                                      dsmad_handle, true, dpa_base);
        if (ret < 0) {
            goto error_cleanup;
        }
        cur_ent += ret;
    }
    assert(cur_ent == num_ents);

    return ret;
error_cleanup:
    int i;
    for (i = 0; i < num_ents; i++) {
        g_free(*cdat_table[i]);
    }
    g_free(*cdat_table);
    return ret;
}


On Thu, Oct 13, 2022 at 12:53:13PM +0100, Jonathan Cameron wrote:
> On Thu, 13 Oct 2022 07:36:28 -0400
> Gregory Price <gourry.memverge@gmail.com> wrote:
> 
> > Reading through your notes, everything seems reasonable, though I'm not
> > sure I agree with the two pass notion, though I'll wait to see the patch
> > set.
> > 
> > The enum is a good idea, *forehead slap*, I should have done it.  If we
> > have a local enum, why not just make it global (within the file) and
> > allocate the table as I have once we know how many MRs are present?
> 
> It's not global as we need the entries to be packed.  So if just one mr
> (which ever one) the entries for that need to be at the beginning of
> cdat_table.  I also don't want to bake into the outer caller that the
> entries will always be the same size for different MRs.
> 
> For the two pass case...
> 
> I'll send code in a few mins, but in meantime my thought is that
> the extended code for volatile + non volatile will looks something like:
> (variable names made up)
> 
> 	if (ct3d->volatile_mem) {
> 		volatile_mr = host_memory_backend_get_memory(ct3d->volatile_mem....);
> 		if (!volatile_mr) {
> 			return -ENINVAL;
> 		}
> 		rc = ct3_build_cdat_entries_for_mr(NULL, dsmad++, volatile_mr);
> 		if (rc < 0) {
> 			return rc;
> 		}
> 		volatile_len = rc;
> 	}
> 
> 	if (ct3d->nonvolatile_mem) {
> 		nonvolatile_mr = host_memory_backend_get_memory(ct3d->nonvolatile_mem);
> 		if (!nonvolatile_mr) {
> 			return -ENINVAL;
> 		}
> 		rc = ct3_build_cdat_entries_for_mr(NULL, dmsmad++, nonvolatile_mr....);
> 		if (rc < 0) {
> 			return rc;
> 		}
> 		nonvolatile_len = rc;
> 	}
> 
> 	dsmad = 0;
> 
> 	table = g_malloc(0, (volatile_len + nonvolatile_len) * sizeof(*table));
> 	if (!table) {
> 		return -ENOMEM;
> 	}
> 	
> 	if (volatile_len) {
> 		rc = ct3_build_cdat_entries_for_mr(&table[0], dmsad++, volatile_mr....);
> 		if (rc < 0) {
> 			return rc;
> 		}
> 	}	
> 	if (nonvolatile_len) {
> 		rc = ct3_build_cdat_entries_for_mr(&table[volatile_len], dsmad++, nonvolatile_mr...);
> 		if (rc < 0) {
> 			/* Only place we need error handling.  Could make it more generic of course */
> 			for (i = 0; i < volatile_len; i++) {
> 				g_free(cdat_table[i]);
> 			}
> 			return rc;
> 		}
> 	}
> 
> 	*cdat_table = g_steal_pointer(&table);
> 
> 
> Jonathan
> 
> > 
> > 6 eggs/half dozen though, I'm ultimately fine with either.
> > 
> > On Thu, Oct 13, 2022, 4:58 AM Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > wrote:
> > 
> > > On Wed, 12 Oct 2022 14:21:15 -0400
> > > Gregory Price <gourry.memverge@gmail.com> wrote:
> > >  
> > > > Included in this response is a recommended patch set on top of this
> > > > patch that resolves a number of issues, including style and a heap
> > > > corruption bug.
> > > >
> > > > The purpose of this patch set is to refactor the CDAT initialization
> > > > code to support future patch sets that will introduce multi-region
> > > > support in CXL Type3 devices.
> > > >
> > > > 1) Checkpatch errors in the immediately prior patch
> > > > 2) Flatting of code in cdat initialization
> > > > 3) Changes in allocation and error checking for cleanliness
> > > > 4) Change in the allocation/free strategy of CDAT sub-tables to simplify
> > > >    multi-region allocation in the future.  Also resolves a heap
> > > >    corruption bug
> > > > 5) Refactor of CDAT initialization code into a function that initializes
> > > >    sub-tables per memory-region.
> > > >
> > > > Gregory Price (5):
> > > >   hw/mem/cxl_type3: fix checkpatch errors
> > > >   hw/mem/cxl_type3: Pull validation checks ahead of functional code
> > > >   hw/mem/cxl_type3: CDAT pre-allocate and check resources prior to work
> > > >   hw/mem/cxl_type3: Change the CDAT allocation/free strategy
> > > >   hw/mem/cxl_type3: Refactor CDAT sub-table entry initialization into a
> > > >     function
> > > >
> > > >  hw/mem/cxl_type3.c | 240 +++++++++++++++++++++++----------------------
> > > >  1 file changed, 122 insertions(+), 118 deletions(-)
> > > >  
> > >
> > > Thanks, I'm going to roll this stuff into the original patch set for v8.
> > > Some of this I already have (like the check patch stuff).
> > > Some I may disagree with in which case  I'll reply to the patches - note
> > > I haven't looked at them in detail yet!
> > >
> > > Jonathan
> > >  
> > 
> 

