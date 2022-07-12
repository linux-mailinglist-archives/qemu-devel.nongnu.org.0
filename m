Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 647F4571A92
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 14:54:52 +0200 (CEST)
Received: from localhost ([::1]:36466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBFPf-0001fL-Jq
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 08:54:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBFL5-00035R-T9
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:50:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBFL4-0001Q7-36
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:50:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657630204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vvCO5iW75Uo0QBR8ClgsLomr7SuVTuh71gKSSgESR6U=;
 b=gibazowUjq72n7/5HPLVPAqv8GTsYa7yN3rPx1jrdoxtMbXRXIV7qxf88DAAZijImfWy7i
 QUXeE2e2MlTzqTi3olqF7TKU9BRgFgtD5ZUrsbeU9eWiSto36yV1t6f4Y0IKRhMk2CSEzq
 fMjEMlZb9zZIBO1xhIEDW663QdrH0pE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-mEQIPVHjPP6dXLFBQg9qZA-1; Tue, 12 Jul 2022 08:50:03 -0400
X-MC-Unique: mEQIPVHjPP6dXLFBQg9qZA-1
Received: by mail-ej1-f69.google.com with SMTP id
 gb37-20020a170907962500b0072b820af09dso645018ejc.20
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 05:50:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vvCO5iW75Uo0QBR8ClgsLomr7SuVTuh71gKSSgESR6U=;
 b=EuCblK98ul11HMlETJ4fazwkojCeRsfAoCahPYvm7dHNJlPlKmTfo2h95wI1B+QZAb
 wjo7LDTi8cuSRlVppxI4YlNNeButEb3pukPaQ2YEIN7rxu9QUD5QNHCLTDa2c3qPeH6r
 5jKhca2jAnUk6wkGirMU1QUBk/ve+eLvssf0d2j1rgB0H6xZ0d46cQCME3Mt1v/5UYDV
 GSpmtvvxK/Y67tw7v8XGoyo9/RGlNfXBAXbO5XpTCmjJFjrrepwD+i+els6VJhvc7KCE
 3Od5J3Ieg/YgN5cFTWIGu1Ftthoc/8ASUIK1sYf8ZwMiQaZ3OfG86Kt1XTOKLLUF8ctA
 XlXg==
X-Gm-Message-State: AJIora8+8IsLaRDy4tur5lLwoKkqxjW8P4wvnq+mPvxFPRbHCe5jBxz7
 Fa6jNzNw6o9cO9qFZ2CR7aWl88z9SZR670+sREIgtPZaMTyd0IbA60EX3LaADiKYurNGMIZpasQ
 k8oUklKLBC29qaxmT64R4mJ9PuMvIgdu2wan8m9rRAF6ycYDf0c83Nj8k/dcYKDNjqzk=
X-Received: by 2002:a17:906:4fd4:b0:722:f223:8d86 with SMTP id
 i20-20020a1709064fd400b00722f2238d86mr24030231ejw.558.1657630201962; 
 Tue, 12 Jul 2022 05:50:01 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tRxJKDhf+1hcEPgsrEeGOFJcEhzV40/DHM1P34InGc0MWY5hmU6wZGNmZQVpgn86+jhHo8DA==
X-Received: by 2002:a17:906:4fd4:b0:722:f223:8d86 with SMTP id
 i20-20020a1709064fd400b00722f2238d86mr24030194ejw.558.1657630201517; 
 Tue, 12 Jul 2022 05:50:01 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 w20-20020a056402071400b0043a87e6196esm6002885edx.6.2022.07.12.05.50.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 05:50:00 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/18] tests/vm: do not specify -bios option
Date: Tue, 12 Jul 2022 14:49:39 +0200
Message-Id: <20220712124956.150451-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220712124956.150451-1-pbonzini@redhat.com>
References: <20220712124956.150451-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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



