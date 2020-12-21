Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2082DFD3E
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 16:08:34 +0100 (CET)
Received: from localhost ([::1]:46258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krMnZ-0007Re-3R
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 10:08:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMRD-0004rR-52
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:31 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:41806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMR9-0007nf-0P
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:26 -0500
Received: by mail-wr1-x433.google.com with SMTP id a12so11304823wrv.8
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 06:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6WMpKqBPeuGJHcvKl3raY8sepKGy3ANI9y/5By+JLWc=;
 b=J9Zm8QGvNo+7ybi9Q0XEpI+3o44UjLQ7/8QobIsU6g5/no/TrUQnGuSc2LDk7OV0HB
 kkmMGoCwJO/jJq4nZostIRg4BLN1JpB+Jv858GqAVY/iapam/7f86duu8UFuLQJQoZoA
 otiuMFcwG04ccM9/V+iAyEaNDRZHdHmUoO5IE6GLKlG0f5FwF1dYDR7gqnxxowyIX66x
 YFd4wVZHaguPM6k//w5hDivx/CyaSks+5Bb6PKbamU0ni0Yy+1oJUBDFP64T6mhVY/qq
 Q6/W+kBWe9nNjgAXkc4dZqHGWl98xHeMPX8OobZObecziAjUvI/9aGpjLzfDVVk1TCNq
 cqxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6WMpKqBPeuGJHcvKl3raY8sepKGy3ANI9y/5By+JLWc=;
 b=E8qpC8sE2bmXadFcFeS/bXIljwMc/2GAGT32au0OulhGzFo52s3XAZ2EpM0q8rVZuv
 qk0cHnLkoGr3axVGS9ZT5k1KjkuwX2zL6Qd0S0x2y32AhWezunEVBjd0f4edRRqfJFFz
 83/tuy+ob3i1wiA/AgoB73SAphmBUq2RT+FuM0kn8uYAS3zkISmouGn2ycnN6yJE+5pl
 EOJTWEckGbYFqSGHOpgYClMl9+SpsdXGOHEsmgktL/Eseda6FSz12NLrWtLh/plmsyUh
 vWfJSYf2ts+dGRtW8OPGvz1wHmPBxTS2hVcmmDLhh06Qgpd9jpHo8/gNXE5h87121+mA
 taeQ==
X-Gm-Message-State: AOAM532GNdlc2zjZ3bTsQTdCoTMneF6lR0v0AinksbQSs9D4CNFiPriE
 WhZejf+g/xpkh/yCLpQyJOLhJaa4RI8=
X-Google-Smtp-Source: ABdhPJw59zoQwQzdWTxbYBveuCK3aeNKJucgQJv5jQqq9J6Gr4yWJLOAdruze7zyaYPXtTrjZ+P7Fg==
X-Received: by 2002:adf:c64f:: with SMTP id u15mr17134922wrg.270.1608561920641; 
 Mon, 21 Dec 2020 06:45:20 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l5sm27439627wrv.44.2020.12.21.06.45.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 06:45:20 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 35/55] configure: remove CONFIG_FILEVERSION and
 CONFIG_PRODUCTVERSION
Date: Mon, 21 Dec 2020 15:44:27 +0100
Message-Id: <20201221144447.26161-36-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221144447.26161-1-pbonzini@redhat.com>
References: <20201221144447.26161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x433.google.com
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

version.rc can just use existing preprocessor symbols.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure  | 9 ---------
 version.rc | 4 ++--
 2 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/configure b/configure
index 16b609a984..61ae342a58 100755
--- a/configure
+++ b/configure
@@ -5927,15 +5927,6 @@ if test "$bigendian" = "yes" ; then
 fi
 if test "$mingw32" = "yes" ; then
   echo "CONFIG_WIN32=y" >> $config_host_mak
-  rc_version=$(cat $source_path/VERSION)
-  version_major=${rc_version%%.*}
-  rc_version=${rc_version#*.}
-  version_minor=${rc_version%%.*}
-  rc_version=${rc_version#*.}
-  version_subminor=${rc_version%%.*}
-  version_micro=0
-  echo "CONFIG_FILEVERSION=$version_major,$version_minor,$version_subminor,$version_micro" >> $config_host_mak
-  echo "CONFIG_PRODUCTVERSION=$version_major,$version_minor,$version_subminor,$version_micro" >> $config_host_mak
   if test "$guest_agent_with_vss" = "yes" ; then
     echo "CONFIG_QGA_VSS=y" >> $config_host_mak
     echo "QGA_VSS_PROVIDER=$qga_vss_provider" >> $config_host_mak
diff --git a/version.rc b/version.rc
index d8e1569991..0daadbf981 100644
--- a/version.rc
+++ b/version.rc
@@ -2,8 +2,8 @@
 #include "config-host.h"
 
 VS_VERSION_INFO VERSIONINFO
-FILEVERSION CONFIG_FILEVERSION
-PRODUCTVERSION CONFIG_PRODUCTVERSION
+FILEVERSION QEMU_VERSION_MAJOR,QEMU_VERSION_MINOR,QEMU_VERSION_MICRO,0
+PRODUCTVERSION QEMU_VERSION_MAJOR,QEMU_VERSION_MINOR,QEMU_VERSION_MICRO,0
 FILEFLAGSMASK VS_FFI_FILEFLAGSMASK
 FILEOS VOS_NT_WINDOWS32
 FILETYPE VFT_APP
-- 
2.29.2



