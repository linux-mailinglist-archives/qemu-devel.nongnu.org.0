Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2EB4C4AC9
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 17:32:57 +0100 (CET)
Received: from localhost ([::1]:55116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNdWZ-000055-T0
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 11:32:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nNdFp-00023c-0p
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 11:15:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nNdFk-0006Yi-TZ
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 11:15:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645805729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Etqldj/4s/fIb10KgVa4JK1z/x+HxbGkpKDrNg4Xpbg=;
 b=hSbgmFb9Uy1jfLSSGw7EUZwERzBvUplRjoz/DdJwEF5g2xwghoyUuepD98k8dZqoTeq60G
 GQQNvRPXUJL58oUe1PZeazbAMal6ae3b8QrCrAIqFvSkDYwJ0EidYfTu2WumitsS3oTt5U
 /XB2d0ccAmX81RENNvpOG2cn4SbbV50=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-154-RzvxcziPNRO33hikJ-Edlg-1; Fri, 25 Feb 2022 11:15:26 -0500
X-MC-Unique: RzvxcziPNRO33hikJ-Edlg-1
Received: by mail-il1-f199.google.com with SMTP id
 x6-20020a923006000000b002bea39c3974so3748930ile.12
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 08:15:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=Etqldj/4s/fIb10KgVa4JK1z/x+HxbGkpKDrNg4Xpbg=;
 b=asHuGOLHFC8CIvhKEh5n7Uib0iwZbiJ3cSGSTPzZge0grFV8BLYJeQkyK0OoXRU/Te
 qNysHqx43q/RlZtg5C/O4lUlMCskg6kurJxCmVUoiNeujKo+sDQEaeLtW2X5srjVvAoY
 eNRrusxpJHIm94lodU45z/2LhDnQ5V7U4/CFpJKK2xfaEXUVrsJ/XFGW42MB5Ubuq/F2
 Omlhwxia+dHL/ilkqUvq06dBNw9z0+leAE7LvxxtmmPr64/YrhiwBH7uCBnCMEx5GHI9
 ROE5yMZJO8J0dooFKqAw6LRI1ZelBNYXWVf/GBkxBAoH+4JfPaRda0SW4exTUf67YEve
 Rclw==
X-Gm-Message-State: AOAM531ooT2Nseg+OgrtDKcZqlF1PLk31C1rUnvFzV0TsJgICJjmVcfc
 KtLI24uYSMJ1Pk4sWMUvxKCIvJR+/z0Cb4hFR0P/jh1+wzy2AY6CAdxOWHjJ6UqjJOK1dvs6jzx
 0+qdKqNhpJDFJiTI=
X-Received: by 2002:a92:cccb:0:b0:2c2:7641:ed49 with SMTP id
 u11-20020a92cccb000000b002c27641ed49mr7155889ilq.271.1645805725911; 
 Fri, 25 Feb 2022 08:15:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzFb3zKLpvyu7TMzyQEk2EiYkwKZUrpkYmSnnQaRUBmAW+2R1x4P0f3lmzuwbBHPQJgmyN/Mg==
X-Received: by 2002:a92:cccb:0:b0:2c2:7641:ed49 with SMTP id
 u11-20020a92cccb000000b002c27641ed49mr7155848ilq.271.1645805725574; 
 Fri, 25 Feb 2022 08:15:25 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 q7-20020a92d407000000b002c23918fa80sm1749324ilm.60.2022.02.25.08.15.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 08:15:25 -0800 (PST)
Date: Fri, 25 Feb 2022 09:15:23 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH v3 4/6] i386/pc: relocate 4g start to 1T where applicable
Message-ID: <20220225091523.66b3b2c5.alex.williamson@redhat.com>
In-Reply-To: <eb699dff-09d3-e9ba-2c35-3c91966efa13@oracle.com>
References: <20220223184455.9057-5-joao.m.martins@oracle.com>
 <20220223161744-mutt-send-email-mst@kernel.org>
 <5fee0e05-e4d1-712b-9ad1-f009aba431ea@oracle.com>
 <c28ade30-fbea-4d3a-3b11-356c02abaabb@oracle.com>
 <20220224122146-mutt-send-email-mst@kernel.org>
 <7afb8caf-5c98-d6db-d3e5-6e08b2832d57@oracle.com>
 <20220224131607-mutt-send-email-mst@kernel.org>
 <f19dd8be-f923-fd7d-c54d-a54fd775dcc5@oracle.com>
 <20220224144800-mutt-send-email-mst@kernel.org>
 <37df5f3a-283a-a016-311f-8281bbacda19@oracle.com>
 <20220224150626-mutt-send-email-mst@kernel.org>
 <5cae0afc-df3e-5dc6-d11b-2f7d931ba5e6@oracle.com>
 <20220224144053.3fbe234d.alex.williamson@redhat.com>
 <eb699dff-09d3-e9ba-2c35-3c91966efa13@oracle.com>
Organization: Red Hat
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 25 Feb 2022 12:36:24 +0000
Joao Martins <joao.m.martins@oracle.com> wrote:

