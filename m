Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB5716595
	for <lists+qemu-devel@lfdr.de>; Tue,  7 May 2019 16:22:25 +0200 (CEST)
Received: from localhost ([127.0.0.1]:47635 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hO0z8-0006xk-7A
	for lists+qemu-devel@lfdr.de; Tue, 07 May 2019 10:22:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45163)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1hO0wM-0004y3-6h
	for qemu-devel@nongnu.org; Tue, 07 May 2019 10:19:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1hO0wL-0007ga-3a
	for qemu-devel@nongnu.org; Tue, 07 May 2019 10:19:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54358)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>) id 1hO0wK-0007fu-SE
	for qemu-devel@nongnu.org; Tue, 07 May 2019 10:19:29 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2E4A2308793F;
	Tue,  7 May 2019 14:19:18 +0000 (UTC)
Received: from redhat.com (ovpn-112-52.ams2.redhat.com [10.36.112.52])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8730D5DA38;
	Tue,  7 May 2019 14:19:10 +0000 (UTC)
Date: Tue, 7 May 2019 15:19:06 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20190507141906.GT27205@redhat.com>
References: <20190502223007.29494-1-samuel.thibault@ens-lyon.org>
	<0da3ec00-9040-f367-7666-a54824f1dcde@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0da3ec00-9040-f367-7666-a54824f1dcde@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Tue, 07 May 2019 14:19:23 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PULL 0/2] slirp: move slirp as git submodule
 project
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: peter.maydell@linaro.org, jan.kiszka@siemens.com, qemu-devel@nongnu.org,
	stefanha@redhat.com,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 07, 2019 at 09:11:09AM -0500, Eric Blake wrote:
> On 5/2/19 5:30 PM, Samuel Thibault wrote:
> > The following changes since commit 8482ff2eb3bb95020eb2f370a9b3ea2651=
1e41df:
> >=20
> >   Merge remote-tracking branch 'remotes/jnsnow/tags/bitmaps-pull-requ=
est' into staging (2019-05-02 12:04:51 +0100)
> >=20
> > are available in the Git repository at:
> >=20
> >   https://people.debian.org/~sthibault/qemu.git tags/samuel-thibault
> >=20
> > for you to fetch changes up to 7c57bdd82026ba03f3158bbcd841afde7c2dc4=
3a:
> >=20
> >   build-sys: move slirp as git submodule project (2019-05-03 00:15:37=
 +0200)
> >=20
> > ----------------------------------------------------------------
> > slirp: move slirp as git submodule project
> >=20
> > Marc-Andr=C3=A9 Lureau (2):
> >   build-sys: pass CFLAGS & LDFLAGS to subdir-slirp
> >   build-sys: move slirp as git submodule project
> >=20
> > ----------------------------------------------------------------
> > Marc-Andr=C3=A9 Lureau (2):
> >       build-sys: pass CFLAGS & LDFLAGS to subdir-slirp
> >       build-sys: move slirp as git submodule project
>=20
> After this series, an in-tree build is seeing a dirty tree, thanks to:
>=20
> > Changes not staged for commit:
> >   (use "git add <file>..." to update what will be committed)
> >   (use "git checkout -- <file>..." to discard changes in working dire=
ctory)
> >   (commit or discard the untracked or modified content in submodules)
> >=20
> > 	modified:   slirp (untracked content)
>=20
> which in reality is due to:
>=20
> $ cd slirp/
> $ git status
> HEAD detached at 59a1b1f
> Untracked files:
>   (use "git add <file>..." to include in what will be committed)
>=20
> 	libslirp.a
> 	src/arp_table.d
> 	src/arp_table.o
> ...
>=20
> libslirp probably needs a .gitignore for *.a, *.o, *.d, and
> src/libslirp-version.h
>=20
> And actually getting it to apply during qemu's build will need another
> submodule update.
>=20
> In the meantime, where do we stand on our goal of disabling in-tree bui=
lds?

The view was largely positive when we discussed it. So I think it just
needs someone to step up with a patch proposal, and at the start of the
dev cycle is a good time for such a change i guess.

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|

