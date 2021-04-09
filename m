Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E02359954
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 11:37:00 +0200 (CEST)
Received: from localhost ([::1]:43584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUnZT-0007RO-4X
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 05:36:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lUnXK-0006X5-8B
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 05:34:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lUnXI-0001as-Dp
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 05:34:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617960883;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=uAxFqIZ2fexvD4xRuweQzZXbA2GpUbOamoHrcE++5ic=;
 b=cz/B3ABVPIHLTrQkOVcFPVDlGyZw3dNOj8OkIWKIpj5+Ba1LWQ+0CIgTSB8911ySWWTVdq
 s1AtB8+J3gHzd2r7NnVtUcH7bZMxbtgCJHaB0QP9dBQrgihK1j8eHwd4Jjzm2Yhff54OGL
 VUGm/IKS4YXjp6ipOjp46OGCFYW+dbc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-kBTaRN1hP1KgzRL8iIoV2w-1; Fri, 09 Apr 2021 05:34:39 -0400
X-MC-Unique: kBTaRN1hP1KgzRL8iIoV2w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4A1F1020C20
 for <qemu-devel@nongnu.org>; Fri,  9 Apr 2021 09:34:38 +0000 (UTC)
Received: from redhat.com (ovpn-115-36.ams2.redhat.com [10.36.115.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DBC5510013C1;
 Fri,  9 Apr 2021 09:34:33 +0000 (UTC)
Date: Fri, 9 Apr 2021 10:34:30 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [RFC PATCH 0/5] mptcp support
Message-ID: <YHAfpndcY5GRUYgN@redhat.com>
References: <20210408191159.133644-1-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210408191159.133644-1-dgilbert@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Cc: quintela@redhat.com, armbru@redhat.com, qemu-devel@nongnu.org,
 kraxel@redhat.com, pabeni@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 08, 2021 at 08:11:54PM +0100, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Hi,
>   This RFC set adds support for multipath TCP (mptcp),
> in particular on the migration path - but should be extensible
> to other users.
> 
>   Multipath-tcp is a bit like bonding, but at L3; you can use
> it to handle failure, but can also use it to split traffic across
> multiple interfaces.
> 
>   Using a pair of 10Gb interfaces, I've managed to get 19Gbps
> (with the only tuning being using huge pages and turning the MTU up).
> 
>   It needs a bleeding-edge Linux kernel (in some older ones you get
> false accept messages for the subflows), and a C lib that has the
> constants defined (as current glibc does).
> 
>   To use it you just need to append ,mptcp to an address;
> 
>   -incoming tcp:0:4444,mptcp
>   migrate -d tcp:192.168.11.20:4444,mptcp

What happens if you only enable mptcp flag on one side of the
stream (whether client or server), does it degrade to boring
old single path TCP, or does it result in an error ?

>   I had a quick go at trying NBD as well, but I think it needs
> some work with the parsing of NBD addresses.

In theory this is applicable to anywhere that we use sockets.
Anywhere that is configured with the QAPI  SocketAddress /
SocketAddressLegacy type will get it for free AFAICT.

Anywhere that is configured via QemuOpts will need an enhancement.

IOW, I would think NBD already works if you configure NBD via
QMP with nbd-server-start, or block-export-add.  qemu-nbd will
need cli options added.

The block layer clients for NBD, Gluster, Sheepdog and SSH also
all get it for free when configured va QMP, or -blockdev AFAICT

Legacy blocklayer filename syntax would need extra parsing, or
we can just not bother and say if you want new features, use
blockdev.


Overall this is impressively simple.

It feels like it obsoletes the multifd migration code, at least
if you assume Linux platform and new enough kernel ?

Except TLS... We already bottleneck on TLS encryption with
a single FD, since userspace encryption is limited to a
single thread.

There is the KTLS feature which offloads TLS encryption/decryption
to the kernel. This benefits even regular single FD performance,
because the encrytion work can be done by the kernel in a separate
thread from the userspace IO syscalls.

Any idea if KTLS is fully compatible with MPTCP ?  If so, then that
would look like it makes it a full replacementfor multifd on Linux.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


