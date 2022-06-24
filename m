Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E545595CA
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 10:51:19 +0200 (CEST)
Received: from localhost ([::1]:51852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4f26-00035O-Vx
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 04:51:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o4efG-0005m5-VJ
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:27:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o4efE-0005Rn-Ds
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:27:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656059258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vvCO5iW75Uo0QBR8ClgsLomr7SuVTuh71gKSSgESR6U=;
 b=jDI/4CGaFt0l/ioQb16OUzvKpjR1EyQEtjXXAAcXKmlDZsrSNjvQaUQv9oGG0XLu/lghYJ
 KWBUMuA0X7QSshlaDZlT3AG8fKbxglr3zZWgWWdaBB9oa79Y9/iKEenAumwnP/jSpq2BQr
 aDiIXE6SlPIu/6LDjWDdiIUEq3FEZg0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-362-Ab26ZH_kNROt3vuSdR_zog-1; Fri, 24 Jun 2022 04:27:35 -0400
X-MC-Unique: Ab26ZH_kNROt3vuSdR_zog-1
Received: by mail-ed1-f71.google.com with SMTP id
 r12-20020a05640251cc00b00435afb01d7fso1350465edd.18
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 01:27:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vvCO5iW75Uo0QBR8ClgsLomr7SuVTuh71gKSSgESR6U=;
 b=u8wU370ls0+UIUr8gtouMydltz5+8IzJU3Ije32alspICe9iJ7rFn2QPJpkZOH4hhD
 yDBLGFNoYtHDxNno0jxydvO+agvnysk83fuDJHAyxAzDwCb3eAmMmNosDtac/+4L+NVP
 7ecX3e+FqmX0BMeHAqh5PQ/Rg0QK+a34zgVpz6N2SbPtPAwzaT/TKWZTJHy7QAr7RUy+
 uMyWpBWuQ1lgCLs/CtS9iwN1Vs1Ox9L7RwtHLQM/Q33JHUu0CZjxkxcXaOmFZX+1/IYk
 j+U4CYg45XuR/5qYBiHO4y9btSnGM3kQkCBN/V/KAFV4KxOP8Csmw5pcMkmU9qrATn3U
 O3eQ==
X-Gm-Message-State: AJIora8BRZ3DdYznAWZf+vrWmRTCbNA5nEycaipiZlxX6wn9Lxz32CS1
 Y9xQuD6JY1K/axQRgrsyuCGwW/nyIFW+R8KG0U+EvVvPKeO0RSOAhN7uD3rUUyCoURFSg9SzJZr
 UPKG/42G43NN7SQ2ua6zaQZhihNxQs/z1MM0V6NQELmhouk8XHjkZa3dAGuNy6f0ohaA=
X-Received: by 2002:a05:6402:154a:b0:435:5261:f776 with SMTP id
 p10-20020a056402154a00b004355261f776mr15725358edx.118.1656059254343; 
 Fri, 24 Jun 2022 01:27:34 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v3etmjvfztJ7xa+VKLtcRCdhLtzdksUnCex+4rgBhH+fgubBqg6H2JD9xU6FNQMyEUMEiBFQ==
X-Received: by 2002:a05:6402:154a:b0:435:5261:f776 with SMTP id
 p10-20020a056402154a00b004355261f776mr15725315edx.118.1656059253947; 
 Fri, 24 Jun 2022 01:27:33 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a1709066c8700b0070c4abe4706sm708807ejr.158.2022.06.24.01.27.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 01:27:33 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/14] tests/vm: do not specify -bios option
Date: Fri, 24 Jun 2022 10:27:17 +0200
Message-Id: <20220624082730.246924-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220624082730.246924-1-pbonzini@redhat.com>
References: <20220624082730.246924-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

When running from the build tree, the executable is able to find
the BIOS on its own; when running from the source tree, a firmware
blob should already be installed and there is no guarantee that
the one in the source tree works with the QEMU that is being used for
the installation.

Just remove the -bios option, since it is unnecessary and in fact
there are other x86 VM tests that do not bother specifying it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/vm/fedora  | 1 -
 tests/vm/freebsd | 1 -
 tests/vm/netbsd  | 1 -
 tests/vm/openbsd | 1 -
 4 files changed, 4 deletions(-)

diff --git a/tests/vm/fedora b/tests/vm/fedora
index 92b78d6e2c..12eca919a0 100755
--- a/tests/vm/fedora
+++ b/tests/vm/fedora
@@ -79,7 +79,6 @@ class FedoraVM(basevm.BaseVM):
         self.exec_qemu_img("create", "-f", "qcow2", img_tmp, self.size)
         self.print_step("Booting installer")
         self.boot(img_tmp, extra_args = [
-            "-bios", "pc-bios/bios-256k.bin",
             "-machine", "graphics=off",
             "-device", "VGA",
             "-cdrom", iso
diff --git a/tests/vm/freebsd b/tests/vm/freebsd
index 805db759d6..cd1fabde52 100755
--- a/tests/vm/freebsd
+++ b/tests/vm/freebsd
@@ -95,7 +95,6 @@ class FreeBSDVM(basevm.BaseVM):
 
         self.print_step("Booting installer")
         self.boot(img_tmp, extra_args = [
-            "-bios", "pc-bios/bios-256k.bin",
             "-machine", "graphics=off",
             "-device", "VGA",
             "-cdrom", iso
diff --git a/tests/vm/netbsd b/tests/vm/netbsd
index 45aa9a7fda..aa883ec23c 100755
--- a/tests/vm/netbsd
+++ b/tests/vm/netbsd
@@ -86,7 +86,6 @@ class NetBSDVM(basevm.BaseVM):
 
         self.print_step("Booting installer")
         self.boot(img_tmp, extra_args = [
-            "-bios", "pc-bios/bios-256k.bin",
             "-machine", "graphics=off",
             "-cdrom", iso
         ])
diff --git a/tests/vm/openbsd b/tests/vm/openbsd
index 13c8254214..6f1b6f5b98 100755
--- a/tests/vm/openbsd
+++ b/tests/vm/openbsd
@@ -82,7 +82,6 @@ class OpenBSDVM(basevm.BaseVM):
 
         self.print_step("Booting installer")
         self.boot(img_tmp, extra_args = [
-            "-bios", "pc-bios/bios-256k.bin",
             "-machine", "graphics=off",
             "-device", "VGA",
             "-cdrom", iso
-- 
2.36.1



