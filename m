Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B71312F7EB
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jan 2020 13:03:39 +0100 (CET)
Received: from localhost ([::1]:51428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1inLg2-0006X9-Ft
	for lists+qemu-devel@lfdr.de; Fri, 03 Jan 2020 07:03:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60764)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1inLf5-0005xp-Ch
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 07:02:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1inLf4-0000ih-7K
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 07:02:39 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:29225
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1inLf4-0000e8-1c
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 07:02:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578052957;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ECA4S8IqLXsIp461ajOKyBSzYkWukIzaX9LKIzzVgDw=;
 b=NvJ0mB+e4gcV7fPCYcG52PlMoP7URvrbgeyNs10kCMSOc1Ntdr/W1T31pZWh4JxNl8WeqR
 UpiG3IOHHvBN3tl9OzKkbX5OgMK2FKalxCloD4aZOVQNctdpHTWIpcmCO2G05tR7Jp4pGs
 9tD6amN4/rpxY+nBJ3REchxt6ppGcFU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-eaJplqDOPnGxF75s926VSQ-1; Fri, 03 Jan 2020 07:02:36 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CD62801E70
 for <qemu-devel@nongnu.org>; Fri,  3 Jan 2020 12:02:35 +0000 (UTC)
Received: from redhat.com (ovpn-112-41.ams2.redhat.com [10.36.112.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 27E73101F942;
 Fri,  3 Jan 2020 12:02:30 +0000 (UTC)
Date: Fri, 3 Jan 2020 12:02:28 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH 006/104] virtiofsd: Trim down imported files
Message-ID: <20200103120228.GL2753983@redhat.com>
References: <20191212163904.159893-1-dgilbert@redhat.com>
 <20191212163904.159893-7-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191212163904.159893-7-dgilbert@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: eaJplqDOPnGxF75s926VSQ-1
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

On Thu, Dec 12, 2019 at 04:37:26PM +0000, Dr. David Alan Gilbert (git) wrot=
e:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>=20
> There's a lot of the original fuse code we don't need; trim them down.
>=20
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  tools/virtiofsd/fuse.h                |   8 -
>  tools/virtiofsd/fuse_common.h         |   8 -
>  tools/virtiofsd/fuse_i.h              |  22 -
>  tools/virtiofsd/fuse_log.h            |   8 -
>  tools/virtiofsd/fuse_loop_mt.c        | 308 ------------
>  tools/virtiofsd/fuse_lowlevel.c       | 653 +-------------------------
>  tools/virtiofsd/fuse_lowlevel.h       |   8 -
>  tools/virtiofsd/fuse_opt.h            |   8 -
>  tools/virtiofsd/helper.c              | 138 ------
>  tools/virtiofsd/passthrough_helpers.h |  26 -
>  10 files changed, 5 insertions(+), 1182 deletions(-)

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


