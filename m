Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 525F9191D7B
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Mar 2020 00:24:39 +0100 (CET)
Received: from localhost ([::1]:56614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGsuU-0003hc-CQ
	for lists+qemu-devel@lfdr.de; Tue, 24 Mar 2020 19:24:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51463)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsnow@redhat.com>) id 1jGss1-0007QF-6l
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 19:22:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1jGsrz-0001v8-2N
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 19:22:05 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:48511)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>) id 1jGsry-0001v0-Uw
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 19:22:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585092122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aR9WPdND1kFuppdsbjcr5rUt22snmCbAjfGmA39BRns=;
 b=Fo/a1UwSXQBu6/6t8CfsOOhwwtIXRIAe2OQtD9OcWhZeh5zwsAUF51lxxIn9IM/iO0MJJm
 Tm2r5fNrfLJwBHfElKuEKBls9U+GOYb+HU0y20/rm0w/a1I7k9sTrAcPB9IIHXa/2FSQNt
 wTD0QUggNoVHPqlLnAKyNWcmC/e7nRY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-isKAgYW0M0mqSnGae_tcHA-1; Tue, 24 Mar 2020 19:22:01 -0400
X-MC-Unique: isKAgYW0M0mqSnGae_tcHA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3CDE91005F92;
 Tue, 24 Mar 2020 23:21:50 +0000 (UTC)
Received: from probe.redhat.com (ovpn-112-191.rdu2.redhat.com [10.10.112.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E5D525D9C5;
 Tue, 24 Mar 2020 23:21:48 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 06/14] iotests: alphabetize standard imports
Date: Tue, 24 Mar 2020 19:20:55 -0400
Message-Id: <20200324232103.4195-7-jsnow@redhat.com>
In-Reply-To: <20200324232103.4195-1-jsnow@redhat.com>
References: <20200324232103.4195-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: Kevin Wolf <kwolf@redhat.com>, ehabkost@redhat.com, qemu-block@nongnu.org,
 philmd@redhat.com, armbru@redhat.com, Max Reitz <mreitz@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I had to fix a merge conflict, so do this tiny harmless thing while I'm
here.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/iotests.py | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 20da488ad6..2a0e22a3db 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -16,19 +16,19 @@
 # along with this program.  If not, see <http://www.gnu.org/licenses/>.
 #
=20
+import atexit
+from collections import OrderedDict
+import faulthandler
+import io
+import json
+import logging
 import os
 import re
+import signal
+import struct
 import subprocess
-import unittest
 import sys
-import struct
-import json
-import signal
-import logging
-import atexit
-import io
-from collections import OrderedDict
-import faulthandler
+import unittest
=20
 # pylint: disable=3Dimport-error, wrong-import-position
 sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'pytho=
n'))
--=20
2.21.1


