Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B773906C0
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:37:05 +0200 (CEST)
Received: from localhost ([::1]:52612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lla3E-0004ku-Qg
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:37:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llZ8y-0002nk-RE
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:38:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llZ8v-0008EA-N0
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:38:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621957132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Vj5nfejW97Fwg5oWuXmhEqgsWECOnE2D7lKo/vxmaNE=;
 b=EeCtKU1BD237PiKnx4iMyfHP8WCh+K6nI68BZhtbCLfi2SalVeYKXqZvMaUxuSPEvC/WhE
 70nF4aq6DjzfBf9/IDMgYEWigAd3u61h2f1KRPkmO2RstuHqyN2ksT+Fi0O7xnRIc4Mj8X
 xwocqa6LIuTUfkV+PPdy3ZJ/nuwB2Pc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-HNhJMajxMryVZdmBYlKLDw-1; Tue, 25 May 2021 11:38:50 -0400
X-MC-Unique: HNhJMajxMryVZdmBYlKLDw-1
Received: by mail-wr1-f72.google.com with SMTP id
 x10-20020adfc18a0000b029010d83c83f2aso14720717wre.8
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:38:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Vj5nfejW97Fwg5oWuXmhEqgsWECOnE2D7lKo/vxmaNE=;
 b=oaqIRGQgb89E+PA/dJTzzZ5g5pualBwKMtYmBAYpelybE5Y0MNt/HgTBQO6dEx464o
 Dss/RsDBlNWJo0roAKq07IMxQFoAhm8hw2bboHSHZfHZlK6p3Cy2ddcBB7vIR+dJmGMv
 nUi8+3O6PfxOFKfNQKZ2bmihB3Vn6CXRqGsHfIbME80WRtZKJNQD/q7pVIMhx6vHl5mH
 5rHNKxP2/1qfB/ogUA6p3kRyUXFuKCpl3gqo6AQwSzLdbBLJtiFXMCzrGZi8DHGruQi2
 nTmn7yOlK2lZ+R7+6E4mw2LR3LlOZVui+Gs/Pyh6nUyELcIwbJN5osuBUPhM0Kwj6bz0
 2Pyg==
X-Gm-Message-State: AOAM531fzF7/aRn+vV4a6wtJ8j6Wo960mTR4T4k597qWaxG3XRbQM3qU
 T/zYNmq1Y09CNu9LcZ2/AREUKjcQmYNqUm9o6r32h1DCP/H5xBWW82MJXuMzRYlgTsSjH1RhUx3
 IVb9FSLLvyjeWu4HmR7GJceEnfwUdyHcOjfJf8AgqCz8NFoApq3Qp6e7yZEEVx5k1
X-Received: by 2002:a1c:f019:: with SMTP id a25mr25249221wmb.64.1621957128002; 
 Tue, 25 May 2021 08:38:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyw9ajOUfUDP0fjkrHO4aIY5sUc6FzhaYU5xLlf/9P7+KFn+hnPTeNnD9UrVi7/nrIQdafwGQ==
X-Received: by 2002:a1c:f019:: with SMTP id a25mr25249188wmb.64.1621957127691; 
 Tue, 25 May 2021 08:38:47 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id o21sm16205380wrf.91.2021.05.25.08.38.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:38:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] gitlab-ci: Be ready for new default 'main' branch name
Date: Tue, 25 May 2021 17:38:25 +0200
Message-Id: <20210525153826.4174157-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Savitoj Singh <savsingh@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In order to be ready for the GitLab changes in using inclusive
terminology (replacing the 'master' branch name by the 'main'
branch name), rename our use of 'master' by the $CI_DEFAULT_BRANCH
environment variable, so new forks won't be facing any issue.

References:

- https://sfconservancy.org/news/2020/jun/23/gitbranchname/
- https://about.gitlab.com/blog/2021/03/10/new-git-default-branch-name/

Suggested-by: Savitoj Singh <savsingh@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index f718b61fa78..db4e8490483 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -784,7 +784,7 @@ check-patch:
   script: .gitlab-ci.d/check-patch.py
   except:
     variables:
-      - $CI_PROJECT_NAMESPACE == 'qemu-project' && $CI_COMMIT_BRANCH == 'master'
+      - $CI_PROJECT_NAMESPACE == 'qemu-project' && $CI_COMMIT_BRANCH == $CI_DEFAULT_BRANCH
   variables:
     GIT_DEPTH: 1000
   allow_failure: true
@@ -797,7 +797,7 @@ check-dco:
   script: .gitlab-ci.d/check-dco.py
   except:
     variables:
-      - $CI_PROJECT_NAMESPACE == 'qemu-project' && $CI_COMMIT_BRANCH == 'master'
+      - $CI_PROJECT_NAMESPACE == 'qemu-project' && $CI_COMMIT_BRANCH == $CI_DEFAULT_BRANCH
   variables:
     GIT_DEPTH: 1000
 
-- 
2.26.3


