Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B785D10CB5D
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Nov 2019 16:09:42 +0100 (CET)
Received: from localhost ([::1]:49888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iaLQI-0004Vu-Fg
	for lists+qemu-devel@lfdr.de; Thu, 28 Nov 2019 10:09:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34364)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1iaKsk-0004wE-9c
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 09:35:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1iaKsX-0005lO-UT
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 09:34:47 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:33471
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1iaKsX-0005VK-Hw
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 09:34:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574951682;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=giQQ4/7BVy848X6md8gfCg5J2ksXZL5YKLXxEegmkb4=;
 b=LK5m2WKPzJ9GJaDFHu90bfb+J3vsB0R430ELrBBpeTNteSMjX0AWQERvJbQhe47cO2k/Uo
 8l9Ue3OhLMBgwWI4o+0Okg3DfyYYrNmQ/wpXfCbpzIvnUKcUIIsKKTgMZeJAtMmcUM8l4N
 KJW3ELdp9AymRhFXJucr8oMa+bv5AEY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-EvdJNSicPJiv8dnQ1dlmAg-1; Thu, 28 Nov 2019 09:34:38 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46102593A1
 for <qemu-devel@nongnu.org>; Thu, 28 Nov 2019 14:34:37 +0000 (UTC)
Received: from redhat.com (unknown [10.42.16.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F70119C4F;
 Thu, 28 Nov 2019 14:34:30 +0000 (UTC)
Date: Thu, 28 Nov 2019 14:34:28 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH 1/7] console: add graphic_hw_update_done()
Message-ID: <20191128143428.GK248361@redhat.com>
References: <20191127115202.375107-1-marcandre.lureau@redhat.com>
 <20191127115202.375107-2-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191127115202.375107-2-marcandre.lureau@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: EvdJNSicPJiv8dnQ1dlmAg-1
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 27, 2019 at 03:51:56PM +0400, Marc-Andr=C3=A9 Lureau wrote:
> Add a function to be called when a graphic update is done.
>=20
> Declare the QXL renderer as async: render_update_cookie_num counts the
> number of outstanding updates, and graphic_hw_update_done() is called
> when it reaches none.
>=20
> (note: this is preliminary work for asynchronous screendump support)
>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  hw/display/qxl-render.c | 9 +++++++--
>  hw/display/qxl.c        | 1 +
>  include/ui/console.h    | 2 ++
>  ui/console.c            | 9 +++++++++
>  4 files changed, 19 insertions(+), 2 deletions(-)

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


