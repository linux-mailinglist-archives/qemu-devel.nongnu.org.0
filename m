Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7F2289F15
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Oct 2020 10:02:59 +0200 (CEST)
Received: from localhost ([::1]:37470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kR9qE-0000xE-ET
	for lists+qemu-devel@lfdr.de; Sat, 10 Oct 2020 04:02:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kR9lG-000404-Qv
 for qemu-devel@nongnu.org; Sat, 10 Oct 2020 03:57:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kR9lB-0006f8-Bj
 for qemu-devel@nongnu.org; Sat, 10 Oct 2020 03:57:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602316664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z5VE4i2lF8Ss2UWS9IkOlEpH239r8QcqVWjgETonQhA=;
 b=NJQgq+Mt1fmgcmVZip043x0dzNyiB8pdERNnUS840jQ9NssgsBvr8swWB/9XOpRQsaY844
 VM8+CYypOvhYtI+QaaV1cGufZ/pLfSlJDgDith6720eJzqzvz+7g0GdEcYY5f0DZuTRCQ+
 aV6Gy1WvejdWSKmfnWH+1Jg6JiXyfhU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-IzuBgseIM_yO-3mWYsmvxw-1; Sat, 10 Oct 2020 03:57:41 -0400
X-MC-Unique: IzuBgseIM_yO-3mWYsmvxw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA2F8805F09
 for <qemu-devel@nongnu.org>; Sat, 10 Oct 2020 07:57:40 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 774C475126;
 Sat, 10 Oct 2020 07:57:40 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/39] meson.build: Sort sourcesets alphabetically
Date: Sat, 10 Oct 2020 03:57:02 -0400
Message-Id: <20201010075739.951385-3-pbonzini@redhat.com>
In-Reply-To: <20201010075739.951385-1-pbonzini@redhat.com>
References: <20201010075739.951385-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/10 02:57:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20201006125602.2311423-3-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/meson.build b/meson.build
index 68eaf8ce2f..adcfb494a8 100644
--- a/meson.build
+++ b/meson.build
@@ -1182,19 +1182,19 @@ sphinx_extn_depends = [ meson.source_root() / 'docs/sphinx/depfile.py',
 
 # Collect sourcesets.
 
-util_ss = ss.source_set()
-stub_ss = ss.source_set()
-trace_ss = ss.source_set()
-block_ss = ss.source_set()
 blockdev_ss = ss.source_set()
-qmp_ss = ss.source_set()
-common_ss = ss.source_set()
-softmmu_ss = ss.source_set()
-user_ss = ss.source_set()
+block_ss = ss.source_set()
 bsd_user_ss = ss.source_set()
+common_ss = ss.source_set()
 linux_user_ss = ss.source_set()
-specific_ss = ss.source_set()
+qmp_ss = ss.source_set()
+softmmu_ss = ss.source_set()
 specific_fuzz_ss = ss.source_set()
+specific_ss = ss.source_set()
+stub_ss = ss.source_set()
+trace_ss = ss.source_set()
+user_ss = ss.source_set()
+util_ss = ss.source_set()
 
 modules = {}
 hw_arch = {}
-- 
2.26.2



