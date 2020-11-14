Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C30282B2EA8
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Nov 2020 17:53:53 +0100 (CET)
Received: from localhost ([::1]:57620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdyoC-0001GJ-R4
	for lists+qemu-devel@lfdr.de; Sat, 14 Nov 2020 11:53:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kdymL-0008T2-UX
 for qemu-devel@nongnu.org; Sat, 14 Nov 2020 11:51:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kdymI-0000SH-RK
 for qemu-devel@nongnu.org; Sat, 14 Nov 2020 11:51:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605372713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=bLAePTtGcecxV0gOEt66l+EqT1AGeqliPWsZztwFPGA=;
 b=GiDdVFhpVT7sX1TcPX01WLSJKexE0uKzVBpg74QbS0iWsyRM+GlfUZfQGQFoQQpzCT9+7H
 23Q7z11znuKP8bIxY3al1w5IMIIHnnQFGk+yOMuEpSunsRQCz/Co8EXiwF6sxTQihsmnVW
 uO/SLC7GDiyQ8lL8ETTE50L0g7wIHlg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-6iAbxEyYNrGxJdM3aoQ3sg-1; Sat, 14 Nov 2020 11:51:51 -0500
X-MC-Unique: 6iAbxEyYNrGxJdM3aoQ3sg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C38168015A4;
 Sat, 14 Nov 2020 16:51:49 +0000 (UTC)
Received: from thuth.com (ovpn-112-86.ams2.redhat.com [10.36.112.86])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B0C026EF5A;
 Sat, 14 Nov 2020 16:51:47 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] configure: Do not build pc-bios/optionrom on Haiku
Date: Sat, 14 Nov 2020 17:51:35 +0100
Message-Id: <20201114165137.15379-3-thuth@redhat.com>
In-Reply-To: <20201114165137.15379-1-thuth@redhat.com>
References: <20201114165137.15379-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/14 11:51:48
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alexander von Gluck IV <kallisti5@unixzen.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David CARLIER <devnexen@gmail.com>, kraxel@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Compilation of pc-bios/optionrom fails on Haiku with:

   BUILD   pvh.img
 ld: pvh_main.o: in function `pvh_load_kernel':
 pc-bios/optionrom/pvh_main.c:73: undefined reference to `GLOBAL_OFFSET_TABLE_'
 Makefile:57: recipe for target 'pvh.img' failed
 make[1]: *** [pvh.img] Error 1

Let's simply disable it, like it is already done on macOS and Solaris.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index a273a93377..c0acda164d 100755
--- a/configure
+++ b/configure
@@ -5842,7 +5842,7 @@ fi
 roms=
 if { test "$cpu" = "i386" || test "$cpu" = "x86_64"; } && \
         test "$targetos" != "Darwin" && test "$targetos" != "SunOS" && \
-        test "$softmmu" = yes ; then
+        test "$targetos" != "Haiku" && test "$softmmu" = yes ; then
     # Different host OS linkers have different ideas about the name of the ELF
     # emulation. Linux and OpenBSD/amd64 use 'elf_i386'; FreeBSD uses the _fbsd
     # variant; OpenBSD/i386 uses the _obsd variant; and Windows uses i386pe.
-- 
2.18.4


