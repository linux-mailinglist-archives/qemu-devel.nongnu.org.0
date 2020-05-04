Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id C69441C45E1
	for <lists+qemu-devel@lfdr.de>; Mon,  4 May 2020 20:28:46 +0200 (CEST)
Received: from localhost ([::1]:60398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jVfpY-0002CZ-BE
	for lists+qemu-devel@lfdr.de; Mon, 04 May 2020 14:28:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1jVfoZ-0001Al-Qy
 for qemu-devel@nongnu.org; Mon, 04 May 2020 14:27:39 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:6439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1jVfoY-0004NA-GJ
 for qemu-devel@nongnu.org; Mon, 04 May 2020 14:27:39 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5eb05e180000>; Mon, 04 May 2020 11:25:28 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 04 May 2020 11:27:36 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 04 May 2020 11:27:36 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 4 May
 2020 18:27:36 +0000
Received: from kwankhede-dev.nvidia.com (10.124.1.5) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 4 May 2020 18:27:29 +0000
From: Kirti Wankhede <kwankhede@nvidia.com>
To: <alex.williamson@redhat.com>, <cjia@nvidia.com>
Subject: [PATCH v1 0/2] Sample mtty: Add migration support
Date: Mon, 4 May 2020 23:24:18 +0530
Message-ID: <1588614860-16330-1-git-send-email-kwankhede@nvidia.com>
X-Mailer: git-send-email 2.7.0
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1588616729; bh=Pb04Iu62xKvSrOf93txxsuT7GSxKY/A1qJ9hHxmcZuw=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 X-NVConfidentiality:MIME-Version:Content-Type;
 b=m76864SCMjU+ofaz8QG0ZWglO0K2NDrIKBvLMqDXCHVs8UMiQYQ2+RHbtfwXmB9vc
 6U1sZYzE3bjenuC3tBnSDsLmxzpKAHpHXBvzbdqyvKb2onu51aOqF/BTHnYKQiU3Tq
 ZPsg3Xu5SS2j8+LH8xaSzBiIFz+EPsY7uUCDzjypijZ4gCuraXssStsiMiqHTp5qpi
 2TnZHcUMd81NT1ADNVfLCpRvNhUE7iThZ2XZ9dTGOLlP9bc1uvvzq3yDTD7YAoHSvu
 d98nOCDYDdnnlICT3QBKiGfDvCCG3uyjz5NqxT3UWN102qV0asilZNl27NP14tU1bE
 gRzJcNH0XR9lg==
Received-SPF: pass client-ip=216.228.121.143;
 envelope-from=kwankhede@nvidia.com; helo=hqnvemgate24.nvidia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/04 12:32:29
X-ACL-Warn: Detected OS   = Windows 7 or 8 [fuzzy]
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Zhengxiao.zx@Alibaba-inc.com, kevin.tian@intel.com, yi.l.liu@intel.com,
 yan.y.zhao@intel.com, kvm@vger.kernel.org, eskultet@redhat.com,
 ziye.yang@intel.com, qemu-devel@nongnu.org, cohuck@redhat.com,
 shuangtai.tst@alibaba-inc.com, dgilbert@redhat.com, zhi.a.wang@intel.com,
 mlevitsk@redhat.com, pasic@linux.ibm.com, aik@ozlabs.ru,
 Kirti Wankhede <kwankhede@nvidia.com>, eauger@redhat.com, felipe@nutanix.com,
 jonathan.davies@nutanix.com, changpeng.liu@intel.com, Ken.Xue@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

These patches add migration support to mtty module.

mtty module doesn't pin pages, but to test migration interface which
queries dirty pages, first patch adds sysfs file to pin pages. Input to
this file is guest pfn. Each write to sysfs file pins one page.

Second patch add migration interface to mtty module.

Only stop-and-copy phase is implemented.
Postcopy migration is not supported.
This series is for testing purpose only.

Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>

Kirti Wankhede (2):
  Sample mtty: Add sysfs interface to pin pages
  Sample mtty: Add migration capability to mtty module

 samples/vfio-mdev/mtty.c | 778 +++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 749 insertions(+), 29 deletions(-)

-- 
2.7.0


