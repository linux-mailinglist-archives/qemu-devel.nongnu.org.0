Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DC412F7E1
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jan 2020 13:00:21 +0100 (CET)
Received: from localhost ([::1]:51386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1inLcq-00048R-UB
	for lists+qemu-devel@lfdr.de; Fri, 03 Jan 2020 07:00:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44852)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1inLbZ-0003JD-Po
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 06:59:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1inLbY-0003fV-LM
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 06:59:01 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:28811
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1inLbY-0003dN-GK
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 06:59:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578052740;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IbEbvpKFSYcqRfDHnnyvWyLwumxpbpgGu/ZzuswTPnk=;
 b=SY87WhPTiHumohflI5eFt/A1F3PJW/vuN9LK83emewkwBh9h/Cn7Enf0MrjnKAQLkkrQeR
 0Y6xvQXK9GQTfr4nysPJdgAUP9HngYZ/cIoEYp51w1z8xltuagzGeVrIPSd2pi1Oee9roB
 AWe/ngZti8CEtaqiRp+p+AiKy6vmFrk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-xffKDKToMCS0VkItgtanhw-1; Fri, 03 Jan 2020 06:58:58 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D82518024D6
 for <qemu-devel@nongnu.org>; Fri,  3 Jan 2020 11:58:57 +0000 (UTC)
Received: from redhat.com (ovpn-112-41.ams2.redhat.com [10.36.112.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A0F225DA75;
 Fri,  3 Jan 2020 11:58:45 +0000 (UTC)
Date: Fri, 3 Jan 2020 11:58:42 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH 004/104] virtiofsd: Add fuse_lowlevel.c
Message-ID: <20200103115842.GJ2753983@redhat.com>
References: <20191212163904.159893-1-dgilbert@redhat.com>
 <20191212163904.159893-5-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191212163904.159893-5-dgilbert@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: xffKDKToMCS0VkItgtanhw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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

On Thu, Dec 12, 2019 at 04:37:24PM +0000, Dr. David Alan Gilbert (git) wrot=
e:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>=20
> fuse_lowlevel is one of the largest files from the library
> and does most of the work.  Add it separately to keep the diff
> sizes small.
> Again this is from upstream fuse-3.8.0
>=20
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  tools/virtiofsd/fuse_lowlevel.c | 3129 +++++++++++++++++++++++++++++++
>  1 file changed, 3129 insertions(+)
>  create mode 100644 tools/virtiofsd/fuse_lowlevel.c

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


