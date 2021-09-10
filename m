Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01835406E31
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 17:31:41 +0200 (CEST)
Received: from localhost ([::1]:34366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOiV8-00042l-MR
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 11:31:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mOiTG-0002Zc-I6
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 11:29:42 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:42498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mOiTB-0003E8-7g
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 11:29:42 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 u19-20020a7bc053000000b002f8d045b2caso1669032wmc.1
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 08:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MW3fC1QJokuCoNwZS8vs48aYPU9DJZvFHJ5dHbTTWls=;
 b=pBK0aw28Db4vPgAPRAE0ABnTSgNT3dG/WG/OyOjK0TMVpcSys28yA3Rc3EIb+Y2nuc
 ktuRQacMwrZ39y9gj1/XrdIY7mrp+5hJo9M7+qP22MjQZHc5VKSROxLio3lWCiv2WQ3a
 SMM75fc2ZbKx6BYiCFeQwUtDjHyZMJ3r38bfF7TQp+OXJ9stgsTw8nj7ZSI4atVMKLTR
 r4ouzSNu/SFRz/YlnlD1wL9EhSP4PCws0r1lTbvD4ghjlhNmOFCQqE4j1BPbbMo5IHR0
 3ECoOADiQ42OzCpeFEnR/zdttxxmo0iDHBNAmCyZz2o1BTpmVLvr1bx/WwTe0z0JNl/q
 I5nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=MW3fC1QJokuCoNwZS8vs48aYPU9DJZvFHJ5dHbTTWls=;
 b=blaCXtGpss2zYRX/yvlwDhtxt7bTcmQicdxHj1kWwrjzrHAG4xHiE9r9TaG/GSGxxJ
 wLrAUHu/b4FS7Y/BEgh2dtkha9Xvo5xkcWqiYCK86nz9j8MjVcXdz4CAmGh3zHK5Syn+
 8pYmeV+wo6Gmp/iqEHcQfO5o4CyD0O8yygyUde+hu8L/76ZJX6FPRVjt2mOZuxGWvEkH
 YrzziEZsmyT8FyaCg9qdU9L82ou0KMAayJOUE1EZ5qETIFTN4y/ylU4uLTk8dbp4jzs2
 w+Tk3Q+7gNNMIHV5UVRd0H5wp2rEqBGZl5zI40kR8c16wM01UPR+r/xMNYrH1OEHM/Cz
 50GA==
X-Gm-Message-State: AOAM530JtCJF7k75swWncGAXMA5MbG2vnZ7gStZxsNEt1RFgDk/Ykwem
 zgnhca2yNA+Uz9RwMJxPGmOu9FJL+iY=
X-Google-Smtp-Source: ABdhPJwHMoucqeAjTgFgG7Qe9By4IxbY/8A35z+vUqnjtypR7TnPaWJXg7FvkysrNp50Fn1j30ccNw==
X-Received: by 2002:a1c:7f83:: with SMTP id a125mr9045494wmd.166.1631287774978; 
 Fri, 10 Sep 2021 08:29:34 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id t7sm5466583wrq.90.2021.09.10.08.29.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 08:29:34 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [qemu-web PATCH] contribute: ask not to submit merge requests
Date: Fri, 10 Sep 2021 17:29:33 +0200
Message-Id: <20210910152933.468368-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com, berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, the bug reporting page has a paragraph about not sending patches
on the bug tracker, with a link to the patch submission guidelines.

However, now that the tracker is hosted on Gitlab it is more likely that
prospective contributors will submit a merge request linked to an issue,
rather than attaching a patch to the issue.  Update the language and,
since it is not limited to bug reports, move it to the main contribute
page.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 contribute.md              | 3 ++-
 contribute/report-a-bug.md | 2 --
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/contribute.md b/contribute.md
index cbb476d..4802452 100644
--- a/contribute.md
+++ b/contribute.md
@@ -15,7 +15,8 @@ permalink: /contribute/
 
 * Read developer documentation: &ldquo;[Getting started for developers](https://wiki.qemu.org/Documentation/GettingStartedDevelopers)&rdquo;,
   &ldquo;[Contributor FAQ](https://wiki.qemu.org/Contribute/FAQ)&rdquo;,
-  &ldquo;[How to submit a patch](https://wiki.qemu.org/Contribute/SubmitAPatch)&rdquo;,
   &ldquo;[Improve the website](https://www.qemu.org/2017/02/04/the-new-qemu-website-is-up/)&rdquo;
 
+Please do not submit merge requests on GitLab; patches are sent to the mailing list according to QEMU's [patch submissions guidelines](https://wiki.qemu.org/Contribute/SubmitAPatch).
+
 Contributing to QEMU is subject to the [QEMU Code of Conduct](https://qemu.org/docs/master/devel/code-of-conduct.html).
diff --git a/contribute/report-a-bug.md b/contribute/report-a-bug.md
index 922f699..807daf8 100644
--- a/contribute/report-a-bug.md
+++ b/contribute/report-a-bug.md
@@ -18,8 +18,6 @@ When submitting a bug report, please try to do the following:
 
 * Include information about the host and guest (operating system, version, 32/64-bit).
 
-* Do not contribute patches on the bug tracker; send patches to the mailing list. Follow QEMU's [guidelines about submitting patches](https://wiki.qemu.org/Contribute/SubmitAPatch).
-
 Do NOT report security issues (or other bugs, too) as "private" bugs in the
 bug tracker.  QEMU has a [security process](../security-process) for issues
 that should be reported in a non-public way instead.
-- 
2.31.1


