Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 294204FC012
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 17:15:10 +0200 (CEST)
Received: from localhost ([::1]:36810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndvky-0001b7-VC
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 11:15:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ndvXO-0003vn-3v
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 11:01:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ndvXK-0001Nd-D5
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 11:01:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649689260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pJgxgeYy3ruYF0JsgVHQbdJLNVVTzmyq8X8jFJmfylI=;
 b=J2mQnTa5gmP1qK++KEX3raQsG64dmBnBSDVG+skjPVz8zLvSgGhIm89qIyjpa6ZU9zII7Q
 Bd5FfWCca5+ws6+ICdlvKktvUKEQTdHSyBKbTr9qWBCr4TBouMBW25ARcwQraF1bwWY1pU
 UFqJLjh8xggqlnfjY2jOGPSlwc9gSGs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-363-Ky_Qax1XOlW4WO-93Sp29Q-1; Mon, 11 Apr 2022 11:00:59 -0400
X-MC-Unique: Ky_Qax1XOlW4WO-93Sp29Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A11733838C81;
 Mon, 11 Apr 2022 15:00:58 +0000 (UTC)
Received: from localhost (unknown [10.39.192.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 37C4240885A5;
 Mon, 11 Apr 2022 15:00:58 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] contrib/vhost-user-blk: add missing GOptionEntry NULL
 terminator
Date: Mon, 11 Apr 2022 16:00:57 +0100
Message-Id: <20220411150057.3009667-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The GLib documentation says "a NULL-terminated array of GOptionEntrys"
so we'd better make sure there is a terminator that lets
g_option_context_add_main_entries() know when the end of the array has
been reached.

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


