Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E5D6B724D
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 10:15:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbeGz-00068r-GZ; Mon, 13 Mar 2023 05:15:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pbeGx-00065J-4V
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 05:15:15 -0400
Received: from esa9.hc2706-39.iphmx.com ([216.71.140.197])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pbeGv-00010B-1l
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 05:15:14 -0400
X-IronPort-RemoteIP: 209.85.222.198
X-IronPort-MID: 265321435
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:WUTrA6qDYKqAaroY6rSKgMNvBzheBmKmZxIvgKrLsJaIsI4StFCzt
 garIBnUaPuIamekKognOom+9hkO68TWndBqSgJkqCthEngS9JacVYWSI3mrAy7DdceroGCLT
 ik9hnssCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UMHUMja4mtC5QRlPKsT5jcyqlFOZH4hDfDpR5fHatQMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+AsBOsDAbzsAB+v9T2M4nVKtio27hc+ada
 Tl6ncfYpQ8BZsUgkQmGOvVSO3gW0aZuodcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwp71QLkZKz
 8IkGSEoMkmphsfsmu3mVbw57igjBJGD0II3v3hhyXTADq9jT8mSE+PF4thX2Dp2jcdLdRrcT
 5BBOHw/MVKaOUcJYwZHYH49tL7Aan3XejlIrl6PjaAqpWXf0WSd1ZC3boeOIIXWHpg9ckCwi
 TnGvEnLOAMgJMW14muOz26it/XWpHauMG4VPPjinhJwu3WKy2kOTREbS1a/if++jEG4RpRYM
 UN8x8Y1ha079UjuV9qkGhPh8S7CsRkbVN5dVeY97Wlh15bp3upQPUBcJhYpVTDsnJVeqeACv
 rNRo+7UOA==
IronPort-HdrOrdr: A9a23:SxfrCa1DsNC4n37x+JjOcAqjBH4kLtp133Aq2lEZdPWaSL3+qy
 mLpoVn6faSskdsZJhAo6H7BEDkexnhHPFOkOss1NuZLWzbUS6TXf5fBOjZskbd8k/Fh5dgPM
 5bGsAUeb7N5BpB/L7HCWGDc+rIq+P3lpxA692uq0tFfEVBR5slwT1EKju2JGVLeSguP+tGKH
 Ne3KZ6TvibFEj/ov7UOpDNZYejm+H2
Received: from mail-qk1-f198.google.com ([209.85.222.198])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Mar 2023 05:15:05 -0400
Received: by mail-qk1-f198.google.com with SMTP id
 az31-20020a05620a171f00b00745746178e2so1085934qkb.6
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 02:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1678698905;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=mdOPhuWptZ5J2oz5Y/9d+is7Fmu14tWfPTjHKt9MAlo=;
 b=bQGDb93OXZIHpis6VKJa7myXGG97scv0Rup/umEULZIKdMt16g/Gzx7kFuRDWQjviF
 WoJMRgQBnThQjOI2pM852wC3GdGCub4mPOkLfDKdMBQ4lPtSkJAAP6vj38Kafwg+VbJz
 /uNxavn1pDkf2NfmUgM2VBGCvw6ILm8i4xeLHjR1WSJ+X4Masmvi4HSAmB/9bMq9aekb
 pMJveB5A8nyIRQyvBBjR0NENFgLFQyvRd0KH5Q8z+nqMo6siFv8sPBNFCpAVKu6o1w9i
 enw6el0esEheX1sFV05H3DIybyCA00U+fjYfPskEppHQQhUZqPbHuyYPs3Idpo9dJ6jH
 UrEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678698905;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mdOPhuWptZ5J2oz5Y/9d+is7Fmu14tWfPTjHKt9MAlo=;
 b=NtXogEjdIF+ugFnqynLQlW1qSpYlO4qv5yVTFZhfDmRqNAqW69eIadkZUYxJ6gHRGn
 xYHlA1DvoQaJj6UDTXhbSPkomYZXJy5/eI6SNuzTyVfkyJpoBZ1D5M4MtQ+nLpsXbxZ7
 8vvkaXrMd+vHPsE8EfVVn0+ZE2M9/9CzDAQ3Z2KWUXv+QQlIbZtzrhLWFS2QmFDQOvfD
 cfB3GzqfLIuXETCe8aloGSE7u7U5LSp4YjVhCfXOCiaknh+76NpWasBPXfImqcKMxpZI
 lflhpKiC4OoURiHevbadO7ue8Wv2KfMooFk/w6IsiNQzDGfknd0Bo2kQGJm0B2bvblHV
 XVBg==
