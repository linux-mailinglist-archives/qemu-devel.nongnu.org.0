Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E0C6F13E5
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 11:12:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psK9P-00028j-1I; Fri, 28 Apr 2023 05:12:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1psK9M-00028U-Pl
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 05:12:20 -0400
Received: from esa1.hc2706-39.iphmx.com ([68.232.153.39])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1psK9A-0002K3-9S
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 05:12:20 -0400
X-IronPort-RemoteIP: 209.85.222.198
X-IronPort-MID: 277490464
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:hFtbyaKuP3ECLt7bFE+Rb5clxSXFcZb7ZxGr2PjKsXjdYENSgjIOy
 zMZUG6DPa2KYTfweNp2YYWx9R4BvJfdz4U2HlNorCE8RH908vbIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOOn9T8kjvvgqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8lWo4ow/jb8kg34K6i4G9wUmEWPpingnePzxH5M7pCfcldH1OgKqFIE+izQ
 fr0zb3R1gs1KD90V7tJOp6iGqE7aue60Tqm0xK6aID76vR2nRHe545gXBYqhea7vB3S9zx54
 I0lWZVd0m7FNIWV8AgWe0Aw/y2TocSqUVIISJSymZX78qHIT5fj69V+IkEzNJE4xsUtAjlDq
 cUcIhwKbh/W0opawJrjIgVtrsEqLc2uJYBG/385nGGfAvEhTpTOBa7N4Le03h9q3pEITauYP
 ZBDL2M+PHwsYDUWUrsTIJs6jOGknFH1bntVpE/9Sa8fuTeMkF0pjOaxWDbTUsOjWdpxv0+cn
 WnhzVX5GRQXPv7GlAPQpxpAgceKx0sXQrk6DbC967tmjUOewkQVDxsZU0b9puO24nNSQPpaI
 k0QvzMt9O08rR37CNb6WBK8rTiPuRt0t8dsLtDWITqlksL8izt1zEBdJtKdQLTKbPMLeAE=
IronPort-HdrOrdr: A9a23:FuYmBa8t1wYqEhGqTHZuk+AUI+orL9Y04lQ7vn2ZhyYlFfBws/
 re4cjzsiWE9Ar5OUtQ4+xoXZPrfZqyz+8W3WB8B8bGYOCighrWEGgA1/qY/9SDIVyGygc178
 4JGNkcNDSzNykDsS+T2mmF+r0bsb+6Gc6T9IPj5kYoZy1RL49b0ydFJjCyLnBWLTM2e6bR16
 Dx2iOEnVedkLgsAPhTz0NrPtT+mw==
X-Talos-CUID: 9a23:Ed+Ao2MA+vNShO5DeDlJ9EsdBuAZUSfelHqMGkuyJWFpR+jA
X-Talos-MUID: =?us-ascii?q?9a23=3A2ltlLQ8IhFl24U5paiijqamQf9hB/7uKKUkJqp4?=
 =?us-ascii?q?hifiELil9MRXE0Q3iFw=3D=3D?=
Received: from mail-qk1-f198.google.com ([209.85.222.198])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2023 05:12:05 -0400
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-74a90885beeso1139473585a.2
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 02:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1682673124; x=1685265124;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=iiK1S7J6aw8XCr0C59140BNcQxbr648vetUDeUoUblQ=;
 b=gFVH5ak9WhtVaU8zhP0qb+UXk/wBhWO0Q0IKqOv8RAL2rW8KURICQyeXx38bh17iwT
 hwXFl01ZC5yvsj6bhBdBppOqIDklrHPFTL2q9EwBl9J8qaFwR7OUdsY8NZchuLhM++8s
 sYihM09V/KQAL1aP6VqRuF2hBfVs0Snxq84l+35th6UwsP18GYirj8QL4dWSFo3nN0xy
 JuRscuJARTv7ou+Ct+FDNgd42doTqaB5rGvwYsekF6CDlSJS/jVgEGs1KUqDrz+mdPXU
 sQoOHdKSvq9n6dWRjcp1ZnSaSkpf+orPU9Wi271abqZDW75X8F+gv2/hRSIr9+ZAhzdg
 gh+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682673124; x=1685265124;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iiK1S7J6aw8XCr0C59140BNcQxbr648vetUDeUoUblQ=;
 b=EHVixU6T/+JM+BHNFqo2Ruc4a7mLCmgNFKq/88qYLnF8uVg5Jb+HxsY97m2NaY95Qf
 lELe2QbX7T7Leob8mKbBAezOhdygP8u3aPV3Kovro1TdydJJre3D2s6PMt0le1RUW5Mh
 QNltkGY5Qxdzn4KEw/+QqLDpoq7GoZBaj7lOlhR6G8+PjyrL0cWuOjb+Jgp2K+2MsZzj
 WnT2rEzxoOcQgHoNJ+TxLpChyiP3wMC3VtbwY6JDvpLsmOZ2Nliaud8lsWVh5yPWsHVM
 sWw3ysLNpTJJJCSjPD0nXwLjTuXtRDKnc/t1mLVL7QBRbjdGhr8tH7AqaqyFTOzGDbaF
 W0hQ==
