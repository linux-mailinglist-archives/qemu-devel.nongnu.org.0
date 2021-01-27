Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45841306308
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 19:10:54 +0100 (CET)
Received: from localhost ([::1]:45266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4pHI-0000xL-Rc
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 13:10:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l4pFS-0000GA-TT
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 13:09:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l4pFN-0003uu-QI
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 13:08:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611770931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rDP0xpXDnmjCx8q8IJN6do+R4Mj4Mm2qAtLHqOsmrIo=;
 b=Chh1Tnog0XC3akrGXKNI+o/8wrHgzkQXM6gbXdb2gqbdyLJY9SYid4sdG9lFwxcO+d+Epw
 y0aLBgVr/bOgx9ZTRi/BrzFxDV3A9fOLBfrPWPVMHjUvpZGFaoyzY/xRKm6aTVQZPet1cC
 2XajZMzufa8FibaCb1VpP36yPOGNKvs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-t89o8V7bOVCXlbNe_xaeEw-1; Wed, 27 Jan 2021 13:08:50 -0500
X-MC-Unique: t89o8V7bOVCXlbNe_xaeEw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 309D3107ACE3
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 18:08:49 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-120.ams2.redhat.com
 [10.36.115.120])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 41C3660BF3;
 Wed, 27 Jan 2021 18:08:44 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] ui: update keycodemapdb submodule commit
Date: Wed, 27 Jan 2021 18:08:43 +0000
Message-Id: <20210127180843.3820964-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HEXHASH_WORD=1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Primarily this is to pull in a fix for Win32 keycodes. The other useful
change is the removal of build timestamp from generated files which is
desirable for reproducable builds.

The make rules need updating due to slightly changed CLI syntax - more
args must now come after the command name.

6119e6e19a050df847418de7babe5166779955e4 Fix scan codes for Korean keys
685684a8404301780714e8a89a871981e7cae988 Fix argument order in output headers
b3774853042c951b200d767697285781cc59a83c Add HTML entries for Korean layout keys
8e54850d800e4697a2798fb82ac740e760f8530b Add macOS entries for Japanese keyboards
27acf0ef828bf719b2053ba398b195829413dbdd Fix win32 keycode for VK_OEM_102
317d3eeb963a515e15a63fa356d8ebcda7041a51 Add support for generating RST formatted docs pages
7381b9bfadd31c4c9e9a10b5bb5032f9189d4352 Introduce separate args for title & subtitle with docs generator
6280c94f306df6a20bbc100ba15a5a81af0366e6 keymap-gen: Name sections in pod output
df4e56f8fab65ba714ec18f4e7338a966a1620ad Add an empty meson project
16e5b0787687d8904dad2c026107409eb9bfcb95 remove buildtime from generated files
044f21dd0d4f62519aae9f1d53a026407a0b664f add header file generators
7779876a6b06755e3bb2c94ee3ded50635bcb0fa c++: add extern declaration to the generated file
0e0a317889464397d6f1ae03aad0d2ca593aab04 move CLanguageGenerator closer to CLanguageGenerator itself

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 ui/keycodemapdb | 2 +-
 ui/meson.build  | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/ui/keycodemapdb b/ui/keycodemapdb
index 6b3d716e2b..6119e6e19a 160000
--- a/ui/keycodemapdb
+++ b/ui/keycodemapdb
@@ -1 +1 @@
-Subproject commit 6b3d716e2b6472eb7189d3220552280ef3d832ce
+Subproject commit 6119e6e19a050df847418de7babe5166779955e4
diff --git a/ui/meson.build b/ui/meson.build
index 634fabab0d..156b600a99 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -127,9 +127,10 @@ if have_system or xkbcommon.found()
                   capture: true,
                   input: files('keycodemapdb/data/keymaps.csv'),
                   command: [python.full_path(), files('keycodemapdb/tools/keymap-gen'),
+                            'code-map',
                             '--lang', 'glib2',
                             '--varname', 'qemu_input_map_@0@_to_@1@'.format(e[0], e[1]),
-                            'code-map', '@INPUT0@', e[0], e[1]])
+                            '@INPUT0@', e[0], e[1]])
   endforeach
 endif
 
-- 
2.29.2


