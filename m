Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 868A347D82A
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 21:11:17 +0100 (CET)
Received: from localhost ([::1]:37256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n07xE-0000Ng-LW
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 15:11:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07VL-0004zC-UW
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:42:28 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:23750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07VJ-0008Mx-UJ
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:42:27 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJXxQK028537; 
 Wed, 22 Dec 2021 19:42:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=KZtyGgeOQRHCBkE4bSY7aoisg6wZBAsK7kgR08YYuhA=;
 b=jBknwZj5alokEoSGiJIizwi1fcO3UgoUYj7oq8X6ZiVrNI0YpfL3b4XpvTdKjKPzJBPU
 nJafd5AHCF5TlCUdkmzn+ZL+8G4UuRPzXL/g/juvhbvv3i7yXXqtRkDITyZVrlmxkqo0
 F3ewY0tPS82Ia7ZjYC4Nf8x3ip+xr/XJq7HuG1xe2nyhQhLcNTUtSObzC4tArkbthOJM
 dTC03T9mg3VXKYylpDE9juNqtdx2PiMrcgh7EMJCT8QXDf3vEVUSJ8C+ZH83YtKXaAVZ
 MQe6lpjlV+u3JAg5TcE8TBn8W6ZIijkRYOY6EZM+Di5jbnTU5YsvytqS6erIJd2BUHuA EA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3d410397k9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:42:10 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJelqL030437;
 Wed, 22 Dec 2021 19:42:09 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2040.outbound.protection.outlook.com [104.47.56.40])
 by userp3020.oracle.com with ESMTP id 3d193qamtk-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:42:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bVRzGlB5nbNDSw/n/p2/HZgr1DNCkbZy3PMpZbBcXH+p2946ROalPzWi4oJ+KDar+z9jYrgRXeGrWR0BlPMaoiWpDk9IH9e372LqUKK8+74+eiqLyNODrkYhp3RcRtQCaadOq8GsceL0epvy9LlP37adeiOrnZdtvXWlZasi77/NW+y71lVEbv1o9P5/yuqykzNs8asYgLkMZfzsw0Bw6JKtl2wyrDlo5o5Dm8RHysOuFpywzJiMFf764H0rZUZjtDsQ34Y7wFiP198wd2wA9jQScErtiOCzL6jFkyDCqsb0RoUkbsf1/I4OW+QFBJJs5hpyO2mcBE+p7sg4/m9kaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZtyGgeOQRHCBkE4bSY7aoisg6wZBAsK7kgR08YYuhA=;
 b=TFuCCTFpvESycZ33eYjST0QgnYPjDlWpWAM0idusJkjYEBGx+mwBaF63TU/t+xVFHN0VDDlBq6rfd0VXPQ7Puq/cK1aiBLshUzK2/0dO0urAiCrm0opSRgny05VH44PV9cb7eMaMKcg99A3v7C2yPskvQ5Ed76ESwA0/KW+nyWQrwD55eA5ivwLSUOMFQhKV7fUAQpWKw2s/rNPa+UOFA/YDOq7671Jqr4gAAO1CrgcgNSkgnC4P/ReqYFJBUGHr2Wi/g4E8DWAxrNuwZklKIlYIxChG8AtaLwszcMLUXI7rb2BLTDvqA7Xg0U/UtgcgTQfi4+NRYsXfYD9+mFOkxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KZtyGgeOQRHCBkE4bSY7aoisg6wZBAsK7kgR08YYuhA=;
 b=w8RPf7ZgDVJTxxnR0ibb41UwtKWqz4N+NRk5MWNHi8DfgSvH+sn7bgRyTg9CcRqktFBnJV2ffqks8tMObXZdGt/tdmyHyENZC+dmJP1ycCpMaMTagKDcJ1APljkl4yT//zS2sNUTXFzKraoyoc3E4tVj6CWHssqFC22Q4lY5ths=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BY5PR10MB4242.namprd10.prod.outlook.com (2603:10b6:a03:20d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.16; Wed, 22 Dec
 2021 19:42:05 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623%4]) with mapi id 15.20.4801.020; Wed, 22 Dec 2021
 19:42:05 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V7 21/29] vfio-pci: cpr part 3 (intx)
