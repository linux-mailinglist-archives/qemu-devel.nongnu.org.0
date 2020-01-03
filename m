Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C41112F7DF
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jan 2020 12:58:53 +0100 (CET)
Received: from localhost ([::1]:51374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1inLbQ-0002Q4-4j
	for lists+qemu-devel@lfdr.de; Fri, 03 Jan 2020 06:58:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39158)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1inLaV-0001ss-7l
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 06:57:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1inLaU-0006tR-2I
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 06:57:55 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:58299
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1inLaT-0006pP-Qh
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 06:57:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578052673;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cezlc9G0T77xn2cUcpU/6UXJa9mWZsTyfKDIIgJpcmw=;
 b=FwEou5+ArB4Bi/kozkMWEs5KRihQnkkS646bJiyHBPOYPdxxyD/c31km0mmSgBtebPWFk8
 N9I846Cs7RrHJIicB6B3fWVfSpnAWDkDRf+dMu+R7JYvSNlu8zyzzkLfZK2144ZtY55jXR
 9b2Wvjl5AP7ugyPnZjxWuXIDjOdCPoo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-87-iqEtjJYTO4awK0qljH6WdA-1; Fri, 03 Jan 2020 06:57:49 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 169FE100551A
 for <qemu-devel@nongnu.org>; Fri,  3 Jan 2020 11:57:48 +0000 (UTC)
Received: from redhat.com (ovpn-112-41.ams2.redhat.com [10.36.112.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F92E6609E;
 Fri,  3 Jan 2020 11:57:44 +0000 (UTC)
Date: Fri, 3 Jan 2020 11:57:41 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH 003/104] virtiofsd: Add auxiliary .c's
Message-ID: <20200103115741.GI2753983@redhat.com>
References: <20191212163904.159893-1-dgilbert@redhat.com>
 <20191212163904.159893-4-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191212163904.159893-4-dgilbert@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: iqEtjJYTO4awK0qljH6WdA-1
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

On Thu, Dec 12, 2019 at 04:37:23PM +0000, Dr. David Alan Gilbert (git) wrot=
e:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>=20
> Add most of the non-main .c files we need from upstream fuse-3.8.0
>=20
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  tools/virtiofsd/buffer.c       | 321 ++++++++++++++++++++++++
>  tools/virtiofsd/fuse_log.c     |  40 +++
>  tools/virtiofsd/fuse_loop_mt.c | 362 +++++++++++++++++++++++++++
>  tools/virtiofsd/fuse_opt.c     | 423 +++++++++++++++++++++++++++++++
>  tools/virtiofsd/fuse_signals.c |  91 +++++++
>  tools/virtiofsd/helper.c       | 440 +++++++++++++++++++++++++++++++++
>  6 files changed, 1677 insertions(+)
>  create mode 100644 tools/virtiofsd/buffer.c
>  create mode 100644 tools/virtiofsd/fuse_log.c
>  create mode 100644 tools/virtiofsd/fuse_loop_mt.c
>  create mode 100644 tools/virtiofsd/fuse_opt.c
>  create mode 100644 tools/virtiofsd/fuse_signals.c
>  create mode 100644 tools/virtiofsd/helper.c

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


