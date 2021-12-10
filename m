Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC3646FDC1
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 10:29:52 +0100 (CET)
Received: from localhost ([::1]:60708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvcDv-00064Z-CM
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 04:29:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mvbYr-00055h-UN
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 03:47:29 -0500
Received: from [2a00:1450:4864:20::534] (port=33474
 helo=mail-ed1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mvbYo-0000jp-PQ
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 03:47:24 -0500
Received: by mail-ed1-x534.google.com with SMTP id t5so27245091edd.0
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 00:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=efR+euqp1TfYQWL3xVKZMvdNbeMwI7/EvU88T1y9UZs=;
 b=Y8pqVI4v1LEr80NzGmHdw+Mue/RnCvTIJgRAk2BgBzLGMIgMLDGio/bk2r36B2pKfv
 0Tvt+I5fjcjfsNNJxBXQPfgl2ig8mRnqgs+zlzgkAKRiSPUii1PdxJjSYlV9elo4AlTF
 xmfrwfZV0xBrmTyHvq5rb51S+PDBHhw1+I5NIdQUCrsvHNCUKJ4kM78va8G1LCYCpL4G
 Jgz+zItyXQapA7MsE0FOejZo/eOhxbI06SgnsDGHgnIPJOhr0p8JSrxiE21jkxgYIihT
 MBfBneZSMCOeggNU75exOe8EvMPxmW6VUABccpkt67MdZ/LkZSHnHrAoLY813aZHIKHA
 sEWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=efR+euqp1TfYQWL3xVKZMvdNbeMwI7/EvU88T1y9UZs=;
 b=KafFkaoZeH+7U71C3U4aC6uksyIX8YfyaaZPUhDpLtHYVtjvyHsg2AyV8MHJn6MkT6
 gHpMc/7SS1nAMk6QRvS5vY4GYOiXWTZvBX8N5MN9NfWQhelwDA7gjiH/C1bgfv1JZtiJ
 VYkVbJqjD9W84cVfZUcRCHD8fWFvapJqzIvC91lnX12gHsgVE3cKWVmzT9r9r641oGkx
 OePQPNwcTJ6HYROOGE633MSBz9IoNEBJpfD9nlSXFo4XubarXdsttZzBzXcxChITW6m2
 7ehxIPH97CHz2s5JiSty5iYj1sr+ZD5dt3Yq7h9cDljSTOHgE++TuDvKv5X7qmB6eys8
 VNWg==
X-Gm-Message-State: AOAM533GZG3qlpEOO/ZJIz9ka9F94xruwSGVE7p7ZVu2rR1uSKXty03e
 tb0cSdLonIdHzYfoKIUT0zc0ewEJUUI=
X-Google-Smtp-Source: ABdhPJz7oPkkT0OKzJe+2xuGO7kB4F8D0dEHzych1TGo4V6iFbje+stDz5CAqcJctEwzSW2GkIeTdg==
X-Received: by 2002:a50:ce4a:: with SMTP id k10mr37272875edj.31.1639126041192; 
 Fri, 10 Dec 2021 00:47:21 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id e12sm1040829ejs.86.2021.12.10.00.47.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 00:47:20 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] configure: remove dead variables
Date: Fri, 10 Dec 2021 09:47:18 +0100
Message-Id: <20211210084718.24758-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::534
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/configure b/configure
index 48c21775f3..d3aac031a5 100755
--- a/configure
+++ b/configure
@@ -626,7 +626,6 @@ fi
 case $targetos in
 MINGW32*)
   mingw32="yes"
-  supported_os="yes"
   plugins="no"
   pie="no"
 ;;
@@ -668,7 +667,6 @@ SunOS)
   QEMU_CFLAGS="-D__EXTENSIONS__ $QEMU_CFLAGS"
 ;;
 Haiku)
-  haiku="yes"
   pie="no"
   QEMU_CFLAGS="-DB_USE_POSITIVE_POSIX_ERRORS -D_BSD_SOURCE -fPIC $QEMU_CFLAGS"
 ;;
@@ -3472,9 +3470,6 @@ fi
 if test "$solaris" = "yes" ; then
   echo "CONFIG_SOLARIS=y" >> $config_host_mak
 fi
-if test "$haiku" = "yes" ; then
-  echo "CONFIG_HAIKU=y" >> $config_host_mak
-fi
 if test "$static" = "yes" ; then
   echo "CONFIG_STATIC=y" >> $config_host_mak
 fi
-- 
2.33.1


