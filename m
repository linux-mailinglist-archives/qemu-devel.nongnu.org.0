Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DA944199B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 11:13:30 +0100 (CET)
Received: from localhost ([::1]:47950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhUJl-00027I-Gg
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 06:13:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mhU7I-0006pt-JD
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 06:00:36 -0400
Received: from mail.loongson.cn ([114.242.206.163]:54340 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mhU7G-0001KL-4O
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 06:00:36 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxn2u3uH9hbKIjAA--.55994S29; 
 Mon, 01 Nov 2021 17:52:32 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 27/29] scripts: add loongarch64 binfmt config
Date: Mon,  1 Nov 2021 17:51:49 +0800
Message-Id: <1635760311-20015-28-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1635760311-20015-1-git-send-email-gaosong@loongson.cn>
References: <1635760311-20015-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9Dxn2u3uH9hbKIjAA--.55994S29
X-Coremail-Antispam: 1UD129KBjvJXoW7WFWDWw1kCFW5Aw1DXr45Awb_yoW8WF4Dpr
 15A3W8CF4jg3WUA3WkXw13Gr1DJr1Ykas7Xr43tr1UAF15tw1rZr1fJr18J3WDJF4UJF1j
 9F95Ja1DJF4IkF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@loongson.cn,
 philmd@redhat.com, i.qemu@xen0n.name, richard.henderson@linaro.org,
 laurent@vivier.eu, peterx@redhat.com, f4bug@amsat.org,
 yangxiaojuan@loongson.cn, alistair.francis@wdc.com, maobibo@loongson.cn,
 pbonzini@redhat.com, bmeng.cn@gmail.com, alex.bennee@linaro.org,
 gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
---
 scripts/qemu-binfmt-conf.sh | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/qemu-binfmt-conf.sh b/scripts/qemu-binfmt-conf.sh
index 7de996d..da6a937 100755
--- a/scripts/qemu-binfmt-conf.sh
+++ b/scripts/qemu-binfmt-conf.sh
@@ -4,7 +4,7 @@
 qemu_target_list="i386 i486 alpha arm armeb sparc sparc32plus sparc64 \
 ppc ppc64 ppc64le m68k mips mipsel mipsn32 mipsn32el mips64 mips64el \
 sh4 sh4eb s390x aarch64 aarch64_be hppa riscv32 riscv64 xtensa xtensaeb \
-microblaze microblazeel or1k x86_64 hexagon"
+microblaze microblazeel or1k x86_64 hexagon loongarch64"
 
 i386_magic='\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x03\x00'
 i386_mask='\xff\xff\xff\xff\xff\xfe\xfe\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff'
@@ -140,6 +140,10 @@ hexagon_magic='\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x
 hexagon_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff'
 hexagon_family=hexagon
 
+loongarch64_magic='\x7fELF\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x02\x01'
+loongarch64_mask='\xff\xff\xff\xff\xff\xff\xff\xfc\x00\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff'
+loongarch64_family=loongarch
+
 qemu_get_family() {
     cpu=${HOST_ARCH:-$(uname -m)}
     case "$cpu" in
-- 
1.8.3.1


