Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A2E3BED51
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 19:43:44 +0200 (CEST)
Received: from localhost ([::1]:54258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1BaJ-00079q-4s
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 13:43:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m1BKZ-0000UA-KA
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:27:27 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:32370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m1BKV-0006ml-RP
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:27:27 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 167HCO0s010640; Wed, 7 Jul 2021 17:27:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=UqXU2DX7ZZK0VdAu810lCJdH99d6CGCunQKp3koZf50=;
 b=u5KcFkML2JjhAbxzWAt8jqmTCLFufQr2vlaCCv8oTTm+eyJcDBPtgLzx4wbcWfD+37QC
 yNFCbZcfG+8S3IADrVl+Q/UkDRq3oz4F2ZDCmcFYBflsdBPA6BqcQUXZeTU4bSXhex2N
 fPSQkXHU2icZR8OLttv8WvgxS4Iu6pi5Mx+zDZM78QyHR0xi2OVAdercT1ZLfLdplcKF
 jAQAwRoqOHSGjEnNVVJMYlY2s7hgUc6Vs5TxWzaKhp/EKbdcyeU6ciocqcFFwPemVPAl
 tpEQLz6KkhxTSIs4dpXQO8UihB6k5n8J0weGKIcuib/c4RXXSq9m4pp2Hp5tvtb3mqkP rg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 39m3mhcnh4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Jul 2021 17:27:21 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 167HAVQl053006;
 Wed, 7 Jul 2021 17:27:19 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
 by aserp3030.oracle.com with ESMTP id 39nbg2je13-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Jul 2021 17:27:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M/KQGpBpMa4h832ZJ90NfimwkPSquSs4mJV25SYnO6+apCODlsFOdZphRLAVw+VtH5Kz3zFEiMVKabLwJYUmgMXKj6Rt75B57b2AjENc4OK0hVwaL4Bq+MZzrA0ra2/7OTpo027zp7iAC9C6QVSs0NpNiqIFxi94MxcOMkrJIFM1fOd8q5ekHm3qu5cbiOnL3A0s4Q+z2xJtW8QBDlgHrost6Fo+R6g3duV9zr1POkAhQx2xIEksL9ZliCbhZmjTodpJY1HtuDv1STA7ZlwsaKhwXvQ21E7kry2pfIVU/dhMnGtJItTn7aa4HArZmL112LuusxwYaBibh59CPel/4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UqXU2DX7ZZK0VdAu810lCJdH99d6CGCunQKp3koZf50=;
 b=EyWv0rh+/VEIsSlrj49pFjEa1g+Hpb+tVukb6yBPtlu8bMWb0Ucr9wsnv160O2pKjeVK3/RXMd9uRFTmkcfzyr8dJKJuY0XF5pEBDJs1bxF4MfUH29cnvmzUPTqZr2yixdqAC3iAl6WcpS/XiUx9cxQuZjXxZlbL79pOGB4Mm/cfEntyWweCmYVOY6ShsXdrh79amsnd0iYnUCOCiYKdfF4a3HWPhw4HXx++9SG8kTnjxM1Y13Y5P8BkhSNf4Byv/1p93w2piNUwLif0TVsPFEkcoBNakPE7fbCZwNRwTBL9oqOzyNzm+t9VAP4P1306xBMwQvAxgm0eyh+uXhZnBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UqXU2DX7ZZK0VdAu810lCJdH99d6CGCunQKp3koZf50=;
 b=l68TmdD7+pyRemk5awsBU2Vk0YRxUjif/WTOdznoF1zq+ao2fG8mMa/BUl2N6kLPjxZrxjXHhi33KK29KIa647QYq4+IqJ4RCXL50juiHVCV9Z0vagYlUTX+aHD4741iNMrAdSQEqw9edLxZ6zWGerZO3bwOlD59IXN8HrBhccE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BY5PR10MB4180.namprd10.prod.outlook.com (2603:10b6:a03:211::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Wed, 7 Jul
 2021 17:27:18 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba%7]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 17:27:18 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V5 17/25] vfio-pci: cpr part 2
