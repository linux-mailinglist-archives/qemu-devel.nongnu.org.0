Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 453CD12F803
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jan 2020 13:13:22 +0100 (CET)
Received: from localhost ([::1]:51518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1inLpR-0002Qv-BC
	for lists+qemu-devel@lfdr.de; Fri, 03 Jan 2020 07:13:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47588)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1inLod-0001n7-50
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 07:12:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1inLob-0000FM-U6
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 07:12:30 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40677
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1inLob-0000Bo-NM
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 07:12:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578053549;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/4CLqKTCLu78exW9x/n/4YKNGPL6DkQciV31kABCKjM=;
 b=b9ax+OeX1RycJ8BDNrn4R4PJ1g4BiHPwafhtwK5yRSA2q6cSz3OoS7JFIuUv4BnjZSb9KX
 xlRYKBpbfDhaDWP5z4b75nMYJU1Q0czY1r/+933CC1rak1ityvs566pK4jhmDJqC8TX39d
 Sbrlq6qJ9AsRzca4zOMegUUC7SzaLCc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-LYtpdodcP2qXx78j7tpq8A-1; Fri, 03 Jan 2020 07:12:27 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 077A518A8C80
 for <qemu-devel@nongnu.org>; Fri,  3 Jan 2020 12:12:27 +0000 (UTC)
Received: from redhat.com (ovpn-112-41.ams2.redhat.com [10.36.112.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A197C5D9C9;
 Fri,  3 Jan 2020 12:12:20 +0000 (UTC)
Date: Fri, 3 Jan 2020 12:12:17 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH 008/104] virtiofsd: remove mountpoint dummy argument
Message-ID: <20200103121217.GN2753983@redhat.com>
References: <20191212163904.159893-1-dgilbert@redhat.com>
 <20191212163904.159893-9-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191212163904.159893-9-dgilbert@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: LYtpdodcP2qXx78j7tpq8A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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

On Thu, Dec 12, 2019 at 04:37:28PM +0000, Dr. David Alan Gilbert (git) wrot=
e:
> From: Stefan Hajnoczi <stefanha@redhat.com>
>=20
> Classic FUSE file system daemons take a mountpoint argument but
> virtiofsd exposes a vhost-user UNIX domain socket instead.  The
> mountpoint argument is not used by virtiofsd but the user is still
> required to pass a dummy argument on the command-line.
>=20
> Remove the mountpoint argument to clean up the command-line.
>=20
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  tools/virtiofsd/fuse_lowlevel.c  |  2 +-
>  tools/virtiofsd/fuse_lowlevel.h  |  4 +---
>  tools/virtiofsd/helper.c         | 20 +++-----------------
>  tools/virtiofsd/passthrough_ll.c | 12 ++----------
>  4 files changed, 7 insertions(+), 31 deletions(-)

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


