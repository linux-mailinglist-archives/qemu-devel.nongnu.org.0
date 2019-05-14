Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E87F1CE84
	for <lists+qemu-devel@lfdr.de>; Tue, 14 May 2019 20:06:01 +0200 (CEST)
Received: from localhost ([127.0.0.1]:51994 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQboO-00047V-Kr
	for lists+qemu-devel@lfdr.de; Tue, 14 May 2019 14:06:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33145)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hQbll-0002ze-Nc
	for qemu-devel@nongnu.org; Tue, 14 May 2019 14:03:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hQblk-0002Xf-Rz
	for qemu-devel@nongnu.org; Tue, 14 May 2019 14:03:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37218)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hQblk-0002XB-N1
	for qemu-devel@nongnu.org; Tue, 14 May 2019 14:03:16 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 02D4430026B2
	for <qemu-devel@nongnu.org>; Tue, 14 May 2019 18:03:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-28.ams2.redhat.com
	[10.36.116.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E8C6BA79;
	Tue, 14 May 2019 18:03:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id E9E1911385E4; Tue, 14 May 2019 20:03:11 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 14 May 2019 20:03:05 +0200
Message-Id: <20190514180311.16028-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Tue, 14 May 2019 18:03:16 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 0/6] Fix misuse of ctype.h functions
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
Cc: thuth@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v2:
* PATCH 1: Use g_ascii_isspace(), adapt commit message [Philippe]
* PATCH 3: Add comment pointing to the GDB manual [Philippe]
* PATCH 5: Improve commit message [Thomas]

Markus Armbruster (6):
  qemu-bridge-helper: Fix misuse of isspace()
  tests/vhost-user-bridge: Fix misuse of isdigit()
  gdbstub: Reject invalid RLE repeat counts
  gdbstub: Fix misuse of isxdigit()
  pc-bios/s390-ccw: Clean up harmless misuse of isdigit()
  cutils: Simplify how parse_uint() checks for whitespace

 gdbstub.c                 | 20 ++++++++++++--------
 pc-bios/s390-ccw/libc.c   |  2 +-
 pc-bios/s390-ccw/menu.c   |  2 +-
 qemu-bridge-helper.c      |  6 +++---
 tests/vhost-user-bridge.c |  2 +-
 util/cutils.c             |  2 +-
 6 files changed, 19 insertions(+), 15 deletions(-)

--=20
2.17.2


