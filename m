Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9DB37287F
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 12:10:38 +0200 (CEST)
Received: from localhost ([::1]:54672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lds0j-0002fE-Aa
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 06:10:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ldrsx-0002RV-RG
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:02:35 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:34617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ldrsv-00036w-Uf
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:02:35 -0400
Received: by mail-wr1-x431.google.com with SMTP id t18so8721833wry.1
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 03:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=itDJZjFFgEhRSTkYYv8ljT67JkqTdrMRXTGjjJSCeDY=;
 b=fuol/klHlzEuMSO1cf/52mqJCEFgJ7RwJXfDanShmWtj5GNpnS0unFZxsO0ehtNzLZ
 qkTHfD0+DD7a9d42StBBIVoC6pHZ6OEliRG3jqVN2JPM2oarmLOavwg5KIwzuWTqtnwn
 zjf4zZt5tfnZNbs8GS5wlBSMVDWVvU6WTDvwnwQtwQGwTHn5wTMXF9V6pztrBJd3hgUU
 H+j39pI7rSOjN9iV4uwxbsHyt5fq/RPVwReOAwyEgGsVTG0oUF4u+z6jdwoOEtu28iD0
 tEZR60KbttsFvJ6LBDNZ8kGnJ1foRAtxG9bTaxiVYL8VddMFjHCUo3kXeY2JRYFCieY8
 3fUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=itDJZjFFgEhRSTkYYv8ljT67JkqTdrMRXTGjjJSCeDY=;
 b=aLYnLpGRpq0EiR1CAZDV5cjGFDvgFByzL+gYOl7WJhPQoVRM+t82M1KSTf00uuBzjw
 4dc4wqVgyHSqsLuGaghf9EZ2EIpsLscB6LiOuLD7NxhsGEea4xeXAR7SZ2BAa0TVFOMz
 fG9EaKf2yHskTXfmyJcCnq3/b0jcPw6/tke3nEABSF7JI+Xau10qZzULMa6yBP2ANaiH
 IJ+9SM5K4pV/ifBiZNVSvmanmvf2wEFJ0UbKnJR6lsKaGHGJGTF9qrDVdkebO8tdrEIL
 08kqZuaWVeWROBDEfVz7F2eqxASXjZ98OC3XhIC82TvrH2o+L1iKBqHoQc5C1j6Dv9p2
 gShg==
X-Gm-Message-State: AOAM533zFhaOSXMQhUHzs4Dao0vv9ztrAx9slk6eVdfn1r2+5ApBxdiv
 k7igSlcAk8vvyLZaW5cg94d7lA==
X-Google-Smtp-Source: ABdhPJwCL4B/PLthMEj/bRycw+SDCnH/HDAkxoES/rBQOp1ooTt3QHCymvqKbwE60rUKDycdfhyZIg==
X-Received: by 2002:a5d:678b:: with SMTP id v11mr30127592wru.219.1620122552593; 
 Tue, 04 May 2021 03:02:32 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f18sm1812889wmg.26.2021.05.04.03.02.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 03:02:29 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E3FD11FF90;
 Tue,  4 May 2021 11:02:23 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/30] tests/docker: allow "update" to add the current user
Date: Tue,  4 May 2021 11:01:57 +0100
Message-Id: <20210504100223.25427-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210504100223.25427-1-alex.bennee@linaro.org>
References: <20210504100223.25427-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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