Date: Wed,  7 Jul 2021 10:20:26 -0700
Message-Id: <1625678434-240960-18-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0104.namprd03.prod.outlook.com
 (2603:10b6:a03:333::19) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-dev63.us.oracle.com (148.87.23.13) by
 SJ0PR03CA0104.namprd03.prod.outlook.com (2603:10b6:a03:333::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21 via Frontend
 Transport; Wed, 7 Jul 2021 17:27:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 562cdac6-2e2a-4f3b-cd0a-08d9416c7853
X-MS-TrafficTypeDiagnostic: BY5PR10MB4180:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB418086AF330C45D1A3A6457DF91A9@BY5PR10MB4180.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:147;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aG3dTa3O/ebymIMlA3DKtQWUrQQOBYNHE6MdRSxG8+CNxWaLDWJ/femsqbZ7F7ZRewm72m/4Tp8TBjl3QW/SlYzySsaaxGZ64OKlbvoGYi6SC23U2RVNvJu3fXS5P2uVq3Dtlla9zI+rIfSQEznzI7byHU3OYJzTyiizuAEOYXH9F3Egt+TktYy5npoe6WeVKHWej142P+LjK1cjSGbwkX3+eIOOqF0BSpW/4LhXgP8v9GvogwacRw9ijdWohbXA0D2LqEhZ8AUmKL35H4+vLiAUjVTICqcRAC65HbZsTGZh14NvparwTLcuGBdtc2XOew7NghhcLozMV/BJJBcdno3KXv4Lwe67HNT/TJOK83InINNwQ7omWEPbgu76BEj3AQcHsCswk9Rul/wgcCBTTwWIH5WJfSrpFDNaxJ/1ZhCs+nFgsog8PMNOLwBOLSJ0PhQrUv+T/26qsaXqKbbwoUSCdG24HUr7T8PUPhVCccQHLebJx6gGY7B2Cxde1VdNwkHT1Qqz9JTNKhRi4bsL+JeeoL/1t50EnMTu0z6WqAPaerm/rw56pLniYt5Ds9zLW+oU7cz0CNkx53br1gWPILMRwxKL3oKciozDOTmpmYX35ItWQoM7nlAtdHAX9clWwFR8rHxoFanKTsoMcJHkAJMr/mdvyB8WBvqyV0Uwj3LxRZt6XqKqY2HCbzALSq1jthQThCPlZ25/gnqBCBQRGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(136003)(396003)(39860400002)(376002)(366004)(52116002)(7696005)(66556008)(2906002)(26005)(478600001)(83380400001)(316002)(107886003)(6486002)(8676002)(86362001)(956004)(2616005)(66476007)(38350700002)(38100700002)(4326008)(54906003)(6916009)(66946007)(8936002)(36756003)(5660300002)(6666004)(186003)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?G1Gr9ivYawPA6f3KOppaA1qlgMZfsGc4+hUKhs0Z11f3/4DLzVeqcNsE/m12?=
 =?us-ascii?Q?N/SD9tSGSX5ZFqg4IlWnSDIuRXoGJxiF/qsEgt9Wh7JaaGlLkpezsqUiFj49?=
 =?us-ascii?Q?oo6zcbMryYIDr9tPyJH1qxSumtznF6x+hMrE1cPCKVwOJTPOqpu9TVca4PLb?=
 =?us-ascii?Q?SdX2zHEIRvzyhN3NLRYmRVgEV41Sq4KKNt228OOrbkBRwiveEUGHQExCtxmm?=
 =?us-ascii?Q?iFMuTPWfZGlQ8jg6TlxpKkA6qaNl5BD37MdYRsHjUoogBr+ujnaNlMPJHqBY?=
 =?us-ascii?Q?JOwI9qnXDSBRtLS/4+SCcZKiq3FtA7myb46giHhdP0xbyMUS7R4e5zZIHyyC?=
 =?us-ascii?Q?lbMaBjSbEQ/7keJzwkmH4HX515UNYJOP1cSI6t176OkkFCfdcLSpj8uH2GhV?=
 =?us-ascii?Q?dRseNNZhJ7RZeidCS3EriAODzU5bOTQI4EpLtVT6qvof4RqguvN2azCggC40?=
 =?us-ascii?Q?EqujjhxtNETVFNpY4UKo+FtYQ4f+5GHEb3eIxOgJzOIyTAsTwqhdQ5rjP8Ar?=
 =?us-ascii?Q?cW3VleeqxAuJPTHCoHi+IvujzAx+rsUZ5KpE6buAhsciwCdw9Ja2Za5Y3zPT?=
 =?us-ascii?Q?r6RrqiMaerx1rhQkMUNr53fhE9dZMhGgHV/Eh8D25I6RSyrq711k/A2Kkc8e?=
 =?us-ascii?Q?o+EMVrKwPU6Gtvxuo8gNQ4+wddwKPx9SL2Nvw12gXHKxSaM075lggLChzyer?=
 =?us-ascii?Q?sURkhrN2Fmh5R0rax6MCJkVfcyhrq0o+pTAcmks09dq1mkgDn1EbpgrJDdiG?=
 =?us-ascii?Q?wgME+ZjWeX+trzjqNMxAB5mS+OS34WN9P4cA2JOe202jNnOKtAfzhSFx7SqU?=
 =?us-ascii?Q?93n/PoL5gPuPOsRMKjJ31UtfdFeuTDmCpanob330XDMxKrtS0A6duZc7rJnl?=
 =?us-ascii?Q?eIBSu03r1rQkOpoLR+Mn0eflBdZb4qlZ50mtC1nW2mTvmtjrd8boPLBFGIGC?=
 =?us-ascii?Q?1NA8KoEdQEFDecSUNVK16eVS11toMSnfaRc9p0tMVZZ1i/2cUwPznuIIz8Zp?=
 =?us-ascii?Q?DfbSP3rL1HfoQSH2M8ragXDnB0KCanMYtsSSqovpRDB/khaykhEuCutFDeV4?=
 =?us-ascii?Q?MCqokmdaeDRm0+haYVXdnl03q5AiMonGqGTG7N4JGJibskv1fQkWPtmP9+df?=
 =?us-ascii?Q?dnGkF0AzScfcIQRgeI3i1MRR/aPt5zHooxdjrQd9BV+StbuWdFtAObQUNUoI?=
 =?us-ascii?Q?rXONrQ57gigRWesR2Ibzaz0mbywxRB+NkAmc1KKSycEX8WXG+f+A9Rfg9ckv?=
 =?us-ascii?Q?X20GSWdvYt7jcVkCo8E0eaoaWbtjEgD+2xEdET7I5GUm0OowIyGoMmaGn1YZ?=
 =?us-ascii?Q?GafFCecnnB40ztNwMUtsmhyR?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 562cdac6-2e2a-4f3b-cd0a-08d9416c7853
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 17:27:18.2316 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EA9Qp0HDYLy+org+0SKoiG31Agik5ANeGQJYTtUgyWeodp3Q27Qhw4C6n3MUE1ypA903FfuYBbGba/yqiLov2jJJExy+2lz2BxAeul4AZ5g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4180
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10037
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999
 phishscore=0 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107070100
X-Proofpoint-GUID: A9KE-unl1bLJRpkJkdMGh8GpKXZB20JD
X-Proofpoint-ORIG-GUID: A9KE-unl1bLJRpkJkdMGh8GpKXZB20JD
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

Finish cpr for vfio-pci by preserving eventfd's and vector state.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 hw/vfio/pci.c | 118 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 116 insertions(+), 2 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 0f5c542..07bd360 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2654,6 +2654,27 @@ static void vfio_put_device(VFIOPCIDevice *vdev)
     vfio_put_base_device(&vdev->vbasedev);
 }
 
