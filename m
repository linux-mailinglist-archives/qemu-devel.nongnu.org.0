Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83419441557
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 09:32:57 +0100 (CET)
Received: from localhost ([::1]:47248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhSkS-00050d-M4
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 04:32:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mhSfh-00064i-FE; Mon, 01 Nov 2021 04:28:01 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:56097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mhSff-00086m-HQ; Mon, 01 Nov 2021 04:28:01 -0400
Received: from quad ([82.142.14.190]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MzkK9-1muKl40eLR-00vdE9; Mon, 01
 Nov 2021 09:27:51 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 2/6] hw/core/machine: Add the missing delimiter in
 cpu_slot_to_string()
Date: Mon,  1 Nov 2021 09:27:43 +0100
Message-Id: <20211101082747.2524909-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211101082747.2524909-1-laurent@vivier.eu>
References: <20211101082747.2524909-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:QddQ3rLccChP6nxlP3XsQPXwm6UskLoP5XQvGK1/uBB/uGuwu72
 NAoKMRHTs3WDytQOkSQQ/9s0TPxJliLv26IQbF2AFx0+UgPz58+U4HNwZhfasY8sd9OuSYe
 Es7y6gbqzAoHqQhIVMGkXx0Eca3unhNgQJySwDI9yJjGLLEo2Y4qwXJQmV2zpsS9FR+nyjb
 vXKnCs3rzLhe2VyehTBTA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:W2hb3MzyiPk=:nxtKNTVHNyDZ7oLbmXhPEx
 txH8Wjo8EX6fYM2gg19xYy7GmvaLXoy3ZFmoHum8GC2KeitTXPM1x+Nre+UzVACEQ2eapFWPJ
 UL8cRgmQZOyuT7/dn/DBtqBTgihwb/KcV4F+wrnEOhpQXIq3nrRVRICO8Bs10yXRXlVZtl2qX
 vj0iXbqXp6MSYMA7OceYK90jca6n607hboO79xClAw7TDHi1L7yS3QxhpeZugdEpM0m2jWkuC
 vN3fghmHcRx1xwGFOKRHBnUS3R98PyhRiY+JlzNEQLyR4u1SOgm+duek6uNvrZU4NvVji0Mbh
 i+FSnCdW+75ISfx12nasv2PcqQA33Fdbmv71oMzuRQMlRWTZtp1N005dP2TcX6B6p8nb1psFd
 in27o84IhRBcEHzpSZ0myfJ8eMphDS3BVapqrR0elXJRuuK5z6ZQH7KmDPumdeF8qN1PNATRO
 POpb8O9mrDs9Jl7781FQzrIi1k11CBaZacDSJlzEKefCEJtCakWwXohcZKcHtBV5s3auDfXfz
 tB4ZuJp28RG6rXPGWGIlzYpTjrCCcpoGE/xAurHbEXpcwTKomPlw6GoTzRdTXI+Fyu4FjXybw
 GeXDhh++SSQb03wEidQLJcPFTOr2DHPTugM/cIu3aF359HTT1M91OgcVgUR1USFhduluL0oTD
 TnYrSBw4PXExGpE88hjjR7IfOmuef7gtstA0AwFnQ/tC5i/fLZjgWsCCPg94aeWR6wps=
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yanan Wang <wangyanan55@huawei.com>

The expected output string from cpu_slot_to_string() ought to be
like "socket-id: *, die-id: *, core-id: *, thread-id: *", so add
the missing ", " before "die-id". This affects the readability
of the error message.

Fixes: 176d2cda0d ("i386/cpu: Consolidate die-id validity in smp context")
Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20211008075040.18028-1-wangyanan55@huawei.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/core/machine.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index b8d95eec32d4..0a23ae310606 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1157,6 +1157,9 @@ static char *cpu_slot_to_string(const CPUArchId *cpu)
         g_string_append_printf(s, "socket-id: %"PRId64, cpu->props.socket_id);
     }
     if (cpu->props.has_die_id) {
+        if (s->len) {
+            g_string_append_printf(s, ", ");
+        }
         g_string_append_printf(s, "die-id: %"PRId64, cpu->props.die_id);
     }
     if (cpu->props.has_core_id) {
-- 
2.31.1


