Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21ED14E3EAB
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 13:42:05 +0100 (CET)
Received: from localhost ([::1]:36596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWdps-00065R-68
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 08:42:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nWdb2-0005DS-5s
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 08:26:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nWday-0002W8-EN
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 08:26:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647951977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AeByew+rfx9VOVEE+bbHIcv5JDpO5dlZ5jQWHHPqrMg=;
 b=eNzuSqa5UjD6OgunlgA7xPLv1MuGF8kvDbnhTPfHMAbcuh0hxSuMYyTsLuzrsT13orS772
 XoyfvTfCkUFG5IVo4db2mktfq8/B/pj7hPEfgvL4iH4DaSWTY2UzZdMBxtbg7iFqFrdJSo
 o2NQtZv3877l3UoOUFNnDuDeoHY0cxM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-503-LkAO4wVDPSG3hjEgIOCXWw-1; Tue, 22 Mar 2022 08:26:14 -0400
X-MC-Unique: LkAO4wVDPSG3hjEgIOCXWw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D4BD80281D;
 Tue, 22 Mar 2022 12:26:14 +0000 (UTC)
Received: from localhost (unknown [10.39.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 64CCC40D0160;
 Tue, 22 Mar 2022 12:26:13 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 02/21] vl: typo fix in a comment
Date: Tue, 22 Mar 2022 16:25:42 +0400
Message-Id: <20220322122601.927238-3-marcandre.lureau@redhat.com>
In-Reply-To: <20220322122601.927238-1-marcandre.lureau@redhat.com>
References: <20220322122601.927238-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 softmmu/vl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index f7d7c9550d7e..7e4d55bc1dcc 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1961,7 +1961,7 @@ static void qemu_create_early_backends(void)
     object_option_foreach_add(object_create_early);
 
     /* spice needs the timers to be initialized by this point */
-    /* spice must initialize before audio as it changes the default auiodev */
+    /* spice must initialize before audio as it changes the default audiodev */
     /* spice must initialize before chardevs (for spicevmc and spiceport) */
     qemu_spice.init();
 
-- 
2.35.1.273.ge6ebfd0e8cbb


