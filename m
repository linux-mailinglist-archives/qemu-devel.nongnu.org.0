Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF8B3FEE27
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 14:55:35 +0200 (CEST)
Received: from localhost ([::1]:36712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLmFi-00084z-ON
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 08:55:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mLm31-00078b-5P
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 08:42:27 -0400
Received: from mail.loongson.cn ([114.242.206.163]:36684 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mLm2w-00069p-IE
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 08:42:26 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxYctjxjBha2YCAA--.7003S23; 
 Thu, 02 Sep 2021 20:41:40 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 21/21] scripts: add loongarch64 binfmt config
Date: Thu,  2 Sep 2021 20:41:07 +0800
Message-Id: <1630586467-22463-22-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1630586467-22463-1-git-send-email-gaosong@loongson.cn>
References: <1630586467-22463-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9AxYctjxjBha2YCAA--.7003S23
X-Coremail-Antispam: 1UD129KBjvJXoW7Zw4xZF4DWw4DJFWxuF1xXwb_yoW8Wr1Upr
 15A3W8CF4jg3WUA3WkXw13Gr1DJrn0kas7Xr43tr1UAF15tw1rZr1fJr1UJ3WDJF48JF1j
 9F95Ja1DJF4IkF7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, yangxiaojuan@loongson.cn, david@redhat.com,
 bin.meng@windriver.com, mark.cave-ayland@ilande.co.uk,
 aleksandar.rikalo@syrmia.com, jcmvbkbc@gmail.com, tsimpson@quicinc.com,
 alistair.francis@wdc.com, edgar.iglesias@gmail.com, chenhuacai@gmail.com,
 philmd@redhat.com, atar4qemu@gmail.com, thuth@redhat.com, ehabkost@redhat.com,
 richard.henderson@linaro.org, groug@kaod.org, maobibo@loongson.cn,
 mrolnik@gmail.com, shorne@gmail.com, alex.bennee@linaro.org,
 david@gibson.dropbear.id.au, kbastian@mail.uni-paderborn.de, crwulff@gmail.com,
 laurent@vivier.eu, palmer@dabbelt.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: XiaoJuan Yang <yangxiaojuan@loongson.cn>
---
 scripts/qemu-binfmt-conf.sh | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/qemu-binfmt-conf.sh b/scripts/qemu-binfmt-conf.sh
index 7de996d..5575bdd 100755
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
+loongarch64_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff'
+loongarch64_family=loongarch
+
 qemu_get_family() {
     cpu=${HOST_ARCH:-$(uname -m)}
     case "$cpu" in
-- 
1.8.3.1


