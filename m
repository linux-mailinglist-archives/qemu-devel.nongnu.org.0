Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D184C6EFD5
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Jul 2019 17:20:22 +0200 (CEST)
Received: from localhost ([::1]:51618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hor9p-0002Oi-AD
	for lists+qemu-devel@lfdr.de; Sat, 20 Jul 2019 11:20:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39894)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <paolo.bonzini@gmail.com>) id 1hor8W-0006Ar-60
 for qemu-devel@nongnu.org; Sat, 20 Jul 2019 11:19:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1hor8V-00089Z-AI
 for qemu-devel@nongnu.org; Sat, 20 Jul 2019 11:19:00 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:42937)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1hor8V-00089A-4C
 for qemu-devel@nongnu.org; Sat, 20 Jul 2019 11:18:59 -0400
Received: by mail-wr1-x434.google.com with SMTP id x1so20022969wrr.9
 for <qemu-devel@nongnu.org>; Sat, 20 Jul 2019 08:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1o9UgFGkc03JEexjlaP2KvbGOgKiLs/glyHI3+FA/V0=;
 b=DlEbn/CH51FGSdv1Hj9C3oYJIHxKPqCXEEjvwM0Df7ZQtTxpEqyE+XkKh2axeQaqty
 si4zvG0e0RPHIdmKNuGAPoqgNjrLRhyb4U/gRQt8kZ0ZFo5T5guIovRFSdl17qBBUI5A
 /9HBSGwrJA3KqonFhytK1UFnP/o9/75+Giy737veQJs+NCzJMwrVZiz4ojNZSv2Itc01
 60zRZi3eP/wJxOPCp9ELCmVhG4+qy+8SNi0AJ7LEt4zCROMOIiv+LZMwSvE4jH0B6UBt
 z2f/ObiQ2Ylf1oxWtreE6iHf38HSNSfAf/1XvFRpAjuG5GR2voDBWAcGPjKe8xGKTWBU
 /pWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1o9UgFGkc03JEexjlaP2KvbGOgKiLs/glyHI3+FA/V0=;
 b=HKXaooaDGhaJsiAS0+wCIMCMmW5FoLQYIExz8JPTaP4OrSRiPycrald+GQu7lugaes
 sVqBK+MrYKFiuIr3f3+GwdBE1UWCsbJmBPvkrw97v73TDsSv1oA9Vxrj0x6Wp3g9vWJS
 9rGjMMVy5a77+NE8NSM8BbLnNqJdSqV/Sz3lrt9fIZzEIt1asYqpEKR9+eDBVId9b7ZA
 Y39TjWKycZ++N42JSm88vcDKkmbJz1PNCfDkXDkmWjVPOFZvcc+OybmPmqaTefNwFJgk
 L9gdLpfVqbvQ+MiGegNqk3sn4lPrOhtIQEXnfs9MKdYhthVy4mbpwafxJe6Hn4hWh5B7
 Etvg==
X-Gm-Message-State: APjAAAUeDmi8QG7VOYnUa/EuX3Du+Hf82G3zhb+tyjnhBRUPIh5kaXYT
 edfKXjbOw8ZqME2mES6/B4rqnYr3cK8=
X-Google-Smtp-Source: APXvYqwv1hYKhP1/Yi4OeAzStmcxU3DoaIwUbkKWTIfczdTEX9LssZ9EkZAbNl6QVzhy8i9dyNj/+g==
X-Received: by 2002:adf:eb49:: with SMTP id u9mr59220683wrn.215.1563635937934; 
 Sat, 20 Jul 2019 08:18:57 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:8501:6b03:f18c:74f8])
 by smtp.gmail.com with ESMTPSA id 4sm77517291wro.78.2019.07.20.08.18.57
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 20 Jul 2019 08:18:57 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat, 20 Jul 2019 17:18:43 +0200
Message-Id: <20190720151846.7450-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190720151846.7450-1-pbonzini@redhat.com>
References: <20190720151846.7450-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::434
Subject: [Qemu-devel] [PULL 09/12] qmp: don't emit the RESET event on wakeup
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
Cc: Cornelia Huck <cohuck@redhat.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Nicholas Piggin <npiggin@gmail.com>

Commit 1405819637f53 ("qmp: don't emit the RESET event on wakeup from
S3") changed system wakeup to avoid calling qapi_event_send_reset.
Commit 76ed4b18debfe ("s390/ipl: fix ipl with -no-reboot") appears to
have inadvertently broken that logic.

Acked-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Message-Id: <20190718103951.10027-2-npiggin@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 vl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/vl.c b/vl.c
index a5808f9..cefe5a3 100644
--- a/vl.c
+++ b/vl.c
@@ -1550,7 +1550,7 @@ void qemu_system_reset(ShutdownCause reason)
     } else {
         qemu_devices_reset();
     }
-    if (reason != SHUTDOWN_CAUSE_SUBSYSTEM_RESET) {
+    if (reason && reason != SHUTDOWN_CAUSE_SUBSYSTEM_RESET) {
         qapi_event_send_reset(shutdown_caused_by_guest(reason), reason);
     }
     cpu_synchronize_all_post_reset();
-- 
1.8.3.1