Date: Wed, 22 Dec 2021 11:05:26 -0800
Message-Id: <1640199934-455149-22-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0196.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::21) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f27913e-4528-4461-b2c5-08d9c5832208
X-MS-TrafficTypeDiagnostic: BY5PR10MB4242:EE_
X-Microsoft-Antispam-PRVS: <BY5PR10MB424255F9825458FEE66E3E84F97D9@BY5PR10MB4242.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xnYn3HguSe7GleL46UUEcW3nZPRZ3x0JPPqoJomf+FBuiRqADizkVbsAnfQCcX/OlwWWiYbbA9GdHmDE4d8Nx9De3+n2Re3TyjSX1pHfhChr68XrMlOPo+OFkGW++ZmCfCMHunyrhfdesNJLilsMTqry4xyZU0zUKe7bWFg9kY1Xy/14iU48J2acdhYoNnMXQ+DNmPePcICzJbWQrHaR42ZCaw7MkNpacgX59z0QShks04buQcOLR958YIlw+D0KIznzakpDWM19hDAPQEgkN9diKTch6iQTZsUJykOhcaEzlYkaN9P9U788J3QNQxnJFDs0845SGnOSo/TBEmzmM3vOuo5n96E47Y2rNP9ZhzyTDJNJRzSsKTXi5HcBgkWTsndes/Vsyte+5cQTPLiObK/8YLoMcz3ZFmK2LayEGLeWtzmYdTilUlMAW7L8VfFVa4Nn6DyGpY+XtfLgAONuEQQof4huHrg+Jj1i5ao5Cfu5pyBsTMWvVqgfhoVcJrqyxGoB/4m3tCO7xUa3wtO3v63kXM9xuz5x0uVazotUZ+jKiSM5ywKq1OltM7kExoBI584LToXSML0SZmLKjgVXqOIW0KSJPCl2hFhVPZU+Zv5cWXADpetULhH9cFQguYnLsBCYqR2gVU3ZLnPrHWslJ3UGup2UJqxiuIspIFzcftzyh+PjFxs+ZFJS2yps/u+GfzurqNEq1W0EHK5jOACX4w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(186003)(83380400001)(316002)(6916009)(38350700002)(52116002)(54906003)(8676002)(7416002)(38100700002)(8936002)(508600001)(5660300002)(66556008)(6512007)(66476007)(6486002)(36756003)(4326008)(2616005)(6666004)(107886003)(66946007)(2906002)(26005)(86362001)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1dSKF6LkN9d93727NQqTfferaDMRmipbJY6n4qMky9fO2EEgGGlpDdepu5o2?=
 =?us-ascii?Q?zxDJ7RSzTnZmwolV785iO1leqUC2uLlyepAH3NLxtJk2bI6275Mu85RkknF5?=
 =?us-ascii?Q?l8Mz9JMx6/oozxzbZV1rNppM1FP59nndAFr582HkOoPtJ/zV6i018k242uM0?=
 =?us-ascii?Q?iW8fxUR9LSwlNtTeBHZLDYNeEcrE2r53pi1RRkMzeCFrFRfv6NRXVOHirEtx?=
 =?us-ascii?Q?DB2MNBSkt2a9etzuezCJijA1FEYU7Z1+r3uLuKQ/uxRLxz/xL/2P8wDssDXh?=
 =?us-ascii?Q?+ygItw5lAAqIkHQ/vxGFNAbb/oOGKL1tbNHint5Q1TTgsVqVPMKVfHGyVhcC?=
 =?us-ascii?Q?seMppMHKCts8hEgUvF0CRS87Wg+Zdky48KakfefD0oNOCIf4qTFNQrKWISQB?=
 =?us-ascii?Q?xMJH8GFLDP1IaUAoXeTY7SLQfKrFi5bJL+X9Q2xvkwUShFfhxd6UmeS5Hrr0?=
 =?us-ascii?Q?XPfC8F137O7kqMrD+KZhSVBPzPYOmpWtrOhLWBu9LKOOsB3trg6QnPGxsFEw?=
 =?us-ascii?Q?YdHqg8iFDWTYovyTXMgxsTKSVyrfBQY1YLLsQpLS5Ym+Zt2lyC+PgLs+gD/C?=
 =?us-ascii?Q?23kBrvWUK5QNkpejLyV9EQ4zhpMWIABg05cRMPC/4GaiUqyQgwC2jBa3pqMm?=
 =?us-ascii?Q?oekDto9bpdJkfL9t/uv7fv0oQvjeUWjBHNQLc/CoBoL9lNnBszErJZwf3Ii4?=
 =?us-ascii?Q?doR8Zl7pk2Xb4jCENZ8QprXKTwFYOgXJGCaqrb1iwkzNRAF75ay8C/tLciiK?=
 =?us-ascii?Q?M0LaTU4gelcVMnHR5MqEHaWEZF6QlnNbqUNelkWS/eNpR3gfUzmqzXGoYuPd?=
 =?us-ascii?Q?9ZoDzOKpGzv4HrgHsuEv+hL0S6x6R3gUMUuKMz/bbka7JQiRvUkBkt19Mg6w?=
 =?us-ascii?Q?DYL+V63HtnQaZtcenuOl/Rvya1NWCiaKe5I2MdCv9QLYDQWRCKS+UcbyvS4u?=
 =?us-ascii?Q?H5WqISh7zNox1KxQ1LdCIVGm7Lmqy4xEYtz+ggqMnXy+wyjI+Tr6W8oVx9qM?=
 =?us-ascii?Q?5TYu+KaLPKlYsFmGQUOkdL4PjMOnzQsT0OsJ0NDxy/MSHYtaIiXOdv6Ty00A?=
 =?us-ascii?Q?m6jocJeuTl3nSIZpVCgu0Rk4Wm6+ep3/dxmT9s/sdTnDOiiXgOS1Z7As/vOM?=
 =?us-ascii?Q?RM/N4e7p9f/aJUQ+NBYWtq+965sAO5zUGJd32APuge3ogsgZJoOXix3YYm3j?=
 =?us-ascii?Q?0/m3/3RBLJfyl80A5ae1KO/AIPrHNU771UpGWB7w2K1rPYIVOm311Orl9ijJ?=
 =?us-ascii?Q?qSnJ3AsFMqm1fXN8NLVP+3C+enJAMXFOyxjU6zDKUeZ01ezHNPnd2aLc3p1U?=
 =?us-ascii?Q?kpvNyi6/zgS6qYxjtS1D7oQgFG4e+f/nDaqd1kSMNJ6yA09040FzjELkINBU?=
 =?us-ascii?Q?Teds7owgG1W5Yi4Xlo2H67CVSc1NA2yYFo3nK4+MDnTedLK4luqyqryR3JMK?=
 =?us-ascii?Q?qwBE8ynRiaoPbkWge3C7uSNmXMLYLzwO5i1kNsIbKQl8kTlw3p147r42u0a/?=
 =?us-ascii?Q?Kc4PcLRXx+j1QFJnXqJNh96lVMo97CN0+xfPdw7nwdnzHYYi6R6B0o2QLtea?=
 =?us-ascii?Q?tHF2kqJn6Y2i/Apfo8O04Mf3N2dEPZlg2kZhYGMs9cMFAVea6+qU4xziKxg3?=
 =?us-ascii?Q?VJwd68YXyqfw1LuMa0+FUD/NTV5s6nyH+wPToaqQZWPBQaIHfFk4rCazvZ8V?=
 =?us-ascii?Q?YuC4pg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f27913e-4528-4461-b2c5-08d9c5832208
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 19:42:05.3581 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ifuKFwLv3mBeC3W4Xq+V2MzzKjU31cOZvizW26Tm/KgZ5jZvvwg98CvPcZxH8kHwnRBcrpFmZ+xkEMafKPeZqTASM4kVTgMlI8A4WQABlFQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4242
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10206
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112220107
X-Proofpoint-ORIG-GUID: Xfrteq7uMUJ6E44fZ1DFvrBvqDrYYbem
X-Proofpoint-GUID: Xfrteq7uMUJ6E44fZ1DFvrBvqDrYYbem
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Preserve vfio INTX state across cpr restart.  Preserve VFIOINTx fields as
follows:
  pin : Recover this from the vfio config in kernel space
  interrupt : Preserve its eventfd descriptor across exec.
  unmask : Ditto
  route.irq : This could perhaps be recovered in vfio_pci_post_load by
    calling pci_device_route_intx_to_irq(pin), whose implementation reads
    config space for a bridge device such as ich9.  However, there is no
    guarantee that the bridge vmstate is read before vfio vmstate.  Rather
    than fiddling with MigrationPriority for vmstate handlers, explicitly
    save route.irq in vfio vmstate.
  pending : save in vfio vmstate.
  mmap_timeout, mmap_timer : Re-initialize
  bool kvm_accel : Re-initialize

