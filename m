Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6FC54859C
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 15:58:06 +0200 (CEST)
Received: from localhost ([::1]:38904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0kZx-0002mW-IV
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 09:58:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <SRS0=O0wQ=WU=paulmck-ThinkPad-P17-Gen-1.home=paulmck@kernel.org>)
 id 1o0k1u-00086j-Qs
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 09:22:54 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:49952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <SRS0=O0wQ=WU=paulmck-ThinkPad-P17-Gen-1.home=paulmck@kernel.org>)
 id 1o0k1s-0003pA-Iv
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 09:22:54 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A4EB161018;
 Mon, 13 Jun 2022 13:22:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36EF6C34114;
 Mon, 13 Jun 2022 13:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655126568;
 bh=aPG04wQxYSWtMm5qtUnDbqgDpJ90F37nxHIFcY/d86A=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=c5wkbFe5rmPuYrccbMTwrzzwTVvD8jWq1PlE3CQ926TDWG9sGYIR76XhBtAE07yeP
 uf9XGCy3aObXiqijFPAxQuy3kFyEMtg+Th2sOAtK+g8kKwcIYH2TGw/JVQZBSyQDJk
 lQAvVHFuLmMqRMcEU/tP6pIv5kp+wqCi2ZUBdL2zecr4ZFAciyCa7tXBFiZ01LaBx8
 0rOHVxnWnNEVn9eup8iFjDUodvDZqRgHeIYCudLDeP96Z3gyp0q+5V25P9o4DUa372
 S86Mx3Mx8YLOaI8maSf3oaFjQMGPNH0LLz9FfV7M9WsZQpNi2sccfox91DapCq64iT
 WOiGexo1y+f7g==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id CDCC25C0510; Mon, 13 Jun 2022 06:22:47 -0700 (PDT)
Date: Mon, 13 Jun 2022 06:22:47 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: "chenxiang (M)" <chenxiang66@hisilicon.com>
Cc: linux-kernel@vger.kernel.org, qemu-devel@nongnu.org,
	linuxarm@huawei.com
