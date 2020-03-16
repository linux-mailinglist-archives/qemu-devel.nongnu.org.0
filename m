Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DF418704C
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 17:43:10 +0100 (CET)
Received: from localhost ([::1]:42548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDspZ-0005oZ-Vb
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 12:43:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52688)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1jDqkP-0008LK-No
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 10:29:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <its@irrelevant.dk>) id 1jDqkO-0007NX-H5
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 10:29:41 -0400
Received: from charlie.dont.surf ([128.199.63.193]:48450)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <its@irrelevant.dk>)
 id 1jDqkL-0006mZ-DD; Mon, 16 Mar 2020 10:29:37 -0400
Received: from apples.local (80-62-117-52-mobile.dk.customer.tdc.net
 [80.62.117.52])
 by charlie.dont.surf (Postfix) with ESMTPSA id 08601BF6A1;
 Mon, 16 Mar 2020 14:29:36 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH v6 02/42] nvme: remove superfluous breaks
Date: Mon, 16 Mar 2020 07:28:48 -0700
Message-Id: <20200316142928.153431-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200316142928.153431-1-its@irrelevant.dk>
References: <20200316142928.153431-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 128.199.63.193
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
Cc: Kevin Wolf <kwolf@redhat.com>, Beata Michalska <beata.michalska@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 Javier Gonzalez <javier.gonz@samsung.com>,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

These break statements was left over when commit 3036a626e9ef ("nvme:
add Get/Set Feature Timestamp support") was merged.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Acked-by: Keith Busch <kbusch@kernel.org>
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 hw/block/nvme.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 3e4b18956ed2..9740948b354a 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -788,7 +788,6 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeCmd=
 *cmd, NvmeRequest *req)
         break;
     case NVME_TIMESTAMP:
         return nvme_get_feature_timestamp(n, cmd);
-        break;
     default:
         trace_nvme_dev_err_invalid_getfeat(dw10);
         return NVME_INVALID_FIELD | NVME_DNR;
@@ -832,11 +831,8 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeCm=
d *cmd, NvmeRequest *req)
         req->cqe.result =3D
             cpu_to_le32((n->num_queues - 2) | ((n->num_queues - 2) << 16=
));
         break;
-
     case NVME_TIMESTAMP:
         return nvme_set_feature_timestamp(n, cmd);
-        break;
-
     default:
         trace_nvme_dev_err_invalid_setfeat(dw10);
         return NVME_INVALID_FIELD | NVME_DNR;
--=20
2.25.1


