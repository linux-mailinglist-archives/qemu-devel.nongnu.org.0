Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C0C5EE430
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 20:18:31 +0200 (CEST)
Received: from localhost ([::1]:59046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odbdd-0005c2-GB
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 14:18:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venu.busireddy@oracle.com>)
 id 1odbSH-0004wi-3H
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 14:06:48 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:34736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venu.busireddy@oracle.com>)
 id 1odbSC-0007Wp-4y
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 14:06:44 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28SGxBIq010153;
 Wed, 28 Sep 2022 18:06:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2022-7-12;
 bh=gVXM+soxPq3BYiSKMWJXX27hdyWbyVJjOUkYQ/otm/Y=;
 b=nxyCYp6YMRCPZynsEQMw+qM/J90R9y1scJo5ByEJPDGcSvFlyct4DaUOJgqfhiaQZV2z
 c6vCgpsPMkTOIjShRm5bbOEPkoN4rqmzn2Sny1cgruw1f53LymBU3Dbsbd0UWzOWYzux
 U9H3+5hkUsZvXHX8dSyiMO63TfXqUoTsZGlWoWT6QZQaYA1dvCRWMG5xpLmNGwvkBELm
 FxUfwiqERx8YHB5CCGQwfxsayUeRQDUMduFj+9J+y8b5lEqFnHHJ2FOemqP7WWBSZc/E
 BtkUFMYQiaBcx9QfBxFhNvtcl7ihC7unlbP0ILDz5R/a+UG3W0jLtZ4o8LX1GnuBcAHJ XQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jst0ktf35-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Sep 2022 18:06:12 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 28SGHvMG040314; Wed, 28 Sep 2022 18:06:10 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3jtpub1nby-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Sep 2022 18:06:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=On14OLbvMUapWDzlSQdUmd3gjhrD1MEhXuju6CgLBG5CGZMsNZQjlS4jwHdTRa43Z2UYZCrMpnWLWW7XmnUv4NR0k+wrQe/RHJes0Rz6BhefbceRbZydG79XgCYL4a157Na2Tn5a1RvwzC34wj+NRp81JdmD0TGBhSaIoRJisdSyZv6qxiFIxq1382n+vTwkzJv2iNDM59tuFbLD42x66DmjBe3pGmkyuWtyQBIQH+EcExV8VJPaskB0aWmYaiRPGu5zoGPMXvyqLfsM6K+6GTQA610gbt1MbqaFIKai+kCQFaE/RYCdn2WHESj9dn6Y3rm5zIGSFzlIGfX6rfnMbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gVXM+soxPq3BYiSKMWJXX27hdyWbyVJjOUkYQ/otm/Y=;
 b=OY6C11RsFCVZtYnjAvop4aW3NsLGfC7MueRinS1SyKdte9Z0PcXA1dvUMRvY3DH4B7DjFImQNLfmyG73pAr5KiO/SR2DTYtmAArKR2oXvRicUvt+ZhxCc/14aiIDOUgkY8oAYhUBLfUcPolVodzREdXsDgJS51k5UfCgGDEWf850ohtOCVX4FZ1H0NnwLN3kwL0llRLsTbcp5bFkUGJcKgYs/9To8A4RUDlTWDMYKCIO3mmrixrW2IJiFhIeDtajJGsqMFubx9Q89NeXIMr9jymqv26uX3wL6e6r+A1O3WJL5Oax57YlbOtNJWT61biHRWTuQJ89cs3hZ+BkibiNnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gVXM+soxPq3BYiSKMWJXX27hdyWbyVJjOUkYQ/otm/Y=;
 b=YcfGJv8Wi8Kd0eOJF3FL7Oq8/aiovSpJwVQe0qBLsSCZEzTHfyseI83n4Ud3Ft3EwRZUeqruFmkKiOqgbcOLTUGnfLLrd/6SUXrBcUkt/ZEw2jdA9lgEmkZiQi3EV1Gdi6xkCz61b93FpX3CxqLWwa3hYGuprrE5+h82UbboAEs=
Received: from SN6PR10MB2576.namprd10.prod.outlook.com (2603:10b6:805:44::15)
 by DS7PR10MB5087.namprd10.prod.outlook.com (2603:10b6:5:3b0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Wed, 28 Sep
 2022 18:06:08 +0000
Received: from SN6PR10MB2576.namprd10.prod.outlook.com
 ([fe80::8701:4505:8274:afd4]) by SN6PR10MB2576.namprd10.prod.outlook.com
 ([fe80::8701:4505:8274:afd4%6]) with mapi id 15.20.5676.017; Wed, 28 Sep 2022
 18:06:08 +0000
From: Venu Busireddy <venu.busireddy@oracle.com>
To: venu.busireddy@oracle.com, qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3] virtio-scsi: Send "REPORTED LUNS CHANGED" sense data upon
 disk hotplug events.
