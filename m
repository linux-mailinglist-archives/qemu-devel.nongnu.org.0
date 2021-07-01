Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F133B8DBA
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 08:26:14 +0200 (CEST)
Received: from localhost ([::1]:41084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyq9M-0000jL-Qf
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 02:26:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lyq7s-0008Fp-Ae
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 02:24:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lyq7p-0005hO-8D
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 02:24:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625120675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MwI7F/xbjcOW7vEReAB4qk1Nkw3NJtuZ3kRqjX/QwmM=;
 b=IVtIsthqiOHaPi8eD+XY9nHzMlCRswqxpqgVJ7DSaCF/aJB7PoVz0crM6CZ/3r/mRUjeFA
 DwH5SqqHVV1xCk4f3NDAwGWQ39rorz0QSVCauZ8WebAS6QammHASVrZGuoWOuTslQkcWa2
 xCyPgRmznOG53VYrYOTfm5v1d5VVKB8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-b6pPMNduPxmmWN1zPDKYDg-1; Thu, 01 Jul 2021 02:24:33 -0400
X-MC-Unique: b6pPMNduPxmmWN1zPDKYDg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5A6910C1ADC
 for <qemu-devel@nongnu.org>; Thu,  1 Jul 2021 06:24:32 +0000 (UTC)
Received: from localhost (unknown [10.36.110.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B3DFF5DA61;
 Thu,  1 Jul 2021 06:24:24 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH] vl: add virtio-vga-gl to the default_list
Date: Thu,  1 Jul 2021 10:24:21 +0400
Message-Id: <20210701062421.721414-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Do not instantiate an extra default VGA device if -device virtio-vga-gl
is provided.

Related to commit b36eb8860f8f4a9c6f131c3fd380116a3017e022 ("virtio-gpu:
add virtio-vga-gl")

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 softmmu/vl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index d99e2cbdbf..69c55a86a4 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -198,6 +198,7 @@ static struct {
     { .driver = "virtio-vga",           .flag = &default_vga       },
     { .driver = "ati-vga",              .flag = &default_vga       },
     { .driver = "vhost-user-vga",       .flag = &default_vga       },
+    { .driver = "virtio-vga-gl",        .flag = &default_vga       },
 };
 
 static QemuOptsList qemu_rtc_opts = {
-- 
2.29.0


