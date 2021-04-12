Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A1E35C929
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 16:49:38 +0200 (CEST)
Received: from localhost ([::1]:53218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVxsf-0006To-OM
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 10:49:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lVxpr-0005MH-0h
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 10:46:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lVxpn-0006Vo-3m
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 10:46:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618238795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AOS5CoWPjLwIy2L/mTSlBXvIoOnh3t8bBnJFy9pwhcM=;
 b=fBY1bpRPH/XyQgvl4i16Dn38pk1/QWfusACgNxtA9altczKzOWYYEw1FXR8oNCOtWBhwDj
 NU2uaEGLP/UU6iGvh11qc/zY9D5jQWW5tYJv2NqXzJdiDpwse8CQS/yMJnFiDR0pBgkT7x
 TxG2DzgkevnSS6evA6+xPZH/UJtOc7U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-FN860LINM6elbROeClB5pQ-1; Mon, 12 Apr 2021 10:46:30 -0400
X-MC-Unique: FN860LINM6elbROeClB5pQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0EF010CE78C
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 14:46:28 +0000 (UTC)
Received: from work-vm (ovpn-115-48.ams2.redhat.com [10.36.115.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C8FF810023AF;
 Mon, 12 Apr 2021 14:46:23 +0000 (UTC)
Date: Mon, 12 Apr 2021 15:46:21 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [RFC PATCH 0/5] mptcp support
Message-ID: <YHRdPcv8nDn7ybPL@work-vm>
References: <20210408191159.133644-1-dgilbert@redhat.com>
 <YHAfpndcY5GRUYgN@redhat.com> <YHAhi0YQcZdnsOvl@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YHAhi0YQcZdnsOvl@redhat.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
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
Cc: qemu-devel@nongnu.org, pabeni@redhat.com, kraxel@redhat.com,
 armbru@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> On Fri, Apr 09, 2021 at 10:34:30AM +0100, Daniel P. Berrangé wrote:
> > On Thu, Apr 08, 2021 at 08:11:54PM +0100, Dr. David Alan Gilbert (git) wrote:
> > > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > >   I had a quick go at trying NBD as well, but I think it needs
> > > some work with the parsing of NBD addresses.
> > 
> > In theory this is applicable to anywhere that we use sockets.
> > Anywhere that is configured with the QAPI  SocketAddress /
> > SocketAddressLegacy type will get it for free AFAICT.
> 
> The caveat is any servers which share the problem of prematurely
> closing the listener socket that you fixed here for migration.

Right, this varies depending on the server semantics; migration is only
expecting a single connection so shut it immediately; nbd is already
wired to expect multiple connections.

Dave

> 
> Regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


