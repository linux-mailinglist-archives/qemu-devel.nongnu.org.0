Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5432E2F615B
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 13:59:29 +0100 (CET)
Received: from localhost ([::1]:35594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l02Do-0006eI-C5
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 07:59:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l02BC-0002pf-4A
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 07:56:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l02B9-0004oQ-TG
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 07:56:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610629003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c24s2IPEAdbnCxHoUQfcfNtXo9wRvaZyUY3nUeoK2Vc=;
 b=XuHOaq/ZNYfWB3JB/rXZRo0Y7vSCYZpaBy+BAfF8WHjDFmgiAP/loBDGhsdWWL3IjtkotQ
 FuG+DsciAMkMsc9iNKhtFGXmErT2GIhVnqw1dYDD+aF+QNLnJXcYKG96t9pH3dXKuQ/GXW
 9lpG1X1qzK3LlnTRas9z/eGDo5ViIVY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-rLtyBkLhOD-QRrwx7fBmXQ-1; Thu, 14 Jan 2021 07:56:40 -0500
X-MC-Unique: rLtyBkLhOD-QRrwx7fBmXQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9E33100E450;
 Thu, 14 Jan 2021 12:56:36 +0000 (UTC)
Received: from localhost (unknown [10.36.110.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8416A648A1;
 Thu, 14 Jan 2021 12:56:35 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 3/5] build-sys: add libvhost-user missing dependencies
Date: Thu, 14 Jan 2021 16:56:03 +0400
Message-Id: <20210114125605.1227742-4-marcandre.lureau@redhat.com>
In-Reply-To: <20210114125605.1227742-1-marcandre.lureau@redhat.com>
References: <20210114125605.1227742-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
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
Cc: pbonzini@redhat.com, j@getutm.app,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 samuel.thibault@ens-lyon.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

This help fixing static compilation issues.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
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
2.29.0


