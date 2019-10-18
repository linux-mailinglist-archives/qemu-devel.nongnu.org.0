Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CF3DCDCE
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Oct 2019 20:19:22 +0200 (CEST)
Received: from localhost ([::1]:44840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLWqP-0008VI-3c
	for lists+qemu-devel@lfdr.de; Fri, 18 Oct 2019 14:19:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34677)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1iLWoS-0006zj-5x
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 14:17:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1iLWoP-0001Ih-BD
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 14:17:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39394)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1iLWoN-0001Gb-KB
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 14:17:16 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 18F4E8BA02;
 Fri, 18 Oct 2019 18:17:13 +0000 (UTC)
Received: from localhost (ovpn-116-20.phx2.redhat.com [10.3.116.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 34BB160BF4;
 Fri, 18 Oct 2019 18:17:07 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 0/3] tests/vm: netbsd autoinstall, with IPv6 disabled
Date: Fri, 18 Oct 2019 15:17:02 -0300
Message-Id: <20191018181705.17957-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Fri, 18 Oct 2019 18:17:13 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Kamil Rytarowski <kamil@netbsd.org>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm numbering this series v5 because it's a new version of the
patch sent by Gerd, at:

  Date: Mon, 17 Jun 2019 06:38:56 +0200
  Message-Id: <20190617043858.8290-10-kraxel@redhat.com>
  Subject: [PATCH v4 09/11] tests/vm: netbsd autoinstall, using serial co=
nsole

Changes v4 -> v5:
* Rebase to latest qemu.git master
* Disable IPv6 by default (see
  https://lore.kernel.org/qemu-devel/20191017225548.GL4084@habkost.net/ f=
or context)

Eduardo Habkost (2):
  tests/vm: Let subclasses disable IPv6
  tests/vm/netbsd: Disable IPv6

Gerd Hoffmann (1):
  tests/vm: netbsd autoinstall, using serial console

 tests/vm/basevm.py |   5 +-
 tests/vm/netbsd    | 196 ++++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 190 insertions(+), 11 deletions(-)

--=20
2.21.0


