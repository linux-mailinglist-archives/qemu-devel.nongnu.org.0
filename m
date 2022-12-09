Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6396481B2
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 12:29:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3bXJ-0005yE-Oc; Fri, 09 Dec 2022 06:27:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bVj-0004RG-Et
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:25:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bVM-0001Ip-4w
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:25:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670585117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ly9X8LRoyRD4u0/Mdbe+guE81+taxTsk3fckWLgpH9g=;
 b=fL74NOrQv7IeEpauIrZxwZUveRdFxznZeBhFn2F8J1eE6m1GE/Q8p2iFTxQYWmPg0Pum53
 L/5c0G2Cg7uxTbEJhUNRlWFpmUEf+Gu+KaspE5dupAr2PHP17XmiBKyngavqa8qnKwh6as
 5OM8o85OYB4z/de1Hrs3q5uH1fNGiF8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-465-Yg-LVdemMo-ZvnxhNZq24w-1; Fri, 09 Dec 2022 06:25:16 -0500
X-MC-Unique: Yg-LVdemMo-ZvnxhNZq24w-1
Received: by mail-ej1-f72.google.com with SMTP id
 nc4-20020a1709071c0400b0078a5ceb571bso2907111ejc.4
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 03:25:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ly9X8LRoyRD4u0/Mdbe+guE81+taxTsk3fckWLgpH9g=;
 b=76M+LpdYr9et4cX09Ta8T4ZyAcJxpBV9O5Xw7FIcyzPVlTCfw2rs9If36xZ5+5RSy3
 d/KNkbOFaRbQ3w27R3uGbAMmQlhf5SNfq+YwmbOUHHsGIDcmxlS1UN+uj7dJMZvRQ+OP
 T+PQR03hbUqIEmYpPfVVSPNmQD+pl9DWCXueYOw8R1JipmPx+/rP60Dk27GGyqPMsubF
 fk7qD2OfyTTssbocrBbdH67XZjvCzsbb64WqnogNR0wvd+uUfHUqdgmRbX8rxfPSSwpC
 s23WZeltS9Sz+KnuxADl2lQeI3UITaD2oJlonx6gNtaZan7vdGVmIBgT0oGE3b53oSc/
 GwHw==
X-Gm-Message-State: ANoB5pmvxx3Vg32UknX+8pd+2Wly74FYsDtP3A726sPjXNpR3PKYB4i5
 V22W0bGR8Z7NY1zrvdLKSpBs+0ppHWrl26DfbF8wWBxRGNzfyIOJceRvpTZd8zayrNxOoXaK+o4
 At0fS4hfdLnnINT4OGPrNLQQUpzcX7TZGk1cIGaIGxewPNMqpGVW5cUcEKaHTmzwtYXE=
X-Received: by 2002:a50:fb0a:0:b0:46a:878c:3325 with SMTP id
 d10-20020a50fb0a000000b0046a878c3325mr4757123edq.36.1670585114943; 
 Fri, 09 Dec 2022 03:25:14 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4lkuGTWyivoQVwwDPydsIFHgVUVdEMJCcwlCye64r2E9TcOasD9kFEdohPxYCEiNpdpDg6tQ==
X-Received: by 2002:a50:fb0a:0:b0:46a:878c:3325 with SMTP id
 d10-20020a50fb0a000000b0046a878c3325mr4757110edq.36.1670585114584; 
 Fri, 09 Dec 2022 03:25:14 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 p26-20020a17090628da00b0077205dd15basm453122ejd.66.2022.12.09.03.24.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Dec 2022 03:25:14 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/30] configure: remove pkg-config functions
Date: Fri,  9 Dec 2022 12:23:56 +0100
Message-Id: <20221209112409.184703-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209112409.184703-1-pbonzini@redhat.com>
References: <20221209112409.184703-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

All uses of pkg-config have been moved to Meson.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                   | 19 +++----------------
 docs/devel/build-system.rst |  4 ----
 2 files changed, 3 insertions(+), 20 deletions(-)

diff --git a/configure b/configure
index fb28dd3963bd..9c336203d8d9 100755
--- a/configure
+++ b/configure
@@ -365,11 +365,7 @@ smbd="$SMBD"
 strip="${STRIP-${cross_prefix}strip}"
 widl="${WIDL-${cross_prefix}widl}"
 windres="${WINDRES-${cross_prefix}windres}"
-pkg_config_exe="${PKG_CONFIG-${cross_prefix}pkg-config}"
-query_pkg_config() {
-    "${pkg_config_exe}" ${QEMU_PKG_CONFIG_FLAGS} "$@"
-}
-pkg_config=query_pkg_config
+pkg_config="${PKG_CONFIG-${cross_prefix}pkg-config}"
 sdl2_config="${SDL2_CONFIG-${cross_prefix}sdl2-config}"
 
 # default flags for all hosts
@@ -745,9 +741,7 @@ for opt do
   ;;
   --without-default-features) # processed above
   ;;
-  --static)
-    static="yes"
-    QEMU_PKG_CONFIG_FLAGS="--static $QEMU_PKG_CONFIG_FLAGS"
+  --static) static="yes"
   ;;
   --bindir=*) bindir="$optarg"
   ;;
@@ -1419,13 +1413,6 @@ EOF
   fi
 fi
 
-##########################################
-# pkg-config probe
-
-if ! has "$pkg_config_exe"; then
-  error_exit "pkg-config binary '$pkg_config_exe' not found"
-fi
-
 ##########################################
 # fdt probe
 
@@ -2423,7 +2410,7 @@ if test "$skip_meson" = no; then
   test -n "$objcc" && echo "objc = [$(meson_quote $objcc $CPU_CFLAGS)]" >> $cross
   echo "ar = [$(meson_quote $ar)]" >> $cross
   echo "nm = [$(meson_quote $nm)]" >> $cross
-  echo "pkgconfig = [$(meson_quote $pkg_config_exe)]" >> $cross
+  echo "pkgconfig = [$(meson_quote $pkg_config)]" >> $cross
   echo "ranlib = [$(meson_quote $ranlib)]" >> $cross
   if has $sdl2_config; then
     echo "sdl2-config = [$(meson_quote $sdl2_config)]" >> $cross
diff --git a/docs/devel/build-system.rst b/docs/devel/build-system.rst
index 9db18aff159e..66cfe7b8bdc8 100644
--- a/docs/devel/build-system.rst
+++ b/docs/devel/build-system.rst
@@ -103,10 +103,6 @@ developers in checking for system features:
    Print $MESSAGE to stderr, followed by $MORE... and then exit from the
    configure script with non-zero status
 
-``query_pkg_config $ARGS...``
-   Run pkg-config passing it $ARGS. If QEMU is doing a static build,
-   then --static will be automatically added to $ARGS
-
 
 Stage 2: Meson
 ==============
-- 
2.38.1


