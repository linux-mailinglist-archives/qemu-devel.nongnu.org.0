Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C1C3BA50A
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 23:29:47 +0200 (CEST)
Received: from localhost ([::1]:56712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzQjK-00081o-WE
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 17:29:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1lzQfy-0002Kd-4G
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 17:26:19 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:41839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1lzQfw-0001Ov-Dm
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 17:26:17 -0400
Received: by mail-pf1-x42d.google.com with SMTP id c5so10214649pfv.8
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 14:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=t+Pe/eROmqykKa9dIoKt2kOQl5E0f+1/SQgnS/Y/Hus=;
 b=ULKOmpJSUxzzq90maatpQU7wqD0syneuKsD0gtljOMCEqKz8wd8KOWKT8AS6kk3Eff
 BZF7MConSj5Jh8h2Ln6uvrtxtRCqDTvFZgGBrNrg2jTdBdqYT8tDlGgp0d2gehQgMzoq
 EZziRhXj4YEJtcsm4Z2X4nmWViDLcgFeqmdBfVN2S33LcGoa8XFoHMUp2iVMsvhFyyQ6
 r1Pd7FvpCyQNpvwMFDisjv1puamJyUA1NBhSocZcxEvY56vJ5WBupEp/i2FDyAMi/z8l
 +OIHe2c9obS0o4hq75qeLpwMruiBWkTfwrROEsz4iGISrHZdCnMsK+uC2+B6gFGA9VdF
 sSXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=t+Pe/eROmqykKa9dIoKt2kOQl5E0f+1/SQgnS/Y/Hus=;
 b=YMTmMnNmOpGrj+VjVzlHJnbbtlH7dC6+oA218G5TwaWRHu42M1sksWXYf7xpV+fyEV
 ay2Pa0pt6tkDRW+GMx7K3kG7YpuACbK5nAusOoCNn2NpFkrU5KbTMeahiIVb/m8JbdVI
 Jt6hAJn/le+Bf3hoxmR35nSwBMVi5PyVt+ONTenWLG2cDNJ2+Ty6ZNJsCm6b1wshLhuJ
 zfVmoT7G5HZFOdYIlnwWK9LVJXZHfkUsrn+hc8QN4A6kXcL6l+OkYIV9DuFV35BFzvaU
 TLWPpllmJVSQUZn8bMR9RfcFMSCRM/66CLI/GQP+KxUgPdniOOOlCDNTeSkL40+UMc/O
 JNzg==
X-Gm-Message-State: AOAM530FF/dXHrin4V+/cebnFQPfxc1cVmOZwkjSAz/iw9rZpde2Fr+7
 1fnhhCt5G5OF6jmixdl0Lvc=
X-Google-Smtp-Source: ABdhPJyuPwelXI3CMKPzGy4hSeEKdgKEWl5831Cy56szIwNvShefO5NzjS0R4uX6Bq7YAOTZowTf3A==
X-Received: by 2002:a05:6a00:17a5:b029:305:d4e8:7391 with SMTP id
 s37-20020a056a0017a5b0290305d4e87391mr1644790pfg.0.1625261175321; 
 Fri, 02 Jul 2021 14:26:15 -0700 (PDT)
Received: from localhost.localdomain ([120.138.12.1])
 by smtp.gmail.com with ESMTPSA id o16sm71563pjw.51.2021.07.02.14.26.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 14:26:15 -0700 (PDT)
From: G S Niteesh Babu <niteesh.gs@gmail.com>
To: jsnow@redhat.com
Subject: [PATCH 2/6] python: Add dependencies for AQMP TUI
Date: Sat,  3 Jul 2021 02:55:59 +0530
Message-Id: <20210702212603.26465-3-niteesh.gs@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210702212603.26465-1-niteesh.gs@gmail.com>
References: <20210702212603.26465-1-niteesh.gs@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=niteesh.gs@gmail.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: G S Niteesh Babu <niteesh.gs@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Added dependencies for the upcoming AQMP TUI under the optional
'tui' group.

The same dependencies have also been added under the devel group
since no work around has been found for optional groups to imply
other optional groups.

Signed-off-by: G S Niteesh Babu <niteesh.gs@gmail.com>
---
 python/Pipfile.lock | 12 ++++++++++++
 python/setup.cfg    |  7 +++++++
 2 files changed, 19 insertions(+)

diff --git a/python/Pipfile.lock b/python/Pipfile.lock
index 8ab41a3f60..76cf1e4930 100644
--- a/python/Pipfile.lock
+++ b/python/Pipfile.lock
@@ -289,6 +289,18 @@
             "markers": "python_version < '3.8'",
             "version": "==3.10.0.0"
         },
+        "urwid": {
+            "hashes": [
+                "sha256:588bee9c1cb208d0906a9f73c613d2bd32c3ed3702012f51efe318a3f2127eae"
+            ],
+            "version": "==2.1.2"
+        },
+        "urwid-readline": {
+            "hashes": [
+                "sha256:018020cbc864bb5ed87be17dc26b069eae2755cb29f3a9c569aac3bded1efaf4"
+            ],
+            "version": "==0.13"
+        },
         "virtualenv": {
             "hashes": [
                 "sha256:14fdf849f80dbb29a4eb6caa9875d476ee2a5cf76a5f5415fa2f1606010ab467",
diff --git a/python/setup.cfg b/python/setup.cfg
index 1a552d672a..c62803bffc 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -44,11 +44,18 @@ devel =
     mypy >= 0.770
     pylint >= 2.8.0
     tox >= 3.18.0
+    urwid >= 2.1.2
+    urwid-readline >= 0.13
 
 # Provides qom-fuse functionality
 fuse =
     fusepy >= 2.0.4
 
+# AQMP TUI dependencies
+tui =
+    urwid >= 2.1.2
+    urwid-readline >= 0.13
+
 [options.entry_points]
 console_scripts =
     qom = qemu.qmp.qom:main
-- 
2.17.1


