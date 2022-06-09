Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 649AC54517B
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 18:02:22 +0200 (CEST)
Received: from localhost ([::1]:49884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzKc1-00089A-DO
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 12:02:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nzKNk-0002TJ-8I
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:47:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nzKNh-0004oF-1F
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:47:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654789651;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vGMlSre4zoL6pnGeGEynhVZoVF9px301czbzeDKfMRs=;
 b=XRVdhC0AGWVuwwp0czR49Y6HkbgSVjnwC//HOJWJxk16U/MDELP0xtYmvyrbNENqdtHfKs
 YB1leciD4RtHyBHX4TWcsqEpAUQSfwh8TOaE6hf0Dz4wKRyuRa6b4h8P+M+fdHYY2PNI5o
 A49ZRG4HamMoiaRIdQsCTi+GQJ73k6c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-510-GWdI1OhHPmqMRuO8ZhDqAQ-1; Thu, 09 Jun 2022 11:47:29 -0400
X-MC-Unique: GWdI1OhHPmqMRuO8ZhDqAQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 99939101AA46;
 Thu,  9 Jun 2022 15:47:29 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D58E40CFD0A;
 Thu,  9 Jun 2022 15:47:28 +0000 (UTC)
Date: Thu, 9 Jun 2022 16:47:26 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Het Gala <het.gala@nutanix.com>
Cc: qemu-devel@nongnu.org, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, armbru@redhat.com, eblake@redhat.com
Subject: Re: [PATCH 0/4] Multiple interface support on top of Multi-FD
Message-ID: <YqIWDoSJ/xQC8Vvt@redhat.com>
References: <20220609073305.142515-1-het.gala@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220609073305.142515-1-het.gala@nutanix.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

On Thu, Jun 09, 2022 at 07:33:01AM +0000, Het Gala wrote:
> 
> As of now, the multi-FD feature supports connection over the default network
> only. This Patchset series is a Qemu side implementation of providing multiple
> interfaces support for multi-FD. This enables us to fully utilize dedicated or
> multiple NICs in case bonding of NICs is not possible.
> 
> 
> Introduction
> -------------
> Multi-FD Qemu implementation currently supports connection only on the default
> network. This forbids us from advantages like:
> - Separating VM live migration traffic from the default network.

Perhaps I'm mis-understanding your intent here, but AFAIK it
has been possible to separate VM migration traffic from general
host network traffic essentially forever.

If you have two NICs with IP addresses on different subnets,
then the kernel will pick which NIC to use automatically
based on the IP address of the target matching the kernel
routing table entries.

Management apps have long used this ability in order to
control which NIC migration traffic flows over.

> - Fully utilize all NICs’ capacity in cases where creating a LACP bond (Link
>   Aggregation Control Protocol) is not supported.

Can you elaborate on scenarios in which it is impossible to use LACP
bonding at the kernel level ?

> Multi-interface with Multi-FD
> -----------------------------
> Multiple-interface support over basic multi-FD has been implemented in the
> patches. Advantages of this implementation are:
> - Able to separate live migration traffic from default network interface by
>   creating multiFD channels on ip addresses of multiple non-default interfaces.
> - Can optimize the number of multi-FD channels on a particular interface
>   depending upon the network bandwidth limit on a particular interface.

Manually assigning individual channels to different NICs is a pretty
inefficient way to optimizing traffic. Feels like you could easily get
into a situation where one NIC ends up idle while the other is busy,
especially if the traffic patterns are different. For example with
post-copy there's an extra channel for OOB async page requests, and
its far from clear that manually picking NICs per chanel upfront is
going work for that.  The kernel can continually dynamically balance
load on the fly and so do much better than any static mapping QEMU
tries to apply, especially if there are multiple distinct QEMU's
competing for bandwidth.


> Implementation
> --------------
> 
> Earlier the 'migrate' qmp command:
> { "execute": "migrate", "arguments": { "uri": "tcp:0:4446" } }
> 
> Modified qmp command:
> { "execute": "migrate",
>              "arguments": { "uri": "tcp:0:4446", "multi-fd-uri-list": [ {
>              "source-uri": "tcp::6900", "destination-uri": "tcp:0:4480",
>              "multifd-channels": 4}, { "source-uri": "tcp:10.0.0.0: ",
>              "destination-uri": "tcp:11.0.0.0:7789",
>              "multifd-channels": 5} ] } }

> ------------------------------------------------------------------------------
> 
> Earlier the 'migrate-incoming' qmp command:
> { "execute": "migrate-incoming", "arguments": { "uri": "tcp::4446" } }
> 
> Modified 'migrate-incoming' qmp command:
> { "execute": "migrate-incoming",
>             "arguments": {"uri": "tcp::6789",
>             "multi-fd-uri-list" : [ {"destination-uri" : "tcp::6900",
>             "multifd-channels": 4}, {"destination-uri" : "tcp:11.0.0.0:7789",
>             "multifd-channels": 5} ] } }
> ------------------------------------------------------------------------------

These examples pretty nicely illustrate my concern with this
proposal. It is making QEMU configuration of migration
massively more complicated, while duplicating functionality
the kernel can provide via NIC teaming, but without having
ability to balance it on the fly as the kernel would.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


