Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC99A21C2
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Aug 2019 19:05:49 +0200 (CEST)
Received: from localhost ([::1]:52204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i3Nrn-0007qm-Bu
	for lists+qemu-devel@lfdr.de; Thu, 29 Aug 2019 13:05:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47445)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1i3NdC-0000te-0q
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 12:50:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1i3NdA-0007q2-Vf
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 12:50:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37938)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1i3NdA-0007pf-QC
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 12:50:40 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1D754C049D62;
 Thu, 29 Aug 2019 16:50:40 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-60.ams2.redhat.com
 [10.36.112.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F7BF1001B20;
 Thu, 29 Aug 2019 16:50:37 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 29 Aug 2019 17:50:32 +0100
Message-Id: <20190829165036.9773-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Thu, 29 Aug 2019 16:50:40 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 0/4] docs: add docs about use of automatic
 cleanup functions
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
 Stefan Hajnoczi <stefanha@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is ostensibly about adding docs for the g_autofree/g_autoptr
macros. As part of doing that, however, the existing HACKING doc
is merged into the CODING_STYLE doc and the text is converted to
rst with a table of contents.

Changed in v3:

 - Make checkpatch.pl aware of README.rst rename

Changed in v2:

 - Use RST instead of markdown
 - Also convert README file
 - Group sections better
 - Remove GMutexLocker example

Daniel P. Berrang=C3=A9 (4):
  docs: convert README, CODING_STYLE and HACKING to RST syntax
  docs: merge HACKING.rst contents into CODING_STYLE.rst
  docs: document use of automatic cleanup functions in glib
  docs: split the CODING_STYLE doc into distinct groups

 CODING_STYLE          | 216 --------------
 CODING_STYLE.rst      | 641 ++++++++++++++++++++++++++++++++++++++++++
 HACKING               | 257 -----------------
 README =3D> README.rst  |  47 ++--
 scripts/checkpatch.pl |   2 +-
 5 files changed, 671 insertions(+), 492 deletions(-)
 delete mode 100644 CODING_STYLE
 create mode 100644 CODING_STYLE.rst
 delete mode 100644 HACKING
 rename README =3D> README.rst (84%)

--=20
2.21.0


