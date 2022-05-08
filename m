Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5663951EE97
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 17:34:16 +0200 (CEST)
Received: from localhost ([::1]:54852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnivG-0000wA-UL
	for lists+qemu-devel@lfdr.de; Sun, 08 May 2022 11:34:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnout@bzzt.net>) id 1nnitr-0000Eh-7F
 for qemu-devel@nongnu.org; Sun, 08 May 2022 11:32:47 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:41395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnout@bzzt.net>) id 1nnitp-00064D-8H
 for qemu-devel@nongnu.org; Sun, 08 May 2022 11:32:46 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id E8FBA5C00A0;
 Sun,  8 May 2022 11:32:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 08 May 2022 11:32:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bzzt.net; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm2; t=1652023962; x=1652110362; bh=+dT8tPH0Ct2IqpehkHXXd2LUN
 7HyDKsOdTNUH2vcLcU=; b=V2KB7vpOfRXYW99lCHxn/pEOaSZAdI4LHenQWdKIJ
 K2v0g8zBsRuy70Wt5tG6r2RZRSarXnPuuvQ9eyQgiqvZPjW3KaQW9E9GwH9dGGVM
 p7bqkMVa+amT2lXVTKSFsh3YxX9xMbrDfCPnX9f9QhDKypmKwBAWS9hrRgx3bY8w
 782G5qwkyrUKLqMXKxT470fgrla6U1K8K1biyv4GNeTsaIlPvidzCy27+qBWncML
 swY2jFber0iJJ7tCj47qr5W3FIdpWsrvnWJ7Q2s0Z0B3eYe6yjK9laKAyr6J/v3F
 nTagwb5GpDcycg1q3xP1VgmQMa947Me+WQgEmKcGVD7BQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; t=1652023962; x=1652110362; bh=+
 dT8tPH0Ct2IqpehkHXXd2LUN7HyDKsOdTNUH2vcLcU=; b=w0PMXZsbZGPiVTjni
 yn/Xvv6W2S/KTWKEodgKTLyxpT88iyGgw8xyenbCXqJlqUq/ULNhqKKfVg9KDR4m
 NxVSyqVPEExAjOR8jj03tLESc4C4PwRcFXV+5AO/XdTMYnVB1wdYWTd0eoJD2zpX
 RlfR2qiTPsZk8jX3h0+J4m06KE/HX8F0Ev1CyMTdJca1BEl1RHMukzTZxRX5E8IG
 iOciIFWg9iLXfuePOetiu83VHppir/91Yknecpu3m3B0ij3s2PGlLhgUXha/n1Pc
 3oIXSCK4S7BtnQpKCfRwwTdXsjk16Tmx4wVJbzr+AqN+anVy3nSBYF1Uz9Xfyaiz
 UIZAw==
X-ME-Sender: <xms:muJ3YlllfBoSMDrlSdsRYtSm3fjb1_J8tO-KHaA0Us2dXivBDW-qOA>
 <xme:muJ3Yg05B-7z2xREgFdoPBVZPUInuldA-5vUY5P04X-oPcA225v4bGoojzFh2gB-2
 LK_xnnV1E9UWOMKlTY>
X-ME-Received: <xmr:muJ3YrpQsau3-Cc7QaVDXMntPYu42yVjPYjnHbYObYG5wrR6c_LO1CRSGB-9mT6g1QU0PrQxUXPIO8MB9GASqSRFEFHrb_c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejgdeklecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekredtre
 dttdenucfhrhhomheptehrnhhouhhtucfgnhhgvghlvghnuceorghrnhhouhhtsegsiiii
 thdrnhgvtheqnecuggftrfgrthhtvghrnhepjeefjeffffffgffgiefhjeegvdfhgeegje
 eltdevkeejgeduieeuvdevudelieejnecuffhomhgrihhnpegtohhrvggsohhothdrohhr
 ghdpghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomheprghrnhhouhhtsegsiiiithdrnhgvth
