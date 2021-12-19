Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A3E47A0E8
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Dec 2021 15:24:59 +0100 (CET)
Received: from localhost ([::1]:57668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myx7S-0003c0-PY
	for lists+qemu-devel@lfdr.de; Sun, 19 Dec 2021 09:24:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1myx0C-0006Nx-2r
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 09:17:28 -0500
Received: from [2a00:1450:4864:20::52d] (port=42670
 helo=mail-ed1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1myx09-0005xq-L4
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 09:17:26 -0500
Received: by mail-ed1-x52d.google.com with SMTP id j21so23399812edt.9
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 06:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZNUy718tEhPS2oilWcWnoZQhmSMv1tita41t/eNJPdw=;
 b=VVuhyGmn3EIjCXZiuvOF8O9UC9bz335AizvwJ0+g7ww86RcZV4usnSv5JttUMtegyX
 lHzZCF397pvIn0k2Jaeq3VA3x5fg5mLU36ca4i+WH3tekNzeK0LE7oaGOydCN6KdWNT4
 4u2ev7u9EChc8K0tJKJC2WOzp7Qfyo40aVE1SrS4G0420K1mIiiUpr7vyjV97PB1Z9ZR
 ScLjxxjypdHm4pw2H0mh0Dd1o0xgxG/6HgoFJY0JMBO2p6ua5ZOPwm0B6JngY6BpIaPS
 7ghuieZRXRA2a48JF12e6QeaqpNrSYFRNFy+FR/oiSBlu4XHQzIiDwSihKLB/AKAxc71
 4kzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ZNUy718tEhPS2oilWcWnoZQhmSMv1tita41t/eNJPdw=;
 b=GFC3hfGB8ipMjJHcXi22QevQDsKhzifkj/+n2I1GoqFZbbO8bUXIZFwX9DbCJzffY2
 lfYVvOWTy1/M/ylgWzynWq8RMschR+NynMxlusD4SxPSy8lBHazjwPLlpVw5XXsMplb/
 wiaqgkUbdD39C2A5oSun+7cRyQE6Ya67FcC6YrEiAEf9bC9fVBrz0xKJmOfoshII+b1f
 k6BADgINDr6MDNyxpw3110TALHCI2JIsUhx+kwQ8qMDycqT1ts8/SkKoj5XTI9Gb3AS/
 g082kudHU0WIkeRUQXhFMRsrk0c5p6p63+ik5WxuSIuumN9xzEzrjhsVIGmFU0JnQ1tn
 ih7w==
X-Gm-Message-State: AOAM530g7zt1agqI3rYBF0oD8AT0lFXI9fqhW5o8DLFyhCgdROqadsrw
 hLzIUhlvAdccqmrBx1voMbGhtozRK1o=
X-Google-Smtp-Source: ABdhPJzFuN3hMv05WyA66JgZ+U2pXtj95Q2zHB4Z4M0nkoHqS9fc4iqD7QINzkxHXIFtHOB4IxBM3w==
X-Received: by 2002:a17:907:16a8:: with SMTP id
 hc40mr7378501ejc.210.1639923444417; 
 Sun, 19 Dec 2021 06:17:24 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:48f9:bea:a04c:3dfe])
 by smtp.gmail.com with ESMTPSA id hq9sm4570665ejc.119.2021.12.19.06.17.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Dec 2021 06:17:24 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/16] configure: remove unnecessary symlinks
Date: Sun, 19 Dec 2021 15:17:03 +0100
Message-Id: <20211219141711.248066-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211219141711.248066-1-pbonzini@redhat.com>
References: <20211219141711.248066-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make pc-bios/meson.build use the files in the source tree as inputs
to bzip2.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure           | 1 -
 pc-bios/meson.build | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/configure b/configure
index 6e06ac6161..ba85bbb54b 100755
--- a/configure
+++ b/configure
@@ -3801,7 +3801,6 @@ for bios_file in \
     $source_path/pc-bios/*.img \
     $source_path/pc-bios/openbios-* \
     $source_path/pc-bios/u-boot.* \
-    $source_path/pc-bios/edk2-*.fd.bz2 \
     $source_path/pc-bios/palcode-* \
     $source_path/pc-bios/qemu_vga.ndrv
 
diff --git a/pc-bios/meson.build b/pc-bios/meson.build
index b40ff3f2bd..1812a4084f 100644
--- a/pc-bios/meson.build
+++ b/pc-bios/meson.build
@@ -15,7 +15,7 @@ if unpack_edk2_blobs
     roms += custom_target(f,
                   build_by_default: have_system,
                   output: f,
-                  input: '@0@.bz2'.format(f),
+                  input: files('@0@.bz2'.format(f)),
                   capture: true,
                   install: get_option('install_blobs'),
                   install_dir: qemu_datadir,
-- 
2.33.1