In vfio_realize, defer calling vfio_intx_enable until the vmstate
is available, in vfio_pci_post_load.  Modify vfio_intx_enable and
vfio_intx_kvm_enable to skip vfio initialization, but still perform
kvm initialization.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 hw/vfio/pci.c | 92 +++++++++++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 83 insertions(+), 9 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index abef9b2..e32513c 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -171,14 +171,45 @@ static void vfio_intx_eoi(VFIODevice *vbasedev)
     vfio_unmask_single_irqindex(vbasedev, VFIO_PCI_INTX_IRQ_INDEX);
 }
 
+#ifdef CONFIG_KVM
+static bool vfio_no_kvm_intx(VFIOPCIDevice *vdev)
+{
+    return vdev->no_kvm_intx || !kvm_irqfds_enabled() ||
+           vdev->intx.route.mode != PCI_INTX_ENABLED ||
+           !kvm_resamplefds_enabled();
+}
+#endif
+
+static void vfio_intx_reenable_kvm(VFIOPCIDevice *vdev, Error **errp)
+{
+#ifdef CONFIG_KVM
+    if (vfio_no_kvm_intx(vdev)) {
+        return;
+    }
+
+    if (vfio_notifier_init(vdev, &vdev->intx.unmask, "intx-unmask", 0)) {
+        error_setg(errp, "vfio_notifier_init intx-unmask failed");
+        return;
+    }
+
+    if (kvm_irqchip_add_irqfd_notifier_gsi(kvm_state,
+                                           &vdev->intx.interrupt,
+                                           &vdev->intx.unmask,
+                                           vdev->intx.route.irq)) {
+        error_setg_errno(errp, errno, "failed to setup resample irqfd");
+        return;
+    }
+
+    vdev->intx.kvm_accel = true;
+#endif
+}
+
 static void vfio_intx_enable_kvm(VFIOPCIDevice *vdev, Error **errp)
 {
 #ifdef CONFIG_KVM
     int irq_fd = event_notifier_get_fd(&vdev->intx.interrupt);
 
-    if (vdev->no_kvm_intx || !kvm_irqfds_enabled() ||
-        vdev->intx.route.mode != PCI_INTX_ENABLED ||
-        !kvm_resamplefds_enabled()) {
+    if (vfio_no_kvm_intx(vdev)) {
         return;
     }
 
@@ -326,7 +357,13 @@ static int vfio_intx_enable(VFIOPCIDevice *vdev, Error **errp)
         return 0;
     }
 
-    vfio_disable_interrupts(vdev);
+    /*
+     * Do not alter interrupt state during vfio_realize and cpr-load.  The
+     * reused flag is cleared thereafter.
+     */
+    if (!vdev->pdev.reused) {
+        vfio_disable_interrupts(vdev);
+    }
 
     vdev->intx.pin = pin - 1; /* Pin A (1) -> irq[0] */
     pci_config_set_interrupt_pin(vdev->pdev.config, pin);
@@ -351,6 +388,11 @@ static int vfio_intx_enable(VFIOPCIDevice *vdev, Error **errp)
     fd = event_notifier_get_fd(&vdev->intx.interrupt);
     qemu_set_fd_handler(fd, vfio_intx_interrupt, NULL, vdev);
 
+    if (vdev->pdev.reused) {
+        vfio_intx_reenable_kvm(vdev, &err);
+        goto finish;
+    }
+
     if (vfio_set_irq_signaling(&vdev->vbasedev, VFIO_PCI_INTX_IRQ_INDEX, 0,
                                VFIO_IRQ_SET_ACTION_TRIGGER, fd, errp)) {
         qemu_set_fd_handler(fd, NULL, NULL, vdev);
@@ -363,6 +405,7 @@ static int vfio_intx_enable(VFIOPCIDevice *vdev, Error **errp)
         warn_reportf_err(err, VFIO_MSG_PREFIX, vdev->vbasedev.name);
     }
 
+finish:
     vdev->interrupt = VFIO_INT_INTx;
 
     trace_vfio_intx_enable(vdev->vbasedev.name);
@@ -3140,9 +3183,13 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
                                              vfio_intx_routing_notifier);
         vdev->irqchip_change_notifier.notify = vfio_irqchip_change;
         kvm_irqchip_add_change_notifier(&vdev->irqchip_change_notifier);
