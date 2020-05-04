Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4641C38DA
	for <lists+qemu-devel@lfdr.de>; Mon,  4 May 2020 14:06:02 +0200 (CEST)
Received: from localhost ([::1]:50218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jVZrF-0003g8-1b
	for lists+qemu-devel@lfdr.de; Mon, 04 May 2020 08:06:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1jVZjv-0003Fm-FQ; Mon, 04 May 2020 07:58:27 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:33607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1jVZju-0002Kn-IN; Mon, 04 May 2020 07:58:27 -0400
Received: from localhost.localdomain ([82.252.135.106]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N0WLC-1jAu9Q0ko0-00wSMw; Mon, 04 May 2020 13:58:20 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 19/20] hw/timer/stm32f2xx_timer: Remove dead assignment
Date: Mon,  4 May 2020 13:57:57 +0200
Message-Id: <20200504115758.283914-20-laurent@vivier.eu>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200504115758.283914-1-laurent@vivier.eu>
References: <20200504115758.283914-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:B0v5PS5FzGkJUIZ/DZYt5bnNSFZBdjwZmywtjpJSSg6ugyLkh7H
 ClGgtdLmYVBhtTW4LcjJr9kXc6bFnCw0S8lx+1qRKd5RlTet7TNzXwXccEWcpm8W0emO5uD
 f4bYUU3NSQTtmjuLhdVp40W9WutMrbt75D5GvtjJJF4uVUO/pbz/vVQv+QhJ6bcDt0UeTwx
 ht43JsoamDUTPs+upNTqw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Fk4BJp7nlOQ=:ctjjVVGutJ2OQZh20l2cYq
 zlRqLqw89D6DS6+DTuEZqiEPaXCLyGi3ZGIXGyBTA9Ww7ap8BZEK8gzZZ9VwmBtZmDSl3YMTa
 TPb9ggsgFNN35hGMhA5/lYQyzWquZA3CSB7R8v0nmkgKckxoF9vgaB82PEUCH14C1sW/Esvmp
 2amY/nJtzegRQNfwIloG6dk+laPTLnsaQFRJdNANh6W4ZRFIfUG5/edflW4XTnbS9dIQhNjxr
 gCt2ij8LE4/f8963FdaZ4uXHcU2jJaz6t3zDN2sDeIIUI/j3nqsfGXXx0NxIiTTHKiEIBLIMp
 2427CI05uKXDBkJCsWITLonHTq/3OsMk7zgfBEduFi1IxrEABvzgrsswoy8inRWTyh/0lgkoV
 m7LNtke75tMcE4u0MIZw/LXFF2RQ9RjI7MGrEYHIDHae3rluTz8L7X1ve0hZeEjIiBGx4Vp0F
 Ao23xriicMcmil8ysV3l/QINBYVbzGh1TP6u0B8doC7EMwt93GmNVps8cDJeBqtsZ7SoQcrT0
 FfUPtObz1g9a8VgI52q9Jt+0Lov52Th2uN4XqRmuVaJnWWX8H8cbZroMHUBhqkDke0jzK3i2z
 ll6CWCiL2yuikG7nDJE1yEcldwGkhHUeWHdYMTsdGPPzKH2cYjvcs54LjGHflm9wHLNwcI9uY
 Ds6sDZKS8UzAZM6hBTnktq9u7jG+dIZ2C7BTZ+VCud9Kp8VeC71qJ2l4/N3hRPRQB38h5TyxM
 BKb56B0CFIfQ5lA+vvDStcnvbagSsFXWG1seJPwy2ZyOxaeKZUnNZFMxxe0QfdUNCyh9wKB3M
 H7nMditOoJD2U738LpDq4ifW5Pr92ies7rDxEdL9+2zZuECoeo+WGOYK1rs7EU+yu1k6xv/
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Fix warning reported by Clang static code analyzer:

    CC      hw/timer/stm32f2xx_timer.o
  hw/timer/stm32f2xx_timer.c:225:9: warning: Value stored to 'value' is never read
          value = timer_val;
          ^       ~~~~~~~~~

Reported-by: Clang Static Analyzer
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20200422133152.16770-9-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/timer/stm32f2xx_timer.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/timer/stm32f2xx_timer.c b/hw/timer/stm32f2xx_timer.c
index 06ec8a02c250..ba8694dcd349 100644
--- a/hw/timer/stm32f2xx_timer.c
+++ b/hw/timer/stm32f2xx_timer.c
@@ -222,7 +222,6 @@ static void stm32f2xx_timer_write(void *opaque, hwaddr offset,
     case TIM_PSC:
         timer_val = stm32f2xx_ns_to_ticks(s, now) - s->tick_offset;
         s->tim_psc = value & 0xFFFF;
-        value = timer_val;
         break;
     case TIM_CNT:
         timer_val = value;
-- 
2.26.2


