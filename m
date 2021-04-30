Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 850A136FCE5
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 16:54:03 +0200 (CEST)
Received: from localhost ([::1]:54608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcUWo-00026n-Dg
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 10:54:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lcUVM-0001IU-Dn
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 10:52:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lcUVF-0002J2-Er
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 10:52:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619794344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=H5HFBj0dQS8/s20bsHUXmaBQQ//ExnZWYXR9CSg98Uk=;
 b=Bqs3AKEEFuPhefM9eFASC7I0wnigful32ih3ttFrVzshA7SA3uAVoVXY3a0RGe2l5gIR23
 4jX1UQ9te9s2KxxwItndHwUGJNKPd7rnRWlw70Px7ltq5HdBqqaAYMoCtS3JK9wZqTWt95
 sT4SRLQOw6dfL7MMrAvF4okEF2WLt1g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-LimcamjvNxWtSIjvrugXCQ-1; Fri, 30 Apr 2021 10:52:22 -0400
X-MC-Unique: LimcamjvNxWtSIjvrugXCQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23AA68186E1;
 Fri, 30 Apr 2021 14:52:21 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D786F63BA7;
 Fri, 30 Apr 2021 14:52:20 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] coverity-scan: list components,
 move model to scripts/coverity-scan
Date: Fri, 30 Apr 2021 10:52:20 -0400
Message-Id: <20210430145220.303801-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Place all files that can be useful to rebuild the Coverity
configuration in scripts/coverity-scan: the existing model
file, and the components setup.

The Markdown syntax was tested with Pandoc (but in any case
is meant more as a human-readable reference than as a part
of documentation).

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/coverity-scan/COMPONENTS.md           | 154 ++++++++++++++++++
 .../model.c}                                  |   0
 2 files changed, 154 insertions(+)
 create mode 100644 scripts/coverity-scan/COMPONENTS.md
 rename scripts/{coverity-model.c => coverity-scan/model.c} (100%)

