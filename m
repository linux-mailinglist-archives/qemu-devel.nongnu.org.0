Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE522F6150
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 13:57:32 +0100 (CET)
Received: from localhost ([::1]:55850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l02Bv-0003NE-BZ
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 07:57:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l02At-0002Qu-Tz
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 07:56:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l02Aq-0004ek-MZ
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 07:56:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610628982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=HtLJajOJZZxvD3MgUo0i4228dWBalf/oYEGAu8Kj92c=;
 b=NRjVXBduCjFiXy24d1XD7FerDXK4pxTOjyHZBskwIXMQeg4/fLzRsiss7mavUtDgKAoTtD
 X86mS+4sT+5kEFE611LYO6VhEFIApfQLOEQY07xymM5oOoBPBfvLW/KVUYkWkLv9k79qNq
 bETABh6QIIemHjtFeWjgZ8UqNLjSc2Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-Rar9HQO9PW-c4AoRUsETfA-1; Thu, 14 Jan 2021 07:56:18 -0500
X-MC-Unique: Rar9HQO9PW-c4AoRUsETfA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2A2C8030DA;
 Thu, 14 Jan 2021 12:56:17 +0000 (UTC)
Received: from localhost (unknown [10.36.110.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 223CD1992D;
 Thu, 14 Jan 2021 12:56:09 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] Update libslirp & make it a subproject
Date: Thu, 14 Jan 2021 16:56:00 +0400
Message-Id: <20210114125605.1227742-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: pbonzini@redhat.com, j@getutm.app,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 samuel.thibault@ens-lyon.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>=0D

Hi,=0D
=0D
Here is a few patches to update libslirp to git upstream.=0D
Since it now supports meson subproject(), adapt the build=0D
system to use it, and related fixes.=0D
=0D
Marc-Andr=C3=A9 Lureau (5):=0D
  build-sys: remove unused LIBS=0D
  build-sys: set global arguments for cflags/ldflags=0D
  build-sys: add libvhost-user missing dependencies=0D
  slirp: update to git master=0D
  build-sys: make libslirp a meson subproject=0D
=0D
 configure                             | 34 +-----------=0D
 meson.build                           | 78 +++++----------------------=0D
 .gitmodules                           |  6 +--=0D
 slirp                                 |  1 -=0D
 subprojects/libslirp                  |  1 +=0D
 subprojects/libvhost-user/meson.build |  3 ++=0D
 6 files changed, 20 insertions(+), 103 deletions(-)=0D
 delete mode 160000 slirp=0D
 create mode 160000 subprojects/libslirp=0D
=0D
--=20=0D
2.29.0=0D
=0D


