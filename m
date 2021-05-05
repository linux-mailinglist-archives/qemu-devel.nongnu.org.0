Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E448374BDA
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 01:24:56 +0200 (CEST)
Received: from localhost ([::1]:41778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leQsx-0008Lr-Eg
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 19:24:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQrY-0006mw-OD
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:23:28 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:42178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQrW-0000B0-Vm
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:23:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620257006; x=1651793006;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a4yEU+4TjBk6Oe2/N0wvc5JGnBHXRW0rnny396yYmb0=;
 b=V/8xEhSw+1jaC2jIURMmAf0gGIKJBbu4hqVUK6yT2HoN8V9uxNXiUraw
 a6ZfAP+7pIu0g680m8EfqjBSdR8uYVAePlScDuqrl+vzXOKzRdVieh85D
 wT0nX8Sbyl26a3iGGt6nwdA7sAvFCMlGQe2jbBHsLnVI+uX30vptIFAxX
 hEUJzweaLhUKOFt0ozGZmAHyUL1Um8ZDcQtQF1fcdD33siDkCWpC8LHDo
 S2frN3gKRIBK+nllXbnGHaWnjZHH+0gQaOS3lSYhrdUzCg86ZQRpziGoX
 gk0N142NDnVt+DpGcQfUWgCN6iWt9a1XzKicXdxQMqbHtJBA3XwVRveqB Q==;
IronPort-SDR: nbthj2Y2aVvxa8XH1DbGCcDx97gsgZDSxnWEOCGL1qHrbKMCG/P82c4wQnT5ySSwf9DQTJyavz
 SJ8JueeB64xvWUcRkf0IeNqCCfAug40/Fm9fY0VCIKgUAjQNsylXWu+pIFvGRvwfQHXoyMb7OS
 TenVRC9brIsOLPw1k4GmgcFJcZ5vuOhQtrDPzIop+YFjd9mU9xQirjTZPtTC7BMikrQtiGlHTY
 cKXvXSzzhf23ow0jBBnKAqQ1v3v537UXtIj5J/u7wsSGG3cLL1hb45bPNZxGRft6AiRsChfxP8
 rxc=
X-IronPort-AV: E=Sophos;i="5.82,276,1613404800"; d="scan'208";a="278356863"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 May 2021 07:23:26 +0800
IronPort-SDR: QGSH4fqZjGNnFQsQsG832TX89/V1nvTdVhpFLlJk/++Qt4fbo31wCITcKgpR3sMRZu/vcACeEI
 PP1kTO/FI2ZDreQ7xWe3jLIh2CenxLBnsZ7CGShDhT9E2nndRHrJwc1iHO8lhDEL6z2t4k58vN
 +WeBHLmMmr/L6YMDZDIoBmQ2vpPPXpcYWtUosskjB8SRuEhnfPplqmGi+l6Dt+iqk9QtiIWsYv
 bUM+hzf5ypokYkSqDt8yPKgLb6DmoE4ZWwHX/Y27SX0W1G9hsyHzzVEqG2vO6d8cExA00yXVhL
 iyC+r9eQWM/PE5xBTRYvp4A7
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 16:02:06 -0700
IronPort-SDR: Rz+qYxiszT9zbcx4mDRMHTB6jy3PjdHftaO4Wrwv3A6lhYiuONzshjX9Tj71ZVIDnikE7Wl0TP
 p9+OPrxmAJJ91fpm8/XQpZ3ifqNl+pv50D1Xw2GwIYrGql6WRHMkp86OAkhuQrMgacfIRZiz3D
 TRHVBDZ8hBBlnGe5aA35ol7IypJs+dCl9wF7/THQtyZPey4ERY2brMvxTpWviu3DjytG7PTHY0
 nCmjwYjW42QKC2XorMRXFhVp8IKbVbhmH5JmQ6jM8aD3N0HtypHBiFaRvwyDoazKLce4KHpZ8U
 INk=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.46])
 by uls-op-cesaip01.wdc.com with ESMTP; 05 May 2021 16:23:23 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v2 03/42] target/riscv: Align the data type of reset vector
 address
Date: Thu,  6 May 2021 09:22:33 +1000
Message-Id: <20210505232312.4175486-4-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505232312.4175486-1-alistair.francis@wdc.com>
References: <20210505232312.4175486-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=752564754=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: Dylan Jhong <dylan@andestech.com>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Ruinland ChuanTzu Tsai <ruinland@andestech.com>, alistair23@gmail.com,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dylan Jhong <dylan@andestech.com>

Use target_ulong to instead of uint64_t on reset vector address
to adapt on both 32/64 machine.

Signed-off-by: Dylan Jhong <dylan@andestech.com>
Signed-off-by: Ruinland ChuanTzu Tsai <ruinland@andestech.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210329034801.22667-1-dylan@andestech.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 86e7dbeb20..047d6344fe 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -137,7 +137,7 @@ static void set_feature(CPURISCVState *env, int feature)
     env->features |= (1ULL << feature);
 }
 
-static void set_resetvec(CPURISCVState *env, int resetvec)
+static void set_resetvec(CPURISCVState *env, target_ulong resetvec)
 {
 #ifndef CONFIG_USER_ONLY
     env->resetvec = resetvec;
-- 
2.31.1


