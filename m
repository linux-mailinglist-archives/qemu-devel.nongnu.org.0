Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4331954D173
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 21:16:58 +0200 (CEST)
Received: from localhost ([::1]:36234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1YVc-0001Dx-Tv
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 15:16:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o1YTM-00007Z-Eo
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 15:14:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o1YTJ-0007yo-5c
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 15:14:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655320471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7A8RvAtDLJpfHP9DG+nkPc9jqVo5///KyePKHqWoJ5A=;
 b=NJhzZ6l+344S9eWH6/UWqjYAwudvPXk7+XiVPkyTVuWb1FOc45C1+q7e09U1mvgoSS0a+m
 xFaPOefP1Z0RTsx0e9MN0gb/gZ6WTI8UlBXcVIW1jgunoKvtl1ofCBCiAAudiT50GKZqTT
 2lC4s9cy1X3ausZwkBxFsCgmb49asys=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-aRtyfwj7Pnq1rDbgb-ajGg-1; Wed, 15 Jun 2022 15:14:30 -0400
X-MC-Unique: aRtyfwj7Pnq1rDbgb-ajGg-1
Received: by mail-wm1-f69.google.com with SMTP id
 l4-20020a05600c1d0400b0039c60535405so5431512wms.6
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 12:14:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=7A8RvAtDLJpfHP9DG+nkPc9jqVo5///KyePKHqWoJ5A=;
 b=jNPS/B34aZXHBFZiVxmrqtI/ooEG+XHiOz84UpI1Vsf0n1oNdRXPtHmL+dW/r5j+1W
 Hsy83dykR9FYYcHBkb4OUWy6LEgIupO4UW837pJPNm8rLYc3GZRWwh6Y2Hdfn6rblP0Z
 Ytbqx4WR8H0F/oL5hFEd1PoCaezPZlEWvsEzw41Nz6kLnNZEJk6+e1921Xl6sxXdXdns
 4c7cX5VBWCk/4mnE+WCXeBBssxaroc9k9UhFJQRwv+uUYMW+Baotrt1JZhpOKxF4G1Fb
 GbBPxYstFIw7zC1Bn6ch6ayTE/sUljTmVABPeJBVrYvTea7EtskBcpJaQ5l6+iEI2NPM
 A4og==
X-Gm-Message-State: AJIora+hpHzPZYg9xhb95GNptBOKQd4Jg7SFcJizKZeFhDLmw0ZtTkJR
 GhOLY3+9G4YB+2BADk9jTxmOu95NSaFn2s7zLZJ2vsBgzSx4PmBn7hR5QAZhFXXhvNsqlfh+hzw
 cHaytd//7JqQu8x0=
X-Received: by 2002:adf:e3cf:0:b0:219:e523:905f with SMTP id
 k15-20020adfe3cf000000b00219e523905fmr1248851wrm.240.1655320469107; 
 Wed, 15 Jun 2022 12:14:29 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uuq1ICmRdCthCepxdNuBkAonHaZoJ8/T5j0Wcx6tZ/Ao/z7mPV/C/Q2Xrhr+B6UjeGx1b7fw==
X-Received: by 2002:adf:e3cf:0:b0:219:e523:905f with SMTP id
 k15-20020adfe3cf000000b00219e523905fmr1248822wrm.240.1655320468772; 
 Wed, 15 Jun 2022 12:14:28 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 j19-20020a05600c1c1300b0039c5645c60fsm8575473wms.3.2022.06.15.12.14.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 12:14:28 -0700 (PDT)
Date: Wed, 15 Jun 2022 20:14:26 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: "manish.mishra" <manish.mishra@nutanix.com>,
 Het Gala <het.gala@nutanix.com>, qemu-devel@nongnu.org,
 quintela@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 eblake@redhat.com
Subject: Re: [PATCH 0/4] Multiple interface support on top of Multi-FD
Message-ID: <Yqovkrm37mUdggws@work-vm>
References: <20220609073305.142515-1-het.gala@nutanix.com>
 <YqIWDoSJ/xQC8Vvt@redhat.com>
 <7209116d-ef87-ee6f-5126-e23b55121f49@nutanix.com>
 <YqoMMCbF3PBnYSn/@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YqoMMCbF3PBnYSn/@redhat.com>
User-Agent: Mutt/2.2.5 (2022-05-16)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> On Fri, Jun 10, 2022 at 05:58:31PM +0530, manish.mishra wrote:
> > 
> > On 09/06/22 9:17 pm, Daniel P. Berrangé wrote:
> > > On Thu, Jun 09, 2022 at 07:33:01AM +0000, Het Gala wrote:
> > > > As of now, the multi-FD feature supports connection over the default network
> > > > only. This Patchset series is a Qemu side implementation of providing multiple
> > > > interfaces support for multi-FD. This enables us to fully utilize dedicated or
> > > > multiple NICs in case bonding of NICs is not possible.
> > > > 
> > > > 
> > > > Introduction
> > > > -------------
> > > > Multi-FD Qemu implementation currently supports connection only on the default
> > > > network. This forbids us from advantages like:
> > > > - Separating VM live migration traffic from the default network.
> > 
> > Hi Daniel,
> > 
> > I totally understand your concern around this approach increasing compexity inside qemu,
> > 
> > when similar things can be done with NIC teaming. But we thought this approach provides
> > 
> > much more flexibility to user in few cases like.
> > 
> > 1. We checked our customer data, almost all of the host had multiple NIC, but LACP support
> > 
> >     in their setups was very rare. So for those cases this approach can help in utilise multiple
> > 
> >     NICs as teaming is not possible there.
> 
> AFAIK,  LACP is not required in order to do link aggregation with Linux.
> Traditional Linux bonding has no special NIC hardware or switch requirements,
> so LACP is merely a "nice to have" in order to simplify some aspects.
> 
> IOW, migration with traffic spread across multiple NICs is already
> possible AFAICT.

Are we sure that works with multifd?  I've seen a lot of bonding NIC
setups which spread based on a hash of source/destination IP and port
numbers; given that we use the same dest port and IP at the moment what
happens in reality?  That hashing can be quite delicate for high
bandwidth single streams.

> I can understand that some people may not have actually configured
> bonding on their hosts, but it is not unreasonable to request that
> they do so, if they want to take advantage fo aggrated bandwidth.
> 
> It has the further benefit that it will be fault tolerant. With
> this proposal if any single NIC has a problem, the whole migration
> will get stuck. With kernel level bonding, if any single NIC haus
> a problem, it'll get offlined by the kernel and migration will
> continue to  work across remaining active NICs.
> 
> > 2. We have seen requests recently to separate out traffic of storage, VM netwrok, migration
> > 
> >     over different vswitch which can be backed by 1 or more NICs as this give better
> > 
> >     predictability and assurance. So host with multiple ips/vswitches can be very common
> > 
> >     environment. In this kind of enviroment this approach gives per vm or migration level
> > 
> >     flexibilty, like for critical VM we can still use bandwidth from all available vswitch/interface
> > 
> >     but for normal VM they can keep live migration only on dedicated NICs without changing
> > 
> >     complete host network topology.
> > 
> >     At final we want it to be something like this [<ip-pair>, <multiFD-channels>, <bandwidth_control>]
> > 
> >     to provide bandwidth_control per interface.
> 
> Again, it is already possible to separate migration traffic from storage
> traffic, from other network traffic. The target IP given will influence
> which NIC is used based on routing table and I know this is already
> done widely with OpenStack deployments.
> 
> > 3. Dedicated NIC we mentioned as a use case, agree with you it can be done without this
> > 
> >     approach too.
> 
> 
> > > > Multi-interface with Multi-FD
> > > > -----------------------------
> > > > Multiple-interface support over basic multi-FD has been implemented in the
> > > > patches. Advantages of this implementation are:
> > > > - Able to separate live migration traffic from default network interface by
> > > >    creating multiFD channels on ip addresses of multiple non-default interfaces.
> > > > - Can optimize the number of multi-FD channels on a particular interface
> > > >    depending upon the network bandwidth limit on a particular interface.
> > > Manually assigning individual channels to different NICs is a pretty
> > > inefficient way to optimizing traffic. Feels like you could easily get
> > > into a situation where one NIC ends up idle while the other is busy,
> > > especially if the traffic patterns are different. For example with
> > > post-copy there's an extra channel for OOB async page requests, and
> > > its far from clear that manually picking NICs per chanel upfront is
> > > going work for that.  The kernel can continually dynamically balance
> > > load on the fly and so do much better than any static mapping QEMU
> > > tries to apply, especially if there are multiple distinct QEMU's
> > > competing for bandwidth.
> > > 
> > Yes, Daniel current solution is only for pre-copy. As with postcopy
> > multiFD is not yet supported but in future we can extend it for postcopy

I had been thinking about explicit selection of network device for NUMA
use though; ideally I'd like to be able to associate a set of multifd
threads to each NUMA node, and then associate a NIC with that set of
threads; so that the migration happens down the NIC that's on the node
the RAM is on.  On a really good day you'd have one NIC per top level
NUMA node.

> > channels too.
> > 
> > > > Implementation
> > > > --------------
> > > > 
> > > > Earlier the 'migrate' qmp command:
> > > > { "execute": "migrate", "arguments": { "uri": "tcp:0:4446" } }
> > > > 
> > > > Modified qmp command:
> > > > { "execute": "migrate",
> > > >               "arguments": { "uri": "tcp:0:4446", "multi-fd-uri-list": [ {
> > > >               "source-uri": "tcp::6900", "destination-uri": "tcp:0:4480",
> > > >               "multifd-channels": 4}, { "source-uri": "tcp:10.0.0.0: ",
> > > >               "destination-uri": "tcp:11.0.0.0:7789",
> > > >               "multifd-channels": 5} ] } }
> > > > ------------------------------------------------------------------------------
> > > > 
> > > > Earlier the 'migrate-incoming' qmp command:
> > > > { "execute": "migrate-incoming", "arguments": { "uri": "tcp::4446" } }
> > > > 
> > > > Modified 'migrate-incoming' qmp command:
> > > > { "execute": "migrate-incoming",
> > > >              "arguments": {"uri": "tcp::6789",
> > > >              "multi-fd-uri-list" : [ {"destination-uri" : "tcp::6900",
> > > >              "multifd-channels": 4}, {"destination-uri" : "tcp:11.0.0.0:7789",
> > > >              "multifd-channels": 5} ] } }
> > > > ------------------------------------------------------------------------------
> > > These examples pretty nicely illustrate my concern with this
> > > proposal. It is making QEMU configuration of migration
> > > massively more complicated, while duplicating functionality
> > > the kernel can provide via NIC teaming, but without having
> > > ability to balance it on the fly as the kernel would.
> > 
> > Yes, agree Daniel this raises complexity but we will make sure that it does not
> > 
> > change/imapct anything existing and we provide new options as optional.
> 
> The added code is certainly going to impact ongoing maint of QEMU I/O
> layer and migration in particular. I'm not convinced this complexity
> is compelling enough compared to leveraging kernel native bonding
> to justify the maint burden it will impose.

Dave

> With regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


