Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 624CC2DFD1C
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 15:59:00 +0100 (CET)
Received: from localhost ([::1]:49590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krMeJ-000497-Ca
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 09:58:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMQo-0004lr-Eu
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:04 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:55812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMQm-0007fZ-9P
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:01 -0500
Received: by mail-wm1-x32d.google.com with SMTP id x22so10079607wmc.5
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 06:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2fomZcDwuRjLMH3gjrlh4DIWTPodHY5A219wPcf777M=;
 b=OBIrY0aVc/+2/T+4EkybKrzDeOTg0PthncdzQ4//0lZXDwq4bAGBKeUQfw9t+k3+Iy
 p2i4PgNx1EHZwvF/VBFGSqbk7qdMXAVENJm1nl8KBUZw7WLc5tl6+cF/AhTQwewOt9a8
 biFxqOGae6T12gGCZImdY4Aatkf1ZSdTo3xoIuO9yoUtmBYhPkrySbmxyM1Y0nNDNvkM
 VT54Smf50S22HW48hXkXZ72Qqs6xXGC4O6gvv95VwX5xitM83uRkMig+zCLK12OReXVO
 dR7ZnAJ83ZvUmXuyrnqS2yi8csgloaKe9RlVcRzp2S494SdbwJQTiRKHzltDPrO7lD3H
 4zxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2fomZcDwuRjLMH3gjrlh4DIWTPodHY5A219wPcf777M=;
 b=ALxWFf9lMc3U1AVi8QB8mMU3oko+cpiFiulSKAre7t1tBX9zG0VlgdWNqElLOuj34u
 zqeBLvEtyOZFeZVFK5QHwU7o0RisAPtzka0L96Q1paqJ3gEHigZE864YiRrWes6YQ/EE
 KNwRsl/y0INiZGh/jmuTA+Y47wxTgAdVrXMXgoyitWf3bFY3vIaCYw5niWlrMVRnDpN2
 nnE1bVMwTpDJCGumCp/Islt7CgDLOfJbYTL15dVUFypDSvpm8fWJtKC1skpdZItRz1Fi
 WdD6fopmSuxUjI3c9Irp4SWHVytzk3iyr+eGFFMCVEz25s9m9zexsVg3ZEOKJdfMF/Uw
 r6UQ==
X-Gm-Message-State: AOAM531EAvfL9SuHIBLX7z/E7K/LOB5kY6h77CANNgCc7jsar2OGBxlH
 AZvUdZUEGD2lNiNYOnUR0nOwWg1fDRc=
X-Google-Smtp-Source: ABdhPJxaxTBtQuZ+6wjpOWrjPibFK4bW9qVjkpU70XKZxak4T63p8JqYbjXapOXuqItj+0ksmDPDKQ==
X-Received: by 2002:a05:600c:2188:: with SMTP id
 e8mr17074879wme.99.1608561898582; 
 Mon, 21 Dec 2020 06:44:58 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l5sm27439627wrv.44.2020.12.21.06.44.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 06:44:58 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/55] tests: update for rename of CentOS8 PowerTools repo
Date: Mon, 21 Dec 2020 15:44:02 +0100
Message-Id: <20201221144447.26161-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221144447.26161-1-pbonzini@redhat.com>
References: <20201221144447.26161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

This was intentionally renamed recently to be all lowercase:

https://bugs.centos.org/view.php?id=17920
https://wiki.centos.org/Manuals/ReleaseNotes/CentOS8.2011#Yum_repo_file_and_repoid_changes

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20201216141653.213980-1-berrange@redhat.com>
[AJB: bump up FROM to trigger re-build, add diffutils]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/centos8.docker | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index 54bc6d54cd..64cb7a6eda 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -1,4 +1,4 @@
-FROM centos:8.1.1911
+FROM centos:8.3.2011
 
 RUN dnf -y update
 ENV PACKAGES \
@@ -6,6 +6,7 @@ ENV PACKAGES \
     bzip2 \
     bzip2-devel \
     dbus-daemon \
+    diffutils \
     gcc \
     gcc-c++ \
     genisoimage \
@@ -31,6 +32,6 @@ ENV PACKAGES \
     zlib-devel
 
 RUN dnf install -y dnf-plugins-core && \
-  dnf config-manager --set-enabled PowerTools && \
+  dnf config-manager --set-enabled powertools && \
   dnf install -y $PACKAGES
 RUN rpm -q $PACKAGES | sort > /packages.txt
-- 
2.29.2



