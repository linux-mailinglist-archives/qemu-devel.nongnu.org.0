Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F57F4512AE
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 20:41:11 +0100 (CET)
Received: from localhost ([::1]:33078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmhqo-0005KB-7Q
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 14:41:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tfanelli@redhat.com>)
 id 1mmhp5-0004OD-DI
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 14:39:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tfanelli@redhat.com>)
 id 1mmhp2-0005Vj-D6
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 14:39:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637005159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jvsTDbSkpArzLNDx9ej91qEx5bE3E1FzwXhbMgPLJjE=;
 b=KPBMVRHqYRyiP/urSzMkYE5I+FAk9CXPwR1B0HowhQt36IGzihc/+eyoTxBXR/Mpiw1gK8
 quR0q79eeVRQgPjMoUDrfnXJ86cBfqr+tHJgReMNBfPWi1IZCVZuduf4KCBD2XLX8Kj1f9
 s2ZNb6id6/qlHiICBCdpsqyc9FyXnvc=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-fbaw6Mu3NmirAFU8bkrfKg-1; Mon, 15 Nov 2021 14:38:13 -0500
X-MC-Unique: fbaw6Mu3NmirAFU8bkrfKg-1
Received: by mail-qk1-f200.google.com with SMTP id
 w13-20020a05620a0e8d00b0045fad6245e8so11952375qkm.8
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 11:38:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jvsTDbSkpArzLNDx9ej91qEx5bE3E1FzwXhbMgPLJjE=;
 b=wm30qac8dXCYEtspsU3YYu73Jig/T4OiU2Q7YfPVRse2n+/1oids1Yq/PhjAGi2D3H
 Bvn7GBaByg5UVYyOnhOggT7+01+k/vOAV8csgNZ59FPE+4LwCElwCgDWRaHzDrjkq2sn
 D6UBvHpMadBvxpyr0pDAqyMBiZ7GJ6zNDW5odWZGczsmUzOCyfBEIYNksBy86aV/W/FO
 f4RgXoDCOyTetO8TKKEZiCXbwwzwdWW3vr3+oR9i1zZwM48mmyLpL8uikNxGpIjq5MgB
 6WdfrNrW4osVsPXfSaZy5LU/YaKkgWhV/A67CB4Npl6yUfM78IBv9V2GNuNMDMQozclY
 HDTQ==
X-Gm-Message-State: AOAM533Lh1f+I/zgAbFenmzaArHRnA/Ftk/vbv7L2dIwcQtyIQXW9hFY
 ryiL/LcQ+XnAJmWUsnxYE95UTZVdj/9Pt31FiWsQ3wIyM8fGLs2m7aIhutoCO4y6QhWInAkNuZw
 ZOS3NwQ0xB6N8CQZUIyofmLa4cEaHF0g0iowK3EshQnL57yf3uTMrB6qgePTVLrXnaKs=
X-Received: by 2002:a05:622a:1050:: with SMTP id
 f16mr1438626qte.311.1637005092330; 
 Mon, 15 Nov 2021 11:38:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQTZIZ+FxFZ6dwOuu7ePVqgoQBxNcWiErRyPXiahT0HGiP6naPvYDQlT4HNQYMJuPyVLoOSw==
X-Received: by 2002:a05:622a:1050:: with SMTP id
 f16mr1438591qte.311.1637005092057; 
 Mon, 15 Nov 2021 11:38:12 -0800 (PST)
Received: from fedora.myfiosgateway.com
 (pool-71-175-3-221.phlapa.fios.verizon.net. [71.175.3.221])
 by smtp.gmail.com with ESMTPSA id l1sm2929724qkp.125.2021.11.15.11.38.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 11:38:11 -0800 (PST)
From: Tyler Fanelli <tfanelli@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] sev: allow capabilities to check for SEV-ES support
Date: Mon, 15 Nov 2021 14:38:04 -0500
Message-Id: <20211115193804.294529-1-tfanelli@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=tfanelli@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=tfanelli@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kvm@vger.kernel.org, mtosatti@redhat.com, armbru@redhat.com,
 Tyler Fanelli <tfanelli@redhat.com>, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Probe for SEV-ES and SEV-SNP capabilities to distinguish between Rome,
Naples, and Milan processors. Use the CPUID function to probe if a
processor is capable of running SEV-ES or SEV-SNP, rather than if it
actually is running SEV-ES or SEV-SNP.

Signed-off-by: Tyler Fanelli <tfanelli@redhat.com>
---
 qapi/misc-target.json | 11 +++++++++--
 target/i386/sev.c     |  6 ++++--
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/qapi/misc-target.json b/qapi/misc-target.json
index 5aa2b95b7d..c3e9bce12b 100644
--- a/qapi/misc-target.json
+++ b/qapi/misc-target.json
@@ -182,13 +182,19 @@
 # @reduced-phys-bits: Number of physical Address bit reduction when SEV is
 #                     enabled
 #
+# @es: SEV-ES capability of the machine.
+#
+# @snp: SEV-SNP capability of the machine.
+#
 # Since: 2.12
 ##
 { 'struct': 'SevCapability',
   'data': { 'pdh': 'str',
             'cert-chain': 'str',
             'cbitpos': 'int',
-            'reduced-phys-bits': 'int'},
+            'reduced-phys-bits': 'int',
+            'es': 'bool',
+            'snp': 'bool'},
   'if': 'TARGET_I386' }
 
 ##
@@ -205,7 +211,8 @@
 #
 # -> { "execute": "query-sev-capabilities" }
 # <- { "return": { "pdh": "8CCDD8DDD", "cert-chain": "888CCCDDDEE",
-#                  "cbitpos": 47, "reduced-phys-bits": 5}}
+#                  "cbitpos": 47, "reduced-phys-bits": 5
+#                  "es": false, "snp": false}}
 #
 ##
 { 'command': 'query-sev-capabilities', 'returns': 'SevCapability',
diff --git a/target/i386/sev.c b/target/i386/sev.c
index eede07f11d..6d78dcd744 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -506,7 +506,7 @@ static SevCapability *sev_get_capabilities(Error **errp)
     guchar *pdh_data = NULL;
     guchar *cert_chain_data = NULL;
     size_t pdh_len = 0, cert_chain_len = 0;
-    uint32_t ebx;
+    uint32_t eax, ebx;
     int fd;
 
     if (!kvm_enabled()) {
@@ -534,8 +534,10 @@ static SevCapability *sev_get_capabilities(Error **errp)
     cap->pdh = g_base64_encode(pdh_data, pdh_len);
     cap->cert_chain = g_base64_encode(cert_chain_data, cert_chain_len);
 
-    host_cpuid(0x8000001F, 0, NULL, &ebx, NULL, NULL);
+    host_cpuid(0x8000001F, 0, &eax, &ebx, NULL, NULL);
     cap->cbitpos = ebx & 0x3f;
+    cap->es = (eax & 0x8) ? true : false;
+    cap->snp = (eax & 0x10) ? true : false;
 
     /*
      * When SEV feature is enabled, we loose one bit in guest physical
-- 
2.31.1


