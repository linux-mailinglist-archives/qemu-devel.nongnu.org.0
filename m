Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1553015F8
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 15:38:11 +0100 (CET)
Received: from localhost ([::1]:44968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3K3G-00049E-Sb
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 09:38:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3JxE-0003Xf-Qs
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 09:31:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3Jx7-0005pn-3L
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 09:31:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611412307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G53v+YvNLiB1K/6dKeok+ow3qjFbSe9WsAFY2YX1Zxc=;
 b=VisuYnTCWQAQp20AKI5KCHAXuYsexQ43nRpHo7RhfmCEKEhzCvG7adpk8rJ6k8Q+P8inze
 zaWVUTf5WwEH1pgD7gUpUYNKuIV5ZuFje8vXD0R4q+XVf76iAOZtXbqovAnHoWTSlA67iK
 YOYxZPDTb11IYb7MoeuzKckyy/Ov6mg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-bidsLhyZMTa2MWnnrkkdcQ-1; Sat, 23 Jan 2021 09:31:45 -0500
X-MC-Unique: bidsLhyZMTa2MWnnrkkdcQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3045E1005504
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 14:31:44 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E17BE19C44;
 Sat, 23 Jan 2021 14:31:43 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/31] meson: Declare have_virtfs_proxy_helper in main
 meson.build
Date: Sat, 23 Jan 2021 09:31:09 -0500
Message-Id: <20210123143128.1167797-13-pbonzini@redhat.com>
In-Reply-To: <20210123143128.1167797-1-pbonzini@redhat.com>
References: <20210123143128.1167797-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.165,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

have_virtfs_proxy_helper is used from docs/meson.build, and can be
not declared when including it before fsdev/meson.build. This fixes:

  ../docs/meson.build:54:2: ERROR: Unknown variable "have_virtfs_proxy_helper".

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210120151539.1166252-1-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 fsdev/meson.build | 1 -
 meson.build       | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/fsdev/meson.build b/fsdev/meson.build
index 65455a179e..adf57cc43e 100644
--- a/fsdev/meson.build
+++ b/fsdev/meson.build
@@ -8,7 +8,6 @@ fsdev_ss.add(when: ['CONFIG_FSDEV_9P'], if_true: files(
 ), if_false: files('qemu-fsdev-dummy.c'))
 softmmu_ss.add_all(when: 'CONFIG_LINUX', if_true: fsdev_ss)
 
-have_virtfs_proxy_helper = have_tools and libattr.found() and libcap_ng.found() and have_virtfs
 if have_virtfs_proxy_helper
   executable('virtfs-proxy-helper',
              files('virtfs-proxy-helper.c', '9p-marshal.c', '9p-iov-marshal.c'),
diff --git a/meson.build b/meson.build
index deda061c86..4a5f265bd0 100644
--- a/meson.build
+++ b/meson.build
@@ -1034,6 +1034,8 @@ have_virtfs = (targetos == 'linux' and
     libattr.found() and
     libcap_ng.found())
 
+have_virtfs_proxy_helper = have_virtfs and have_tools
+
 if get_option('virtfs').enabled()
   if not have_virtfs
     if targetos != 'linux'
-- 
2.26.2



