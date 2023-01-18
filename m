Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D263C67157E
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 08:54:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI3Fg-00020H-PQ; Wed, 18 Jan 2023 02:52:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pI3Fc-0001wq-N6; Wed, 18 Jan 2023 02:52:52 -0500
Received: from mout.kundenserver.de ([212.227.17.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pI3Fa-00025w-Un; Wed, 18 Jan 2023 02:52:52 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MGi2e-1pUgZw0o9y-00DnR7; Wed, 18
 Jan 2023 08:52:46 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Hoa Nguyen <hoanguyen@ucdavis.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 14/15] hw/cxl/cxl-host: Fix an error message typo
Date: Wed, 18 Jan 2023 08:52:33 +0100
Message-Id: <20230118075234.2322131-15-laurent@vivier.eu>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230118075234.2322131-1-laurent@vivier.eu>
References: <20230118075234.2322131-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:IVSXtRPLrRfzfkAQT7KBTH6AhgGJQI/mXG0VuobxxZe2T33bIKb
 UP4KMS+PGT0RVUzJJhR5EEeeA7ftu+4Hco9ftxWaUqCNAS/87Fw22I7SnWTQmrZ6sVVVUy/
 f8tg4yyKqHg8FaOM1ipW3O1QRsW0WL5d8ivD5barm1qKfZW1fJITS2bC2O78q+5wn5yUkT2
 N4hGaXld/0Omns3pmotlg==
UI-OutboundReport: notjunk:1;M01:P0:u/k+P7hR8oQ=;Rc0doN7qHeu4hBP6Iiyn0GjPp+n
 h1C3/NX5ZJssNKAClxykQbBVtmFvB3GGsHpEx5T5u+z2XGiZvn0ADdVnt/rw1dlrLJpIV6uyj
 3RkaColzJqmeCPbKsOawiV42uGX8nc1PE3/FKr2xycmmBBOgWfh+ngGbFQEfMcNkLiW/lEyvW
 d5cFOzV4Dw2bkesNpZewPoJujfXhu4mh3gXFjtMSa78P9jLud1oGSanWMagdsX2Ph6hMBzhak
 QgD4bg5I9gOWPJY7pN9P8uohgNY/8lYP0J1ayxjkrOZd5jwoDdfYPJlwjET5yXYVPQ5tnJ0xB
 deDo8XJUeiNN1PoLU47OEENbAsTzjTaDQNj2MxKiDkZg6QWzmkNPmJ9PXpclf1f1uco/qczc5
 BjgPm2oJ3GQPektBuWeoMQJClc5qYln4LT9G89TwknurmLUpLwkZZ2peyDD4b7Y0UCPAQsu9K
 FL/OhpyQYd9HFs6nT522mMnLpZ4hOORvGVvMYSIvOs6jcaZ3TF/+021fHrUiV3ExektYwDNHx
 mzSVaLiYp02qVWVWh+0nKta1sN4qUI3WqUNCubLtWVoY4f2vlDeZsDnjo2GVUuoz4513WjaAX
 NieuXbYHLehiyREifjX2eVhEjsZ1n5Xitg/nPvV68Oo2tLvNt70Sdil7PMu36aev8YCP+/0Pz
 UNWffrNgIG7Yx5WDNRtHRF1Ncj+belSjaNqW19XuAw==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Hoa Nguyen <hoanguyen@ucdavis.edu>

Signed-off-by: Hoa Nguyen <hoanguyen@ucdavis.edu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221127032220.2649-1-hoanguyen@ucdavis.edu>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/cxl/cxl-host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/cxl/cxl-host.c b/hw/cxl/cxl-host.c
index 1adf61231ad5..3c1ec8732afd 100644
--- a/hw/cxl/cxl-host.c
+++ b/hw/cxl/cxl-host.c
@@ -47,7 +47,7 @@ static void cxl_fixed_memory_window_config(CXLState *cxl_state,
 
     if (object->size % (256 * MiB)) {
         error_setg(errp,
-                   "Size of a CXL fixed memory window must my a multiple of 256MiB");
+                   "Size of a CXL fixed memory window must be a multiple of 256MiB");
         return;
     }
     fw->size = object->size;
-- 
2.38.1


