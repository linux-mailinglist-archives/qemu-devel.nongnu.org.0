Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBE324AC01
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Aug 2020 02:18:14 +0200 (CEST)
Received: from localhost ([::1]:57726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8YHV-0005ZF-Cp
	for lists+qemu-devel@lfdr.de; Wed, 19 Aug 2020 20:18:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k8YD2-00064K-VQ
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 20:13:36 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:40221
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k8YD1-0002NM-1h
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 20:13:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597882414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JgLetd7umw6LZaIl/bMW0DgkPb2hrx3FSmFT0LgGGh4=;
 b=JbBgRmbNLsHiotHLGXKd6/gIZnjf4cAjSesovyBeM0SqicZA0mnveIhc39nPQlYiwd5Cj1
 kAu72ZxUNik/+kysXfrWTU8mOlVc39dAzG8wK99uXh6iGEvCamESNErSCiW55mxNEuJDE1
 8PhVaMMjFeKsqATmEkaTPubxifK9980=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-ycMFcMAcPtKzO0kaefF5mA-1; Wed, 19 Aug 2020 20:13:32 -0400
X-MC-Unique: ycMFcMAcPtKzO0kaefF5mA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF8DD186A58E;
 Thu, 20 Aug 2020 00:13:31 +0000 (UTC)
Received: from localhost (ovpn-117-244.rdu2.redhat.com [10.10.117.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A6FA7E300;
 Thu, 20 Aug 2020 00:13:31 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 20/58] mcf_fec: Move mcf_fec_state typedef to header
Date: Wed, 19 Aug 2020 20:11:58 -0400
Message-Id: <20200820001236.1284548-21-ehabkost@redhat.com>
In-Reply-To: <20200820001236.1284548-1-ehabkost@redhat.com>
References: <20200820001236.1284548-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 20:12:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <huth@tuxfamily.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move typedef closer to the type check macros, to make it easier
to convert the code to OBJECT_DEFINE_TYPE() in the future.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes v1 -> v2: none

---
Cc: Thomas Huth <huth@tuxfamily.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org
---
 include/hw/m68k/mcf_fec.h | 1 +
 hw/net/mcf_fec.c          | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/hw/m68k/mcf_fec.h b/include/hw/m68k/mcf_fec.h
index eeb471f9c9..c09e33a57c 100644
--- a/include/hw/m68k/mcf_fec.h
+++ b/include/hw/m68k/mcf_fec.h
@@ -11,6 +11,7 @@
 #define HW_M68K_MCF_FEC_H
 
 #define TYPE_MCF_FEC_NET "mcf-fec"
+typedef struct mcf_fec_state mcf_fec_state;
 #define MCF_FEC_NET(obj) OBJECT_CHECK(mcf_fec_state, (obj), TYPE_MCF_FEC_NET)
 
 #define FEC_NUM_IRQ 13
diff --git a/hw/net/mcf_fec.c b/hw/net/mcf_fec.c
index 281345862c..25e3e453ab 100644
--- a/hw/net/mcf_fec.c
+++ b/hw/net/mcf_fec.c
@@ -32,7 +32,7 @@ do { printf("mcf_fec: " fmt , ## __VA_ARGS__); } while (0)
 #define FEC_MAX_FRAME_SIZE 2032
 #define FEC_MIB_SIZE 64
 
-typedef struct {
+struct mcf_fec_state {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
@@ -56,7 +56,7 @@ typedef struct {
     uint32_t etdsr;
     uint32_t emrbr;
     uint32_t mib[FEC_MIB_SIZE];
-} mcf_fec_state;
+};
 
 #define FEC_INT_HB   0x80000000
 #define FEC_INT_BABR 0x40000000
-- 
2.26.2


