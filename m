Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4819647C3F0
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 17:38:16 +0100 (CET)
Received: from localhost ([::1]:52296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzi9X-0007QA-EH
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 11:38:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mzi4k-0003Uh-AR
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:33:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mzi4g-0004rI-Bp
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:33:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640104389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ghU8vImoeUmOJ4z2J2xHQZnIMVYUe4vf427QoD7I7jY=;
 b=fgn5aaRIKO89mejaJUsM20yYm4up2+YifXRZ3mBCWGzW9dVf17T8YdasKiRXDuQTvDNctU
 LSzNr22DCb0A1IE0liwThnpZOjTeYjV6YMhZRQu25yXJzgbPZNtogv7crCtdDwKAwYfYX9
 mpxBb1aaUP24v0Hiv7YdJwjKwn5gJNA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-245-YamJh5irP0uu48OddXn5Yg-1; Tue, 21 Dec 2021 11:33:08 -0500
X-MC-Unique: YamJh5irP0uu48OddXn5Yg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B055810144E2;
 Tue, 21 Dec 2021 16:33:06 +0000 (UTC)
Received: from avogadro.lan (unknown [10.39.193.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B9DB110911B0;
 Tue, 21 Dec 2021 16:33:05 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] meson: cleanup common-user/ build
Date: Tue, 21 Dec 2021 17:33:00 +0100
Message-Id: <20211221163300.453146-4-pbonzini@redhat.com>
In-Reply-To: <20211221163300.453146-1-pbonzini@redhat.com>
References: <20211221163300.453146-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: lvivier@redhat.com, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not go through a static_library, which is only necessary in order to reuse
some source files between emulators and tests.  Instead just place common files
for all user-mode emulators in common_ss, similar to what is already done for
softmmu_ss in full system emulators.

The only disadvantage is that the include_directories under bsd-user/include/
and linux-user/include/ are now enabled for all targets rather than only
user mode emulators.  This however is not different from how include/sysemu/
is available when building user mode emulators.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 common-user/meson.build |  2 +-
 meson.build             | 13 +------------
 2 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/common-user/meson.build b/common-user/meson.build
index 5cb42bc664..26212dda5c 100644
--- a/common-user/meson.build
+++ b/common-user/meson.build
@@ -1,6 +1,6 @@
 common_user_inc += include_directories('host/' / host_arch)
 
-common_user_ss.add(files(
+user_ss.add(files(
   'safe-syscall.S',
   'safe-syscall-error.c',
 ))
diff --git a/meson.build b/meson.build
index b0af02b805..879628ab68 100644
--- a/meson.build
+++ b/meson.build
@@ -2377,7 +2377,6 @@ blockdev_ss = ss.source_set()
 block_ss = ss.source_set()
 chardev_ss = ss.source_set()
 common_ss = ss.source_set()
-common_user_ss = ss.source_set()
 crypto_ss = ss.source_set()
 hwcore_ss = ss.source_set()
 io_ss = ss.source_set()
@@ -2629,17 +2628,6 @@ subdir('common-user')
 subdir('bsd-user')
 subdir('linux-user')
 
-common_user_ss = common_user_ss.apply(config_all, strict: false)
-common_user = static_library('common-user',
-                             sources: common_user_ss.sources(),
-                             dependencies: common_user_ss.dependencies(),
-                             include_directories: common_user_inc,
-                             name_suffix: 'fa',
-                             build_by_default: false)
-common_user = declare_dependency(link_with: common_user)
-
-user_ss.add(common_user)
-
 # needed for fuzzing binaries
 subdir('tests/qtest/libqos')
 subdir('tests/qtest/fuzz')
@@ -2857,6 +2845,7 @@ common_all = common_ss.apply(config_all, strict: false)
 common_all = static_library('common',
                             build_by_default: false,
                             sources: common_all.sources() + genh,
+                            include_directories: common_user_inc,
                             implicit_include_directories: false,
                             dependencies: common_all.dependencies(),
                             name_suffix: 'fa')
-- 
2.33.1


