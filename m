Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C4F2DC566
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 18:33:42 +0100 (CET)
Received: from localhost ([::1]:60906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpagG-00020D-Bx
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 12:33:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kpacu-0008Uj-TG
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 12:30:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kpacq-00014r-O9
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 12:30:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608139807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nZQfHykoTAnWq6BRd1NsCrVd5DVh1QMstHYsQhrpMo4=;
 b=NoJ28S7eIsPJ22FG7mXxe5ATRfMriFeU2XZZOqOQ5wjwqXdd4sV94aN15NbAkbj2kv+NZT
 SsA1+g7mjj/APkJEXv3CgA7A30FnnTZHTJ7Fp1BWSHlSgdf4HI2XXGixBVJHybxuyju3OL
 7yQxG8iz/4pMKtoLi8+ddC/zo0L4v+M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-alewVLyXM-mIYGRBPP32XA-1; Wed, 16 Dec 2020 12:30:05 -0500
X-MC-Unique: alewVLyXM-mIYGRBPP32XA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 830F3C73AC;
 Wed, 16 Dec 2020 17:30:03 +0000 (UTC)
Received: from thuth.com (ovpn-113-7.ams2.redhat.com [10.36.113.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 06F9A10021B3;
 Wed, 16 Dec 2020 17:30:01 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 04/12] hw/timer/renesas_tmr: silence the compiler warnings
Date: Wed, 16 Dec 2020 18:29:41 +0100
Message-Id: <20201216172949.57380-5-thuth@redhat.com>
In-Reply-To: <20201216172949.57380-1-thuth@redhat.com>
References: <20201216172949.57380-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: Chen Qun <kuhn.chenqun@huawei.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Chen Qun <kuhn.chenqun@huawei.com>

When using -Wimplicit-fallthrough in our CFLAGS, the compiler showed warning:
../hw/timer/renesas_tmr.c: In function ‘tmr_read’:
../hw/timer/renesas_tmr.c:221:19: warning: this statement may fall through [-Wimplicit-fallthrough=]
  221 |         } else if (ch == 0) {i
      |                   ^
../hw/timer/renesas_tmr.c:224:5: note: here
  224 |     case A_TCORB:
      |     ^~~~

Add the corresponding "fall through" comment to fix it.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20201211152426.350966-5-thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/timer/renesas_tmr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/timer/renesas_tmr.c b/hw/timer/renesas_tmr.c
index 446f2eacdd..e03a8155b2 100644
--- a/hw/timer/renesas_tmr.c
+++ b/hw/timer/renesas_tmr.c
@@ -221,6 +221,7 @@ static uint64_t tmr_read(void *opaque, hwaddr addr, unsigned size)
         } else if (ch == 0) {
             return concat_reg(tmr->tcora);
         }
+        /* fall through */
     case A_TCORB:
         if (size == 1) {
             return tmr->tcorb[ch];
-- 
2.27.0


