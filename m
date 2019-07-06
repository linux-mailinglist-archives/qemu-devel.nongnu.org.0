Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F032961204
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Jul 2019 17:51:41 +0200 (CEST)
Received: from localhost ([::1]:60228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hjmyT-0000rP-0z
	for lists+qemu-devel@lfdr.de; Sat, 06 Jul 2019 11:51:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57749)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <th.huth@gmail.com>) id 1hjmqP-0004WJ-BN
 for qemu-devel@nongnu.org; Sat, 06 Jul 2019 11:43:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <th.huth@gmail.com>) id 1hjmqO-0003js-Ey
 for qemu-devel@nongnu.org; Sat, 06 Jul 2019 11:43:21 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44682)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <th.huth@gmail.com>) id 1hjmqO-0003jG-7U
 for qemu-devel@nongnu.org; Sat, 06 Jul 2019 11:43:20 -0400
Received: by mail-wr1-f66.google.com with SMTP id p17so1536973wrf.11
 for <qemu-devel@nongnu.org>; Sat, 06 Jul 2019 08:43:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2gl2cLKrDxrR3f49VylrYHEEYpxAUuBiomTFTYzam9g=;
 b=CYHJvw60CwPgn7sFFUpbbeObJk6l/DaQ+ym+pwCUztFFRoRPU00uGtaYlaaVilXVhb
 d13+l0GRgfEz7H2cDrYRnOsX7Ol/LWi/dYoWrhcM942hauH63OFLQ7bpLvk8767wrazG
 E6Jj7AJ7RHC7ItqkSFA9s8VoMchpm41XAQrkiU/Oegbq6f9K08otvuBqmgPgA3bRJAkr
 QV4UcwKocQNpPl7oCzmKxK6XePwFg8lkuU6PH3nfvUfTnhnmlDKYhnIf9GHMYE5GmSXb
 po96kZARRiSP+CD9zq0fAFa1fCgJDnSug7yBYfMuDzU+4aGjdpyZ9ICCnWSRYL6j7wvr
 dmXg==
X-Gm-Message-State: APjAAAWMF8D+88UkaFi5q/5LL045c+zY5dNZm0pTWJ/DKnWFT1iat+8H
 8VRmGLv2ltXc9bq1Ddi6xgCv6F4k
X-Google-Smtp-Source: APXvYqzjX1qbS0aYe1OxLjhihg8Bqcxs59GurY5DlZ4VSLNY2dhrQPYI/WB7dVQZzQ8+C+KyXZ9Rsg==
X-Received: by 2002:adf:82b6:: with SMTP id 51mr2977204wrc.309.1562427799181; 
 Sat, 06 Jul 2019 08:43:19 -0700 (PDT)
Received: from thl530.multi.box (pD9E83551.dip0.t-ipconnect.de.
 [217.232.53.81])
 by smtp.gmail.com with ESMTPSA id h6sm12393850wre.82.2019.07.06.08.43.18
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 06 Jul 2019 08:43:18 -0700 (PDT)
From: Thomas Huth <huth@tuxfamily.org>
To: qemu-devel@nongnu.org
Date: Sat,  6 Jul 2019 17:43:08 +0200
Message-Id: <20190706154308.7280-5-huth@tuxfamily.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190706154308.7280-1-huth@tuxfamily.org>
References: <20190706154308.7280-1-huth@tuxfamily.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.66
Subject: [Qemu-devel] [PATCH v3 4/4] m68k: Add an entry for the NeXTcube
 machine to the MAINTAINERS file
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I don't have much clue about the NeXT hardware, but at least I know now
the source files a little bit, so I volunteer to pick up patches and send
PULL requests for them until someone else with more knowledge steps up
to do this job instead.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Thomas Huth <huth@tuxfamily.org>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2cce50287a..539f8a6f10 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -910,6 +910,13 @@ F: hw/char/mcf_uart.c
 F: hw/net/mcf_fec.c
 F: include/hw/m68k/mcf*.h
 
+NeXTcube
+M: Thomas Huth <huth@tuxfamily.org>
+S: Odd Fixes
+F: hw/m68k/next-*.c
+F: hw/display/next-fb.c
+F: include/hw/m68k/next-cube.h
+
 MicroBlaze Machines
 -------------------
 petalogix_s3adsp1800
-- 
2.21.0