Date: Wed, 28 Sep 2022 13:06:03 -0500
Message-Id: <20220928180603.101533-1-venu.busireddy@oracle.com>
X-Mailer: git-send-email 2.37.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DS7PR07CA0007.namprd07.prod.outlook.com
 (2603:10b6:5:3af::25) To SN6PR10MB2576.namprd10.prod.outlook.com
 (2603:10b6:805:44::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR10MB2576:EE_|DS7PR10MB5087:EE_
X-MS-Office365-Filtering-Correlation-Id: 97720995-1bcf-4f12-3548-08daa17c1e17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GFhpDgaxyy9jS2wWHVUPANeOz4iJno3GGR1TZ7W2uDCG5/qlicN6rbABkSyxvksDfh8U8CGS/Qbwpc8O20v5cvY2cxsTIrtMf1LkT8DANJDlSMGeVFG5emfT5jjwcFOEi/VXEycxPrFCh8oOc5jmieyShlrlzs94pzkto6gIRV1w+L2DBsZTIKZ2R8ZoILkagJbl+kxvof5LkqygI2vm6nh19okfQdn2+o8oTqqHfmh7A1oZHon8ws+NNGMK+0ZNigTcMXAGSvqyrpeTC7e2Z5VaQ+2wAUun79TqVy0eWDke1aCCWSfaTAJZHGyPDIun9dD10dw1JVw2SzE8dKA3lGCYsr++6RgiNByIFDYdYKjV5YiYJcFL9u/PkHF6ixIqb/KA32sryZNPYGUAKrduPuco9sfOlf+EhH4AloEez5NSYFj0sM8yNy/dbeYbAVtsungZim7Ulk7JNikuAnrIoGyDfdk37FGVbne5ez/88rWjDoxb2gX8aO6YOCjuKSnyNTTUoezPjRZDvn2UciqsIV1+uVZ4yfPPDiJp7N8Bgd8y6wctQ/xg+iE5CWoJE9vY1z4Ggipi6zA4hfpHl5cvKVu70FSuI/GAAbSKMOJRJIUwPIuul6oR+jGZVJuIrTQo93US6SLbI9xE64NbL6CLeB14GNxIk6ukSdbU4pGa8W9o1d3wHTiyz4YcCt/a1vx8MCuniVHAH7MCviHZzjRMxA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR10MB2576.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(376002)(396003)(366004)(136003)(346002)(451199015)(6486002)(478600001)(54906003)(316002)(66556008)(86362001)(8676002)(4326008)(66476007)(66946007)(26005)(6506007)(6512007)(83380400001)(41300700001)(6666004)(44832011)(2616005)(186003)(5660300002)(2906002)(1076003)(8936002)(36756003)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7GyZii3qwKI0dBXNg9R/mOec3761H4EZ1moH4a8KjS8PJwrEUISsGsQyysDM?=
 =?us-ascii?Q?QkYOB+r9bTJW9UVc7Gge8gMyTotZ9sSlKHlXhlOOlriGJ15DBH5kPAUBLgVI?=
 =?us-ascii?Q?ed2tq6JvqGaPMoUDo5XKaDhzhYFtn2fPbtMMHF2XgfUQTs+nexW0DrADqo6m?=
 =?us-ascii?Q?gHMWe5dVWhu9DSFGQBkUo2M7jDboGkni/QeG0y3OMqFKYFe4ZeDnl4/pUZrk?=
 =?us-ascii?Q?p+pL2yx7+lwW+NnF5OczZZyoJky/yQoo6WzwmDQDS5eXgXpGQu3Xu7cHEH9k?=
 =?us-ascii?Q?hSLpUP8vfUzaExNfM7dhTqd3WbsZmGlS3pBB/vc/3rLdkZVTSJH4NYxANMNQ?=
 =?us-ascii?Q?31534wz+b/lxR+hzu9znKoqZmlobABYf/gRc+kuR8u/dY5bK2SUir6cu/dUX?=
 =?us-ascii?Q?BQbn00xWyiX/gIC2Xsfx9ALrtxz+LLl9M9xvxYWNRbzCppU1CmJnfA8IxqAd?=
 =?us-ascii?Q?BoB3vSyl3yh2bHNypaI8YyWnC62uYfFERg0uPH+I8CY+2ObGW0KPGZkSqBOK?=
 =?us-ascii?Q?Wcwy2LtbON/nkhS3VlYAmQY2PhFCh30OxSuEAqHN0ok1UxaY6gylmk31lJ67?=
 =?us-ascii?Q?BflTQNVlCUuIq8Fzcrie+CqwbbfL4iwNgzIcyyGPbLtiFiHWujxira+V5X7D?=
 =?us-ascii?Q?VC/cF6B/TXMllhZ5JSva2bYOFpAZtzOtALA8dF5wEy4jU5DFlMUioFeKcPKq?=
 =?us-ascii?Q?X1MlIX2FRxP21tg7Gr0Yva+hHPJ2IUnRX7n6uxdmsSSBZiywPD0jQ6tg+g7U?=
 =?us-ascii?Q?ak+DjvUFA8kuxsKu9x1zKXs24FXdeVA9CdC2kVCnqIhsZoFJkrFogDhj+45s?=
 =?us-ascii?Q?OZG9/danIWgGXPNQ4SEf7R7nTlb3eyv2gRWYKlB7NNIKCNp2AkQVspy1F2fT?=
 =?us-ascii?Q?swyMKh5hFLwz918IhI5ymo0Ls1auBEphX1b5f5wOhRFIBsaABbL/xEvG4YgD?=
 =?us-ascii?Q?sPxs0pM7QJ0vh3Qdc7iKe2Xh72CY6jI6IlcGF6T6IerKYWczO+brh4MsmTli?=
 =?us-ascii?Q?vSRblnNwIZuHPY/f/Wwc5Q+AjDhuyWbNTgcxOQfjaReHhvCl1QxzHfJizmw7?=
 =?us-ascii?Q?d56YvjER+NjHoYQU+dcprBg0A2tMP0yNbVGeCOPRk63pTqTGH14W03UnWCIN?=
 =?us-ascii?Q?doUANdDg/G7hu6V+VpZCOloH5Ty2VqyANMD2/ic0pIuBG0DVzwnRKagPl6/8?=
 =?us-ascii?Q?1wXDrPZyJdWTxTO+p/eKkZv8evBpVAjip9SuwtG35pyorEkA+2703Jxd/Hlk?=
 =?us-ascii?Q?zRHDjgA/PHJEO9A9+mGPvxwGJUuOFDV5PT6UMR2WfsqLWHOUKSE8dIfadcqz?=
 =?us-ascii?Q?0dwDc/QwH714tfXtgViDuDcK3eg2izvnjhFy+prJ4Q7P+pQTSGfZj263opI1?=
 =?us-ascii?Q?W1Q+E/SxBGKuUOsAwCHh5a/fFGK2KZ0C6u6RlQ3X9/aoiIoSnHFuRE0YW5uO?=
 =?us-ascii?Q?H/zhVFLnkIicjdUCo7jIH9jNFwhYyi+b9cp3C4btGHmMXyFKtrMsrgMl6rF+?=
 =?us-ascii?Q?Tb0Rp9DRO+V39sAftyLvYUtqrYwgIqudJGuQpdnl6FyntiYKZUA5Rfagbthw?=
 =?us-ascii?Q?VYdfwILfo22VEaF7hCHmj7i0YI2gnl/70vM/1fBWULhgyonNtoO10myal6oP?=
 =?us-ascii?Q?ig=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97720995-1bcf-4f12-3548-08daa17c1e17
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB2576.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2022 18:06:08.1387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KaTkj77Gf9fNGmUHTzDzUhUoITFw0Ztsd725mPKyRt8dpGwxW0klHVj6YffLNwNCTiKlMDQAyDJrJH/rE+po76zPbrAXy3gMS8+RrRrLuwU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5087
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-28_07,2022-09-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0
 mlxlogscore=999 phishscore=0 mlxscore=0 suspectscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209280107
X-Proofpoint-GUID: FKVZYSxT7zkB6lp2EMQJ0DUp_PndOj2G
X-Proofpoint-ORIG-GUID: FKVZYSxT7zkB6lp2EMQJ0DUp_PndOj2G
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=venu.busireddy@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Section 5.6.6.3 of VirtIO specification states, "Events will also
be reported via sense codes..." However, no sense data is sent when
VIRTIO_SCSI_EVT_RESET_RESCAN or VIRTIO_SCSI_EVT_RESET_REMOVED events
are reported (when disk hotplug/hotunplug events occur). SCSI layer
on Solaris depends on this sense data, and hence does not handle disk
hotplug/hotunplug events.

When disk inventory changes, return a CHECK_CONDITION status with sense
data of 0x06/0x3F/0x0E (sense code REPORTED_LUNS_CHANGED), as per the
specifications in Section 5.14 (h) of SAM-4.

Signed-off-by: Venu Busireddy <venu.busireddy@oracle.com>

v2 -> v3:
    - Implement the suggestion from Paolo Bonzini <pbonzini@redhat.com>.

v1 -> v2:
    - Send the sense data for VIRTIO_SCSI_EVT_RESET_REMOVED event too.
---
 hw/scsi/scsi-bus.c              |  1 +
 hw/scsi/virtio-scsi.c           | 16 ++++++++++++++++
 include/hw/scsi/scsi.h          |  6 ++++++
 include/hw/virtio/virtio-scsi.h |  1 +
 4 files changed, 24 insertions(+)

diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index 4403717c4aaf..b7cb249f2eab 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -730,6 +730,7 @@ SCSIRequest *scsi_req_new(SCSIDevice *d, uint32_t tag, uint32_t lun,
           */
          !(buf[0] == REQUEST_SENSE && d->sense_is_ua))) {
         ops = &reqops_unit_attention;
+        d->clear_reported_luns_changed = true;
     } else if (lun != d->lun ||
                buf[0] == REPORT_LUNS ||
                (buf[0] == REQUEST_SENSE && d->sense_len)) {
diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index 41f2a5630173..b7f66d366fcb 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -695,9 +695,23 @@ static int virtio_scsi_handle_cmd_req_prepare(VirtIOSCSI *s, VirtIOSCSIReq *req)
         return -ENOENT;
     }
     virtio_scsi_ctx_check(s, d);
