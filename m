Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDEA37BA41
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 12:23:21 +0200 (CEST)
Received: from localhost ([::1]:42346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgm1Q-00063n-I4
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 06:23:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lglzC-0003HH-O7
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:21:02 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:42752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lglzA-0003Yg-K8
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:21:02 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 4-20020a05600c26c4b0290146e1feccd8so2757058wmv.1
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 03:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=itDJZjFFgEhRSTkYYv8ljT67JkqTdrMRXTGjjJSCeDY=;
 b=FvRdj5OiLxfzxL5ZlmpkLUyY3w7NNegSF+WNrcflIt0m0cz2BKNfWQIYMFuGQGP1po
 CnICvdpnFpuRQwnGA1Po5iqSBCVEOVfPBGuZyG/82CnIC3Qf30+vccrJ5doutHH8meYJ
 rMIgYksvXJN1GTMCXW0zgdMwGnx3hyQ+Cwe7J/m1QRzN9qgCSMBAwFRBOMDPdtAqAYtS
 Sxk2Q4sxO7OrAhUd23suSetfrAfA7FJfeT9sCV33RhjB6n5K+3ELzHciyyhd+VZWHFt4
 SIqj9PcTPlCFyeOL0vaW4sOGvyz7NGsTKu6y45IqUj8IvzTGx8tJ1zbFmWxM2LIAjKBp
 SWYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=itDJZjFFgEhRSTkYYv8ljT67JkqTdrMRXTGjjJSCeDY=;
 b=BlIF91gCIBjb36SVuAHCUVxZLhMNZkuuLftelatIbX62MEqoOwBdYD36G+1K4QVn62
 AlHrHx7nZfFEzN7fCtUaH0RNrWl+gUr7/QS48+MN82WJzSFxEluYKXsvos6iutWZ6q4T
 3Ez8zKTDdl0Km5MXl6OLDl3vEqi9ZtC9nY2+3vwUSlKVGSiFn6k50FwmYfnYbNsozHsL
 pzThZArEJeuZvyJZcVshOfKP3fXw3ZqgP152jMVI7VvVkZgIdNZOwHh5x+CZIJgPcRyT
 SP9+u6sDB7A6IS7NkRuYJ0V02qzeo+X8dtIl0zfEWELTzod7fOEXGv0zEGw9EtWjDyXc
 54ew==
X-Gm-Message-State: AOAM5305pG7YoML631kuzwE6pH4aLTRz9q9hk+9QcvAXLyco/FkUb2ua
 2LfmVA8ngh3QzceR6mRK5C9kCQ==
X-Google-Smtp-Source: ABdhPJy1U5wIcdtGyh9Z8bvUudQnJb9T5q0OEFc32uRj0AhYFrvDjwJG3GMhS/2T2fyHnESJeJXmog==
X-Received: by 2002:a7b:cd98:: with SMTP id y24mr11014321wmj.4.1620814859211; 
 Wed, 12 May 2021 03:20:59 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s7sm5659562wmh.35.2021.05.12.03.20.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 03:20:56 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7D98A1FF90;
 Wed, 12 May 2021 11:20:51 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/31] tests/docker: allow "update" to add the current user
Date: Wed, 12 May 2021 11:20:24 +0100
Message-Id: <20210512102051.12134-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210512102051.12134-1-alex.bennee@linaro.org>
References: <20210512102051.12134-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 f4bug@amsat.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The current user functionality is used for cross compiling to avoid
complications with permissions when building test programs. However
for images that come from the registry we still need the ability to
add the user after the fact.

Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/docker.py | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/tests/docker/docker.py b/tests/docker/docker.py
index 9b3425fec2..7a14058801 100755
--- a/tests/docker/docker.py
+++ b/tests/docker/docker.py
@@ -517,7 +517,7 @@ def run(self, args, argv):
 
 
 class UpdateCommand(SubCommand):
-    """ Update a docker image with new executables. Args: <tag> <executable>"""
+    """ Update a docker image. Args: <tag> <actions>"""
     name = "update"
 
     def args(self, parser):
@@ -525,6 +525,9 @@ def args(self, parser):
                             help="Image Tag")
         parser.add_argument("--executable",
                             help="Executable to copy")
+        parser.add_argument("--add-current-user", "-u", dest="user",
+                            action="store_true",
+                            help="Add the current user to image's passwd")
 
     def run(self, args, argv):
         # Create a temporary tarball with our whole build context and
@@ -564,6 +567,13 @@ def run(self, args, argv):
 
             df.write(u"ADD . /\n")
 
+        if args.user:
+            uid = os.getuid()
+            uname = getpwuid(uid).pw_name
+            df.write("\n")
+            df.write("RUN id %s 2>/dev/null || useradd -u %d -U %s" %
+                     (uname, uid, uname))
+
         df_bytes = BytesIO(bytes(df.getvalue(), "UTF-8"))
 
         df_tar = TarInfo(name="Dockerfile")
-- 
2.20.1


