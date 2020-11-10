Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3522AD4F8
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 12:28:47 +0100 (CET)
Received: from localhost ([::1]:48406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcRpO-00059K-6w
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 06:28:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kcRZU-0007Ye-Nv
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:12:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kcRZS-0004gc-KR
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:12:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605006737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=E+CzjmQonmRthWUrueIT9LWOXWGueoIYO2+N/mwwYzU=;
 b=Stszob+pc/ElA/7rzqHY+P1fKAx+d2vD+Mvx7yj+PTpnNqUJeOTZOhDBrP3YU4GBaLGV4/
 c9U28F+FgUgpakY5WCMjlue/eTuinUKyqgE/Zx4jqi7OqMzjkPxA5OUltwqVC2wdY5ekb4
 eJBNF7VaTRwUAcD/pJ3UwmY5EmyC0fs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-HMQW4cv8OnW2T5rsUZEUcw-1; Tue, 10 Nov 2020 06:12:15 -0500
X-MC-Unique: HMQW4cv8OnW2T5rsUZEUcw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A23CB87951A;
 Tue, 10 Nov 2020 11:12:14 +0000 (UTC)
Received: from thuth.com (ovpn-113-192.ams2.redhat.com [10.36.113.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0BC8A10013D9;
 Tue, 10 Nov 2020 11:12:11 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 17/19] qtest: Update references to parse_escape() in comments
Date: Tue, 10 Nov 2020 12:11:30 +0100
Message-Id: <20201110111132.559399-18-thuth@redhat.com>
In-Reply-To: <20201110111132.559399-1-thuth@redhat.com>
References: <20201110111132.559399-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 02:00:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Cornelia Huck <cohuck@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

In commit 61030280ca2d67bd in 2018 we renamed the parse_escape()
function to parse_interpolation(), but we didn't catch the references
to this function in doc comments in libqtest.h. Update them.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20201109162621.18885-1-peter.maydell@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/libqos/libqtest.h | 18 +++++++++---------
 tests/qtest/libqtest-single.h |  2 +-
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/tests/qtest/libqos/libqtest.h b/tests/qtest/libqos/libqtest.h
index 5c959f1853..724f65aa94 100644
--- a/tests/qtest/libqos/libqtest.h
+++ b/tests/qtest/libqos/libqtest.h
@@ -88,7 +88,7 @@ void qtest_quit(QTestState *s);
  * @fds: array of file descriptors
  * @fds_num: number of elements in @fds
  * @fmt: QMP message to send to qemu, formatted like
- * qobject_from_jsonf_nofail().  See parse_escape() for what's
+ * qobject_from_jsonf_nofail().  See parse_interpolation() for what's
  * supported after '%'.
  *
  * Sends a QMP message to QEMU with fds and returns the response.
@@ -101,7 +101,7 @@ QDict *qtest_qmp_fds(QTestState *s, int *fds, size_t fds_num,
  * qtest_qmp:
  * @s: #QTestState instance to operate on.
  * @fmt: QMP message to send to qemu, formatted like
- * qobject_from_jsonf_nofail().  See parse_escape() for what's
+ * qobject_from_jsonf_nofail().  See parse_interpolation() for what's
  * supported after '%'.
  *
  * Sends a QMP message to QEMU and returns the response.
@@ -113,7 +113,7 @@ QDict *qtest_qmp(QTestState *s, const char *fmt, ...)
  * qtest_qmp_send:
  * @s: #QTestState instance to operate on.
  * @fmt: QMP message to send to qemu, formatted like
- * qobject_from_jsonf_nofail().  See parse_escape() for what's
+ * qobject_from_jsonf_nofail().  See parse_interpolation() for what's
  * supported after '%'.
  *
  * Sends a QMP message to QEMU and leaves the response in the stream.
@@ -138,7 +138,7 @@ void qtest_qmp_send_raw(QTestState *s, const char *fmt, ...)
  * @fds: array of file descriptors
  * @fds_num: number of elements in @fds
  * @fmt: QMP message to send to QEMU, formatted like
- * qobject_from_jsonf_nofail().  See parse_escape() for what's
+ * qobject_from_jsonf_nofail().  See parse_interpolation() for what's
  * supported after '%'.
  * @ap: QMP message arguments
  *
@@ -152,7 +152,7 @@ QDict *qtest_vqmp_fds(QTestState *s, int *fds, size_t fds_num,
  * qtest_vqmp:
  * @s: #QTestState instance to operate on.
  * @fmt: QMP message to send to QEMU, formatted like
- * qobject_from_jsonf_nofail().  See parse_escape() for what's
+ * qobject_from_jsonf_nofail().  See parse_interpolation() for what's
  * supported after '%'.
  * @ap: QMP message arguments
  *
@@ -167,7 +167,7 @@ QDict *qtest_vqmp(QTestState *s, const char *fmt, va_list ap)
  * @fds: array of file descriptors
  * @fds_num: number of elements in @fds
  * @fmt: QMP message to send to QEMU, formatted like
- * qobject_from_jsonf_nofail().  See parse_escape() for what's
+ * qobject_from_jsonf_nofail().  See parse_interpolation() for what's
  * supported after '%'.
  * @ap: QMP message arguments
  *
@@ -181,7 +181,7 @@ void qtest_qmp_vsend_fds(QTestState *s, int *fds, size_t fds_num,
  * qtest_qmp_vsend:
  * @s: #QTestState instance to operate on.
  * @fmt: QMP message to send to QEMU, formatted like
- * qobject_from_jsonf_nofail().  See parse_escape() for what's
+ * qobject_from_jsonf_nofail().  See parse_interpolation() for what's
  * supported after '%'.
  * @ap: QMP message arguments
  *
@@ -636,7 +636,7 @@ void qtest_add_abrt_handler(GHookFunc fn, const void *data);
  * qtest_qmp_assert_success:
  * @qts: QTestState instance to operate on
  * @fmt: QMP message to send to qemu, formatted like
- * qobject_from_jsonf_nofail().  See parse_escape() for what's
+ * qobject_from_jsonf_nofail().  See parse_interpolation() for what's
  * supported after '%'.
  *
  * Sends a QMP message to QEMU and asserts that a 'return' key is present in
@@ -683,7 +683,7 @@ void qtest_qmp_device_add_qdict(QTestState *qts, const char *drv,
  * @driver: Name of the device that should be added
  * @id: Identification string
  * @fmt: QMP message to send to qemu, formatted like
- * qobject_from_jsonf_nofail().  See parse_escape() for what's
+ * qobject_from_jsonf_nofail().  See parse_interpolation() for what's
  * supported after '%'.
  *
  * Generic hot-plugging test via the device_add QMP command.
diff --git a/tests/qtest/libqtest-single.h b/tests/qtest/libqtest-single.h
index 176979a2ce..0d7f568678 100644
--- a/tests/qtest/libqtest-single.h
+++ b/tests/qtest/libqtest-single.h
@@ -47,7 +47,7 @@ static inline void qtest_end(void)
 /**
  * qmp:
  * @fmt...: QMP message to send to qemu, formatted like
- * qobject_from_jsonf_nofail().  See parse_escape() for what's
+ * qobject_from_jsonf_nofail().  See parse_interpolation() for what's
  * supported after '%'.
  *
  * Sends a QMP message to QEMU and returns the response.
-- 
2.18.4


