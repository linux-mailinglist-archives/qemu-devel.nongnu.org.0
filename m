Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB751D3EDA
	for <lists+qemu-devel@lfdr.de>; Thu, 14 May 2020 22:18:09 +0200 (CEST)
Received: from localhost ([::1]:34920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZKIy-0002jC-8o
	for lists+qemu-devel@lfdr.de; Thu, 14 May 2020 16:18:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1jZKHH-00005t-Od
 for qemu-devel@nongnu.org; Thu, 14 May 2020 16:16:23 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:22923
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1jZKHH-0003Q1-1N
 for qemu-devel@nongnu.org; Thu, 14 May 2020 16:16:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589487382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nVukJV+4xGJoj7qVA4WNmR82aGr/vcZpYP525uF32Ek=;
 b=eh7oCJntGNTGyT1N31xoYoYeIIy5uxZ4ZgcPsfi7DjasDvmFVYBZ932AgagA+rXSKwYadj
 be16hFzlu1WNw9X9fhY/tVhlJrxyqypyaxc7S3152RZYD+tMlgl4MXXoFeb24O39tWoY7T
 nV0eEXR8xpIGEoVwnGzTiBhhBHuHgew=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-118-ACk-1le_N5ywFOB5LXB1ug-1; Thu, 14 May 2020 16:16:20 -0400
X-MC-Unique: ACk-1le_N5ywFOB5LXB1ug-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44A0C107ACCA;
 Thu, 14 May 2020 20:16:19 +0000 (UTC)
Received: from probe.redhat.com (ovpn-119-184.rdu2.redhat.com [10.10.119.184])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 97D9C10013D9;
 Thu, 14 May 2020 20:16:18 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] iotests: log to stderr instead of stdout
Date: Thu, 14 May 2020 16:16:13 -0400
Message-Id: <20200514201614.19941-3-jsnow@redhat.com>
In-Reply-To: <20200514201614.19941-1-jsnow@redhat.com>
References: <20200514201614.19941-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/14 11:41:05
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Separate the streams; stdout is for test diff output, stderr is for
control messages and things for the human to look at.

(Cough, unfortunately, I didn't realize that ./check actually just
always redirects both, so even on STDERR, you can't see warnings.
Oh well...)

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/iotests.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 1caa7812de..9231767acf 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -1171,7 +1171,11 @@ def execute_setup_common(supported_fmts: Sequence[str] = (),
     debug = '-d' in sys.argv
     if debug:
         sys.argv.remove('-d')
-    logging.basicConfig(level=(logging.DEBUG if debug else logging.WARN))
+
+    logging.basicConfig(
+        level=logging.DEBUG if debug else logging.WARN,
+        stream=sys.stderr,
+    )
 
     _verify_image_format(supported_fmts, unsupported_fmts)
     _verify_protocol(supported_protocols, unsupported_protocols)
-- 
2.21.1


