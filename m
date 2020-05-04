Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C65E1C38DB
	for <lists+qemu-devel@lfdr.de>; Mon,  4 May 2020 14:06:04 +0200 (CEST)
Received: from localhost ([::1]:50346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jVZrH-0003j9-Dv
	for lists+qemu-devel@lfdr.de; Mon, 04 May 2020 08:06:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1jVZjq-00031y-Mu; Mon, 04 May 2020 07:58:22 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:60549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1jVZjo-0002Cm-Qr; Mon, 04 May 2020 07:58:22 -0400
Received: from localhost.localdomain ([82.252.135.106]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MVubb-1jfr841YKD-00RoZr; Mon, 04 May 2020 13:58:13 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 10/20] chardev: Add macOS to list of OSes that support -chardev
 serial
Date: Mon,  4 May 2020 13:57:48 +0200
Message-Id: <20200504115758.283914-11-laurent@vivier.eu>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200504115758.283914-1-laurent@vivier.eu>
References: <20200504115758.283914-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:4ey3ye1NpyUXtC8bi3qhu9jeGu/krl8+monyixcJO2ry/Ndqd2E
 m4yRyCEDsPorj2bPBO6Xp5bTFUo59KbQtgykPkXYbfUPY8R7hDJw30A7mJC3uEgiG/3yelI
 8RwkWjsWEKQDRVHghxFMMwdkMSY8u/DNadnmGxklTZArBDLnxbXNiWom7ImNyLnrFtX0H9W
 HutkynkGyp2ZzazcWEJyQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9LBGXjpzMRM=:GtTGsuEAuj+gKcq5BcaEC7
 ciiX7FV+ZUZhlwT0HBMxGmAuXG0IZgWbRXVmAODfVrkPwIKrLBZdWPcqgHiUb+5UkX2ouXn8H
 Ine8hbTfo+4y5VURJT3Bj/sXuGDsnp45iHZwSxf4uLyo0ANsxLmCLjaJS0fHROa0KD86+z1G2
 Vzh+KiztRNqvgA8FIjht4aFXt0bDxIafyHbKEtsiIdCe19cQXlwmxOApPf7OtGByYDyTj8Nrh
 ZcQx+jzK0SEQsd5ZTDzu8OQIJeYkcMakruidID3YQTaNrphnQC+F5/QfHWMiS47zfOOpQn5XX
 kIdidjxtMsYCEBOyee3moWoriUsA++deY21x9R76+OjSw+50B74/HtpFhSlLv5fbUuy80QzuO
 71eErKyV8woJuvaqdmW9NlhVymOiGdrJmJ/grGDzt4gdtIhUeDemKlhd2DY6DdmTwKRLCgiT4
 ktpK2zElFapAZlUupzLv1D1p+CU+LTJ+/tOy3E5y229OEl1YUkCsdSjmRi9WF9zD73ORJftdY
 pQxp7liKsgf1KH6+aBRNqaXKUcvSRGVJXP/u4/cgdTGK4RbVaAv2793DJlf1AWxPqo9wPUX3K
 nNSv9ln1XFpzP0xzWI32ozXwmcpap/JF6V9XmWD1hpyNBhsQZw9M+6jyuB61SJEcmi+jIArVx
 Hex1eZlaHE/IQU5ep5pNiy9hUBHBh2Z5celIKUjs9LTL3wXhG1JROxPr9o8w21pN0sYJjcZPR
 WTvYPfZZoQk6Q+xREvgIQSc73seblIJYryLQyawOH/6eXHGKIChxdJlhsZMknXocuF4zflh4E
 bfAKUvjjOXlzpTtzwK62rGUJx0cDbawZz5LGUZSaLUqNX/xznpV47ATCGBGM7ixzup6Kopy
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/04 07:58:13
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-trivial@nongnu.org, Mikhail Gusarov <dottedmag@dottedmag.net>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mikhail Gusarov <dottedmag@dottedmag.net>

macOS API for dealing with serial ports/ttys is identical to BSDs.

Signed-off-by: Mikhail Gusarov <dottedmag@dottedmag.net>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20200426210956.17324-1-dottedmag@dottedmag.net>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 chardev/char-serial.c | 2 +-
 include/qemu/osdep.h  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/chardev/char-serial.c b/chardev/char-serial.c
index 5b833ea0773b..7c3d84ae243e 100644
--- a/chardev/char-serial.c
+++ b/chardev/char-serial.c
@@ -53,7 +53,7 @@ static void qmp_chardev_open_serial(Chardev *chr,
 
 #elif defined(__linux__) || defined(__sun__) || defined(__FreeBSD__)      \
     || defined(__NetBSD__) || defined(__OpenBSD__) || defined(__DragonFly__) \
-    || defined(__GLIBC__)
+    || defined(__GLIBC__) || defined(__APPLE__)
 
 static void tty_serial_init(int fd, int speed,
                             int parity, int data_bits, int stop_bits)
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 20f5c5f197d0..ff7c17b85735 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -379,7 +379,7 @@ void qemu_anon_ram_free(void *ptr, size_t size);
 #define HAVE_CHARDEV_SERIAL 1
 #elif defined(__linux__) || defined(__sun__) || defined(__FreeBSD__)    \
     || defined(__NetBSD__) || defined(__OpenBSD__) || defined(__DragonFly__) \
-    || defined(__GLIBC__)
+    || defined(__GLIBC__) || defined(__APPLE__)
 #define HAVE_CHARDEV_SERIAL 1
 #endif
 
-- 
2.26.2


