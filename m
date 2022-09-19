Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8FB5BD41A
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 19:51:49 +0200 (CEST)
Received: from localhost ([::1]:50180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaKvs-0003iJ-JG
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 13:51:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oaKfm-0002xS-L5
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:35:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oaKfl-00034C-0R
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:35:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663608908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7fpYBjqvol9brkWwCpmEHRs0UL23HHBLAFtYFzWhwIU=;
 b=BKcPdo8Da+hjX9IrIIy2k5ZPhWC8IgnhNg9tSG2P7VeNyVOXZKsTTF+SULOeujf7sZB5+y
 190FFUrSL3xsXsce0BQfUrIq4ZSL9rX49WnjCgJZWIw0UW1pRnSYHYDCybwIIoi8Ed8uHz
 59kOYqjEeUK8gLE4QMqg8ACBtAdrouI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-601-42QQCsFEO9eGu1yc3sZ30A-1; Mon, 19 Sep 2022 13:35:06 -0400
X-MC-Unique: 42QQCsFEO9eGu1yc3sZ30A-1
Received: by mail-wr1-f69.google.com with SMTP id
 i27-20020adfaadb000000b0022a48b6436dso26372wrc.23
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 10:35:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=7fpYBjqvol9brkWwCpmEHRs0UL23HHBLAFtYFzWhwIU=;
 b=CW74wzCEIOR9BqZ2vemjjTjhKKwJj/fzW0jc/QsP3Vk+syIyFrKpRqMbKnuPVpZKsA
 ALTlrRvkLdw+gSdVRXMmxu0t8wL/yRdZ9aGomJPeyPSZ2CV0Qz7IRzi5nToOn/BNK8w8
 OsKniBqrQGdFXbDVXrbZS2M48EATPsjtrN1gsD2JyMjVF/6wlGFqGRbNIatdiEANit5M
 5eoM7R4CVtpxAcBuboajTcZ/VzUFjEyY64aGdnhbCMmwNPfz/RXLxkHfZn2CXXXG8/8a
 cdkvCwNtJKZxPDo1ozXRStYnlKesBYI20COgkUNDBttws7WlXGodcDlptTSiarOGUQTl
 w88w==
X-Gm-Message-State: ACrzQf23qtbe2HG+O1XUyCw0h7gJmsNQSYAJnXKJzmdOcRyalpPE7wu1
 XvUhw8N9o+yk80jlxnZhIanDbs4e9Qvmtvi5ovmufUoTTCprRDu4QjHAobAgwWLOowRmO7ll1II
 RBMUJsFYvSSgbQbfNYIBmko1CUlJrO/8WVmY4gLASj8x9df8gXpfjNwi1QYsDQZw47pc=
X-Received: by 2002:a05:600c:4f11:b0:3b4:bf6c:4566 with SMTP id
 l17-20020a05600c4f1100b003b4bf6c4566mr10945367wmq.34.1663608905436; 
 Mon, 19 Sep 2022 10:35:05 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5V2Gv4EBPUWJXWTiHqoGEid7AQNvsK5zsgOLJ7qKgniHueC+xtazw+vg3aFZg3drmXOai8XA==
X-Received: by 2002:a05:600c:4f11:b0:3b4:bf6c:4566 with SMTP id
 l17-20020a05600c4f1100b003b4bf6c4566mr10945357wmq.34.1663608905148; 
 Mon, 19 Sep 2022 10:35:05 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 q17-20020adff951000000b00228dff8d975sm14414592wrr.109.2022.09.19.10.35.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 10:35:04 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/21] smbios: sanitize type from external type before checking
 have_fields_bitmap
Date: Mon, 19 Sep 2022 19:34:35 +0200
Message-Id: <20220919173449.5864-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220919173449.5864-1-pbonzini@redhat.com>
References: <20220919173449.5864-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

test_bit uses header->type as an offset; if the file incorrectly specifies a
type greater than 127, smbios_entry_add will read and write garbage.

To fix this, just pass the smbios data through, assuming the user knows what
to do.  Reported by Coverity as CID 1487255.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/smbios/smbios.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index 60349ee402..4c9f664830 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -1205,13 +1205,15 @@ void smbios_entry_add(QemuOpts *opts, Error **errp)
             return;
         }
 
-        if (test_bit(header->type, have_fields_bitmap)) {
-            error_setg(errp,
-                       "can't load type %d struct, fields already specified!",
-                       header->type);
-            return;
+        if (header->type <= SMBIOS_MAX_TYPE) {
+            if (test_bit(header->type, have_fields_bitmap)) {
+                error_setg(errp,
+                           "can't load type %d struct, fields already specified!",
+                           header->type);
+                return;
+            }
+            set_bit(header->type, have_binfile_bitmap);
         }
-        set_bit(header->type, have_binfile_bitmap);
 
         if (header->type == 4) {
             smbios_type4_count++;
-- 
2.37.2


