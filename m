Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AB2447C76
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 10:04:02 +0100 (CET)
Received: from localhost ([::1]:44092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk0ZN-0008UI-He
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 04:04:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mk0Xe-0006jn-0Y
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 04:02:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mk0Xb-0002JC-1R
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 04:02:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636362128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1sZbUQWJAssucZ40oMFuI0lZBeuCNXTgNIZd2+6SzPE=;
 b=YTrso8ervIQto2p15INze8juY1NlAD6cGxcaYe50NfjQL0Aj3ExHXukQzw4CqB/TLiZUQd
 cDTVBNWCRVyb1EzY83ro/iz7dkOFyWwDInD/3xhC2F6+pNYXBwqaTOWO/qxGzOw78cOMUA
 iTsFp7IqsqjC22Sgaplo3e2bMzEKaEY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-VHwy80rwO-u681yoUVX6Aw-1; Mon, 08 Nov 2021 04:02:07 -0500
X-MC-Unique: VHwy80rwO-u681yoUVX6Aw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A74F1023F61;
 Mon,  8 Nov 2021 09:02:06 +0000 (UTC)
Received: from localhost (unknown [10.39.208.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6E46010016F5;
 Mon,  8 Nov 2021 09:01:58 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/11] Sphinx patches
Date: Mon,  8 Nov 2021 13:01:44 +0400
Message-Id: <20211108090155.371357-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: John Snow <jsnow@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>=0D

The following changes since commit 63ed851de474b1e2458cb9b4ba6e02a88f72c25c=
:=0D
=0D
  Merge remote-tracking branch 'remotes/juanquintela/tags/migration-2021110=
6-pull-request' into staging (2021-11-06 19:43:42 -0400)=0D
=0D
are available in the Git repository at:=0D
=0D
  git@gitlab.com:marcandre.lureau/qemu.git tags/sphinx-pull-request=0D
=0D
for you to fetch changes up to c11b3a1dd324d1f7dc8512bb840ffd8226fbd0a7:=0D
=0D
  docs/sphinx: change default role to "any" (2021-11-08 12:27:23 +0400)=0D
=0D
----------------------------------------------------------------=0D
Some Sphinx improvements=0D
=0D
PR for 2 series:=0D
https://patchew.org/QEMU/20211015105344.152591-1-marcandre.lureau@redhat.co=
m/=0D
https://patchew.org/QEMU/20211004215238.1523082-1-jsnow@redhat.com/=0D
=0D
----------------------------------------------------------------=0D
=0D
John Snow (3):=0D
  docs: remove non-reference uses of single backticks=0D
  docs: (further) remove non-reference uses of single backticks=0D
  docs/sphinx: change default role to "any"=0D
=0D
Marc-Andr=C3=A9 Lureau (8):=0D
  docs/sphinx: add loaded modules to generated depfile=0D
  docs/sphinx: add static files to generated depfile=0D
  docs/sphinx: add templates files to generated depfile=0D
  tests/qapi-schema/meson: add depfile to sphinx doc=0D
  meson: drop sphinx_extn_depends=0D
  meson: drop sphinx_template_files=0D
  docs/sphinx: set navigation_with_keys=3DTrue=0D
  docs/sphinx: add 's' keyboard binding to focus search=0D
=0D
 docs/conf.py                           | 12 +++++++++++-=0D
 docs/devel/build-system.rst            | 16 ++++++++--------=0D
 docs/devel/fuzzing.rst                 |  9 +++++----=0D
 docs/devel/tcg-plugins.rst             |  2 +-=0D
 docs/interop/live-block-operations.rst |  2 +-=0D
 docs/meson.build                       | 10 ----------=0D
 docs/sphinx-static/custom.js           |  9 +++++++++=0D
 docs/sphinx/depfile.py                 | 19 +++++++++++++++++--=0D
 docs/system/guest-loader.rst           |  2 +-=0D
 docs/system/i386/sgx.rst               |  6 +++---=0D
 qapi/block-core.json                   |  4 ++--=0D
 include/qemu/module.h                  |  6 +++---=0D
 qemu-options.hx                        |  4 ++--=0D
 tests/qapi-schema/meson.build          |  4 +++-=0D
 14 files changed, 66 insertions(+), 39 deletions(-)=0D
 create mode 100644 docs/sphinx-static/custom.js=0D
=0D
--=20=0D
2.33.0.721.g106298f7f9=0D
=0D


