Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8849833A6BB
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 17:41:51 +0100 (CET)
Received: from localhost ([::1]:52416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLToM-0005G9-2X
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 12:41:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lLTm9-0004hk-5P
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 12:39:34 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:54967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lLTm7-0005yI-H7
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 12:39:32 -0400
Received: by mail-wm1-x32d.google.com with SMTP id g8so6747154wmd.4
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 09:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KGThrPzLRl+xRmi/6a9GxsjI47f1pTYHFfas07Xrz9k=;
 b=N/p8+U1vd438yh1KZzicGH7A5Rz4HhKPnuX5jzzGnHYH3s7nuWSHw8mXX/ytfOTAwh
 7BP5uKOuyEUJ444kheUitcnlQv1BZ2A1+PjvznGX+kocQhrkafqFWwOycLDiNLsEITjx
 aoAUJF8wisURnMv7K76Jj0iyBM5kwmZggf+MSUaOgocczUyUal2mFjDr6O9urG3nTRzr
 KXKPE8dHuWTCcvqJr1L119QTxiB3sxi6MWnW1L+xWvYC/DWUncKo7i4kx1kh9H+Koo1v
 m7zEPJyd7oaZRwGI1NwOX40/5Trq+8rc8lmqeKCZC+cOMKYJelCoyBsu2IXCA51YU3+K
 uVag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KGThrPzLRl+xRmi/6a9GxsjI47f1pTYHFfas07Xrz9k=;
 b=CPWMGunif/cZ9R05UpG8e34zrj6beXrXJWcDGchXlBUngn3gsLwZG+WwWcLfMv8OST
 5d3hxNV6xCixl1JiUyAUe9MY6AvO4JYh9+07Y15k52YFtdVJFOL/J2IPo8xKl+WFxaKY
 gTWNdE/JryBd7/dG3jBHbR8XR3vUu47jIEPCrF5cyticMve2FJa5F6kCK5dlG1hwfxwd
 hvBkdAx1JLwMBAt8xI9rxHPJAZn3UpOxibE3vsMUWTFDf1ZUovdEaIhDJ7ZMk1sZSNYX
 bb74P88+NU5Tx8iJybklnniaknqespYt4gaSh71wgMVYcn10Qik+VqyHW6ZDzPynjxyW
 NUzw==
X-Gm-Message-State: AOAM533Gh2SVAL+eq5rIft+qrCyOcmQS1hlcysfFerAIDvMh+t/lAXrO
 7hUWIhQ8oxmPMjPn4UpS0H1VvqO/pIsTcE+G
X-Google-Smtp-Source: ABdhPJz4lmFapqMpC6ZjZkbxqJ/jQwb4vdbyneqEmB09K3w1fnyJdNGlLLDnWFWRd6HU1asgansaUg==
X-Received: by 2002:a1c:f708:: with SMTP id v8mr21734111wmh.25.1615739969757; 
 Sun, 14 Mar 2021 09:39:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j13sm15674166wrt.29.2021.03.14.09.39.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 09:39:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] include/ui/console.h: Delete is_surface_bgr()
Date: Sun, 14 Mar 2021 16:39:27 +0000
Message-Id: <20210314163927.1184-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The function is_surface_bgr() is no longer used anywhere,
so we can delete it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/ui/console.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/include/ui/console.h b/include/ui/console.h
index c960b7066cc..810ce7988c0 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -267,16 +267,6 @@ PixelFormat qemu_default_pixelformat(int bpp);
 DisplaySurface *qemu_create_displaysurface(int width, int height);
 void qemu_free_displaysurface(DisplaySurface *surface);
 
-static inline int is_surface_bgr(DisplaySurface *surface)
-{
-    if (PIXMAN_FORMAT_BPP(surface->format) == 32 &&
-        PIXMAN_FORMAT_TYPE(surface->format) == PIXMAN_TYPE_ABGR) {
-        return 1;
-    } else {
-        return 0;
-    }
-}
-
 static inline int is_buffer_shared(DisplaySurface *surface)
 {
     return !(surface->flags & QEMU_ALLOCATED_FLAG);
-- 
2.20.1