X-Gm-Message-State: AC+VfDzg20RiM60oVoVYV948YagmkoJWfVijW8Qyc0KKATLNG/81ORMd
 iF9U9BRaC0e5JWKMGl9zWZit8QCVr5B1AZUuWS+9AoMp4RqLHC7zMHFqCVP114XP370uUi+8hFH
 IW8u+jbF9cwzRIMjkNVQp12UvHmRAAQ==
X-Received: by 2002:ac8:58c9:0:b0:3f0:a300:a471 with SMTP id
 u9-20020ac858c9000000b003f0a300a471mr7351522qta.55.1682673124345; 
 Fri, 28 Apr 2023 02:12:04 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6qaAmq0FjwRLCnr7jYRIqcNfVn2JBi9NeKc9GboPmogD6p/Fhc5hO1WfbfB9Fs5Sxk4w7loA==
X-Received: by 2002:ac8:58c9:0:b0:3f0:a300:a471 with SMTP id
 u9-20020ac858c9000000b003f0a300a471mr7351469qta.55.1682673123709; 
 Fri, 28 Apr 2023 02:12:03 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 ge8-20020a05622a5c8800b003e3914c6839sm4139363qtb.43.2023.04.28.02.12.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 02:12:03 -0700 (PDT)
Date: Fri, 28 Apr 2023 05:11:59 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Thomas Huth <thuth@redhat.com>
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>,
 David Hildenbrand <david@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Jon Maloy <jmaloy@redhat.com>, Siqi Chen <coc.cyqh@gmail.com>,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: [PATCH v10 1/8] memory: prevent dma-reentracy issues
Message-ID: <20230428091159.haydefdtq4m6z2tz@mozz.bu.edu>
References: <20230427211013.2994127-1-alxndr@bu.edu>
 <20230427211013.2994127-2-alxndr@bu.edu>
 <ZEt/3RwtL/jePTTv@redhat.com>
 <828514c6-44f0-32f0-1eb1-a49f21617585@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <828514c6-44f0-32f0-1eb1-a49f21617585@redhat.com>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=68.232.153.39; envelope-from=alxndr@bu.edu;
 helo=esa1.hc2706-39.iphmx.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.266, HK_RANDOM_FROM=0.999, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 230428 1015, Thomas Huth wrote:
