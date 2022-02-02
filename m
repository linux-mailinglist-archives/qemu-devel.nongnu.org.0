Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAC74A75F3
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 17:32:33 +0100 (CET)
Received: from localhost ([::1]:47794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFIYa-0001t7-CI
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 11:32:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1nFGiO-0003dE-3U
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 09:34:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1nFGiK-0003Cn-RZ
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 09:34:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643812467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=btEjiwx03vsruxYCWqBsMG3oi5QhtN7ol7dFxIfkwH4=;
 b=bM3LgPX0koLbi15zAVacXARLLoSG7+iCJtuuKZdoR3DQCLalBs63M35465HVEBfm1T9kCc
 JvwRJxBawanQ7VQrQLy/CVIQe0cu4xqUuPuee1PqIcQYY8jwXFbM0HFfEB4IogaP6X6Xe3
 qZVymRfaF5E5VVR6HWK0Y7IS4yrwXYM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-153-YXE1HaqdNi2cfNvIMPWedw-1; Wed, 02 Feb 2022 09:34:26 -0500
X-MC-Unique: YXE1HaqdNi2cfNvIMPWedw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52C4D46860;
 Wed,  2 Feb 2022 14:34:25 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.193.0])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B06F52B4B1;
 Wed,  2 Feb 2022 14:34:23 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] qemu-options: fix incorrect description for '-drive index='
Date: Wed,  2 Feb 2022 15:34:22 +0100
Message-Id: <20220202143422.912070-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
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
Cc: qemu-trivial@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu-options.hx contains grammar that a native English-speaking
person would never use.

Replace "This option defines where is connected the drive" by
"This option defines where the drive is connected".

Fixes: https://gitlab.com/qemu-project/qemu/-/issues/853
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 qemu-options.hx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index ba3ae6a42aa3..094a6c1d7c28 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1377,7 +1377,7 @@ SRST
         the bus number and the unit id.
 
     ``index=index``
-        This option defines where is connected the drive by using an
+        This option defines where the drive is connected by using an
         index in the list of available connectors of a given interface
         type.
 
-- 
2.34.1


