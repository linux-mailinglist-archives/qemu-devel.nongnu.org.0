Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A551D4E21
	for <lists+qemu-devel@lfdr.de>; Fri, 15 May 2020 14:53:28 +0200 (CEST)
Received: from localhost ([::1]:38186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZZqA-0006Zq-MX
	for lists+qemu-devel@lfdr.de; Fri, 15 May 2020 08:53:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jZZij-0002OU-Ss
 for qemu-devel@nongnu.org; Fri, 15 May 2020 08:45:45 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:42955
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jZZih-00027i-RB
 for qemu-devel@nongnu.org; Fri, 15 May 2020 08:45:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589546743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=45oXRsfshnOH1954iXfeEdixhGXfX9DsYo4dNlXFFn4=;
 b=XuYjkf+QU3AomzKFEYPqrAle3myGxVtsyhR2/zCJck0wBfTBrqbv7BcATvKkFKPK/3iP6s
 aDGtPu5k8hZfwKauIFoI2P65kTagzbWR2kbP93KcfoaEVpG7Uxv7H1Gd8xsMFpwkOEfXR2
 hWiYkAuYsB9iQ4XGHlk2rmgCnBeM6Ag=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-1JvlwALlN82uMiHsKFGFVA-1; Fri, 15 May 2020 08:45:38 -0400
X-MC-Unique: 1JvlwALlN82uMiHsKFGFVA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95219107ACF3;
 Fri, 15 May 2020 12:45:37 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-113-110.ams2.redhat.com
 [10.36.113.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9BD062E024;
 Fri, 15 May 2020 12:45:36 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 06/51] iotests: Fix incomplete type declarations
Date: Fri, 15 May 2020 14:44:36 +0200
Message-Id: <20200515124521.335403-7-kwolf@redhat.com>
In-Reply-To: <20200515124521.335403-1-kwolf@redhat.com>
References: <20200515124521.335403-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/15 00:07:24
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We need to fix only a few places so that iotests.py can pass
mypy --disallow-incomplete-defs, which seems to be a desirable option to
have enabled in the long run.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20200511163529.349329-2-kwolf@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/iotests.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 6c0e781af7..1d7f6fd7cf 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -1040,7 +1040,7 @@ def _verify_cache_mode(supported_cache_modes: Sequence[str] = ()) -> None:
     if supported_cache_modes and (cachemode not in supported_cache_modes):
         notrun('not suitable for this cache mode: %s' % cachemode)
 
-def _verify_aio_mode(supported_aio_modes: Sequence[str] = ()):
+def _verify_aio_mode(supported_aio_modes: Sequence[str] = ()) -> None:
     if supported_aio_modes and (aiomode not in supported_aio_modes):
         notrun('not suitable for this aio mode: %s' % aiomode)
 
@@ -1087,7 +1087,8 @@ def skip_if_unsupported(required_formats=(), read_only=False):
     '''Skip Test Decorator
        Runs the test if all the required formats are whitelisted'''
     def skip_test_decorator(func):
-        def func_wrapper(test_case: QMPTestCase, *args, **kwargs):
+        def func_wrapper(test_case: QMPTestCase, *args: List[Any],
+                         **kwargs: Dict[str, Any]) -> None:
             if callable(required_formats):
                 fmts = required_formats(test_case)
             else:
@@ -1097,9 +1098,8 @@ def skip_if_unsupported(required_formats=(), read_only=False):
             if usf_list:
                 msg = f'{test_case}: formats {usf_list} are not whitelisted'
                 test_case.case_skip(msg)
-                return None
             else:
-                return func(test_case, *args, **kwargs)
+                func(test_case, *args, **kwargs)
         return func_wrapper
     return skip_test_decorator
 
-- 
2.25.4


