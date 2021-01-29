Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBAB308BD7
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 18:49:27 +0100 (CET)
Received: from localhost ([::1]:60502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Xte-0000sq-Vi
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 12:49:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l5XLd-0006T8-K1
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 12:14:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l5XLb-00087N-D6
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 12:14:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611940454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XjKCfSj/EWNFUSOhuv/JcgrJDeWDOxrG0F3zpFldsqM=;
 b=YOz0NLIU2HdoUmNLHQCXJNobKjWG8QI3xbw1uts2QlhRFZZmEVjAPjusrKYALyral4YllS
 HXShdUaeWjHYm2CrXubzitK6kaH4HkEjJF0wh5t3ZBFXc1oNpNgn4MXnzhOfdJg0DGjZ/G
 Fw17VTbxNNSl4OrZXwuxvkJ3+NX8W2k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-v4rfEmFsMSeLGSvqjI3mxQ-1; Fri, 29 Jan 2021 12:14:13 -0500
X-MC-Unique: v4rfEmFsMSeLGSvqjI3mxQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1FF33911ED;
 Fri, 29 Jan 2021 17:14:12 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-94.ams2.redhat.com
 [10.36.115.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 46C896267E;
 Fri, 29 Jan 2021 17:14:00 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/13] ui: update keycodemapdb submodule commit
Date: Fri, 29 Jan 2021 17:11:00 +0000
Message-Id: <20210129171102.4109641-12-berrange@redhat.com>
In-Reply-To: <20210129171102.4109641-1-berrange@redhat.com>
References: <20210129171102.4109641-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, libvir-list@redhat.com, Max Reitz <mreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
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


