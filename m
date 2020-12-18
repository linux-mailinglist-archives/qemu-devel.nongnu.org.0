Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF93F2DDF81
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 09:29:33 +0100 (CET)
Received: from localhost ([::1]:46960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqB8m-0002H1-WF
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 03:29:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kqB6b-00014a-Q2
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 03:27:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kqB6Z-0008Kx-Sf
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 03:27:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608280035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IyOM+Z0OHLBQDCEfGPkwJkYvh8eEiYeLFrxG4f71cJA=;
 b=V7ffj/dt0uCl+ONtFUgw9uG6VKVd4vPQas5hMYPOrc4pRbzLVb/uowFqq1otI6QyoSbvoj
 fsQOGePDquysYk/+jtNOwnxs745thzYhUov6sB0osCZ1uh5+X2uq6HxiqvDJxroujeI+0I
 QRR45cgkhpByLpVgSkZJSmyLwr69iLk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-xlIZgDvzOr2PeSEC26iVNg-1; Fri, 18 Dec 2020 03:27:12 -0500
X-MC-Unique: xlIZgDvzOr2PeSEC26iVNg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BEB7A1005D56;
 Fri, 18 Dec 2020 08:27:11 +0000 (UTC)
Received: from thuth.com (ovpn-112-59.ams2.redhat.com [10.36.112.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 806E410013C0;
 Fri, 18 Dec 2020 08:27:10 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 13/14] hw/rtc/twl92230: Add missing 'break'
Date: Fri, 18 Dec 2020 09:27:03 +0100
Message-Id: <20201218082704.2014294-3-thuth@redhat.com>
In-Reply-To: <20201218082704.2014294-1-thuth@redhat.com>
References: <20201218082704.2014294-1-thuth@redhat.com>
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Add missing 'break' to fix:

  hw/rtc/twl92230.c: In function ‘menelaus_write’:
  hw/rtc/twl92230.c:713:5: error: label at end of compound statement
    713 |     default:
        |     ^~~~~~~

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20201211154605.511714-1-f4bug@amsat.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/rtc/twl92230.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/rtc/twl92230.c b/hw/rtc/twl92230.c
index a787bd247d..006d75e174 100644
--- a/hw/rtc/twl92230.c
+++ b/hw/rtc/twl92230.c
@@ -697,6 +697,7 @@ static void menelaus_write(void *opaque, uint8_t addr, uint8_t value)
 #ifdef VERBOSE
         printf("%s: unknown register %02x\n", __func__, addr);
 #endif
+        break;
     }
 }
 
-- 
2.27.0


