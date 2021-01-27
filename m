Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A038C30578E
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 10:58:38 +0100 (CET)
Received: from localhost ([::1]:53406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4hav-0004BB-Jt
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 04:58:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l4hXf-0007d5-CL
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 04:55:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l4hXZ-0000EV-6X
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 04:55:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611741308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gt6o8Xp/wAqUATnm+FeMbImFHdA/73Z6EYs0CbV3iuw=;
 b=JIR8iqj4tZxPtH7tT94ivZx1sTXkO/VsxO+grAgWAFmxuwBY3P4ng/zDbAYGVw4jAmsX7w
 8+piKy4bINERU/pc2bwFmjomxjNL+fyg32kHmZjHXQ34exBTySHno3jOpcgd5C7epIwevY
 y7wLfaaKslW+8/hr3nfIocWyb6Fotmg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-tkBK1xzSPne1s-xDTR28HQ-1; Wed, 27 Jan 2021 04:55:05 -0500
X-MC-Unique: tkBK1xzSPne1s-xDTR28HQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11CCC1005513;
 Wed, 27 Jan 2021 09:55:05 +0000 (UTC)
Received: from thuth.com (ovpn-112-136.ams2.redhat.com [10.36.112.136])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ACD515D9C6;
 Wed, 27 Jan 2021 09:55:01 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 5/9] meson: Do not build optional libraries by default
Date: Wed, 27 Jan 2021 10:54:40 +0100
Message-Id: <20210127095444.114495-6-thuth@redhat.com>
In-Reply-To: <20210127095444.114495-1-thuth@redhat.com>
References: <20210127095444.114495-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

The following libraries will be selected if a feature requires it:

- capstone
- fdt
- SLiRP

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210122204441.2145197-5-philmd@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 meson.build | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meson.build b/meson.build
index 35a9eddf5c..a58c6f6785 100644
--- a/meson.build
+++ b/meson.build
@@ -1460,6 +1460,7 @@ if capstone_opt == 'internal'
   ]
 
   libcapstone = static_library('capstone',
+                               build_by_default: false,
                                sources: capstone_files,
                                c_args: capstone_cargs,
                                include_directories: 'capstone/include')
@@ -1537,6 +1538,7 @@ if have_system
 
     slirp_inc = include_directories('slirp', 'slirp/src')
     libslirp = static_library('slirp',
+                              build_by_default: false,
                               sources: slirp_files,
                               c_args: slirp_cargs,
                               include_directories: slirp_inc)
@@ -1582,6 +1584,7 @@ if have_system
 
     fdt_inc = include_directories('dtc/libfdt')
     libfdt = static_library('fdt',
+                            build_by_default: false,
                             sources: fdt_files,
                             include_directories: fdt_inc)
     fdt = declare_dependency(link_with: libfdt,
-- 
2.27.0


