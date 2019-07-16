Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F716A3A9
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jul 2019 10:15:22 +0200 (CEST)
Received: from localhost ([::1]:46240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnIcL-0006nQ-1x
	for lists+qemu-devel@lfdr.de; Tue, 16 Jul 2019 04:15:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60203)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <paolo.bonzini@gmail.com>) id 1hnIYn-0000Wq-HZ
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 04:11:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1hnIYm-0003QR-Ex
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 04:11:41 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:54374)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1hnIYm-0003PN-7D
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 04:11:40 -0400
Received: by mail-wm1-x342.google.com with SMTP id p74so17633316wme.4
 for <qemu-devel@nongnu.org>; Tue, 16 Jul 2019 01:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4z2hHvRDYhdwl8/3C9+GCvMIElrn7WkJD5Frbj4tMvU=;
 b=PO0oBgHWgjyGzP64SHHOFaYWX0l4+2NCWX+3Fsd8G55Xpp4E8CPInxYkeTrI/RtDtG
 41bnjYhz0ZafOGNtm+IVQ2XGf3IkNwup1qxJj+u4MG+0a21Ku8HNDqhbMGx7K9yMDp7e
 zb4k07TK7Z2dNee9BHpExOYQBZyBgoyeclzR6ydxH4PQmIgMlRvHAOmSx7F56G4prIss
 wnZpSVIXNPToLWTrNpHyVF+ldAMMNbPZiJewg3spgunptmvVs22lv7gsDuJ4G7IBlgqe
 XfeyLhHmnvkohiNbCLSIDPjR9NUofLdvBeW0wEidJxw5yh15hPLBXFjqR9Xd7JLLznCe
 NNGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=4z2hHvRDYhdwl8/3C9+GCvMIElrn7WkJD5Frbj4tMvU=;
 b=Z+dubIC6VBCm5y4nARIUrDcYMno9iP2YkxSMV4oYr744gM7n4p4v3SPfnukPT1qTdS
 EbsrMJW7kJ0W2YqR3haVWqViNNEr1ZHpCrR3Md5REvBoagnz3lINrqgtLW933Qi8nSUu
 t/f8hEoRk7S1vlgmbMMq5KmjZjtBTWqpgp1Ai42YYdgBGtbWLsfR1F1c3vpjV9SfCPDy
 GUFuGoI4swq0z/9dCCDLRl+8c6gocCHYzCRTsJ1zxmggxtlm25udMS91jf2CVdS1ss74
 /az1VurCTujpTde7ypYWTHGjy4+2nZYxDjRMRHfeHdLAJE9boHJ9VTT3F1UKyQg1zD6u
 axpA==
X-Gm-Message-State: APjAAAWMTh+hRI8Z8NYEgcZkXGj95lUzp2CevFTDSGm9Mt7kpPDqTCfL
 PkF+mKY6kta4gZMW5PiAe7nvn2EkV5s=
X-Google-Smtp-Source: APXvYqwGyMAm3RQJr69wadoJberq1UVX/K7BYE+p+WeY0cF8kFEn+wTZ/LZto6++oN95AtSJS2iOMw==
X-Received: by 2002:a1c:9696:: with SMTP id y144mr29068800wmd.73.1563264698898; 
 Tue, 16 Jul 2019 01:11:38 -0700 (PDT)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id c1sm37723879wrh.1.2019.07.16.01.11.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Jul 2019 01:11:38 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 16 Jul 2019 10:11:17 +0200
Message-Id: <1563264677-39718-20-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1563264677-39718-1-git-send-email-pbonzini@redhat.com>
References: <1563264677-39718-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: [Qemu-devel] [PULL 19/19] vl: make sure char-pty message displayed
 by moving setbuf to the beginning
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
Cc: Wei Yang <richardw.yang@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wei Yang <richardw.yang@linux.intel.com>

Recently we found a behavior change after commit 6ade45f2ac93611
('char-pty: Print "char device redirected" message to stdout').

When we redirect output to a file, the message "char device redirected
to PTY_NAME (label LABEL)" would not be seen at the beginning of the
file. Instead, the message is displayed after QEMU quit. This will block
test automation.

The reason is this message is printed after we set line buffer mode. So
move this to the beginning.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 vl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/vl.c b/vl.c
index 5089fce..a5808f9 100644
--- a/vl.c
+++ b/vl.c
@@ -2890,6 +2890,8 @@ int main(int argc, char **argv, char **envp)
     char *dir, **dirs;
     BlockdevOptionsQueue bdo_queue = QSIMPLEQ_HEAD_INITIALIZER(bdo_queue);
 
+    os_set_line_buffering();
+
     error_init(argv[0]);
     module_call_init(MODULE_INIT_TRACE);
 
@@ -4246,8 +4248,6 @@ int main(int argc, char **argv, char **envp)
         semihosting_arg_fallback(kernel_filename, kernel_cmdline);
     }
 
-    os_set_line_buffering();
-
     /* spice needs the timers to be initialized by this point */
     qemu_spice_init();
 
-- 
1.8.3.1


