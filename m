Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F18267D792
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 22:19:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL9dP-000868-FR; Thu, 26 Jan 2023 16:18:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pL9d7-0007wW-4c; Thu, 26 Jan 2023 16:17:57 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pL9d5-0007jF-Lo; Thu, 26 Jan 2023 16:17:56 -0500
Received: by mail-ed1-x531.google.com with SMTP id w11so3143875edv.0;
 Thu, 26 Jan 2023 13:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fGhWaMW25bDreQ5GS2SvNFJnZIg8Fsu2CnnXot6JUbI=;
 b=OsA2JAo06+Z6ba8ZsjiIInnSNpgVpyEIv2tzf5Z47/YXb+iOsU7WsUHWreTB0h+iXK
 NHLnF8478edYfjCylnwDk7mGkk0ZW0/QPat2Bav7aw8zQncEup8MZ/L0ZUduuaou0d40
 MZBCLDY1pVtyJptAliEC+xucUQEUd4Nbqz1YkkDKoMZiqgvIF22l2oViHYrt3b9Dycb0
 jv+GnpuTLBPEoq/hQUhR2PwGcuGqoSo8Z445gjeSebccDjAMdUkUMJqeh7ZhQiV3o2cn
 ujGd3VtlhYY6AldGWiV3XQ+PTW+wxMeXb/H2a5/DMnzy+rtZkRsHfYv0Xu8I17zFpCKs
 bIPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fGhWaMW25bDreQ5GS2SvNFJnZIg8Fsu2CnnXot6JUbI=;
 b=Wopj4HmCipQIDMkMJ84q0f6wOnEMy8RnJtudoc6u79npH7ksOZszeJAiuzzCbD2cp5
 +ORUs8dmKWGNA1606WYnCS2CezSRRdHEWeEwjN/qzOYJuKQPSBFpaTiouakdGG9JMhaD
 J34fKnFa5KWuUkK2FbOdSDwfkr2BZxyq7vBEcgnZ3IoAd1d3aO6zU3JhWGpdy8Rq5S4r
 yCYpGYayvhhFN6f1vrni8S6xKzXYVuUyVG/mb+T+ooz/zHdtmY7/Czn6icJq+aYmg9Xn
 fnT2+o2Cj+T1ZTPGqvHhNzljl9mwdAPG1d+WsTqbaWgiahqqMeu3V8HnQEH71RDfgYLj
 Yv2Q==
X-Gm-Message-State: AFqh2kqZBv4dm5qvIwML9fAC74MWLK6TaGlWeguXNXRdTU+sofLVa7b8
 zvMRVIs11bKVYg5xtIVx//zPU4bmHn0hxQ==
X-Google-Smtp-Source: AMrXdXsg9IoXVr6eCqMDSDoR/ZCRvofinSweOU+ws9sIh241Mp1s17q0MfIBXveKNXRCWaTmwH11dA==
X-Received: by 2002:a05:6402:194c:b0:498:b9ea:1896 with SMTP id
 f12-20020a056402194c00b00498b9ea1896mr45122812edz.9.1674767873221; 
 Thu, 26 Jan 2023 13:17:53 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a170906384500b00878003adeeesm1117568ejc.23.2023.01.26.13.17.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 13:17:52 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-ppc@nongnu.org, qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 03/10] softmmu/ioport: Remove unused functions
Date: Thu, 26 Jan 2023 22:17:33 +0100
Message-Id: <20230126211740.66874-4-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126211740.66874-1-shentey@gmail.com>
References: <20230126211740.66874-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/exec/ioport.h |  2 --
 softmmu/ioport.c      | 24 ------------------------
 2 files changed, 26 deletions(-)

diff --git a/include/exec/ioport.h b/include/exec/ioport.h
index ec3e8e5942..1ef5aebba3 100644
--- a/include/exec/ioport.h
+++ b/include/exec/ioport.h
@@ -67,7 +67,5 @@ void portio_list_init(PortioList *piolist, Object *owner,
                       void *opaque, const char *name,
                       MemoryRegion *address_space_io, uint16_t start);
 void portio_list_set_flush_coalesced(PortioList *piolist);
-void portio_list_destroy(PortioList *piolist);
-void portio_list_del(PortioList *piolist);
 
 #endif /* IOPORT_H */
diff --git a/softmmu/ioport.c b/softmmu/ioport.c
index c92e3cb27d..0a55d39196 100644
--- a/softmmu/ioport.c
+++ b/softmmu/ioport.c
@@ -118,19 +118,6 @@ void portio_list_set_flush_coalesced(PortioList *piolist)
     piolist->flush_coalesced_mmio = true;
 }
 
-void portio_list_destroy(PortioList *piolist)
-{
-    MemoryRegionPortioList *mrpio;
-    unsigned i;
-
-    for (i = 0; i < piolist->nr; ++i) {
-        mrpio = container_of(piolist->regions[i], MemoryRegionPortioList, mr);
-        object_unparent(OBJECT(&mrpio->mr));
-        g_free(mrpio);
-    }
-    g_free(piolist->regions);
-}
-
 static const MemoryRegionPortio *find_portio(MemoryRegionPortioList *mrpio,
                                              uint64_t offset, unsigned size,
                                              bool write)
@@ -280,14 +267,3 @@ void portio_list_init(PortioList *piolist, Object *owner,
     /* There will always be an open sub-list.  */
     portio_list_add_1(piolist, pio_start, count, start, off_low, off_high);
 }
-
-void portio_list_del(PortioList *piolist)
-{
-    MemoryRegionPortioList *mrpio;
-    unsigned i;
-
-    for (i = 0; i < piolist->nr; ++i) {
-        mrpio = container_of(piolist->regions[i], MemoryRegionPortioList, mr);
-        memory_region_del_subregion(piolist->address_space, &mrpio->mr);
-    }
-}
-- 
2.39.1


