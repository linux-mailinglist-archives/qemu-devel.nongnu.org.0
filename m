Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CB125ABBA
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Sep 2020 15:07:06 +0200 (CEST)
Received: from localhost ([::1]:46930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDSTh-0001t3-Ni
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 09:07:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kDSMR-00061E-6e
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 08:59:35 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:41705
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kDSMN-00075r-TW
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 08:59:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599051570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dbGTsYCaohFTZAHmgt2Z8zrHh8YMczAD832vvLYsmIw=;
 b=PO3EnnU+0Ft5xC08AHWK2IvsaY7KQ/nn82gRCSY1waXECmrrZkuhceMs5UUcbeWpH0iHps
 05p8+jFsfGfyG8xu3LpUy7uUXrX7O6qONa31ibEh2UNA3RFP+0PImSJl8ltSh2jb9XKd/U
 DBpNKOqk2mqe6A2tVgOSotmFt4AOtZ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-Gx5iuMrtPYaMYHuvgh-AFQ-1; Wed, 02 Sep 2020 08:59:29 -0400
X-MC-Unique: Gx5iuMrtPYaMYHuvgh-AFQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D683A884E4C
 for <qemu-devel@nongnu.org>; Wed,  2 Sep 2020 12:59:25 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 851487AEFC;
 Wed,  2 Sep 2020 12:59:25 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/39] tests: qga has virtio-serial by default when host has it
Date: Wed,  2 Sep 2020 08:58:53 -0400
Message-Id: <20200902125917.26021-16-pbonzini@redhat.com>
In-Reply-To: <20200902125917.26021-1-pbonzini@redhat.com>
References: <20200902125917.26021-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 03:24:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

When dumping the default configuration, don't expect virtio-serial as
the configured method, unless the host has CONFIG_VIRTIO_SERIAL.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20200828110734.1638685-6-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/test-qga.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/test-qga.c b/tests/test-qga.c
index 4ac4c22109..122730d326 100644
--- a/tests/test-qga.c
+++ b/tests/test-qga.c
@@ -728,10 +728,12 @@ static void test_qga_config(gconstpointer data)
     g_assert_false(g_key_file_get_boolean(kf, "general", "daemon", &error));
     g_assert_no_error(error);
 
+#ifdef CONFIG_VIRTIO_SERIAL
     str = g_key_file_get_string(kf, "general", "method", &error);
     g_assert_no_error(error);
     g_assert_cmpstr(str, ==, "virtio-serial");
     g_free(str);
+#endif
 
     str = g_key_file_get_string(kf, "general", "path", &error);
     g_assert_no_error(error);
-- 
2.26.2



