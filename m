Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B603FC854
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 15:35:05 +0200 (CEST)
Received: from localhost ([::1]:38758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL3uq-00012J-4n
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 09:35:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mL3s7-0006ji-IK
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 09:32:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mL3s4-0007dc-5x
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 09:32:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630416731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M4cgnhKzw8WbBrMqoydM9+eXmCAaeLfq8wC83hfzUP0=;
 b=SPE+H3JCumqBq089eLTsuxtODcR7S+Ky3oNnnrMN//JD81P6850dTApFXs8bcXmfS5WD0P
 nA9D/nLAZu98p3p9we4Yh3mQp9xJogRqZBdkckUNobf/C86NKwrXuTdpHrysMvXwZwe19n
 wBRxbBPQm6sWxwI+H5zLOjG9P3n8M9Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602-uYvRe_wnN1m58A3_rlEoTg-1; Tue, 31 Aug 2021 09:32:09 -0400
X-MC-Unique: uYvRe_wnN1m58A3_rlEoTg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39C9B18C8C01;
 Tue, 31 Aug 2021 13:32:08 +0000 (UTC)
Received: from localhost (unknown [10.39.208.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E8A2860C9F;
 Tue, 31 Aug 2021 13:31:58 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 02/18] ui/vdagent: remove copy-pasta comment
Date: Tue, 31 Aug 2021 17:31:16 +0400
Message-Id: <20210831133132.1697228-3-marcandre.lureau@redhat.com>
In-Reply-To: <20210831133132.1697228-1-marcandre.lureau@redhat.com>
References: <20210831133132.1697228-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210805135715.857938-3-marcandre.lureau@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/vdagent.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ui/vdagent.c b/ui/vdagent.c
index f6ef8d1993..5ae5734c81 100644
--- a/ui/vdagent.c
+++ b/ui/vdagent.c
@@ -516,7 +516,7 @@ static void vdagent_chr_recv_clipboard(VDAgentChardev *vd, VDAgentMessage *msg)
         qemu_clipboard_set_data(&vd->cbpeer, vd->cbinfo[s], type,
                                 size, data, true);
         break;
-    case VD_AGENT_CLIPBOARD_RELEASE: /* data */
+    case VD_AGENT_CLIPBOARD_RELEASE:
         if (vd->cbinfo[s] &&
             vd->cbinfo[s]->owner == &vd->cbpeer) {
             /* set empty clipboard info */
-- 
2.33.0.rc2


