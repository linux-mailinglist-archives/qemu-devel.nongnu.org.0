Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E15E1380837
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 13:14:32 +0200 (CEST)
Received: from localhost ([::1]:45668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhVm3-0004sz-G3
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 07:14:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lhVl1-0003un-K7
 for qemu-devel@nongnu.org; Fri, 14 May 2021 07:13:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lhVkx-0007hH-KH
 for qemu-devel@nongnu.org; Fri, 14 May 2021 07:13:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620990802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sALubWTpooPORSQ9PgMVXcXM6Ugn+Gfz+HTVDrCUwQA=;
 b=FnVnGwrGudHpNqx6kHWORH51GTjsRNhkDTJJVqmZab7vQtHRVC8MxbD6dbAyM/LQKdbPzH
 kTp8R+DjGfIV+qnlBxq4KoPp1GDBo1uRxsrDPZrQX1kRuIfg97qfWkkB8nPg7tjTxIuQWx
 b3HozKmygLZyy/TsHod719dzc8qnc6s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-dJNltLNrOimMnND0xoGPtA-1; Fri, 14 May 2021 07:13:20 -0400
X-MC-Unique: dJNltLNrOimMnND0xoGPtA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F5656D4F4;
 Fri, 14 May 2021 11:13:19 +0000 (UTC)
Received: from localhost (unknown [10.36.110.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D389687DF;
 Fri, 14 May 2021 11:13:14 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL v3 0/1] Rtd patches
Date: Fri, 14 May 2021 15:13:09 +0400
Message-Id: <20210514111310.1756593-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>=0D

The following changes since commit 2d3fc4e2b069494b1e9e2e4a1e3de24cbc036426=
:=0D
=0D
  Merge remote-tracking branch 'remotes/armbru/tags/pull-misc-2021-05-12' i=
nto staging (2021-05-13 20:13:24 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git@gitlab.com:marcandre.lureau/qemu.git tags/rtd-pull-request=0D
=0D
for you to fetch changes up to 73e6aec6522e1edd63f631c52577b49a39bc234f:=0D
=0D
  sphinx: adopt kernel readthedoc theme (2021-05-14 15:05:03 +0400)=0D
=0D
----------------------------------------------------------------=0D
Pull request=0D
=0D
----------------------------------------------------------------=0D
=0D
Marc-Andr=C3=A9 Lureau (1):=0D
  sphinx: adopt kernel readthedoc theme=0D
=0D
 docs/_templates/editpage.html              |   5 -=0D
 docs/conf.py                               |  52 ++++---=0D
 docs/devel/_templates/editpage.html        |   5 -=0D
 docs/interop/_templates/editpage.html      |   5 -=0D
 docs/meson.build                           |   5 +-=0D
 docs/specs/_templates/editpage.html        |   5 -=0D
 docs/sphinx-static/theme_overrides.css     | 161 +++++++++++++++++++++=0D
 docs/system/_templates/editpage.html       |   5 -=0D
 docs/tools/_templates/editpage.html        |   5 -=0D
 docs/user/_templates/editpage.html         |   5 -=0D
 tests/docker/dockerfiles/alpine.docker     |   1 +=0D
 tests/docker/dockerfiles/debian10.docker   |   1 +=0D
 tests/docker/dockerfiles/fedora.docker     |   1 +=0D
 tests/docker/dockerfiles/ubuntu.docker     |   1 +=0D
 tests/docker/dockerfiles/ubuntu1804.docker |   1 +=0D
 tests/docker/dockerfiles/ubuntu2004.docker |   1 +=0D
 16 files changed, 200 insertions(+), 59 deletions(-)=0D
 delete mode 100644 docs/_templates/editpage.html=0D
 delete mode 100644 docs/devel/_templates/editpage.html=0D
 delete mode 100644 docs/interop/_templates/editpage.html=0D
 delete mode 100644 docs/specs/_templates/editpage.html=0D
 create mode 100644 docs/sphinx-static/theme_overrides.css=0D
 delete mode 100644 docs/system/_templates/editpage.html=0D
 delete mode 100644 docs/tools/_templates/editpage.html=0D
 delete mode 100644 docs/user/_templates/editpage.html=0D
=0D
--=20=0D
2.29.0=0D
=0D


