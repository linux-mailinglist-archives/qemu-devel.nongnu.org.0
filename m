Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 111C0127C79
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Dec 2019 15:25:03 +0100 (CET)
Received: from localhost ([::1]:56956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iiJDC-0002Cz-28
	for lists+qemu-devel@lfdr.de; Fri, 20 Dec 2019 09:25:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57566)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1iiIsE-0003WZ-18
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 09:03:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1iiIsC-0004L6-GJ
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 09:03:21 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:31643
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1iiIsC-0004Gx-8p
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 09:03:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576850599;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6lYjt2Ct1cuEdEhuYm+o8hEHoX1ERPK+qOqZvwwKuBk=;
 b=eRNfauktCPMeGnSLwNqcC0X/hxnQztW3iQnNgdszU122mOfii3sq7nGTGNe5EcW3GW1Zs9
 hZ8kfQSnFxb5MA+GibLOlnpt39I61LKQ0WxwOj4gDKPra8rGv89q6TR6lN/Fof/Qh5SV0o
 Cf7xkUDWaSsQgXbGMQteAZ2UczRN2QY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-q-rkYy6DMX-vWz5g96aP8Q-1; Fri, 20 Dec 2019 09:03:17 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1AFFD801E66
 for <qemu-devel@nongnu.org>; Fri, 20 Dec 2019 14:03:17 +0000 (UTC)
Received: from redhat.com (unknown [10.42.16.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 082E11A7E3;
 Fri, 20 Dec 2019 14:03:13 +0000 (UTC)
Date: Fri, 20 Dec 2019 14:03:12 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH v7 4/9] util: add dbus helper unit
Message-ID: <20191220140312.GM1699760@redhat.com>
References: <20191219123029.200788-1-marcandre.lureau@redhat.com>
 <20191219123029.200788-5-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191219123029.200788-5-marcandre.lureau@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: q-rkYy6DMX-vWz5g96aP8Q-1
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
Cc: mprivozn@redhat.com, quintela@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 19, 2019 at 04:30:24PM +0400, Marc-Andr=C3=A9 Lureau wrote:
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  MAINTAINERS         |  2 ++
>  include/qemu/dbus.h | 19 +++++++++++++++
>  util/Makefile.objs  |  3 +++
>  util/dbus.c         | 57 +++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 81 insertions(+)
>  create mode 100644 include/qemu/dbus.h
>  create mode 100644 util/dbus.c

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


