Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6185AF8F8
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 11:33:44 +0200 (CEST)
Received: from localhost ([::1]:48978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7z0R-0004ow-SC
	for lists+qemu-devel@lfdr.de; Wed, 11 Sep 2019 05:33:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42923)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1i7yyV-0003sV-T9
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 05:31:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1i7yyR-0005iT-Fi
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 05:31:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57744)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1i7yyR-0005hd-Ao
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 05:31:39 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C545B64042
 for <qemu-devel@nongnu.org>; Wed, 11 Sep 2019 09:31:36 +0000 (UTC)
Received: from dhcp-17-64.lcy.redhat.com (unknown [10.42.17.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3ABA75D6C8;
 Wed, 11 Sep 2019 09:31:36 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 11 Sep 2019 10:31:34 +0100
Message-Id: <20190911093135.27010-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Wed, 11 Sep 2019 09:31:36 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 0/1] Filemon test patches
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 89ea03a7dc83ca36b670ba7f787802791fcb04=
b1:

  Merge remote-tracking branch 'remotes/huth-gitlab/tags/m68k-pull-2019-0=
9-07' into staging (2019-09-09 09:48:34 +0100)

are available in the Git repository at:

  https://github.com/berrange/qemu tags/filemon-test-pull-request

for you to fetch changes up to bf9e0313c27d8e6ecd7f7de3d63e1cb25d8f6311:

  tests: make filemonitor test more robust to event ordering (2019-09-11 =
10:29:27 +0100)

----------------------------------------------------------------
Fix filemonitor test broken with newest Linux kernel

----------------------------------------------------------------

Daniel P. Berrang=C3=A9 (1):
  tests: make filemonitor test more robust to event ordering

 tests/test-util-filemonitor.c | 43 +++++++++++++++++++++++++++--------
 1 file changed, 34 insertions(+), 9 deletions(-)

--=20
2.21.0


