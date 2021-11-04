Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BEB444F95
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 08:18:34 +0100 (CET)
Received: from localhost ([::1]:44110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miX17-00076j-Vp
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 03:18:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1miWyW-0004Q0-RV
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 03:15:52 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:40489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1miWyV-0000gS-7F
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 03:15:52 -0400
Received: by mail-wr1-x42b.google.com with SMTP id r8so7062921wra.7
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 00:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=op6tcWUfXp5wnwvQhmzuhKOxk82YdZD811M1qy+DBi0=;
 b=DseBFF/s/e96p3lcnWNGwGxIXSWuO3jHfQr+9gzy6RC81EgyT58EoqytU/AVrZelc4
 NlkLElK81Y1iTMZS6nw2GrSyeEaQydlIoxKrFGlTD1j9FOOVIQLLWmsaPFxO0g/Ch6XU
 tfITneuxgbB8hNHIiBDDPWZ6wnigp/4gLgG0Md3z9xVCHQdZJgV93ojDlB3BIAirnOE9
 cPDDk+gcwoMJZhDng4g9xV0GCw0KcWWluQp1o88ofv1VEjaL8boN9ZA2FfvDarOVo5X9
 QutWrvdnUQjJjWcCm2CqMcoIQ5RAUktrve3zWPNVTELTKrZSPjo9PUjRJW8zF+Q26yrh
 Tfpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=op6tcWUfXp5wnwvQhmzuhKOxk82YdZD811M1qy+DBi0=;
 b=FIR2lEcIwl14Qs0Ow6DSjK2khwjV/H8ER+iWS7zkhMNilUP86yhFrDUDuZ74tIaKN9
 wvkPxsKSB6wR8253lLzRogiuijp0/QfVjP1krD1HtkAMFe/PDXvMFgFrHEracw/33EMY
 Gov3rkYPSd9rjRVt3pZg1uO+t/FS2kTyCo07YxemkgcLXZb9d7SI5fAVO/5+wHojvkJ7
 GAfP3I4r2vSdl1HrLkA4ROPDUnPLJnNhwrdG1Nk6MKGUsMQuNyHuahm2MZcM5ZqbNVYd
 X4qrnJpnElhppzZ++nKPTs1wKOST/hR5yQMXfeNTf5kt7PIyX+2493eAtJZkndDLWcZQ
 JYbw==
X-Gm-Message-State: AOAM533LHUE+Tv8ld3qa/OmF7PoKdAXw4AnPo1Nuorbo8S2Ix/H9l4GZ
 9QMOlhYsAdnR44wDNXczjT6tp+7YO3Y=
X-Google-Smtp-Source: ABdhPJw7oktSf5+hQK3EDIrOhFQU4LgHZiQuLl7oHZ+OsFD/Sqy2WxLnSpYMYvtDSyvw2jr4ia6YgA==
X-Received: by 2002:a5d:6152:: with SMTP id y18mr42312810wrt.271.1636010149140; 
 Thu, 04 Nov 2021 00:15:49 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id l2sm7489987wmi.1.2021.11.04.00.15.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 00:15:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] linux-user: Move the SPDX license identifier to first
 line
Date: Thu,  4 Nov 2021 08:15:40 +0100
Message-Id: <20211104071541.3813306-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211104071541.3813306-1-f4bug@amsat.org>
References: <20211104071541.3813306-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Taylor Simpson <tsimpson@quicinc.com>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Tools consuming SPDX license identifiers benefit from having
the SPDX tag in its own comment, not embedded with the license
text. Move the tag to the first line.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/semihost.c   | 3 +--
 linux-user/errnos.c.inc | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/linux-user/semihost.c b/linux-user/semihost.c
index 17f074ac565..df1de3131d4 100644
--- a/linux-user/semihost.c
+++ b/linux-user/semihost.c
@@ -1,30 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * ARM Compatible Semihosting Console Support.
  *
  * Copyright (c) 2019 Linaro Ltd
  *
  * Currently ARM and RISC-V are unique in having support for
  * semihosting support in linux-user. So for now we implement the
  * common console API but just for arm and risc-v linux-user.
- *
- * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
 #include "qemu/osdep.h"
 #include "semihosting/console.h"
 #include "qemu.h"
 #include "user-internals.h"
 #include <termios.h>
 
 int qemu_semihosting_console_outs(CPUArchState *env, target_ulong addr)
 {
     int len = target_strlen(addr);
     void *s;
     if (len < 0){
        qemu_log_mask(LOG_GUEST_ERROR,
                      "%s: passed inaccessible address " TARGET_FMT_lx,
                      __func__, addr);
        return 0;
     }
     s = lock_user(VERIFY_READ, addr, (long)(len + 1), 1);
     g_assert(s);  /* target_strlen has already verified this will work */
diff --git a/linux-user/errnos.c.inc b/linux-user/errnos.c.inc
index 963ba1ce9d1..2fa8b78705b 100644
--- a/linux-user/errnos.c.inc
+++ b/linux-user/errnos.c.inc
@@ -1,42 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * This list is the union of errno values overridden in asm-<arch>/errno.h
  * minus the errnos that are not actually generic to all archs.
  *
  * Please keep this list sorted alphabetically.
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
  *  (at your option) any later version.
  *
  *  This program is distributed in the hope that it will be useful,
  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
- *
- * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
 E(EADDRINUSE)
 E(EADDRNOTAVAIL)
 E(EADV)
 E(EAFNOSUPPORT)
 E(EAGAIN)
 E(EALREADY)
 E(EBADE)
 E(EBADFD)
 E(EBADMSG)
 E(EBADR)
 E(EBADRQC)
 E(EBADSLT)
 E(EBFONT)
 E(ECANCELED)
 E(ECHRNG)
 E(ECOMM)
 E(ECONNABORTED)
 E(ECONNREFUSED)
-- 
2.31.1


