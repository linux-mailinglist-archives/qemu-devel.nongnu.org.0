Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A0244AA6D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 10:18:06 +0100 (CET)
Received: from localhost ([::1]:38268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkNGX-0007Gn-7j
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 04:18:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mkNBc-00073Y-OP; Tue, 09 Nov 2021 04:13:01 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:53411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mkNBa-00058i-4N; Tue, 09 Nov 2021 04:12:59 -0500
Received: from quad ([82.142.14.190]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N9dbx-1mhVQH1Qlp-015ZRj; Tue, 09
 Nov 2021 10:12:52 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 4/6] meson: Fix 'interpretor' typo
Date: Tue,  9 Nov 2021 10:12:36 +0100
Message-Id: <20211109091238.817997-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211109091238.817997-1-laurent@vivier.eu>
References: <20211109091238.817997-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:TtJwTnCxONuZt8znPcHHQdywr9N64GWNKm8l8BcmBE0crn8siIZ
 NNgpmILpKLfMh0A3MlUfTK9wl9KnPa7979oWytJ8oj17fcsla6yvjPg2A2jTx+gxQ60xzfp
 W/zEOnJV9yjs5QkpvJz96EmuXnOT4/55p8bk3FlhEM4x0VDEQyGzczDqsC8L60IWiUFJfCD
 Pq+kX72vFVu8BiNNjHBIg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3h2T8twt83Q=:uE5iOpuH1pkNYlqdupdcah
 tB/Ov2DuyBxcr75Gp7lbXodHf2zOvfAzH7iJqGVVjJWBDnoSeX3RQs2Rc8wKd1xEOnhN4eQmQ
 lxtjoIBgw0veFL1G19clhPssGmuKCQR7LYyRdVuqPTCpbtjlxc8EMatV1WQ191JIlZiBrmj77
 95PTy9Io5hw6YMz4pDxH/if/1RzapGCHoSugjfFl3O6ylOoef6/Ainm4GwyLgemK4SR/yC8SA
 trk+SlNM2EiPk6OFvL/86kKche6qdD1a8zi4+CTBgSP5n4JcWlFu0Zj4iHoy0OmV80xFt8GlM
 ldt2BEUw7bCvMjoY/8hrD+dy3tZOVM9myOP9Q7SmdTldEhxj4KqnANYoqm41LzDe+b2y7UEUl
 jNRCaZpklbBjR58ojgh/IkuucKp6nC24AJIw3+M03QV7XKzJAfNDEkeFNf9NA4ndWSUnxdT6M
 4Jts5lfcPFgQvZkEq6YKVzFItDlqPyyf1y+sQ1eeOVIcN7VcF78pxWAK+kGRfZlz8p6XNVDdd
 w9rC3lKPMDHNyXHgZCJZLW0nD7Ca5K1E4vxwswTK/L0pi9AqziOQVfKVGjDDT6T3hbOBHK0bj
 llYH9wjV70efkdSQLE4oZ5EWWTcUXJCyp16uDUeonso6pbNtihYqqynZErYNvvCCrmUqyPkre
 8/F84rQP9YHvvpOOFIsmYmD4bIpcPE6gU4tLq6Y59Hx60e3674JVmPGJ//uGcrL1FKp4=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Fix a typo from commit fa2f7b0b9b7 ("meson: Warn when TCI is
selected but TCG backend is available").

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210521103423.2780345-1-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 6bfed294d07b..9702fdce6d03 100644
--- a/meson.build
+++ b/meson.build
@@ -340,7 +340,7 @@ if not get_option('tcg').disabled()
       error('Unsupported CPU @0@, try --enable-tcg-interpreter'.format(cpu))
     endif
   elif get_option('tcg_interpreter')
-    warning('Use of the TCG interpretor is not recommended on this host')
+    warning('Use of the TCG interpreter is not recommended on this host')
     warning('architecture. There is a native TCG execution backend available')
     warning('which provides substantially better performance and reliability.')
     warning('It is strongly recommended to remove the --enable-tcg-interpreter')
-- 
2.31.1


