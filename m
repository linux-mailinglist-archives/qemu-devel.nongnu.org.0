Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E90F3BDBFD
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 19:11:54 +0200 (CEST)
Received: from localhost ([::1]:58430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0obx-0005Bm-Ed
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 13:11:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m0oKt-0004Fm-05
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:54:15 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:50008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m0oKp-00088v-M4
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:54:14 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 166Gpkbl007370; Tue, 6 Jul 2021 16:53:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=S76s+N5xDhYUe376t9WmNmGhiDCL+3ZcIwsbHLWyF6U=;
 b=b5tVvM4FEAlkYzTsEsHFv30sTPLSR/j6ozyLL4SeC2UkJYdIOoF6wLsY+gF2n7IR9Zrn
 SxzrS+DT6kSUNzhZp+oSuHL5EEhFhg3B8d3zKvLtVWWXa74Jg5dY86zLMEUzoPgQNCsY
 nMpbVEPbbzGtRxpvZd7OtJZ23KKRBVb3RvtrEvjR47LcIwmIb9InQ9mzj/qqLru7e15e
 77Ph21Qumdt2j44WBAgkVTJVyZnqwOL25WZ9cDqMZ27gd0+OfAcb6OucNZR6jOGSXmI8
 TN3sb10elOaod/M/d5wwaNlhIlVzXlMj1B7l1p3zBJGlWxnT9TvcTwj9D8dYmO1xk2RQ gA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39kw5k32fr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 16:53:09 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 166GoHRx012560;
 Tue, 6 Jul 2021 16:53:08 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2045.outbound.protection.outlook.com [104.47.73.45])
 by aserp3020.oracle.com with ESMTP id 39jfq8vjk1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 16:53:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FKuYfdJKtMt52BSuT2b7Nu6vSciHViVO1cDoQ0HTGmM2MkYGArpWPQbjUq5/Ba4f3a2UWI8Di05LCWAOFMAbXGqBF5TOyZ+C5Nmq4Acobk1H2raQQH33zxRZlfNV8l44nimA6zD9UBB6o3kK/FgmR5EEApLvfRn7arYaE2eJaLA99jO6lnfABVdgWAC7Y+R9zEbKrTRvL8wEePjVAWoMB0znGpXGsWT1ZEh/IByvhoG/o4rSIn5mEW8KKVuGG2mtQ/3d3YVLR2fvVStDrOWl8gfu5EbG9nAiI3L2AsTujvZqgHzHJxdLHp0oKQTDybZY+/z+D+ysbMR99PEqFUZNmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S76s+N5xDhYUe376t9WmNmGhiDCL+3ZcIwsbHLWyF6U=;
 b=VnYSUOu+2dd6g+6W5IU5xtWpCxkgS96iZvvh0gX3T+O83WJQ7taoWhDI9XXCankLilZzvuqv1MkhEAuvLNnOcso7lEjtyc0u2oAhFRprXxOa6v4fGhewP75vkWAMPJrw1z8jrZElauFgODDAhYd/IncQ09h6OrpeUfMiDBYrrgQERMo43frfG9xtQKDjhnsf1NuEKREMZh5LuAxiD+8vht2FG21KPZ2oHPZI0M99jHQR/8j13u8RTP8IC1sQ8lUP2MoyjomFLdtQjvNrsM5QgOaUyM7b4Um7npDAlt7t8aERAJU1Wa/O6pLE1LVmAQwVQGMemUMkuAwdNZOK9AtlJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S76s+N5xDhYUe376t9WmNmGhiDCL+3ZcIwsbHLWyF6U=;
 b=JhlV0Ql4b7FJA8pn+K3GSu7fqsIshu2gKzRG3nCsbPq98lSJW++USKVk2m4jbRWjMJ+bzsiFYR22wZ2Jz2VepMG5NGYRQ05EtKG/5FEynwE4jJq1M6lSzAoyv5q3sJlvU0591xdkDAd94oBudk4FWTD9sRRNfQbecGvnxe/g178=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB2982.namprd10.prod.outlook.com (2603:10b6:a03:8a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19; Tue, 6 Jul
 2021 16:53:05 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba%7]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 16:53:05 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V4 16/25] vfio-pci: cpr part 1
