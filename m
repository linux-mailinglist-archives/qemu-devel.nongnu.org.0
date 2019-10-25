Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E510DE4611
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Oct 2019 10:45:42 +0200 (CEST)
Received: from localhost ([::1]:57624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNvE5-0005eN-BU
	for lists+qemu-devel@lfdr.de; Fri, 25 Oct 2019 04:45:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49790)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iNv4w-0000eG-7a
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 04:36:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iNv4v-0007oE-78
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 04:36:14 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:39421)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1iNv4l-0007fP-Jw; Fri, 25 Oct 2019 04:36:05 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MGzI3-1iAOHL1E8J-00E7YF; Fri, 25 Oct 2019 10:35:28 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 04/19] event_notifier: avoid dandling file descriptor in
 event_notifier_cleanup
Date: Fri, 25 Oct 2019 10:34:56 +0200
Message-Id: <20191025083511.11463-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191025083511.11463-1-laurent@vivier.eu>
References: <20191025083511.11463-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:/ygMbVZUdrFShG2v+IwnlPx6NIe+igwbNnW32CPAFZuGdtiUZh9
 0Ag7mN+G3qOA/JlMXTSSzZMY2YZxxMu+jxcdUV3RBC7q7YF4hZCrD2ewOCsG35HyemMQOH0
 s0OumAT5NnUORhCIcj+oZsgEWy/CdihNGmfwGmsa+EE/XjFUElfWapjzoTvtvcHW/qPABLp
 6f9lJd4xJqi8TuaIrEc1w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5TrCoAdjS+w=:JrwOcPzSsGryCaoDQey2WN
 BPSyYWdhIqoa2zPIH+8m0tRxMWYzgJeURfgN80r3PI55IGpPXSaQVKckmk2aw2FakezM1KNvR
 iaL4KW4/ESiWbew9xuUkGWBIlNsDtXFo1rUm5ETB2o+zwg2WJS5Y7fpnBvNBof5p2ntYqYcYH
 2oUdz0ZC08JmvE0Uorr9MKPnAgyVhOe51awoiAx69gQ+jZtduR2RARiNL3+WAdA6TvFPlmtEE
 zScXw3SnBZcSq2yngSGSz5CojOq+DjWNSYx64PoY2OaZxilz77wwNxaLbWQITVscS8ij2I0zO
 RZV4+/fft28sCQ0g7echHzRsio77eFLJ21ZcAungNlpoiRYe665tM9yi/0IsEbBY7+R3qCLAl
 hBOHSDzhpnzItNTYSUrE00CK6sMb5XJfSKZAOCifukifEcQpXnsMYP0fZeT42VtLFAHeThLEf
 biJTxCnF43gHscNjwlkVZCGtQ5ZXXEHX8gJGsIHQZckdS9cHZYUKXBgSgmKAkJ4eiDd6yLpsY
 O6ozRs2rtdX6ZZoJe/4W0Zk2VbSCErwPOtzKMvu5NcfgBIozzzwftvChf54tfL5Be98lH5RNJ
 U/kcZNIO4iD+lUokltU4qnXR+TuC5jgAc9mz3j+vZ5uHKvCbYsqFIIWBeSIEOI5q4dyciz7Av
 rUG1DPiITW5Z6SsUwNyr75tW7wiRQj/vTZEybtmCWRQB1RfT0+FkHheGDOwvSuZuytzHOGbwy
 V/iRz6zkE/7JTv/WY4IUYXcBnzqVPXcWPyCs5siSV/9yjkTqtiFzSOUht7EmqvES4tkATwg7T
 pSyk4iZJtGvt1Hx0rJOXL4UeBAOJKlbnvXC65JhX+VkTjHJ/4wIn7N9+IdfU/KeRGF1l7wTlQ
 dQvEq5Ok5NvynbHdU6tw==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.134
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, David Gibson <david@gibson.dropbear.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Andrew Jeffery <andrew@aj.id.au>,
 Laurent Vivier <laurent@vivier.eu>, Aleksandar Rikalo <arikalo@wavecomp.com>,
 qemu-ppc@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Frediano Ziglio <fziglio@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frediano Ziglio <fziglio@redhat.com>

If rfd is equal to wfd the file descriptor is closed but
rfd will still have the closed value.
The EventNotifier structure should not be used again after calling
event_notifier_cleanup or should be initialized again but make
sure to not have dandling file descriptors around.

Signed-off-by: Frediano Ziglio <fziglio@redhat.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20191023122652.2999-2-fziglio@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 util/event_notifier-posix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/event_notifier-posix.c b/util/event_notifier-posix.c
index 73c4046b5871..00d93204f988 100644
--- a/util/event_notifier-posix.c
+++ b/util/event_notifier-posix.c
@@ -80,8 +80,8 @@ void event_notifier_cleanup(EventNotifier *e)
 {
     if (e->rfd != e->wfd) {
         close(e->rfd);
-        e->rfd = -1;
     }
+    e->rfd = -1;
     close(e->wfd);
     e->wfd = -1;
 }
-- 
2.21.0