-        ret = vfio_intx_enable(vdev, errp);
-        if (ret) {
-            goto out_deregister;
+
+        /* Wait until cpr-load reads intx routing data to enable */
+        if (!pdev->reused) {
+            ret = vfio_intx_enable(vdev, errp);
+            if (ret) {
+                goto out_deregister;
+            }
         }
     }
 
@@ -3437,6 +3484,7 @@ static int vfio_pci_post_load(void *opaque, int version_id)
     VFIOPCIDevice *vdev = opaque;
     PCIDevice *pdev = &vdev->pdev;
     int nr_vectors;
+    int ret = 0;
 
     vfio_merge_config(vdev);
 
@@ -3451,12 +3499,37 @@ static int vfio_pci_post_load(void *opaque, int version_id)
         vfio_claim_vectors(vdev, nr_vectors, false);
 
     } else if (vfio_pci_read_config(pdev, PCI_INTERRUPT_PIN, 1)) {
-        assert(0);      /* completed in a subsequent patch */
+        Error *err = 0;
+        ret = vfio_intx_enable(vdev, &err);
+        if (ret) {
+            error_report_err(err);
+        }
     }
 
     pdev->reused = false;
 
-    return 0;
+    return ret;
+}
+
+static const VMStateDescription vfio_intx_vmstate = {
+    .name = "vfio-intx",
+    .unmigratable = 1,
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .fields = (VMStateField[]) {
+        VMSTATE_BOOL(pending, VFIOINTx),
+        VMSTATE_UINT32(route.mode, VFIOINTx),
+        VMSTATE_INT32(route.irq, VFIOINTx),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+#define VMSTATE_VFIO_INTX(_field, _state) {                         \
+    .name       = (stringify(_field)),                              \
+    .size       = sizeof(VFIOINTx),                                 \
+    .vmsd       = &vfio_intx_vmstate,                               \
+    .flags      = VMS_STRUCT,                                       \
+    .offset     = vmstate_offset_value(_state, _field, VFIOINTx),   \
 }
 
 static bool vfio_pci_needed(void *opaque)
@@ -3475,6 +3548,7 @@ static const VMStateDescription vfio_pci_vmstate = {
     .fields = (VMStateField[]) {
         VMSTATE_PCI_DEVICE(pdev, VFIOPCIDevice),
         VMSTATE_MSIX_TEST(pdev, VFIOPCIDevice, vfio_msix_present),
+        VMSTATE_VFIO_INTX(intx, VFIOPCIDevice),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
1.8.3.1


