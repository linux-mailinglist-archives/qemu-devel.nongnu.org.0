Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC43334A49
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 23:01:36 +0100 (CET)
Received: from localhost ([::1]:34012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK6tb-00072c-T6
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 17:01:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lK6eA-0003CV-5p; Wed, 10 Mar 2021 16:45:38 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:60819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lK6e3-0004TP-Qe; Wed, 10 Mar 2021 16:45:37 -0500
Received: from localhost.localdomain ([82.142.6.26]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M8hEd-1lODEy0nx3-004gQL; Wed, 10 Mar 2021 22:45:25 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 17/22] qemu-common.h: Update copyright string to 2021
Date: Wed, 10 Mar 2021 22:44:59 +0100
Message-Id: <20210310214504.1183162-18-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210310214504.1183162-1-laurent@vivier.eu>
References: <20210310214504.1183162-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:KwmlUpqRcQzY4R/tRkHoVqRPTyi5mx0LYp0jJgzzutNPwWS5Uzt
 AaYqTJOwos4Fle+E8G12vP7ajNv68BPqk+1GHBEH1pANhw1BH2sfIWlWROMinyp0kmp4oLe
 AAUx66CYW7k2LKV1wZQAUG8yCFxPtphZuPEyCp5BWDABpPTnTEEny5BBkLFo9a6t87eUPjd
 tOC7za23EY5/zCZLhe1iQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rNLk5RauKIU=:n6dyawkb6z9g40AC/2BqBU
 482h3+nnv4KQmDKEQFpRudsgb+/BI425aSFYC/8xIc9iITpJe8olDhA8409uXZDNjvnuHofwe
 ZlJdK1+a0hDq6u3bYIcgmpz8wF4gAZC9eQ5kbp1p29AGdKGegcWhx4dh7JiYPaH0qgLw8bv+z
 q1H4U0kQIhWo1JZKzZ5qkYmKrH8Ql0r9PpXMlqbfN96CzwNf6YRIJOgqKQXOVWGpFeKfUa9z1
 PMAQqY7iCcEMWYxcNWkV2wdLKb2jRBIghW/Iea3tqLRUC2iQHzEFw2+Hn5PhbzdhqUTzn0zba
 lQmCOJy9yIlMZesSQch5XcU/YqpdDwwIgIwHXdA2JesG/nRCpP3XW29wO0iJ+UvpmA7uMXb3h
 1lwhA+ASe8Oa6UThX2d2FLePg16cQmTWh1XZH36NWiiNjMf3CM+Vse3f58Kfbwb1StlXpufCs
 hzHzQYZNKQ==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

Update the common copyright string that we use in
-version reports, About dialogs, etc, to 2021.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210309162258.28633-1-peter.maydell@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/qemu-common.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qemu-common.h b/include/qemu-common.h
index 654621444ecf..73bcf763ed82 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -13,7 +13,7 @@
 #define TFR(expr) do { if ((expr) != -1) break; } while (errno == EINTR)
 
 /* Copyright string for -version arguments, About dialogs, etc */
-#define QEMU_COPYRIGHT "Copyright (c) 2003-2020 " \
+#define QEMU_COPYRIGHT "Copyright (c) 2003-2021 " \
     "Fabrice Bellard and the QEMU Project developers"
 
 /* Bug reporting information for --help arguments, About dialogs, etc */
-- 
2.29.2


