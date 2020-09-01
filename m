Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 477E8259086
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 16:34:03 +0200 (CEST)
Received: from localhost ([::1]:34366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kD7MI-0004Vo-9i
	for lists+qemu-devel@lfdr.de; Tue, 01 Sep 2020 10:34:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kD6za-0006Bx-Jt; Tue, 01 Sep 2020 10:10:34 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:40129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kD6zY-00040c-IA; Tue, 01 Sep 2020 10:10:34 -0400
Received: from localhost.localdomain ([82.252.135.186]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MrhLw-1kyYlR2DMy-00ndWr; Tue, 01 Sep 2020 16:10:25 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 41/44] hw/intc: fix default registers value in
 exynos4210_combiner_read()
Date: Tue,  1 Sep 2020 16:09:51 +0200
Message-Id: <20200901140954.889743-42-laurent@vivier.eu>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200901140954.889743-1-laurent@vivier.eu>
References: <20200901140954.889743-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:HV333Pu56tdjA+Fq+Yyh+2C6PRpyef9rXpWQpiOOskLJS+eG3ss
 yqhpAtMASB4K5xTEX+CsKrUUSR4BxjZqRl9FCk2rZQCr4HIDu8xS/dSCz/oKXL+M2WXSWpC
 dOfV82UT/Sdu0AeCRKoGCBafMrWSJPc+R/WV7bk59Uxd41ShRQqIhymul3DgPOikNtbdfOK
 3jX/0YZNw3SDrpqGQSF3g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ha64hrP9JQs=:iaPbmguc0rMKmiCNFs7rUD
 svrXyQ1mLix2iXZpT22HNJfA7Vtpg/f+UuEms5LvTC10yV2NayahpvEfx6NZKUozC8uB2ibjN
 Wj8+pxkwAC/XNqUDBUELiPHbwDb7/k1rL1cs3UXyc89C+vpNhqAumzScpk8kffpDSgU0BAPpZ
 0GZ4ImjEQXk+pTZe8p0qrYzAxaIo45fo207pQodN0oaOJkbf8nNivDg4c5b+82p8NgaHNXTuC
 e1yzRb5ibJFGzWoL8hFLASFOVNR5W0P+zCW2IBRvO9WnZeVAQUs5BBhST7CP4D9eTNj9NU2af
 eiyTSlTDdg+cu8jrA240nmhIl36KyWjPuzaEwIFYRuOYAeFhpJ4RNaTM0VLDrvWEBayTRP3/7
 KIFvycg20M80NwT26fru3rFT08rguN1fCCwbmotCYDSvjgGW2AmyQiIu2Cit8L4/eQk3ZS6GI
 4iqSucn+M7JtTupaWfcBPAukJIjkwG5WkAlveV6WK5CTBOaRgLJDhEu+Gg1HeexDoMfbbKGEh
 hhtD6x6/vbi04xAa9Ro5BWSyFJCkKeEUNL537PQ+7zPz98GmUdW20W4I77qb1B/41rkRq6NCE
 fl8eyGO+Pt2BHRwFwxiX4oLQ3X6zk5tj1zb1mOeymAQXBT+HCP32ejVcDZYbspAlOZK7eL5ek
 Fc3wFiTnb889/W3/f68aUeLqtb7m9aoAAxTDsV1ZwSkiLa3MdcP+NAxKOqT8Mu4bbHc7B+s7R
 fsyt5zrajHjrJxPDVhDjCVIQDnxkBtaMz/DaYokn0q02XOu4vRbmgFoDRNnmv8Zkt0cWaukL9
 ogbkf2fv0rrf3q9iZ2MsRZri0O0hbwq4/f/z5iOxPOJtv5GcQ3TxKyqgmBdm7VIGRyBW+l4
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/01 10:10:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, Chen Qun <kuhn.chenqun@huawei.com>,
 Peter Maydell <peter.maydell@linaro.org>, Laurent Vivier <laurent@vivier.eu>,
 Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Chen Qun <kuhn.chenqun@huawei.com>

Clang static code analyzer show warning:
hw/intc/exynos4210_combiner.c:231:9: warning: Value stored to 'val' is never read
        val = s->reg_set[offset >> 2];

The default register return value should be return 'val'.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20200827110311.164316-10-kuhn.chenqun@huawei.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/intc/exynos4210_combiner.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/intc/exynos4210_combiner.c b/hw/intc/exynos4210_combiner.c
index b8561e418037..59dd27fb16e5 100644
--- a/hw/intc/exynos4210_combiner.c
+++ b/hw/intc/exynos4210_combiner.c
@@ -229,7 +229,6 @@ exynos4210_combiner_read(void *opaque, hwaddr offset, unsigned size)
                     TARGET_FMT_plx "offset\n", offset);
         }
         val = s->reg_set[offset >> 2];
-        return 0;
     }
     return val;
 }
-- 
2.26.2


