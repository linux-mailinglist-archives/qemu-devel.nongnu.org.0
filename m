Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9986035FCB
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jun 2019 17:00:26 +0200 (CEST)
Received: from localhost ([127.0.0.1]:44083 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYXOr-0000xv-6X
	for lists+qemu-devel@lfdr.de; Wed, 05 Jun 2019 11:00:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35037)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1hYXNE-0000HU-2a
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 10:58:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1hYXNC-0002Da-75
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 10:58:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36282)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1hYXNA-0002BI-S6
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 10:58:42 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B7D77306E33B
	for <qemu-devel@nongnu.org>; Wed,  5 Jun 2019 14:58:38 +0000 (UTC)
Received: from localhost (ovpn-112-54.ams2.redhat.com [10.36.112.54])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9D0A0546E3;
	Wed,  5 Jun 2019 14:58:30 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  5 Jun 2019 16:58:24 +0200
Message-Id: <20190605145829.7674-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Wed, 05 Jun 2019 14:58:38 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 0/5] Misc vhost-user fixes
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

Here is a few fixes spotted by Coverity in the recently landed
vhost-user-{input,gpu}.

Marc-Andr=C3=A9 Lureau (5):
  vhost-user-gpu: do not send scanout update if no GPU socket
  vhost-user: check unix_listen() return value
  vhost-user: improve error report
  vhost-user-input: check ioctl(EVIOCGNAME) return value
  vhost-user-gpu: initialize msghdr & iov at declaration

 contrib/vhost-user-gpu/main.c   | 29 ++++++++++++++---------------
 contrib/vhost-user-input/main.c | 12 ++++++++++--
 2 files changed, 24 insertions(+), 17 deletions(-)

--=20
2.22.0.rc2.384.g1a9a72ea1d


