Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9FA54E8B0
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 19:35:08 +0200 (CEST)
Received: from localhost ([::1]:59534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1tOd-0003K6-Ds
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 13:35:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o1tMA-0001FM-Gq
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 13:32:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o1tM4-0001zc-Ei
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 13:32:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655400747;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AKlmeazXhViAagx2L6O4lsZhYODGBXiLhHseatPaVrY=;
 b=b4S3cs89XqxkCfjlTDQk0B3AMNChVg834EpTIhdjrriu9WBion2mxE6NKW3gWu8dsfYC5c
 7zp7SIvk5aLmzZJs5ZhE+0Okt26ApnKx1mqLTOZ7/IcqyrCoJLjCpaexHooO9cIGdU8xbx
 ed+AUnBGbgwMLs+JlJxbFSx0y4UEHSE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-PKdF6z9bOhuLMwaDD1VpSw-1; Thu, 16 Jun 2022 13:32:23 -0400
X-MC-Unique: PKdF6z9bOhuLMwaDD1VpSw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A420800971;
 Thu, 16 Jun 2022 17:32:23 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.111])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EC99140E80E0;
 Thu, 16 Jun 2022 17:32:18 +0000 (UTC)
Date: Thu, 16 Jun 2022 18:32:15 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "manish.mishra" <manish.mishra@nutanix.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Het Gala <het.gala@nutanix.com>, qemu-devel@nongnu.org,
 quintela@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 eblake@redhat.com
Subject: Re: [PATCH 0/4] Multiple interface support on top of Multi-FD
Message-ID: <YqtpH/Rh0t8dm0Kd@redhat.com>
References: <20220609073305.142515-1-het.gala@nutanix.com>
 <YqIWDoSJ/xQC8Vvt@redhat.com>
 <7209116d-ef87-ee6f-5126-e23b55121f49@nutanix.com>
 <YqoMMCbF3PBnYSn/@redhat.com> <Yqovkrm37mUdggws@work-vm>
 <Yqrm6ARhSWllUDul@redhat.com>
 <4f19d641-8064-2eec-8b3f-035d4133fe46@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4f19d641-8064-2eec-8b3f-035d4133fe46@nutanix.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Thu, Jun 16, 2022 at 03:44:09PM +0530, manish.mishra wrote:
> 
> On 16/06/22 1:46 pm, Daniel P. Berrangé wrote:
> > On Wed, Jun 15, 2022 at 08:14:26PM +0100, Dr. David Alan Gilbert wrote:
> > > * Daniel P. Berrangé (berrange@redhat.com) wrote:
> > > > On Fri, Jun 10, 2022 at 05:58:31PM +0530, manish.mishra wrote:
> > > > > On 09/06/22 9:17 pm, Daniel P. Berrangé wrote:
> > > > > > On Thu, Jun 09, 2022 at 07:33:01AM +0000, Het Gala wrote:
> > > > > > > As of now, the multi-FD feature supports connection over the default network
> > > > > > > only. This Patchset series is a Qemu side implementation of providing multiple
> > > > > > > interfaces support for multi-FD. This enables us to fully utilize dedicated or
> > > > > > > multiple NICs in case bonding of NICs is not possible.
> > > > > > > 
> > > > > > > 
> > > > > > > Introduction
> > > > > > > -------------
> > > > > > > Multi-FD Qemu implementation currently supports connection only on the default
> > > > > > > network. This forbids us from advantages like:
> > > > > > > - Separating VM live migration traffic from the default network.
> > > > > Hi Daniel,
> > > > > 
> > > > > I totally understand your concern around this approach increasing compexity inside qemu,
> > > > > 
> > > > > when similar things can be done with NIC teaming. But we thought this approach provides
> > > > > 
> > > > > much more flexibility to user in few cases like.
> > > > > 
> > > > > 1. We checked our customer data, almost all of the host had multiple NIC, but LACP support
> > > > > 
> > > > >      in their setups was very rare. So for those cases this approach can help in utilise multiple
> > > > > 
> > > > >      NICs as teaming is not possible there.
> > > > AFAIK,  LACP is not required in order to do link aggregation with Linux.
> > > > Traditional Linux bonding has no special NIC hardware or switch requirements,
> > > > so LACP is merely a "nice to have" in order to simplify some aspects.
> > > > 
> > > > IOW, migration with traffic spread across multiple NICs is already
> > > > possible AFAICT.
> > > Are we sure that works with multifd?  I've seen a lot of bonding NIC
> > > setups which spread based on a hash of source/destination IP and port
> > > numbers; given that we use the same dest port and IP at the moment what
> > > happens in reality?  That hashing can be quite delicate for high
> > > bandwidth single streams.
> > The simplest Linux bonding mode does per-packet round-robin across
> > NICs, so traffic from the collection of multifd connections should
> > fill up all the NICs in the bond. There are of course other modes
> > which may be sub-optimal for the reasons you describe. Which mode
> > to pick depends on the type of service traffic patterns you're
> > aiming to balance.
> 
> My understanding on networking is not good enough so apologies in advance if something
> does not make sense. As per my understanding it is easy to do load balancing on sender
> side because we have full control where to send packet but complicated on receive side
> if we do not have LACP like support. I see there are some teaming technique which does
> load balancing of incoming traffic by possibly sending different slaves mac address on arp
> requests but that does not work for our use case and may require a complicated setup
> for proper usage. Our use case can be something like this e.g. both source and destination
> has 2-2 NICs of 10Gbps each and we want to get a throughput of 20Gbps for live migration.

I believe you are right. The Linux bonding will give us full 20 Gpbs
throughput on the transmit side, without any hardware dependancies.
On the receive side, however, there is a dependancy on the network
switch to be able to balance the traffic it forwards to the target.
This is fairly common in switches, but the typical policies based on
hashing the MAC/IP addr will not be sufficient in this case. 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


