Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5653015F7
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 15:38:08 +0100 (CET)
Received: from localhost ([::1]:44554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3K3D-0003yy-JK
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 09:38:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3JxB-0003Uj-H8
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 09:31:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3Jx5-0005pb-2a
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 09:31:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611412306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=06eJmQizGfpNE0gYHzCBMZX2YkUCG0ZXiZZ83cD/Ox4=;
 b=jGB0v9VVEUHKRdomP1oGU4f5XTAK+6QryF6Z/49x6B6/oi1z3pesT5YwJPpw+HHNBb5kSU
 xW1u3ycJT+FRHqlWRdfznWuhJj8ldbNhuHIX7u5/QRogFTcIyJjbQcUyzTeZ9hSqM1DV78
 3RhlbN/jtYrTPVd31B4+CUXVL+hHTZk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-pyYprU3ENuWy09Q4LKQGig-1; Sat, 23 Jan 2021 09:31:44 -0500
X-MC-Unique: pyYprU3ENuWy09Q4LKQGig-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 653958018A1
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 14:31:43 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D5A919C44;
 Sat, 23 Jan 2021 14:31:39 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/31] build-sys: add libvhost-user missing dependencies
Date: Sat, 23 Jan 2021 09:31:07 -0500
Message-Id: <20210123143128.1167797-11-pbonzini@redhat.com>
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

This help fixing static compilation issues.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210114125605.1227742-4-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 subprojects/libvhost-user/meson.build | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/subprojects/libvhost-user/meson.build b/subprojects/libvhost-user/meson.build
index c5d85c11d7..b03446e7cd 100644
--- a/subprojects/libvhost-user/meson.build
+++ b/subprojects/libvhost-user/meson.build
@@ -2,12 +2,14 @@ project('libvhost-user', 'c',
         license: 'GPL-2.0-or-later',
         default_options: ['c_std=gnu99'])
 
+threads = dependency('threads')
 glib = dependency('glib-2.0')
 inc = include_directories('../../include', '../../linux-headers')
 
 vhost_user = static_library('vhost-user',
                             files('libvhost-user.c'),
                             include_directories: inc,
+                            dependencies: threads,
                             c_args: '-D_GNU_SOURCE')
 
 executable('link-test', files('link-test.c'),
@@ -21,4 +23,5 @@ vhost_user_glib = static_library('vhost-user-glib',
                                  dependencies: glib)
 
 vhost_user_dep = declare_dependency(link_with: vhost_user_glib,
+                                    dependencies: glib,
                                     include_directories: include_directories('.'))
-- 
2.26.2