X-Gm-Message-State: AO0yUKVvd9k1gmMBusLvAVYFtBmUsiVKbzQEolSa1NJkbyXuyug/SFT2
 Jgpe5y/5R5pI+SB6wkxgpmNZ8wGrd8xzmTDA1M3uZ1nq3ugWk53RaHnchQLZmSzE+RQD9kItlb8
 yk4siDxGohljOs7HemwDRIZvdQRJkNA==
X-Received: by 2002:a05:622a:409:b0:3bf:d35d:98c0 with SMTP id
 n9-20020a05622a040900b003bfd35d98c0mr60918959qtx.29.1678698905161; 
 Mon, 13 Mar 2023 02:15:05 -0700 (PDT)
X-Google-Smtp-Source: AK7set97uYhet0085fnE9z23M/O3/d0A5MhQLL2n6mr1zIxKkDDyFOS42324lgFxECPrKI3o5qdKIg==
X-Received: by 2002:a05:622a:409:b0:3bf:d35d:98c0 with SMTP id
 n9-20020a05622a040900b003bfd35d98c0mr60918919qtx.29.1678698904871; 
 Mon, 13 Mar 2023 02:15:04 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 z11-20020ac8710b000000b003b63b8df24asm5197224qto.36.2023.03.13.02.15.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Mar 2023 02:15:04 -0700 (PDT)
Date: Mon, 13 Mar 2023 05:15:00 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Jon Maloy <jmaloy@redhat.com>, Siqi Chen <coc.cyqh@gmail.com>
Subject: Re: [PATCH v7 1/6] memory: prevent dma-reentracy issues
Message-ID: <20230313091500.pazvdnqbcyuxs5yw@mozz.bu.edu>
References: <20230313082417.827484-1-alxndr@bu.edu>
 <20230313082417.827484-2-alxndr@bu.edu>
 <bb13d933-0de9-9537-8e3e-dc91c24eb177@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bb13d933-0de9-9537-8e3e-dc91c24eb177@linaro.org>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.140.197; envelope-from=alxndr@bu.edu;
 helo=esa9.hc2706-39.iphmx.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=1, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 230313 0945, Philippe Mathieu-Daudé wrote:
> Hi Alex,
> 
> Sorry for the late review, *sigh*.
> 
> On 13/3/23 09:24, Alexander Bulekov wrote:
> > Add a flag to the DeviceState, when a device is engaged in PIO/MMIO/DMA.
> > This flag is set/checked prior to calling a device's MemoryRegion
> > handlers, and set when device code initiates DMA.  The purpose of this
> > flag is to prevent two types of DMA-based reentrancy issues:
> > 
> > 1.) mmio -> dma -> mmio case
> > 2.) bh -> dma write -> mmio case
> > 
> > These issues have led to problems such as stack-exhaustion and
> > use-after-frees.
> > 
> > Summary of the problem from Peter Maydell:
> > https://lore.kernel.org/qemu-devel/CAFEAcA_23vc7hE3iaM-JVA6W38LK4hJoWae5KcknhPRD5fPBZA@mail.gmail.com
> > 
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/62
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/540
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/541
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/556
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/557
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/827
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1282
> > 
> > Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
> > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> > Acked-by: Peter Xu <peterx@redhat.com>
> > ---
> >   include/hw/qdev-core.h |  7 +++++++
> >   softmmu/memory.c       | 17 +++++++++++++++++
> >   softmmu/trace-events   |  1 +
> >   3 files changed, 25 insertions(+)
> > 
> > diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> > index bd50ad5ee1..7623703943 100644
> > --- a/include/hw/qdev-core.h
> > +++ b/include/hw/qdev-core.h
> > @@ -162,6 +162,10 @@ struct NamedClockList {
> >       QLIST_ENTRY(NamedClockList) node;
> >   };
> > +typedef struct {
> > +    bool engaged_in_io;
> 
> Do you plan to add more fields?

Not right now, but maybe some need will come up.

> > +} MemReentrancyGuard;
> > +
> >   /**
> >    * DeviceState:
> >    * @realized: Indicates whether the device has been fully constructed.
> > @@ -194,6 +198,9 @@ struct DeviceState {
> >       int alias_required_for_version;
> >       ResettableState reset;
> >       GSList *unplug_blockers;
> > +
> > +    /* Is the device currently in mmio/pio/dma? Used to prevent re-entrancy */
> > +    MemReentrancyGuard mem_reentrancy_guard;
> 
> At this point I'm not sure anymore this is a device or MR property.

