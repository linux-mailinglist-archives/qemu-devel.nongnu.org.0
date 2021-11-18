Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0A545560A
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 08:49:16 +0100 (CET)
Received: from localhost ([::1]:50322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mncAV-0004FD-20
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 02:49:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mnc8V-0002na-U6
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 02:47:11 -0500
Received: from [2a00:1450:4864:20::532] (port=43661
 helo=mail-ed1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mnc8Q-0005vl-Db
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 02:47:09 -0500
Received: by mail-ed1-x532.google.com with SMTP id w1so22920816edd.10
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 23:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AgKa/CKBUNp66MBNd/qhg7I1CTM9WLa/WnuzI3iXFAo=;
 b=SfggRuIuI4Zl9sWlXVF5t7aCPsqiEka4XlizH7L1ooXZl9D36HOZVrEV2I9etWMybr
 VHFwBZq9453E5axk9Wh6Xl/muwsVawwf8AZwWx8JYIIMDnOE655Rg49vRCie+kvOIc5B
 ttdWBWTRxAWLXMXjwroB8wpAC41UvPUGtqYxVRELPQ98mAEmrNvPCKEwmQY6SxL9OEws
 F2Xwg4PK1Fp9xK4xF8Vnk7urgYo5scBq9zzRd83PEAbZb4Y/5XE8eTs8a5IfQ5/t71cB
 IzlCvCo0DmIi8QuK6TIGSD/XLfGp2cy4xgfyejJj9CH53V7qIBym8g3zZZgPO5fP7Pmo
 d+hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=AgKa/CKBUNp66MBNd/qhg7I1CTM9WLa/WnuzI3iXFAo=;
 b=2V72Nz6IROSGLfzRo3x7p84dk2u721BanTLJYgSp3bdI+k0cntLLGxOjzP8FcvDEp4
 QrYI2kyXpDsbs6KMEdE5HQi/rdot0luBIrQwDiA8CNcz/BuOB1A3/vPETX+cCt9XsNQs
 HLSVKK1n62ckSQB03bBatDLO5uOO3QOuixWuCJFriB7TBEfp/eftventbHneTcCh6b9h
 HvmP+/kOTGSD9X/CDJ0ti0bDkpXsYEk+IV9auifujuRKNWacqQW0LmvOqhEVHqOQPt6O
 4SzW2/13i/u0dkNzuajU1WFc2bDM/lSa3bnm9Y6uk0Sp4pCbePTO8988ONy/EubcUhv1
 sFwg==
X-Gm-Message-State: AOAM533rz9TFVKSZe3le7z8+s9LoUPlSRoEAlMESGxGIOdSTkwR7R2uh
 oV6x9dLNBRU0MrsaUwKK6KbWAt8OjQU=
X-Google-Smtp-Source: ABdhPJwxhGC7+SrIeLMpA/bfDIYGQhksWu1spQSAEbxh3tw0doHxMqnqE52BJwdTj3fn3tJcSEnz2w==
X-Received: by 2002:a05:6402:26cb:: with SMTP id
 x11mr7061956edd.149.1637221624768; 
 Wed, 17 Nov 2021 23:47:04 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 z7sm1148876edj.51.2021.11.17.23.47.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 23:47:04 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [qemu-web PATCH] update links to the SubmitAPatch wiki page
Date: Thu, 18 Nov 2021 08:47:02 +0100
Message-Id: <20211118074702.216951-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::532
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The page is now part of the documentation, but it also has a redirect
in the qemu.org web server to provide a stable URL.  Use it instead
of linking out to wiki.qemu.org.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 CONTRIBUTING.md            | 2 +-
 contribute.md              | 2 +-
 contribute/report-a-bug.md | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
index d5cbf07..6edc07b 100644
--- a/CONTRIBUTING.md
+++ b/CONTRIBUTING.md
@@ -12,7 +12,7 @@ You should also CC the website maintainers:
 
 For further guidance on sending patches consult:
 
-https://wiki.qemu.org/Contribute/SubmitAPatch
+https://qemu.org/contribute/submit-a-patch/
 
 It is expected that contributors check the rendered website before submitting
 patches. This is possible by either running jekyll locally, or by using the
diff --git a/contribute.md b/contribute.md
index 4802452..856e434 100644
--- a/contribute.md
+++ b/contribute.md
@@ -17,6 +17,6 @@ permalink: /contribute/
   &ldquo;[Contributor FAQ](https://wiki.qemu.org/Contribute/FAQ)&rdquo;,
   &ldquo;[Improve the website](https://www.qemu.org/2017/02/04/the-new-qemu-website-is-up/)&rdquo;
 
-Please do not submit merge requests on GitLab; patches are sent to the mailing list according to QEMU's [patch submissions guidelines](https://wiki.qemu.org/Contribute/SubmitAPatch).
+Please do not submit merge requests on GitLab; patches are sent to the mailing list according to QEMU's [patch submissions guidelines](/submit-a-patch/).
 
 Contributing to QEMU is subject to the [QEMU Code of Conduct](https://qemu.org/docs/master/devel/code-of-conduct.html).
diff --git a/contribute/report-a-bug.md b/contribute/report-a-bug.md
index 96b60d8..8d7d371 100644
--- a/contribute/report-a-bug.md
+++ b/contribute/report-a-bug.md
@@ -18,7 +18,7 @@ When submitting a bug report, please try to do the following:
 
 * Include information about the host and guest (operating system, version, 32/64-bit).
 
-QEMU does not use GitLab merge requests; patches are sent to the mailing list according to QEMU's [patch submissions guidelines](https://wiki.qemu.org/Contribute/SubmitAPatch).
+QEMU does not use GitLab merge requests; patches are sent to the mailing list according to QEMU's [patch submissions guidelines](../submit-a-patch).
 
 Do NOT report security issues (or other bugs, too) as "confidential" bugs in the
 bug tracker.  QEMU has a [security process](../security-process) for issues
-- 
2.33.1


