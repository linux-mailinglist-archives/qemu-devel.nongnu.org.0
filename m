Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 316503AE7E9
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 13:09:08 +0200 (CEST)
Received: from localhost ([::1]:51544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvHnf-0003Sa-8a
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 07:09:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lvHjg-0003Bf-PW
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 07:05:00 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:39929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lvHjf-000420-1F
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 07:05:00 -0400
Received: from quad ([82.142.1.74]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1M6DrU-1lt4oJ3zc8-006g1l; Mon, 21
 Jun 2021 13:04:48 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 3/9] linux-user/trace-events: fix minor typo in format string
Date: Mon, 21 Jun 2021 13:04:39 +0200
Message-Id: <20210621110445.231771-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210621110445.231771-1-laurent@vivier.eu>
References: <20210621110445.231771-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:4uUQ4qhAiTUM6regz/BsQz/5xgUPwQRDtRX38l9aJh15JYp7eNA
 BMCVdFFmdE6MJ/tR4sPpZMxW7jmVqwxs9TKoJxQKZUwgBD4kpGv6dc6MaVjSRlpO6W6ZgXL
 cnl+Agu8nb+7U3/DcXnxQxNexnY4Z/gfMwPICL0PXg1HsF8zvu0yHZscpwX8d1gnrSxyA10
 D2qPpfsijv9qTnRL3tvvQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:pfjbblathOc=:KFDgspoNb/g+n7B+UCV/MZ
 Yoy0aE5cDSUJYYMeq0sxQfViRyqArHXldX7HrQzfqtxWnZXLg0aYI/NMhn+H/JNCURDveESLT
 anlyy/xduB4UrKHF06YN4MzcfQ+Wlr2vRxWwYE5qxbJuWJ8g65UGo4KZR1w19AhSGYiuLTrtk
 kvA+yF0uyaELmXm5goI/FWDMI0jRbaOugXLyCcDyeBTJwzd1Q5LaRhwyYTlBmfdGrTiIbx+9S
 hUfl6rbQ88G4SMh94nNNcV70e3Kt8VhLa5iLgRR7UXA8w7PvpdiXaC7Tm8hK90UERCurEJIhw
 oyVd9TdxUHrlzg6Ev70UQF4A9WOVMzvxCvd1nhnGTGYvrgh+YupeFz/JOedvfc53eILE8gpEP
 xnRMVFyhti5zImijxyR3/CYV45TPdsvhdv372vL1poFjYKlE5gnRlp/wtdl5YZluB5LEZlV2M
 1Yua8xE5MKAD7mxTE0Gd9U/vPGwUZlmN4KR/oVugzlL7e9rtbIHBpewyHdak+pdE+MPiqoSTX
 Uw1bgOYXire0WYIteCIFA8=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Bennée <alex.bennee@linaro.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210614144245.17660-1-alex.bennee@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/trace-events | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/trace-events b/linux-user/trace-events
index 1ec0d11ee3a9..e7d2f54e9401 100644
--- a/linux-user/trace-events
+++ b/linux-user/trace-events
@@ -11,7 +11,7 @@ user_do_rt_sigreturn(void *env, uint64_t frame_addr) "env=%p frame_addr=0x%"PRIx
 user_do_sigreturn(void *env, uint64_t frame_addr) "env=%p frame_addr=0x%"PRIx64
 user_force_sig(void *env, int target_sig, int host_sig) "env=%p signal %d (host %d)"
 user_handle_signal(void *env, int target_sig) "env=%p signal %d"
-user_host_signal(void *env, int host_sig, int target_sig) "env=%p signal %d (target %d("
+user_host_signal(void *env, int host_sig, int target_sig) "env=%p signal %d (target %d)"
 user_queue_signal(void *env, int target_sig) "env=%p signal %d"
 user_s390x_restore_sigregs(void *env, uint64_t sc_psw_addr, uint64_t env_psw_addr) "env=%p frame psw.addr 0x%"PRIx64 " current psw.addr 0x%"PRIx64
 
-- 
2.31.1


