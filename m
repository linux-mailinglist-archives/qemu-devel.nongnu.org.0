Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B735B6F712F
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:38:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pucom-0007Kn-Ml; Thu, 04 May 2023 13:32:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1pubAH-0006OH-1r
 for qemu-devel@nongnu.org; Thu, 04 May 2023 11:46:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1pubAF-0004jd-Iz
 for qemu-devel@nongnu.org; Thu, 04 May 2023 11:46:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683215199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xzoXzppR2fwEvCJm4gqIZYVt1zy/5vbq707Ih0qVaLU=;
 b=Z+Vo/ONm2q9HUJyoyzXecNlX5TjY3yRDf95dTXfOIjctvI6VFyOLBId3prP9plXErwg+SB
 Q+95W9cHQQX3NsrAe3SAWgsEFt+c1a6s2PVgqQ7DsW+GxN2U0Gavn74rigdic3Si2+nXC3
 NaBOQZ57aT0cKjYFq5AgFJpzTDEMqgc=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-130-6Q3IK-tHPSqHBeQUqEAmqQ-1; Thu, 04 May 2023 11:46:38 -0400
X-MC-Unique: 6Q3IK-tHPSqHBeQUqEAmqQ-1
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-1ac375503deso3236635ad.3
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 08:46:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683215196; x=1685807196;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xzoXzppR2fwEvCJm4gqIZYVt1zy/5vbq707Ih0qVaLU=;
 b=D3J3Fn6wyR1iJcelSelYZ6/tm1/Q65b9ckxdNuH/U94iz1tg98yJO/yuvG1myX6XtG
 PMcD8KhLujUT08ai0ArYM1VbKegzvo+l0mmxpHvn7yvbsLLkoAUGhEE5CYiqxgn52yTQ
 /7m8M2/+T+SfmP9LjybjT4XLde/WhlSMbRofAntFwBQXYUgey2EVn7eZ4PSRo4IJwY8n
 PJ5UAOcszoBQfC2KaA1vIeuLYJTwxYZsgcvi5fFVmsrbyoDgQmlUZTXKavLqBcwUUagW
 Ixg8G9a2PMWxKEt/0vgrAvnrkLbXA/GRhlGLjswwbITw0PsI2fJE/4ySEE+N6Bd2L5x4
 gQVw==
X-Gm-Message-State: AC+VfDzJr7VCTu4GBNrXWRprgan5wvgYNprAEMJhrpEAYX1vDA8dE8wa
 HdGMrHPvosbNPMjn+nq+bDT8AKDWkR4Q3bPu4nR8SQVXjiRDM5JYKFFbR8wUZ778qn23boxVv2u
 77HHZ6OIseJR6g8dOfhbYM7EMFNk+eyUF1eIuNaZLkAK/mN3QaJfxVil4W7GWrGFKIY7B1Il8NG
 s=
X-Received: by 2002:a17:903:32c9:b0:1a6:8ed5:428a with SMTP id
 i9-20020a17090332c900b001a68ed5428amr5144607plr.22.1683215196619; 
 Thu, 04 May 2023 08:46:36 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5sAr0fAjHlEYePeB2d46b2jZyKwF26hxX3RfVuCHasTVqyfA2wvu4UK5CHnInYJy6G2eFMuQ==
X-Received: by 2002:a17:903:32c9:b0:1a6:8ed5:428a with SMTP id
 i9-20020a17090332c900b001a68ed5428amr5144585plr.22.1683215196215; 
 Thu, 04 May 2023 08:46:36 -0700 (PDT)
Received: from localhost.localdomain ([115.96.136.25])
 by smtp.googlemail.com with ESMTPSA id
 cu19-20020a17090afa9300b0024df4cfc881sm3282829pjb.10.2023.05.04.08.46.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 08:46:35 -0700 (PDT)
From: Ani Sinha <anisinha@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Cc: Ani Sinha <anisinha@redhat.com>,
	mst@redhat.com,
	berrange@redhat.com
Subject: [PATCH v2 1/2] tests: libvirt-ci: Update to commit 'c8971e90ac' to
 pull in mformat and xorriso
Date: Thu,  4 May 2023 21:16:10 +0530
Message-Id: <20230504154611.85854-2-anisinha@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230504154611.85854-1-anisinha@redhat.com>
References: <20230504154611.85854-1-anisinha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Pull in the following changes from lcitool:

* tests/lcitool/libvirt-ci 85487e1...c8971e9 (18):
  > mappings: add new package mappings for mformat and xorriso
  > docs: testing: Update contents with tox
  > .gitlab-ci.yml: Always test against installed lcitool
  > gitlab-ci.yml: Start using tox for testing
  > tox: Allow running with custom pytest options with {posargs}
  > gitignore: Add the default .tox directory
  > dev-requirements: Reference VM requirements
  > requirements: Add tox to dev-requirements.txt and drop pytest and flake
  > test-requirements: Rename to dev-requirements.txt
  > Add tox.ini configuration file
  > tests: commands: Consolidate the installed package/run from git tests
  > Add a pytest.ini
  > facts: targets: Drop Fedora 36 target
  > gitlab-ci.yml: Add Fedora 38 target
  > facts: targets: Add Fedora 38
  > facts: mappings: Drop 'zstd' mapping
  > facts: projects: nbdkit: Replace zstd mapping with libzstd
  > docs: mappings: Add a section on the preferred mapping naming scheme

CC: mst@redhat.com
CC: berrange@redhat.com
Signed-off-by: Ani Sinha <anisinha@redhat.com>
---
 tests/lcitool/libvirt-ci | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/lcitool/libvirt-ci b/tests/lcitool/libvirt-ci
index 85487e1404..c8971e90ac 160000
--- a/tests/lcitool/libvirt-ci
+++ b/tests/lcitool/libvirt-ci
@@ -1 +1 @@
-Subproject commit 85487e140415b2ac54b01a9a6b600fd7c21edc2f
+Subproject commit c8971e90ac169ee2b539c747f74d96c876debdf9
-- 
2.31.1


