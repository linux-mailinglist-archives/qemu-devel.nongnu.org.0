Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D81D52AD47D
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 12:13:28 +0100 (CET)
Received: from localhost ([::1]:52940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcRaZ-00008m-Sj
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 06:13:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kcRYy-0006sf-Qp
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:11:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kcRYv-0004Vx-Vs
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:11:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605006705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/UKzrkAmiiKjEejuCRdRdDKhHfnLoGaNHvoNpTaUF7A=;
 b=WQxAiQh6M0jcV2nkbzPIAxxdaxIX2U+Br1+zJ0NdK5+M3r8SYBQ7cFyDY3JrlBjmB1xqZ/
 cWfY5RJtgqF7ViSI6zBKfPu3eKjddGEHxy0u0LjzkDkQk42qJ++0RASV8/ZSr7Z0PDcOau
 xJlGhCI3VXMqvjRKa5Q/YH+BWk0L5uM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-IvC7JJR3O0mYOm-kb5rJrA-1; Tue, 10 Nov 2020 06:11:40 -0500
X-MC-Unique: IvC7JJR3O0mYOm-kb5rJrA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 973BF1006713;
 Tue, 10 Nov 2020 11:11:39 +0000 (UTC)
Received: from thuth.com (ovpn-113-192.ams2.redhat.com [10.36.113.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2BC521002C11;
 Tue, 10 Nov 2020 11:11:37 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 01/19] meson: always include contrib/libvhost-user
Date: Tue, 10 Nov 2020 12:11:14 +0100
Message-Id: <20201110111132.559399-2-thuth@redhat.com>
In-Reply-To: <20201110111132.559399-1-thuth@redhat.com>
References: <20201110111132.559399-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 02:00:53
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Cornelia Huck <cohuck@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

libvhost-user is needed when CONFIG_LINUX is set. The CONFIG_VHOST_USER
check in meson.build is incorrect.

In fact, no explicit check is needed since this dependency is not built
by default. If something declares a dependency on libvhost-user then it
will be built, otherwise it won't be built (i.e. on non-Linux hosts).

This fixes ./configure --disable-vhost-user && make.

Fixes: bc15e44cb2191bbb2318878acdf5038134e56394 ("configure: introduce --enable-vhost-user-blk-server")
Reported-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reported-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20201106210340.698771-1-stefanha@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 meson.build | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meson.build b/meson.build
index f5175010df..b473620321 100644
--- a/meson.build
+++ b/meson.build
@@ -1450,11 +1450,7 @@ trace_events_subdirs += [
   'util',
 ]
 
-vhost_user = not_found
-if 'CONFIG_VHOST_USER' in config_host
-  subdir('contrib/libvhost-user')
-endif
-
+subdir('contrib/libvhost-user')
 subdir('qapi')
 subdir('qobject')
 subdir('stubs')
-- 
2.18.4


