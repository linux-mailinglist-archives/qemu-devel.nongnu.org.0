Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B25D035C94A
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 16:57:37 +0200 (CEST)
Received: from localhost ([::1]:38738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVy0O-00041Q-QS
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 10:57:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lVxzH-0003AW-37
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 10:56:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lVxzB-0003FT-DL
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 10:56:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618239380;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GaKqEho0w3Cyrd8oqQZ6A6WpZ9tepiqQ03pfFga6bW4=;
 b=a+F5IfmZqIsYeP5jvxnX5bRp2VnsJPsNHGNaObFW85O8/uj5+4tl9x5vJgUSMP6lS5zQPC
 bAPDSXzWShlE92czebxZwv2CPrxJMl6jgHfEP0i1oryMTq49wkYPnAIlW69RR7dqfib/sf
 6cVzdnm5RGEgOjt8XEiTw0zPdZ2B1Zg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-3hHOS7lsOeu6QAbuq26YjQ-1; Mon, 12 Apr 2021 10:56:18 -0400
X-MC-Unique: 3hHOS7lsOeu6QAbuq26YjQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8FAF4100A609
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 14:56:17 +0000 (UTC)
Received: from redhat.com (ovpn-115-78.ams2.redhat.com [10.36.115.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 616C519D9D;
 Mon, 12 Apr 2021 14:56:11 +0000 (UTC)
Date: Mon, 12 Apr 2021 15:56:08 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [RFC PATCH 0/5] mptcp support
Message-ID: <YHRfiHiR0D/vvbc2@redhat.com>
References: <20210408191159.133644-1-dgilbert@redhat.com>
 <YHAfpndcY5GRUYgN@redhat.com> <YHReXk6Hv7qF0Oqz@work-vm>
MIME-Version: 1.0
In-Reply-To: <YHReXk6Hv7qF0Oqz@work-vm>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

On Mon, Apr 12, 2021 at 03:51:10PM +0100, Dr. David Alan Gilbert wrote:
> * Daniel P. Berrangé (berrange@redhat.com) wrote:
> > On Thu, Apr 08, 2021 at 08:11:54PM +0100, Dr. David Alan Gilbert (git) wrote:
> > > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > > 
> > > Hi,
> > >   This RFC set adds support for multipath TCP (mptcp),
> > > in particular on the migration path - but should be extensible
> > > to other users.
> > > 
> > >   Multipath-tcp is a bit like bonding, but at L3; you can use
> > > it to handle failure, but can also use it to split traffic across
> > > multiple interfaces.
> > > 
> > >   Using a pair of 10Gb interfaces, I've managed to get 19Gbps
> > > (with the only tuning being using huge pages and turning the MTU up).
> > > 
> > >   It needs a bleeding-edge Linux kernel (in some older ones you get
> > > false accept messages for the subflows), and a C lib that has the
> > > constants defined (as current glibc does).
> > > 
> > >   To use it you just need to append ,mptcp to an address;
> > > 
> > >   -incoming tcp:0:4444,mptcp
> > >   migrate -d tcp:192.168.11.20:4444,mptcp
> > 
> > What happens if you only enable mptcp flag on one side of the
> > stream (whether client or server), does it degrade to boring
> > old single path TCP, or does it result in an error ?
> 
> I've just tested this and it matches what pabeni said; it seems to just
> fall back.
> 
> > >   I had a quick go at trying NBD as well, but I think it needs
> > > some work with the parsing of NBD addresses.
> > 
> > In theory this is applicable to anywhere that we use sockets.
> > Anywhere that is configured with the QAPI  SocketAddress /
> > SocketAddressLegacy type will get it for free AFAICT.
> 
> That was my hope.
> 
> > Anywhere that is configured via QemuOpts will need an enhancement.
> > 
> > IOW, I would think NBD already works if you configure NBD via
> > QMP with nbd-server-start, or block-export-add.  qemu-nbd will
> > need cli options added.
> > 
> > The block layer clients for NBD, Gluster, Sheepdog and SSH also
> > all get it for free when configured va QMP, or -blockdev AFAICT
> 
> Have you got some examples via QMP?
> I'd failed trying -drive if=virtio,file=nbd://192.168.11.20:3333,mptcp=on/zero

I never remember the mapping to blockdev QAPI schema, especially
when using legacy filename syntax with the URI.

Try instead

 -blockdev driver=nbd,host=192.168.11.20,port=3333,mptcp=on,id=disk0backend
 -device virtio-blk,drive=disk0backend,id=disk0



Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


