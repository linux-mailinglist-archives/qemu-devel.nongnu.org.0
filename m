Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 987C44BD999
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 13:14:06 +0100 (CET)
Received: from localhost ([::1]:60188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM7Zt-0004Vh-MI
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 07:14:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nM7Nw-0003un-2P
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 07:01:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nM7Nr-0000rR-Fz
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 07:01:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645444898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D4iU0Lo1ZUCPANSsG4BQ2oGgZ+KHVn0z1h3Ym/n+cZQ=;
 b=eIj6nKoE15mV50LE4sbmbYcdliwAWe4Np3Wrt450qGnvW/oWSf5aDMEbbSRgdkOQctUVFL
 kqJawVpiyil6EcEsU/K8uVYMhTKDGDww0utKSsW6SL3SoQ3LrIBzNb3rjn0/6seJyq9iIf
 rNWubEP/ERCTKaUKrQ3KYbMEHpp+7Ik=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-435-uMGQLiuHMa2szT-z2ytIKg-1; Mon, 21 Feb 2022 07:01:35 -0500
X-MC-Unique: uMGQLiuHMa2szT-z2ytIKg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0ABF51853020;
 Mon, 21 Feb 2022 12:01:34 +0000 (UTC)
Received: from thuth.com (unknown [10.39.195.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0EBFA73162;
 Mon, 21 Feb 2022 12:01:32 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/25] tests/qtest/ide-test: Remove bad retry_isa test
Date: Mon, 21 Feb 2022 12:59:48 +0100
Message-Id: <20220221120008.600114-6-thuth@redhat.com>
In-Reply-To: <20220221120008.600114-1-thuth@redhat.com>
References: <20220221120008.600114-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The retry_isa test is not doing what it was intended for: The
test_retry_flush() function ignores the machine parameter completely
and thus this test does not get run with the "isapc" machine.
Moreover, in the course of time, the test_retry_flush() has been
changed to depend on PCI-related functions, so this also cannot
be fixed by simply using the machine parameter now. The correct
fix would be to switch the whole test to libqos, but until someone
has time to do this, let's simply drop the retry_isa test for now.

Message-Id: <20220121120635.220644-1-thuth@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/ide-test.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/tests/qtest/ide-test.c b/tests/qtest/ide-test.c
index 84935578fb..19de3b4104 100644
--- a/tests/qtest/ide-test.c
+++ b/tests/qtest/ide-test.c
@@ -702,7 +702,7 @@ static void test_flush(void)
     free_pci_device(dev);
 }
 
-static void test_retry_flush(const char *machine)
+static void test_pci_retry_flush(void)
 {
     QTestState *qts;
     QPCIDevice *dev;
@@ -791,16 +791,6 @@ static void test_flush_empty_drive(void)
     ide_test_quit(qts);
 }
 
-static void test_pci_retry_flush(void)
-{
-    test_retry_flush("pc");
-}
-
-static void test_isa_retry_flush(void)
-{
-    test_retry_flush("isapc");
-}
-
 typedef struct Read10CDB {
     uint8_t opcode;
     uint8_t flags;
@@ -1051,7 +1041,6 @@ int main(int argc, char **argv)
     qtest_add_func("/ide/flush/nodev", test_flush_nodev);
     qtest_add_func("/ide/flush/empty_drive", test_flush_empty_drive);
     qtest_add_func("/ide/flush/retry_pci", test_pci_retry_flush);
-    qtest_add_func("/ide/flush/retry_isa", test_isa_retry_flush);
 
     qtest_add_func("/ide/cdrom/pio", test_cdrom_pio);
     qtest_add_func("/ide/cdrom/pio_large", test_cdrom_pio_large);
-- 
2.27.0


