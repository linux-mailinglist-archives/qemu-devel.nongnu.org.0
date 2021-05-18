Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB23F38800F
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 20:57:06 +0200 (CEST)
Received: from localhost ([::1]:59348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj4tt-0006Ls-UD
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 14:57:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj4cJ-0003L4-4H
 for qemu-devel@nongnu.org; Tue, 18 May 2021 14:38:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj4cF-0000L0-TI
 for qemu-devel@nongnu.org; Tue, 18 May 2021 14:38:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621363131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Fhmv8UDrFXMluj5JtnfTvwHhmVYZmFodUsrjoVpD7s=;
 b=Ct7wXEzma7W4ebZx/ZFFq4ubsiGosLzszrdqKUhkNXkV9u2Tr0xo5uLOWuyw3EoUWvG3Ip
 JwIxCNGqh0r04SsMreCnOVt/HGSjpPqa6NrgCwlpnCkqplzMAm7irP1rdpmWS4ZqhbHbaT
 M4tuiW8SD6fvGhnMecxRhS5gpGHJ7CE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-1DM6P9SZM8itE-29KF220w-1; Tue, 18 May 2021 14:38:49 -0400
X-MC-Unique: 1DM6P9SZM8itE-29KF220w-1
Received: by mail-ej1-f72.google.com with SMTP id
 gt39-20020a1709072da7b02903a8f7736a08so2758113ejc.1
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 11:38:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3Fhmv8UDrFXMluj5JtnfTvwHhmVYZmFodUsrjoVpD7s=;
 b=Z3/qr1SlLU2js9xvS9AzdszL+HyjSS6FwlAXJlopUbpQRyQeKdlc3o+VB/NBeHTZpP
 LKXZCGxS5orVqj5LnTBNZR9BLvltjKsOT+0JoMyNcUh5H7YEB5xKe1juYMnz4RgmlC+P
 Zgiy34THgiO3x0P6OxWiI2Roo4uzeROy2eQNuRHNS1qQez6GVhGtUGca8r7ynuHfbzsv
 oD69B8D5nM9wCpMTyKFpQCXpMgjCisLA7u6kA3wcVZlesG75XovyzrZU7mB9cf0uAaJA
 5e+AynSUbqqwX4MysjxGTdjxVGe20umO5JUDrRGkfEkwPdPjjMsSc5PyYyAInW5aqlf2
 xQvQ==
X-Gm-Message-State: AOAM530FRikgyZEvye+EnagafYsh7v/tVAOS6ZR7g26EPcnpZ9XmCOnh
 HA9biPsd8o+fBey0IF5fDg7iLan1qHlK6RIGxOVKxRDEGa7O8AxFpSOcdoYpRaidzWSJqnRSlkG
 WkYsAdVazV4VukMHshHu9z9TzN2WdMu/Qc9nJ0ztATf1xXWd4UgkMXipyhkmXaW3R
X-Received: by 2002:a17:906:a0a:: with SMTP id
 w10mr7393018ejf.416.1621363128443; 
 Tue, 18 May 2021 11:38:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRm8+VarN6kb1NSoZE3/FrmDAO8K1CLYS4ZhScoYtWoml6P2NUzraCKP1p+VywvjlBt6j7Ww==
X-Received: by 2002:a17:906:a0a:: with SMTP id
 w10mr7392984ejf.416.1621363128157; 
 Tue, 18 May 2021 11:38:48 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id b9sm4837578edt.71.2021.05.18.11.38.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 11:38:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 22/25] hw/virtio: Use LDST_CONVERT macro to emit 32-bit
 load/store functions
Date: Tue, 18 May 2021 20:36:52 +0200
Message-Id: <20210518183655.1711377-23-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210518183655.1711377-1-philmd@redhat.com>
References: <20210518183655.1711377-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bibo Mao <maobibo@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/virtio/virtio-access.h | 66 +++----------------------------
 1 file changed, 5 insertions(+), 61 deletions(-)

diff --git a/include/hw/virtio/virtio-access.h b/include/hw/virtio/virtio-access.h
index 4341af9cb0f..0df52d190dc 100644
--- a/include/hw/virtio/virtio-access.h
+++ b/include/hw/virtio/virtio-access.h
@@ -100,18 +100,13 @@ static inline void virtio_st ## size ## _phys_cached(VirtIODevice *vdev,\
     }\
 }
 
