Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BF639F4EF
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 13:28:20 +0200 (CEST)
Received: from localhost ([::1]:42698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqZu7-0006Dg-A5
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 07:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqZp7-0006Ou-6R
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:23:09 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:37838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqZp5-0007wB-N9
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:23:09 -0400
Received: by mail-wr1-x429.google.com with SMTP id i94so16113966wri.4
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 04:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=01Gg1F/bxBALFY9w4TKfEUQZREi5Et2k+0kmsX/kvio=;
 b=YXjRUoeUYfn94Ojjx4N3Pn6ovI/rmOe7dVTSAqoiLakDiOXRcxHRxyfEXkzRTimsXR
 JGhyPKZYnoKZEaLBOOYyycPkeINagipvLoBxb7XF1j7myq3zX9WGJEIdIwQ9giP0mrRY
 9QhKZaK246hEAdWcoizzHpjIWVxq3Q3wOEGBrueSvNPypGd0Kq7GL5IYBHLs3cyuvnkq
 Yg7DPyR4nL5osyzGK9uz/lzhBYdcj1ngtFI/IIuzUwHST+YW1IKBdbqU/eTMGdaDEe8O
 tsKhgvbdS5bh5KEOaqyaj64t5vPDIAZqZU4ZvEgP213yIRIkY5CUzRkJbzTUvCKQ0g6G
 DUpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=01Gg1F/bxBALFY9w4TKfEUQZREi5Et2k+0kmsX/kvio=;
 b=SvHWJXGK6TKbPjmAbhxXaUQqTep4XDPWLLc03rWnueyiZHe+6RxSFwCIQQdtB+gRGL
 we2qsSGC87DaG3wCQWX70x2aEAo2HNP2m0xnO8a8UrdqgI9vdcZyX3bNt+feGtPW/UCU
 7CjQwkT6darWmWmjqLGL4IbQFSmaPX4SAYFX3lwJDGo2o7qq4sRG/JUuhYsAUBrVYwj+
 UIH/JcxpRX6rVdb5F99kgznQ86JE349QBoZQgPPeKhhvsVn3sUEAcHNdNcIapb/dyrc3
 iGlbvOAzstBf0gmWUdJQMQwnIMsk9uJcRNn1GJlTu95MZczbfC9dLq2w/mRu6FpRA1ne
 mmMw==
X-Gm-Message-State: AOAM533Nw/OmtcgMg+vflWljK/s6BS2To8FTvnrTXRK4IvnjFwa8nZep
 vS0zlryGXCWtTzFJrymIyDi3t7mogwDBWw==
X-Google-Smtp-Source: ABdhPJwlIDV3qXXXcC/BK8uLPhuoj8sZwRYt7rrd4Mc/xvW4h+ZgHDmUukRHn1TnZP+wKoJ1gu4vGw==
X-Received: by 2002:adf:c54b:: with SMTP id s11mr22399214wrf.349.1623151384676; 
 Tue, 08 Jun 2021 04:23:04 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id i9sm15388621wrn.54.2021.06.08.04.23.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 04:23:04 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/26] configure: drop unused variables for xts
Date: Tue,  8 Jun 2021 13:22:37 +0200
Message-Id: <20210608112301.402434-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608112301.402434-1-pbonzini@redhat.com>
References: <20210608112301.402434-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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

All XTS configuration uses qemu_private_xts.  Drop other variables as
they have only ever been used to generate the summary (which has since
been moved to meson.build).

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/configure b/configure
index 8dcb9965b2..44c413e9b8 100755
--- a/configure
+++ b/configure
@@ -406,9 +406,7 @@ gtk="auto"
 tls_priority="NORMAL"
 gnutls="$default_feature"
 nettle="$default_feature"
-nettle_xts="no"
 gcrypt="$default_feature"
-gcrypt_xts="no"
 qemu_private_xts="yes"
 auth_pam="$default_feature"
 vte="$default_feature"
@@ -2897,7 +2895,6 @@ int main(void) {
 }
 EOF
         if compile_prog "$nettle_cflags" "$nettle_libs" ; then
-            nettle_xts=yes
             qemu_private_xts=no
         fi
     fi
@@ -2938,7 +2935,6 @@ int main(void) {
 }
 EOF
         if compile_prog "$gcrypt_cflags" "$gcrypt_libs" ; then
-            gcrypt_xts=yes
             qemu_private_xts=no
         fi
     elif test "$gcrypt" = "yes"; then
-- 
2.31.1



