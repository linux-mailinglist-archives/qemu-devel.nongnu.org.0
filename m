Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5921D47955D
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 21:18:53 +0100 (CET)
Received: from localhost ([::1]:40136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myJgq-0002md-DJ
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 15:18:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1myJYm-0005zw-C3; Fri, 17 Dec 2021 15:10:32 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:60303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1myJYk-0001KQ-AF; Fri, 17 Dec 2021 15:10:31 -0500
Received: from quad ([82.142.30.186]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MofLl-1m9pVY3vKL-00p4H2; Fri, 17
 Dec 2021 21:10:26 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 8/9] tests/qtest: Replace g_memdup() by g_memdup2()
Date: Fri, 17 Dec 2021 21:10:18 +0100
Message-Id: <20211217201019.1652798-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211217201019.1652798-1-laurent@vivier.eu>
References: <20211217201019.1652798-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:IRl181831kfe7Kst9/qSnJ/Ub6AHW1ciwDNOZLIa4NxnFzqvaMy
 Cq54sPP5afFS1QtMXhfEYkCQQfia/q8NJaJ6ctFMrp/Ew2REO4AxSmoXuTibQcgLKtSvISd
 EY3UEbyIiKbU8NLbuTS6kGYzEe3fiTwLnjUHfYly3rjnsQ3agS3Kh8Z/uNrqSWzx6MMtv2m
 h8E+4HAMXwl8x7BjCIOHw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:QkQYXng95t8=:fP3L+dRY7rM693uG46DOXe
 uxZLlBY9X7760qkYrZaRwIBlUO/Gsvb6hLIZDZGyhIu5a7H5YMqdgJRhaPArfjXyfRHm4VS+u
 cDLg5PQ/0ISElcNMA2XyHRE2NecUxtlx0NAStj9nJwEs6uJGCWNENU/hmc/v023/JfpTFEFxn
 WkWyf2uoT1cnAZfwRbroI2Ljg2qyD7MUzJYpZqyGmF4fmyMmjX8npvuKT9D7Kam6PJiFnWxTb
 Bb6wOwl8GupCA0QC84AvZ8Xl1Fvfx6DB5Xm6/s0AqgbPpLWg3WJ1Ef7OAyxlnYTdzuZPgzKR5
 TZNkjDuZWtKXtxnqoXTmJYGIJatQhTpbn3nP3I84F/ibXbU2KKmS+/sgewbyoMwRbY3ODZg2h
 i6gt/gHD0wfUcUpb46++gf4Ns3yB41/YzZBg9UIOixV74wLcPloU0fBiBLYW09YPZgvCUHAC+
 uAgJ9gXMwUe3qOHEGX+Ro+q64l13JtYbKpF6VGCAGWMawh1g2K9opkdObdY32aeCFLj1KGVoK
 89F6XGvtVXQNAcUS9IGDi0mL0kkujrCmp6DkcMV+RireKBW03FI77axkYCIPoxkDSs7Itzft1
 DsAAhwn5aIhOk8UVf7T3Qs+jz8EvfC3GoOXxpdVROnEsC2mvmhXpav2YZaKagZB+10sr3R54o
 i1Ox+IWlbhaOk4+WGT2yu5xQ3jsj9KL69j0SCMFaz48VneY/DHZ2QAEkf2mx/d6YfNLE=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
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
Cc: qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538

  The old API took the size of the memory to duplicate as a guint,
  whereas most memory functions take memory sizes as a gsize. This
  made it easy to accidentally pass a gsize to g_memdup(). For large
  values, that would lead to a silent truncation of the size from 64
  to 32 bits, and result in a heap area being returned which is
  significantly smaller than what the caller expects. This can likely
  be exploited in various modules to cause a heap buffer overflow.

Replace g_memdup() by the safer g_memdup2() wrapper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210903174510.751630-25-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 tests/qtest/libqos/ahci.c   | 6 +++---
 tests/qtest/libqos/qgraph.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/libqos/ahci.c b/tests/qtest/libqos/ahci.c
index fba3e7a954ed..eaa2096512e5 100644
--- a/tests/qtest/libqos/ahci.c
+++ b/tests/qtest/libqos/ahci.c
@@ -639,8 +639,8 @@ void ahci_exec(AHCIQState *ahci, uint8_t port,
     AHCIOpts *opts;
     uint64_t buffer_in;
 
-    opts = g_memdup((opts_in == NULL ? &default_opts : opts_in),
-                    sizeof(AHCIOpts));
+    opts = g_memdup2((opts_in == NULL ? &default_opts : opts_in),
+                     sizeof(AHCIOpts));
 
     buffer_in = opts->buffer;
 
@@ -860,7 +860,7 @@ AHCICommand *ahci_command_create(uint8_t command_name)
     g_assert(!props->ncq || props->lba48);
 
     /* Defaults and book-keeping */
-    cmd->props = g_memdup(props, sizeof(AHCICommandProp));
+    cmd->props = g_memdup2(props, sizeof(AHCICommandProp));
     cmd->name = command_name;
     cmd->xbytes = props->size;
     cmd->prd_size = 4096;
diff --git a/tests/qtest/libqos/qgraph.c b/tests/qtest/libqos/qgraph.c
index d1dc49193055..109ff04e1e8f 100644
--- a/tests/qtest/libqos/qgraph.c
+++ b/tests/qtest/libqos/qgraph.c
@@ -93,7 +93,7 @@ static void add_edge(const char *source, const char *dest,
     edge->type = type;
     edge->dest = g_strdup(dest);
     edge->edge_name = g_strdup(opts->edge_name ?: dest);
-    edge->arg = g_memdup(opts->arg, opts->size_arg);
+    edge->arg = g_memdup2(opts->arg, opts->size_arg);
 
     edge->before_cmd_line =
         opts->before_cmd_line ? g_strconcat(" ", opts->before_cmd_line, NULL) : NULL;
-- 
2.33.1


