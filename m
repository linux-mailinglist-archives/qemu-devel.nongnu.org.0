Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E4345F5F1
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 21:35:02 +0100 (CET)
Received: from localhost ([::1]:53642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqhvw-00009X-JU
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 15:35:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mqhuY-0007ur-SW
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 15:33:34 -0500
Received: from [2a00:1450:4864:20::335] (port=38881
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mqhuW-0000Uy-Ns
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 15:33:34 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 p3-20020a05600c1d8300b003334fab53afso11506406wms.3
 for <qemu-devel@nongnu.org>; Fri, 26 Nov 2021 12:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ekmDm+D3liMVqm/vNaJDG9rINo8SFnexRabdDZVVm6Q=;
 b=TXFtZmZbssziEVTQacoG5brjlrjkWWoX957CzVEWchzQ23pNzS4pmcw9MvjtJEORc3
 P2tA35n92oqqUK2IdU2HO56lq8XEH1THBZYyEPi63YmBhlGMalY4dNuyuTMasW0Hx8ZO
 aAKnsQJCjkEzEECf2Qcem7Ja+z69YrI4jMxeDFEqun1o09CiEtJTBaL5zUFbSgN5iia4
 yEtkYMLXPqriNXr9DwHPFOy7EpgKeicrJsrBwqQzDujUIC5pS7K00Q3aXJqs9t9r1tH+
 d07mmX63EWkIYKXvdrx4WWzXWcUiTW8bawjltsaiyfR5QpbkEUJhlXU85F+jla8/Kd2S
 xlRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ekmDm+D3liMVqm/vNaJDG9rINo8SFnexRabdDZVVm6Q=;
 b=8IorhxloIsjcoOofCrb6YwyHiECk9uPjoslbSfCh1iSMESF2b6Kr8YKff9Ayt1LD9j
 Strd9cy7tgJRHbSzo4nl1rTD1hy5TtpgXb5zxjewovHK26gobg74xe5uEGd8DtdM1Y5g
 7DabmvRl0bfzhaplcOmOudHRxb8YUKyD45IG6JX2RoPqLjbgkWgYG8dy0vpyf0fbE4/6
 pMyorbi2VvU+r1+6Vs4OcS3U9tiZiv3xjNhiuBWqD9BZAEGf0f+ShSqJLeZxAo4FwMrb
 1SpRFY9ctEBrQ6r8VwEP3Ac0zRhA+ozccz62ujaHQlE/TOvF0DpiDKKvRgVWdBJjdsxm
 gA1w==
X-Gm-Message-State: AOAM5302B+ZrC3/YJSmAlZM0Rj/SEX56pF1gdblaDjO0u6cbegPJFFxo
 Hm4hhdImnrM9c6BiXlbJ0RFLFA==
X-Google-Smtp-Source: ABdhPJwayOg99H7ljAH/MUYA+gbvTCCIzWNz2ejuVXZ1C1/hA0LFYipnrjx5+3kaYIMMJM/2uHofJw==
X-Received: by 2002:a05:600c:1d0e:: with SMTP id
 l14mr17866887wms.64.1637958810377; 
 Fri, 26 Nov 2021 12:33:30 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y7sm6327624wrw.55.2021.11.26.12.33.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 12:33:29 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3C5281FF96;
 Fri, 26 Nov 2021 20:33:28 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] blog post: how to get your new feature up-streamed
Date: Fri, 26 Nov 2021 20:33:19 +0000
Message-Id: <20211126203319.3298089-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
Cc: pbonzini@redhat.com, thuth@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Experience has shown that getting new functionality up-streamed can be
a somewhat painful process. Lets see if we can collect some of our
community knowledge into a blog post describing some best practices
for getting code accepted.

[AJB: obviously RFC for now, need material for the end]

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 ...26-so-you-want-to-add-something-to-qemu.md | 100 ++++++++++++++++++
 1 file changed, 100 insertions(+)
 create mode 100644 _posts/2021-11-26-so-you-want-to-add-something-to-qemu.md

diff --git a/_posts/2021-11-26-so-you-want-to-add-something-to-qemu.md b/_posts/2021-11-26-so-you-want-to-add-something-to-qemu.md
new file mode 100644
index 0000000..d38c0ca
--- /dev/null
+++ b/_posts/2021-11-26-so-you-want-to-add-something-to-qemu.md
@@ -0,0 +1,100 @@
+---
+layout: post
+title:  "So you want to add a sub-system/device/architecture to QEMU?"
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
+
+New features != Fixing a bug
+============================
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
+====================
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
+====================================
+
+I don't want to repeat all the valuable information from the
+submitting patches document but I do want to emphasise the importance
+of responding to comments and collecting review and testing tags.
+
+While it usual to expect a maintainer `Reviewed-by` or `Acked-by` tags for any
+patches that touches another sub-system there is still the problem of
+getting reviews for your brand new code. Fortunately there is no
+approved reviewer list for QEMU. The purpose of review is to show that
+someone else has at least applied the patches and run the code. Even
+if they are not confident in reviewing the source a `Tested-by` tag
+gives confidence that the code works.
+
+<TBC - solicit feedback from the list>
-- 
2.30.2