+static void save_event_fd(VFIOPCIDevice *vdev, const char *name, int nr,
+                            EventNotifier *ev)
+{
+    char envname[256];
+    int fd = event_notifier_get_fd(ev);
+    const char *vfname = vdev->vbasedev.name;
+
+    if (fd >= 0) {
+        snprintf(envname, sizeof(envname), "%s_%s_%d", vfname, name, nr);
+        setenv_fd(envname, fd);
+    }
+}
+
+static int load_event_fd(VFIOPCIDevice *vdev, const char *name, int nr)
+{
+    char envname[256];
+    const char *vfname = vdev->vbasedev.name;
+    snprintf(envname, sizeof(envname), "%s_%s_%d", vfname, name, nr);
+    return getenv_fd(envname);
+}
+
 static void vfio_err_notifier_handler(void *opaque)
 {
     VFIOPCIDevice *vdev = opaque;
@@ -2685,7 +2706,13 @@ static void vfio_err_notifier_handler(void *opaque)
 static void vfio_register_err_notifier(VFIOPCIDevice *vdev)
 {
     Error *err = NULL;
-    int32_t fd;
+    int32_t fd = load_event_fd(vdev, "err", 0);
+
+    if (fd >= 0) {
+        event_notifier_init_fd(&vdev->err_notifier, fd);
+        qemu_set_fd_handler(fd, vfio_err_notifier_handler, NULL, vdev);
+        return;
+    }
 
     if (!vdev->pci_aer) {
         return;
@@ -2746,7 +2773,14 @@ static void vfio_register_req_notifier(VFIOPCIDevice *vdev)
     struct vfio_irq_info irq_info = { .argsz = sizeof(irq_info),
                                       .index = VFIO_PCI_REQ_IRQ_INDEX };
     Error *err = NULL;
-    int32_t fd;
+    int32_t fd = load_event_fd(vdev, "req", 0);
+
+    if (fd >= 0) {
+        event_notifier_init_fd(&vdev->req_notifier, fd);
+        qemu_set_fd_handler(fd, vfio_req_notifier_handler, NULL, vdev);
+        vdev->req_enabled = true;
+        return;
+    }
 
     if (!(vdev->features & VFIO_FEATURE_ENABLE_REQ)) {
         return;
@@ -3295,14 +3329,91 @@ static void vfio_merge_config(VFIOPCIDevice *vdev)
     g_free(phys_config);
 }
 
+static int vfio_pci_pre_save(void *opaque)
+{
+    VFIOPCIDevice *vdev = opaque;
+    PCIDevice *pdev = &vdev->pdev;
+    int i;
+
+    if (vfio_pci_read_config(pdev, PCI_INTERRUPT_PIN, 1)) {
+        error_report("%s: cpr does not support vfio-pci INTX",
+                     vdev->vbasedev.name);
+    }
+
+    for (i = 0; i < vdev->nr_vectors; i++) {
+        VFIOMSIVector *vector = &vdev->msi_vectors[i];
+        if (vector->use) {
+            save_event_fd(vdev, "interrupt", i, &vector->interrupt);
+            if (vector->virq >= 0) {
+                save_event_fd(vdev, "kvm_interrupt", i,
+                                &vector->kvm_interrupt);
+            }
+        }
+    }
+    save_event_fd(vdev, "err", 0, &vdev->err_notifier);
+    save_event_fd(vdev, "req", 0, &vdev->req_notifier);
+    return 0;
+}
+
+static void vfio_claim_vectors(VFIOPCIDevice *vdev, int nr_vectors, bool msix)
+{
+    int i, fd;
+    bool pending = false;
+    PCIDevice *pdev = &vdev->pdev;
+
+    vdev->nr_vectors = nr_vectors;
+    vdev->msi_vectors = g_new0(VFIOMSIVector, nr_vectors);
+    vdev->interrupt = msix ? VFIO_INT_MSIX : VFIO_INT_MSI;
+
+    for (i = 0; i < nr_vectors; i++) {
+        VFIOMSIVector *vector = &vdev->msi_vectors[i];
+
+        fd = load_event_fd(vdev, "interrupt", i);
+        if (fd >= 0) {
+            vfio_vector_init(vdev, i, fd);
+            qemu_set_fd_handler(fd, vfio_msi_interrupt, NULL, vector);
+        }
+
+        fd = load_event_fd(vdev, "kvm_interrupt", i);
+        if (fd >= 0) {
+            vfio_add_kvm_msi_virq(vdev, vector, i, msix, fd);
+        }
+
+        if (msix && msix_is_pending(pdev, i) && msix_is_masked(pdev, i)) {
+            set_bit(i, vdev->msix->pending);
+            pending = true;
+        }
+    }
+
+    if (msix) {
+        memory_region_set_enabled(&pdev->msix_pba_mmio, pending);
+    }
+}
+
 static int vfio_pci_post_load(void *opaque, int version_id)
 {
     VFIOPCIDevice *vdev = opaque;
     PCIDevice *pdev = &vdev->pdev;
+    int nr_vectors;
     bool enabled;
 
     vfio_merge_config(vdev);
 
+    if (msix_enabled(pdev)) {
+        nr_vectors = vdev->msix->entries;
+        vfio_claim_vectors(vdev, nr_vectors, true);
+        msix_init_vector_notifiers(pdev, vfio_msix_vector_use,
+                                   vfio_msix_vector_release, NULL);
+
+    } else if (msi_enabled(pdev)) {
+        nr_vectors = msi_nr_vectors_allocated(pdev);
+        vfio_claim_vectors(vdev, nr_vectors, false);
+
+    } else if (vfio_pci_read_config(pdev, PCI_INTERRUPT_PIN, 1)) {
+        error_report("%s: cpr does not support vfio-pci INTX",
+                     vdev->vbasedev.name);
+    }
+
     pdev->reused = false;
     enabled = pci_get_word(pdev->config + PCI_COMMAND) & PCI_COMMAND_MASTER;
     memory_region_set_enabled(&pdev->bus_master_enable_region, enabled);
@@ -3321,8 +3432,11 @@ static const VMStateDescription vfio_pci_vmstate = {
     .version_id = 0,
     .minimum_version_id = 0,
     .post_load = vfio_pci_post_load,
+    .pre_save = vfio_pci_pre_save,
     .needed = vfio_pci_needed,
     .fields = (VMStateField[]) {
+        VMSTATE_PCI_DEVICE(pdev, VFIOPCIDevice),
+        VMSTATE_MSIX_TEST(pdev, VFIOPCIDevice, vfio_msix_present),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
1.8.3.1


