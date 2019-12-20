Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BD1127C6B
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Dec 2019 15:21:42 +0100 (CET)
Received: from localhost ([::1]:56836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iiJ9x-0004uQ-NP
	for lists+qemu-devel@lfdr.de; Fri, 20 Dec 2019 09:21:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59318)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1iiIzO-0006qW-F0
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 09:10:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1iiIzM-00040t-If
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 09:10:46 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:30508
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1iiIzK-0003zB-QG
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 09:10:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576851041;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V8+UZygBtHDPknkB2JS64RDvGVAaCeRXBajYnp8Oi4w=;
 b=KsLPHJ+D3phKFnySiOO/wFNBwmvdd7L3thB7oRaCDWOMNY/L59R79gyB9NmDG4I8uxbzJR
 HPxGppPmp1vsde+U92cKS3luxox/Xmh1osnwEHcoAzIRUro4gMfrZxWRzY4tXjzfRui5RA
 cgs3vP5zJzmW8JffaA/pMt4GCxaiQIc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-lunk3_AvPjSyCIi8JFEBmA-1; Fri, 20 Dec 2019 09:10:40 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77540801E66
 for <qemu-devel@nongnu.org>; Fri, 20 Dec 2019 14:10:38 +0000 (UTC)
Received: from redhat.com (unknown [10.42.16.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6458C10021B2;
 Fri, 20 Dec 2019 14:10:33 +0000 (UTC)
Date: Fri, 20 Dec 2019 14:10:32 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH v7 8/9] tests: add migration-helpers unit
Message-ID: <20191220141032.GO1699760@redhat.com>
References: <20191219123029.200788-1-marcandre.lureau@redhat.com>
 <20191219123029.200788-9-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191219123029.200788-9-marcandre.lureau@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: lunk3_AvPjSyCIi8JFEBmA-1
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
Cc: mprivozn@redhat.com, quintela@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 19, 2019 at 04:30:28PM +0400, Marc-Andr=C3=A9 Lureau wrote:
> Move a few helper functions from migration-test.c to migration-helpers.c
>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  tests/Makefile.include    |   2 +-
>  tests/migration-helpers.c | 167 ++++++++++++++++++++++++++++++++++++
>  tests/migration-helpers.h |  37 ++++++++
>  tests/migration-test.c    | 176 +++-----------------------------------
>  4 files changed, 216 insertions(+), 166 deletions(-)
>  create mode 100644 tests/migration-helpers.c
>  create mode 100644 tests/migration-helpers.h

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


