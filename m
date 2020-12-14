Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4332D9B9D
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 17:00:38 +0100 (CET)
Received: from localhost ([::1]:43004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koqH5-0001Is-Sm
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 11:00:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koqEQ-0007rG-Bp; Mon, 14 Dec 2020 10:57:50 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:42109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koqEN-0001Pl-4u; Mon, 14 Dec 2020 10:57:50 -0500
Received: from localhost.localdomain ([82.252.135.218]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MZCX1-1kbUCA2oNd-00V5aw; Mon, 14 Dec 2020 16:57:39 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 01/19] target/i386: tracing: format length values as hex
Date: Mon, 14 Dec 2020 16:57:15 +0100
Message-Id: <20201214155733.207430-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214155733.207430-1-laurent@vivier.eu>
References: <20201214155733.207430-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:UNWULujz9hEHUSm9+OQnipBIRC7mLNsQ8JttQDjL2lt7nCRPxS3
 wOhTe8HSlI3RarAjbenOqiYHnqV1PcQO45ldFPjuMYGaiouoHi9i0FURKZ552E40Ij1V/LZ
 M7HRM3fWlGK7HHSTemtxyaZntYHRrUvNi1Z7C0bUJ+dXHg8wLrl+kxW4cQFfutN+1CrrdSF
 sOTR1MSkZKQIfCqsNX1TQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Pd/eAyQIvbs=:6Qk9M3/W95GY+xuLdF5rp5
 FGj8FgImkVA1fzJyzW2rFghTwjajhoIX++XymZQPNU2VGr05/mp8yqqaMbQ93SL5sNCYokNxp
 fet2umgdkmEhyFYZm9zfi4brlozSTxztA0mhimjCQF/3i+9+eNauB4JlFDPqSEpepxWydwgEm
 q8KN0k+NBIeT2M7CZ1k5XK9RQ+FxlMuTJR5tu5L/o5KjGxCx6TTLRmE8yJRI5wBYLADNZXpMQ
 7Cb2RL4BM6E4d0hnv1LUbEuL3LgmBhRMLDOLm+semeSJoL5TH+FrsBcbiJGvAIWXaib/Gcos4
 B5hFSLLl8JEMBiPNq4gWWg8tSx0+7/kfQnWRUBbys3Rlbn46+zF/8nUXJTSdmoIe9e67esYQ2
 hRgn2nXcTF5kbneGrX2xJ6ABP0VPhjbrMcMcRWQc8qMpXU6yELIdZN4bGWEHPF96D9/5BwoGa
 sDu9FIQasw==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Dov Murik <dovmurik@linux.vnet.ibm.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dov Murik <dovmurik@linux.vnet.ibm.com>

Three trace events had a literal "0x" prefix but the 'len' values were
formatted in decimal base.  Keep the prefix and format the numbers as
hex, as is usually the case for length of memory regions.

Signed-off-by: Dov Murik <dovmurik@linux.vnet.ibm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20201103100745.160409-1-dovmurik@linux.vnet.ibm.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/i386/trace-events | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/i386/trace-events b/target/i386/trace-events
index 9f299e94a2b7..246158ae1f00 100644
--- a/target/i386/trace-events
+++ b/target/i386/trace-events
@@ -8,11 +8,11 @@ kvm_x86_update_msi_routes(int num) "Updated %d MSI routes"
 
 # sev.c
 kvm_sev_init(void) ""
-kvm_memcrypt_register_region(void *addr, size_t len) "addr %p len 0x%zu"
-kvm_memcrypt_unregister_region(void *addr, size_t len) "addr %p len 0x%zu"
+kvm_memcrypt_register_region(void *addr, size_t len) "addr %p len 0x%zx"
+kvm_memcrypt_unregister_region(void *addr, size_t len) "addr %p len 0x%zx"
 kvm_sev_change_state(const char *old, const char *new) "%s -> %s"
 kvm_sev_launch_start(int policy, void *session, void *pdh) "policy 0x%x session %p pdh %p"
-kvm_sev_launch_update_data(void *addr, uint64_t len) "addr %p len 0x%" PRIu64
+kvm_sev_launch_update_data(void *addr, uint64_t len) "addr %p len 0x%" PRIx64
 kvm_sev_launch_measurement(const char *value) "data %s"
 kvm_sev_launch_finish(void) ""
 kvm_sev_launch_secret(uint64_t hpa, uint64_t hva, uint64_t secret, int len) "hpa 0x%" PRIx64 " hva 0x%" PRIx64 " data 0x%" PRIx64 " len %d"
-- 
2.29.2


