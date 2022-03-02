Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 898B54CAD9C
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 19:33:07 +0100 (CET)
Received: from localhost ([::1]:40540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPTmc-0003kZ-7z
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 13:33:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPTkG-0000r4-7q
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:30:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPTkD-0000Ev-Ol
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:30:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646245837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FUeohVwMXEu92BpzCEiijkV/baBocA1U7rFGsPiR+KY=;
 b=gXgat6teetXRgkmo3mIULxP4AMwJpSD4fdb4DfAJTuKm25WXgtN3VnGVuMU6ftA3PBPS6T
 XjOk76SiULfW5oTtShsGTKNGEA9vBR2978mH7t9QVebOBwDMl/xi//FsHfb+1g5rYiUEU+
 1nEpbcEU3J7bsVVaWkDct/AEvliIc+o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-393-j3jaezzPNIGC0GvV__cS5g-1; Wed, 02 Mar 2022 13:30:34 -0500
X-MC-Unique: j3jaezzPNIGC0GvV__cS5g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 864D81018745;
 Wed,  2 Mar 2022 18:30:31 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E51F91059172;
 Wed,  2 Mar 2022 18:30:29 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, f.ebner@proxmox.com, hreitz@redhat.com,
 jinpu.wang@ionos.com, peter.maydell@linaro.org, peterx@redhat.com,
 s.reiter@proxmox.com
Subject: [PULL 01/18] clock-vmstate: Add missing END_OF_LIST
Date: Wed,  2 Mar 2022 18:29:19 +0000
Message-Id: <20220302182936.227719-2-dgilbert@redhat.com>
In-Reply-To: <20220302182936.227719-1-dgilbert@redhat.com>
References: <20220302182936.227719-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Add the missing VMSTATE_END_OF_LIST to vmstate_muldiv

Fixes: 99abcbc7600 ("clock: Provide builtin multiplier/divider")
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <20220111101934.115028-1-dgilbert@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Cc: qemu-stable@nongnu.org
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
2.35.1


