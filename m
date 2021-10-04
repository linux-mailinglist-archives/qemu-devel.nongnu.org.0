Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A95754207A2
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 10:55:12 +0200 (CEST)
Received: from localhost ([::1]:41324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXJkc-0004GA-HA
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 04:55:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mXJNW-00018W-Am; Mon, 04 Oct 2021 04:31:18 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:41775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mXJNQ-0003VJ-VN; Mon, 04 Oct 2021 04:31:18 -0400
Received: from quad ([82.142.3.114]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MCXhr-1mfnZA06XD-009l8y; Mon, 04
 Oct 2021 10:30:59 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 2/5] qemu-options: Tweak [, maxcpus=cpus] to [, maxcpus=maxcpus]
Date: Mon,  4 Oct 2021 10:30:52 +0200
Message-Id: <20211004083055.3288583-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211004083055.3288583-1-laurent@vivier.eu>
References: <20211004083055.3288583-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:8iKZTuLqv2IRy5neIuQ8ighQ9u3RwE6JRrnPiRTuf8zkFQFI84N
 7ukEfZ0aE+5hupzgGHAAHfzjMm6Ji9xIJX6w0JHaVTnG7OupQNtlIwV3EOHJwViBuuVIzCZ
 z051I7Yc6p5D6qrwudS9MDa9UQKt54aVdXXG2e+C78Wi1EqBpNRoL1eIWNGZkKCBTzE6HJp
 C6YTQGCXWfbnH/9UCXQkw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:aJQYa8RmOC0=:g/VEYDsxKKdyHxGDpXEUK+
 oL0xsxmkxvwVMl/AmobTLUf7kil6tjDaiA4QfPAe0ebaoNO5Diu2N58arkLfx71psHI8eqBly
 OZaYmBHZsDgHDl3cxL9hRIB4r1xgcVtHLU131LFMDMGOYhmOB2RC0/Jw2iaoGERYObmE5bOPJ
 b69fKX/ObEdL/8lwKtAwssgikNZ1b+X6N28ZVq+KwPsDRJlheBAmh2BTspkXBhkkhxm79jWg9
 BMJz2ZcdfgbTIiHU7vwhttuXSrqbsOGy4zncO0/BzriaC2EI1VKyzcbXDoDkiAEqwBDl0N9Sv
 oAZOx7HvOSZd7JFCUAOm9mPfBHuyOWhDvY4ASwAuq/RtARzKeOTttgBdSzGrpYH0QJ9G2+1nO
 fF1B8eqO2G6tDCJKfcBE9aZS/lbHeAXLASGzVowjrUp1FrjHozEx5s24sWiXZlDcdRt7/Y8q8
 sH+Dt/Hms+HnO/GmRN7QCeHlvgnxeZY3zQ/xzJsbC/8et78YLs3L//feepbNXP3t/fQPFSDV+
 Wwy4jt3OTsh7QUTTl8+obTbZtb8Bj8zDBWrnSoikCQFnkxLHoW46CB6tkxOxS3imEh7b8cn3O
 pLCzx10//Mn4b+QND/aNSgeiNAQvPjh6ey1Flt+8eJ3PBME3YxTuZhB6r50H7WpO7/CS+NoQP
 blv42OTdC0VvY7ndj9dDfsnC507eo76P4KL2mvNpEUeE70PJc7eoFWrsxVaEJAJ8QaFFTBx7k
 VX/X+XRzV2c/nYohmGh5mw74hy9/wSvy89YMEQ==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-trivial@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Yanan Wang <wangyanan55@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yanan Wang <wangyanan55@huawei.com>

In qemu-option.hx, there is "-smp [[cpus=]n][,maxcpus=cpus]..." in the
DEF part, and "-smp [[cpus=]n][,maxcpus=maxcpus]..." in the RST part.
Obviously the later is right, let's fix the previous one.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Message-Id: <20210928121134.21064-2-wangyanan55@huawei.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 qemu-options.hx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 4f2dc91e0b27..bba1ef973fec 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -206,7 +206,7 @@ SRST
 ERST
 
 DEF("smp", HAS_ARG, QEMU_OPTION_smp,
-    "-smp [[cpus=]n][,maxcpus=cpus][,sockets=sockets][,dies=dies][,cores=cores][,threads=threads]\n"
+    "-smp [[cpus=]n][,maxcpus=maxcpus][,sockets=sockets][,dies=dies][,cores=cores][,threads=threads]\n"
     "                set the number of CPUs to 'n' [default=1]\n"
     "                maxcpus= maximum number of total CPUs, including\n"
     "                offline CPUs for hotplug, etc\n"
-- 
2.31.1


