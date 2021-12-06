Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48594469877
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 15:17:44 +0100 (CET)
Received: from localhost ([::1]:58990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muEoI-00022H-Pd
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 09:17:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1muElN-0007vj-MR
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 09:14:42 -0500
Received: from [2a00:1450:4864:20::32b] (port=46852
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1muElK-0003dW-IR
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 09:14:41 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 c6-20020a05600c0ac600b0033c3aedd30aso7667623wmr.5
 for <qemu-devel@nongnu.org>; Mon, 06 Dec 2021 06:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KXjaE/UPLbyLkigjfpn9aqSzqkGY0RHziGRi2txavHg=;
 b=VMI8j6JEu8kbqwskcKXy9kCIFCeyff0SmFjJIw/gf7IbrpUW2lOncOsag1V/wYz2jA
 qRZ6hnucETxCmr4sfH9A4cXyrFmnMWkzSEymvJ1z/A94v7sI9SPHweRVdJvvcroIehRO
 r0mNY7q2MXqlKn9JGdrMls9VVZbgLYwm+tWlBCd6TSuxmjnGEedpMRoqphIVLrAo6t3D
 NgTgIkLo0NoSu0htSYVFfwlqjRT1tlo/Vqgnw/l/1PqkmPJRQMbSlXQpKVQyObFxTmG1
 mE3d3NTYTYpbaP2NtHFUuUtQzuHq/gSO/V/qiD2OsPslH2Ef1xXrCc7IKyXKCnLCELHN
 eCGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KXjaE/UPLbyLkigjfpn9aqSzqkGY0RHziGRi2txavHg=;
 b=7zXGqSMWsDAPrjSeNctH0MmNL/LDoxt7cqs2OjGiorPmLnfhhbQ62KHAcMfQ6ueUkj
 qN3FOTDmKbwyfK2HSvwtlJg+9xiEJc7ur9JTxp5T2XqU5dbmJt5/UD54vhBkHAXxxSrT
 GJdjcIQof0/AIE8GSTZfy7jUJP4NONX7bbNCkVSNsIodKStzcqTL0QM6CkT4ry+hOy9e
 Csl1G6m1VVrvNUpX1GyKJmjK15x37ovL4Ub35DMliC7ZrONW1BEQ2A+syB/+Z76GEqqJ
 Q9Wp+awGEh33iw6A5UMbYQi5v9Ebnfb7jvAksIGxydrP20u9/pvxjyoyn+aTPr+RJnZH
 FUqA==
X-Gm-Message-State: AOAM530w6vDmvvIdoGgx9BdWwONm2KwWfQzpF2a1Pld1fJTE19FjfqlP
 0Q76Ghom91uMfhUOXooYcCaviQ==
X-Google-Smtp-Source: ABdhPJxeBuXbi9KiP0y/x2dSODGFwh45wNQ6pHp3mPKhZ1KtDHx3bjfCQySMECXSFg5QxhSJ11cC0g==
X-Received: by 2002:a05:600c:1e26:: with SMTP id
 ay38mr39345569wmb.14.1638800076534; 
 Mon, 06 Dec 2021 06:14:36 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d7sm11167939wrw.87.2021.12.06.06.14.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 06:14:35 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B60A61FF96;
 Mon,  6 Dec 2021 14:14:34 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2] blog post: how to get your new feature up-streamed
Date: Mon,  6 Dec 2021 14:14:27 +0000
Message-Id: <20211206141427.2395324-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Experience has shown that getting new functionality up-streamed can be
a somewhat painful process. Lets see if we can collect some of our
community knowledge into a blog post describing some best practices
for getting code accepted.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - tweak the title
  - expand on requirements for series of patches
  - wrote a conclusion
---
 ...26-so-you-want-to-add-something-to-qemu.md | 150 ++++++++++++++++++
 1 file changed, 150 insertions(+)
 create mode 100644 _posts/2021-11-26-so-you-want-to-add-something-to-qemu.md

diff --git a/_posts/2021-11-26-so-you-want-to-add-something-to-qemu.md b/_posts/2021-11-26-so-you-want-to-add-something-to-qemu.md
new file mode 100644
index 0000000..6d855d9
--- /dev/null
+++ b/_posts/2021-11-26-so-you-want-to-add-something-to-qemu.md
@@ -0,0 +1,150 @@
+---
+layout: post
+title:  "So you want to add a new feature to QEMU?"
+date:   2021-11-26 19:43:45
+author: Alex Bennée
+categories: [blog, process, development]
+---
+
+From time to time I hear of frustrations from potential new
+contributors who have tried to get new features up-streamed into the
+QEMU repository. After having read [our patch
+guidelines](https://qemu.readthedocs.io/en/latest/devel/submitting-a-patch.html)
+they post them to [qemu-devel](https://lore.kernel.org/qemu-devel/).
+Often the patches sit there seemingly unread and unloved. The
+developer is left wandering if they missed out the secret hand shake
+required to move the process forward. My hope is that this blog post
+will help.
+
+New features != Fixing a bug
+----------------------------
+
+Adding a new feature is not the same as fixing a bug. For an area of
+code that is supported for Odd Fixes or above there will be a
+someone listed in the
+[MAINTAINERS](https://gitlab.com/qemu-project/qemu/-/blob/master/MAINTAINERS)
+file. A properly configured `git-send-email` will even automatically
+add them to the patches as they are sent out. The maintainer will
+review the code and if no changes are requested they ensure the 
+patch flows through the appropriate trees and eventually makes it into
+the master branch.
+
+This doesn't usually happen for new code unless your patches happen to
+touch a directory that is marked as maintained. Without a maintainer
+to look at and apply your patches how will it ever get merged?
+
+Adding new code to a project is not a free activity. Code that isn't
+actively maintained has a tendency to [bit
+rot](http://www.catb.org/jargon/html/B/bit-rot.html) and become a drag
+on the rest of the code base. The QEMU code base is quite large and
+none of the developers are knowledgeable about the all of it. If
+features aren't
+[documented](https://qemu.readthedocs.io/en/latest/devel/submitting-a-patch.html)
+they tend to remain unused as users struggle to enable them. If an
+unused feature becomes a drag on the rest of the code base by preventing
+re-factoring and other clean ups it is likely to be deprecated.
+Eventually deprecated code gets removed from the code base never to be
+seen again.
+
+Fortunately there is a way to avoid the ignominy of ignored new features
+and that is to become a maintainer of your own code!
+
+The maintainers path
+--------------------
+
+There is perhaps an unfortunate stereotype in the open source world of
+maintainers being grumpy old experts who spend their time dismissively
+rejecting the patches of new contributors. Having done their time in
+the metaphorical trenches of the project they must ingest the email
+archive to prove their encyclopedic mastery. Eventually they then
+ascend to the status of maintainer having completed the dark key
+signing ritual.
+
+In reality the process is much more prosaic - you simply need to send
+a patch to the MAINTAINERS file with your email address, the areas you
+are going to cover and the level of support you expect to give.
+
+I won't pretend there isn't some commitment required when becoming a
+maintainer. However if you were motivated enough to write the code for
+a new feature you should be up to keeping it running smoothly in the
+upstream. The level of effort required is also proportional to the
+popularity of the feature - there is a world of difference between
+maintaining an individual device and a core subsystem. If the feature
+grows in popularity and you find it difficult to keep up with the
+maintainer effort then you can always ask for someone else to take
+over.
+
+Practically you will probably want to get yourself a
+[GitLab](https://gitlab.com/qemu-project/qemu/-/blob/master/MAINTAINERS)
+account so you can run the CI tests on your pull requests. While
+membership of `qemu-devel` is recommended no one is expecting you to
+read every message sent to it as long as you look at those where you
+are explicitly Cc'd.
+
+Now if you are convinced to become a maintainer for your new feature
+lets discuss how you can improve the chances of getting it merged.
+
+A practically perfect set of patches
+------------------------------------
+
+I don't want to repeat all the valuable information from the
+submitting patches document but I do want to emphasise the importance
+of responding to comments and collecting review and testing tags.
+While it usual to expect a maintainer `Reviewed-by` or `Acked-by` tags
+for any patches that touches another sub-system there is still the
+problem of getting reviews for your brand new code. Fortunately there
+is no approved reviewer list for QEMU. The purpose of review is to
+show that someone else has at least applied the patches and run the
+code. Even if they are not confident in reviewing the source a
+`Tested-by` tag gives confidence that the code works.
+
+Any feature that only gets manually tested from time to time is very
+likely to break. If you are the only person who knows how to test
+something you will be the one left to identify when it broke. For this
+reason we have a wide arrange of testing approaches in the source
+tree. The guiding principle of our testing system is to make it easy
+for *any* developer to run a test from their command line using the
+existing build system. There are two types of test that are probably
+most important for a new feature.
+
+The qtest target (`make check-qtest-ARCH`) invokes a device emulation
+testing framework that involve starting an instance of QEMU and then
+controlling it via the QMP protocol. These tests allow you to ensure
+that QEMU can be started up cleanly with your new device model added.
+You can even trigger behaviour by sending a series of commands to the
+backend. Usually there is only a minimal amount of guest code running
+on the emulation itself.
+
+Our avocado tests are more of a black box whole system test. Here a
+QEMU instance is booted up with a full software stack (e.g. a
+distribution kernel and userspace). A lot of tests just check the
+combination successfully boots up although it is possible to trigger
+additional steps after the fact. Generally we prefer to use upstream
+distro kernels because it simplifies the hosting of artefacts but if
+custom images are needed that can be done to. We deliberately avoid
+hosting binary blobs in the QEMU infrastructure to avoid complications
+with licensing requirements so please ensure there are instructions
+for how to build them if needed.
+
+Finally any new machine or device should come with some documentation
+on how to enable and use it. QEMU's command line interface presents a
+dazzlingly large array of options and features which often require
+frontend and backend options to work together. If you want your
+feature to be usable by other users your series should include an
+addition to the fine manual describing some common configurations with
+some example command lines. 
+
+In conclusion
+-------------
+
+QEMU is a large multi-featured open source project with its fair share
+of dusty corners and a large amount of folk knowledge spread between
+over a hundred sub-system maintainers. While the project is keen to
+incorporate new features doing so has implications for the long term
+maintainability of the project. Incorporating those new features is
+easier when the project can be assured that the feature is well
+documented and easy to test for regressions. The ideal is for features
+to come with an active and engaged maintainer who can address patches
+and help get changes up-streamed in a timely manner. It's through the
+efforts of it's maintainers that QEMU remains the active and useful
+project that it is today.
-- 
2.30.2