Subject: Re: [Bug] Take more 150s to boot qemu on ARM64
Message-ID: <20220613132247.GB1790663@paulmck-ThinkPad-P17-Gen-1>
References: <36a0c658-ee5d-3a1c-416c-c041dc344bff@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36a0c658-ee5d-3a1c-416c-c041dc344bff@hisilicon.com>
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=SRS0=O0wQ=WU=paulmck-ThinkPad-P17-Gen-1.home=paulmck@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 13 Jun 2022 09:49:08 -0400
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
Reply-To: paulmck@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 13, 2022 at 08:26:34PM +0800, chenxiang (M) wrote:
> Hi all,
> 
> I encounter a issue with kernel 5.19-rc1 on a ARM64 board:  it takes about
> 150s between beginning to run qemu command and beginng to boot Linux kernel
> ("EFI stub: Booting Linux Kernel...").
> 
> But in kernel 5.18-rc4, it only takes about 5s. I git bisect the kernel code
> and it finds c2445d387850 ("srcu: Add contention check to call_srcu()
> srcu_data ->lock acquisition").
> 
> The qemu (qemu version is 6.2.92) command i run is :
> 
> ./qemu-system-aarch64 -m 4G,slots=4,maxmem=8g \
> --trace "kvm*" \
> -cpu host \
> -machine virt,accel=kvm,gic-version=3  \
> -machine smp.cpus=2,smp.sockets=2 \
> -no-reboot \
> -nographic \
> -monitor unix:/home/cx/qmp-test,server,nowait \
> -bios /home/cx/boot/QEMU_EFI.fd \
> -kernel /home/cx/boot/Image  \
> -device pcie-root-port,port=0x8,chassis=1,id=net1,bus=pcie.0,multifunction=on,addr=0x1
> \
> -device vfio-pci,host=7d:01.3,id=net0 \
> -device virtio-blk-pci,drive=drive0,id=virtblk0,num-queues=4  \
> -drive file=/home/cx/boot/boot_ubuntu.img,if=none,id=drive0 \
> -append "rdinit=init console=ttyAMA0 root=/dev/vda rootfstype=ext4 rw " \
> -net none \
> -D /home/cx/qemu_log.txt
> 
> I am not familiar with rcu code, and don't know how it causes the issue. Do
> you have any idea about this issue?

Please see the discussion here:

https://lore.kernel.org/all/20615615-0013-5adc-584f-2b1d5c03ebfc@linaro.org/

Though that report requires ACPI to be forced on to get the
delay, which results in more than 9,000 back-to-back calls to
synchronize_srcu_expedited().  I cannot reproduce this on my setup, even
with an artificial tight loop invoking synchronize_srcu_expedited(),
but then again I don't have ARM hardware.

My current guess is that the following patch, but with larger values for
SRCU_MAX_NODELAY_PHASE.  Here "larger" might well be up in the hundreds,
or perhaps even larger.

If you get a chance to experiment with this, could you please reply
to the discussion at the above URL?  (Or let me know, and I can CC
you on the next message in that thread.)

						Thanx, Paul

------------------------------------------------------------------------

diff --git a/kernel/rcu/srcutree.c b/kernel/rcu/srcutree.c
index 50ba70f019dea..0db7873f4e95b 100644
--- a/kernel/rcu/srcutree.c
+++ b/kernel/rcu/srcutree.c
@@ -513,7 +513,7 @@ static bool srcu_readers_active(struct srcu_struct *ssp)
 
 #define SRCU_INTERVAL		1	// Base delay if no expedited GPs pending.
 #define SRCU_MAX_INTERVAL	10	// Maximum incremental delay from slow readers.
-#define SRCU_MAX_NODELAY_PHASE	1	// Maximum per-GP-phase consecutive no-delay instances.
+#define SRCU_MAX_NODELAY_PHASE	3	// Maximum per-GP-phase consecutive no-delay instances.
 #define SRCU_MAX_NODELAY	100	// Maximum consecutive no-delay instances.
 
 /*
@@ -522,16 +522,22 @@ static bool srcu_readers_active(struct srcu_struct *ssp)
  */
 static unsigned long srcu_get_delay(struct srcu_struct *ssp)
 {
+	unsigned long gpstart;
+	unsigned long j;
 	unsigned long jbase = SRCU_INTERVAL;
 
 	if (ULONG_CMP_LT(READ_ONCE(ssp->srcu_gp_seq), READ_ONCE(ssp->srcu_gp_seq_needed_exp)))
 		jbase = 0;
-	if (rcu_seq_state(READ_ONCE(ssp->srcu_gp_seq)))
-		jbase += jiffies - READ_ONCE(ssp->srcu_gp_start);
-	if (!jbase) {
-		WRITE_ONCE(ssp->srcu_n_exp_nodelay, READ_ONCE(ssp->srcu_n_exp_nodelay) + 1);
-		if (READ_ONCE(ssp->srcu_n_exp_nodelay) > SRCU_MAX_NODELAY_PHASE)
-			jbase = 1;
+	if (rcu_seq_state(READ_ONCE(ssp->srcu_gp_seq))) {
+		j = jiffies - 1;
+		gpstart = READ_ONCE(ssp->srcu_gp_start);
+		if (time_after(j, gpstart))
+			jbase += j - gpstart;
+		if (!jbase) {
+			WRITE_ONCE(ssp->srcu_n_exp_nodelay, READ_ONCE(ssp->srcu_n_exp_nodelay) + 1);
+			if (READ_ONCE(ssp->srcu_n_exp_nodelay) > SRCU_MAX_NODELAY_PHASE)
+				jbase = 1;
+		}
 	}
 	return jbase > SRCU_MAX_INTERVAL ? SRCU_MAX_INTERVAL : jbase;
 }

