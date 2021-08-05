Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9AF3E1CA8
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 21:27:13 +0200 (CEST)
Received: from localhost ([::1]:45030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBj1M-0005Jd-NJ
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 15:27:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jrtc27@jrtc27.com>) id 1mBj09-0004eZ-2U
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 15:25:57 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:36652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jrtc27@jrtc27.com>) id 1mBj07-0003rh-E2
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 15:25:56 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 o7-20020a05600c5107b0290257f956e02dso7124367wms.1
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 12:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jrtc27.com; s=gmail.jrtc27.user;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7ZeUP8jqT7PN2khTS+t5xRAWus56esZvAOfg+NYXjdQ=;
 b=gmN63H5j2XNifqPRVk3WdNktaZU+TDkhgm2bpHw5EgoUTAipNb55lEjXJ9ttpw/dg4
 I6vdgMLmb1ZPgh5xptM8L3CElro6tD8Nw39RSKe/al7U/x3UsoB4Kycjw1w43olZ//x+
 3tI+egqAb5Di0fIiQ2lxqifUO73BnglgNq97/fZiAq3JnasEP75DroSDwXUwCCoQmOPz
 sXC7gvFzvb8291Sv7CmXy2BjdnZ/76FNhTK3lVdSK/IMRaL6h3vwnA2YTMRnj6KEhurY
 YQ1/ER3YklNSZE4hTQDIt9sNKmOSFU7Q0Z32tHsKwKVrYFEb1P6h+0DojGJpNFrTzA65
 NR/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7ZeUP8jqT7PN2khTS+t5xRAWus56esZvAOfg+NYXjdQ=;
 b=A5xyYqEMrT+8BbTD5atD+ld/qrlJyMVV2jIUP4zT0BdpkKLKvPGeoqfBVHOHr//V60
 z5rfDzoz6PXODiA4pad6xnNR1BWuz1YP2dqKkAyIeMEnBoMtw2XQeq09AFoWtC6Sw854
 S6jXGhADnF7B3tj2SKwNpPVO2XUZukWq+6+sAjwM96BuVeT5sksOoEorSMHQToTInxRb
 RtifuEnJzs4nYzEa472SXH2/ShyqVQKtSY+xG/+juT8QfDXPPh9YeETvdvakpxwAuC1e
 nNUkWU9kExUrX42VjN/rOpJLtsETNidIUIXCH0gsJD92C6aHuYI/hnkPikw9reHn+8Hs
 cWQA==
X-Gm-Message-State: AOAM532vdEvzIU5ar0cl7UTNLiiErw9GIJmNZQS38IMyZJj3dh6AEnVb
 Imnuk20PFH/R6LplBhEg4BOcLQ==
X-Google-Smtp-Source: ABdhPJyKztLy029OthfjrLGoMdkQdbAlNXgUYwRXLgAf/QgFrViZ980rDIsveaxsjrP+3v35bHyUyA==
X-Received: by 2002:a05:600c:2319:: with SMTP id
 25mr6511749wmo.27.1628191553655; 
 Thu, 05 Aug 2021 12:25:53 -0700 (PDT)
Received: from Jessicas-MacBook-Pro.local
 (trinity-students-nat.trin.cam.ac.uk. [131.111.193.104])
 by smtp.gmail.com with ESMTPSA id a24sm2994425wmj.42.2021.08.05.12.25.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 05 Aug 2021 12:25:53 -0700 (PDT)
Received: by Jessicas-MacBook-Pro.local (Postfix, from userid 501)
 id C8F933683F50; Thu,  5 Aug 2021 20:25:52 +0100 (BST)
From: Jessica Clarke <jrtc27@jrtc27.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] Partially revert "build: -no-pie is no functional linker
 flag"
Date: Thu,  5 Aug 2021 20:25:45 +0100
Message-Id: <20210805192545.38279-1-jrtc27@jrtc27.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210805191430.37409-1-jrtc27@jrtc27.com>
References: <20210805191430.37409-1-jrtc27@jrtc27.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=jrtc27@jrtc27.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jessica Clarke <jrtc27@jrtc27.com>,
 qemu-stable@nongnu.org, Christian Ehrhardt <christian.ehrhardt@canonical.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This partially reverts commit bbd2d5a8120771ec59b86a80a1f51884e0a26e53.

This commit was misguided and broke using --disable-pie on any distro
that enables PIE by default in their compiler driver, including Debian
and its derivatives. Whilst -no-pie is not a linker flag, it is a
compiler driver flag that ensures -pie is not automatically passed by it
to the linker. Without it, all compile_prog checks will fail as any code
built with the explicit -fno-pie will fail to link with the implicit
default -pie due to trying to use position-dependent relocations. The
only bug that needed fixing was LDFLAGS_NOPIE being used as a flag for
the linker itself in pc-bios/optionrom/Makefile.

Note this does not reinstate exporting LDFLAGS_NOPIE, as it is unused,
since the only previous use was the one that should not have existed. I
have also updated the comment for the -fno-pie and -no-pie checks to
reflect what they're actually needed for.

Fixes: bbd2d5a8120771ec59b86a80a1f51884e0a26e53
Cc: Christian Ehrhardt <christian.ehrhardt@canonical.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-stable@nongnu.org
Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
---
Changes in v2:
  * Actually include the comment change; didn't add the hunk when
    amending...

 configure | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 9a79a004d7..8aecd277ed 100755
--- a/configure
+++ b/configure
@@ -2246,9 +2246,11 @@ static THREAD int tls_var;
 int main(void) { return tls_var; }
 EOF
 
-# Check we support --no-pie first; we will need this for building ROMs.
+# Check we support -fno-pie and -no-pie first; we will need the former for
+# building ROMs, and both for everything if --disable-pie is passed.
 if compile_prog "-Werror -fno-pie" "-no-pie"; then
   CFLAGS_NOPIE="-fno-pie"
+  LDFLAGS_NOPIE="-no-pie"
 fi
 
 if test "$static" = "yes"; then
@@ -2264,6 +2266,7 @@ if test "$static" = "yes"; then
   fi
 elif test "$pie" = "no"; then
   CONFIGURE_CFLAGS="$CFLAGS_NOPIE $CONFIGURE_CFLAGS"
+  CONFIGURE_LDFLAGS="$LDFLAGS_NOPIE $CONFIGURE_LDFLAGS"
 elif compile_prog "-Werror -fPIE -DPIE" "-pie"; then
   CONFIGURE_CFLAGS="-fPIE -DPIE $CONFIGURE_CFLAGS"
   CONFIGURE_LDFLAGS="-pie $CONFIGURE_LDFLAGS"
-- 
2.17.1


