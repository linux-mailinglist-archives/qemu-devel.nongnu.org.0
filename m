Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFBE35F9B
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jun 2019 16:51:14 +0200 (CEST)
Received: from localhost ([127.0.0.1]:43916 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYXFx-0002Fl-Ez
	for lists+qemu-devel@lfdr.de; Wed, 05 Jun 2019 10:51:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56981)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1hYX5Y-0002PJ-Qi
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 10:40:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1hYX5X-0004Iv-4Z
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 10:40:28 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:35122)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
	id 1hYX5W-0004FE-TL; Wed, 05 Jun 2019 10:40:27 -0400
Received: by mail-wr1-x443.google.com with SMTP id m3so3922875wrv.2;
	Wed, 05 Jun 2019 07:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HBejD4kNctFQZxlIySn8oYt9PMZJcFSlk2RkPUjdkvU=;
	b=H2g0r9Ck+GtYXFAJM8CEM3E8iW9MsehMBborRIS7s09EJJHVJrpGTt8hFouwQEcXBb
	evv4bWbXTL2+67QJqot9OxEr+a5/4BjdMrEkazdBBjUmuhwprD25pfPHVlReZF3hc0Be
	qKIt6ygylLtKmsK1tN5N47KBomTjrXSP8N4uxLf1JENkQnJUYCjEMvgM1h096mniVxDT
	lvTIv4J9Oayzm5kZ+YEzZkaoZ1IaxiSwH7R/EeoZfGHexj7NysYp/rkOod1fdZwdmMXX
	1m/4ZEsnWCLd9pWLsAAZjBnGtynKV570PKifok9t4Sh25L0Vmdp1vyXMi8zSMDLc7Jpk
	kllA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=HBejD4kNctFQZxlIySn8oYt9PMZJcFSlk2RkPUjdkvU=;
	b=o82BQnBVSxJO7Ovo9/zJv0DPwmBg45WVP/W/NGlW6WF2N7f9Ev2Xf3CfaeGVzWYHIM
	V1JN7JLGGM+uVAWrLbHRXxqp7A/zLoeY9MTUhbn64ARotWu3cINza3zdthCEwQTQgKtO
	b4dakS28HynOoLT6OHvgTokwALL+Z3I1FIN1Ab8ur8x38sHpyYuAu8wwYecdHWTgaJXL
	+vdnGwmAZhJeEecDDOV9UhDhg1aW8pol/5RoJTC2GH1+Bv3tn6cfx/4doRmngLd4WOYo
	elFmOBvBAFI0rw7zv+tXzdtpGWjACp40h2V7w9f2+/0qYpWYdTLBPdsTWSc9k9LPcxtA
	Z7cw==
X-Gm-Message-State: APjAAAWg8kL2So/B2UviTx7dZqXEFJFNQKPnPdFJ3FizJsg40xGHdrvK
	tExlHmHe69jkLfs6uial3W0FQdXA
X-Google-Smtp-Source: APXvYqx+hZaVtuSY2ucGEhM4d22ceU3CgljWC3LrZg5YgdT3fwNl8STl2Da/mCgTNgk/k0ENgKmv8g==
X-Received: by 2002:adf:e2cb:: with SMTP id d11mr15524444wrj.66.1559745623446; 
	Wed, 05 Jun 2019 07:40:23 -0700 (PDT)
Received: from 640k.lan ([93.56.166.5]) by smtp.gmail.com with ESMTPSA id
	t14sm22123117wrr.33.2019.06.05.07.40.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Jun 2019 07:40:22 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  5 Jun 2019 16:40:19 +0200
Message-Id: <1559745620-18828-2-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1559745620-18828-1-git-send-email-pbonzini@redhat.com>
References: <1559745620-18828-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: [Qemu-devel] [PULL 1/2] vl: Fix -drive / -blockdev persistent
 reservation management
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Markus Armbruster <armbru@redhat.com>

qemu-system-FOO's main() acts on command line arguments in its own
idiosyncratic order.  There's not much method to its madness.
Whenever we find a case where one kind of command line argument needs
to refer to something created for another kind later, we rejigger the
order.

Recent commit cda4aa9a5a "vl: Create block backends before setting
machine properties" was such a rejigger.  Block backends are now
created before "delayed" objects.  This broke persistent reservation
management.  Reproducer:

    $ qemu-system-x86_64 -object pr-manager-helper,id=pr-helper0,path=/tmp/pr-helper0.sock-drive -drive file=/dev/mapper/crypt,file.pr-manager=pr-helper0,format=raw,if=none,id=drive-scsi0-0-0-2
    qemu-system-x86_64: -drive file=/dev/mapper/crypt,file.pr-manager=pr-helper0,format=raw,if=none,id=drive-scsi0-0-0-2: No persistent reservation manager with id 'pr-helper0'

The delayed pr-manager-helper object is created too late for use by
-drive or -blockdev.  Normal objects are still created in time.

pr-manager-helper has always been a delayed object (commit 7c9e527659
"scsi, file-posix: add support for persistent reservation
management").  Turns out there's no real reason for that.  Make it a
normal object.

Fixes: cda4aa9a5a08777cf13e164c0543bd4888b8adce
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20190604151251.9903-2-armbru@redhat.com>
Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
Cc: qemu-stable@nongnu.org
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 vl.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/vl.c b/vl.c
index f023a8c..cc6246d 100644
--- a/vl.c
+++ b/vl.c
@@ -2751,8 +2751,7 @@ static bool object_create_initial(const char *type, QemuOpts *opts)
         exit(0);
     }
 
-    if (g_str_equal(type, "rng-egd") ||
-        g_str_has_prefix(type, "pr-manager-")) {
+    if (g_str_equal(type, "rng-egd")) {
         return false;
     }
 
-- 
1.8.3.1



