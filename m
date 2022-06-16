Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEC854DCB9
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 10:21:07 +0200 (CEST)
Received: from localhost ([::1]:39990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1kkU-0002Tk-Ki
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 04:21:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o1kgO-0001Cr-D5
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 04:16:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o1kgL-0000PE-Mr
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 04:16:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655367408;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=946ugFRGYctKItvem3OyAcyzB/AmblOQ1M06xS4xsE0=;
 b=bXlMYHoaQlQOlnFHijF04ORq5rxSV7/KCHLB4pc4qmGZ/uSNvOhKyl1+Y+N9YxUeryiSAk
 +98MNIHFtblv97tVwN26ZMY7vfspcHFqY7cSmhpmYS5MG+14DXvkuvk3LUrA+p6Xpi7Eak
 8aoL5U90oMX87wUNd4CxNdqm78v/S5o=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-449-M9w1pSsaO0uLMbs-CDN-1Q-1; Thu, 16 Jun 2022 04:16:44 -0400
X-MC-Unique: M9w1pSsaO0uLMbs-CDN-1Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8371F3C0ED4F;
 Thu, 16 Jun 2022 08:16:44 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.111])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F0FD1121314;
 Thu, 16 Jun 2022 08:16:43 +0000 (UTC)
Date: Thu, 16 Jun 2022 09:16:40 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: "manish.mishra" <manish.mishra@nutanix.com>,
 Het Gala <het.gala@nutanix.com>, qemu-devel@nongnu.org,
 quintela@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 eblake@redhat.com
Subject: Re: [PATCH 0/4] Multiple interface support on top of Multi-FD
Message-ID: <Yqrm6ARhSWllUDul@redhat.com>
References: <20220609073305.142515-1-het.gala@nutanix.com>
 <YqIWDoSJ/xQC8Vvt@redhat.com>
 <7209116d-ef87-ee6f-5126-e23b55121f49@nutanix.com>
 <YqoMMCbF3PBnYSn/@redhat.com> <Yqovkrm37mUdggws@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yqovkrm37mUdggws@work-vm>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 15, 2022 at 08:14:26PM +0100, Dr. David Alan Gilbert wrote:
> * Daniel P. Berrangé (berrange@redhat.com) wrote:
> > On Fri, Jun 10, 2022 at 05:58:31PM +0530, manish.mishra wrote:
> > > 
> > > On 09/06/22 9:17 pm, Daniel P. Berrangé wrote:
> > > > On Thu, Jun 09, 2022 at 07:33:01AM +0000, Het Gala wrote:
> > > > > As of now, the multi-FD feature supports connection over the default network
> > > > > only. This Patchset series is a Qemu side implementation of providing multiple
> > > > > interfaces support for multi-FD. This enables us to fully utilize dedicated or
> > > > > multiple NICs in case bonding of NICs is not possible.
> > > > > 
> > > > > 
> > > > > Introduction
> > > > > -------------
> > > > > Multi-FD Qemu implementation currently supports connection only on the default
> > > > > network. This forbids us from advantages like:
> > > > > - Separating VM live migration traffic from the default network.
> > > 
> > > Hi Daniel,
> > > 
> > > I totally understand your concern around this approach increasing compexity inside qemu,
> > > 
> > > when similar things can be done with NIC teaming. But we thought this approach provides
> > > 
> > > much more flexibility to user in few cases like.
> > > 
> > > 1. We checked our customer data, almost all of the host had multiple NIC, but LACP support
> > > 
> > >     in their setups was very rare. So for those cases this approach can help in utilise multiple
> > > 
> > >     NICs as teaming is not possible there.
> > 
> > AFAIK,  LACP is not required in order to do link aggregation with Linux.
> > Traditional Linux bonding has no special NIC hardware or switch requirements,
> > so LACP is merely a "nice to have" in order to simplify some aspects.
> > 
> > IOW, migration with traffic spread across multiple NICs is already
> > possible AFAICT.
> 
> Are we sure that works with multifd?  I've seen a lot of bonding NIC
> setups which spread based on a hash of source/destination IP and port
> numbers; given that we use the same dest port and IP at the moment what
> happens in reality?  That hashing can be quite delicate for high
> bandwidth single streams.

The simplest Linux bonding mode does per-packet round-robin across 
NICs, so traffic from the collection of multifd connections should
fill up all the NICs in the bond. There are of course other modes
which may be sub-optimal for the reasons you describe. Which mode
to pick depends on the type of service traffic patterns you're
aiming to balance.

> > > > > Multi-interface with Multi-FD
> > > > > -----------------------------
> > > > > Multiple-interface support over basic multi-FD has been implemented in the
> > > > > patches. Advantages of this implementation are:
> > > > > - Able to separate live migration traffic from default network interface by
> > > > >    creating multiFD channels on ip addresses of multiple non-default interfaces.
> > > > > - Can optimize the number of multi-FD channels on a particular interface
> > > > >    depending upon the network bandwidth limit on a particular interface.
> > > > Manually assigning individual channels to different NICs is a pretty
> > > > inefficient way to optimizing traffic. Feels like you could easily get
> > > > into a situation where one NIC ends up idle while the other is busy,
> > > > especially if the traffic patterns are different. For example with
> > > > post-copy there's an extra channel for OOB async page requests, and
> > > > its far from clear that manually picking NICs per chanel upfront is
> > > > going work for that.  The kernel can continually dynamically balance
> > > > load on the fly and so do much better than any static mapping QEMU
> > > > tries to apply, especially if there are multiple distinct QEMU's
> > > > competing for bandwidth.
> > > > 
> > > Yes, Daniel current solution is only for pre-copy. As with postcopy
> > > multiFD is not yet supported but in future we can extend it for postcopy
> 
> I had been thinking about explicit selection of network device for NUMA
> use though; ideally I'd like to be able to associate a set of multifd
> threads to each NUMA node, and then associate a NIC with that set of
> threads; so that the migration happens down the NIC that's on the node
> the RAM is on.  On a really good day you'd have one NIC per top level
> NUMA node.

Now that's an interesting idea, and not one that can be dealt with
by bonding, since the network layer won't be aware of the NUMA
affinity constraints.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


