Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 398EF251EBE
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 20:01:17 +0200 (CEST)
Received: from localhost ([::1]:52416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAdG0-0001wZ-7u
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 14:01:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kAdDy-0000Eg-TE
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 13:59:10 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:37864
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kAdDx-0003TV-C6
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 13:59:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598378348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=voQMKLME5p6u9gW2huG6GbQRmI8Y9rFCBNTU8I1G4TM=;
 b=Fer3h0AHbpEKnFc5drawsD+yp5z9S1gHXlJUJIwGFDSAyzxgv+wx6xnXq0OTCn6txpkj0I
 dWSEeJgXa2d+t3mwaxA+6B7sDRBGYnxa4cS/U+6DZ8ZX11Iq3G391QMs5VzTkBW0j0+zoi
 K03n2rOknNUYpMQxiuB1NX+PrTIdEzU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-SX3fozoyPZmuoyepu3varQ-1; Tue, 25 Aug 2020 13:59:04 -0400
X-MC-Unique: SX3fozoyPZmuoyepu3varQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36D86100746A;
 Tue, 25 Aug 2020 17:59:03 +0000 (UTC)
Received: from localhost (unknown [10.36.110.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F9FB1002D49;
 Tue, 25 Aug 2020 17:58:59 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/5] meson: use meson mandir instead of qemu_mandir
Date: Tue, 25 Aug 2020 21:58:26 +0400
Message-Id: <20200825175827.355940-5-marcandre.lureau@redhat.com>
In-Reply-To: <20200825175827.355940-1-marcandre.lureau@redhat.com>
References: <20200825175827.355940-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120;
 envelope-from=marcandre.lureau@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 10:39:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.958,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: sw@weilnetz.de, berrange@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

When cross-compiling, by default qemu_mandir is 'c:\Program
Files\QEMU', which is not recognized as being an absolute path, and
meson will end up adding the prefix again.

Use the pre-prefixed meson mandir option instead.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 33281cecc3..0720a7d684 100644
--- a/meson.build
+++ b/meson.build
@@ -1210,7 +1210,7 @@ if build_docs
                           output: man,
                           capture: true,
                           install: true,
-                          install_dir: config_host['mandir'] / 'man7',
+                          install_dir: get_option('mandir') / 'man7',
                           command: [pod2man, '--utf8', '--section=7', '--center=" "',
                                     '--release=" "', '@INPUT@'])
     endforeach
-- 
2.26.2


