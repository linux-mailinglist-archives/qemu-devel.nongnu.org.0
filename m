Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40431458EC0
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 13:53:59 +0100 (CET)
Received: from localhost ([::1]:58196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp8pa-00020g-Cf
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 07:53:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mp8eI-0005XE-Ns
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 07:42:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mp8eH-0000PF-15
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 07:42:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637584935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BqUl6fKnOGm+5aA3uXOmaD8caSm6TPbeQDuCY9gqd2Y=;
 b=h+6FMRaTHPXJr59BmoYVl5KQkXpQ+lRMN7KSJ7FQSDzE4sHu2VF3zL4ob8u6w8t9iNARY0
 qLC0hR68UdAW5xde7W6snE5iyaE7RzrCOsYbWTmvV8t6douRTiWvIsQw4xveLjxdbVXjQs
 JulQJ23EcsM35jK7m5wJg1WbVot8EvQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-190-h934rv2cPgSmQw2Opc6QHQ-1; Mon, 22 Nov 2021 07:42:12 -0500
X-MC-Unique: h934rv2cPgSmQw2Opc6QHQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EB001018722;
 Mon, 22 Nov 2021 12:42:11 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.234])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 474705C1D0;
 Mon, 22 Nov 2021 12:41:34 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 891AD1800934; Mon, 22 Nov 2021 13:40:15 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 6/8] hw/i386/microvm: Reduce annoying debug message in
 dt_setup_microvm()
Date: Mon, 22 Nov 2021 13:40:13 +0100
Message-Id: <20211122124015.909318-7-kraxel@redhat.com>
In-Reply-To: <20211122124015.909318-1-kraxel@redhat.com>
References: <20211122124015.909318-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Darren Kenny <darren.kenny@oracle.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Fixes: f5918a99283 ("microvm: add device tree support.")
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Sergio Lopez <slp@redhat.com>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Message-Id: <20211117174331.1715144-1-philmd@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/i386/microvm-dt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/i386/microvm-dt.c b/hw/i386/microvm-dt.c
index 875ba9196394..6ee6c42904d2 100644
--- a/hw/i386/microvm-dt.c
+++ b/hw/i386/microvm-dt.c
@@ -327,7 +327,9 @@ void dt_setup_microvm(MicrovmMachineState *mms)
     dt_setup_sys_bus(mms);
 
     /* add to fw_cfg */
-    fprintf(stderr, "%s: add etc/fdt to fw_cfg\n", __func__);
+    if (debug) {
+        fprintf(stderr, "%s: add etc/fdt to fw_cfg\n", __func__);
+    }
     fw_cfg_add_file(x86ms->fw_cfg, "etc/fdt", mms->fdt, size);
 
     if (debug) {
-- 
2.33.1


