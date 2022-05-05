Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 376ED51B984
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 09:54:09 +0200 (CEST)
Received: from localhost ([::1]:37044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmWJL-0000xa-Pu
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 03:54:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmWEJ-0005Ns-BZ
 for qemu-devel@nongnu.org; Thu, 05 May 2022 03:48:55 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.129.74]:22581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmWEH-0001vt-KW
 for qemu-devel@nongnu.org; Thu, 05 May 2022 03:48:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651736930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=f3VrnWMSKhIqNnt/Vm/IPKVEWqfjBZEIgVcRBq/3aiw=;
 b=Hb1YUnW1uyfn8L7XA+bWn1Tor5rBkrW8kqMKekBAo/z0jXWGoazvke+Aa+2T9Sl6KO7W80
 kFB8W1EGtpPzpXM7yFJz9W2IvD4tRM0arti10an51/UCViDj+R33klQsTjc8i4Sbta205d
 DwMb15VBZaZxMi+Df/epbUZKzBu/HDY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-191-7z_Hkm6NP76gyIhGd4PHdw-1; Thu, 05 May 2022 03:48:47 -0400
X-MC-Unique: 7z_Hkm6NP76gyIhGd4PHdw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 03F661C08961;
 Thu,  5 May 2022 07:48:47 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C7E5540D2820;
 Thu,  5 May 2022 07:48:45 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH] docs/about: Update the support statement for Windows
Date: Thu,  5 May 2022 09:48:41 +0200
Message-Id: <20220505074841.406185-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.74; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
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

Our support statement for Windows currently talks about "Vista / Server
2008" - which is related to the API of Windows, and this is not easy
to understand for the non-technical users. It might also not be quite
true anymore, since we only compile-test QEMU with recent toolchains.

Thus I'm suggesting to change the support statement here to something
similar that we use on Linux: Only support the very latest major release,
with support for the previous major release being dropped after two years
of overlap.

And since we're nowadays also compile-testing QEMU with MSYS2 on Windows
itself, I think we could also mention this build environment here.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/880
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/build-platforms.rst | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
index e9163ba556..a0ebc1acb4 100644
--- a/docs/about/build-platforms.rst
+++ b/docs/about/build-platforms.rst
@@ -86,11 +86,12 @@ similar versions.
 Windows
 -------
 
-The project supports building with current versions of the MinGW toolchain,
-hosted on Linux (Debian/Fedora).
+The project aims to support the most recent major version of Windows. Support
+for the previous major version will be dropped 2 years after the new major
+version is released.
 
-The version of the Windows API that's currently targeted is Vista / Server
-2008.
+The project supports building QEMU with current versions of the MinGW
+toolchain, either hosted on Linux (Debian/Fedora) or via MSYS2 on Windows.
 
 .. _Homebrew: https://brew.sh/
 .. _MacPorts: https://www.macports.org/
-- 
2.27.0


