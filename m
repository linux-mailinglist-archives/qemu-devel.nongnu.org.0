Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD3630CD99
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 22:07:08 +0100 (CET)
Received: from localhost ([::1]:51054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l72t9-0002ep-4n
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 16:07:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l72lo-0002jP-W1
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 15:59:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l72ln-0007Dy-6Q
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 15:59:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612299570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2uRkOC0iQiO30r3cMD7qB5pIME7EIhrWLL7nKiab9bA=;
 b=ivjgLjDtAl8+HAQ4Rw4K11fVsNnuE5kj6nrmghW5QNFwHCyB3fg3vCQ/+IXBekJV79A0F3
 XDivDSjscChrfQ6JExr6Fa8Vx1cg2sMOq3jAanwRHAbKRLeAP6JD2IxXy653FXMt1m1l7H
 Klh1mSLLwGNNn0wjIN2vRzjreLSJKmk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-uD5lA4w4NUCV3QI8UxO1UQ-1; Tue, 02 Feb 2021 15:59:27 -0500
X-MC-Unique: uD5lA4w4NUCV3QI8UxO1UQ-1
Received: by mail-ed1-f70.google.com with SMTP id bd22so4301204edb.4
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 12:59:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2uRkOC0iQiO30r3cMD7qB5pIME7EIhrWLL7nKiab9bA=;
 b=Yeb6x5eZyWtFTTy8MfV0WRfoj5gjFjLI/Aq6hZuwsA1vb+YS3p1L8KS0FujYEOxIxr
 eM6XfmwYReYTCYjlCYZp9SYkadFrqouaZz6HhlRjZe1iQepYuCJItEFIY98n13L7qSRg
 ffbMF+u4yqxT+vFh8b4psNQ+Di3SA3fWgyQyPamWjEaEZN7py5LntlDawDCKbPfgAplg
 /1MG5sX7CbL+hhEkgfuYf2Qqv/rI0NREIUvVPzXcAA1iUqKh5tG+XcTkINYLkrYFt4Ik
 VfjsAHulMg/l4fpPiwSfcGSf/R6pwNAPrNA05r4wKtPhR0VfrmZRh56Tx6t865lKv3cU
 e3Dw==
X-Gm-Message-State: AOAM532znbW1P2y6oHhV21KzuSPekyPNBMRPPbE3Q11l+YQ2KMs/fYQX
 qz9wD912+xSV0mf2dFFLuSAhX9U3dSNLN+/9mWyLvpNFevwJqinAd3du8sfUW2iQsJtGXGPCI4K
 RyO6GZQb6zY61hjl2uYoptLXBURy30NXslTNZI4Vsusbl3LBAo9dAG+sGHlTrVPaM
X-Received: by 2002:a50:acc1:: with SMTP id x59mr723558edc.43.1612299565610;
 Tue, 02 Feb 2021 12:59:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyV+hZ1g/jXNPyKi8KquZsEFJD/96hNNdP2T4tm5/D31fwggm44iPA6t+qfzwPYGDl0woV3jQ==
X-Received: by 2002:a50:acc1:: with SMTP id x59mr723536edc.43.1612299565447;
 Tue, 02 Feb 2021 12:59:25 -0800 (PST)
Received: from x1w.redhat.com (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id w8sm9530415edd.39.2021.02.02.12.59.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 12:59:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/12] seccomp: Replace the word 'blacklist'
Date: Tue,  2 Feb 2021 21:58:20 +0100
Message-Id: <20210202205824.1085853-9-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210202205824.1085853-1-philmd@redhat.com>
References: <20210202205824.1085853-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Otubo <otubo@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Follow the inclusive terminology from the "Conscious Language in your
Open Source Projects" guidelines [*] and replace the word "blacklist"
appropriately.

[*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 softmmu/qemu-seccomp.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/softmmu/qemu-seccomp.c b/softmmu/qemu-seccomp.c
index 377ef6937ca..4c684bc9e71 100644
--- a/softmmu/qemu-seccomp.c
+++ b/softmmu/qemu-seccomp.c
@@ -45,8 +45,8 @@ const struct scmp_arg_cmp sched_setscheduler_arg[] = {
     { .arg = 1, .op = SCMP_CMP_NE, .datum_a = SCHED_IDLE }
 };
 
-static const struct QemuSeccompSyscall blacklist[] = {
-    /* default set of syscalls to blacklist */
+static const struct QemuSeccompSyscall denylist[] = {
+    /* default set of syscalls to denylist */
     { SCMP_SYS(reboot),                 QEMU_SECCOMP_SET_DEFAULT },
     { SCMP_SYS(swapon),                 QEMU_SECCOMP_SET_DEFAULT },
     { SCMP_SYS(swapoff),                QEMU_SECCOMP_SET_DEFAULT },
@@ -175,18 +175,18 @@ static int seccomp_start(uint32_t seccomp_opts, Error **errp)
         goto seccomp_return;
     }
 
-    for (i = 0; i < ARRAY_SIZE(blacklist); i++) {
+    for (i = 0; i < ARRAY_SIZE(denylist); i++) {
         uint32_t action;
-        if (!(seccomp_opts & blacklist[i].set)) {
+        if (!(seccomp_opts & denylist[i].set)) {
             continue;
         }
 
-        action = qemu_seccomp_get_action(blacklist[i].set);
-        rc = seccomp_rule_add_array(ctx, action, blacklist[i].num,
-                                    blacklist[i].narg, blacklist[i].arg_cmp);
+        action = qemu_seccomp_get_action(denylist[i].set);
+        rc = seccomp_rule_add_array(ctx, action, denylist[i].num,
+                                    denylist[i].narg, denylist[i].arg_cmp);
         if (rc < 0) {
             error_setg_errno(errp, -rc,
-                             "failed to add seccomp blacklist rules");
+                             "failed to add seccomp denylist rules");
             goto seccomp_return;
         }
     }
-- 
2.26.2


