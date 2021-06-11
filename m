Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B27053A46CA
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 18:44:36 +0200 (CEST)
Received: from localhost ([::1]:34252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrkGp-0006bx-Ai
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 12:44:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1lrkFX-0005uu-LQ
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 12:43:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1lrkFU-0006l4-7w
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 12:43:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623429790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MW+MsnzgejllC8pa/VoNChRYXjk13Ymrp3Hi2rF7QGw=;
 b=f3xHd6LOTJohfStaRtmHKOyfA567VRn2bsRjBzrnmMAtxQha1zJbKgoGOi0iSvhWWeWYpN
 NTbiBzgtYWVIUMeTzhU+p/eM/aq5U4syKTuNnasMDvw0NuH3tpQmH0Ldim7j3XsdwPrEVJ
 fqpatRdgXr46R2I59/uDMcCkCrrfRQ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-N-GPS1NNNDi_3CDSVbis6g-1; Fri, 11 Jun 2021 12:43:09 -0400
X-MC-Unique: N-GPS1NNNDi_3CDSVbis6g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A275100C662;
 Fri, 11 Jun 2021 16:43:08 +0000 (UTC)
Received: from f33-work.redhat.com (unknown [10.40.194.8])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DD3C1001B2C;
 Fri, 11 Jun 2021 16:43:07 +0000 (UTC)
From: Mauro Matteo Cascella <mcascell@redhat.com>
To: mcascell@redhat.com
Subject: [PATCH v2] Test comment for git-publish
Date: Fri, 11 Jun 2021 18:43:05 +0200
Message-Id: <20210611164305.440633-1-mcascell@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mcascell@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mcascell@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Yuval Shaia <yuval.shaia.ml@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

---
 hw/rdma/vmw/pvrdma_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/rdma/vmw/pvrdma_main.c b/hw/rdma/vmw/pvrdma_main.c
index 84ae8024fc..e229c19564 100644
--- a/hw/rdma/vmw/pvrdma_main.c
+++ b/hw/rdma/vmw/pvrdma_main.c
@@ -427,7 +427,7 @@ static void pvrdma_regs_write(void *opaque, hwaddr addr, uint64_t val,
     case PVRDMA_REG_REQUEST:
         if (val == 0) {
             trace_pvrdma_regs_write(addr, val, "REQUEST", "");
-            pvrdma_exec_cmd(dev);
+            pvrdma_exec_cmd(dev); // this is a test comment
         }
         break;
     default:
-- 
2.31.1


