Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 057E048DE8A
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 21:01:29 +0100 (CET)
Received: from localhost ([::1]:52396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n86Ho-0001CA-38
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 15:01:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1n8620-0007uN-LB
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 14:45:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1n861y-0007Ly-HH
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 14:45:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642103105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dJmfuVskT8yJsedM7Sx7cjdtjKigT5Qr7i/Bod/Tesk=;
 b=DkXciQpaxkor3eO+S2fdrdm6be/BJcVrY7LZddGrJjNjR9pqLfHAjGhLh9AJ/oNE3LkxBK
 6lkupuYVE78zAfxlL4EFejKoC/EvDI7Mg8B28+iIop96Bf1B4NqVYRa7wdm50XZ2TsrAWR
 WtSkSM+gp4Bot9SJjzO4QmG/Sn3XCCo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-104-z-T7dFvyO2WqLsBfPQefXA-1; Thu, 13 Jan 2022 14:45:01 -0500
X-MC-Unique: z-T7dFvyO2WqLsBfPQefXA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3BD31006AA7;
 Thu, 13 Jan 2022 19:45:00 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.195.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 72A65100E125;
 Thu, 13 Jan 2022 19:44:59 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, peter.maydell@linaro.org, quintela@redhat.com,
 marcandre.lureau@gmail.com
Subject: [PATCH v2 1/3] ppc: Fix vmstate_pbr403 subsection name
Date: Thu, 13 Jan 2022 19:44:50 +0000
Message-Id: <20220113194452.254011-2-dgilbert@redhat.com>
In-Reply-To: <20220113194452.254011-1-dgilbert@redhat.com>
References: <20220113194452.254011-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
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
Cc: lsoaresp@redhat.com, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

The pbr403 subsection is part of the tlb6xx state, so I believe it's
name needs to be:

    .name = "cpu/tlb6xx/pbr403",

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 target/ppc/machine.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/machine.c b/target/ppc/machine.c
index 756d8de5d8..e535edb7c4 100644
--- a/target/ppc/machine.c
+++ b/target/ppc/machine.c
@@ -718,7 +718,7 @@ static bool pbr403_needed(void *opaque)
 }
 
 static const VMStateDescription vmstate_pbr403 = {
-    .name = "cpu/pbr403",
+    .name = "cpu/tlb6xx/pbr403",
     .version_id = 1,
     .minimum_version_id = 1,
     .needed = pbr403_needed,
-- 
2.34.1


