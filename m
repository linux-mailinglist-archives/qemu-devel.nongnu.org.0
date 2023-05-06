Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5C86F932C
	for <lists+qemu-devel@lfdr.de>; Sat,  6 May 2023 18:40:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvKuu-0000ol-Ne; Sat, 06 May 2023 12:37:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pvKus-0000oL-F4
 for qemu-devel@nongnu.org; Sat, 06 May 2023 12:37:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pvKuq-0003u4-UW
 for qemu-devel@nongnu.org; Sat, 06 May 2023 12:37:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683391067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vEsdInr11R7MES8DB3cC0QDiQG9fD71pr/Jhqm8Hwo8=;
 b=KRB59Q/wVHvt9GSSb7QpXTPYsXMUoEFejW8YjAQitfVPiEAVVmxdXHzlXISTcDnCLOYAha
 ZdZX7zqmVQVb8eRIG2QAuxlHd7WPNcbiSq8exgxVMJLvZCEKo58YBVEOz3jjq90fCKRW63
 WOWqWXFX+zk0YIjIxKGUYy6hzQx+aWk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-465-EpH9SFrqORqw_4C8MtrB5w-1; Sat, 06 May 2023 12:37:44 -0400
X-MC-Unique: EpH9SFrqORqw_4C8MtrB5w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2536F868C8D;
 Sat,  6 May 2023 16:37:44 +0000 (UTC)
Received: from localhost (unknown [10.39.208.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4562B492B00;
 Sat,  6 May 2023 16:37:42 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 dbassey@redhat.com,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 01/12] libvirt-ci: update submodule to cover pipewire
Date: Sat,  6 May 2023 20:37:24 +0400
Message-Id: <20230506163735.3481387-2-marcandre.lureau@redhat.com>
In-Reply-To: <20230506163735.3481387-1-marcandre.lureau@redhat.com>
References: <20230506163735.3481387-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

List of upstream changes:

Abdulwasiu Apalowo (6):
      commandline: add default tag information to image argument
      containers: add tag parameter to image_exists method
      lcitool: edit error message during container run (or shell) operation.
      containers: change the mode bits of --script argument
      containers: mount temporary directory to user's home in the container
      containers: always change workdir to the user's home

Ani Sinha (1):
      mappings: add new package mappings for mformat and xorriso

Erik Skultety (17):
      docs: mappings: Add a section on the preferred mapping naming scheme
      facts: projects: nbdkit: Replace zstd mapping with libzstd
      facts: mappings: Drop 'zstd' mapping
      facts: targets: Add Fedora 38
      gitlab-ci.yml: Add Fedora 38 target
      facts: targets: Drop Fedora 36 target
      Add a pytest.ini
      tests: commands: Consolidate the installed package/run from git tests
      Add tox.ini configuration file
      test-requirements: Rename to dev-requirements.txt
      requirements: Add tox to dev-requirements.txt and drop pytest and flake
      dev-requirements: Reference VM requirements
      gitignore: Add the default .tox directory
      tox: Allow running with custom pytest options with {posargs}
      gitlab-ci.yml: Start using tox for testing
      .gitlab-ci.yml: Always test against installed lcitool
      docs: testing: Update contents with tox

Marc-André Lureau (1):
      facts/mappings & qemu: add pipewire

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 tests/lcitool/libvirt-ci | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/lcitool/libvirt-ci b/tests/lcitool/libvirt-ci
index 85487e1404..2e0571c3e0 160000
--- a/tests/lcitool/libvirt-ci
+++ b/tests/lcitool/libvirt-ci
@@ -1 +1 @@
-Subproject commit 85487e140415b2ac54b01a9a6b600fd7c21edc2f
+Subproject commit 2e0571c3e0722c79b90decb2c7fd9fa1deebbd46
-- 
2.40.1


