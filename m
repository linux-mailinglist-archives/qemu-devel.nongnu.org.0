Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AC8425414
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 15:28:08 +0200 (CEST)
Received: from localhost ([::1]:46102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYTRP-0003jb-6V
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 09:28:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mYT8e-0005Vk-Ed
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:08:45 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:42548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mYT8d-0007rc-08
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:08:44 -0400
Received: by mail-ed1-x532.google.com with SMTP id t16so1026487eds.9
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 06:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MT5GrftFAuFEgPwZZwpW9ZA2E2bYpX/rHXx+os81sBY=;
 b=KG7ZwPFreUqOPiIpxV6fpW1eq8azgNuNyz8uhVhJFisOhCtBTblvj6sDocLiZA9NIl
 EfF3Z5YmP+KszwpGP7ggEVUZmOJhfDOwdyQbha3ZPLqBxBWNwiVDxg1VkV55gj1JypTD
 Uz8Tm0uAB21v+DC0jzPYyMxkymWmxFFnHdM2Uc5XNxsYd57IiHwJPj27fClNKkkEOJEb
 qg7/JS9Nd41o42xg2XhFlrzWwmfd7p4CowBisGb2kNNX/lIbvXpJBMv2WB9wELwk3a/I
 Jx+N9UMgCqxNPcHDL7KNDmhvCr/jhd+fDY57EkEE5VmyWLfx68X3mwcKiGCDglSwWJ4e
 dRFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=MT5GrftFAuFEgPwZZwpW9ZA2E2bYpX/rHXx+os81sBY=;
 b=ZGIGyzg+CopV3Et3L8uDqC7dcZiPOq1cZmkMWMaq/PkB+QcKDbs5G0iY9RLdSGqHg6
 6tO4YJl3lwNxJqLmf8A6utkZM0p8iQrN+d5UXi4p4NANb7Kn9YtrLkmlqJo1qFwfWbrK
 rMD2/g3d+4EglmdRwFbgy/croLu37A0v4SWPxf32dFBKs/c+zeXQyGt9oOahq00rPcYy
 teS6o+z9fIXAtV7UP9CSAStBm11wvsGepDs5FlK7SAHhSStRGogLCwzjX8T9Ad/VfQQY
 JCbHOJjT3C8THsXO6324rhKkI/ISUBC9U2xTwDxzP6YF5UaG96ALTFq+BIDfZ0xagPht
 shtA==
X-Gm-Message-State: AOAM530EgyIpAJL0Hp59lNDL/GvFDU1fqeVJf0Hi5EqiglSWlgJjqEk0
 XqIQdRvayV03xAvQ83rdzFini2gNUkI=
X-Google-Smtp-Source: ABdhPJwG/FoqCdHamMRab3fOMA3TAEWTd+EQt2l0u1EU8rmgkc6XHkmGX3nWSKjd13KTMia795/GyA==
X-Received: by 2002:a17:907:76e1:: with SMTP id
 kg1mr5644341ejc.329.1633612121567; 
 Thu, 07 Oct 2021 06:08:41 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o12sm791254edw.84.2021.10.07.06.08.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 06:08:41 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 22/24] configure: accept "internal" for
 --enable-capstone/slirp/fdt
Date: Thu,  7 Oct 2021 15:08:27 +0200
Message-Id: <20211007130829.632254-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007130630.632028-1-pbonzini@redhat.com>
References: <20211007130630.632028-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Options such as "--enable-capstone=git" do not make much sense when building
from a tarball.  Accept "internal" for consistency with the meson options.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index d00ba0cbd2..d2f754d5d1 100755
--- a/configure
+++ b/configure
@@ -1019,7 +1019,7 @@ for opt do
   ;;
   --enable-slirp=git) slirp="internal"
   ;;
-  --enable-slirp=system) slirp="system"
+  --enable-slirp=*) slirp="$optarg"
   ;;
   --disable-vde) vde="disabled"
   ;;
@@ -1193,7 +1193,7 @@ for opt do
   ;;
   --enable-fdt=git) fdt="internal"
   ;;
-  --enable-fdt=system) fdt="system"
+  --enable-fdt=*) fdt="$optarg"
   ;;
   --disable-linux-aio) linux_aio="disabled"
   ;;
@@ -1479,7 +1479,7 @@ for opt do
   ;;
   --enable-capstone=git) capstone="internal"
   ;;
-  --enable-capstone=system) capstone="system"
+  --enable-capstone=*) capstone="$optarg"
   ;;
   --with-git=*) git="$optarg"
   ;;
-- 
2.31.1



