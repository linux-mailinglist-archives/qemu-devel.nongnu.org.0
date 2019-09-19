Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74143B7F3F
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Sep 2019 18:36:33 +0200 (CEST)
Received: from localhost ([::1]:46390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAzQ0-0008PP-En
	for lists+qemu-devel@lfdr.de; Thu, 19 Sep 2019 12:36:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43753)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iAzJM-00048V-DH
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 12:29:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iAzJL-00021i-H0
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 12:29:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49234)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1iAzJJ-0001xw-0Z; Thu, 19 Sep 2019 12:29:37 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 49F0A308212D;
 Thu, 19 Sep 2019 16:29:36 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.36.116.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E9FB260566;
 Thu, 19 Sep 2019 16:29:15 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 0/2] iotests: Require Python 3.6 or later
Date: Thu, 19 Sep 2019 18:29:03 +0200
Message-Id: <20190919162905.21830-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Thu, 19 Sep 2019 16:29:36 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: kwolf@redhat.com, thuth@redhat.com, ehabkost@redhat.com, jsnow@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v2:

- Provide the right exit code from Python instead of having a
  potentially confusing negation in the shell script

- Raised the minimal version to 3.6. If we're going to use a different
  version than QEMU as a whole anyway, we can use a version that suits
  us best. 3.5 would only be for Debian Stretch, and we don't really
  care that much about running Python test cases on it.

- Added a patch to remove Python 2 compatibility code

Kevin Wolf (2):
  iotests: Require Python 3.6 or later
  iotests: Remove Python 2 compatibility code

 tests/qemu-iotests/044                   |  3 ---
 tests/qemu-iotests/163                   |  3 ---
 tests/qemu-iotests/check                 | 13 ++++++++++++-
 tests/qemu-iotests/iotests.py            | 13 +++----------
 tests/qemu-iotests/nbd-fault-injector.py |  7 +++----
 5 files changed, 18 insertions(+), 21 deletions(-)

--=20
2.20.1


