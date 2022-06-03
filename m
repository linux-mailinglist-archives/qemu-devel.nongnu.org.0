Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C77253D31E
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 23:13:10 +0200 (CEST)
Received: from localhost ([::1]:41220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxEbV-0003px-2l
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 17:13:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.derrick@linux.dev>)
 id 1nxClR-0002ss-Ot
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 15:15:20 -0400
Received: from resqmta-c1p-024063.sys.comcast.net ([2001:558:fd00:56::8]:35998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.derrick@linux.dev>)
 id 1nxClP-0008JI-J5
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 15:15:17 -0400
Received: from resomta-c1p-023278.sys.comcast.net ([96.102.18.240])
 by resqmta-c1p-024063.sys.comcast.net with ESMTP
 id xAdNnTSHIGiqUxClHnv5ZB; Fri, 03 Jun 2022 19:15:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=comcastmailservice.net; s=20211018a; t=1654283707;
 bh=tDmMof6biaY5FCCyJcFM2cwHci3uDLN3mP2wuG42q9Q=;
 h=Received:Received:From:To:Subject:Date:Message-Id:MIME-Version;
 b=puoBb/kAdaQ9o4aMYao5JjNyCngNXmdGYfAei7RON4moKBUIoutBIcWwCSmZhHQHc
 k4qGA2afg5XgjYyZ2YLVHm6IOKyzbKtwTkuV9UEEFK12RVVOqimhaU35K11NW7PRyo
 UFP1+j0rHfvieCzdpTozWL9BCqHfSIrWd826eztXcvylnLHyuauJw1K2hikDAG5ekp
 mhJFVq0t9z63NoM90o0IJU76NPfqSGRHmP/Co/x7eDoYrNHkqQ87iPFQAF+626EUmw
 YDL7p8CKHCqra4hI33tnkngUy0rFnrckrK8nWQFQ4fLGMoTA7W9TBJzYwIhh8HtNsP
 PgKCkITqPQIAQ==
Received: from jderrick-mobl4.amr.corp.intel.com ([71.196.224.35])
 by resomta-c1p-023278.sys.comcast.net with ESMTPA
 id xCkrnoELS4UPKxCkunw4o6; Fri, 03 Jun 2022 19:14:46 +0000
X-Xfinity-VAAS: gggruggvucftvghtrhhoucdtuddrgedvfedrleeigddufedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuvehomhgtrghsthdqtfgvshhipdfqfgfvpdfpqffurfetoffkrfenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheplfhonhgrthhhrghnucffvghrrhhitghkuceojhhonhgrthhhrghnrdguvghrrhhitghksehlihhnuhigrdguvghvqeenucggtffrrghtthgvrhhnpedvtdejiefgueelteevudevhfdvjedvhfdtgfehjeeitdevueektdegtedttdehvdenucfkphepjedurdduleeirddvvdegrdefheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhephhgvlhhopehjuggvrhhrihgtkhdqmhhosghlgedrrghmrhdrtghorhhprdhinhhtvghlrdgtohhmpdhinhgvthepjedurdduleeirddvvdegrdefhedpmhgrihhlfhhrohhmpehjohhnrghthhgrnhdruggvrhhrihgtkheslhhinhhugidruggvvhdpnhgspghrtghpthhtohepkedprhgtphhtthhopehqvghmuhdqsghlohgtkhesnhhonhhgnhhurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdprhgtphhtthhopehksghushgthheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepihhtshesihhrrhgvlhgvvhgrnhhtrdgukhdprhgtphhtthhopehjohhnrghthhgrnhdruggvrhhrihgtkheslhhinhhugidruggvvhdprhgtphhtthhopehfrhgrnhgtihhsrdhmihgthhgrvghlsehsohhlihguihhgmhdrtghomhdprhgtphhtthhopehmihgthhgrvghlrdhkrhhophgrtgiivghksehsohhlihguihhgmhdrtghomhdprhgtphhtthhopehjohhnrghthhgrnhdruggvrhhrihgtkhesshholhhiughighhmrdgtohhm
X-Xfinity-VMeta: sc=-100.00;st=legit
From: Jonathan Derrick <jonathan.derrick@linux.dev>
To: <qemu-block@nongnu.org>
Cc: <qemu-devel@nongnu.org>, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>,
 Jonathan Derrick <jonathan.derrick@linux.dev>,
 Francis Pravin AntonyX Michael Raj <francis.michael@solidigm.com>,
 Michael Kropaczek <michael.kropaczek@solidigm.com>,
 Jonathan Derrick <jonathan.derrick@solidigm.com>
Subject: [PATCH] hw/nvme: Fix deallocate when metadata is present
Date: Fri,  3 Jun 2022 13:14:40 -0600
Message-Id: <20220603191440.3625-1-jonathan.derrick@linux.dev>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=2001:558:fd00:56::8;
 envelope-from=jonathan.derrick@linux.dev;
 helo=resqmta-c1p-024063.sys.comcast.net
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 03 Jun 2022 17:12:04 -0400
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

