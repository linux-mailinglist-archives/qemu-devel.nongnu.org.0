Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAAA512CDD
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 09:30:59 +0200 (CEST)
Received: from localhost ([::1]:40534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njyc6-0007aj-Ha
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 03:30:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njy27-0000Lw-KC
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 02:53:47 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:36611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njy26-00056E-2K
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 02:53:47 -0400
Received: by mail-ej1-x635.google.com with SMTP id k23so7629208ejd.3
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 23:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iTOi8M+CKz+tteXqdlc9EtxfuKMXhzk+dpI+u7NWDEY=;
 b=l+jzYZUn73LLbir+yXOcJlHYms4THvVKWihGSvDKkbvzmDWLceoSnGhqoYcmnkCBz2
 WRdUInsnDnJHiO2vfI0jI/c6NaNhWIKUFmFObyrV7yBg5bBxmgmxsNn9d4WnWb8FtYuk
 ZmtqFmsX5moEGjzB26HGNUvx8kCRKn/JAzmIHGsNB38DDKN3txndZte9qKp4hfI10rXF
 IMksm9UbKDZEoHwZYXdlNtiL4viUOlyh4SVRikHoXL0gwaeXw9nlwpT7toKR8qTnVKGi
 SKhNJx9ZKt8o79Ka5+9ocgWYqxVoLH2FlOeOfdLWWl01sQ/CBH1NNlJieGKGPlRVDE1T
 rYqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iTOi8M+CKz+tteXqdlc9EtxfuKMXhzk+dpI+u7NWDEY=;
 b=zQNk43DYp2LH/AK6csUvnBSsO6+ZqFFzOarbxmXQL4JpeUPqFuePzL+jdAQTiGbm8w
 eMChowQSseKbCnxjsolpKWFouYoUViiZZJsHHtHx8mY7cFXn/0cOKdMx4QkqrasHuKgi
 TcUmN5BKFkj+2fC+PZWM2f9ZZUgxx0OlxWWYiFzRZpOnqh5qS4upSJJgIrb02l22NftZ
 xHdTya/Um5h68rSgwTpn2xf9xKPCJDjtAsYNNq/1QzqSRUME0NTlyogBYM58JyfCmPEW
 FvCe05UfrYwNB/FaXPVvsVjzyApEJMlL1E37+NAq+7iDDS1z6Teqk3uqYt4GZ4nep5XG
 NNMA==
X-Gm-Message-State: AOAM531p5W0B6qh20aB/JnHYHtSrY7a3pIzQRPMv/94ghqgj2h0hDftf
 xbIf2dmv4nRTuFq+pL/ERZcm0/iSVTXM/g==
X-Google-Smtp-Source: ABdhPJxxUtMJvhdl58vrL6Tcassxu9COiBoDqsy6DtBIGwrDE22uHkvnH0JcXjNZrDqtNzT7GQYnoQ==
X-Received: by 2002:a17:907:d15:b0:6f3:bd8c:b436 with SMTP id
 gn21-20020a1709070d1500b006f3bd8cb436mr9640158ejc.618.1651128824776; 
 Wed, 27 Apr 2022 23:53:44 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 jo11-20020a170906f6cb00b006f3955761c4sm5406804ejb.158.2022.04.27.23.53.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 23:53:44 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/18] configure: move --enable/--disable-debug-info to second
 option parsing pass
Date: Thu, 28 Apr 2022 08:53:27 +0200
Message-Id: <20220428065335.189795-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428065335.189795-1-pbonzini@redhat.com>
References: <20220428065335.189795-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x635.google.com
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>
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



