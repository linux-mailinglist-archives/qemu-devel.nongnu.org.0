Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E206EA717
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 11:35:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppn9D-0008Ew-1j; Fri, 21 Apr 2023 05:33:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppn96-0008EK-LK
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:33:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppn94-00032a-5n
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:33:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682069613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zDYjso0ZakIa3G5uIUxSOeGAQdn++vo4CDjqXvD8jMQ=;
 b=QHfdatekTrcc1Q1tKP8GhtmXaPHE1idnBe+ESKOpEFDW/lUO8sOal6NoxVw839mULNEKlu
 6LNmmkszi0CzgkTjTcC94pwh/36RZUnmcQp9ZIr4Iqp6dqdQu6gAsgx+1Wv4D+Vy0sLwfZ
 EJ2Iv27u31twBSn2kA/ECVuuaUNL3fY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-MDalOqEdPiaD8KrTBVX-Bg-1; Fri, 21 Apr 2023 05:33:32 -0400
X-MC-Unique: MDalOqEdPiaD8KrTBVX-Bg-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-94a356c74e0so124173266b.2
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 02:33:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682069610; x=1684661610;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zDYjso0ZakIa3G5uIUxSOeGAQdn++vo4CDjqXvD8jMQ=;
 b=QDLD98gnfM3c4yzKM2FjujVu8TCgVLbglByQATSeGcjhKNlkhl+2X2Pp/b2+dA4JBy
 lblxNhIPmJVk887Rcfew5P13gwdi9O5N3kH4IRkPh+g9WKxHFVfdAHK4iwBCpKsw4xcl
 lk558X0u4017GCcf39wDXoXPBNESh2G+pXUa3PPx9MG7dS/UKg5oYJFVpWZcBokGAtKm
 JOSOe3eRbhgJXHclhuhwoBj4EZavTKpgKfo9BYSxj3nR74wNE/vO9/+k4j7ka/HamxqC
 qtAM9vVGHcuJTOeamYQd6ERn9DOCmgzXXegJpfgLsv0iMdFB/0ch0q4jK54xwB6dF3vD
 7M4A==
X-Gm-Message-State: AAQBX9dw9nbvH1ZltUIAPrIUYCHVbJCFyrlOzExDo66la1zs+m6iiyZk
 vtWvNW1GUadNKZOeXvUtmNUH/F8tkG+4CQ/HZN+W+/p15m3VszNJDCu9qJ9mFiaX9pdjs7mBOo2
 tf9sCucgv7jcAzQY9Bx1M3TJnptschcM3Vhl/4nktcgQ3Wc1XcoowSX+x0PhBZ50oT5vH2nSkDe
 aCZw==
X-Received: by 2002:a17:906:4e88:b0:94f:6218:191f with SMTP id
 v8-20020a1709064e8800b0094f6218191fmr1533818eju.52.1682069610525; 
 Fri, 21 Apr 2023 02:33:30 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zo1IpXu2MkDEpkltWos/0+v9bZPwInn7/eRQxLIbg952vDV55/Quimrw3Eqq+tGen9OlcOVw==
X-Received: by 2002:a17:906:4e88:b0:94f:6218:191f with SMTP id
 v8-20020a1709064e8800b0094f6218191fmr1533808eju.52.1682069610218; 
 Fri, 21 Apr 2023 02:33:30 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 va2-20020a17090711c200b0093a0e5977e2sm1823556ejb.225.2023.04.21.02.33.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 02:33:29 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/25] lasi: fix RTC migration
Date: Fri, 21 Apr 2023 11:33:00 +0200
Message-Id: <20230421093316.17941-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421093316.17941-1-pbonzini@redhat.com>
References: <20230421093316.17941-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Migrate rtc_ref (which only needs to be 32-bit because it is summed to
a 32-bit register), which requires bumping the migration version.
The HPPA machine does not have versioned machine types so it is okay
to block migration to old versions of QEMU.

While at it, drop the write-only field rtc from LasiState.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/misc/lasi.c         | 4 ++--
 include/hw/misc/lasi.h | 3 +--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/misc/lasi.c b/hw/misc/lasi.c
index 23a7634a8c3a..ff9dc893ae65 100644
--- a/hw/misc/lasi.c
+++ b/hw/misc/lasi.c
@@ -194,7 +194,7 @@ static const MemoryRegionOps lasi_chip_ops = {
 
 static const VMStateDescription vmstate_lasi = {
     .name = "Lasi",
-    .version_id = 1,
+    .version_id = 2,
     .minimum_version_id = 1,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(irr, LasiState),
@@ -204,6 +204,7 @@ static const VMStateDescription vmstate_lasi = {
         VMSTATE_UINT32(iar, LasiState),
         VMSTATE_UINT32(errlog, LasiState),
         VMSTATE_UINT32(amr, LasiState),
+        VMSTATE_UINT32_V(rtc_ref, LasiState, 2),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -233,7 +234,6 @@ static void lasi_reset(DeviceState *dev)
     s->iar = 0xFFFB0000 + 3; /* CPU_HPA + 3 */
 
     /* Real time clock (RTC), it's only one 32-bit counter @9000 */
-    s->rtc = time(NULL);
     s->rtc_ref = 0;
 }
 
diff --git a/include/hw/misc/lasi.h b/include/hw/misc/lasi.h
index ecc7065ce858..0a8c7352be21 100644
--- a/include/hw/misc/lasi.h
+++ b/include/hw/misc/lasi.h
@@ -69,8 +69,7 @@ struct LasiState {
 
     uint32_t errlog;
     uint32_t amr;
-    uint32_t rtc;
-    time_t rtc_ref;
+    uint32_t rtc_ref;
 
     MemoryRegion this_mem;
 };
-- 
2.40.0


