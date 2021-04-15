Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5F5360683
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 12:06:40 +0200 (CEST)
Received: from localhost ([::1]:45540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWytT-0002t6-EL
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 06:06:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lWyrM-00020y-P0
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 06:04:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lWyrL-000543-7z
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 06:04:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618481066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y6NcfPnX58PUNNb+XCoT+Nl0nuOTzq38YXDKZavXEJg=;
 b=ZPk8v9NYP9AuBSNnUxl7i8ImGgNIqYy+P+/aQfs218ekxSGAH8AcL9KD+fa7ns/FYumVoI
 /NhR8GlgAet5Blklv5lWwEWubdkqHklppNS0zs1jJ8K0nhUvmd8+a2cv2D4mirm/S6dp8x
 g06LDLswDd6hpB+sgR/PE2cZ9fcjwaw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-wWipi7rnM3aEEL5pYdEYRg-1; Thu, 15 Apr 2021 06:04:23 -0400
X-MC-Unique: wWipi7rnM3aEEL5pYdEYRg-1
Received: by mail-wm1-f72.google.com with SMTP id
 g144-20020a1c20960000b029012983de0c8fso2497621wmg.7
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 03:04:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y6NcfPnX58PUNNb+XCoT+Nl0nuOTzq38YXDKZavXEJg=;
 b=pqOZRLfvRVaTT1hIP1dflTBl40BkxvIfsRQTBPzsERdCRTJ8F98EE9N0WdmQg1yA+J
 TtsUjIdJotol8+YCFqikWqGd2nKxhbekAS6cFeMVG7iEVO1IFCKHfVq5IxzCZLDRoYJ7
 UUfdcBQIT0gihC2wDVMNB8VCRkYyIQ7WKxnWhJr6R5jN/3VVzCVnldMExKuNE0p9CAEC
 OdYFayoVCaS8zcpbmvGQJNC7CI6hEy/CCBXt8WohJnNZtB1CPQJw6iTqi9H0Np8lw7Oa
 yTr0/hegsS7H0VSH3A1mLrhvjCEW48GEOoUZD8Y90dIAngrXy124gjIKfLLuKeI4rdds
 BwDQ==
X-Gm-Message-State: AOAM531i64TcBCot0pbbQ/dkMUpUcDCBLKT4aGleoD9rRmK/BzWa2Lu4
 YnCQeBbKFqe1/n767rQuiSo8m3fYY3XGe5EcY7vn00RyOKunUdq5CzK7xjP2IT/uv7PNEKZUwMZ
 JmGtnXT3Jb5UlIRo=
X-Received: by 2002:a05:6000:190:: with SMTP id
 p16mr2593684wrx.334.1618481061953; 
 Thu, 15 Apr 2021 03:04:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNYIGPADq1ypkdUhki55um+/Ri0irObaZG6eSjs5x4LofeT5JM2oEkgcXmpIEfbbZnlJzfPg==
X-Received: by 2002:a05:6000:190:: with SMTP id
 p16mr2593667wrx.334.1618481061801; 
 Thu, 15 Apr 2021 03:04:21 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id o15sm1829263wmh.19.2021.04.15.03.04.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 03:04:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] hw/elf_ops: clear uninitialized segment space
Date: Thu, 15 Apr 2021 12:04:09 +0200
Message-Id: <20210415100409.3977971-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210415100409.3977971-1-philmd@redhat.com>
References: <20210415100409.3977971-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <laurent@vivier.eu>

When the mem_size of the segment is bigger than the file_size,
and if this space doesn't overlap another segment, it needs
to be cleared.

This bug is very similar to the one we had for linux-user,
22d113b52f41 ("linux-user: Fix loading of BSS segments"),
where .bss section is encoded as an extension of the the data
one by setting the segment p_memsz > p_filesz.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210414105838.205019-1-laurent@vivier.eu>
[PMD: Use recently added address_space_set()]
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/elf_ops.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/hw/elf_ops.h b/include/hw/elf_ops.h
index 6ee458e7bc3..29f4c43e231 100644
--- a/include/hw/elf_ops.h
+++ b/include/hw/elf_ops.h
@@ -562,6 +562,19 @@ static int glue(load_elf, SZ)(const char *name, int fd,
                     if (res != MEMTX_OK) {
                         goto fail;
                     }
+                    /*
+                     * We need to zero'ify the space that is not copied
+                     * from file
+                     */
+                    if (file_size < mem_size) {
+                        res = address_space_set(as ? as : &address_space_memory,
+                                                addr + file_size, 0,
+                                                mem_size - file_size,
+                                                MEMTXATTRS_UNSPECIFIED);
+                        if (res != MEMTX_OK) {
+                            goto fail;
+                        }
+                    }
                 }
             }
 
-- 
2.26.3


