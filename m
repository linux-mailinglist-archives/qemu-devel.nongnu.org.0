Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 782E612F9E1
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jan 2020 16:35:51 +0100 (CET)
Received: from localhost ([::1]:53604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1inOzO-0002lN-Jo
	for lists+qemu-devel@lfdr.de; Fri, 03 Jan 2020 10:35:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38397)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1inOyO-00027H-Fg
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 10:34:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1inOyN-0007sD-7q
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 10:34:48 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:45262
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1inOyN-0007pg-11
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 10:34:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578065686;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fW83AF5s9MS2Il+fBI2wjzkI6dduqzipv3vYTqTMi18=;
 b=K8FX5bXaAokJAqY7r3hPjfJmzcG7bv5tI88r9fQwwBgG9tsXga9EeRG/ONmm5H6+y4rcd4
 vFUFNaPF8oAMeHcBm6WomG1ns7lR1JUmuaT4WpkScf9FUCCiQwFRR5ARr7C4uCyO3SQci+
 hVzZm71jZJoe9ESmxHwtEJ5vDtfjl5A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-gtQJFhHdO_iTXBTdf4C29g-1; Fri, 03 Jan 2020 10:34:44 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3EAD4107ACC7
 for <qemu-devel@nongnu.org>; Fri,  3 Jan 2020 15:34:43 +0000 (UTC)
Received: from redhat.com (ovpn-112-41.ams2.redhat.com [10.36.112.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D6955D9C5;
 Fri,  3 Jan 2020 15:34:39 +0000 (UTC)
Date: Fri, 3 Jan 2020 15:34:35 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH 022/104] virtiofsd: Start reading commands from queue
Message-ID: <20200103153435.GP2753983@redhat.com>
References: <20191212163904.159893-1-dgilbert@redhat.com>
 <20191212163904.159893-23-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191212163904.159893-23-dgilbert@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: gtQJFhHdO_iTXBTdf4C29g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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

On Thu, Dec 12, 2019 at 04:37:42PM +0000, Dr. David Alan Gilbert (git) wrot=
e:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>=20
> Pop queue elements off queues, copy the data from them and
> pass that to fuse.
>=20
>   Note: 'out' in a VuVirtqElement is from QEMU
>         'in' in libfuse is into the daemon
>=20
>   So we read from the out iov's to get a fuse_in_header
>=20
> When we get a kick we've got to read all the elements until the queue
> is empty.
>=20
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  tools/virtiofsd/fuse_i.h      |   2 +
>  tools/virtiofsd/fuse_virtio.c | 100 +++++++++++++++++++++++++++++++++-
>  2 files changed, 99 insertions(+), 3 deletions(-)

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


