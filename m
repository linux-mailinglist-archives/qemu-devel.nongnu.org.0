Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3352ADFF6
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 20:43:35 +0100 (CET)
Received: from localhost ([::1]:48708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcZYE-0008JI-9H
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 14:43:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kcZF4-0002ZG-U9
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 14:23:47 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:34118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kcZEy-0007cd-Di
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 14:23:46 -0500
Received: by mail-wm1-x341.google.com with SMTP id 23so2640844wmg.1
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 11:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4bxNoNpIYS1T/aRH111mxpGinkwiUwBd/6PUA0HCz5Y=;
 b=yLUW3RcDI4qspd0U6HYrXHkLHQhVmITafMXMnTsjCDClvU/k8YdknhQ2P+0KVnKUG9
 WRxvfqUyOtXHqM2C/J/TDOy72DtKbo0LaiNdRmLXOTAOOq5CgupJ28DRVATENvl3UF1B
 v21lMQE25oEMi1pjSLzDdqNpX1forSe4dQs76gF2ANYPiXs7Z+PxWWJ6ONnxiQzlk8fu
 /TLcj/xdGD20iW61phkY1QWq/KdCHKLM0/fo3O18Y3zyL4PiAGYU5ms6W7J4IsysPDtH
 idcvqfs9OKijYJu/J7dYPHTWrg5Jj2HPn8K4qcetuk23/99TkXGKgPRtflu8F2oovzLl
 SN0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4bxNoNpIYS1T/aRH111mxpGinkwiUwBd/6PUA0HCz5Y=;
 b=HU4ARdUvY5iKRl2NZbdjowG0bmdZhm4SzZzmK6RlgUkMIcU3q5pRWxE6XRuiat81xE
 5tLZv9l114y5IwAqSO30RSRpufGWhwZOpJXOELMDMvpaw7L2IA73U9XIMFyYDwadyBbC
 TRXjcZQyY+2l8l7+xJCcZJg8NC2VAUG7XyseSC6fWnmkhfk44Zb1YohbT1LycIwwTyBX
 iV7ywahiTJdCOjuF30pIzg6PBgebkwXI6ANMtdN9tfYSZiJRLkTlNKsvX7O6GaR4yCJi
 tjce5dNyzsT1hVnZygAdljGzE1tcqeUOOrc6/u+RyZm9j9M6zfftYja4HADs0Q3ZZpN3
 d+fw==
X-Gm-Message-State: AOAM533RVB47e98DLA57rqATY1y/+geeHzdb0GMe+J28FxxSkCgOhxOf
 7XVsGjezc4kutpPP1KFjoOlsgg==
X-Google-Smtp-Source: ABdhPJwDSRx3QpwqBiQcG/lI9FY6FRSgbY4QO/g8nLTOeyzQHsnHlmpjHuVbO+W7GH9i+9HvNMXjdQ==
X-Received: by 2002:a05:600c:2282:: with SMTP id
 2mr751738wmf.154.1605036217038; 
 Tue, 10 Nov 2020 11:23:37 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o205sm4136738wma.25.2020.11.10.11.23.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 11:23:26 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3D8D81FF99;
 Tue, 10 Nov 2020 19:23:17 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 10/10] scripts/ci: clean up default args logic a little
Date: Tue, 10 Nov 2020 19:23:16 +0000
Message-Id: <20201110192316.26397-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201110192316.26397-1-alex.bennee@linaro.org>
References: <20201110192316.26397-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x341.google.com
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


