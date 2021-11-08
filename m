Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D686244800E
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 14:09:06 +0100 (CET)
Received: from localhost ([::1]:43636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk4OX-0004rr-Ou
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 08:09:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mk4N1-000314-Us
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 08:07:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mk4Mv-0006MV-IF
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 08:07:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636376842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M0BWvVw0PtLfYhl5dSMaiiVYc1iPE+IftpDnV1WTuqA=;
 b=OdJaqsCYfsX6pM1+uqm0z9WOgB7h4JeuaqJzbu1Lik1QuG9oatLbn7aNeDpT2EVOPYnAQB
 dS3jPJJtIqH2JEFTFVZS5sByHWJZlcc5GRLJXy8fHYkuOcXeoKTTE7Hsvj78hxdAvL9oTW
 CcNZ/MCLTcTOBG5/UEE9WWXo8JyEz+s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-HbEzDoPJOLa8bZPE0vLxnw-1; Mon, 08 Nov 2021 08:07:21 -0500
X-MC-Unique: HbEzDoPJOLa8bZPE0vLxnw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D7D087D544;
 Mon,  8 Nov 2021 13:07:20 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3AEAE79447;
 Mon,  8 Nov 2021 13:07:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B0F2C1803560; Mon,  8 Nov 2021 14:07:18 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] microvm: add missing g_free() call
Date: Mon,  8 Nov 2021 14:07:17 +0100
Message-Id: <20211108130718.840216-2-kraxel@redhat.com>
In-Reply-To: <20211108130718.840216-1-kraxel@redhat.com>
References: <20211108130718.840216-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes: CID 1465240
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/i386/microvm-dt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/i386/microvm-dt.c b/hw/i386/microvm-dt.c
index 875ba9196394..ad4e48e5fe60 100644
--- a/hw/i386/microvm-dt.c
+++ b/hw/i386/microvm-dt.c
@@ -143,6 +143,8 @@ static void dt_add_pcie(MicrovmMachineState *mms)
     nr_pcie_buses = PCIE_ECAM_SIZE / PCIE_MMCFG_SIZE_MIN;
     qemu_fdt_setprop_cells(mms->fdt, nodename, "bus-range", 0,
                            nr_pcie_buses - 1);
+
+    g_free(nodename);
 }
 
 static void dt_add_ioapic(MicrovmMachineState *mms, SysBusDevice *dev)
-- 
2.31.1


