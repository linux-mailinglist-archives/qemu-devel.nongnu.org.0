Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA6F24415C
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Aug 2020 00:40:26 +0200 (CEST)
Received: from localhost ([::1]:39324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k6LtZ-0000vN-K8
	for lists+qemu-devel@lfdr.de; Thu, 13 Aug 2020 18:40:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k6LgV-0005Sn-Dh
 for qemu-devel@nongnu.org; Thu, 13 Aug 2020 18:26:55 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:50207
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k6LgT-0002ts-OZ
 for qemu-devel@nongnu.org; Thu, 13 Aug 2020 18:26:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597357613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vQqSy/MYwwqjJX900gLBZkNMOzZWDr9u74VbkdL4Yf4=;
 b=gW4VyGmeqxwIlxI7lr9+9fgM0nCNsOgnBlv5AKLBRJIohszfG0+fVkHYxOT2MoqZv8h1Do
 TMDdJSjSdMHVavg+1W4xpgBoezaIJLxAU6cUwEgwGuCvhk+AW0edqnKizXZm7Sdd05IT59
 44sOVYNUGxD+9HdOrWWtOS4YAuk5G44=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-93-BPqLiSpDOfOQNdp2AYqdxA-1; Thu, 13 Aug 2020 18:26:51 -0400
X-MC-Unique: BPqLiSpDOfOQNdp2AYqdxA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 867D7800683
 for <qemu-devel@nongnu.org>; Thu, 13 Aug 2020 22:26:50 +0000 (UTC)
Received: from localhost (ovpn-117-153.rdu2.redhat.com [10.10.117.153])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4D175708FF;
 Thu, 13 Aug 2020 22:26:50 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/41] mcf_fec: Move mcf_fec_state typedef to header
Date: Thu, 13 Aug 2020 18:26:04 -0400
Message-Id: <20200813222625.243136-21-ehabkost@redhat.com>
In-Reply-To: <20200813222625.243136-1-ehabkost@redhat.com>
References: <20200813222625.243136-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/13 18:26:36
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move typedef closer to the type check macros, to make it easier
to convert the code to OBJECT_DEFINE_TYPE() in the future.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
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