> On 28/04/2023 10.12, Daniel P. Berrangé wrote:
> > On Thu, Apr 27, 2023 at 05:10:06PM -0400, Alexander Bulekov wrote:
> > > Add a flag to the DeviceState, when a device is engaged in PIO/MMIO/DMA.
> > > This flag is set/checked prior to calling a device's MemoryRegion
> > > handlers, and set when device code initiates DMA.  The purpose of this
> > > flag is to prevent two types of DMA-based reentrancy issues:
> > > 
> > > 1.) mmio -> dma -> mmio case
> > > 2.) bh -> dma write -> mmio case
> > > 
> > > These issues have led to problems such as stack-exhaustion and
> > > use-after-frees.
> > > 
> > > Summary of the problem from Peter Maydell:
> > > https://lore.kernel.org/qemu-devel/CAFEAcA_23vc7hE3iaM-JVA6W38LK4hJoWae5KcknhPRD5fPBZA@mail.gmail.com
> > > 
> > > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/62
> > > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/540
> > > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/541
> > > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/556
> > > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/557
> > > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/827
> > > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1282
> > > Resolves: CVE-2023-0330
> > > 
> > > Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> > > Reviewed-by: Thomas Huth <thuth@redhat.com>
> > > ---
> > >   include/exec/memory.h  |  5 +++++
> > >   include/hw/qdev-core.h |  7 +++++++
> > >   softmmu/memory.c       | 16 ++++++++++++++++
> > >   3 files changed, 28 insertions(+)
> > > 
> > > diff --git a/include/exec/memory.h b/include/exec/memory.h
> > > index 15ade918ba..e45ce6061f 100644
> > > --- a/include/exec/memory.h
> > > +++ b/include/exec/memory.h
> > > @@ -767,6 +767,8 @@ struct MemoryRegion {
> > >       bool is_iommu;
> > >       RAMBlock *ram_block;
> > >       Object *owner;
> > > +    /* owner as TYPE_DEVICE. Used for re-entrancy checks in MR access hotpath */
> > > +    DeviceState *dev;
> > >       const MemoryRegionOps *ops;
> > >       void *opaque;
> > > @@ -791,6 +793,9 @@ struct MemoryRegion {
> > >       unsigned ioeventfd_nb;
> > >       MemoryRegionIoeventfd *ioeventfds;
> > >       RamDiscardManager *rdm; /* Only for RAM */
> > > +
> > > +    /* For devices designed to perform re-entrant IO into their own IO MRs */
> > > +    bool disable_reentrancy_guard;
> > >   };
> > >   struct IOMMUMemoryRegion {
> > > diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> > > index bd50ad5ee1..7623703943 100644
> > > --- a/include/hw/qdev-core.h
> > > +++ b/include/hw/qdev-core.h
> > > @@ -162,6 +162,10 @@ struct NamedClockList {
> > >       QLIST_ENTRY(NamedClockList) node;
> > >   };
> > > +typedef struct {
> > > +    bool engaged_in_io;
> > > +} MemReentrancyGuard;
> > > +
> > >   /**
> > >    * DeviceState:
> > >    * @realized: Indicates whether the device has been fully constructed.
> > > @@ -194,6 +198,9 @@ struct DeviceState {
> > >       int alias_required_for_version;
> > >       ResettableState reset;
> > >       GSList *unplug_blockers;
> > > +
> > > +    /* Is the device currently in mmio/pio/dma? Used to prevent re-entrancy */
> > > +    MemReentrancyGuard mem_reentrancy_guard;
> > >   };
> > >   struct DeviceListener {
> > > diff --git a/softmmu/memory.c b/softmmu/memory.c
> > > index b1a6cae6f5..fe23f0e5ce 100644
> > > --- a/softmmu/memory.c
> > > +++ b/softmmu/memory.c
> > > @@ -542,6 +542,18 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
> > >           access_size_max = 4;
> > >       }
> > > +    /* Do not allow more than one simultaneous access to a device's IO Regions */
> > > +    if (mr->dev && !mr->disable_reentrancy_guard &&
> > > +        !mr->ram_device && !mr->ram && !mr->rom_device && !mr->readonly) {
> > > +        if (mr->dev->mem_reentrancy_guard.engaged_in_io) {
> > > +            warn_report("Blocked re-entrant IO on "
> > > +                    "MemoryRegion: %s at addr: 0x%" HWADDR_PRIX,
> > > +                    memory_region_name(mr), addr);
> > > +            return MEMTX_ACCESS_ERROR;
> > 
> > If we issue this warn_report on every invalid memory access, is this
> > going to become a denial of service by flooding logs, or is the
> > return MEMTX_ACCESS_ERROR, sufficient to ensure this is only printed
> > *once* in the lifetime of the QEMU process ?
> 
> Maybe it's better to use warn_report_once() here instead?

Sounds good - should I respin the series to change this?
-Alex

