Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B13894BCFFC
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Feb 2022 17:55:53 +0100 (CET)
Received: from localhost ([::1]:47406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLpV2-0002EM-3Z
	for lists+qemu-devel@lfdr.de; Sun, 20 Feb 2022 11:55:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nLpQg-0007mj-9j
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 11:51:22 -0500
Received: from [2607:f8b0:4864:20::730] (port=46964
 helo=mail-qk1-x730.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nLpQe-0000Ck-Bc
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 11:51:21 -0500
Received: by mail-qk1-x730.google.com with SMTP id f21so2416256qke.13
 for <qemu-devel@nongnu.org>; Sun, 20 Feb 2022 08:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OQsJdOHddV75uy/z8dRcrVTvB6Zu5S1Fp/PXYFh99jk=;
 b=a3LhpXyPAV2GwBgJVvxtcWVHcRHULvuV5VRybyQ3Czv2HDNjRyyNjND75NXYfaaftJ
 UI6jaYx30ceW1NX29E1+vuiN1IS5/3fgdIcKVpAWbzxLAAS6cij5t7SBSFxo+O3RJfQh
 p48vz8zunZtfXlbAFZPXG3P5BJ0kT4O+Oo2i8DxiFNdu11anrJKO+umNsLAj6xNOUYXN
 7+v8/nL00DQ64Rqi6G+uCYgj0n9c/bl8fXG+hhOAb3QBe2QEPtqlaBReEpelQXDano/F
 VI0iC5XXqAVrAzZaepwN+ySXCRqy5oPpl0WELw9hwC5bA7LxeO+Pw1EdkPMuwHow8bXy
 rjrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OQsJdOHddV75uy/z8dRcrVTvB6Zu5S1Fp/PXYFh99jk=;
 b=f45ehzdi8+AijKY4wJrVw63TXWfmsZGVn4t7EcU5MKcKV1SEIjnuqUuXlM/6B2DNet
 aKuCSSlJ4iItqE6K0l0vopV6VZxMeN+P3mivQidYc7upZdrFHYdPau0x2/zFIPjhVXY2
 4m2Ot0EwBfzHogqCz5hY3iO0L8qfdxNz646DWzk/TaW8JzPoGS5tZ7OhKOZOnhqi+F3Z
 NSPd1Soya+HoAuK/LGGRA3+N+YA++UFicvHDlhcTdsN9Nh1ZGJtbNO7cvE4OPUFNGN2P
 yWWj6IdohmTb3TgxxlicO1pmCZJ5ByOXYJ3e9yi0D0BarOJbWti4vH7pkZ9cRJWz9bnS
 PffA==
X-Gm-Message-State: AOAM533+VW4eo+n5ej0jPN4cWZAJ3RSeDNmmOG+/RUe51J/pqdKRbmQk
 8GJ55YKkCfVMva9QkIcLY5CElheamqAvfw==
X-Google-Smtp-Source: ABdhPJxip9d0UjixHBhU86QilRuaSDSHobz6nBzlhvVxhLTUIb6JGtpI1zvVkBrE4ADRwmeJoBiqpw==
X-Received: by 2002:a05:620a:13db:b0:62c:e591:fd9 with SMTP id
 g27-20020a05620a13db00b0062ce5910fd9mr6344278qkl.766.1645375879196; 
 Sun, 20 Feb 2022 08:51:19 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id n16sm3190995qkn.115.2022.02.20.08.51.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Feb 2022 08:51:18 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 05/11] 9p: darwin: Ignore O_{NOATIME, DIRECT}
Date: Sun, 20 Feb 2022 11:50:50 -0500
Message-Id: <20220220165056.72289-6-wwcohen@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220220165056.72289-1-wwcohen@gmail.com>
References: <20220220165056.72289-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::730
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=wwcohen@gmail.com; helo=mail-qk1-x730.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Greg Kurz <groug@kaod.org>, hi@alyssa.is,
 Michael Roitzsch <reactorcontrol@icloud.com>, Will Cohen <wwcohen@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Keno Fischer <keno@juliacomputing.com>

Darwin doesn't have either of these flags. Darwin does have
F_NOCACHE, which is similar to O_DIRECT, but has different
enough semantics that other projects don't generally map
them automatically. In any case, we don't support O_DIRECT
on Linux at the moment either.

Signed-off-by: Keno Fischer <keno@juliacomputing.com>
[Michael Roitzsch: - Rebase for NixOS]
Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
[Will Cohen: - Adjust coding style]
Signed-off-by: Will Cohen <wwcohen@gmail.com>
---
 hw/9pfs/9p-util.h |  2 ++
 hw/9pfs/9p.c      | 13 ++++++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
index d41f37f085..0e445b5d52 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -41,6 +41,7 @@ again:
     fd = openat(dirfd, name, flags | O_NOFOLLOW | O_NOCTTY | O_NONBLOCK,
                 mode);
     if (fd == -1) {
+#ifndef CONFIG_DARWIN
         if (errno == EPERM && (flags & O_NOATIME)) {
             /*
              * The client passed O_NOATIME but we lack permissions to honor it.
@@ -53,6 +54,7 @@ again:
             flags &= ~O_NOATIME;
             goto again;
         }
+#endif
         return -1;
     }
 
diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index caf3b240fe..14e84c3bcf 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -138,11 +138,20 @@ static int dotl_to_open_flags(int flags)
         { P9_DOTL_NONBLOCK, O_NONBLOCK } ,
         { P9_DOTL_DSYNC, O_DSYNC },
         { P9_DOTL_FASYNC, FASYNC },
+#ifndef CONFIG_DARWIN
+        { P9_DOTL_NOATIME, O_NOATIME },
+        /*
+         *  On Darwin, we could map to F_NOCACHE, which is
+         *  similar, but doesn't quite have the same
+         *  semantics. However, we don't support O_DIRECT
+         *  even on linux at the moment, so we just ignore
+         *  it here.
+         */
         { P9_DOTL_DIRECT, O_DIRECT },
+#endif
         { P9_DOTL_LARGEFILE, O_LARGEFILE },
         { P9_DOTL_DIRECTORY, O_DIRECTORY },
         { P9_DOTL_NOFOLLOW, O_NOFOLLOW },
-        { P9_DOTL_NOATIME, O_NOATIME },
         { P9_DOTL_SYNC, O_SYNC },
     };
 
@@ -171,10 +180,12 @@ static int get_dotl_openflags(V9fsState *s, int oflags)
      */
     flags = dotl_to_open_flags(oflags);
     flags &= ~(O_NOCTTY | O_ASYNC | O_CREAT);
+#ifndef CONFIG_DARWIN
     /*
      * Ignore direct disk access hint until the server supports it.
      */
     flags &= ~O_DIRECT;
+#endif
     return flags;
 }
 
-- 
2.35.1


