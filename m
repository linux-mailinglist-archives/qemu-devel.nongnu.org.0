Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 168F012F7E7
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jan 2020 13:02:34 +0100 (CET)
Received: from localhost ([::1]:51418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1inLez-0005Iq-6I
	for lists+qemu-devel@lfdr.de; Fri, 03 Jan 2020 07:02:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55235)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1inLdx-0004iW-6B
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 07:01:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1inLdv-00042l-Ry
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 07:01:29 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:37538
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1inLdv-0003pP-Ih
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 07:01:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578052880;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ydKzDZ7+BQ9GGP4QDSc2BHtA1WD49CSiiXY/zQ/A9dk=;
 b=aDQ1YQrHuqxgyGWlQzBNLOLkrL/LwDhChx8PPsGQClF69P3Ukp3qgyi3bs7AADyd1zFTfh
 CzEOu66v7HavL/8iH57HMvV4F2PZn7HAJrJ22TmGP6cibDtZMxXrQ6NxyYwGS47utuGNZM
 nbskEwHQUjum2RDKoPXruHuuaQrp7Dk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-IN7AkT0NNbiThqyL9Q-cdQ-1; Fri, 03 Jan 2020 07:01:18 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9B7B100550E
 for <qemu-devel@nongnu.org>; Fri,  3 Jan 2020 12:01:17 +0000 (UTC)
Received: from redhat.com (ovpn-112-41.ams2.redhat.com [10.36.112.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C6875C28C;
 Fri,  3 Jan 2020 12:01:11 +0000 (UTC)
Date: Fri, 3 Jan 2020 12:01:09 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH 005/104] virtiofsd: Add passthrough_ll
Message-ID: <20200103120109.GK2753983@redhat.com>
References: <20191212163904.159893-1-dgilbert@redhat.com>
 <20191212163904.159893-6-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191212163904.159893-6-dgilbert@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: IN7AkT0NNbiThqyL9Q-cdQ-1
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

On Thu, Dec 12, 2019 at 04:37:25PM +0000, Dr. David Alan Gilbert (git) wrot=
e:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>=20
> passthrough_ll is one of the examples in the upstream fuse project
> and is the main part of our daemon here.  It passes through requests
> from fuse to the underlying filesystem, using syscalls as directly
> as possible.
>=20
> From libfuse fuse-3.8.0
>=20
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  tools/virtiofsd/passthrough_ll.c | 1338 ++++++++++++++++++++++++++++++
>  1 file changed, 1338 insertions(+)
>  create mode 100644 tools/virtiofsd/passthrough_ll.c
>=20
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrou=
gh_ll.c
> new file mode 100644
> index 0000000000..5372d02934
> --- /dev/null
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -0,0 +1,1338 @@
> +/*
> +  FUSE: Filesystem in Userspace
> +  Copyright (C) 2001-2007  Miklos Szeredi <miklos@szeredi.hu>
> +
> +  This program can be distributed under the terms of the GNU GPL.

I presume this mistake exists in upstream fuse GIT - missing GPL version
number info here. This is important to correct since we're moving code
from another repo and thus the COPYING file it is referring to on the
next line is ambiguous to the casual reader.

> +  See the file COPYING.
> +*/

With the GPL version info added:

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