> On 2/24/22 21:40, Alex Williamson wrote:
> > On Thu, 24 Feb 2022 20:34:40 +0000
> > Joao Martins <joao.m.martins@oracle.com> wrote:
> >> Of all those cases I would feel the machine-property is better,
> >> and more flexible than having VFIO/VDPA deal with a bad memory-layout and
> >> discovering late stage that the user is doing something wrong (and thus
> >> fail the DMA_MAP operation for those who do check invalid iovas)  
> > 
> > The trouble is that anything we can glean from the host system where we
> > instantiate the VM is mostly meaningless relative to data center
> > orchestration.  We're relatively insulated from these sorts of issues
> > on x86 (apparently aside from this case), AIUI ARM is even worse about
> > having arbitrary reserved ranges within their IOVA space.
> >   
> In the multi-socket servers we have for ARM I haven't seen much
> issues /yet/ with VFIO. I only have this reserved region:
> 
> 0x0000000008000000 0x00000000080fffff msi
> 
> But of course ARM servers aren't very good representatives of the
> shifting nature of other ARM machine models. ISTR some thread about GIC ITS ranges
> being reserved by IOMMU in some hardware. Perhaps that's what you might
> be referring to about:
> 
> https://lore.kernel.org/qemu-devel/1510622154-17224-1-git-send-email-zhuyijun@huawei.com/


Right, and notice there also that the msi range is different.  On x86
the msi block is defined by the processor, not the platform and we have
commonality between Intel and AMD on that range.  We emulate the same
range in the guest, so for any x86 guest running on an x86 host, the
msi range is a non-issue because they overlap due to the architectural
standards.

How do you create an ARM guest that reserves a block at both 0x8000000
for your host and 0xc6000000 for the host in the above link?  Whatever
solution we develop to resolve that issue should equally apply to the
AMD reserved block:

0x000000fd00000000 0x000000ffffffffff reserved

> > For a comprehensive solution, it's not a machine accelerator property
> > or enable such-and-such functionality flag, it's the ability to specify
> > a VM memory map on the QEMU command line and data center orchestration
> > tools gaining insight across all their systems to specify a memory
> > layout that can work regardless of how a VM might be migrated. 
> > Maybe
> > there's a "host" option to that memory map command line option that
> > would take into account the common case of a static host or at least
> > homogeneous set of hosts.  Overall, it's not unlike specifying CPU flags
> > to generate a least common denominator set such that the VM is
> > compatible to any host in the cluster.
> >   
> 
> I remember you iterated over the initial RFC over such idea. I do like that
> option of adjusting memory map... should any new restrictions appear in the
> IOVA space appear as opposed to have to change the machine code everytime
> that happens.
> 
> 
> I am trying to approach this iteratively and starting by fixing AMD 1T+ guests
> with something that hopefully is less painful to bear and unbreaks users doing
> multi-TB guests on kernels >= 5.4. While for < 5.4 it would not wrongly be
> DMA mapping bad IOVAs that may lead guests own spurious failures.
> For the longterm, qemu would need some sort of handling of configurable a sparse
> map of all guest RAM which currently does not exist (and it's stuffed inside on a
> per-machine basis as you're aware). What I am unsure is the churn associated
> with it (compat, migration, mem-hotplug, nvdimms, memory-backends) versus benefit
> if it's "just" one class of x86 platforms (Intel not affected) -- which is what I find
> attractive with the past 2 revisions via smaller change.
> 
> > On the device end, I really would prefer not to see device driver
> > specific enables and we simply cannot hot-add a device of the given
> > type without a pre-enabled VM.  Give the user visibility and
> > configurability to the issue and simply fail the device add (ideally
> > with a useful error message) if the device IOVA space cannot support
> > the VM memory layout (this is what vfio already does afaik).
> > 
> > When we have iommufd support common for vfio and vdpa, hopefully we'll
> > also be able to recommend a common means for learning about system and
> > IOMMU restrictions to IOVA spaces.   
> 
> Perhaps even advertising platform-wide regions (without a domain allocated) that
> are common in any protection domain (for example on x86 this is one
> such case where MSI/HT ranges are hardcoded in Intel/AMD).
> 
> > For now we have reserved_regions
> > reported in sysfs per IOMMU group:
> > 
> >  $ grep -h . /sys/kernel/iommu_groups/*/reserved_regions | sort -u | grep -v direct-relaxable  
> 
> And hopefully iommufd might not want to allow iommu_map() on those reserved
> IOVA regions as opposed to letting that go through. Essentially what VFIO does. Unless of
> course there's actually a case where this is required to iommu_map reserved regions (which
> I don't know).

iommufd is being designed to support a direct replacement for the vfio
specific type1 IOMMU backend, so it will need to have this feature.
Allowing userspace to create invalid mappings would be irresponsible.

I'd tend to agree with MST's recommendation for a more piece-wise
solution, tie the memory map to the vCPU vendor rather than to some
property of the host to account for this reserved range on AMD.  Thanks,

Alex


