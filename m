Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAE59B4B4
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 18:43:38 +0200 (CEST)
Received: from localhost ([::1]:59404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i1Cf2-0008FJ-Az
	for lists+qemu-devel@lfdr.de; Fri, 23 Aug 2019 12:43:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46810)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1i1CbD-0006Ys-1t
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 12:39:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1i1CbC-0002sB-20
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 12:39:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:1775)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1i1CbB-0002qS-Sy
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 12:39:38 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E09AE18C8929;
 Fri, 23 Aug 2019 16:39:34 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-60.ams2.redhat.com
 [10.36.112.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8EE1B850B;
 Fri, 23 Aug 2019 16:39:33 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 23 Aug 2019 17:39:27 +0100
Message-Id: <20190823163931.7442-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Fri, 23 Aug 2019 16:39:34 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 0/4] docs: add docs about use of automatic
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is ostensibly about adding docs for the g_autofree/g_autoptr
macros. As part of doing that, however, the existing HACKING doc
is merged into the CODING_STYLE doc and the text is converted to
markdown with a table of contents.

Daniel P. Berrang=C3=A9 (4):
  docs: convert CODING_STYLE and HACKING to markdown syntax
  docs: merge HACKING.md contents into CODING_STYLE.md
  docs: document use of automatic cleanup functions in glib
  docs: add table of contents to CODING_STYLE.md

 CODING_STYLE    | 216 -----------------
 CODING_STYLE.md | 613 ++++++++++++++++++++++++++++++++++++++++++++++++
 HACKING         | 257 --------------------
 README          |   2 +-
 4 files changed, 614 insertions(+), 474 deletions(-)
 delete mode 100644 CODING_STYLE
 create mode 100644 CODING_STYLE.md
 delete mode 100644 HACKING

--=20
2.21.0


