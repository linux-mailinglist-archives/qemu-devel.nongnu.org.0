Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BF5522FDD
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 11:50:40 +0200 (CEST)
Received: from localhost ([::1]:57236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noizP-0000tZ-9L
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 05:50:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1noiwx-0007hK-3O
 for qemu-devel@nongnu.org; Wed, 11 May 2022 05:48:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1noiwt-0003hZ-GS
 for qemu-devel@nongnu.org; Wed, 11 May 2022 05:48:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652262481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=pzCvGNZ0Rx2nwvmgJnkCQ+n1OSxYJx2Ac8GklsY8eWA=;
 b=Z8Di03ZvrQDmoeMdKr481q9Umvvs73dgV63XVF3Gep6N898yNqL3lHoK1kVwj0nzUknq+i
 +oCwmhCrWRxKOYSWDe2xrt6QMhNINQxveJY+ZNGM3A/A2U3H+WA66IOTf9eOT5ygnNHxYt
 +UWkoMFR2t20Muxx3OFIcNw946XAdjM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-153-Cj3sRzYKPDuuUn1RGne2Sw-1; Wed, 11 May 2022 05:48:00 -0400
X-MC-Unique: Cj3sRzYKPDuuUn1RGne2Sw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 55362811E7A;
 Wed, 11 May 2022 09:48:00 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 92FC840316B;
 Wed, 11 May 2022 09:47:59 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH] meson.build: Bump minimum supported version of pixman to
 0.34.0
Date: Wed, 11 May 2022 11:47:58 +0200
Message-Id: <20220511094758.794946-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We haven't revisited the minimum required versions of pixman
since quite a while. Let's check whether we can rule out some
old versions that nobody tests anymore...

For pixman, per repology.org, currently shipping versions are:

     CentOS 8 / RHEL-8 : 0.38.4
              Fedora 34: 0.40.0
             Debian 10 : 0.36.0
      Ubuntu LTS 20.04 : 0.38.4
    openSUSE Leap 15.3 : 0.34.0
           MSYS2 MinGW : 0.40.0
         FreeBSD Ports : 0.34.0 / 0.40.0
          NetBSD pksrc : 0.40.0

OpenBSD 7.1 seems to use 0.40.0 when running tests/vm/openbsd.

So it seems to be fine to bump the minimum version to 0.34.0 now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 864e97945f..7843a50cc1 100644
--- a/meson.build
+++ b/meson.build
@@ -504,7 +504,7 @@ if 'ust' in get_option('trace_backends')
 endif
 pixman = not_found
 if have_system or have_tools
-  pixman = dependency('pixman-1', required: have_system, version:'>=0.21.8',
+  pixman = dependency('pixman-1', required: have_system, version:'>=0.34.0',
                       method: 'pkg-config', kwargs: static_kwargs)
 endif
 zlib = dependency('zlib', required: true, kwargs: static_kwargs)
-- 
2.27.0


