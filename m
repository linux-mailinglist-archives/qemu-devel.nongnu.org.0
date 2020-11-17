Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EA32B6BEB
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 18:38:44 +0100 (CET)
Received: from localhost ([::1]:53074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf4wF-0003bF-4I
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 12:38:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kf4uK-0001jW-L1
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 12:36:44 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:41407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kf4uH-0006LX-GC
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 12:36:44 -0500
Received: by mail-wr1-x442.google.com with SMTP id 23so24001434wrc.8
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 09:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4bxNoNpIYS1T/aRH111mxpGinkwiUwBd/6PUA0HCz5Y=;
 b=GycsO4oXG89OE+ilq+k6SXEfNbo5UOZqO1xvAozCW8RpFfIxS06ktkpZZdpk+0QVsF
 FxWB2pRVqVPegaXXwSfVlOVovQ7d8XPWuPVRr3Gf7Int6fZbi2QEj9uXvMjvrNY4Eaj6
 kALkcJZwWBtzEazRvQbRRAHBbUSX3WOy2dKm5NwNw/bztVkRiVst3xj49Dn2ceMC2NjX
 E8No2qOnpcX2XpNuXn8vOYTvOJIvC97PsYH2wdhFIfgmjqVahj8hMUujPLScK8exhbI/
 sDHk5eftbpU5aK3CpY7CcLMuAK4JNBCPKVVybpuoMfgZN14YeEsqb9yCpXIVhKDpXhAw
 isIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4bxNoNpIYS1T/aRH111mxpGinkwiUwBd/6PUA0HCz5Y=;
 b=etj5ZXDm8DPI2MVXAwogUo0DgplZ8854djHlCrH1+Hv361NR3Xf48tirzav9+CRN75
 k7abzoUaLHOGAcBO7ylz3oUdV27oEwn67KKDmEOQhXUWTJss2ZeQXIiGlFBCmADa8hCf
 GiBee/CCbZUCB8bitTNWXCLqOqyUAjVKXc2XoweZpgEqDvYVjjBR430K69S8UIKzqhsQ
 rrc1CQ9W4BEUAz/7KHCPfkQqeyB3XrJGXQIj5EgnIwaRqTf0uJPd15YNc8cHhNwJaPcp
 Rn1Ys/4efuReq3WAthM9aV95ZDhAgRholsKKy4DVmkVYR6oWIFT93j8mJ9Bw/Re5rdam
 zKww==
X-Gm-Message-State: AOAM532DbxLhZ7GlFh4ayJrjtJHYYOzRwaY8jWHTKy57/q1x9C/ZCXhs
 bu9DgTRUII+maIgs0r0Xc179WQ==
X-Google-Smtp-Source: ABdhPJwSAaxdXXIf9I8bzNGohOEYcBKNNd5aY+1m9T029pQY1vYIADiw1yHDQG/rW8XKpTihmkUVmQ==
X-Received: by 2002:adf:eacb:: with SMTP id o11mr681631wrn.208.1605634598189; 
 Tue, 17 Nov 2020 09:36:38 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u85sm4831302wmu.43.2020.11.17.09.36.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 09:36:36 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 731F31FF87;
 Tue, 17 Nov 2020 17:36:35 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 1/6] scripts/ci: clean up default args logic a little
Date: Tue, 17 Nov 2020 17:36:30 +0000
Message-Id: <20201117173635.29101-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201117173635.29101-1-alex.bennee@linaro.org>
References: <20201117173635.29101-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This allows us to do:

  ./scripts/ci/gitlab-pipeline-status -w -b HEAD -p 2961854

to check out own pipeline status of a recently pushed branch.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 scripts/ci/gitlab-pipeline-status | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

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


