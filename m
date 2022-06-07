Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EBA53FA54
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 11:51:28 +0200 (CEST)
Received: from localhost ([::1]:44724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyVrz-0000Cv-7F
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 05:51:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyVhd-0007sI-9j
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 05:40:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyVha-0008O0-T0
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 05:40:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654594842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MLkySldw1Fwx/a0cSG+JSGpAxxnVssoYm0VUyPtiXWE=;
 b=VIgsoQX+ev4DsqkmBj1R12hd0aVOhO7aqBYujrtI71aRzQdNTjMImpDPYD6CpYz8QNQ2qg
 2pnk31EGEBiJKe1hWNG4YkgM+b3/JWzY59lVkGt9gY3wzwahv8WWxwCl3AQDwa8tgq2IC7
 ViwMi6QgBVLaQY8b1Rgyw1x6yWXqa0Y=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-99-6wsGGP29Mey9xV8FUkcT3A-1; Tue, 07 Jun 2022 05:40:41 -0400
X-MC-Unique: 6wsGGP29Mey9xV8FUkcT3A-1
Received: by mail-wm1-f72.google.com with SMTP id
 p24-20020a05600c1d9800b0039c51c2da19so1513735wms.0
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 02:40:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MLkySldw1Fwx/a0cSG+JSGpAxxnVssoYm0VUyPtiXWE=;
 b=I0qfsD3koVY6X+6J3jzLnSXAskNp660O/6eCDfZ/xJUad34iMnYTYyJHRuk+MzOGQF
 q0ZJuJpRSJddHABOipA8fb1ZrqyOeIHQjaajiHuLQaTObcUxn/I6glbqs/psb8bF4M9O
 wpdFhOrI1nKJj9rCPEVleOcjyef4moWT8VHybPO/BjBKX7dI/l6seMeqVDW82EVRXpW9
 NLJaiJc2w8b4cChLqo9FTFRmaDTuZYcneN7jiIUSu8frLPrgrllTfOacPpm4N8MxR4Tu
 El9WjYYG/IM5zp35ZmTzSQaGQw3cIw8lQRWA2TFDYgFkOOXWCnj2mLkNAvofbEVa3lfS
 wAJA==
X-Gm-Message-State: AOAM53088zuiReBLCug63611/ZBWU9T06PtJka9gvfZQt/m8S2tkjDqf
 ZBVyDume2TfK+3zJeXnajJP4NPXOWUDzBywRvq6LL6k23QQIMiYY2M4rnehsOdFw4G8jTogpPl2
 3PmsioksUSv+nu59hqsV1XXZwOjhVxobq3khHjDpB7bcYk9f3hn6J6Gjr2IH0kAQXmuA=
X-Received: by 2002:a5d:6c64:0:b0:20f:f413:8af8 with SMTP id
 r4-20020a5d6c64000000b0020ff4138af8mr26258786wrz.129.1654594839903; 
 Tue, 07 Jun 2022 02:40:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHn+IyUXCpJNwLaUwTOFB2LwMJp2qPVvKCQLY4UJuVG1YSaClZUfixcloYLBLdHO1H91555g==
X-Received: by 2002:a5d:6c64:0:b0:20f:f413:8af8 with SMTP id
 r4-20020a5d6c64000000b0020ff4138af8mr26258769wrz.129.1654594839669; 
 Tue, 07 Jun 2022 02:40:39 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 h1-20020a05600c414100b0039c5cecf206sm181059wmm.4.2022.06.07.02.40.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 02:40:38 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	richard.henderson@linaro.org
Subject: [PATCH 3/7] configure: allow more host/target combos to use the host
 compiler
Date: Tue,  7 Jun 2022 11:40:27 +0200
Message-Id: <20220607094031.1227714-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220607094031.1227714-1-pbonzini@redhat.com>
References: <20220607094031.1227714-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Do not require a cross-compiler prefix for e.g. i386 on x86_64, or
big endian on little endian.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 34 +++++++++++++++++++++-------------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/configure b/configure
index b1aa97e470..28f8c6188b 100755
--- a/configure
+++ b/configure
@@ -2058,19 +2058,27 @@ probe_target_compiler() {
   compute_target_variable $1 target_objcopy objcopy
   compute_target_variable $1 target_ranlib ranlib
   compute_target_variable $1 target_strip strip
-  if test "$1" = $cpu; then
-    : ${target_cc:=$cc}
-    : ${target_ccas:=$ccas}
-    : ${target_as:=$as}
-    : ${target_ld:=$ld}
-    : ${target_ar:=$ar}
-    : ${target_as:=$as}
-    : ${target_ld:=$ld}
-    : ${target_nm:=$nm}
-    : ${target_objcopy:=$objcopy}
-    : ${target_ranlib:=$ranlib}
-    : ${target_strip:=$strip}
-  fi
+  case "$1:$cpu" in
+    aarch64:aarch64_be | aarch64_be:aarch64 | \
+    arm:armeb | armeb:arm | \
+    i386:x86_64 | \
+    ppc:ppc64* | \
+    ppc64*:ppc64* | \
+    sparc:sparc64 | \
+    "$cpu:$cpu")
+      : ${target_cc:=$cc}
+      : ${target_ccas:=$ccas}
+      : ${target_as:=$as}
+      : ${target_ld:=$ld}
+      : ${target_ar:=$ar}
+      : ${target_as:=$as}
+      : ${target_ld:=$ld}
+      : ${target_nm:=$nm}
+      : ${target_objcopy:=$objcopy}
+      : ${target_ranlib:=$ranlib}
+      : ${target_strip:=$strip}
+      ;;
+  esac
   if test -n "$target_cc"; then
     case $1 in
       i386|x86_64)
-- 
2.36.1



