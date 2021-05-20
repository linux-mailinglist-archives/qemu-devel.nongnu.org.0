Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF1838A007
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 10:42:11 +0200 (CEST)
Received: from localhost ([::1]:55642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljeFu-0007Ff-Uc
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 04:42:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ljdxm-0005RX-PO
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:23:29 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:37814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ljdxf-0001Uh-27
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:23:24 -0400
Received: by mail-wr1-x42d.google.com with SMTP id q5so16672344wrs.4
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 01:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VQnUmfR20gYr35rYG97IsG28QbmzwJrf55GVaV1P6jc=;
 b=qKaW+TOBnkCin9JoAFytv4fZpNsov9rlP+TjkPDUr+1KKjMxkEZdruMGkMTnx54bSm
 O143eKz7RSN8FEpDF6kQ1VtLUeqfkbqGG7ISmaUucapxL3NvpYbDDa3vR5rVvdjI5QF2
 I2CAZQTZy0tJtKLK1JyWbHgCWPgYnZPU2mfceZwXG6oW79yreE9Yd2fXqXTn+PQb4BR3
 yTbmQD3R1JimD5AFF2vEfzXVGK7ysN5O9d88pSZjPaIcUiJbZQR7FaqHhRuvQ0vZk4kG
 u4R3cZWJsZCDwi/k67n0JQBhZGGM5BssAOmZFNQaVctCvBYJXwKVNYkDoEDmYUG1Sfj5
 5kog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VQnUmfR20gYr35rYG97IsG28QbmzwJrf55GVaV1P6jc=;
 b=UiEEGviE1m7d3Dfv3dfOMqvDIFvuogbMtMkHh+zH8Q0d3rJ3koFcMRIIoEjWigKbUQ
 aa22OB29vq7XLQ0fjov88CCxI1w6TQyUwhZbn2fdVsiab6x1f0e28mLmFGVvamz9I3ZB
 zBeyEb8PiECchXa5Av4IAb1/CfvsaWmM4b1Yt2uGDEohvoAQHCF6tzHbeGLsIlXjdPom
 wYmQAJy2yIcN4YYWOHKAzzSDvJ7BZmKgdC+jShYggdVexqtP0BaJ7y8ikLR27ebFD8XK
 IxDqnDx0DwlqAABiinlVx5MPj+giKvtubLktT/fkgrdiuMQNBivKtunfjfLViWIFei0H
 cntg==
X-Gm-Message-State: AOAM531kj34jYrJjan++bwP9PhmOvc9xBR3Hu5/dLhoAo49ZW3f09Go3
 vPu/65b0kaTXP5sBvWGcQyd6/rs7bw0y0g==
X-Google-Smtp-Source: ABdhPJxLUavHl9flNoLaxmKTjvSjvg6+tNz0A2BYeF7KtR8cxpRsXXLzbv18/PuShRU9wEwyC6PevA==
X-Received: by 2002:a5d:50c7:: with SMTP id f7mr3061310wrt.189.1621498982707; 
 Thu, 20 May 2021 01:23:02 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v10sm2603506wrq.0.2021.05.20.01.23.02 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 01:23:02 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/26] meson: bump submodule to 0.57.2
Date: Thu, 20 May 2021 10:22:37 +0200
Message-Id: <20210520082257.187061-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520082257.187061-1-pbonzini@redhat.com>
References: <20210520082257.187061-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The main advantage of 0.57 is that it fixes
https://github.com/mesonbuild/meson/pull/7900, thus avoiding unnecessary
rebuilds after running meson.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson b/meson
index 776acd2a80..6f745e980b 160000
--- a/meson
+++ b/meson
@@ -1 +1 @@
-Subproject commit 776acd2a805c9b42b4f0375150977df42130317f
+Subproject commit 6f745e980bcab036104c6b7f9064191e489012b9
-- 
2.31.1



