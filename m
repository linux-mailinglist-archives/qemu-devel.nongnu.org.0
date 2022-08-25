Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A3B5A1C7F
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 00:38:48 +0200 (CEST)
Received: from localhost ([::1]:36930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRLUt-0002JK-Js
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 18:38:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRLKV-0002CP-Ni
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:28:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRLKS-0004Xx-Qd
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:28:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661466480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hN2Gzr9MjiGvsphHAleaVqia6e5BAud6OSP1rPmeGqs=;
 b=eDyjUJJtfn7d6XaYnVPJiAFi6NZu1vixvouVtOyMrsUmiOdbZSmh6n39ROCvo3dZfE8t1M
 Ajb4wOoJDKIeXM87JxcKGXGDHxHBko/jOuvgCgcsm6E/zTLWmZH7TMMHSo41xOM3qTbDJ7
 +RZ0dMtjgtYf5aiI63VKNRfdmDLQ0yg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-163-9BSkZ70_NsCDqzj8JjZPpg-1; Thu, 25 Aug 2022 18:27:58 -0400
X-MC-Unique: 9BSkZ70_NsCDqzj8JjZPpg-1
Received: by mail-wr1-f71.google.com with SMTP id
 c22-20020adfa316000000b0022574c2dc1aso1088131wrb.2
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 15:27:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=hN2Gzr9MjiGvsphHAleaVqia6e5BAud6OSP1rPmeGqs=;
 b=Uo4jK+3e5t4WonaETo5ApZ5RNIwaw7ThxXmsKYUkAxAUEw1SQ389c02mjTa4Jl+240
 bpTAr+0KGGqIN50A3SHWckSbJU9mqTvRzl9DIarOCwb7DiQVVjrUW1LyU6jkyhZR+l20
 wvXV5NciXoRxYDq1gOD88kOhrVYOOKxdsJ6Bimy4CVhoFS3V293mVJwEv7mz6DFqlLnJ
 WPZGXlpBnn7tb3RHb/v/+aKySZd4mpCRrMqwcXIJDN0EeaMIz4oUF/+QTfxYvsvc04nG
 fBiUDYF0IDDbvVYc1kxgbwIBtWWhC2lKGTrZproSU2sRczVvUelSV0cJW4q2JtzrLNrW
 dPNw==
X-Gm-Message-State: ACgBeo0a321IryqiGb5nRH0wAe5WsyY/rMSPyGYuE/An5+Jxyk2GohoV
 FtIPQgpO1IOroZ3tbPfOuCtCs/Ft0xtPTd90TGSYvUsy2nBmAu03dbrGOjOpEw3rrYSUcl9nSRI
 RSNsgtMMM0qsVHuySwnINt2ov5KPzgHFq/SvZPomjTF7UN6kynUV/JZ3ax8LyEGCGjPc=
X-Received: by 2002:a05:6000:2a4:b0:225:2fbb:6843 with SMTP id
 l4-20020a05600002a400b002252fbb6843mr3568698wry.71.1661466477232; 
 Thu, 25 Aug 2022 15:27:57 -0700 (PDT)
X-Google-Smtp-Source: AA6agR59pptCfHPuWzx5IOIufLCCCB2mW84wP6U4h/b0+ftS83OfA8oRhPpDMxPQOxFmNTTsNolXqA==
X-Received: by 2002:a05:6000:2a4:b0:225:2fbb:6843 with SMTP id
 l4-20020a05600002a400b002252fbb6843mr3568690wry.71.1661466476932; 
 Thu, 25 Aug 2022 15:27:56 -0700 (PDT)
Received: from goa-sendmail ([93.56.160.208]) by smtp.gmail.com with ESMTPSA id
 a7-20020adffac7000000b002253d162491sm340682wrs.52.2022.08.25.15.27.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 15:27:56 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH 07/20] configure: store container engine in config-host.mak
Date: Fri, 26 Aug 2022 00:27:32 +0200
Message-Id: <20220825222745.38779-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220825222745.38779-1-pbonzini@redhat.com>
References: <20220825222745.38779-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

In preparation for removing $(DOCKER_SCRIPT) from the tests/tcg configuration
files, have Make use the same container engine that had been probed at
configure time.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                     | 11 ++++++++---
 tests/docker/Makefile.include |  2 +-
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/configure b/configure
index 6f15f3c687..ed18a17013 100755
--- a/configure
+++ b/configure
@@ -1843,9 +1843,11 @@ esac
 
 container="no"
 if test $use_containers = "yes"; then
-    if has "docker" || has "podman"; then
-        container=$($python $source_path/tests/docker/docker.py probe)
-    fi
+    case $($python $source_path/tests/docker/docker.py probe) in
+        *docker) container=docker ;;
+        podman) container=podman ;;
+        no) container=no ;;
+    esac
 fi
 
 # cross compilers defaults, can be overridden with --cross-cc-ARCH
@@ -2476,6 +2478,9 @@ if test -n "$gdb_bin"; then
     fi
 fi
 
+if test "$container" != no; then
+    echo "ENGINE=$container" >> $config_host_mak
+fi
 echo "ROMS=$roms" >> $config_host_mak
 echo "MAKE=$make" >> $config_host_mak
 echo "PYTHON=$python" >> $config_host_mak
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 9a45e8890b..c5cfdda04d 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -14,7 +14,7 @@ DOCKER_DEFAULT_REGISTRY := registry.gitlab.com/qemu-project/qemu
 endif
 DOCKER_REGISTRY := $(if $(REGISTRY),$(REGISTRY),$(DOCKER_DEFAULT_REGISTRY))
 
-ENGINE := auto
+ENGINE ?= auto
 DOCKER_SCRIPT=$(SRC_PATH)/tests/docker/docker.py --engine $(ENGINE)
 
 CUR_TIME := $(shell date +%Y-%m-%d-%H.%M.%S.$$$$)
-- 
2.37.1



