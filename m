Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A352FFED3
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 09:57:51 +0100 (CET)
Received: from localhost ([::1]:56674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2sGL-0004Ik-OO
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 03:57:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l2sEE-0003n4-NI
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 03:55:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l2sEA-0006cr-Mb
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 03:55:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611305733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6woqXCQPBXF+2AZzqpiLMk3R+C2bqTLs3O/t0lpF0I8=;
 b=KzKAafr32rGmE5gqJ5jWabGntiQBGghbfWjp13074rbL2iiemPP4hI6gYuOImDTstr8XxD
 gj1UH6CEn5UQcUh1upF97WA/YDc4+oBYewNWW/v96JkWznRRZs011obF5opD97b6LjUzGJ
 0k1gtBTOeKic3Ua+U/DdweBZqbEawlA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-0YhfRKZyMVClnL9Vp6DMnQ-1; Fri, 22 Jan 2021 03:55:31 -0500
X-MC-Unique: 0YhfRKZyMVClnL9Vp6DMnQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5F95192D795
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 08:55:30 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 81EE86B540;
 Fri, 22 Jan 2021 08:55:27 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5F0FF18000AB; Fri, 22 Jan 2021 09:55:25 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] vnc: drop vnc_colordepth() call.
Date: Fri, 22 Jan 2021 09:55:25 +0100
Message-Id: <20210122085525.3827724-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laszlo Ersek <lersek@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With gtk-vnc (which supports VNC_FEATURE_WMVI) this results in
sending a VNC_ENCODING_WMVi message to the client.  Which in turn
seems to make gtk-vnc respond with another non-incremental update
request.  Hello endless loop ...

Drop the call.

Fixes: 9e1632ad07ca ("vnc: move initialization to framebuffer_update_request")
Reported-by: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/vnc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/ui/vnc.c b/ui/vnc.c
index d429bfee5a65..0a3e2f4aa98c 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -2041,7 +2041,6 @@ static void framebuffer_update_request(VncState *vs, int incremental,
     } else {
         vs->update = VNC_STATE_UPDATE_FORCE;
         vnc_set_area_dirty(vs->dirty, vs->vd, x, y, w, h);
-        vnc_colordepth(vs);
         vnc_desktop_resize(vs);
         vnc_led_state_change(vs);
         vnc_cursor_define(vs);
-- 
2.29.2