It's designed to be an MR property. If it were MR specific, it wouldn't
handle the BH -> DMA case, or this one, where there are two MRs (doorbell
and oper) involed.
https://gitlab.com/qemu-project/qemu/-/issues/540

> 
> >   };
> >   struct DeviceListener {
> > diff --git a/softmmu/memory.c b/softmmu/memory.c
> > index 4699ba55ec..57bf18a257 100644
> > --- a/softmmu/memory.c
> > +++ b/softmmu/memory.c
> > @@ -533,6 +533,7 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
> >       uint64_t access_mask;
> >       unsigned access_size;
> >       unsigned i;
> > +    DeviceState *dev = NULL;
> >       MemTxResult r = MEMTX_OK;
> >       if (!access_size_min) {
> > @@ -542,6 +543,19 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
> >           access_size_max = 4;
> >       }
> > +    /* Do not allow more than one simultanous access to a device's IO Regions */
> 
> Typo "simultaneous".
> 
> 1/ access_with_adjusted_size() is complex enough and we are having hard
>    time getting it right. I'd prefer we don't intermix size adjustment
>    and re-entrancy check in the same function. This check could belong
>    to the callers.
> 

Would moving the code within this function to keep it separate from the
size adjustment be good enough? Otherwise we would end up with duplicate
code in the read/write callers.

The size-adjustment seems to be orthogonal (the MR won't change)?

> 2/ I'm not keen on calling QOM object_dynamic_cast() in this hot path;
>    and mixing QDev API within MR one. At least, can we cache this value
>    once in memory_region_do_init() since we have access to @owner?
>

Sounds like a good idea. Is it ever possible for the owner/owner's
address to change? 

Thanks
-Alex

> > +    if (mr->owner &&
> > +        !mr->ram_device && !mr->ram && !mr->rom_device && !mr->readonly) {
> > +        dev = (DeviceState *) object_dynamic_cast(mr->owner, TYPE_DEVICE);
> > +        if (dev) {
> > +            if (dev->mem_reentrancy_guard.engaged_in_io) {
> > +                trace_memory_region_reentrant_io(get_cpu_index(), mr, addr, size);
> > +                return MEMTX_ERROR;
> 
> MEMTX_ERROR is device-specific, I'm not sure it is right to return it
> from this generic path. Maybe you meant MEMTX_ACCESS_ERROR?
> 
> > +            }
> > +            dev->mem_reentrancy_guard.engaged_in_io = true;
> > +        }
> > +    }
> > +
> >       /* FIXME: support unaligned access? */
> >       access_size = MAX(MIN(size, access_size_max), access_size_min);
> >       access_mask = MAKE_64BIT_MASK(0, access_size * 8);
> > @@ -556,6 +570,9 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
> >                           access_mask, attrs);
> >           }
> >       }
> > +    if (dev) {
> > +        dev->mem_reentrancy_guard.engaged_in_io = false;
> > +    }
> >       return r;
> >   }
> 

