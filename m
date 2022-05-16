Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F30FC528BA3
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 19:12:15 +0200 (CEST)
Received: from localhost ([::1]:53706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqeGV-0007XL-2s
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 13:12:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqd5R-0002pK-UU
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:56:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqd5P-0003Q2-HP
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:56:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652716602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8wKsk7Jk3lA9O2ukpSpr1c+d355y3PcTPWwFRjEq2/g=;
 b=Wy61vRfMh829kJiTUT0UtXV4ts8Z1HGXwMjwGRfzRHVjssndPvHFVAJX3avmlglQIYdyTE
 CR5z1GNo4bp0yelbXXB9Lfm9t8CVlIfZBjm0GPHWpoJOwnQxlRatt01/Kxmu1yQZfXGtgB
 i/mGvPo91to3SauDJTNVAxhAcrPkMDo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-336-QRXIbpj_O9OeO02QkqPJgQ-1; Mon, 16 May 2022 11:56:40 -0400
X-MC-Unique: QRXIbpj_O9OeO02QkqPJgQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 ch28-20020a0564021bdc00b00425cb227ab4so10047611edb.4
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 08:56:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8wKsk7Jk3lA9O2ukpSpr1c+d355y3PcTPWwFRjEq2/g=;
 b=ToH2iT0VVUXJB8xz9CCWpXA4p79q8cIMLpkdNEt/obLH9zr7yIsni3B30vL59LT7cf
 u+Xq1QXpsfdiY7h8gmeOMqZeu+ZLGP8r4+3lFHRdAjKje8WhkrBb6+eLACinQtbLD+5H
 lh9gZ7pN46AegjZ5pa/euk21/7xNmwN4nfcnRVZopuSVdejOF2QeZdIzugRHm5bow5C8
 Xw450Nug5zUkgxv0DNIBijTe6OtPIrp/0O4G5ZtZR4KfIoxY7h0AAtCGNlWEy8iWc5F2
 v0oIJWHprcGC6TM8HAwZbaYXF4KURaM4pVKHJUFcxGq/7hgJygIauHESfS2fy7EuIOCI
 MsAw==
X-Gm-Message-State: AOAM531M2mUBblIoEjwitPyJ77p9mpoAdLrrqxQarw5ElMF22BZMfQ2P
 feDJ34eysHi+9KkcEDfPlBYymYm6e+PXA5ZQzc2raKpEe0Yhf0LEmcQTe17E7sX/QVXkCcOpDXU
 YQwpAY6oDHZQwxOP+Rgp+sj0zfdH52WCLrJmY65pL3ngT3Jocm9KM4GAlPUls7SYV/iA=
X-Received: by 2002:a05:6402:cae:b0:42a:ba8f:9d05 with SMTP id
 cn14-20020a0564020cae00b0042aba8f9d05mr3005182edb.277.1652716599468; 
 Mon, 16 May 2022 08:56:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPwqpFEBH49Us7Zf6gaZuPsOVWoxn9Bnfy3KcJnlahhHRWKviIRNhm6LuTwSKrd/xjzWY2JA==
X-Received: by 2002:a05:6402:cae:b0:42a:ba8f:9d05 with SMTP id
 cn14-20020a0564020cae00b0042aba8f9d05mr3005154edb.277.1652716599096; 
 Mon, 16 May 2022 08:56:39 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 y24-20020aa7ccd8000000b0042617ba6397sm5480896edt.33.2022.05.16.08.56.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 08:56:38 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/23] soundhw: unify initialization for ISA and PCI soundhw
Date: Mon, 16 May 2022 17:55:58 +0200
Message-Id: <20220516155603.1234712-19-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220516155603.1234712-1-pbonzini@redhat.com>
References: <20220516155603.1234712-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use qdev_new instead of distinguishing isa_create_simple/pci_create_simple.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/audio/soundhw.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/hw/audio/soundhw.c b/hw/audio/soundhw.c
index 0fb64bdc8f..a1558dab3a 100644
--- a/hw/audio/soundhw.c
+++ b/hw/audio/soundhw.c
@@ -114,25 +114,30 @@ void soundhw_init(void)
     struct soundhw *c = selected;
     ISABus *isa_bus = (ISABus *) object_resolve_path_type("", TYPE_ISA_BUS, NULL);
     PCIBus *pci_bus = (PCIBus *) object_resolve_path_type("", TYPE_PCI_BUS, NULL);
+    BusState *bus;
 
     if (!c) {
         return;
     }
-    if (c->typename) {
-        warn_report("'-soundhw %s' is deprecated, "
-                    "please use '-device %s' instead",
-                    c->name, c->typename);
-        if (c->isa) {
-            isa_create_simple(isa_bus, c->typename);
-        } else {
-            pci_create_simple(pci_bus, -1, c->typename);
+    if (c->isa) {
+        if (!isa_bus) {
+            error_report("ISA bus not available for %s", c->name);
+            exit(1);
         }
+        bus = BUS(isa_bus);
     } else {
-        assert(!c->isa);
         if (!pci_bus) {
             error_report("PCI bus not available for %s", c->name);
             exit(1);
         }
+        bus = BUS(pci_bus);
+    }
+
+    if (c->typename) {
+        DeviceState *dev = qdev_new(c->typename);
+        qdev_realize_and_unref(dev, bus, &error_fatal);
+    } else {
+        assert(!c->isa);
         c->init_pci(pci_bus);
     }
 }
-- 
2.36.0


