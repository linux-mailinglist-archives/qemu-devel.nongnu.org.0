Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0563E164B
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 16:03:14 +0200 (CEST)
Received: from localhost ([::1]:55426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBdxp-0005xZ-Dh
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 10:03:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mBdsZ-00059j-R0
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 09:57:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mBdsY-0000I8-F5
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 09:57:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628171865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cVjLzHO2nIi8KZy1mMtpuvGp6gSulIYAEN+AKOrF24Y=;
 b=HopwwBQaMBr1HKq2dNjQ0LnYma90bNqovm/7IK/voj/3Sbi+7xzR86hW72C615Om4Od3nr
 HINaPOVzEeIfuxYm2uBUL9HO0vZc6WNQc7yNvkTxa6dGa4VjMRNsGCzHMYio/erlb8wggB
 OcnnC00OgC5bOfR89x8zTcNRM0Zw60w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-VxZTrd3aMXmqzvCYYG7ARA-1; Thu, 05 Aug 2021 09:57:44 -0400
X-MC-Unique: VxZTrd3aMXmqzvCYYG7ARA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA874107ACF5
 for <qemu-devel@nongnu.org>; Thu,  5 Aug 2021 13:57:43 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 832CB1036D27;
 Thu,  5 Aug 2021 13:57:34 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/18] ui/vdagent: remove copy-pasta comment
Date: Thu,  5 Aug 2021 17:56:59 +0400
Message-Id: <20210805135715.857938-3-marcandre.lureau@redhat.com>
In-Reply-To: <20210805135715.857938-1-marcandre.lureau@redhat.com>
References: <20210805135715.857938-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
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
2.32.0.264.g75ae10bc75


