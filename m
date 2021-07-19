Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2053C3CCE7E
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 09:29:35 +0200 (CEST)
Received: from localhost ([::1]:35472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5NiY-00017L-5b
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 03:29:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1m5Nge-0007rk-OP
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 03:27:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1m5Ngb-0001HY-2d
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 03:27:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626679652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mx8jYSAcWVRFFAJpXewPtch97JOy/w7Yy8S8zCtuwMA=;
 b=UsPQA0WozIsu0ilm5nPRWlaQaty/0+9jpWYkPbu05HvrrDDa9vLSVSHxoGZxTfSym1/zUP
 WcABP4iuaiZuVdnqgDrdFWJ/VwnVrWJXCFxAuvsC+nHOLaRcbyVkUpHewzEXRd/rIiaOB0
 yqeLa8caRf8Lkm072bAcyuRLYiakOOY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-16n6C60DN5C1_fWQa2d4Xg-1; Mon, 19 Jul 2021 03:27:30 -0400
X-MC-Unique: 16n6C60DN5C1_fWQa2d4Xg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27B02100C610
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 07:27:30 +0000 (UTC)
Received: from localhost (unknown [10.36.110.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4B290620DE;
 Mon, 19 Jul 2021 07:27:21 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 02/12] ui/vdagent: remove copy-pasta comment
Date: Mon, 19 Jul 2021 11:26:44 +0400
Message-Id: <20210719072654.845901-3-marcandre.lureau@redhat.com>
In-Reply-To: <20210719072654.845901-1-marcandre.lureau@redhat.com>
References: <20210719072654.845901-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.466,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
2.32.0.93.g670b81a890


