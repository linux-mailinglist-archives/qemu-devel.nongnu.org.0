Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E881854E66A
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 17:53:16 +0200 (CEST)
Received: from localhost ([::1]:47942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1ro3-0008Aq-KZ
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 11:53:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o1rlz-0007TW-Tn
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 11:51:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o1rlw-00045M-U9
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 11:51:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655394664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ypPsvZ/mHH1Gp75/vO9ffXH67chUR84jBqSUO/Lh5gA=;
 b=JYMDZ3DG75JGn7JvZtqZ9Mw4WeSPhPr5HpSQ8g9GhMyxxoaFgOelfb7zbeO2whApSVcv+a
 TLPFgyPe0SRuteoyJRiDZIj4gu3HGOClbJrU3unl86FCsnYz29muFYRJs/TqycZU+K+7ot
 I4BUhZubghHuxCKOc6WfyevVrZjaP2w=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-444-_vyURPEyO-yJbkmqjkNyxQ-1; Thu, 16 Jun 2022 11:51:02 -0400
X-MC-Unique: _vyURPEyO-yJbkmqjkNyxQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 p6-20020a05600c358600b0039c873184b9so1071616wmq.4
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 08:51:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=ypPsvZ/mHH1Gp75/vO9ffXH67chUR84jBqSUO/Lh5gA=;
 b=feyUpSBPILf/Ikj/LhUYxv2uHL7H9zDSBfXxCFsw6VIarTTx7p5wK+8VOknH5ZBodI
 /QC94yRB1Podhphi/+ENpJFDEx1OAqOVJKsRdk5TJ+O2Hnr3gYprlrsgV85aI8CgBIA5
 sT8c7icl7uqpZjZDb81S4x5CWN7xMbAkSN6pw5m8sp2siZSoPjScpsSv6JvfGGMJ1zvt
 2BorZ9vTV/Xe4hfvWJBmLRULZv5q/g4E5/Nfk5nu4PZRxp6Qez7tgG1LqI+aIwRMqnNJ
 1DwXUWtgNnMz+P4Zpr4C/FWvERNPdcO1MykybtbdSaDpKsa43/RqKI3rDFoelxLz6UEn
 Nu3g==
X-Gm-Message-State: AJIora+Itg8n2Y5nVCUkmL9je+fEb4JyaJKcNeMM7tMq9wvrG/ZKT386
 UY2R/ICkBp00CJFT2NTX910IW/ziKjw9kDmR95wcv6jZdptnBSFmxtclJa2OsvE8nzm+0PXcrsv
 wNL/IMX7+WoZDSJ0=
X-Received: by 2002:a05:600c:acf:b0:39c:56ea:2121 with SMTP id
 c15-20020a05600c0acf00b0039c56ea2121mr5685443wmr.39.1655394661719; 
 Thu, 16 Jun 2022 08:51:01 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1saXD2Sz2imaMbm43PhJL7tsJ/EINC26txabbndpKqL9jcFQnTvjSVwOcUrHcek4HbXb36NPw==
X-Received: by 2002:a05:600c:acf:b0:39c:56ea:2121 with SMTP id
 c15-20020a05600c0acf00b0039c56ea2121mr5685412wmr.39.1655394661486; 
 Thu, 16 Jun 2022 08:51:01 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 u9-20020a5d4349000000b0021004d7d75asm2326957wrr.84.2022.06.16.08.51.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 08:51:00 -0700 (PDT)
Date: Thu, 16 Jun 2022 16:50:58 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: "manish.mishra" <manish.mishra@nutanix.com>,
 Het Gala <het.gala@nutanix.com>, qemu-devel@nongnu.org,
 quintela@redhat.com, pbonzini@redhat.com, armbru@redhat.com,
 eblake@redhat.com
Subject: Re: [PATCH 0/4] Multiple interface support on top of Multi-FD
Message-ID: <YqtRYs1wGEQR4wfo@work-vm>
References: <20220609073305.142515-1-het.gala@nutanix.com>
 <YqIWDoSJ/xQC8Vvt@redhat.com>
 <7209116d-ef87-ee6f-5126-e23b55121f49@nutanix.com>
 <YqoMMCbF3PBnYSn/@redhat.com> <YqrpVRJazpbMz/HE@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YqrpVRJazpbMz/HE@redhat.com>
User-Agent: Mutt/2.2.5 (2022-05-16)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> On Wed, Jun 15, 2022 at 05:43:28PM +0100, Daniel P. Berrangé wrote:
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
> > 
> > I can understand that some people may not have actually configured
> > bonding on their hosts, but it is not unreasonable to request that
> > they do so, if they want to take advantage fo aggrated bandwidth.
> > 
> > It has the further benefit that it will be fault tolerant. With
> > this proposal if any single NIC has a problem, the whole migration
> > will get stuck. With kernel level bonding, if any single NIC haus
> > a problem, it'll get offlined by the kernel and migration will
> > continue to  work across remaining active NICs.
> > 
> > > 2. We have seen requests recently to separate out traffic of storage, VM netwrok, migration
> > > 
> > >     over different vswitch which can be backed by 1 or more NICs as this give better
> > > 
> > >     predictability and assurance. So host with multiple ips/vswitches can be very common
> > > 
> > >     environment. In this kind of enviroment this approach gives per vm or migration level
> > > 
> > >     flexibilty, like for critical VM we can still use bandwidth from all available vswitch/interface
> > > 
> > >     but for normal VM they can keep live migration only on dedicated NICs without changing
> > > 
> > >     complete host network topology.
> > > 
> > >     At final we want it to be something like this [<ip-pair>, <multiFD-channels>, <bandwidth_control>]
> > > 
> > >     to provide bandwidth_control per interface.
> > 
> > Again, it is already possible to separate migration traffic from storage
> > traffic, from other network traffic. The target IP given will influence
> > which NIC is used based on routing table and I know this is already
> > done widely with OpenStack deployments.
> 
> Actually I should clarify this is only practical if the two NICs are
> using different IP subnets, otherwise routing rules are not viable.
> So needing to set source IP would be needed to select between a pair
> of NICs on the same IP subnet.

Yeh so I think that's one reason that the idea in this series is OK
(together with the idea for the NUMA stuff) and I suspect there are
other cases as well.

Dave

> Previous usage I've seen has always setup fully distinct IP subnets
> for generic vs storage vs migration network traffic.
> 
> With regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


