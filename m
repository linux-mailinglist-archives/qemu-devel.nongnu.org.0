Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E83950DC6D
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 11:22:46 +0200 (CEST)
Received: from localhost ([::1]:35622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niuvd-0001Vx-Oo
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 05:22:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1niuOu-0004EF-W6
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 04:48:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1niuOt-0006HI-E2
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 04:48:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650876534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AVBTUvwnYaEoingiw7jpYWzGxZDpgYBEaHDndvjwq1U=;
 b=Vgu/rePkKM3ST1vxmHUeSvahyTHUdT1rvASb2TURgC0stfjU/ahyivAV5ZQZn/Y6hh3lN/
 o94LH2wDTL2zz1bM1CWIfJ90iULt9UyzEzPWaoXSQNJW5SX8MWzxhtj4M5XC7cnYwdSR03
 1/8nmj0fCOiJq6tioRHQusdh2gOhkvM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-244-qqe-0Zk0Pxe2K5eBZwLCKg-1; Mon, 25 Apr 2022 04:48:52 -0400
X-MC-Unique: qqe-0Zk0Pxe2K5eBZwLCKg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 912A4101B44C;
 Mon, 25 Apr 2022 08:48:52 +0000 (UTC)
Received: from localhost (unknown [10.39.192.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B391432718;
 Mon, 25 Apr 2022 08:48:52 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/3] contrib/vhost-user-blk: add missing GOptionEntry NULL
 terminator
Date: Mon, 25 Apr 2022 09:48:43 +0100
Message-Id: <20220425084844.1086768-3-stefanha@redhat.com>
In-Reply-To: <20220425084844.1086768-1-stefanha@redhat.com>
References: <20220425084844.1086768-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The GLib documentation says "a NULL-terminated array of GOptionEntrys"
so we'd better make sure there is a terminator that lets
g_option_context_add_main_entries() know when the end of the array has
been reached.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-id: 20220411150057.3009667-1-stefanha@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 contrib/vhost-user-blk/vhost-user-blk.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/contrib/vhost-user-blk/vhost-user-blk.c b/contrib/vhost-user-blk/vhost-user-blk.c
index d14b2896bf..cd4a5d7335 100644
--- a/contrib/vhost-user-blk/vhost-user-blk.c
+++ b/contrib/vhost-user-blk/vhost-user-blk.c
@@ -593,7 +593,8 @@ static GOptionEntry entries[] = {
     {"blk-file", 'b', 0, G_OPTION_ARG_FILENAME, &opt_blk_file,
      "block device or file path", "PATH"},
     { "read-only", 'r', 0, G_OPTION_ARG_NONE, &opt_read_only,
-      "Enable read-only", NULL }
+      "Enable read-only", NULL },
+    { NULL, },
 };
 
 int main(int argc, char **argv)
-- 
2.35.1


