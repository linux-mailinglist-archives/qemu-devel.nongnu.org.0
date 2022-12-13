Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E6C64B30F
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 11:18:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p52Ml-0006sT-An; Tue, 13 Dec 2022 05:18:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p52Mi-0006rp-MD
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 05:18:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p52Md-0007Ko-2N
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 05:18:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670926693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=5CePgMBQ0dO33igx331ZUo0hu1zoFyv5rUraGIKt668=;
 b=cQzhsKXhBy92CPJodRohwgxhB9Q0jZF0Pwoz5Qboh7xHxJbYl8Tvy4x8SbhnfwXIISSiRO
 /zZE46TR2HmQFVm1Ot9ygaFo+mWjdQe9UFUToE3cB5KrqFOS+aDyDbVbajNDhUpKUL1NZg
 /2KYkuLHiGcp8nuJuwzjl0kj4T89jM4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-sUr97290OouaBRnhw8Hx0g-1; Tue, 13 Dec 2022 05:18:11 -0500
X-MC-Unique: sUr97290OouaBRnhw8Hx0g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5EF4A803D4B;
 Tue, 13 Dec 2022 10:18:11 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2197753A3;
 Tue, 13 Dec 2022 10:18:09 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH] docs/interop: Change the vnc-ledstate-Pseudo-encoding doc
 into .rst
Date: Tue, 13 Dec 2022 11:18:06 +0100
Message-Id: <20221213101806.46640-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The file seems to contain perfectly valid rst syntax already, so
rename it to .rst and wire it up in the index.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/interop/index.rst                                           | 1 +
 ...tate-Pseudo-encoding.txt => vnc-ledstate-pseudo-encoding.rst} | 0
 2 files changed, 1 insertion(+)
 rename docs/interop/{vnc-ledstate-Pseudo-encoding.txt => vnc-ledstate-pseudo-encoding.rst} (100%)

diff --git a/docs/interop/index.rst b/docs/interop/index.rst
index b7632acb7b..6351ff9ba6 100644
--- a/docs/interop/index.rst
+++ b/docs/interop/index.rst
@@ -23,3 +23,4 @@ are useful for making QEMU interoperate with other software.
    vhost-user-gpu
    vhost-vdpa
    virtio-balloon-stats
+   vnc-ledstate-pseudo-encoding
diff --git a/docs/interop/vnc-ledstate-Pseudo-encoding.txt b/docs/interop/vnc-ledstate-pseudo-encoding.rst
similarity index 100%
rename from docs/interop/vnc-ledstate-Pseudo-encoding.txt
rename to docs/interop/vnc-ledstate-pseudo-encoding.rst
-- 
2.31.1


