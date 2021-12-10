Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 533DE46FE53
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 11:00:48 +0100 (CET)
Received: from localhost ([::1]:36014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvchq-0005ct-AX
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 05:00:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mvbdW-0004ex-Dv
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 03:52:14 -0500
Received: from [2a00:1450:4864:20::52f] (port=36842
 helo=mail-ed1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mvbdT-0005f9-OC
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 03:52:13 -0500
Received: by mail-ed1-x52f.google.com with SMTP id z5so28152360edd.3
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 00:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3Ro+8DdT6XayqjaMWOUNuI9PjansdWb8nqL367+LLq8=;
 b=FSaI9vUME8BhqapZ8KZX/kx/JVThJBGjkEE0E5Z0L5gQJPaqOtLlmONWXLkUP96T2d
 WwHW9d5WMcyTc93sU9DkXP5YTHlcnhn5NtH1KpUPwwPf2nyWHhojXIl+lutpGR9XMOqR
 dd71o70SLstSktV8PBhRe1oVAz/pt8Z1oxvbEomK0uMAb5zfb6Cy6os2RWC6DUTnogXF
 hKJkiyylECoBski7j/t4qKGgA3Ts8/fp2MxVM1zvUsHSkkVZ8VZqW8ehKGzolmDOuUi0
 wXoBasjkUp579x0VFekW7d82yUKe77/2UVc96C9bIBpRkoU3n7JwHmaHVgy3dAEv95uZ
 6Xuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=3Ro+8DdT6XayqjaMWOUNuI9PjansdWb8nqL367+LLq8=;
 b=B1y9ntIMo6R2ZvE+LygKNkTEc6f0HVJwdeL9ia5wmo2TOuepttsEObcglzXHOoWVgy
 EoqWXn/r4PW83CjLz/A8GcMXyUcIO7+Kwu5bH7aJxo4zwa4FFphx0pg74oJ21cmF6ptm
 u+FhZkl8MWZIoK/kld+COLsWezEX9NG/0pR9y0CfPJTXYp5HE+Pg3N8GliTYBUdMpyzE
 gzrIn3hiknfxjjLbJTDtPpGb2sNdsxNLlMUK2CHz1SAbAS3OQQM7mymIK8EoVDcjQ0Fl
 at4aFltik0LGOoEC6lUeiJLRcyWYan+RYPo4huzIYgj/J2w2ItRMq1jkyjjeBW/BtUeB
 dNJQ==
X-Gm-Message-State: AOAM531u0YO7pVHvP78XKH7rESjiyoewkF/E7CJ33yA24isvOw9zXeB+
 E2qvLSqxDyh+Fh6NLBnjbtM83zkOLcU=
X-Google-Smtp-Source: ABdhPJzLLJZNdEALPQpVbP2JuPBoSzdmkIYqrfZJCfuqe9pWdxy+GuHllfLf9738VnLXYmpFtTAqDw==
X-Received: by 2002:aa7:c406:: with SMTP id j6mr37847489edq.76.1639126330319; 
 Fri, 10 Dec 2021 00:52:10 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id t20sm1052047edv.81.2021.12.10.00.52.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 00:52:10 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] configure: remove DIRS
Date: Fri, 10 Dec 2021 09:52:06 +0100
Message-Id: <20211210085206.25811-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
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

DIRS is used to create the directory in which the LINKS symbolic links
reside, or to create directories for object files.  The former can
be done directly in the symlinking loop, while the latter is done
by Meson already, so DIRS is not necessary.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/configure b/configure
index 80b5d0c148..4f7ed2ad1a 100755
--- a/configure
+++ b/configure
@@ -3794,7 +3794,6 @@ if test "$safe_stack" = "yes"; then
 fi
 
 # If we're using a separate build tree, set it up now.
-# DIRS are directories which we simply mkdir in the build tree;
 # LINKS are things to symlink back into the source tree
 # (these can be both files and directories).
 # Caution: do not add files or directories here using wildcards. This
@@ -3806,12 +3805,6 @@ fi
 # UNLINK is used to remove symlinks from older development versions
 # that might get into the way when doing "git update" without doing
 # a "make distclean" in between.
-DIRS="tests tests/tcg tests/qapi-schema tests/qtest/libqos"
-DIRS="$DIRS tests/qtest tests/qemu-iotests tests/vm tests/fp tests/qgraph"
-DIRS="$DIRS docs docs/interop fsdev scsi"
-DIRS="$DIRS pc-bios/optionrom pc-bios/s390-ccw"
-DIRS="$DIRS roms/seabios"
-DIRS="$DIRS contrib/plugins/"
 LINKS="Makefile"
 LINKS="$LINKS tests/tcg/Makefile.target"
 LINKS="$LINKS pc-bios/optionrom/Makefile"
@@ -3840,9 +3833,9 @@ for bios_file in \
 do
     LINKS="$LINKS pc-bios/$(basename $bios_file)"
 done
-mkdir -p $DIRS
 for f in $LINKS ; do
     if [ -e "$source_path/$f" ]; then
+        mkdir -p `dirname ./$f`
         symlink "$source_path/$f" "$f"
     fi
 done
-- 
2.33.1


