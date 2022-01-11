Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6F248AB4C
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 11:24:52 +0100 (CET)
Received: from localhost ([::1]:58198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7EKh-0001Qa-Fy
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 05:24:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1n7EG0-0007TH-Cd
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 05:20:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1n7EFx-00032i-EG
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 05:19:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641896386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=i96UbwfIP1sh8qIwv93wrtE+1LsnHtnNK9No+P8d8CM=;
 b=O0cvGAf8mxl/sM7SLzQi/GuZMaoG6AsCy1c78epOgBvbXGucNZLjgbI+xKsyT54ynUekKM
 yPa1zaBK2Z3hmk0ggttC1Pe44k6BTZoeWx07U7R6nCC+hffx/fCyv5e+RAtZ0KyAPUoH7E
 G2z39w1B5KNL2ADI1BF8d0F+l94rsMg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-472-_8ZR6wLOOxqivUBlmQNOKg-1; Tue, 11 Jan 2022 05:19:42 -0500
X-MC-Unique: _8ZR6wLOOxqivUBlmQNOKg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 167C6100C610;
 Tue, 11 Jan 2022 10:19:41 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.195.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 69DE878342;
 Tue, 11 Jan 2022 10:19:39 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, luc@lmichel.fr, damien.hedde@greensocs.com,
 peter.maydell@linaro.org
Subject: [PATCH] clock-vmstate: Add missing END_OF_LIST
Date: Tue, 11 Jan 2022 10:19:34 +0000
Message-Id: <20220111101934.115028-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Add the missing VMSTATE_END_OF_LIST to vmstate_muldiv

Fixes: 99abcbc7600 ("clock: Provide builtin multiplier/divider")
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 hw/core/clock-vmstate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/core/clock-vmstate.c b/hw/core/clock-vmstate.c
index 9d9174ffbd..7eccb6d4ea 100644
--- a/hw/core/clock-vmstate.c
+++ b/hw/core/clock-vmstate.c
@@ -44,6 +44,7 @@ const VMStateDescription vmstate_muldiv = {
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(multiplier, Clock),
         VMSTATE_UINT32(divider, Clock),
+        VMSTATE_END_OF_LIST()
     },
 };
 
-- 
2.34.1


