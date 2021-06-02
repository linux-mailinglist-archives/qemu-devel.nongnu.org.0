Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 173D5398343
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 09:40:46 +0200 (CEST)
Received: from localhost ([::1]:39200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loLUb-0007yT-3V
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 03:40:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1loLQP-0008HN-FF
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 03:36:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1loLQN-0003mc-S6
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 03:36:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622619383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=neTjoOdzrbLQcqbDfN53P9XRPHeBdsgyEaVzMOpAxv0=;
 b=JgTHsuo90vRWTu1VmZauthOuaN2QKnfDded9jZKMvw4hmq1IKeyDLX1FlzCVaARDVAOgA4
 ROJO3iIpTh2lAYlqOLAIrIJivAJRjtJteEQyNX0UZbQ4qELp5PpbZmk63WGSZLiGPe036Y
 c4Z1as8q6VopIS/CQynpMZSoIQyRkRg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-604-Y8xFAi_QN6-LyDtoTmJi_w-1; Wed, 02 Jun 2021 03:36:21 -0400
X-MC-Unique: Y8xFAi_QN6-LyDtoTmJi_w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 338991854E29;
 Wed,  2 Jun 2021 07:36:20 +0000 (UTC)
Received: from thuth.com (ovpn-112-40.ams2.redhat.com [10.36.112.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F28A5C6DE;
 Wed,  2 Jun 2021 07:36:18 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 05/17] docs: fix references to docs/devel/s390-dasd-ipl.rst
Date: Wed,  2 Jun 2021 09:35:54 +0200
Message-Id: <20210602073606.338994-6-thuth@redhat.com>
In-Reply-To: <20210602073606.338994-1-thuth@redhat.com>
References: <20210602073606.338994-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefano Garzarella <sgarzare@redhat.com>

Commit cc3d15a5ea ("docs: rstfy s390 dasd ipl documentation")
converted docs/devel/s390-dasd-ipl.txt to docs/devel/s390-dasd-ipl.rst.

We still have several references to the old file, so let's fix them
with the following command:

  sed -i s/s390-dasd-ipl.txt/s390-dasd-ipl.rst/ \
      $(git grep -l docs/devel/s390-dasd-ipl.txt)

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Cornelia Huck <cohuck@redhat.com>
Message-Id: <20210517151702.109066-6-sgarzare@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 pc-bios/s390-ccw/dasd-ipl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/pc-bios/s390-ccw/dasd-ipl.c b/pc-bios/s390-ccw/dasd-ipl.c
index 71cbae2f16..254bb1a15e 100644
--- a/pc-bios/s390-ccw/dasd-ipl.c
+++ b/pc-bios/s390-ccw/dasd-ipl.c
@@ -205,7 +205,7 @@ static void run_ipl2(SubChannelId schid, uint16_t cutype, uint32_t addr)
 
 /*
  * Limitations in vfio-ccw support complicate the IPL process. Details can
- * be found in docs/devel/s390-dasd-ipl.txt
+ * be found in docs/devel/s390-dasd-ipl.rst
  */
 void dasd_ipl(SubChannelId schid, uint16_t cutype)
 {
-- 
2.27.0


