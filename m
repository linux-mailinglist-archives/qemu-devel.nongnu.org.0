Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CECB1252F58
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Aug 2020 15:08:05 +0200 (CEST)
Received: from localhost ([::1]:51808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAv9o-0005Ec-AZ
	for lists+qemu-devel@lfdr.de; Wed, 26 Aug 2020 09:08:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kAv8R-00048q-Lv
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 09:06:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kAv8O-0002BU-7Z
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 09:06:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598447192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xHjeeumI9PZ7GQ+VctUG//A2Ycq8P8aZIYQjigM3Qsw=;
 b=MCXr4u6VEQ2L7PLbwHrc09BUYd7MUjM9UhTd1pSc6aX5wWpsPXa3PY7ueXNl2zb+CHi/Hd
 /IOrF1wU9r++o2WwTVYih9fAkQV17nGHg+Wgf4ldScHDGqE4XPoBS81+Vjr4xzwI0zcJd3
 VNFcPzh/zoGDpn6BLvXZUSZFt6EUmAE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-TAdKzCXVNU6okZZ7OWytVw-1; Wed, 26 Aug 2020 09:06:29 -0400
X-MC-Unique: TAdKzCXVNU6okZZ7OWytVw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CCCE7189E60D
 for <qemu-devel@nongnu.org>; Wed, 26 Aug 2020 13:06:28 +0000 (UTC)
Received: from localhost (unknown [10.36.110.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 25CFD7C5F6;
 Wed, 26 Aug 2020 13:06:24 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 0/6] meson: convert the remaining of install target
Date: Wed, 26 Aug 2020 17:06:16 +0400
Message-Id: <20200826130622.553318-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/26 06:53:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: pbonzini@redhat.com, berrange@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>=0D

Hi,=0D
=0D
A few patches to finish replacing the Makefile install target by meson.=0D
=0D
Marc-Andr=C3=A9 Lureau (6):=0D
  meson: install pc-bios blobs=0D
  meson: install scripts/qemu-trace-stap=0D
  meson: install icons=0D
  meson: install desktop file=0D
  meson: install $localstatedir/run for qga=0D
  build-sys: remove install target from Makefile=0D
=0D
 Makefile             | 62 -------------------------------------------=0D
 meson.build          |  1 +=0D
 pc-bios/meson.build  | 63 ++++++++++++++++++++++++++++++++++++++++++++=0D
 qga/meson.build      |  2 ++=0D
 scripts/meson.build  |  3 +++=0D
 ui/icons/meson.build | 13 +++++++++=0D
 ui/meson.build       |  3 +++=0D
 7 files changed, 85 insertions(+), 62 deletions(-)=0D
 create mode 100644 scripts/meson.build=0D
 create mode 100644 ui/icons/meson.build=0D
=0D
--=20=0D
2.26.2=0D
=0D


