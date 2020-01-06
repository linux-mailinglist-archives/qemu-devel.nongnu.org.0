Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A989C131365
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jan 2020 15:13:07 +0100 (CET)
Received: from localhost ([::1]:52264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioT7y-0005XX-IK
	for lists+qemu-devel@lfdr.de; Mon, 06 Jan 2020 09:13:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59038)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1ioT7A-000570-Cs
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 09:12:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1ioT78-0001ak-1W
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 09:12:15 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:21357
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1ioT77-0001aS-Tw
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 09:12:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578319932;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aJ2QlWkCjBFgXoxe1Ln6pdqJ6mxYPwpV11WBmiw8Jec=;
 b=EL5hBp4wrTEgXkSOOppFgMAp9t9Ei5Im/we7Jhsj/iRaj3zOFgW+Pr7x2GtaszusIvHqKr
 CSfwa19xOcbQ4gis6eHWMIo4l8DLwvy061uFI/S5u/PK12gzsFreARbiPRoHMuX3098dcZ
 0vlHmj5Y83q/E1cWBZ0gES4+5r6mC5U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-lsTwglWnNXS64sv0ufgFAg-1; Mon, 06 Jan 2020 09:12:10 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66521801E6C
 for <qemu-devel@nongnu.org>; Mon,  6 Jan 2020 14:12:09 +0000 (UTC)
Received: from redhat.com (unknown [10.42.16.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 211EA858B1;
 Mon,  6 Jan 2020 14:12:06 +0000 (UTC)
Date: Mon, 6 Jan 2020 14:12:06 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH 027/104] virtiofsd: add --fd=FDNUM fd passing option
Message-ID: <20200106141206.GD2930416@redhat.com>
References: <20191212163904.159893-1-dgilbert@redhat.com>
 <20191212163904.159893-28-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191212163904.159893-28-dgilbert@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: lsTwglWnNXS64sv0ufgFAg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 12, 2019 at 04:37:47PM +0000, Dr. David Alan Gilbert (git) wrot=
e:
> From: Stefan Hajnoczi <stefanha@redhat.com>
>=20
> Although --socket-path=3DPATH is useful for manual invocations, managemen=
t
> tools typically create the UNIX domain socket themselves and pass it to
> the vhost-user device backend.  This way QEMU can be launched
> immediately with a valid socket.  No waiting for the vhost-user device
> backend is required when fd passing is used.
>=20
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  tools/virtiofsd/fuse_i.h        |  1 +
>  tools/virtiofsd/fuse_lowlevel.c | 14 +++++++++---
>  tools/virtiofsd/fuse_virtio.c   | 39 ++++++++++++++++++++++++---------
>  3 files changed, 41 insertions(+), 13 deletions(-)

Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>


Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|