+
+    if (s->reported_luns_changed) {
+        scsi_device_set_ua(d, SENSE_CODE(REPORTED_LUNS_CHANGED));
+    }
+
+    /*
+     * set d->clear_reported_luns_changed.
+     * scsi_req_new() will clear it if the required conditions are met.
+     */
+    d->clear_reported_luns_changed = false;
     req->sreq = scsi_req_new(d, req->req.cmd.tag,
                              virtio_scsi_get_lun(req->req.cmd.lun),
                              req->req.cmd.cdb, vs->cdb_size, req);
+    if (d->clear_reported_luns_changed) {
+        s->reported_luns_changed = false;
+        d->clear_reported_luns_changed = false;
+    }
 
     if (req->sreq->cmd.mode != SCSI_XFER_NONE
         && (req->sreq->cmd.mode != req->mode ||
@@ -956,6 +970,7 @@ static void virtio_scsi_hotplug(HotplugHandler *hotplug_dev, DeviceState *dev,
         virtio_scsi_push_event(s, sd,
                                VIRTIO_SCSI_T_TRANSPORT_RESET,
                                VIRTIO_SCSI_EVT_RESET_RESCAN);
+        s->reported_luns_changed = true;
         virtio_scsi_release(s);
     }
 }
@@ -973,6 +988,7 @@ static void virtio_scsi_hotunplug(HotplugHandler *hotplug_dev, DeviceState *dev,
         virtio_scsi_push_event(s, sd,
                                VIRTIO_SCSI_T_TRANSPORT_RESET,
                                VIRTIO_SCSI_EVT_RESET_REMOVED);
+        s->reported_luns_changed = true;
         virtio_scsi_release(s);
     }
 
diff --git a/include/hw/scsi/scsi.h b/include/hw/scsi/scsi.h
index 001103488c23..ea81c6f89e74 100644
--- a/include/hw/scsi/scsi.h
+++ b/include/hw/scsi/scsi.h
@@ -89,6 +89,12 @@ struct SCSIDevice
     uint32_t io_timeout;
     bool needs_vpd_bl_emulation;
     bool hba_supports_iothread;
+    /*
+     * clear_reported_luns_changed is used, if the required
+     * conditions are met, to inform the virtio-scsi layer that
+     * any pending REPORTED_LUNS_CHANGED condition can be cleared.
+     */
+    bool clear_reported_luns_changed;
 };
 
 extern const VMStateDescription vmstate_scsi_device;
diff --git a/include/hw/virtio/virtio-scsi.h b/include/hw/virtio/virtio-scsi.h
index a36aad9c8695..efbcf9ba069a 100644
--- a/include/hw/virtio/virtio-scsi.h
+++ b/include/hw/virtio/virtio-scsi.h
@@ -81,6 +81,7 @@ struct VirtIOSCSI {
     SCSIBus bus;
     int resetting;
     bool events_dropped;
+    bool reported_luns_changed;
 
     /* Fields for dataplane below */
     AioContext *ctx; /* one iothread per virtio-scsi-pci for now */

