Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5D9DFF6B
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Oct 2019 10:28:39 +0200 (CEST)
Received: from localhost ([::1]:51582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMpWw-0006HC-A1
	for lists+qemu-devel@lfdr.de; Tue, 22 Oct 2019 04:28:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45831)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iMpUU-00041E-OX
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 04:26:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iMpUT-0004MP-L5
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 04:26:06 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:36447)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1iMpUQ-0004LY-SH; Tue, 22 Oct 2019 04:26:03 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MUl4z-1iVwBw40Uz-00QgzI; Tue, 22 Oct 2019 10:25:58 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 1/2] qemu-doc: Remove paragraph about requiring a HD image with
 -kernel
Date: Tue, 22 Oct 2019 10:25:52 +0200
Message-Id: <20191022082553.10204-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191022082553.10204-1-laurent@vivier.eu>
References: <20191022082553.10204-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:wAVL9D6qA/7zLtbhg5LV+YVb62JjrnqCMEv7nUI4fK/LDO89v+X
 /0PR/YcL+baiwQPg3SqozORmjY+C6T4N9E7JWNmgLQ5wt7KW6BJuNInv20X52NFL6Egitv0
 oSAJQT7KGQ28r5ycIHPj9JxuPF2MqP/ivsKednhtd4z0MjGxu7/7JGMzuc9tvjyVRCgUpk7
 EklLhZWpfwz6qcsPM+0Dg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2/Vzy9R2FuI=:5FnkdQxHQ6z/h+bCnwdEjD
 hMx+gSc/xZ1nwaxa+p/93P3hf31S4/IAPSjSPat55cf6ndvDCwM4mQmPIY61IMsGTWnM636Nd
 7XLh/Rvhuwdyxd5Zk9MdTvq/wm7iaKMN8rqz7cJFj+LVcQzeoporp3suDVMQOYyXSVRVptdsK
 /GFoTqN4wCM69ZwJ1NvhLIEmaaUpyXd1QXk/SHmNUZnCXJR99ZmhrMYT9fuaso9g2znXRmeGI
 GbZB9vq/RKiiJ+tfHp4CsA1C/+qFCvcb4YG/KvTQKQLIhAkqxYhmIhcUBRdoX7sC8J/0SUyEJ
 MsdmB3SRgJVdF50jBKgMpipC6NCdiaB+smlwBW2tNOGUWf7bgDbfVYLW7tHamoDWND21CJsP6
 uDcb7lQGb7EB/wvBhIcQnQTFnQJPQJCiXEGsVe/t0seuSuvYttjNMGPFgF9v8sx1o56SghfC9
 H/F+rWdJSt5CHOlElL3fHr63eVBTA8WVD72Z2rI+dL74KHmytGix2Ld1pAtu0cXng3Ip7o+2/
 QVXnqm57nxJw+JLJaV+jDhRnaY+v+drVpX4DVosVjWfGfK+rxxeXiG/fOMlPJd5CR5Nir3Ggw
 CeAFA4f8txehag+7UXEcxrT3MAarAZqsCdS1aFFLn8n7B0E9rtizy7yYi69MdIRrTLPuMhrcW
 t2nJ9j0L3Y+YXV8VzuBvZHGLkLuqBNfnLhw/MSPjcCkAIQ9B1+Py0TDnnKhKwB0u67R32JwAw
 Bd13cCzAtSK5AdBQSH3bnri2LydOajw+q5vuwvdnmuc8iqB9TX2OJcB48Oeo+w6JSuHtF1fA0
 LOARHAUPpSVZIdDIc2EU8LCpLebwo3pvu8JbP0OrCFKlIf2YWAjBzWldYqfLiF6AHwtROt0H1
 aplSNIZ8URRKIwDFCgmGYDeSUkVPqRCDwSD3A8PVo=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.131
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Laszlo Ersek <lersek@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

The need for specifying "-hda" together with "-kernel" has been removed in
commit 57a46d057995 ("Convert linux bootrom to external rom and fw_cfg"),
almost 10 years ago, so let's remove this description from our documentation
now, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Message-Id: <20191001110111.4870-1-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 qemu-doc.texi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/qemu-doc.texi b/qemu-doc.texi
index 2ba6c90c083b..3c5022050f0f 100644
--- a/qemu-doc.texi
+++ b/qemu-doc.texi
@@ -906,10 +906,6 @@ Use @option{-kernel} to provide the Linux kernel image and
 @option{-append} to give the kernel command line arguments. The
 @option{-initrd} option can be used to provide an INITRD image.
 
-When using the direct Linux boot, a disk image for the first hard disk
-@file{hda} is required because its boot sector is used to launch the
-Linux kernel.
-
 If you do not need graphical output, you can disable it and redirect
 the virtual serial port and the QEMU monitor to the console with the
 @option{-nographic} option. The typical command line is:
-- 
2.21.0


