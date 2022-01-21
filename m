Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A93495EEF
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 13:23:22 +0100 (CET)
Received: from localhost ([::1]:48682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAswr-0008Lv-4H
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 07:23:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nAsgm-0005I8-Jh
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 07:06:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nAsgk-0004rY-TG
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 07:06:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642766802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=HjDEPdTh+ZNU7qLjzI2Lk2ht0UVsLNKKbM/C7Tx0xH4=;
 b=OmVzFcDH8LswRuNUCw8nfO6sq2aau1DGYGTAtzu+KrjTwNFOTax6p2oKOfP2mstTJA7pXw
 TbJm72DQpNAeIZA5YccomlSZKaj4I4KM37PAHQXEyHWXzrhb/UXo6rEE2um2UD/jtku8df
 RGv9ooRkyEXxHk1nh+UcYXyw/uQolps=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-532-SjQM1HolNhaut9WS99Fp5A-1; Fri, 21 Jan 2022 07:06:38 -0500
X-MC-Unique: SjQM1HolNhaut9WS99Fp5A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B881814245;
 Fri, 21 Jan 2022 12:06:38 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C6F10753F6;
 Fri, 21 Jan 2022 12:06:36 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	John Snow <jsnow@redhat.com>
Subject: [PATCH] tests/qtest/ide-test: Remove bad retry_isa test
Date: Fri, 21 Jan 2022 13:06:35 +0100
Message-Id: <20220121120635.220644-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-block@nongnu.org
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

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/ide-test.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/tests/qtest/ide-test.c b/tests/qtest/ide-test.c
index 3f8081e77d..5f9d084052 100644
--- a/tests/qtest/ide-test.c
+++ b/tests/qtest/ide-test.c
@@ -701,7 +701,7 @@ static void test_flush(void)
     free_pci_device(dev);
 }
 
-static void test_retry_flush(const char *machine)
+static void test_pci_retry_flush(void)
 {
     QTestState *qts;
     QPCIDevice *dev;
@@ -790,16 +790,6 @@ static void test_flush_empty_drive(void)
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
@@ -1050,7 +1040,6 @@ int main(int argc, char **argv)
     qtest_add_func("/ide/flush/nodev", test_flush_nodev);
     qtest_add_func("/ide/flush/empty_drive", test_flush_empty_drive);
     qtest_add_func("/ide/flush/retry_pci", test_pci_retry_flush);
-    qtest_add_func("/ide/flush/retry_isa", test_isa_retry_flush);
 
     qtest_add_func("/ide/cdrom/pio", test_cdrom_pio);
     qtest_add_func("/ide/cdrom/pio_large", test_cdrom_pio_large);
-- 
2.27.0


