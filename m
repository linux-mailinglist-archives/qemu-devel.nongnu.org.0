Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6523C508D89
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 18:42:48 +0200 (CEST)
Received: from localhost ([::1]:56526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhDPj-0003Yn-Fn
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 12:42:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nhCna-0006Ju-NX
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 12:03:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nhCnZ-0005SW-2p
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 12:03:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650470600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C8wN5U7rcOEJjp166vEepL4AyCDFxN+ylHVO5T/N5qQ=;
 b=F6hryljv3ZxmWDHp8ojfB+Cpoivu1yM9NF3nLeCCvOqVt/D/8vpnvVLFoW96zqwtTcH5gv
 odSWdXIz8r5Po4m+5+Oiw4MdrN02asl/1hCibF8DveFk8JXDWNC/fv0qxkntpmfbwthZBm
 rFDunjRgMwdb098eEeO2rDkeQO3n6uc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-278-PR6dqXaoOJKVM6bDit8-WA-1; Wed, 20 Apr 2022 12:03:18 -0400
X-MC-Unique: PR6dqXaoOJKVM6bDit8-WA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 91DCC1C05139
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 16:03:18 +0000 (UTC)
Received: from harajuku.usersys.redhat.com (unknown [10.40.192.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 640602024CBB;
 Wed, 20 Apr 2022 16:03:15 +0000 (UTC)
From: Andrea Bolognani <abologna@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] docs: build-platforms: Fix spelling for Homebrew
Date: Wed, 20 Apr 2022 18:03:10 +0200
Message-Id: <20220420160311.248079-2-abologna@redhat.com>
In-Reply-To: <20220420160311.248079-1-abologna@redhat.com>
References: <20220420160311.248079-1-abologna@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Andrea Bolognani <abologna@redhat.com>
---
 docs/about/build-platforms.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
index c29a4b8fe6..e9163ba556 100644
--- a/docs/about/build-platforms.rst
+++ b/docs/about/build-platforms.rst
@@ -80,7 +80,7 @@ Ubuntu LTS. Other distros will be assumed to ship similar software versions.
 For FreeBSD and OpenBSD, decisions will be made based on the contents of the
 respective ports repository, while NetBSD will use the pkgsrc repository.
 
-For macOS, `HomeBrew`_ will be used, although `MacPorts`_ is expected to carry
+For macOS, `Homebrew`_ will be used, although `MacPorts`_ is expected to carry
 similar versions.
 
 Windows
@@ -92,6 +92,6 @@ hosted on Linux (Debian/Fedora).
 The version of the Windows API that's currently targeted is Vista / Server
 2008.
 
-.. _HomeBrew: https://brew.sh/
+.. _Homebrew: https://brew.sh/
 .. _MacPorts: https://www.macports.org/
 .. _Repology: https://repology.org/
-- 
2.35.1


