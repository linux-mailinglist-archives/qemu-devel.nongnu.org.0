Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 086E04CFCDB
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 12:29:29 +0100 (CET)
Received: from localhost ([::1]:47824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRBYO-0000WD-4B
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 06:29:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nRAit-0004xJ-JL
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:36:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nRAir-0008Ez-P4
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:36:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646649373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4874DDYbYz6km2lM9neZh0up/lHfrHHriosyfvkr5ZA=;
 b=caEIZ2X4Tt6Rp0LOPkNxbE49YWo6Vemt287RtpYETytTydt+43n9ObIpVWVIOeGYJJA8Rk
 Y2dIpwZbfB8NaIwy7xGIEqNBrk0viXqihHdhQu8IosjB+x+RKvLO2rq+MoDj9LQLLIxWXY
 H/wcCjfoWUk+IrgPfz56g0jITIuZbvo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-225-yMHzpgRJPgesu3UrUfxw3g-1; Mon, 07 Mar 2022 05:36:09 -0500
X-MC-Unique: yMHzpgRJPgesu3UrUfxw3g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E2FC835DE4;
 Mon,  7 Mar 2022 10:36:08 +0000 (UTC)
Received: from localhost (unknown [10.39.194.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C40C57B6D3;
 Mon,  7 Mar 2022 10:36:07 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 06/23] tests/qemu-iotests/testrunner: Quote "case not run"
 lines in TAP mode
Date: Mon,  7 Mar 2022 11:35:32 +0100
Message-Id: <20220307103549.808809-7-hreitz@redhat.com>
In-Reply-To: <20220307103549.808809-1-hreitz@redhat.com>
References: <20220307103549.808809-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

In TAP mode, the stdout is reserved for the TAP protocol, so we
have to make sure to mark other lines with a comment '#' character
at the beginning to avoid that the TAP parser at the other end
gets confused.

To test this condition, run "configure" for example with:

 --block-drv-rw-whitelist=copy-before-write,qcow2,raw,file,host_device,blkdebug,null-co,copy-on-read

so that iotest 041 will report that some tests are not run due to
the missing "quorum" driver. Without this change, "make check-block"
fails since the meson tap parser gets confused by these messages.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220223124353.3273898-1-thuth@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/testrunner.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
index 9a94273975..0c7dc34a9e 100644
--- a/tests/qemu-iotests/testrunner.py
+++ b/tests/qemu-iotests/testrunner.py
@@ -365,7 +365,10 @@ def run_test(self, test: str,
                                  description=res.description)
 
         if res.casenotrun:
-            print(res.casenotrun)
+            if self.tap:
+                print('#' + res.casenotrun.replace('\n', '\n#'))
+            else:
+                print(res.casenotrun)
 
         return res
 
-- 
2.34.1


