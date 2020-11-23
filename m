Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 553E62C0480
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 12:27:29 +0100 (CET)
Received: from localhost ([::1]:45076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khA0G-0001Be-8v
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 06:27:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kh9yI-0007nY-DR
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:25:26 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:41868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kh9yF-0004aH-4B
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:25:26 -0500
Received: by mail-wr1-x434.google.com with SMTP id 23so18184320wrc.8
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 03:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eB7R40ZSNFHnuB0T7CKSy384tKsxN5SWBmQnsqr6fkc=;
 b=GRT7fJwgYMP6M9Te8QBSWmp86uDS1j0/f4q4D+TKdFSfAEn+hghM9bW9fwpoCDJh2k
 mBLBN1tziJn+B85UV4j/cHHQY17tDNtdl5Jzd5kgsKa05W9O2dtAvqThaGBldbr9FbJa
 hPzFwAPWIRJVpjo5irH9CzDVxwnMifhaHrTQu5NIXKvLpddNSRk2O9HWFEW2ZSKJj016
 RAnmQ+yEmaFzmmcBFDv50MJrKCAwyg3JyAkLO5oUWTOoN+pj/Re6mpkkyI7RYWW6Ko2b
 F5/yoenAQpKTtda07/k/k5DiqgkfKBih0mkYfeXlROeLZ1Us8L3DbMe3PlB/9c2/p3DJ
 eruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eB7R40ZSNFHnuB0T7CKSy384tKsxN5SWBmQnsqr6fkc=;
 b=TehGitGULiWd7KufXe/G0lhofE7cxCeGRalZTGmPMqzJqW/wv9F8xyI0QHIGb15gB9
 24KyTxkyZNWNFr3E23qtwCm5RCp3ITzjefsLwMoP6S8HUbfjH+bJrg3PUwdAueVJ2Ll8
 yvIu+QtxjZzYMwpY/RtG6fTE+Mmd+un5TAXUNGhLd0p5JFlkRJjhDygK6cPBGofOoc7L
 qH0xcewR+FBlmh5eQ4tYm8epE7IEhWmQ5aBlNV5OVK3WkxUP1ZGTuv7zipNuqCJFcW5V
 mRPuFLi7uQq0N9TwO5hDU+wcbuz4c9X/274Kpxv6NESCPBYPeK+sZXC2MUHOWfpD3oX3
 xewA==
X-Gm-Message-State: AOAM533/Acza9wS+JoCV4dqzBDyQjXSxcBrdjnf4XvPlhWqD0ztQDWYz
 UCZ49/qQ0LrxvbNmARyXCEIAlA==
X-Google-Smtp-Source: ABdhPJzcQwwxdyPIiTARflt7nsT5Ohllgt516g2Y6zI8Gr71vGkXgI5M0zL7xSGdP1d2ChGjv0FMLg==
X-Received: by 2002:a5d:4f10:: with SMTP id c16mr6882418wru.39.1606130720418; 
 Mon, 23 Nov 2020 03:25:20 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f23sm15775140wmb.43.2020.11.23.03.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:25:19 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D83611FF87;
 Mon, 23 Nov 2020 11:25:18 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 1/7] scripts/ci: clean up default args logic a little
Date: Mon, 23 Nov 2020 11:25:12 +0000
Message-Id: <20201123112518.13425-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201123112518.13425-1-alex.bennee@linaro.org>
References: <20201123112518.13425-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This allows us to do:

  ./scripts/ci/gitlab-pipeline-status -w -b HEAD -p 2961854

to check out own pipeline status of a recently pushed branch.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20201117173635.29101-2-alex.bennee@linaro.org>

diff --git a/scripts/ci/gitlab-pipeline-status b/scripts/ci/gitlab-pipeline-status
index bac8233079..78e72f6008 100755
--- a/scripts/ci/gitlab-pipeline-status
+++ b/scripts/ci/gitlab-pipeline-status
@@ -31,7 +31,7 @@ class NoPipelineFound(Exception):
     """Communication is successfull but pipeline is not found."""
 
 
-def get_local_branch_commit(branch='staging'):
+def get_local_branch_commit(branch):
     """
     Returns the commit sha1 for the *local* branch named "staging"
     """
@@ -126,18 +126,16 @@ def create_parser():
                         help=('The GitLab project ID. Defaults to the project '
                               'for https://gitlab.com/qemu-project/qemu, that '
                               'is, "%(default)s"'))
-    try:
-        default_commit = get_local_branch_commit()
-        commit_required = False
-    except ValueError:
-        default_commit = ''
-        commit_required = True
-    parser.add_argument('-c', '--commit', required=commit_required,
-                        default=default_commit,
+    parser.add_argument('-b', '--branch', type=str, default="staging",
+                        help=('Specify the branch to check. '
+                              'Use HEAD for your current branch. '
+                              'Otherwise looks at "%(default)s"'))
+    parser.add_argument('-c', '--commit',
+                        default=None,
                         help=('Look for a pipeline associated with the given '
                               'commit.  If one is not explicitly given, the '
-                              'commit associated with the local branch named '
-                              '"staging" is used.  Default: %(default)s'))
+                              'commit associated with the default branch '
+                              'is used.'))
     parser.add_argument('--verbose', action='store_true', default=False,
                         help=('A minimal verbosity level that prints the '
                               'overall result of the check/wait'))
@@ -149,6 +147,10 @@ def main():
     """
     parser = create_parser()
     args = parser.parse_args()
+
+    if not args.commit:
+        args.commit = get_local_branch_commit(args.branch)
+
     success = False
     try:
         if args.wait:
-- 
2.20.1


