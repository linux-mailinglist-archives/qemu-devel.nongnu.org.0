Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6644BCFFD
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Feb 2022 17:58:20 +0100 (CET)
Received: from localhost ([::1]:50542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLpXP-0004PM-G6
	for lists+qemu-devel@lfdr.de; Sun, 20 Feb 2022 11:58:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nLpQd-0007mN-63
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 11:51:21 -0500
Received: from [2607:f8b0:4864:20::f2c] (port=38779
 helo=mail-qv1-xf2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nLpQa-0000Ap-Al
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 11:51:18 -0500
Received: by mail-qv1-xf2c.google.com with SMTP id d3so26024398qvb.5
 for <qemu-devel@nongnu.org>; Sun, 20 Feb 2022 08:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YhmCSOC3CM9NyDHcskObyMbpau9QkFn/fvg6ws80gds=;
 b=EiEBAdDljolCWXWy9M+2Z4GkJsbihWVUwKDsGnpU21mxcXA+b+85BRThD/8lfRR21j
 TY5qvu7SfBPekim93Z+a0VRgr5CkreNP1Z1dzGlFCWEg9zd+DpjYtbt9Bf34OpYd/D3G
 HzUdNyo65O9qY8MkpKXfeOJ+G/n9zpqW17JojTLq6SRiAnZtpGY58btsESp8zk1NNMou
 hLQaMSyzY4eRUO35R84CUS3tzJ53IY946F2yQmhTJemi/ayOFCKvHh7QLsFCqGvSGgNI
 veLzzj6mQ/WCnpahqJ8gOjyMtqdpVMLncN61Yphd870u4FBtaSjizLP0/6zcerr2Wvbz
 txxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YhmCSOC3CM9NyDHcskObyMbpau9QkFn/fvg6ws80gds=;
 b=BgR23HLIBB2KOoSMKnoUp3LhlcExb8bXMEwJfQMUYjUnZetTY/bH1+YV63KYDPD24I
 KXg1+zg73u8vNxG6k2A/WRXGsTVlyJYYqIipVnADZVImUNqvcBNYGD8jY8crTQzyzXkT
 /K3QjGzSEYp6zh1uHJFui3IowU9m1ucMncUwgCkk4MLEb5tK2T3VtP7AQl3ZjVNqBVPu
 bpZs8+Q68XWyJ8MgCCSTG1jzGG8LZ5w+bx1RZaSv1pWl2iIYsCWDwhTY2xm2p60tKJkT
 FVyNA4tgUhrULfBrvImxXZw/oVuTM2s31vc+6Bk9QdRDC6OaucKrPWbWjamb9Uu2Y4PJ
 J3IA==
X-Gm-Message-State: AOAM530W6sfDpa/5koq47fALUlg3Re4vkRypbrs7WKupjl6FZLT/kM+W
 5FCWqaV1Q5DMyTI0m026YjxVMYpZJdkONw==
X-Google-Smtp-Source: ABdhPJxrkbAyuhf/xr7yh/B/e/Fyo3/buf0aQn0navRwcnXS+IJr8raalDRu71EYNC9gPXREl2w+3Q==
X-Received: by 2002:ad4:5187:0:b0:42c:4f21:b91b with SMTP id
 b7-20020ad45187000000b0042c4f21b91bmr12488778qvp.104.1645375874948; 
 Sun, 20 Feb 2022 08:51:14 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id n16sm3190995qkn.115.2022.02.20.08.51.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Feb 2022 08:51:14 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 02/11] 9p: Rename 9p-util -> 9p-util-linux
Date: Sun, 20 Feb 2022 11:50:47 -0500
Message-Id: <20220220165056.72289-3-wwcohen@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220220165056.72289-1-wwcohen@gmail.com>
References: <20220220165056.72289-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f2c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=wwcohen@gmail.com; helo=mail-qv1-xf2c.google.com
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

The current file only has the Linux versions of these functions.
Rename the file accordingly and update the Makefile to only build
it on Linux. A Darwin version of these will follow later in the
series.

Signed-off-by: Keno Fischer <keno@juliacomputing.com>
[Michael Roitzsch: - Rebase for NixOS]
Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
Signed-off-by: Will Cohen <wwcohen@gmail.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/9pfs/{9p-util.c => 9p-util-linux.c} | 2 +-
 hw/9pfs/meson.build                    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename hw/9pfs/{9p-util.c => 9p-util-linux.c} (97%)

diff --git a/hw/9pfs/9p-util.c b/hw/9pfs/9p-util-linux.c
similarity index 97%
rename from hw/9pfs/9p-util.c
rename to hw/9pfs/9p-util-linux.c
index 3221d9b498..398614a5d0 100644
--- a/hw/9pfs/9p-util.c
+++ b/hw/9pfs/9p-util-linux.c
@@ -1,5 +1,5 @@
 /*
- * 9p utilities
+ * 9p utilities (Linux Implementation)
  *
  * Copyright IBM, Corp. 2017
  *
diff --git a/hw/9pfs/meson.build b/hw/9pfs/meson.build
index 99be5d9119..1b28e70040 100644
--- a/hw/9pfs/meson.build
+++ b/hw/9pfs/meson.build
@@ -4,7 +4,6 @@ fs_ss.add(files(
   '9p-posix-acl.c',
   '9p-proxy.c',
   '9p-synth.c',
-  '9p-util.c',
   '9p-xattr-user.c',
   '9p-xattr.c',
   '9p.c',
@@ -14,6 +13,7 @@ fs_ss.add(files(
   'coth.c',
   'coxattr.c',
 ))
+fs_ss.add(when: 'CONFIG_LINUX', if_true: files('9p-util-linux.c'))
 fs_ss.add(when: 'CONFIG_XEN', if_true: files('xen-9p-backend.c'))
 softmmu_ss.add_all(when: 'CONFIG_FSDEV_9P', if_true: fs_ss)
 
-- 
2.35.1


