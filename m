Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1905F1395
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 22:23:28 +0200 (CEST)
Received: from localhost ([::1]:39208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeMXf-0007DT-Nv
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 16:23:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oeMWB-0004WI-UJ; Fri, 30 Sep 2022 16:21:55 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:32967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oeMWA-0004aq-4n; Fri, 30 Sep 2022 16:21:55 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MvJsF-1pUx0F1VLt-00rFwl; Fri, 30
 Sep 2022 22:21:46 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 0/8] Trivial branch for 7.2 patches
Date: Fri, 30 Sep 2022 22:21:36 +0200
Message-Id: <20220930202144.1109310-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:B4vW5OmhCq6SyGacy58LbFS0/QJMlWvimpYsl3Qmu011c/cEYaS
 eIvod/jJChK3V+VN7UhyNVkLmwxIj9hOapGTc+ZMEwdMt4Oxp5RoFaFpZtwIUjQMT8CaI3Q
 q675An8CG/q73z+v3140ATfZCCwn+NkH3kO1Pl5GgdcHwXM3QGL7hUeNuZpnq2d7am7W4CQ
 LzhjQOPOeXMpyJZHTCBcg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:cMnAHlUWubE=:XtUmd69tPEn+233WN77/1g
 jsLjEJH0FKPaoRbCd7ZTUWirdvcIWnvMEOCe8sVdujTreTVR27ygRO6yaB9p2a6uZByk9vmzu
 NAshfSfJf9vVa9K/xZlPCta06lDPbIagmJUnLI0thcWjfkzVN22jobAT2dM9t0+BIzmWsO9c4
 4hhx7Kgd9gtqVFY/dTa4rq4J1ZQOY4amM7VjNmDW1uLJ+5o2QsyF1n9LXEOsAA078EvOYYFAU
 YV0MeDcR8Po6aaY+Y5D4EsoHdXdioRuUVbihUwIcSRMbTIMsl1eY8KuWJxtaF0M+yoqowedo4
 KOLIdw3jVWqSjyeh+QDJTLdnbiDoE6yA+DqRIZoJeARQiId3bSqVHhYS6XYVG4w0z3y7lTlxj
 R5Uigf0iYXImrY1YhjivLlS14PztikFIJbvJ+eGYp5n+JCYSCxQt+srlbVEwI0OlCXO7/k722
 OxgY3la5JD9uMNEN6oVHXT/rRuulhvv41Z01OIjHX0QtMbHNXmnPmqBr9oQCyMa/mel50jqn6
 RbBsFGE0M5TriSAN1Qp8WJT/0fWUyjMeSMPgThHaRum2ZibtlCeCgphiupNTKD4QF4jMMqrve
 khUhb+U9hCQA/a/TKG1l5rfJRw4aCmP/sAiX61D2yIWbII0av/7I8x9WIGnQRuv02LlG0ePNA
 aPFprVmsG0n1csevTT/4TZZScV0+rMoS5sumzRaTIcw6xB5Wij7eJgf79ISrlzh9krEWE9AZ7
 agCa31BWL6RgpPROGsassnGTf7Ss8c7w3CewwtnW0qtDhjreI6QBs+39CdFtwEUE/7dVhXZYm
 Sdobr0I
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit c8de6ec63d766ca1998c5af468483ce912fdc0c2:

  Merge tag 'pull-request-2022-09-28' of https://gitlab.com/thuth/qemu into staging (2022-09-28 17:04:11 -0400)

are available in the Git repository at:

  https://gitlab.com/laurent_vivier/qemu.git tags/trivial-branch-for-7.2-pull-request

for you to fetch changes up to a40ee29bbf3c169597d85f0871d189398b667d9f:

  docs: Update TPM documentation for usage of a TPM 2 (2022-09-29 21:31:56 +0200)

----------------------------------------------------------------
Pull request trivial patches branch 20220930

----------------------------------------------------------------

Bernhard Beschow (1):
  hw/virtio/vhost-shadow-virtqueue: Silence GCC error
    "maybe-uninitialized"

Markus Armbruster (2):
  Drop superfluous conditionals around g_free()
  Use g_new() & friends where that makes obvious sense

Matheus Tavares Bernardino (1):
  checkpatch: ignore target/hexagon/imported/* files

Philippe Mathieu-Daudé via (1):
  block/qcow2-bitmap: Add missing cast to silent GCC error

Stefan Berger (1):
  docs: Update TPM documentation for usage of a TPM 2

Tong Zhang (1):
  mem/cxl_type3: fix GPF DVSEC

Wang, Lei (1):
  .gitignore: add .cache/ to .gitignore

 .gitignore                         |  1 +
 block/qcow2-bitmap.c               |  2 +-
 docs/specs/tpm.rst                 | 44 ++++++++++++++++--------------
 hw/mem/cxl_type3.c                 |  2 +-
 hw/remote/iommu.c                  |  2 +-
 hw/virtio/vhost-shadow-virtqueue.c |  2 +-
 hw/virtio/virtio-crypto.c          |  2 +-
 migration/dirtyrate.c              |  4 +--
 replay/replay.c                    |  6 ++--
 scripts/checkpatch.pl              |  1 +
 softmmu/dirtylimit.c               |  4 +--
 target/i386/kvm/kvm.c              | 12 +++-----
 target/i386/whpx/whpx-all.c        | 14 ++++------
 13 files changed, 47 insertions(+), 49 deletions(-)

-- 
2.37.3


