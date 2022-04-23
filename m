Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E392B50CA53
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Apr 2022 15:03:22 +0200 (CEST)
Received: from localhost ([::1]:58718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niFQ2-0000lj-1H
	for lists+qemu-devel@lfdr.de; Sat, 23 Apr 2022 09:03:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niFFG-0006qA-L2
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 08:52:14 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:46919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niFFE-00054c-1u
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 08:52:13 -0400
Received: by mail-ej1-x62a.google.com with SMTP id t11so21109545eju.13
 for <qemu-devel@nongnu.org>; Sat, 23 Apr 2022 05:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iTOi8M+CKz+tteXqdlc9EtxfuKMXhzk+dpI+u7NWDEY=;
 b=P4UE6pmrwdaOS4UXSJd3K8XuXdgxMlY1mnMpmNdiJgxWE5W1/6BInja4LeMy7t/BYT
 KSC8nh2C4fCtTR7PMWnTNE5sUhkrTTukxO8KhZ0UUShzJzGNRFbD7Na8RiL2Xv+oczrY
 jBlKDgMTy2TKfSBvv3PexxFSLd5jY7bXkmYNCvjYbMyQLYuop15Cuj84julpVi+PweUu
 fq+AwirqJ/Pg4Bx/A0uJsOT+8dod5r02OALW++XYTajTcExbe0YmPOP/b/HSUUBvETde
 d01vnVDf/iUXfvqkjgebT4YfUQhrKKtI2BNEgWJa4YbANJMRNRQaUfa9mNBEQNRXPBMV
 3Ggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iTOi8M+CKz+tteXqdlc9EtxfuKMXhzk+dpI+u7NWDEY=;
 b=UIVsCU3k/FOr518VGiqrrq0sHsSgaOIEJRL53xRx8820HCovhzoVyjTdnBCqmXm1fI
 MPIr93x2qd9cCOpd5l9nvSBbbE3Xihmx7bsJwKIxy8VWBBtpZDrkjkDhOHPdotofXTBz
 JyPLZONdvRquGDHKjrRVc/c0+oFPzb2Pll+pz61+kJTASuLq0Ai3CZpUPULu+JcvEgbO
 Je91m0l0b21SmDLBTxWAPjQRZskt6kIdCDKA6T2qHnvcJfN4PaYD3ASIESIhRUpDUFNV
 D1BvKxft9YxulchdvE19yPcByGfZBfDuT31Wb9zFRhyBmS0VdSWEfw4wVZpFErWAEJfn
 Nzew==
X-Gm-Message-State: AOAM533qsoVmmJd2FU7UHCaiAcpr/XDKS1HxSFTqiQPf6wp1ZYXFMa/O
 q14/0CvYit6xgXIoHkj3OC//WZps06eV8w==
X-Google-Smtp-Source: ABdhPJzIbaOxpm5AzMTsdSiBhXifrqmze7OUzb4XeOipD3N8khORtQNaHmEZHmnbsyVoQWy0f5DD5g==
X-Received: by 2002:a17:906:1841:b0:6e8:872d:8999 with SMTP id
 w1-20020a170906184100b006e8872d8999mr8135164eje.492.1650718330669; 
 Sat, 23 Apr 2022 05:52:10 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 bo14-20020a170906d04e00b006ce98d9c3e3sm1655573ejb.194.2022.04.23.05.52.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 05:52:10 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/34] configure: move --enable/--disable-debug-info to
 second option parsing pass
Date: Sat, 23 Apr 2022 14:51:23 +0200
Message-Id: <20220423125151.27821-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220423125151.27821-1-pbonzini@redhat.com>
References: <20220423125151.27821-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marcandre.lureau@redhat.com, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

$debug_info is not needed anywhere except in the final meson invocation,
no need to special case it.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/configure b/configure
index e404b55da5..d704029284 100755
--- a/configure
+++ b/configure
@@ -244,7 +244,6 @@ audio_drv_list="default"
 block_drv_rw_whitelist=""
 block_drv_ro_whitelist=""
 host_cc="cc"
-debug_info="yes"
 lto="false"
 stack_protector=""
 safe_stack=""
@@ -304,6 +303,7 @@ vhost_user_fs="$default_feature"
 vhost_vdpa="$default_feature"
 rdma="$default_feature"
 pvrdma="$default_feature"
+debug_info="yes"
 debug_tcg="no"
 debug="no"
 sanitizers="no"
@@ -379,10 +379,6 @@ for opt do
   ;;
   --extra-ldflags=*) EXTRA_LDFLAGS="$EXTRA_LDFLAGS $optarg"
   ;;
-  --enable-debug-info) debug_info="yes"
-  ;;
-  --disable-debug-info) debug_info="no"
-  ;;
   --cross-cc-*[!a-zA-Z0-9_-]*=*) error_exit "Passed bad --cross-cc-FOO option"
   ;;
   --cross-cc-cflags-*) cc_arch=${opt#--cross-cc-cflags-}; cc_arch=${cc_arch%%=*}
@@ -759,12 +755,12 @@ for opt do
   ;;
   --extra-ldflags=*)
   ;;
-  --enable-debug-info)
-  ;;
-  --disable-debug-info)
-  ;;
   --cross-cc-*)
   ;;
+  --enable-debug-info) debug_info="yes"
+  ;;
+  --disable-debug-info) debug_info="no"
+  ;;
   --enable-modules)
       modules="yes"
   ;;
-- 
2.35.1



