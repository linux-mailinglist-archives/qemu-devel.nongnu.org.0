Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6674A2F687B
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 18:58:38 +0100 (CET)
Received: from localhost ([::1]:37426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l06tJ-0001Sk-D3
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 12:58:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l061w-0007J2-RW
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 12:03:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l061k-0006oe-7p
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 12:03:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610643791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=11QPy0wHX9mepMvqvaTwI4Is3PznSJANnlkJzhuKDZI=;
 b=gjXcvzhfczNQU++hxyIGKz9vO66YAnn6Aw4UUntKRg6SccTsfM7+7Xv4a9PRinIEBuzvaB
 kPGIJWPW+TzgYtzL3g41jeCI5ttqJbD4Vya+wESz5BWwXX3jexiYmbEcLDY9DZfFGX3bRb
 h+36PNO07bE2E0mmyFjZeOjMRghm8/M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-siUNXCnSMnSPdkazNlDocg-1; Thu, 14 Jan 2021 12:03:10 -0500
X-MC-Unique: siUNXCnSMnSPdkazNlDocg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 093E9CC621;
 Thu, 14 Jan 2021 17:03:09 +0000 (UTC)
Received: from localhost (ovpn-115-31.ams2.redhat.com [10.36.115.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 98B846F439;
 Thu, 14 Jan 2021 17:03:08 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 01/10] iotests.py: Assume a couple of variables as given
Date: Thu, 14 Jan 2021 18:02:55 +0100
Message-Id: <20210114170304.87507-2-mreitz@redhat.com>
In-Reply-To: <20210114170304.87507-1-mreitz@redhat.com>
References: <20210114170304.87507-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are a couple of environment variables that we fetch with
os.environ.get() without supplying a default.  Clearly they are required
and expected to be set by the ./check script (as evidenced by
execute_setup_common(), which checks for test_dir and
qemu_default_machine to be set, and aborts if they are not).

Using .get() this way has the disadvantage of returning an Optional[str]
type, which mypy will complain about when tests just assume these values
to be str.

Use [] instead, which raises a KeyError for environment variables that
are not set.  When this exception is raised, catch it and move the abort
code from execute_setup_common() there.

Drop the 'assert iotests.sock_dir is not None' from iotest 300, because
that sort of thing is precisely what this patch wants to prevent.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/300        |  1 -
 tests/qemu-iotests/iotests.py | 26 +++++++++++++-------------
 2 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/tests/qemu-iotests/300 b/tests/qemu-iotests/300
index 5b75121b84..b864a21d5e 100755
--- a/tests/qemu-iotests/300
+++ b/tests/qemu-iotests/300
@@ -27,7 +27,6 @@ import qemu
 
 BlockBitmapMapping = List[Dict[str, Union[str, List[Dict[str, str]]]]]
 
-assert iotests.sock_dir is not None
 mig_sock = os.path.join(iotests.sock_dir, 'mig_sock')
 
 
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index dcdcd0387f..52facb8e04 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -75,12 +75,20 @@ qemu_opts = os.environ.get('QEMU_OPTIONS', '').strip().split(' ')
 
 imgfmt = os.environ.get('IMGFMT', 'raw')
 imgproto = os.environ.get('IMGPROTO', 'file')
-test_dir = os.environ.get('TEST_DIR')
-sock_dir = os.environ.get('SOCK_DIR')
 output_dir = os.environ.get('OUTPUT_DIR', '.')
-cachemode = os.environ.get('CACHEMODE')
-aiomode = os.environ.get('AIOMODE')
-qemu_default_machine = os.environ.get('QEMU_DEFAULT_MACHINE')
+
+try:
+    test_dir = os.environ['TEST_DIR']
+    sock_dir = os.environ['SOCK_DIR']
+    cachemode = os.environ['CACHEMODE']
+    aiomode = os.environ['AIOMODE']
+    qemu_default_machine = os.environ['QEMU_DEFAULT_MACHINE']
+except KeyError:
+    # We are using these variables as proxies to indicate that we're
+    # not being run via "check". There may be other things set up by
+    # "check" that individual test cases rely on.
+    sys.stderr.write('Please run this test via the "check" script\n')
+    sys.exit(os.EX_USAGE)
 
 socket_scm_helper = os.environ.get('SOCKET_SCM_HELPER', 'socket_scm_helper')
 
@@ -1294,14 +1302,6 @@ def execute_setup_common(supported_fmts: Sequence[str] = (),
     """
     # Note: Python 3.6 and pylint do not like 'Collection' so use 'Sequence'.
 
-    # We are using TEST_DIR and QEMU_DEFAULT_MACHINE as proxies to
-    # indicate that we're not being run via "check". There may be
-    # other things set up by "check" that individual test cases rely
-    # on.
-    if test_dir is None or qemu_default_machine is None:
-        sys.stderr.write('Please run this test via the "check" script\n')
-        sys.exit(os.EX_USAGE)
-
     debug = '-d' in sys.argv
     if debug:
         sys.argv.remove('-d')
-- 
2.29.2


