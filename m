Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F22C1BD4B
	for <lists+qemu-devel@lfdr.de>; Mon, 13 May 2019 20:37:50 +0200 (CEST)
Received: from localhost ([127.0.0.1]:33415 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQFpd-0000XJ-KF
	for lists+qemu-devel@lfdr.de; Mon, 13 May 2019 14:37:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55775)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1hQFlY-0006hM-7Y
	for qemu-devel@nongnu.org; Mon, 13 May 2019 14:33:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1hQFlX-0003XW-9d
	for qemu-devel@nongnu.org; Mon, 13 May 2019 14:33:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44148)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1hQFlX-0003Vr-4T
	for qemu-devel@nongnu.org; Mon, 13 May 2019 14:33:35 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3677C3084288
	for <qemu-devel@nongnu.org>; Mon, 13 May 2019 18:33:33 +0000 (UTC)
Received: from localhost (unknown [10.36.112.10])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4243D5C1B4;
	Mon, 13 May 2019 18:33:26 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 13 May 2019 20:33:22 +0200
Message-Id: <20190513183325.8596-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Mon, 13 May 2019 18:33:33 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 0/3] Add vhost-user-input
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

 contrib/libvhost-user/libvhost-user.c  |  11 +-
 contrib/vhost-user-input/main.c        | 393 +++++++++++++++++++++++++
 MAINTAINERS                            |   1 +
 Makefile                               |  11 +
 Makefile.objs                          |   1 +
 contrib/vhost-user-input/Makefile.objs |   1 +
 6 files changed, 413 insertions(+), 5 deletions(-)
 create mode 100644 contrib/vhost-user-input/main.c
 create mode 100644 contrib/vhost-user-input/Makefile.objs

--=20
2.21.0.777.g83232e3864