+#define VIRTIO_LDST_CONVERT(size, rtype, vtype)\
+    VIRTIO_LD_CONVERT(size, rtype)\
+    VIRTIO_ST_CONVERT(size, vtype)
+
 VIRTIO_LD_CONVERT(uw, uint16_t)
 VIRTIO_ST_CONVERT(w, uint16_t)
-
-static inline uint32_t virtio_ldl_phys(VirtIODevice *vdev, hwaddr pa)
-{
-    AddressSpace *dma_as = vdev->dma_as;
-
-    if (virtio_access_is_big_endian(vdev)) {
-        return ldl_be_phys(dma_as, pa);
-    }
-    return ldl_le_phys(dma_as, pa);
-}
+VIRTIO_LDST_CONVERT(l, int, uint32_t)
 
 static inline uint64_t virtio_ldq_phys(VirtIODevice *vdev, hwaddr pa)
 {
@@ -123,27 +118,6 @@ static inline uint64_t virtio_ldq_phys(VirtIODevice *vdev, hwaddr pa)
     return ldq_le_phys(dma_as, pa);
 }
 
-static inline void virtio_stl_phys(VirtIODevice *vdev, hwaddr pa,
-                                   uint32_t value)
-{
-    AddressSpace *dma_as = vdev->dma_as;
-
-    if (virtio_access_is_big_endian(vdev)) {
-        stl_be_phys(dma_as, pa, value);
-    } else {
-        stl_le_phys(dma_as, pa, value);
-    }
-}
-
-static inline void virtio_stl_p(VirtIODevice *vdev, void *ptr, uint32_t v)
-{
-    if (virtio_access_is_big_endian(vdev)) {
-        stl_be_p(ptr, v);
-    } else {
-        stl_le_p(ptr, v);
-    }
-}
-
 static inline void virtio_stq_p(VirtIODevice *vdev, void *ptr, uint64_t v)
 {
     if (virtio_access_is_big_endian(vdev)) {
@@ -153,15 +127,6 @@ static inline void virtio_stq_p(VirtIODevice *vdev, void *ptr, uint64_t v)
     }
 }
 
-static inline uint32_t virtio_ldl_p(VirtIODevice *vdev, const void *ptr)
-{
-    if (virtio_access_is_big_endian(vdev)) {
-        return ldl_be_p(ptr);
-    } else {
-        return ldl_le_p(ptr);
-    }
-}
-
 static inline uint64_t virtio_ldq_p(VirtIODevice *vdev, const void *ptr)
 {
     if (virtio_access_is_big_endian(vdev)) {
@@ -180,16 +145,6 @@ static inline uint16_t virtio_tswap16(VirtIODevice *vdev, uint16_t s)
 #endif
 }
 
-static inline uint32_t virtio_ldl_phys_cached(VirtIODevice *vdev,
-                                              MemoryRegionCache *cache,
-                                              hwaddr pa)
-{
-    if (virtio_access_is_big_endian(vdev)) {
-        return ldl_be_phys_cached(cache, pa);
-    }
-    return ldl_le_phys_cached(cache, pa);
-}
-
 static inline uint64_t virtio_ldq_phys_cached(VirtIODevice *vdev,
                                               MemoryRegionCache *cache,
                                               hwaddr pa)
@@ -200,17 +155,6 @@ static inline uint64_t virtio_ldq_phys_cached(VirtIODevice *vdev,
     return ldq_le_phys_cached(cache, pa);
 }
 
-static inline void virtio_stl_phys_cached(VirtIODevice *vdev,
-                                          MemoryRegionCache *cache,
-                                          hwaddr pa, uint32_t value)
-{
-    if (virtio_access_is_big_endian(vdev)) {
-        stl_be_phys_cached(cache, pa, value);
-    } else {
-        stl_le_phys_cached(cache, pa, value);
-    }
-}
-
 static inline void virtio_tswap16s(VirtIODevice *vdev, uint16_t *s)
 {
     *s = virtio_tswap16(vdev, *s);
-- 
2.26.3


