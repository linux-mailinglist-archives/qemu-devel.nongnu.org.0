Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B57FA479558
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 21:17:40 +0100 (CET)
Received: from localhost ([::1]:39288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myJff-0002D5-RF
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 15:17:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1myJYm-00061D-Ls; Fri, 17 Dec 2021 15:10:32 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:55089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1myJYl-0001Kn-2F; Fri, 17 Dec 2021 15:10:32 -0500
Received: from quad ([82.142.30.186]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MXXdn-1n08iO3gnH-00Z2lC; Fri, 17
 Dec 2021 21:10:24 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 5/9] hw/virtio/vhost: Fix typo in comment.
Date: Fri, 17 Dec 2021 21:10:15 +0100
Message-Id: <20211217201019.1652798-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211217201019.1652798-1-laurent@vivier.eu>
References: <20211217201019.1652798-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Yp9InfhxjS+IS2Gv4DyCN+O6FlSuobETECztAK1zs9ZGMMRGR4e
 HM9r7EmKV4P6b3YStylpv2MaZKPEbSJD1IaQ3yQbN2upQqHoTr9Cyjr9beDqZhlWmGtygIb
 n5+HYoE6NtxK/D3a9fcb6RsJq09k/bWVGWMGYlg3In1cNvuIKAdX0yCCCV2Q2DILfJguHDh
 6Pqsm+pGbCxxp7S3+tiaw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qf6sSX9QtPU=:lwHID7xH7Fyi/hx1KD1hbf
 rArFthZ+p0MAfwnxqu2LxKHkEiydh95CDuh2rOQUxnKKADilgsYSabr5FAd1Qz7zcGazHMagO
 klzqupSH6Imj6J/Vs0lglbZo28ccAzL2VpZsP9d3onh9t4PJyUighM4M40izkJSB8L/5mH7aB
 73RFlvM08xsfDW/wJrcqYamDAvRQIFvob1C6PbxtPmBlhhcwAfHyaBzIzw3M6lDSp8rWSe+o3
 d0pJesQs8DNbf1amUTaLkUu/BH5EltaJF5P/+LuQELqbChu3GVebvlygh+13aTACqLMIHwoDp
 wqKyTe1QeYbayaLZk46UDBOfldj5NpvZ475v+WFEwovopTet/GNsZc8P0x4LDsO2ADKSjhv5y
 5P2U9GvG/6UQTyQ3Jc6Ts51Bpsh129CI6DTfVcKKsZEdolV8nryvKuhKzJT/2OCwOIk8Vtzp9
 HGBO0hdliG6vpDOqkpoVsG6GqpMLPWThikGKJv4yUoyYbDakg9THIePD88VVDYZkzzlrrK4nY
 CMSYuXpY9ongJgKuS4WDtPam0yax2ttp+Q+Jv3mCYUqwHQnccHSOrds50afk/PLQmJznuvNGO
 KwAuMoXj7YEIbuQ7jTk0juFyKXMCDaLUGFQ4HtWduQ3SloNI4WsbwHO5qnaVE0+Pnr9PAgwm7
 nBAyuC3Dx5x9QdOECWR2h8ilOMgfewmIfDx+j+pGt/91X4wX6WNBOy1DJhSlrtcDLmSo=
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Leonardo Garcia <lagarcia@br.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Leonardo Garcia <lagarcia@br.ibm.com>

Signed-off-by: Leonardo Garcia <lagarcia@br.ibm.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <a10a0ddab65b474ebea1e1141abe0f4aa463909b.1637668012.git.lagarcia@br.ibm.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/virtio/vhost.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 437347ad01c9..20913cf8fb4b 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -313,7 +313,7 @@ static int vhost_dev_has_iommu(struct vhost_dev *dev)
      * For vhost, VIRTIO_F_IOMMU_PLATFORM means the backend support
      * incremental memory mapping API via IOTLB API. For platform that
      * does not have IOMMU, there's no need to enable this feature
-     * which may cause unnecessary IOTLB miss/update trnasactions.
+     * which may cause unnecessary IOTLB miss/update transactions.
      */
     return virtio_bus_device_iommu_enabled(vdev) &&
            virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
-- 
2.33.1


