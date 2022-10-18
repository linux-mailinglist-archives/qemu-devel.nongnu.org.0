Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB80602DAC
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 15:59:23 +0200 (CEST)
Received: from localhost ([::1]:58360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okn7p-00013c-A2
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 09:59:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmgh-0002KB-5p
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:31:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmge-00050k-5b
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:31:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666099875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Mj0trnLBbmwbil62VyOFwjoBgFh0LukQgd1Qfq5RB8=;
 b=JtswHCO068zQB6igZNCcJ5aFyKKpIiF3tWJMmCSsh1ckcyMWJXwHmMerHSfTe1diLvNV35
 Hbgr1LtTQnrvM5Gxd+KooT7J154pe4vkO+L2AAa5gP5sJBP9Suck6/lAxkOl6ypdDzaYF1
 3E8LEuZ2bfFL5+sp5G9ge+3mCxo2lF0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-635-HJpj9CrpN062IhaAz7RTkA-1; Tue, 18 Oct 2022 09:31:13 -0400
X-MC-Unique: HJpj9CrpN062IhaAz7RTkA-1
Received: by mail-ej1-f69.google.com with SMTP id
 sa6-20020a1709076d0600b0078d84ed54b9so6374052ejc.18
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 06:31:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8Mj0trnLBbmwbil62VyOFwjoBgFh0LukQgd1Qfq5RB8=;
 b=dN+Y0QfVuWy+usVcUmoWzNhZ6PW5//+9wNdaeKJU20SMS+6wWxsELRHB+d7lRK4mlQ
 pAMSzlaDdI2qxdj57Ou4AXMhkfgdyIBPQwJ/m7ggQ5rIiGt/9xY0uPTwphxqzYKdKVIQ
 m664uETGI7n8FLYHBphKbgeg/X4+MOeE5WbCrwLa0jzJydok44hV1xqR8vIO8k/jFbXb
 kX6GrEezD+cT2iNfOaKszvGZquhZ2Rd8fBL9gnl05U8bKMYSFHliTvi/r8B3Y8neIxfJ
 3zbXtUAagvXJU/xaViaDfYf8RXg0ZTbgCJ8/vWsDEaLC8vchsd0smf0dG2yV1y7PreQC
 hOdQ==
X-Gm-Message-State: ACrzQf15SESsSf762f5MB/SKPTL0FsoPAlgT4DgpNy5XL45VejNul2qE
 rEkrCjSKrUkkbZd8h6z1T6XO1R6ZZIbS6P9E38VXxM97G8DXst7H8gMSyc/lrvAXEfGYaRUF4Uj
 A/bEkiWfhDb57BkR6KRX6FFdLMtnn4YHuwmLOD6UI3nTJtkFZQyCCv+LFh6eysnBtfrY=
X-Received: by 2002:a17:907:2d0f:b0:78e:9ca5:62af with SMTP id
 gs15-20020a1709072d0f00b0078e9ca562afmr2428770ejc.334.1666099871787; 
 Tue, 18 Oct 2022 06:31:11 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5sUaychFe3wBo2kY5s6G2G3USPhGLRGtWchh1NtfaYDlJFqoIIl4EZ5CJM3WLPaJq/MlBUUw==
X-Received: by 2002:a17:907:2d0f:b0:78e:9ca5:62af with SMTP id
 gs15-20020a1709072d0f00b0078e9ca562afmr2428756ejc.334.1666099871547; 
 Tue, 18 Oct 2022 06:31:11 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.gmail.com with ESMTPSA id
 l17-20020a1709060cd100b00783c545544fsm7500565ejh.215.2022.10.18.06.31.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 06:31:10 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>
Subject: [PULL 07/53] target/i386: Use device_cold_reset() to reset the APIC
Date: Tue, 18 Oct 2022 15:29:56 +0200
Message-Id: <20221018133042.856368-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221018133042.856368-1-pbonzini@redhat.com>
References: <20221018133042.856368-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

The semantic difference between the deprecated device_legacy_reset()
function and the newer device_cold_reset() function is that the new
function resets both the device itself and any qbuses it owns,
whereas the legacy function resets just the device itself and nothing
else.

The x86_cpu_after_reset() function uses device_legacy_reset() to reset
the APIC; this is an APICCommonState and does not have any qbuses, so
for this purpose the two functions behave identically and we can stop
using the deprecated one.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221013171926.1447899-1-peter.maydell@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 90aec2f462..6279745f79 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6043,7 +6043,7 @@ void x86_cpu_after_reset(X86CPU *cpu)
     }
 
     if (cpu->apic_state) {
-        device_legacy_reset(cpu->apic_state);
+        device_cold_reset(cpu->apic_state);
     }
 #endif
 }
-- 
2.37.3


