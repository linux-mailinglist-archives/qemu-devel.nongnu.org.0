Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8946D1C732
	for <lists+qemu-devel@lfdr.de>; Tue, 14 May 2019 12:47:32 +0200 (CEST)
Received: from localhost ([127.0.0.1]:45258 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQUy3-00010U-Mt
	for lists+qemu-devel@lfdr.de; Tue, 14 May 2019 06:47:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35956)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1hQUsM-0005fG-GO
	for qemu-devel@nongnu.org; Tue, 14 May 2019 06:41:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1hQUsL-0000tD-L6
	for qemu-devel@nongnu.org; Tue, 14 May 2019 06:41:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57108)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1hQUsL-0000sQ-G0
	for qemu-devel@nongnu.org; Tue, 14 May 2019 06:41:37 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C621E307D935
	for <qemu-devel@nongnu.org>; Tue, 14 May 2019 10:41:36 +0000 (UTC)
Received: from localhost (unknown [10.36.112.10])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CCD5562723;
	Tue, 14 May 2019 10:41:27 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 14 May 2019 12:41:23 +0200
Message-Id: <20190514104126.6294-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Tue, 14 May 2019 10:41:36 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v4 0/3] Add vhost-user-input
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

v4:
- update "libvhost-user: fix -Werror=3Dformat=3D on ppc64"

v3:
- rebased, fixing some warnings found during merge

v2:
- build fixes

v1: (changes since original v6 series)
- add "libvhost-user: fix -Waddress-of-packed-member" & "util: simplify u=
nix_listen()"
- use unix_listen()
- build vhost-user-input by default (when applicable)

Marc-Andr=C3=A9 Lureau (3):
  libvhost-user: fix cast warnings on 32 bits
  libvhost-user: fix -Werror=3Dformat=3D on ppc64
  contrib: add vhost-user-input

 contrib/libvhost-user/libvhost-user.c  |  12 +-
 contrib/vhost-user-input/main.c        | 393 +++++++++++++++++++++++++
 MAINTAINERS                            |   1 +
 Makefile                               |  11 +
 Makefile.objs                          |   1 +
 contrib/vhost-user-input/Makefile.objs |   1 +
 6 files changed, 414 insertions(+), 5 deletions(-)
 create mode 100644 contrib/vhost-user-input/main.c
 create mode 100644 contrib/vhost-user-input/Makefile.objs

--=20
2.21.0.777.g83232e3864


