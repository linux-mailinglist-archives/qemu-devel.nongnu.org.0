Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A87D3BC946
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:14:48 +0200 (CEST)
Received: from localhost ([::1]:35036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0i6I-0003CB-5h
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:14:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0htu-0000tZ-1c
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:01:58 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:42568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0htq-0002Ib-Q5
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:01:57 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 j16-20020a05600c1c10b0290204b096b0caso1830498wms.1
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 03:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eFGWHXQQb5do0DsUHv5riPRy9GmZyZQ5jxNxpkR/NPI=;
 b=FxMPVTAaBf/BHnrhRwiRC9fjHexBUDOXduoCcztMfa0LrKijH9c0Ip3GHCFLXiloqm
 G6qfRNikY2+pucSp5ljXYNxTqVpgmKb4n/EuiVIrkEYPmYDsiLiwfqcV0WSSekP1NqVQ
 6TpkK9E6gTCg2NYEdb50QKp6QIkYHu3iWKm1Kbl32QwGL6bW4L7RQDbw/zuFHeCkEkgv
 LbkG13t9sewU2CYx3w6DKFv0weQymX2UDOc931FNnKHqRnA3BsSEs9WGd7FvUqXUFQzO
 O51mFtlhhlTshZ04ir2mdyM7axQscTXnF4FS1cD1gJLkmj+2wFUOsW9vh4vLBEsGUajN
 Igbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=eFGWHXQQb5do0DsUHv5riPRy9GmZyZQ5jxNxpkR/NPI=;
 b=FT/ippwGWm3DNbx8gLj4QpHysMzMM076jP4CrNBuAQhRcrsfBxTi+oQIsF4TMCSdl+
 JMvD39aYRq4Uh3zVt0AHjBiV/OnlEeQk7KxOsOZQh9QF67uqmQ1wOsIIdYYS2q4oWRZI
 C9O0pyVhgZ/lux+k6mke1TtadguBBk1+IygBBEptJHPTFNPXiDP3NBAPwZunsUq9tzlf
 uC+pbHx31VYAguqHDev75t7dQo4PBqlle9m0xScloRGuEOWKr97vpZK2l8gXXF/O8Gk4
 XLg0I8dWPGIlG90w8JGPTLz/67i9If3jnHc6CBaniTN3PbKCgfjXOeUvwq1/UGlqPR9a
 2rMQ==
X-Gm-Message-State: AOAM532Kd+vA+KWaUnEpH7uDNA0M8aXj/u/eijcPgf88BgPSWcbMhMAd
 4gV2nHVBLvpJjqHwWyrYSMyMKj9ewDo=
X-Google-Smtp-Source: ABdhPJx2dsNvJ7GAlC6rdhzZQA2oyZVEJbQxRqXaQRYuYU5hfs6FAvR/Id5ZG1sKRClY29WoqDMmrA==
X-Received: by 2002:a1c:cc02:: with SMTP id h2mr19164827wmb.39.1625565713193; 
 Tue, 06 Jul 2021 03:01:53 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v15sm2331268wmj.39.2021.07.06.03.01.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 03:01:52 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/40] configure: drop vte-2.90 check
Date: Tue,  6 Jul 2021 12:01:17 +0200
Message-Id: <20210706100141.303960-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210706100141.303960-1-pbonzini@redhat.com>
References: <20210706100141.303960-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All currently supported distros have vte 0.37 or newer, which is where the
ABI changed from 2.90 to 2.91.  So drop support for the older ABI.

Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/configure b/configure
index e799d908a3..27841f82ed 100755
--- a/configure
+++ b/configure
@@ -2803,19 +2803,13 @@ fi
 # VTE probe
 
 if test "$vte" != "no"; then
-    vteminversion="0.32.0"
     if $pkg_config --exists "vte-2.91"; then
-      vtepackage="vte-2.91"
-    else
-      vtepackage="vte-2.90"
-    fi
-    if $pkg_config --exists "$vtepackage >= $vteminversion"; then
-        vte_cflags=$($pkg_config --cflags $vtepackage)
-        vte_libs=$($pkg_config --libs $vtepackage)
-        vteversion=$($pkg_config --modversion $vtepackage)
+        vte_cflags=$($pkg_config --cflags vte-2.91)
+        vte_libs=$($pkg_config --libs vte-2.91)
+        vteversion=$($pkg_config --modversion vte-2.91)
         vte="yes"
     elif test "$vte" = "yes"; then
-        feature_not_found "vte" "Install libvte-2.90/2.91 devel"
+        feature_not_found "vte" "Install libvte-2.91 devel"
     else
         vte="no"
     fi
-- 
2.31.1



