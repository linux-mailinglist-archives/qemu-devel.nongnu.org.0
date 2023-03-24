Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D81046C80B5
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 16:08:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfirZ-0007el-MZ; Fri, 24 Mar 2023 10:57:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=440da7b32=anthony.perard@citrix.com>)
 id 1pfirS-0007eF-3Z
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 10:57:46 -0400
Received: from esa4.hc3370-68.iphmx.com ([216.71.155.144])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=440da7b32=anthony.perard@citrix.com>)
 id 1pfirP-0002VK-9z
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 10:57:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1679669863;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T7DQE8lnj29rg0E/ilRjru8gX+NTfSCQeJM0ED3jO00=;
 b=W0aHH+Ng0YAYT67HwksplO7sIrhriUX5Lir9a31yVI8xWUp5lhGIC2Zy
 TLQbFifxM1kA7NE7DNC9IdoAFRYid4sj402JxY8xhZjrHurcZqk6sAg2U
 +g0OP0T9iJBbGeqq5DekFe5hHKxZT6EXaFR/4VEMzIEFuv6OYknSp+6OP 0=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 104622256
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:wFzsuqz/2idpLplFWl56t+dMxirEfRIJ4+MujC+fZmUNrF6WrkVSn
 2BLCmCDbPqLMTSgLt12bN+zphgD756Ex9M2GQFs+yAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UMHUMja4mtC5QRlP6wT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KU5I1
 vsAJhwXUjmsheK26e+6F8l3h8t2eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+hgGX/dDtJ7kqYv6Mt70DYzRBr0airO93QEjCPbZwNwhjC/
 DiboQwVBDk7b82vzDmi/0iCm8D+lj6gQJJDTLyRo6sCbFq7mTVIVUx+uUGAieC0j1P7V99BJ
 kg8/C0ooq4vskuxQbHVRxCkrWTCuxcNV9dUF8U+6QeE0K2S5ByWbkAIUTteQNUjvd0xQ3oh0
 RmUnLvU6SdH6ePPDyjHr/HN8G30YHJORYMfWcMaZSQDwN77rq0psjvgTNZjOfO00/3uGD6ll
 lhmsxMCa6UvYd8jjvvkrA6Z3mj3/vAlXSZuuFyJAzvNAhdRIdf8Otf2sQWzAeNodt7xc7WXg
 JQTdyFyBsgqBIrFqiGCSf5l8FqBt6fca220bbKC8vAcG9WRF52LJ9o4DMlWfhsBDyr9UWaBj
 LXvkQ1Q/oRPG3ChcLV6ZYm8Y+xzk/exSIW7C6iNMIQSCnSUSONg1H8GWKJt9zq1zBhEfV8XY
 P93jvpA/V5FUP86nVJats8W0KMxxzBW+F4/savTlkz9uZLHPS79dFvwGAfWBgzPxP/e8Vq9H
 hc2H5fi9iizp8WlOnONrtVDcwtaRZX5bLivw/Fqmie4ClIOMAkc5zX5n9vNp6QNc3xpq9r1
IronPort-HdrOrdr: A9a23:4b5Gnq1ZdPCU8Pf68cJuLgqjBKMkLtp133Aq2lEZdPU1SKGlfq
 WV954mPHDP+VUssQ4b6LK90cW7L080lqQY3WByB9eftWDd0QOVxepZgrcKrQeAJ8T2zJ856Z
 td
X-IronPort-AV: E=Sophos;i="5.98,288,1673931600"; d="scan'208";a="104622256"
To: <qemu-devel@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, David Woodhouse
 <dwmw@amazon.co.uk>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PULL 2/2] hw/xenpv: Initialize Xen backend operations
Date: Fri, 24 Mar 2023 14:56:13 +0000
Message-ID: <20230324145613.41502-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230324145613.41502-1-anthony.perard@citrix.com>
References: <20230324145613.41502-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=216.71.155.144;
 envelope-from=prvs=440da7b32=anthony.perard@citrix.com;
 helo=esa4.hc3370-68.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Reply-to:  Anthony PERARD <anthony.perard@citrix.com>
From:  Anthony PERARD via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: David Woodhouse <dwmw@amazon.co.uk>

As the Xen backend operations were abstracted out into a function table to
allow for internally emulated Xen support, we missed the xen_init_pv()
code path which also needs to install the operations for the true Xen
libraries. Add the missing call to setup_xen_backend_ops().

Fixes: b6cacfea0b38 ("hw/xen: Add evtchn operations to allow redirection to internal emulation")
Reported-by: Anthony PERARD <anthony.perard@citrix.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
Tested-by: Anthony PERARD <anthony.perard@citrix.com>
Message-Id: <5dfb65342d4502c1ce2f890c97cff20bf25b3860.camel@infradead.org>
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 hw/xenpv/xen_machine_pv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/xenpv/xen_machine_pv.c b/hw/xenpv/xen_machine_pv.c
index 2e759d0619..17cda5ec13 100644
--- a/hw/xenpv/xen_machine_pv.c
+++ b/hw/xenpv/xen_machine_pv.c
@@ -35,6 +35,8 @@ static void xen_init_pv(MachineState *machine)
     DriveInfo *dinfo;
     int i;
 
+    setup_xen_backend_ops();
+
     /* Initialize backend core & drivers */
     xen_be_init();
 
-- 
Anthony PERARD


