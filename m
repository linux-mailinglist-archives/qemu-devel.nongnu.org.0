Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC0E31C27A
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 20:33:11 +0100 (CET)
Received: from localhost ([::1]:33912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBjcM-0004Ao-It
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 14:33:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lBjXm-0002Wq-KN
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 14:28:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lBjXg-0006Xp-SE
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 14:28:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613417300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gEI3L3EmnEiaIH7fiI1VWypLhO2hZRfyOrIgMq8gEr4=;
 b=GeEtEabBXbPooP9SSpkSg+SN5lyRlNTqmw2dNb4iVx+Ss9dhZQc6kJAMvstgfvH3FPJo1U
 CiLolR0cJZ+Aih3dWvNU45l4/Gb/4u95SVUGCLee9FHe1AWniwCx5/4nk0v4RkRs27Gl6k
 rnePkZhA2+rc6I9J3180D06J1rQ5z4A=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-5J2K9-ISOuCCZEhGbLYFvQ-1; Mon, 15 Feb 2021 14:28:18 -0500
X-MC-Unique: 5J2K9-ISOuCCZEhGbLYFvQ-1
Received: by mail-wm1-f72.google.com with SMTP id s142so8393244wme.6
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 11:28:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gEI3L3EmnEiaIH7fiI1VWypLhO2hZRfyOrIgMq8gEr4=;
 b=VSxFzrMzO4kvTqEEUlphevsLgD0nwc4Q+rv155En3zjFF2jfzCIVO4wD7uV6u+dBsI
 PaDUjw5NP0vvtcSrvBLHVsuE7A0VQAiwwG68HGjCKNGoJnfpQxA3G7yPGHVRc1ij+zp7
 u1B6HTA/OrcNR6We2963K3BRB4131lJeg2eSTKQOYqb4rSUw4kgN0sipCLVtJVnbOTVk
 Yls2P/PVahGNY1UITbK6pnRKRNNHaDWhm/YZ0tZs7SwAuLcDlP21X0No7iDFZDH+hukU
 TgK9ffNLUESUjvL42wtcqYA4a+GLvs8qh9uOlDH3V90YmqFtGSctuyP6o99DrkeWiGiU
 uVsA==
X-Gm-Message-State: AOAM533TXzgTcBklOKqnu8l7sQmz5wQE8GZp4Kd2b4K29OVBz/4W0PIF
 4Agl0BGLs07sO8LZvs6nZ4nw4TbuFDbhOzfmSwpPWipXpwdiYv7qoCF8r/xkNUMH5FJC9Rtbzkz
 UhO9ujqBNzUlO92i/Re8m5c7KQmOoM8nPuw3GXKN6L2VhZjGVY/QKfoZZp6oeTKRj
X-Received: by 2002:a1c:c90c:: with SMTP id f12mr343146wmb.98.1613417297341;
 Mon, 15 Feb 2021 11:28:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw9FdQ4SpMAua4mvsr6kI7IjL6sWhCDG+VCoiwFCrb4W9/aHnEq6s/NgcNtGfIDuwOS7OsrMA==
X-Received: by 2002:a1c:c90c:: with SMTP id f12mr343131wmb.98.1613417297146;
 Mon, 15 Feb 2021 11:28:17 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id b72sm407566wmd.4.2021.02.15.11.28.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 11:28:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] gitlab-ci: Only push Docker 'latest' image when building
 default branch
Date: Mon, 15 Feb 2021 20:28:14 +0100
Message-Id: <20210215192814.989441-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While we are interested in building docker images in different
branches, it only makes sense to push 'latest' to the registry
when this is the project default branch (usually 'master').

Else when pushing different branches concurrently we might have
inconsistent image state between branches.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.d/containers.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index 90fac85ce46..52a915f4141 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -17,7 +17,7 @@
           -t "qemu/$NAME" -f "tests/docker/dockerfiles/$NAME.docker"
           -r $CI_REGISTRY_IMAGE
     - docker tag "qemu/$NAME" "$TAG"
-    - docker push "$TAG"
+    - test "$CI_COMMIT_BRANCH" = "$CI_DEFAULT_BRANCH" && docker push "$TAG"
   after_script:
     - docker logout
   rules:
-- 
2.26.2


