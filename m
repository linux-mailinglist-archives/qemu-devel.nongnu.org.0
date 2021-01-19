Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C969F2FC177
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 21:46:49 +0100 (CET)
Received: from localhost ([::1]:54870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1xto-00037W-Mp
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 15:46:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l1xcj-0000nM-4e
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 15:29:09 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:57100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l1xcf-0000DN-BL
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 15:29:08 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10JKNUw8002764;
 Tue, 19 Jan 2021 20:28:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=oApzKfjFWBVZxSOptENDI7tXlTD9jnhg+UQVZ1f7qlA=;
 b=kozAwTrvIVLQZlgmKeldvg4+mtbEcozJS7X6B+OeHo4TRgTFS7m4DTXg8HsgsN9h+i6B
 uu3/BroG0lO4ZSrQ+vIPsSEJQIhTNNxc+wJ5RrrI717ZQCmPkQr7YgYETgHOdQTbVTAb
 0EnXR/EehxIqQFfKpD0Wzcsn9UZKu2DEt+1wOV68+gDeR1EpZA9rUAqT+2v3xyGqQ8wK
 o/YU4gvjG3AOgPxirtBc8fCgeW4MosEIiIUhXVnckNT/Xax+xrQdSjiu4lWdC1EJIV43
 eh43BMDYJ7Eio6NYLwIJyxtcjpf867O9+EmuWAFVJxc4bQCV5ozj1p9lOmE5AISammaA ZA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 363xyhtar8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 20:28:52 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10JKPj59175885;
 Tue, 19 Jan 2021 20:28:51 GMT
Received: from nam02-cy1-obe.outbound.protection.outlook.com
 (mail-cys01nam02lp2054.outbound.protection.outlook.com [104.47.37.54])
 by aserp3020.oracle.com with ESMTP id 3661er93yk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 20:28:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nTLm3nBZA3CmmVjk6O2S3L5SLspLf33hGVlUpNYxDng5bIlQZ0eFWJ54PvTKSS2lbtS2csxtXppyiskyfpI67wxnikfHvyDruXQ42c418hJ1bmI1BxyDcEwCnywehUoT7/M/Vh8t22bIvIZc5A8Yir2SVbRSCHmRQIhrPUMi8NomrzGIqJ8EU8CUHeaDbNk3Ewso5XEL5mujtDwy5G4zwJwlFoOQltPNWQWbSHy3oMOGKmWbCrEhc3siuUGbHamkxJaoQ/0krbLXubsGQ7mpXaNbKzgbz2wZCH5V/gr5mFAfNqbNclYU0IeeWnUHyomJGq4tbchy/fxee2ePAju3BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oApzKfjFWBVZxSOptENDI7tXlTD9jnhg+UQVZ1f7qlA=;
 b=CKRWLz6XWTlYkTDup8Bo8Faw+Z8ARCeCSfyMfJPbWTFuCFap7KNchyX8yj19H+Pdj/tg4V2q7o3UKq8/vP/4tFtMJSdG3XTvI8CfRbGU6f243DDPvIPlCE2ObmjDx4XGghCrZi1LEQ3xByPa2Vv1nKP9DsDxv8Hu1+AebdyqxRVH9oDGdoz1cmOr+1lW5jyFq+PX5ugiUiwSw18fDCUxa7UB09e1+TtzP4Q4KxbcwZXHw4Uvr1/lP5Jj69Bz7MjDDbihemjkzrxqAxbQM+/kLz5Ea9PL0psKX8jJaT7SkQ3Fqk8UB/Kk+Yts87828lsOH05XfLarEF144BMwTM4fHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oApzKfjFWBVZxSOptENDI7tXlTD9jnhg+UQVZ1f7qlA=;
 b=qauGtdqe25f3BROsN/iSX4MRPxPba9qNKhJ/sNaBaV2dBAPO8pN7hjcoGK/awnUOytegFjFNO5K0YBDmDlvE0q5BzEvIHIJINspnqPYRD6sb9y4FcJAtRnf9X4hFbYeQJzRN0ABMov/PvaXQD1joxDr18ddl7YZXyf8oGx6kisY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
 by BYAPR10MB3349.namprd10.prod.outlook.com (2603:10b6:a03:155::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Tue, 19 Jan
 2021 20:28:49 +0000
Received: from BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::5cf0:3e26:c005:341b]) by BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::5cf0:3e26:c005:341b%7]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 20:28:49 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v20 02/20] multi-process: add configure and usage information
Date: Tue, 19 Jan 2021 15:28:19 -0500
Message-Id: <3d3cb1e2dffce3949dcd965fff4a3870913438f5.1611081587.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1611081587.git.jag.raman@oracle.com>
References: <cover.1611081587.git.jag.raman@oracle.com>
Content-Type: text/plain
X-Originating-IP: [209.17.40.38]
X-ClientProxiedBy: DM6PR01CA0007.prod.exchangelabs.com (2603:10b6:5:296::12)
 To BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jaraman-bur-1.us.oracle.com (209.17.40.38) by
 DM6PR01CA0007.prod.exchangelabs.com (2603:10b6:5:296::12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Tue, 19 Jan 2021 20:28:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fcfb7d75-a9c9-4e4f-a7a7-08d8bcb8d425
X-MS-TrafficTypeDiagnostic: BYAPR10MB3349:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB3349A33F08343323C6CD6F4790A30@BYAPR10MB3349.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LuGgGP+1mUBoZygoUIxJD23Fdn0FPYQUV39BvZTc87pPrZkOLH1BOAVJWibgWyfv+7jDv40fIhzAJH06bplIcnkCh8DPBno9TEYWoh970o3YQs9Wa5vAaX9aN7KhGU9MQzgk3gGHGbhCg5xDgQg92YyW5k9jnl/kwJKtUlRvUQ0z1OLtEumKKxZic60g+15Y0hm7XjOubap1Rdq6gXP7cyz5DEpmC9Lc/GHVUvmK70CWP3KLIudS/FlLvf3LJ1csZ7sjdD2Mm0Tpw+2saryq8T472tQ58wgpLowQfBGg8KFaQWyAHw76JXxARNgtuy0IqSp14oV4vZGsaQEiRXWCAvPFx28D1oYdjlfMrM1cjpJ8/acukkcGm82lT6J2kEGeDyNe3lzMJucTo6N4VEsdhQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2744.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(366004)(136003)(346002)(376002)(7696005)(52116002)(2906002)(6486002)(5660300002)(7416002)(36756003)(66476007)(66556008)(478600001)(6916009)(956004)(2616005)(4326008)(66946007)(26005)(186003)(16526019)(8676002)(86362001)(8936002)(107886003)(316002)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?aCcVqxJklXIANp4Uz4RSZoE2d3m4fqUvlcPCu+O3VHSZICSJ2g6aViT58tWO?=
 =?us-ascii?Q?IHD2MBjQmsNpEJ18rhmezDzzOpl9fbpSbkwQvJU00NE4ALKh1+fZzS4Gn/kK?=
 =?us-ascii?Q?8WuyF9UfaXil1JSnqztY9Y/OwGbhFfUCyrgIA0klojy9gdSJ6lJ3syeC1GQ8?=
 =?us-ascii?Q?kA6tXjl72lyt/xjV/167RDoQR1r28usoyIbV3J5DH/XU3/AolMpn+CT7VdV1?=
 =?us-ascii?Q?qoBzYjtP6KKWRRNmRK9eHGyXVVxZByjm7bBA6YUuL3vOZqM1JSFi0HBk2KCh?=
 =?us-ascii?Q?J+SHdLE018edj+fY0pwoa2NBICUAqOJQSGWuQjB/pN8QSNVk56jp9KiBPvRK?=
 =?us-ascii?Q?lrL2l8A1q5lvwI1acO7B6JkkJWserGnE7tePSbgnHGfMOK2VYY6xb9PI83A4?=
 =?us-ascii?Q?pD7+npsW8AoBN3LcMZnRnzDB+u4GVfvWiQ6UhTfgwFMrCqwaKmaIT36AuF90?=
 =?us-ascii?Q?i24H2vma85INmlXrI81hq2eH3JWSZMyAK+tk6UvMLJU009ujApCuH3evvRAV?=
 =?us-ascii?Q?rDFHTafNIlwj1PlMd0f0ewMO3WJQZwrqvIO9O8xi6BA4BAw1uImbhurj9VkH?=
 =?us-ascii?Q?zwFQrDi66w8dAaW8fg/juZ6JyeZQmeHT7/uCMQBoC017YHeLynYka1b3dKiM?=
 =?us-ascii?Q?0GaLUHGyXhbIZ/5ebSKXASCdy2JRwICtzZ+nMKblhx8yMrRgUqqCx+AMR4nV?=
 =?us-ascii?Q?OgrzcAEG4x2UKt73Q7bZLKyQMPXYg1VEGuj329ZFSbwfXdaygb7Uf0W79mlU?=
 =?us-ascii?Q?LuPT93XdqSOIJLGyfljHowMCEJELYC8m0BJweldXYmhxu/qcYj2a3achSTaT?=
 =?us-ascii?Q?ufmFX/veaW32S2oEoFTipwe10ZotLIELEYT+BNjkA7y4Raw8+Mjx54b5YE4k?=
 =?us-ascii?Q?XknYs8fMzV1mlEOpJakI4KPmhKqn+JPlK8wJWZ5Ss8GoPlUxsBDAf+1CvDWP?=
 =?us-ascii?Q?cEWsECqrJf8C4+ZiOBnTsTckdSv+uqJP1zAZG1wdBT0=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcfb7d75-a9c9-4e4f-a7a7-08d8bcb8d425
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2744.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 20:28:49.4295 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mr9+1Gc/3gppqI62B++hzyMTxYzFruwmfigRDhXzQR4WVFwP8IU0oYmTQainO/DuZCLJYFhRCsAW1us7NFcTzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3349
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101190113
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 malwarescore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501 spamscore=0
 mlxscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101190113
Received-SPF: pass client-ip=156.151.31.86; envelope-from=jag.raman@oracle.com;
 helo=userp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, fam@euphon.net, swapnil.ingle@nutanix.com,
 john.g.johnson@oracle.com, kraxel@redhat.com, jag.raman@oracle.com,
 quintela@redhat.com, mst@redhat.com, armbru@redhat.com,
 kanth.ghatraju@oracle.com, felipe@nutanix.com, thuth@redhat.com,
 ehabkost@redhat.com, konrad.wilk@oracle.com, dgilbert@redhat.com,
 alex.williamson@redhat.com, stefanha@redhat.com, thanos.makatos@nutanix.com,
 kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
 ross.lagerwall@citrix.com, marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Elena Ufimtseva <elena.ufimtseva@oracle.com>

Adds documentation explaining the command-line arguments needed
to use multi-process.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 docs/multi-process.rst | 64 ++++++++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS            |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 docs/multi-process.rst

diff --git a/docs/multi-process.rst b/docs/multi-process.rst
new file mode 100644
index 0000000..46bb0ca
--- /dev/null
+++ b/docs/multi-process.rst
@@ -0,0 +1,64 @@
+Multi-process QEMU
+==================
+
+This document describes how to configure and use multi-process qemu.
+For the design document refer to docs/devel/qemu-multiprocess.
+
+1) Configuration
+----------------
+
+multi-process is enabled by default for targets that enable KVM
+
+
+2) Usage
+--------
+
+Multi-process QEMU requires an orchestrator to launch.
+
+Following is a description of command-line used to launch mpqemu.
+
+* Orchestrator:
+
+  - The Orchestrator creates a unix socketpair
+
+  - It launches the remote process and passes one of the
+    sockets to it via command-line.
+
+  - It then launches QEMU and specifies the other socket as an option
+    to the Proxy device object
+
+* Remote Process:
+
+  - QEMU can enter remote process mode by using the "remote" machine
+    option.
+
+  - The orchestrator creates a "remote-object" with details about
+    the device and the file descriptor for the device
+
+  - The remaining options are no different from how one launches QEMU with
+    devices.
+
+  - Example command-line for the remote process is as follows:
+
+      /usr/bin/qemu-system-x86_64                                        \
+      -machine x-remote                                                  \
+      -device lsi53c895a,id=lsi0                                         \
+      -drive id=drive_image2,file=/build/ol7-nvme-test-1.qcow2           \
+      -device scsi-hd,id=drive2,drive=drive_image2,bus=lsi0.0,scsi-id=0  \
+      -object x-remote-object,id=robj1,devid=lsi1,fd=4,
+
+* QEMU:
+
+  - Since parts of the RAM are shared between QEMU & remote process, a
+    memory-backend-memfd is required to facilitate this, as follows:
+
+    -object memory-backend-memfd,id=mem,size=2G
+
+  - A "x-pci-proxy-dev" device is created for each of the PCI devices emulated
+    in the remote process. A "socket" sub-option specifies the other end of
+    unix channel created by orchestrator. The "id" sub-option must be specified
+    and should be the same as the "id" specified for the remote PCI device
+
+  - Example commandline for QEMU is as follows:
+
+      -device x-pci-proxy-dev,id=lsi0,socket=3
diff --git a/MAINTAINERS b/MAINTAINERS
index 56f1904..654358b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3188,6 +3188,7 @@ M: Jagannathan Raman <jag.raman@oracle.com>
 M: John G Johnson <john.g.johnson@oracle.com>
 S: Maintained
 F: docs/devel/multi-process.rst
+F: docs/multi-process.rst
 
 Build and test automation
 -------------------------
-- 
1.8.3.1


