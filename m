Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCA35108B8
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 21:11:47 +0200 (CEST)
Received: from localhost ([::1]:52682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQbC-0003T7-EI
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 15:11:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1njQC6-0004CC-Ql
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:45:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1njQC3-0000pS-O0
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:45:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650998745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iu5LkZeNebV7ZZD2/4JfhEX4w8qXaBt2S80lON09i0M=;
 b=B17xIZw5/JDZmK/Ki76dFvy1QLfh9FnTTRpUzKyypcXPjLMnSM3RQo5Pbdtht7L8sGUZQL
 SOK48QEQ+tZBS9Cx9h7aZ88PM/nxf5hyrU/MFzWGANRiL21TgQdJGEYmM+O3CWTirWcpnq
 T/XQh+pPTROWnRuHDHhCZyR45WCKhA4=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-8SOQc7hRMaeL4-yyq4xmRQ-1; Tue, 26 Apr 2022 14:45:44 -0400
X-MC-Unique: 8SOQc7hRMaeL4-yyq4xmRQ-1
Received: by mail-io1-f69.google.com with SMTP id
 c25-20020a5d9399000000b00652e2b23358so14955797iol.6
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:45:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=iu5LkZeNebV7ZZD2/4JfhEX4w8qXaBt2S80lON09i0M=;
 b=tez88MeiQzwpyXue29bbuaWGt6i7YWcEz+8H940CWIuWh3fQV4LjX5rSmZAr8NkxVg
 NSIsoECjBjFYa2dZQEKD3oETjREJXqWgql+SVsEs1dVqRCtFYH7epUx6bK5g0SU3SOH9
 HoyZOflUNTViAJ7MrCFhQLeoM7NbNxzeT/aB8i6Q9qd+eTYjCa8BW2MCUkdsTOexMmOK
 TGR8N0m9q8KuAIpb0te+rIqe5JBjOqDqTGJL1wIAs5Gjf2D9Y2PyeFS3rsW11XQNU9aj
 Xt/TGjjLOCRAwSt4PSD9rx+H39FzaZE8QrOnZG29vGPH1Y89ItTdA2z/Hz1ZjJZsOKYx
 F+jA==
X-Gm-Message-State: AOAM531Z8sk/gNjzOUNBRkgcHzfw8sk/EJ5armilr44irhbRJIKYquWA
 UUy9CuqSGktE19aBiJt1qnn/Tbep0ARCDyvT4d7GukuaQnXfpT6hV7jeWjHe8aYVyKlaY4Wkdsm
 nibb3djgwXNeYlF0=
X-Received: by 2002:a05:6638:16d2:b0:323:7285:474b with SMTP id
 g18-20020a05663816d200b003237285474bmr11369314jat.61.1650998743553; 
 Tue, 26 Apr 2022 11:45:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwIJFnLBCJRxvz2uN9ezQ1TKeJbab3Wz+HxEWH2jg4/Y7GJ7GIu68+l8IH3yRCrQsAmSBg+OQ==
X-Received: by 2002:a05:6638:16d2:b0:323:7285:474b with SMTP id
 g18-20020a05663816d200b003237285474bmr11369292jat.61.1650998743322; 
 Tue, 26 Apr 2022 11:45:43 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 e17-20020a5d8ad1000000b00644d51bbffcsm10179822iot.36.2022.04.26.11.45.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:45:42 -0700 (PDT)
Date: Tue, 26 Apr 2022 12:45:41 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [RFC 15/18] vfio/iommufd: Implement iommufd backend
Message-ID: <20220426124541.5f33f357.alex.williamson@redhat.com>
In-Reply-To: <20220426141156.GO2125828@nvidia.com>
References: <20220414104710.28534-1-yi.l.liu@intel.com>
 <20220414104710.28534-16-yi.l.liu@intel.com>
 <20220422145815.GK2120790@nvidia.com>
 <3576770b-e4c2-cf11-da0c-821c55ab9902@intel.com>
 <BN9PR11MB5276AD0B0DAA59A44ED705618CFB9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20220426134114.GM2125828@nvidia.com>
 <79de081d-31dc-41a4-d38f-1e28327b1152@intel.com>
 <20220426141156.GO2125828@nvidia.com>
Organization: Red Hat
MIME-Version: 1.0
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
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "jjherne@linux.ibm.com" <jjherne@linux.ibm.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Peng, Chao P" <chao.p.peng@intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peterx@redhat.com" <peterx@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>, "Sun,
 Yi Y" <yi.y.sun@intel.com>, Yi Liu <yi.l.liu@intel.com>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>,
 "thuth@redhat.com" <thuth@redhat.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 26 Apr 2022 11:11:56 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Tue, Apr 26, 2022 at 10:08:30PM +0800, Yi Liu wrote:
> 
> > > I think it is strange that the allowed DMA a guest can do depends on
> > > the order how devices are plugged into the guest, and varys from
> > > device to device?
> > > 
> > > IMHO it would be nicer if qemu would be able to read the new reserved
> > > regions and unmap the conflicts before hot plugging the new device. We
> > > don't have a kernel API to do this, maybe we should have one?  
> > 
> > For userspace drivers, it is fine to do it. For QEMU, it's not quite easy
> > since the IOVA is GPA which is determined per the e820 table.  
> 
> Sure, that is why I said we may need a new API to get this data back
> so userspace can fix the address map before attempting to attach the
> new device. Currently that is not possible at all, the device attach
> fails and userspace has no way to learn what addresses are causing
> problems.

We have APIs to get the IOVA ranges, both with legacy vfio and the
iommufd RFC, QEMU could compare these, but deciding to remove an
existing mapping is not something to be done lightly.  We must be
absolutely certain that there is no DMA to that range before doing so.
 
> > > eg currently I see the log messages that it is passing P2P BAR memory
> > > into iommufd map, this should be prevented inside qemu because it is
> > > not reliable right now if iommufd will correctly reject it.  
> > 
> > yeah. qemu can filter the P2P BAR mapping and just stop it in qemu. We
> > haven't added it as it is something you will add in future. so didn't
> > add it in this RFC. :-) Please let me know if it feels better to filter
> > it from today.  
> 
> I currently hope it will use a different map API entirely and not rely
> on discovering the P2P via the VMA. eg using a DMABUF FD or something.
> 
> So blocking it in qemu feels like the right thing to do.

Wait a sec, so legacy vfio supports p2p between devices, which has a
least a couple known use cases, primarily involving GPUs for at least
one of the peers, and we're not going to make equivalent support a
feature requirement for iommufd?  This would entirely fracture the
notion that iommufd is a direct replacement and upgrade from legacy
vfio and make a transparent transition for libvirt managed VMs
impossible.  Let's reconsider.  Thanks,

Alex