When metadata is present in the namespace and deallocates are issued, the first
deallocate could fail to zero the block range, resulting in another
deallocation to be issued. Normally after the deallocation completes and the
range is checked for zeroes, a deallocation is then issued for the metadata
space. In the failure case where the range is not zeroed, deallocation is
reissued for the block range (and followed with metadata deallocation), but the
original range deallocation task will also issue a metadata deallocation:

nvme_dsm_cb()
  *range deallocation*
  nvme_dsm_md_cb()
    if (nvme_block_status_all()) (range deallocation failure)
      nvme_dsm_cb()
      *range deallocation*
        nvme_dsm_md_cb()
          if (nvme_block_status_all()) (no failure)
          *metadata deallocation*
    *metadata deallocation*

This sequence results in reentry of nvme_dsm_cb() before the metadata has been
deallocated. During reentry, the metadata is deallocated in the reentrant task.
nvme_dsm_bh() is called which deletes and sets iocb->bh to NULL. When reentry
returns from nvme_dsm_cb(), metadata deallocation takes place again, and
results in a null pointer dereference on the iocb->bh:

BH deletion:
#0  nvme_dsm_bh (opaque=0x55ef893e2f10) at ../hw/nvme/ctrl.c:2316
#1  0x000055ef868eb333 in aio_bh_call (bh=0x55ef8a441b30) at ../util/async.c:141
#2  0x000055ef868eb441 in aio_bh_poll (ctx=0x55ef892c6e40) at ../util/async.c:169
#3  0x000055ef868d2789 in aio_dispatch (ctx=0x55ef892c6e40) at ../util/aio-posix.c:415
#4  0x000055ef868eb896 in aio_ctx_dispatch (source=0x55ef892c6e40, callback=0x0, user_data=0x0) at ../util/async.c:311
#5  0x00007f5bfe4ab17d in g_main_context_dispatch () at /lib/x86_64-linux-gnu/libglib-2.0.so.0
#6  0x000055ef868fcd98 in glib_pollfds_poll () at ../util/main-loop.c:232
#7  0x000055ef868fce16 in os_host_main_loop_wait (timeout=0) at ../util/main-loop.c:255
#8  0x000055ef868fcf27 in main_loop_wait (nonblocking=0) at ../util/main-loop.c:531
#9  0x000055ef864a2442 in qemu_main_loop () at ../softmmu/runstate.c:726
#10 0x000055ef860f957a in main (argc=29, argv=0x7ffdc9705508, envp=0x7ffdc97055f8) at ../softmmu/main.c:50

nvme_dsm_cb() called for metadata after nvme_dsm_bh() completes from reentrant task:
Thread 1 "qemu-system-x86" received signal SIGSEGV, Segmentation fault.
0x000055ef868eb07c in aio_bh_enqueue (bh=0x0, new_flags=2) at ../util/async.c:70
70          AioContext *ctx = bh->ctx;
(gdb) backtrace
#0  0x000055ef868eb07c in aio_bh_enqueue (bh=0x0, new_flags=2) at ../util/async.c:70
#1  0x000055ef868eb4cf in qemu_bh_schedule (bh=0x0) at ../util/async.c:186
#2  0x000055ef862db21e in nvme_dsm_cb (opaque=0x55ef897b41a0, ret=0) at ../hw/nvme/ctrl.c:2423
#3  0x000055ef8665a662 in blk_aio_complete (acb=0x55ef89c6d8c0) at ../block/block-backend.c:1419
#4  0x000055ef8665a940 in blk_aio_write_entry (opaque=0x55ef89c6d8c0) at ../block/block-backend.c:1486
#5  0x000055ef868edcf2 in coroutine_trampoline (i0=-536848976, i1=32602) at ../util/coroutine-ucontext.c:173
#6  0x00007f5bfe0bc510 in __start_context () at ../sysdeps/unix/sysv/linux/x86_64/__start_context.S:91
#7  0x00007f5bf757bb40 in  ()
#8  0x0000000000000000 in  ()

The fix is to return when an nvme_dsm_cb() is reentered due to failure to
deallocate the block range, so that metadata deallocate is then only issued in
the reentrant task and prevent doing it again when the reentrant task returns
to the original task.

Reproduction steps (with emulated namespace):
nvme format --lbaf=1 -f /dev/nvme0n1
mkfs.ext4 /dev/nvme0n1
mkfs.ext4 -F /dev/nvme0n1

Signed-off-by: Francis Pravin AntonyX Michael Raj <francis.michael@solidigm.com>
Signed-off-by: Michael Kropaczek <michael.kropaczek@solidigm.com>
Signed-off-by: Jonathan Derrick <jonathan.derrick@solidigm.com>
---
 hw/nvme/ctrl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 03760ddeae..74540a03d5 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -2372,6 +2372,7 @@ static void nvme_dsm_md_cb(void *opaque, int ret)
         }
 
         nvme_dsm_cb(iocb, 0);
+        return;
     }
 
     iocb->aiocb = blk_aio_pwrite_zeroes(ns->blkconf.blk, nvme_moff(ns, slba),
-- 
2.25.1


