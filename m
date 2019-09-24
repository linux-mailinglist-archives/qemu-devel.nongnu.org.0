Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA65BCB62
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Sep 2019 17:29:16 +0200 (CEST)
Received: from localhost ([::1]:47126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCmkc-0005En-Ef
	for lists+qemu-devel@lfdr.de; Tue, 24 Sep 2019 11:29:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41097)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iCluf-0004eH-FJ
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 10:35:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iCluc-0004aT-8E
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 10:35:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40230)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>)
 id 1iCluW-0004Ub-Kj; Tue, 24 Sep 2019 10:35:25 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6158A86668;
 Tue, 24 Sep 2019 14:35:23 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-249.phx2.redhat.com [10.3.116.249])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E333608C0;
 Tue, 24 Sep 2019 14:35:22 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] enhance iotest 223 coverage
Date: Tue, 24 Sep 2019 09:35:20 -0500
Message-Id: <20190924143522.22902-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Tue, 24 Sep 2019 14:35:23 +0000 (UTC)
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
Cc: nsoffer@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 506902c6 dropped non-iothread coverage in order to test iothread,
better is to run things twice.  In doing this, I found it easier to
edit the test when the log shows what commands were triggering various
responses.

Eric Blake (2):
  tests: Make iotest 223 easier to edit
  tests: More iotest 223 improvements

 tests/qemu-iotests/223     | 114 ++++++++++++++++++++++++------
 tests/qemu-iotests/223.out | 138 +++++++++++++++++++++++++++++++++++++
 2 files changed, 231 insertions(+), 21 deletions(-)

--=20
2.21.0


