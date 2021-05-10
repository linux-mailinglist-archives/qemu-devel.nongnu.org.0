Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4E8378C8E
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 15:08:35 +0200 (CEST)
Received: from localhost ([::1]:52250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg5eE-0001nq-Oc
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 09:08:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lg5cK-0008HW-S6
 for qemu-devel@nongnu.org; Mon, 10 May 2021 09:06:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lg5cH-0001NN-OX
 for qemu-devel@nongnu.org; Mon, 10 May 2021 09:06:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620651991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=u8C4Mz0dpZ7SjJ6dUs+gfTYF5C/bW9ZCmJcnqsiTrAc=;
 b=PKcP1HG+jqkEEm17M1MOkKiB2oyVQFLqgi1S/zeQ2SP5Wq2oETmkHBitvtc0mRKu2SKSTB
 zWAAwYAc6OwOccPC6cjYLn+6P7MBJdZMgGtK1fga4VHaqG6piT+hF20hfzgA9KMbr4pKAf
 Y0R74MAH4UMgbELt2Sa+qUP1E3/cntM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-ujlAjXNJN3-n-p6BYO2vTw-1; Mon, 10 May 2021 09:06:27 -0400
X-MC-Unique: ujlAjXNJN3-n-p6BYO2vTw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8CFF88042AD;
 Mon, 10 May 2021 13:06:26 +0000 (UTC)
Received: from localhost (unknown [10.36.110.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0EEEF60D54;
 Mon, 10 May 2021 13:06:20 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL v2 0/1] readthedoc theme patch
Date: Mon, 10 May 2021 17:06:16 +0400
Message-Id: <20210510130617.320981-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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

The following changes since commit d90f154867ec0ec22fd719164b88716e8fd48672=
:=0D
=0D
  Merge remote-tracking branch 'remotes/dg-gitlab/tags/ppc-for-6.1-20210504=
' into staging (2021-05-05 20:29:14 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git@gitlab.com:marcandre.lureau/qemu.git tags/rtd-pull-request=0D
=0D
for you to fetch changes up to f1852f5d7e6fc2ead874261c0388b18898257000:=0D
=0D
  sphinx: adopt kernel readthedoc theme (2021-05-10 15:12:09 +0400)=0D
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
 docs/conf.py                               |  51 ++++---=0D
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
 16 files changed, 199 insertions(+), 59 deletions(-)=0D
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


