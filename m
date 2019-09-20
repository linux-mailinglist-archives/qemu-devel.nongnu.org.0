Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4FBB9352
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Sep 2019 16:43:25 +0200 (CEST)
Received: from localhost ([::1]:60352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iBK83-00071V-PG
	for lists+qemu-devel@lfdr.de; Fri, 20 Sep 2019 10:43:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33820)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pkrempa@redhat.com>) id 1iBJs3-0002JW-8W
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 10:26:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pkrempa@redhat.com>) id 1iBJs1-00032X-Bg
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 10:26:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:62927)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pkrempa@redhat.com>) id 1iBJs1-000325-6b
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 10:26:49 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D7FFFA26660;
 Fri, 20 Sep 2019 14:26:47 +0000 (UTC)
Received: from angien.brq.redhat.com (unknown [10.43.2.229])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B6F70A21E;
 Fri, 20 Sep 2019 14:26:46 +0000 (UTC)
From: Peter Krempa <pkrempa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] qapi: Add detection for the 'savevm' fix for blockdev
Date: Fri, 20 Sep 2019 16:26:43 +0200
Message-Id: <cover.1568989362.git.pkrempa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.68]); Fri, 20 Sep 2019 14:26:47 +0000 (UTC)
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
Cc: Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add 'features' field in the schema for commands and add a feature flag
to advertise that the fix for savevm [1] is present.

[1] https://lists.gnu.org/archive/html/qemu-devel/2019-09/msg03487.html

v2:
 - fixed typos pointed out by Eric
 - added 'since' tag
 - reworded to describe the fix this allows to detect properly (Kevin)
 - verified that this can be rebased on top of Markus' series
   automatically

Peter Krempa (2):
  qapi: Add feature flags to commands in qapi introspection
  qapi: Allow introspecting fix for savevm's cooperation with blockdev

 docs/devel/qapi-code-gen.txt   |  4 ++--
 qapi/introspect.json           |  6 ++++-
 qapi/misc.json                 |  9 +++++++-
 scripts/qapi/commands.py       |  3 ++-
 scripts/qapi/common.py         | 40 +++++++++++++++++++++++++++++-----
 scripts/qapi/doc.py            |  3 ++-
 scripts/qapi/introspect.py     |  7 +++++-
 tests/qapi-schema/test-qapi.py |  7 +++++-
 8 files changed, 66 insertions(+), 13 deletions(-)

--=20
2.21.0


