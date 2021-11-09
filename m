Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE8B44AA6F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 10:19:28 +0100 (CET)
Received: from localhost ([::1]:43520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkNHr-0002IY-U4
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 04:19:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mkNC6-000870-Qo; Tue, 09 Nov 2021 04:13:31 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:57631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mkNC5-0005HQ-4i; Tue, 09 Nov 2021 04:13:30 -0500
Received: from quad ([82.142.14.190]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MIMOy-1mycnn2hZU-00EQjC; Tue, 09
 Nov 2021 10:12:51 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 3/6] .mailmap: Fix more contributor entries
Date: Tue,  9 Nov 2021 10:12:35 +0100
Message-Id: <20211109091238.817997-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211109091238.817997-1-laurent@vivier.eu>
References: <20211109091238.817997-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:QbeM83FLzidANlyszufo6HJ/9+JS5wRogyeZXqX4ccxhCqwpvOJ
 Iq31+5A2RfN+o/OoJ1FslJAzysOvT/0DO7XgOqTyCAsEkxW0wwH3DXhx2dBcBS8rBz5HbY/
 WRqF57OyvVJ+31liIHwdEZ5xE4/w6a0cN6MLJYgQ2OBItRXUWa7IQbcNfA9JpNnFvPINzjc
 DDGS6OFNxeG7xGBZKllmA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BO8vJEotHjk=:RfERvBGdKfuaiBRY4rwUTT
 DMk+qEwoZIxE3aL38Igfvq5JDnz+qMRmbWpIeIA1bnXKBMBse/iABeI3LjgVWo/dT7aavHorC
 8Lib5ZSxJWMAy3Ftw+8KosjOKpvsQDp/A3efp7qtd2srmcexxh+f5sc1Bazb7J5VAqUurpqFx
 EauzqHMaucR31mkeT1F3EZal/zApAUYCbm7DSQxhplyOMg7+5C4wMPWVdu+kTDYfeZoKXvmrb
 OvUxxMzocy/dpx+YXrUZ251PUZMe+9lEvJbpW7sVW3TsqEF8PyDOkcREv5mrKDsnvSIwdpIc4
 fzkjlwU+/y8QGguNWms1W5BIy3gxAOob3rKX46k/GzV7dkcUugtPFyVb4O6cRzb2XINKwq5/2
 l/t/X773A1dp88CNv4EEduXMTbydZUPj2WLJaf2tf0I6GFPYr1kLVIp9IeE58oUTaWD0oAiuC
 hY3kL671fy2LStAZIe9MhYIeeOObkw6PdJZ9bQ45zn77l+HkGVKV5ByWuz4Jez3TWDPgxqH5J
 zr7WX5vinC2QesD9mjKFs6RF4reBq6S9CnvdLuUE166KZIb3ZgbCwCelTY8SqNPb34st5MhK4
 655Ih//8VoLDZuJIaRewKAdO9VXJrqHfh3DT8EbNsjQYKSdgo3yfdJBfkvE13LNFCtSDjDdV+
 iGOApUUAUcPwgFSw8t64UW8Ml7vlPMrEUnXrKMorxhVolqwMH3uWJo0U6okp3c7WqH/Q=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Hyman Huang <huangy81@chinatelecom.cn>,
 Pan Nengyuan <pannengyuan@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, Alex Chen <alex.chen@huawei.com>,
 Haibin Zhang <haibinzhang@tencent.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

These authors have some incorrect author email field.

Acked-by: Pan Nengyuan <pannengyuan@huawei.com>
Reviewed-by: Alex Chen <alex.chen@huawei.com>
Reviewed-by: Hyman Huang <huangy81@chinatelecom.cn>
Reviewed-by: Haibin Zhang <haibinzhang@tencent.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211027043254.1248097-1-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 .mailmap | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/.mailmap b/.mailmap
index f029d1c21fe8..8beb2f95ae28 100644
--- a/.mailmap
+++ b/.mailmap
@@ -69,6 +69,7 @@ Yongbok Kim <yongbok.kim@mips.com> <yongbok.kim@imgtec.com>
 # git author config, or had utf8/latin1 encoding issues.
 Aaron Lindsay <aaron@os.amperecomputing.com>
 Alexey Gerasimenko <x1917x@gmail.com>
+Alex Chen <alex.chen@huawei.com>
 Alex Ivanov <void@aleksoft.net>
 Andreas Färber <afaerber@suse.de>
 Bandan Das <bsd@redhat.com>
@@ -99,9 +100,11 @@ Gautham R. Shenoy <ego@in.ibm.com>
 Gautham R. Shenoy <ego@linux.vnet.ibm.com>
 Gonglei (Arei) <arei.gonglei@huawei.com>
 Guang Wang <wang.guang55@zte.com.cn>
+Haibin Zhang <haibinzhang@tencent.com>
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>
 Hanna Reitz <hreitz@redhat.com> <mreitz@redhat.com>
 Hervé Poussineau <hpoussin@reactos.org>
+Hyman Huang <huangy81@chinatelecom.cn>
 Jakub Jermář <jakub@jermar.eu>
 Jakub Jermář <jakub.jermar@kernkonzept.com>
 Jean-Christophe Dubois <jcd@tribudubois.net>
@@ -135,6 +138,7 @@ Nicholas Thomas <nick@bytemark.co.uk>
 Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>
 Orit Wasserman <owasserm@redhat.com>
 Paolo Bonzini <pbonzini@redhat.com>
+Pan Nengyuan <pannengyuan@huawei.com>
 Pavel Dovgaluk <dovgaluk@ispras.ru>
 Pavel Dovgaluk <pavel.dovgaluk@gmail.com>
 Pavel Dovgaluk <Pavel.Dovgaluk@ispras.ru>
-- 
2.31.1