Date: Tue,  6 Jul 2021 09:45:47 -0700
Message-Id: <1625589956-81651-17-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1625589956-81651-1-git-send-email-steven.sistare@oracle.com>
References: <1625589956-81651-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0201CA0041.namprd02.prod.outlook.com
 (2603:10b6:803:2e::27) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-dev63.us.oracle.com (148.87.23.4) by
 SN4PR0201CA0041.namprd02.prod.outlook.com (2603:10b6:803:2e::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19 via Frontend
 Transport; Tue, 6 Jul 2021 16:53:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84083592-e9a1-4068-af74-08d9409e869a
X-MS-TrafficTypeDiagnostic: BYAPR10MB2982:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB2982110935D7C53C84973C68F91B9@BYAPR10MB2982.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:240;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dOFT1Ei+Q5P3h245tL/vvBAWGSgE/1gpWFuaqeTxfb2R9ijAX1CGw8RVbYKkZKP/t9bbNWOdj2nwGF/EVpYOHwfyU7TQtxFGMU16MqR45kpA++QZwiWNyfWR2voDFJcLpXu1jo49cIPGIWUoAukezNSNvS7AUonUedh7G3xdYTwKc42qjRBMqwWc30e6VaR4PI3TKS51g96PLuTLSsdKo0h+T8x68kRj9vyHoPoG0IxTADU8e2KwI2r1CdiNu37TsgzpS4KPcP6duD06txUw9ez9o5N4yw1NyktMbZxaBbdx81hd2PjXWilQVY8G32I0sbVpyyv3p62SwVjq/LCZAtj91ii8qnoxFBWc+f69uL2+IgqcLcFN8HfG+NZIh8Up3bS6rR+s00a8EpbfaIr56HzqBYOYRYNoYibj8TaDFuMd0Zrc59TNVMH0S3XNu+s0YnHIwFWamC6sJonT8Yc5yG8C5yjKgCl6Pwuznk+p8zjozpYmltR8s0q0wq0wpg4xL/mWVjgYp/200e2Xz/znM1YD+MEBe2cey94j1/fInTmXt3J/AseuN+04VUSTTT98qIVzZq17ZzYJRVSz6ENa+BVv2tIfHux6KuqHUqjPNyOyIgrh/tesrCnpGedvNz0rV02Y4oZAXChGf6d9qAtYUxU4secVMYZcywZSRlSkCnbigZebOxZL2dKSdGCcxadO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(346002)(366004)(136003)(396003)(376002)(956004)(8936002)(83380400001)(2616005)(7696005)(316002)(52116002)(6666004)(478600001)(26005)(8676002)(38350700002)(38100700002)(186003)(36756003)(86362001)(6486002)(7416002)(66946007)(30864003)(54906003)(2906002)(107886003)(4326008)(66476007)(6916009)(66556008)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5Eo/8HaYAvqU7TIIxd7Qgu1u4OCPiCt3YhUEangFdtgQmQDpzTaGuLekCkgw?=
 =?us-ascii?Q?/1bSVzrIhPzJ1E5KiS5pTFhH+1C2YfhyTK2F5PzPL/GwusINrxFovVOVZAe+?=
 =?us-ascii?Q?cZb9N5y7nET9dz8Wv1yVmrTFAVeAQhZPPVZj2YIoGVSo4RBgxIYZDHYD5W8M?=
 =?us-ascii?Q?erfpEtyd2uJZXowxBCeHyPP2WBFyz+SOdHtjNMIVJckYFM3FoSVK5/7TiICH?=
 =?us-ascii?Q?xGOZnDvX0Hzja0pgnc5MLR5BajGygsE7OY+YINn9A9AXqSdQDrM9VOjpjcDy?=
 =?us-ascii?Q?g/sS3hK+E8pf0JnRmWn8Em9r8Bad3amfV1eiDSCxgeRrEZlU7RgisNy3Yrvg?=
 =?us-ascii?Q?3qUILU4sei6dedsKeEysiiXRO4gKgyAOHhgxpoGPQGxWuFu/catNrSWuKYkN?=
 =?us-ascii?Q?jV5DTJPaascH/I/3PLKaTp3CusHluSaRvKhefdTlgPq5uj8Uu4X7YgDpAjag?=
 =?us-ascii?Q?fa00xYstLemweMcbH5AQLnhuc+Nl48Bj0tdBuzhz89o6Pa0Tsa9WGnzrWUdI?=
 =?us-ascii?Q?XpaNhDtowqpEGUAORFUPsqohGpiwW6FXb3h9igVAFGvZjtndQqk9SoRCtYrJ?=
 =?us-ascii?Q?MZATqUAf/deBo2DazSSa5r2WUunyuXFoUsiEC8yVt8Zcdmq5o06lwuv2t5hX?=
 =?us-ascii?Q?Enkg6UVKkpW3D2UOF8Z2Lb2AGmbAB385FG7b2qgEsk9nynfev2q7v7Hx91eP?=
 =?us-ascii?Q?azIIR5kFjPP+GaGsVSbB2VENzYePPSkJpXTQkzUkfBuXmn4Uwc1RGFC8k7FQ?=
 =?us-ascii?Q?p2ew8/bkSmLV4tAVhMKjBia9u4bKaAKyk/3V2p+ix1szQ+51p9UfdA0pl9Gi?=
 =?us-ascii?Q?nHJPwy60HLhq8pbBcoD9s0K7Q6Q8FjsF8b2KJWtHXV8x0yj311S16s1QTTao?=
 =?us-ascii?Q?pRJd42To3XynJXLWYc2agRaBikFyCgzzQqujA27Pnvi6mcrPyptr4j1CJxOZ?=
 =?us-ascii?Q?z55D95wn6wB6FQCj+eLBEWsvxkFQPF1kodrS8Wx1SQnc3zQqBdibIGuuw7P4?=
 =?us-ascii?Q?lAERfHnEdG+4QY/3oMTNy7pSPV/O1p+PaTjYJ8v8pwCqWEmjzB6OaTUnWduR?=
 =?us-ascii?Q?Gf1ZtENad5m1+hk9DsWNJWf0u9vat6YQUCYxZXp7p1NctAaxOnZ2+PSemd1a?=
 =?us-ascii?Q?Sm7e43unF+piuEftPZFjRooj6nvsv6i4sd7DyIVkyn7+csqGDixhhFLEfg5I?=
 =?us-ascii?Q?mCa30XwUGCF/ObvlT94qK2XQLooZMGTRLBUocofXp5yvMmDtbYIuWrUEUkEV?=
 =?us-ascii?Q?ijdfQr4fpswyf0FCsEIkCRAogjNsjB+ZmKjgWYjg2FLsgHrD0osPMlDQdbEj?=
 =?us-ascii?Q?9grXiu7+2VPKzGwGwS24p+pU?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84083592-e9a1-4068-af74-08d9409e869a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 16:53:05.8229 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /TkFIQLlcyW4AHcXpgBIu9tIYuchjmMhEp9D2x5II77InekS5I9ddyNeHSJjYcEfxDgLJTDcEb+FRA15ZuCmkMfdAbtdWRg/lsIQzjesXZU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2982
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10037
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 phishscore=0
 mlxscore=0 bulkscore=0 malwarescore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107060079
X-Proofpoint-GUID: wh6RIsBtuCOzrAvGveEeKyF7zxflxcT9
X-Proofpoint-ORIG-GUID: wh6RIsBtuCOzrAvGveEeKyF7zxflxcT9
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Enable vfio-pci devices to be saved and restored across an exec restart
of qemu.

At vfio creation time, save the value of vfio container, group, and device
descriptors in the environment.

In cprsave and cprexec, suspend the use of virtual addresses in DMA
mappings with VFIO_DMA_UNMAP_FLAG_VADDR, because guest ram will be remapped
at a different VA after exec.  DMA to already-mapped pages continues.  Save
the msi message area as part of vfio-pci vmstate, save the interrupt and
notifier eventfd's in the environment, and clear the close-on-exec flag
for the vfio descriptors.  The flag is not cleared earlier because the
descriptors should not persist across miscellaneous fork and exec calls
that may be performed during normal operation.

On qemu restart, vfio_realize() finds the descriptor env vars, uses
the descriptors, and notes that the device is being reused.  Device and
iommu state is already configured, so operations in vfio_realize that
would modify the configuration are skipped for a reused device, including
vfio ioctl's and writes to PCI configuration space.  The result is that
vfio_realize constructs qemu data structures that reflect the current
state of the device.  However, the reconstruction is not complete until
cprload is called. cprload loads the msi data and finds eventfds in the
environment.  It rebuilds vector data structures and attaches the
interrupts to the new KVM instance.  cprload then walks the flattened
ranges of the vfio_address_spaces and calls VFIO_DMA_MAP_FLAG_VADDR to
inform the kernel of the new VA's.  Lastly, it starts the VM and suppresses
vfio device reset.

This functionality is delivered by 2 patches for clarity.  Part 2 adds
eventfd and vector support.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 MAINTAINERS                   |   1 +
 hw/pci/pci.c                  |   4 ++
 hw/vfio/common.c              |  69 +++++++++++++++++--
 hw/vfio/cpr.c                 | 154 ++++++++++++++++++++++++++++++++++++++++++
 hw/vfio/meson.build           |   1 +
 hw/vfio/pci.c                 |  66 +++++++++++++++++-
 hw/vfio/trace-events          |   1 +
 include/hw/pci/pci.h          |   1 +
 include/hw/vfio/vfio-common.h |   5 ++
 include/migration/cpr.h       |   3 +
 linux-headers/linux/vfio.h    |  27 ++++++++
 migration/cpr.c               |  20 ++++++
 12 files changed, 344 insertions(+), 8 deletions(-)
 create mode 100644 hw/vfio/cpr.c

diff --git a/MAINTAINERS b/MAINTAINERS
index b844f3f..b69bbf5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2847,6 +2847,7 @@ CPR
 M: Steve Sistare <steven.sistare@oracle.com>
 M: Mark Kanda <mark.kanda@oracle.com>
 S: Maintained
+F: hw/vfio/cpr.c
 F: include/migration/cpr.h
 F: migration/cpr.c
 F: qapi/cpr.json
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index e08d981..27019ca 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -308,6 +308,10 @@ static void pci_do_device_reset(PCIDevice *dev)
 {
     int r;
 
+    if (dev->reused) {
+        return;
+    }
+
     pci_device_deassert_intx(dev);
     assert(dev->irq_state == 0);
 
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 9220e64..40c882f 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -31,6 +31,7 @@
 #include "exec/memory.h"
 #include "exec/ram_addr.h"
 #include "hw/hw.h"
+#include "qemu/env.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "qemu/range.h"
@@ -440,6 +441,10 @@ static int vfio_dma_unmap(VFIOContainer *container,
         return vfio_dma_unmap_bitmap(container, iova, size, iotlb);
     }
 
+    if (container->reused) {
+        return 0;
+    }
+
     while (ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, &unmap)) {
         /*
          * The type1 backend has an off-by-one bug in the kernel (71a7d3d78e3c
@@ -463,6 +468,11 @@ static int vfio_dma_unmap(VFIOContainer *container,
         return -errno;
     }
 
+    if (unmap.size != size) {
+        warn_report("VFIO_UNMAP_DMA(0x%lx, 0x%lx) only unmaps 0x%llx",
+                     iova, size, unmap.size);
+    }
+
     return 0;
 }
 
@@ -477,6 +487,10 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
         .size = size,
     };
 
+    if (container->reused) {
+        return 0;
+    }
+
     if (!readonly) {
         map.flags |= VFIO_DMA_MAP_FLAG_WRITE;
     }
@@ -1603,6 +1617,10 @@ static int vfio_init_container(VFIOContainer *container, int group_fd,
     if (iommu_type < 0) {
         return iommu_type;
     }
+    if (container->reused) {
+        container->iommu_type = iommu_type;
+        return 0;
+    }
 
     ret = ioctl(group_fd, VFIO_GROUP_SET_CONTAINER, &container->fd);
     if (ret) {
@@ -1703,6 +1721,8 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
 {
     VFIOContainer *container;
     int ret, fd;
+    bool reused;
+    char name[40];
     VFIOAddressSpace *space;
 
     space = vfio_get_address_space(as);
@@ -1739,16 +1759,31 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
         return ret;
     }
 
+    snprintf(name, sizeof(name), "vfio_container_for_group_%d", group->groupid);
+    fd = getenv_fd(name);
+    reused = (fd >= 0);
+
     QLIST_FOREACH(container, &space->containers, next) {
-        if (!ioctl(group->fd, VFIO_GROUP_SET_CONTAINER, &container->fd)) {
-            group->container = container;
-            QLIST_INSERT_HEAD(&container->group_list, group, container_next);
+        if (container->fd == fd ||
+            !ioctl(group->fd, VFIO_GROUP_SET_CONTAINER, &container->fd)) {
+            break;
+        }
+    }
+
+    if (container) {
+        group->container = container;
+        QLIST_INSERT_HEAD(&container->group_list, group, container_next);
+        if (!reused) {
             vfio_kvm_device_add_group(group);
-            return 0;
+            setenv_fd(name, container->fd);
         }
+        return 0;
+    }
+
+    if (!reused) {
+        fd = qemu_open_old("/dev/vfio/vfio", O_RDWR);
     }
 
-    fd = qemu_open_old("/dev/vfio/vfio", O_RDWR);
     if (fd < 0) {
         error_setg_errno(errp, errno, "failed to open /dev/vfio/vfio");
         ret = -errno;
@@ -1766,6 +1801,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
     container = g_malloc0(sizeof(*container));
     container->space = space;
     container->fd = fd;
+    container->reused = reused;
     container->error = NULL;
     container->dirty_pages_supported = false;
     QLIST_INIT(&container->giommu_list);
@@ -1893,6 +1929,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
     }
 
     container->initialized = true;
+    setenv_fd(name, fd);
 
     return 0;
 listener_release_exit:
@@ -1920,6 +1957,7 @@ static void vfio_disconnect_container(VFIOGroup *group)
 
     QLIST_REMOVE(group, container_next);
     group->container = NULL;
+    unsetenv_fdv("vfio_container_for_group_%d", group->groupid);
 
     /*
      * Explicitly release the listener first before unset container,
@@ -1978,7 +2016,12 @@ VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp)
     group = g_malloc0(sizeof(*group));
 
     snprintf(path, sizeof(path), "/dev/vfio/%d", groupid);
-    group->fd = qemu_open_old(path, O_RDWR);
+
+    group->fd = getenv_fd(path);
+    if (group->fd < 0) {
+        group->fd = qemu_open_old(path, O_RDWR);
+    }
+
     if (group->fd < 0) {
         error_setg_errno(errp, errno, "failed to open %s", path);
         goto free_group_exit;
@@ -2012,6 +2055,8 @@ VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp)
 
     QLIST_INSERT_HEAD(&vfio_group_list, group, next);
 
+    setenv_fd(path, group->fd);
+
     return group;
 
 close_fd_exit:
@@ -2036,6 +2081,7 @@ void vfio_put_group(VFIOGroup *group)
     vfio_disconnect_container(group);
     QLIST_REMOVE(group, next);
     trace_vfio_put_group(group->fd);
+    unsetenv_fdv("/dev/vfio/%d", group->groupid);
     close(group->fd);
     g_free(group);
 
@@ -2049,8 +2095,14 @@ int vfio_get_device(VFIOGroup *group, const char *name,
 {
     struct vfio_device_info dev_info = { .argsz = sizeof(dev_info) };
     int ret, fd;
+    bool reused;
+
+    fd = getenv_fd(name);
+    reused = (fd >= 0);
+    if (!reused) {
+        fd = ioctl(group->fd, VFIO_GROUP_GET_DEVICE_FD, name);
+    }
 
-    fd = ioctl(group->fd, VFIO_GROUP_GET_DEVICE_FD, name);
     if (fd < 0) {
         error_setg_errno(errp, errno, "error getting device from group %d",
                          group->groupid);
@@ -2095,6 +2147,8 @@ int vfio_get_device(VFIOGroup *group, const char *name,
     vbasedev->num_irqs = dev_info.num_irqs;
     vbasedev->num_regions = dev_info.num_regions;
     vbasedev->flags = dev_info.flags;
+    vbasedev->reused = reused;
+    setenv_fd(name, fd);
 
     trace_vfio_get_device(name, dev_info.flags, dev_info.num_regions,
                           dev_info.num_irqs);
@@ -2111,6 +2165,7 @@ void vfio_put_base_device(VFIODevice *vbasedev)
     QLIST_REMOVE(vbasedev, next);
     vbasedev->group = NULL;
     trace_vfio_put_base_device(vbasedev->fd);
+    unsetenv_fd(vbasedev->name);
     close(vbasedev->fd);
 }
 
diff --git a/hw/vfio/cpr.c b/hw/vfio/cpr.c
new file mode 100644
index 0000000..28f8a76
--- /dev/null
+++ b/hw/vfio/cpr.c
@@ -0,0 +1,154 @@
+/*
+ * Copyright (c) 2021 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include <sys/ioctl.h>
+#include <linux/vfio.h>
+#include "hw/vfio/vfio-common.h"
+#include "sysemu/kvm.h"
+#include "qapi/error.h"
+#include "trace.h"
+
+static int
+vfio_dma_unmap_vaddr_all(VFIOContainer *container, Error **errp)
+{
+    struct vfio_iommu_type1_dma_unmap unmap = {
+        .argsz = sizeof(unmap),
+        .flags = VFIO_DMA_UNMAP_FLAG_VADDR | VFIO_DMA_UNMAP_FLAG_ALL,
+        .iova = 0,
+        .size = 0,
+    };
+    if (ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, &unmap)) {
+        error_setg_errno(errp, errno, "vfio_dma_unmap_vaddr_all");
+        return -errno;
+    }
+    return 0;
+}
+
+static int vfio_dma_map_vaddr(VFIOContainer *container, hwaddr iova,
+                              ram_addr_t size, void *vaddr,
+                              Error **errp)
+{
+    struct vfio_iommu_type1_dma_map map = {
+        .argsz = sizeof(map),
+        .flags = VFIO_DMA_MAP_FLAG_VADDR,
+        .vaddr = (__u64)(uintptr_t)vaddr,
+        .iova = iova,
+        .size = size,
+    };
+    if (ioctl(container->fd, VFIO_IOMMU_MAP_DMA, &map)) {
+        error_setg_errno(errp, errno,
+                         "vfio_dma_map_vaddr(iova %lu, size %ld, va %p)",
+                         iova, size, vaddr);
+        return -errno;
+    }
+    return 0;
+}
+
+static int
+vfio_region_remap(MemoryRegionSection *section, void *handle, Error **errp)
+{
+    MemoryRegion *mr = section->mr;
+    VFIOContainer *container = handle;
+    const char *name = memory_region_name(mr);
+    ram_addr_t size = int128_get64(section->size);
+    hwaddr offset, iova, roundup;
+    void *vaddr;
+
+    if (vfio_listener_skipped_section(section) || memory_region_is_iommu(mr)) {
+        return 0;
+    }
+
+    offset = section->offset_within_address_space;
+    iova = TARGET_PAGE_ALIGN(offset);
+    roundup = iova - offset;
+    size = (size - roundup) & TARGET_PAGE_MASK;
+    vaddr = memory_region_get_ram_ptr(mr) +
+            section->offset_within_region + roundup;
+
+    trace_vfio_region_remap(name, container->fd, iova, iova + size - 1, vaddr);
+    return vfio_dma_map_vaddr(container, iova, size, vaddr, errp);
+}
+
+bool vfio_cpr_capable(VFIOContainer *container, Error **errp)
+{
+    if (!ioctl(container->fd, VFIO_CHECK_EXTENSION, VFIO_UPDATE_VADDR) ||
+        !ioctl(container->fd, VFIO_CHECK_EXTENSION, VFIO_UNMAP_ALL)) {
+        error_setg(errp, "VFIO container does not support VFIO_UPDATE_VADDR "
+                         "or VFIO_UNMAP_ALL");
+        return false;
+    } else {
+        return true;
+    }
+}
+
+int vfio_cprsave(Error **errp)
+{
+    VFIOAddressSpace *space, *last_space;
+    VFIOContainer *container, *last_container;
+
+    QLIST_FOREACH(space, &vfio_address_spaces, list) {
+        QLIST_FOREACH(container, &space->containers, next) {
+            if (!vfio_cpr_capable(container, errp)) {
+                return 1;
+            }
+        }
+    }
+
+    QLIST_FOREACH(space, &vfio_address_spaces, list) {
+        QLIST_FOREACH(container, &space->containers, next) {
+            if (vfio_dma_unmap_vaddr_all(container, errp)) {
+                goto unwind;
+            }
+        }
+    }
+    return 0;
+
+unwind:
+    last_space = space;
+    last_container = container;
+    QLIST_FOREACH(space, &vfio_address_spaces, list) {
+        QLIST_FOREACH(container, &space->containers, next) {
+            Error *err;
+
+            if (space == last_space && container == last_container) {
+                break;
+            }
+            if (as_flat_walk(space->as, vfio_region_remap, container, &err)) {
+                error_prepend(errp, "%s", error_get_pretty(err));
+                error_free(err);
+            }
+        }
+    }
+    return 1;
+}
+
+int vfio_cprload(Error **errp)
+{
+    VFIOAddressSpace *space;
+    VFIOContainer *container;
+    VFIOGroup *group;
+    VFIODevice *vbasedev;
+
+    QLIST_FOREACH(space, &vfio_address_spaces, list) {
+        QLIST_FOREACH(container, &space->containers, next) {
+            if (!vfio_cpr_capable(container, errp)) {
+                return 1;
+            }
+            container->reused = false;
+            if (as_flat_walk(space->as, vfio_region_remap, container, errp)) {
+                return 1;
+            }
+        }
+    }
+    QLIST_FOREACH(group, &vfio_group_list, next) {
+        QLIST_FOREACH(vbasedev, &group->device_list, next) {
+            vbasedev->reused = false;
+        }
+    }
+    return 0;
+}
diff --git a/hw/vfio/meson.build b/hw/vfio/meson.build
index da9af29..e247b2b 100644
--- a/hw/vfio/meson.build
+++ b/hw/vfio/meson.build
@@ -5,6 +5,7 @@ vfio_ss.add(files(
   'migration.c',
 ))
 vfio_ss.add(when: 'CONFIG_VFIO_PCI', if_true: files(
+  'cpr.c',
   'display.c',
   'pci-quirks.c',
   'pci.c',
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index bc656e9..f3a9361 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -29,6 +29,8 @@
 #include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
 #include "migration/vmstate.h"
+#include "migration/cpr.h"
+#include "qemu/env.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
@@ -1657,6 +1659,7 @@ static void vfio_bars_prepare(VFIOPCIDevice *vdev)
 static void vfio_bar_register(VFIOPCIDevice *vdev, int nr)
 {
     VFIOBAR *bar = &vdev->bars[nr];
+    PCIDevice *pdev = &vdev->pdev;
     char *name;
 
     if (!bar->size) {
@@ -1677,7 +1680,7 @@ static void vfio_bar_register(VFIOPCIDevice *vdev, int nr)
         }
     }
 
-    pci_register_bar(&vdev->pdev, nr, bar->type, bar->mr);
+    pci_register_bar(pdev, nr, bar->type, bar->mr);
 }
 
 static void vfio_bars_register(VFIOPCIDevice *vdev)
@@ -2889,6 +2892,7 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
         vfio_put_group(group);
         goto error;
     }
+    pdev->reused = vdev->vbasedev.reused;
 
     vfio_populate_device(vdev, &err);
     if (err) {
@@ -3158,6 +3162,10 @@ static void vfio_pci_reset(DeviceState *dev)
 {
     VFIOPCIDevice *vdev = VFIO_PCI(dev);
 
+    if (vdev->pdev.reused) {
+        return;
+    }
+
     trace_vfio_pci_reset(vdev->vbasedev.name);
 
     vfio_pci_pre_reset(vdev);
@@ -3265,6 +3273,61 @@ static Property vfio_pci_dev_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+static void vfio_merge_config(VFIOPCIDevice *vdev)
+{
+    PCIDevice *pdev = &vdev->pdev;
+    int size = MIN(pci_config_size(pdev), vdev->config_size);
+    uint8_t *phys_config = g_malloc(size);
+    uint32_t mask;
+    int ret, i;
+
+    ret = pread(vdev->vbasedev.fd, phys_config, size, vdev->config_offset);
+    if (ret < size) {
+        ret = ret < 0 ? errno : EFAULT;
+        error_report("failed to read device config space: %s", strerror(ret));
+        return;
+    }
+
+    for (i = 0; i < size; i++) {
+        mask = vdev->emulated_config_bits[i];
+        pdev->config[i] = (pdev->config[i] & mask) | (phys_config[i] & ~mask);
+    }
+
+    g_free(phys_config);
+}
+
+static int vfio_pci_post_load(void *opaque, int version_id)
+{
+    VFIOPCIDevice *vdev = opaque;
+    PCIDevice *pdev = &vdev->pdev;
+    bool enabled;
+
+    vfio_merge_config(vdev);
+
+    pdev->reused = false;
+    enabled = pci_get_word(pdev->config + PCI_COMMAND) & PCI_COMMAND_MASTER;
+    memory_region_set_enabled(&pdev->bus_master_enable_region, enabled);
+
+    return 0;
+}
+
+static bool vfio_pci_needed(void *opaque)
+{
+    return cpr_mode() == CPR_MODE_RESTART;
+}
+
+static const VMStateDescription vfio_pci_vmstate = {
+    .name = "vfio-pci",
+    .unmigratable = 1,
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .post_load = vfio_pci_post_load,
+    .needed = vfio_pci_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static void vfio_pci_dev_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -3272,6 +3335,7 @@ static void vfio_pci_dev_class_init(ObjectClass *klass, void *data)
 
     dc->reset = vfio_pci_reset;
     device_class_set_props(dc, vfio_pci_dev_properties);
+    dc->vmsd = &vfio_pci_vmstate;
     dc->desc = "VFIO-based PCI device assignment";
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
     pdc->realize = vfio_realize;
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index 079f53a..0f8b166 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -118,6 +118,7 @@ vfio_region_sparse_mmap_header(const char *name, int index, int nr_areas) "Devic
 vfio_region_sparse_mmap_entry(int i, unsigned long start, unsigned long end) "sparse entry %d [0x%lx - 0x%lx]"
 vfio_get_dev_region(const char *name, int index, uint32_t type, uint32_t subtype) "%s index %d, %08x/%0x8"
 vfio_dma_unmap_overflow_workaround(void) ""
+vfio_region_remap(const char *name, int fd, uint64_t iova_start, uint64_t iova_end, void *vaddr) "%s fd %d 0x%"PRIx64" - 0x%"PRIx64" [%p]"
 
 # platform.c
 vfio_platform_base_device_init(char *name, int groupid) "%s belongs to group #%d"
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index bef3e49..add7f46 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -360,6 +360,7 @@ struct PCIDevice {
     /* ID of standby device in net_failover pair */
     char *failover_pair_id;
     uint32_t acpi_index;
+    bool reused;
 };
 
 void pci_register_bar(PCIDevice *pci_dev, int region_num,
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 00acb85..b46d850 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -85,6 +85,7 @@ typedef struct VFIOContainer {
     Error *error;
     bool initialized;
     bool dirty_pages_supported;
+    bool reused;
     uint64_t dirty_pgsizes;
     uint64_t max_dirty_bitmap_size;
     unsigned long pgsizes;
@@ -124,6 +125,7 @@ typedef struct VFIODevice {
     bool no_mmap;
     bool ram_block_discard_allowed;
     bool enable_migration;
+    bool reused;
     VFIODeviceOps *ops;
     unsigned int num_irqs;
     unsigned int num_regions;
@@ -200,6 +202,9 @@ VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp);
 void vfio_put_group(VFIOGroup *group);
 int vfio_get_device(VFIOGroup *group, const char *name,
                     VFIODevice *vbasedev, Error **errp);
+int vfio_cprsave(Error **errp);
+int vfio_cprload(Error **errp);
+bool vfio_cpr_capable(VFIOContainer *container, Error **errp);
 
 extern const MemoryRegionOps vfio_region_ops;
 typedef QLIST_HEAD(VFIOGroupList, VFIOGroup) VFIOGroupList;
diff --git a/include/migration/cpr.h b/include/migration/cpr.h
index bffee19..1ea5046 100644
--- a/include/migration/cpr.h
+++ b/include/migration/cpr.h
@@ -10,6 +10,9 @@
 
 #include "qapi/qapi-types-cpr.h"
 
+#define CPR_MODE_NONE ((CprMode)(-1))
+
+CprMode cpr_mode(void);
 void cprsave(const char *file, CprMode mode, Error **errp);
 void cprexec(strList *args, Error **errp);
 void cprload(const char *file, Error **errp);
diff --git a/linux-headers/linux/vfio.h b/linux-headers/linux/vfio.h
index 609099e..bc3a66e 100644
--- a/linux-headers/linux/vfio.h
+++ b/linux-headers/linux/vfio.h
@@ -46,6 +46,12 @@
  */
 #define VFIO_NOIOMMU_IOMMU		8
 
+/* Supports VFIO_DMA_UNMAP_FLAG_ALL */
+#define VFIO_UNMAP_ALL                        9
+
+/* Supports VFIO DMA map and unmap with the VADDR flag */
+#define VFIO_UPDATE_VADDR              10
+
 /*
  * The IOCTL interface is designed for extensibility by embedding the
  * structure length (argsz) and flags into structures passed between
@@ -1074,12 +1080,22 @@ struct vfio_iommu_type1_info_dma_avail {
  *
  * Map process virtual addresses to IO virtual addresses using the
  * provided struct vfio_dma_map. Caller sets argsz. READ &/ WRITE required.
+ *
+ * If flags & VFIO_DMA_MAP_FLAG_VADDR, record the new base vaddr for iova, and
+ * unblock translation of host virtual addresses in the iova range.  The vaddr
+ * must have previously been invalidated with VFIO_DMA_UNMAP_FLAG_VADDR.  To
+ * maintain memory consistency within the user application, the updated vaddr
+ * must address the same memory object as originally mapped.  Failure to do so
+ * will result in user memory corruption and/or device misbehavior.  iova and
+ * size must match those in the original MAP_DMA call.  Protection is not
+ * changed, and the READ & WRITE flags must be 0.
  */
 struct vfio_iommu_type1_dma_map {
 	__u32	argsz;
 	__u32	flags;
 #define VFIO_DMA_MAP_FLAG_READ (1 << 0)		/* readable from device */
 #define VFIO_DMA_MAP_FLAG_WRITE (1 << 1)	/* writable from device */
+#define VFIO_DMA_MAP_FLAG_VADDR (1 << 2)
 	__u64	vaddr;				/* Process virtual address */
 	__u64	iova;				/* IO virtual address */
 	__u64	size;				/* Size of mapping (bytes) */
@@ -1102,6 +1118,7 @@ struct vfio_bitmap {
  * field.  No guarantee is made to the user that arbitrary unmaps of iova
  * or size different from those used in the original mapping call will
  * succeed.
+ *
  * VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP should be set to get the dirty bitmap
  * before unmapping IO virtual addresses. When this flag is set, the user must
  * provide a struct vfio_bitmap in data[]. User must provide zero-allocated
@@ -1111,11 +1128,21 @@ struct vfio_bitmap {
  * indicates that the page at that offset from iova is dirty. A Bitmap of the
  * pages in the range of unmapped size is returned in the user-provided
  * vfio_bitmap.data.
+ *
+ * If flags & VFIO_DMA_UNMAP_FLAG_ALL, unmap all addresses.  iova and size
+ * must be 0.  This cannot be combined with the get-dirty-bitmap flag.
+ *
+ * If flags & VFIO_DMA_UNMAP_FLAG_VADDR, do not unmap, but invalidate host
+ * virtual addresses in the iova range.  Tasks that attempt to translate an
+ * iova's vaddr will block.  DMA to already-mapped pages continues.  This
+ * cannot be combined with the get-dirty-bitmap flag.
  */
 struct vfio_iommu_type1_dma_unmap {
 	__u32	argsz;
 	__u32	flags;
 #define VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP (1 << 0)
+#define VFIO_DMA_UNMAP_FLAG_ALL              (1 << 1)
+#define VFIO_DMA_UNMAP_FLAG_VADDR            (1 << 2)
 	__u64	iova;				/* IO virtual address */
 	__u64	size;				/* Size of mapping (bytes) */
 	__u8    data[];
diff --git a/migration/cpr.c b/migration/cpr.c
index fb57dec..578466c 100644
--- a/migration/cpr.c
+++ b/migration/cpr.c
@@ -31,6 +31,13 @@
 #include "hw/virtio/vhost.h"
 #include "qemu/env.h"
 
+static CprMode cpr_active_mode = CPR_MODE_NONE;
+
+CprMode cpr_mode(void)
+{
+    return cpr_active_mode;
+}
+
 QEMUFile *qf_file_open(const char *path, int flags, int mode,
                               const char *name, Error **errp)
 {
@@ -92,6 +99,7 @@ void cprsave(const char *file, CprMode mode, Error **errp)
     }
     vm_stop(RUN_STATE_SAVE_VM);
 
+    cpr_active_mode = mode;
     ret = qemu_save_device_state(f);
     qemu_fclose(f);
     if (ret < 0) {
@@ -105,6 +113,7 @@ err:
     if (saved_vm_running) {
         vm_start();
     }
+    cpr_active_mode = CPR_MODE_NONE;
 done:
     return;
 }
@@ -125,6 +134,13 @@ void cprexec(strList *args, Error **errp)
         error_setg(errp, "runstate is not save-vm");
         return;
     }
+    if (cpr_active_mode != CPR_MODE_RESTART) {
+        error_setg(errp, "cprexec requires cprsave with restart mode");
+        return;
+    }
+    if (vfio_cprsave(errp)) {
+        return;
+    }
     walkenv(FD_PREFIX, preserve_fd, 0);
     qemu_system_exec_request(args);
 }
@@ -158,6 +174,10 @@ void cprload(const char *file, Error **errp)
         return;
     }
 
+    if (vfio_cprload(errp)) {
+        return;
+    }
+
     state = global_state_get_runstate();
     if (state == RUN_STATE_RUNNING) {
         vm_start();
-- 
1.8.3.1