diff --git a/scripts/coverity-scan/COMPONENTS.md b/scripts/coverity-scan/COMPONENTS.md
new file mode 100644
index 0000000000..02a3447dab
--- /dev/null
+++ b/scripts/coverity-scan/COMPONENTS.md
@@ -0,0 +1,154 @@
+This is the list of currently configured Coverity components:
+
+alpha
+  ~ (/qemu)?((/include)?/hw/alpha/.*|/target/alpha/.*)
+
+arm
+  ~ (/qemu)?((/include)?/hw/arm/.*|(/include)?/hw/.*/(arm|allwinner-a10|bcm28|digic|exynos|imx|omap|stellaris|pxa2xx|versatile|zynq|cadence).*|/hw/net/xgmac.c|/hw/ssi/xilinx_spips.c|/target/arm/.*)
+
+avr
+  ~ (/qemu)?((/include)?/hw/avr/.*|/target/avr/.*)
+
+cris
+  ~ (/qemu)?((/include)?/hw/cris/.*|/target/cris/.*)
+
+hexagon
+  ~ (/qemu)?(/target/hexagon/.*)
+
+hppa
+  ~ (/qemu)?((/include)?/hw/hppa/.*|/target/hppa/.*)
+
+i386
+  ~ (/qemu)?((/include)?/hw/i386/.*|/target/i386/.*|/hw/intc/[^/]*apic[^/]*\.c)
+
+lm32
+  ~ (/qemu)?((/include)?/hw/lm32/.*|/target/lm32/.*|/hw/.*/(milkymist|lm32).*)
+
+m68k
+  ~ (/qemu)?((/include)?/hw/m68k/.*|/target/m68k/.*|(/include)?/hw(/.*)?/mcf.*)
+
+microblaze
+  ~ (/qemu)?((/include)?/hw/microblaze/.*|/target/microblaze/.*)
+
+mips
+  ~ (/qemu)?((/include)?/hw/mips/.*|/target/mips/.*)
+
+nios2
+  ~ (/qemu)?((/include)?/hw/nios2/.*|/target/nios2/.*)
+
+ppc
+  ~ (/qemu)?((/include)?/hw/ppc/.*|/target/ppc/.*|/hw/pci-host/(uninorth.*|dec.*|prep.*|ppc.*)|/hw/misc/macio/.*|(/include)?/hw/.*/(xics|openpic|spapr).*)
+
+riscv
+  ~ (/qemu)?((/include)?/hw/riscv/.*|/target/riscv/.*)
+
+rx
+  ~ (/qemu)?((/include)?/hw/rx/.*|/target/rx/.*)
+
+s390
+  ~ (/qemu)?((/include)?/hw/s390x/.*|/target/s390x/.*|/hw/.*/s390_.*)
+
+sh4
+  ~ (/qemu)?((/include)?/hw/sh4/.*|/target/sh4/.*)
+
+sparc
+  ~ (/qemu)?((/include)?/hw/sparc(64)?.*|/target/sparc/.*|/hw/.*/grlib.*|/hw/display/cg3.c)
+
+tilegx
+  ~ (/qemu)?(/target/tilegx/.*)
+
+tricore
+  ~ (/qemu)?((/include)?/hw/tricore/.*|/target/tricore/.*)
+
+unicore32
+  ~ (/qemu)?((/include)?/hw/unicore32/.*|/target/unicore32/.*)
+
+9pfs
+  ~ (/qemu)?(/hw/9pfs/.*|/fsdev/.*)
+
+audio
+  ~ (/qemu)?((/include)?/(audio|hw/audio)/.*)
+
+block
+  ~ (/qemu)?(/block.*|(/include?)(/hw)?/(block|storage-daemon)/.*|(/include)?/hw/ide/.*|/qemu-(img|io).*|/util/(aio|async|thread-pool).*)
+
+char
+  ~ (/qemu)?(/qemu-char\.c|/include/sysemu/char\.h|(/include)?/hw/char/.*)
+
+capstone
+  ~ (/qemu)?(/capstone/.*)
+
+crypto
+  ~ (/qemu)?((/include)?/crypto/.*|/hw/.*/crypto.*)
+
+disas
+  ~ (/qemu)?((/include)?/disas.*)
+
+fpu
+  ~ (/qemu)?((/include)?(/fpu|/libdecnumber)/.*)
+
+io
+  ~ (/qemu)?((/include)?/io/.*)
+
+ipmi
+  ~ (/qemu)?((/include)?/hw/ipmi/.*)
+
+libvixl
+  ~ (/qemu)?(/disas/libvixl/.*)
+
+migration
+  ~ (/qemu)?((/include)?/migration/.*)
+
+monitor
+  ~ (/qemu)?(/qapi.*|/qobject/.*|/monitor\..*|/[hq]mp\..*)
+
+nbd
+  ~ (/qemu)?(/nbd/.*|/include/block/nbd.*|/qemu-nbd\.c)
+
+net
+  ~ (/qemu)?((/include)?(/hw)?/(net|rdma)/.*)
+
+pci
+  ~ (/qemu)?(/hw/pci.*|/include/hw/pci.*)
+
+qemu-ga
+  ~ (/qemu)?(/qga/.*)
+
+scsi
+  ~ (/qemu)?(/scsi/.*|/hw/scsi/.*|/include/hw/scsi/.*)
+
+slirp
+  ~ (/qemu)?(/.*slirp.*)
+
+tcg
+  ~ (/qemu)?(/accel/tcg/.*|/replay/.*|/(.*/)?softmmu.*)
+
+trace
+  ~ (/qemu)?(/.*trace.*\.[ch])
+
+ui
+  ~ (/qemu)?((/include)?(/ui|/hw/display|/hw/input)/.*)
+
+usb
+  ~ (/qemu)?(/hw/usb/.*|/include/hw/usb/.*)
+
+user
+  ~ (/qemu)?(/linux-user/.*|/bsd-user/.*|/user-exec\.c|/thunk\.c|/include/exec/user/.*)
+
+util
+  ~ (/qemu)?(/util/.*|/include/qemu/.*)
+
+xen
+  ~ (/qemu)?(.*/xen.*)
+
+virtiofsd
+  ~ (/qemu)?(/tools/virtiofsd/.*)
+
+(headers)
+  ~ (/qemu)?(/include/.*)
+
+testlibs
+  ~ (/qemu)?(/tests/qtest(/libqos/.*|/libqtest.*))
+
+tests
+  ~ (/qemu)?(/tests/.*)
diff --git a/scripts/coverity-model.c b/scripts/coverity-scan/model.c
similarity index 100%
rename from scripts/coverity-model.c
rename to scripts/coverity-scan/model.c
-- 
2.26.2