X-ME-Proxy: <xmx:muJ3YlnnYWUn49s99E0PDNySgybrY9Qv5C-o1AHHJRs3Ov5xzHSojw>
 <xmx:muJ3Yj072dAdfUB6l77Q_ujkrsClCsCZCN6r1_SG0NAGcMqLhxnvSg>
 <xmx:muJ3Ykuj2RrcEE6cBfxizntP4Q6djF0HcWWqTUbhsOSeqsBeZHEb7A>
 <xmx:muJ3Ys8kg7Lya5fs3O4tX7zo6yGN6SBN1eA8JVLC3ICmsw2xZSz3yw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 May 2022 11:32:42 -0400 (EDT)
From: Arnout Engelen <arnout@bzzt.net>
To: kraxel@redhat.com,
	qemu-devel@nongnu.org
Cc: Arnout Engelen <arnout@bzzt.net>
Subject: [PATCH] hw/usb/hcd-ehci: fix writeback order
Date: Sun,  8 May 2022 17:32:22 +0200
Message-Id: <20220508153222.3560803-1-arnout@bzzt.net>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=arnout@bzzt.net;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The 'active' bit passes control over a qTD between the guest and the
controller: set to 1 by guest to enable execution by the controller,
and the controller sets it to '0' to hand back control to the guest.

ehci_state_writeback write two dwords to main memory using DMA:
the third dword of the qTD (containing dt, total bytes to transfer,
cpage, cerr and status) and the fourth dword of the qTD (containing
the offset).

This commit makes sure the fourth dword is written before the third,
avoiding a race condition where a new offset written into the qTD
by the guest after it observed the status going to go to '0' gets
overwritten by a 'late' DMA writeback of the previous offset.

This race condition could lead to 'cpage out of range (5)' errors,
and reproduced by:

./qemu-system-x86_64 -enable-kvm -bios $SEABIOS/bios.bin -m 4096 -device usb-ehci -blockdev driver=file,read-only=on,filename=/home/aengelen/Downloads/openSUSE-Tumbleweed-DVD-i586-Snapshot20220428-Media.iso,node-name=iso -device usb-storage,drive=iso,bootindex=0 -chardev pipe,id=shell,path=/tmp/pipe -device virtio-serial -device virtconsole,chardev=shell -device virtio-rng-pci -serial mon:stdio -nographic

(press a key, select 'Installation' (2), and accept the default
values. On my machine the 'cpage out of range' is reproduced while
loading the Linux Kernel about once per 7 attempts. With the fix in
this commit it no longer fails)

This problem was previously reported as a seabios problem in
https://mail.coreboot.org/hyperkitty/list/seabios@seabios.org/thread/OUTHT5ISSQJGXPNTUPY3O5E5EPZJCHM3/
and as a nixos CI build failure in
https://github.com/NixOS/nixpkgs/issues/170803

Signed-off-by: Arnout Engelen <arnout@bzzt.net>
---
 hw/usb/hcd-ehci.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
index 33a8a377bd..d4da8dcb8d 100644
--- a/hw/usb/hcd-ehci.c
+++ b/hw/usb/hcd-ehci.c
@@ -2011,7 +2011,10 @@ static int ehci_state_writeback(EHCIQueue *q)
     ehci_trace_qtd(q, NLPTR_GET(p->qtdaddr), (EHCIqtd *) &q->qh.next_qtd);
     qtd = (uint32_t *) &q->qh.next_qtd;
     addr = NLPTR_GET(p->qtdaddr);
-    put_dwords(q->ehci, addr + 2 * sizeof(uint32_t), qtd + 2, 2);
+    /* First write back the offset */
+    put_dwords(q->ehci, addr + 3 * sizeof(uint32_t), qtd + 3, 1);
+    /* Then write back the token, clearing the 'active' bit */
+    put_dwords(q->ehci, addr + 2 * sizeof(uint32_t), qtd + 2, 1);
     ehci_free_packet(p);
 
     /*
-- 
2.35.3


