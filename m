Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A575B32BA07
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 19:53:21 +0100 (CET)
Received: from localhost ([::1]:36860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHWcW-0006CD-Og
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 13:53:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWX0-0005hv-NH
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:47:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWWu-000841-1f
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:47:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614797246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zv/BwC5POPyWjWYZMgFmMVd8R/Xa4KoRgVF20B1JO98=;
 b=YkhvWXTBYWEN1T4W1lxqBQ+DI+k9OM1c4VxgxeBXgOrJSTjLNS0HO7LmSMNvcyvIsUIO7l
 Y/vtdnIjn1/x/NXj0+Oc0JNg13buuxNxtM2hNF7ISlpUobmopLfNYIx6b4UM+IvZsPMSGo
 akutwxFjSBvvShx4odGl4OudHQcis0k=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-598-2xdy6nPKMZSztJ9mFSI7EA-1; Wed, 03 Mar 2021 13:47:24 -0500
X-MC-Unique: 2xdy6nPKMZSztJ9mFSI7EA-1
Received: by mail-wr1-f71.google.com with SMTP id g5so13124356wrd.22
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 10:47:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zv/BwC5POPyWjWYZMgFmMVd8R/Xa4KoRgVF20B1JO98=;
 b=BRn70HbRdd3gj4zbsGsegLcpPkn0MBs526JfV8QpP+8BHreFLkWzJFHilMfZqqBrjG
 M+CBA0K0Q/lMU9S2pn8RH+gBMjQGhxAVFHQAozdSMWI71eGwVxgvtjD9TnNi1Ff4ki2M
 X83MhLAxgN0NY6qcSTWD3exNQGoYFZpSbBkpEA93VKy6zfwGCy1AR+nC4Ax//50q5OlX
 HxDEdr8p+mSUk5PDOOwaxfsCJJkr57aHqh/SfKsmyeWJxknAw17ykw7DKNhqJoi4pEb5
 L0GwbtSFr6vU7KxJUpUcufqkVOuU2K4s2woHf563x5x8y/3QBdVhhk8PTxcQd+vTx0Bb
 FG1A==
X-Gm-Message-State: AOAM533EtnGPOSo9SlgHB84EM5wLUfxKhWuvJCoqNyZYvRRYMM50101p
 iDT0xkr7N2ATEyFmtyYIbDtGQV4VZeMc8+Hdy1nOQ9Mw+2EVTM4/7bd67/gOjXy9D42i071xSyg
 gP/ogwydZcgnMXm1lQUk/m2BdOdLzsZlXC9TsFziXGvJrMM4XPvrXI1C6pWGb8YLe
X-Received: by 2002:adf:a4d0:: with SMTP id h16mr130694wrb.52.1614797242570;
 Wed, 03 Mar 2021 10:47:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz5JgQpBX92H6UGgShZ4/nvXSRy+FEwNApU2icyYpt9aUmnJnLP8p5aGqMj2y+myurUBLCLZA==
X-Received: by 2002:adf:a4d0:: with SMTP id h16mr130662wrb.52.1614797242368;
 Wed, 03 Mar 2021 10:47:22 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id m11sm20480462wrz.40.2021.03.03.10.47.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 10:47:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/5] tests/fp/fp-test: Replace the word 'blacklist'
Date: Wed,  3 Mar 2021 19:46:44 +0100
Message-Id: <20210303184644.1639691-6-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303184644.1639691-1-philmd@redhat.com>
References: <20210303184644.1639691-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Eduardo Otubo <otubo@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Follow the inclusive terminology from the "Conscious Language in your
Open Source Projects" guidelines [*] and replace the word "blacklist"
appropriately.

[*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md

Acked-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/fp/fp-test.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/fp/fp-test.c b/tests/fp/fp-test.c
index 06ffebd6db1..5a4cad8c8b2 100644
--- a/tests/fp/fp-test.c
+++ b/tests/fp/fp-test.c
@@ -123,7 +123,7 @@ static void not_implemented(void)
     fprintf(stderr, "Not implemented.\n");
 }
 
-static bool blacklisted(unsigned op, int rmode)
+static bool is_allowed(unsigned op, int rmode)
 {
     /* odd has not been implemented for any 80-bit ops */
     if (rmode == softfloat_round_odd) {
@@ -161,10 +161,10 @@ static bool blacklisted(unsigned op, int rmode)
         case F32_TO_EXTF80:
         case F64_TO_EXTF80:
         case F128_TO_EXTF80:
-            return true;
+            return false;
         }
     }
-    return false;
+    return true;
 }
 
 static void do_testfloat(int op, int rmode, bool exact)
@@ -194,7 +194,7 @@ static void do_testfloat(int op, int rmode, bool exact)
     verCases_writeFunctionName(stderr);
     fputs("\n", stderr);
 
-    if (blacklisted(op, rmode)) {
+    if (!is_allowed(op, rmode)) {
         not_implemented();
         return;
     }
-- 
2.26.2


