Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7591314DE
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jan 2020 16:34:12 +0100 (CET)
Received: from localhost ([::1]:53636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioUOR-0006WU-KV
	for lists+qemu-devel@lfdr.de; Mon, 06 Jan 2020 10:34:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55037)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1ioTwP-00011y-46
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 10:05:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1ioTwN-00007E-Ta
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 10:05:13 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:45046
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1ioTwM-0008WI-RD
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 10:05:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578323110;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S5gI5+HKCZngJGsD2h9ZdORMAS15f1OiqFoglQKYm3Q=;
 b=BK5bGLEIExGxedAUwrZkwPkU7Ajfv831KfeyZR/jps1zPVE7Sfs3acIgs4HIkRKkHHDkcv
 1iXz19SbCw+7qwjVydAyCXJ6i18yzYA+Eq4q6Fg6gOBogBDWSYfSwSKVf0zdsJTy+6LAIy
 ESCnW+em/gB1c+Xr9nFjTTrQPUDfbtA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-toNXLA4pOYSmJPX5PQBQRg-1; Mon, 06 Jan 2020 10:05:09 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65738801E7A
 for <qemu-devel@nongnu.org>; Mon,  6 Jan 2020 15:05:08 +0000 (UTC)
Received: from redhat.com (unknown [10.42.16.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 06E08858BE;
 Mon,  6 Jan 2020 15:05:04 +0000 (UTC)
Date: Mon, 6 Jan 2020 15:05:05 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH 057/104] virtiofsd: add --syslog command-line option
Message-ID: <20200106150505.GU2930416@redhat.com>
References: <20191212163904.159893-1-dgilbert@redhat.com>
 <20191212163904.159893-58-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191212163904.159893-58-dgilbert@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: toNXLA4pOYSmJPX5PQBQRg-1
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

On Thu, Dec 12, 2019 at 04:38:17PM +0000, Dr. David Alan Gilbert (git) wrot=
e:
> From: Stefan Hajnoczi <stefanha@redhat.com>
>=20
> Sometimes collecting output from stderr is inconvenient or does not fit
> within the overall logging architecture.  Add syslog(3) support for
> cases where stderr cannot be used.
>=20
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> dgilbert: Reworked as a logging function
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  tools/virtiofsd/fuse_lowlevel.h  |  1 +
>  tools/virtiofsd/helper.c         |  2 ++
>  tools/virtiofsd/passthrough_ll.c | 50 ++++++++++++++++++++++++++++++--
>  tools/virtiofsd/seccomp.c        | 32 ++++++++++++++------
>  tools/virtiofsd/seccomp.h        |  4 ++-
>  5 files changed, 76 insertions(+), 13 deletions(-)

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


