Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1054EEE16
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 15:27:51 +0200 (CEST)
Received: from localhost ([::1]:57830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naHJe-0005Fa-P0
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 09:27:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1naHGd-0002NH-Ru; Fri, 01 Apr 2022 09:24:43 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:54468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1naHGa-00078x-8H; Fri, 01 Apr 2022 09:24:43 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 231CsYQ8018556; 
 Fri, 1 Apr 2022 13:24:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=XGIdwlf/3ZYMBI3qFL4QVw+awho+MzUXb/Apnnlg9ww=;
 b=QA3uOl3DGa6Mk/WmK6GB7v+JSR9W0lYW/4zA3JpPpBVXPds+891Dzfe/3dM+Urb1y+sg
 xJ7NgrJt+JBqAXzTbtVZ7gSCVBICqNqjSQH5xzdGXZRqBkWsM21fMdcu3BjtyEdvp7GZ
 eIJUKHVZEX1f0xYqCoyJBl2oHd9trhXhlAwc082lvtb2OoPKzdrvK0Wys8MIgtSx83z6
 qBP7Ch+mhF/yTmyBx9cNRMRHjJzbuMY440fxL3vySCCT0Huq9itVIXAI8SCcE/jhmOZ7
 yZ8BZyL+2bCwEXxolOE+hQRzU2UR/J9DzgoJDFtpbuorIasmNGVIA1cOmDokIZiwbRth WA== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f1se0q29m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Apr 2022 13:24:16 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 231DGaJ6003988; Fri, 1 Apr 2022 13:24:14 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3f1s96j1vn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Apr 2022 13:24:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hQeWCOawyPKts4Fn/vjy39Btr9RMP6emg8mU2I0cq5ZAAvx7yvlK+TzMtikW4q3g6Tb/Kez01sBoxpeF86MnJcqBpXY14bdrJPv4jF9Lr+WodOs5Tk2cUS1gM6JI+v0lPVlEBJiFQQfnWaG5hPpwj9i2+SBa8Z9jh43K4BbiKdg8ptzzTsBLddJ+Tyt9JHjGHLburMW5ILrj/0ijjVnAeCyGE8550grG4EfpugLOH8mZHU64hVYwaUxK8oSnNC3JUNUFsG9DmpE7hSxdz3xGmfD7QNzT2yPS0sCCf0sXPrSJO1Z/szfpQiComYIpbGwgkUqtrgWIwhVhIwgaovSSFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XGIdwlf/3ZYMBI3qFL4QVw+awho+MzUXb/Apnnlg9ww=;
 b=mMK0GYxvy7uXAjtlqh1OZla/ZrSPYK+ER6URURwx2k+eRVwMXT39fSMX3GjDqPSmLTuk3QykWZUymG+aPmX9d77patgosJ62pPWCQrfojRGvCxcuEwKBnJFlbBTaO5s/mBs81FGfDrjbBdoX3IpxpPpxJmIzRKDsbwLklanbISaIl3kk2B+I/4uwBcL9rsAbxEyXtlrRmH8/Rr7j8aBE3oCdz14BLlvZqUJAbCgrT9uKWXp4LWO1EPc5CLhOvLjslxNPoC0yzUH9NaM0wKhiin5BOrx1gqLzP+miuu8ILHz2EG2jT1z59DEhlotBjV6DcdoYTr0ABsc2adsOWKswFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGIdwlf/3ZYMBI3qFL4QVw+awho+MzUXb/Apnnlg9ww=;
 b=tuq3+jqLJE9OsFRdFDkWaWmcNal+8C/43zARKvh9aMvqIu5P9V/oWEdPCetrAW9uClZvliA2PI5pv+wNEJnSCeCzV7iXkfh4Z3AQsTC/2ytq4kRgfvg85wlvCpDQy7iLXVR47zpYaBxOBd2SSm0SL1k//gka8HkZdJK7NPQnjwU=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by MN2PR10MB4302.namprd10.prod.outlook.com (2603:10b6:208:199::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.28; Fri, 1 Apr
 2022 13:24:12 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::a2:4f33:4600:80ae]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::a2:4f33:4600:80ae%2]) with mapi id 15.20.5123.025; Fri, 1 Apr 2022
 13:24:12 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v14 1/8] virtio: drop name parameter for virtio_init()
Date: Fri,  1 Apr 2022 09:23:18 -0400
Message-Id: <1648819405-25696-2-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648819405-25696-1-git-send-email-jonah.palmer@oracle.com>
References: <1648819405-25696-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::24) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 518aa3d3-6e04-4174-d599-08da13e2e953
X-MS-TrafficTypeDiagnostic: MN2PR10MB4302:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB43022F55D472EDDB90A6E945E8E09@MN2PR10MB4302.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZxKEQt/q0gM1b0M8TCbOAAaMFNIA0/+oplZyPzgU9cH7AAEZCT0wRsrt26c5Nolg/krH0kyTFdSX5iLfqYxK0zMFHITP/V+bBBDEC3khb6OxGetWvvGMoFITFwV8kZlXB3Uex3EupIlRhHrcsd9pWVEgRsrqbjSLLu5edMSWwxzGb8c0RfwcHvLkkv68Xdjm0hbZ2VnuFqmM0l05Y9Kxxpa1cRdhFJDfb0FsPwEGcaQXObebxWsy/PO7Wk54eGI2cnIKr59ldrpc6Foh4sfEzUO2UFG4qUqJzRmpiiInNtYYLApSfvkwU7o/XpDLrsU+LB+qRc4CrmhJfeRpcUZHhK8AYBh8sJD47T3jFRKjr4JPIMRm4C7gnmUMmVpahbZE0Bd9lnZFTX0rTMgjtyV1ppgBWy6dNq7vMT1sPJFqcpUZwVNeSn8n49s/rDqhj88mmaRPimQA12S5LKEy8Abn4Kf+y0mTTbcrNY8+9i8mz2L3Bb0wXlchKK6tbLrbPx04WJVXsF5jGAPA9j0LabqE6ZgJ/vCEphPXlN/0U4aEHmNbr75HsO7IrByhJjEMwkS3rL/jtogG/cOC3DhoKM+tpX6inwsN/kkhdFOZhiNaVxcxwMpqt9jyfDvcV/nBwK6gpaWVDNPe0+nI72rTEujMSSqZu7xYmTrsJMei4DfEqL2TAht9kTJ7mzg56vp89O2pXSXQdslzalOqXCWkLWkV7w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(316002)(4326008)(508600001)(66556008)(66476007)(2906002)(8676002)(6916009)(86362001)(36756003)(66946007)(38350700002)(38100700002)(6486002)(5660300002)(7416002)(30864003)(6506007)(52116002)(8936002)(44832011)(6512007)(26005)(186003)(83380400001)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rh/Y1dgEBo6+31Z+7xYiUplNHjr9pmLSVHmfHRXxTeF+hscvWKo7GZfYU95/?=
 =?us-ascii?Q?pMgyS9AO2CSoiyz5L1tvmnk9NYG/n0kla/kKJfeL1J7vDRUqCVGQONbjJXfZ?=
 =?us-ascii?Q?efyc4ucs2+iOhnwR6z8woJtjPldFSu8qF+0bthb6IcslizdRiHQqY76GRBX8?=
 =?us-ascii?Q?j7HGWdQ1S4TFfAtgZWiWJPMgBIw9Py83a3dYAbLRuBwpPoSYYgeBCALos2b0?=
 =?us-ascii?Q?qU1N3/oFFdNOdg2ALvr90R6xlPkx97mv/Ug4Rwo4emGrrNvgJk5EkQPDD28Z?=
 =?us-ascii?Q?1P4V3HAVqYvGWJQGiHTgHVQtvLHD1vTtvQq/LJdNDSorkuMIz3taf76H5yHR?=
 =?us-ascii?Q?SqVzkWGeXeMWFxJBTJ/usc3TmdZL3/O2Sx9wk39S+co3lGybBkYzt7KHyWGv?=
 =?us-ascii?Q?U4ApRYNYdzAFuzX3VqUuBXSWX43kUR3BuZi6YFsLl3NqeUWhwAT5gZzVTEgj?=
 =?us-ascii?Q?XXZknWeVISpv1wm3fDGrZLCH3/hND9ga6ghrxjNsRa3B/WMx9I3Y40R7AqYa?=
 =?us-ascii?Q?NabVnOKRgFQ5Gu9b9H0fIU/+iHwtEBAB2aDzR1Q9FEQAEYoCMlvjfzpO5WLX?=
 =?us-ascii?Q?7LBDbqEONiSBdKjKSbIpnrYSqRIFOn7hg7jNg1+GnpzdE3vakOa38X9Y+noE?=
 =?us-ascii?Q?T0nFpCc9ZlXMEE3vdRIg6zPs9TBJOqI9yJvl7llP34KkLZ4RLOS/Tq10kQla?=
 =?us-ascii?Q?NRXZnnzaXI56wUAZGtdgnSV4rlMM3Da0r4DH34So2y+O3PVo3Y80yIHBNNHa?=
 =?us-ascii?Q?J6IowU1ybDou9Y2CYZjXRR9wKmF+TMgwfKRJe8a26sN34O+hLPoVsiyAtA1r?=
 =?us-ascii?Q?7Jy8JKggyib5o5WfFHCqQav3uywGz/qZYWeseNtbEKkVmFhmSxo/ED+yut0e?=
 =?us-ascii?Q?c4oE9bHk7i7d3hvpCLgaatqRVNy85dDhtwWK8lVIhccfrcrjMx6glHr7hqxS?=
 =?us-ascii?Q?pvL1lYjrr3iAnzO/8fZZ7cMyvNHGnJ1KPpaoVAs9JGf4Yxp/5MM/lE4X/mgx?=
 =?us-ascii?Q?VizAPBWm9D2Lwg56VuG4uRupCftxh2mbFoMTizVGkGDeCYGHd6pEcQZIr7rx?=
 =?us-ascii?Q?jX7HlCvfLOpSPR5eu0Efkdx3jCus6EifTVP46QrX25y5UtMbRg88xuyWjkOZ?=
 =?us-ascii?Q?dVc4NfH711Bj/zO8X6g5akX2m+JSJRQgB6byVid7DvINQbXZUOLnauNIdpNC?=
 =?us-ascii?Q?VE2+FsBYVlEDnUiToYwd/OABOInjArtn2z75u59VgxfbPBN9BEfYrrJdm9UM?=
 =?us-ascii?Q?hmWFJxxqOi/ipyZOr4aAYbCWOE8MXEf8PiqgB8A5M4cjk3rxTLKq9LEkUCWW?=
 =?us-ascii?Q?/uBI7GDlt/rlV2Rem5avwiZpjQ/o5sWOn6hGOaLlLZLlZS3qsbiuSbJzNgmB?=
 =?us-ascii?Q?r7V/oQAHm/J/hUwT9hDfBukh/+BbjsaqgZ8Sb5AR0DvDmKduUNq6udpe8Fb0?=
 =?us-ascii?Q?N0L9ZvD3PrEsjE4lOJn9NkPL1zFCe0Hbvo6rxKZWYbvIRfD6N/AbThAv6OQP?=
 =?us-ascii?Q?urIBB1wqOoc+O9BZa+609Dzkn/wGGIKarWeKd5ZROyDUVew4nAnKdCBLQeD3?=
 =?us-ascii?Q?2X3slrSZ20jOTStfvtwe9Z7+dCWQN7xB8Q9/s1McYwGeg/hEn+JwSJ/39yuN?=
 =?us-ascii?Q?XsI2Tmx7G2pYurK2j70BdYnHpzwzToKj0LgpLtLNtC1EnhsbTdhT+5UBTUbG?=
 =?us-ascii?Q?FGqKty3KqTobk8lDLeYRq1Bq5Y3L8rg85aeChb9QjQ1YCAwdDKOZnnCGTVWC?=
 =?us-ascii?Q?lfsCSazpaJA4mEpqyGJmjNUaqSSSD6s=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 518aa3d3-6e04-4174-d599-08da13e2e953
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2022 13:24:12.5718 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sbTbSaoLL3Mn8gbXN+jODdWx4GSBx9ToQBocbwj+5xC87Uq+G40bDLp0JcxP6s58jF5P+v5estoMw1jM0uf2KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4302
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.850
 definitions=2022-04-01_04:2022-03-30,
 2022-04-01 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204010062
X-Proofpoint-ORIG-GUID: HVtizYgxSFuP-b01ibiwfreooZIseq0z
X-Proofpoint-GUID: HVtizYgxSFuP-b01ibiwfreooZIseq0z
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: mst@redhat.com, qemu_oss@crudebyte.com, kraxel@redhat.com,
 si-wei.liu@oracle.com, joao.m.martins@oracle.com, eblake@redhat.com,
 qemu-block@nongnu.org, david@redhat.com, armbru@redhat.com,
 arei.gonglei@huawei.com, marcandre.lureau@redhat.com, lvivier@redhat.com,
 thuth@redhat.com, michael.roth@amd.com, groug@kaod.org, dgilbert@redhat.com,
 eric.auger@redhat.com, stefanha@redhat.com, boris.ostrovsky@oracle.com,
 kwolf@redhat.com, mathieu.poirier@linaro.org, raphael.norwitz@nutanix.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch drops the name parameter for the virtio_init function.

The pair between the numeric device ID and the string device ID
(name) of a virtio device already exists, but not in a way that
lets us map between them.

This patch lets us do this and removes the need for the name
parameter in the virtio_init function.

Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hw/9pfs/virtio-9p-device.c             |  2 +-
 hw/block/vhost-user-blk.c              |  2 +-
 hw/block/virtio-blk.c                  |  2 +-
 hw/char/virtio-serial-bus.c            |  3 +-
 hw/display/virtio-gpu-base.c           |  2 +-
 hw/input/virtio-input.c                |  3 +-
 hw/net/virtio-net.c                    |  2 +-
 hw/scsi/virtio-scsi.c                  |  3 +-
 hw/virtio/vhost-user-fs.c              |  3 +-
 hw/virtio/vhost-user-i2c.c             |  7 +---
 hw/virtio/vhost-user-rng.c             |  2 +-
 hw/virtio/vhost-user-vsock.c           |  2 +-
 hw/virtio/vhost-vsock-common.c         |  5 +--
 hw/virtio/vhost-vsock.c                |  2 +-
 hw/virtio/virtio-balloon.c             |  3 +-
 hw/virtio/virtio-crypto.c              |  2 +-
 hw/virtio/virtio-iommu.c               |  3 +-
 hw/virtio/virtio-mem.c                 |  3 +-
 hw/virtio/virtio-pmem.c                |  3 +-
 hw/virtio/virtio-rng.c                 |  2 +-
 hw/virtio/virtio.c                     | 55 ++++++++++++++++++++++++--
 include/hw/virtio/vhost-vsock-common.h |  2 +-
 include/hw/virtio/virtio-gpu.h         |  3 +-
 include/hw/virtio/virtio.h             |  4 +-
 24 files changed, 77 insertions(+), 43 deletions(-)

diff --git a/hw/9pfs/virtio-9p-device.c b/hw/9pfs/virtio-9p-device.c
index 54ee93b71f..5f522e68e9 100644
--- a/hw/9pfs/virtio-9p-device.c
+++ b/hw/9pfs/virtio-9p-device.c
@@ -216,7 +216,7 @@ static void virtio_9p_device_realize(DeviceState *dev, Error **errp)
     }
 
     v->config_size = sizeof(struct virtio_9p_config) + strlen(s->fsconf.tag);
-    virtio_init(vdev, "virtio-9p", VIRTIO_ID_9P, v->config_size);
+    virtio_init(vdev, VIRTIO_ID_9P, v->config_size);
     v->vq = virtio_add_queue(vdev, MAX_REQ, handle_9p_output);
 }
 
diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index 1a42ae9187..e8cb170032 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -491,7 +491,7 @@ static void vhost_user_blk_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    virtio_init(vdev, "virtio-blk", VIRTIO_ID_BLOCK,
+    virtio_init(vdev, VIRTIO_ID_BLOCK,
                 sizeof(struct virtio_blk_config));
 
     s->virtqs = g_new(VirtQueue *, s->num_queues);
diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index 540c38f829..27c71ad316 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -1206,7 +1206,7 @@ static void virtio_blk_device_realize(DeviceState *dev, Error **errp)
 
     virtio_blk_set_config_size(s, s->host_features);
 
-    virtio_init(vdev, "virtio-blk", VIRTIO_ID_BLOCK, s->config_size);
+    virtio_init(vdev, VIRTIO_ID_BLOCK, s->config_size);
 
     s->blk = conf->conf.blk;
     s->rq = NULL;
diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
index 6048d408b8..7d4601cb5d 100644
--- a/hw/char/virtio-serial-bus.c
+++ b/hw/char/virtio-serial-bus.c
@@ -1044,8 +1044,7 @@ static void virtio_serial_device_realize(DeviceState *dev, Error **errp)
                             VIRTIO_CONSOLE_F_EMERG_WRITE)) {
         config_size = offsetof(struct virtio_console_config, emerg_wr);
     }
-    virtio_init(vdev, "virtio-serial", VIRTIO_ID_CONSOLE,
-                config_size);
+    virtio_init(vdev, VIRTIO_ID_CONSOLE, config_size);
 
     /* Spawn a new virtio-serial bus on which the ports will ride as devices */
     qbus_init(&vser->bus, sizeof(vser->bus), TYPE_VIRTIO_SERIAL_BUS,
diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index fff0fb4a82..8ba5da4312 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -173,7 +173,7 @@ virtio_gpu_base_device_realize(DeviceState *qdev,
     }
 
     g->virtio_config.num_scanouts = cpu_to_le32(g->conf.max_outputs);
-    virtio_init(VIRTIO_DEVICE(g), "virtio-gpu", VIRTIO_ID_GPU,
+    virtio_init(VIRTIO_DEVICE(g), VIRTIO_ID_GPU,
                 sizeof(struct virtio_gpu_config));
 
     if (virtio_gpu_virgl_enabled(g->conf)) {
diff --git a/hw/input/virtio-input.c b/hw/input/virtio-input.c
index 54bcb46c74..5b5398b3ca 100644
--- a/hw/input/virtio-input.c
+++ b/hw/input/virtio-input.c
@@ -257,8 +257,7 @@ static void virtio_input_device_realize(DeviceState *dev, Error **errp)
     vinput->cfg_size += 8;
     assert(vinput->cfg_size <= sizeof(virtio_input_config));
 
-    virtio_init(vdev, "virtio-input", VIRTIO_ID_INPUT,
-                vinput->cfg_size);
+    virtio_init(vdev, VIRTIO_ID_INPUT, vinput->cfg_size);
     vinput->evt = virtio_add_queue(vdev, 64, virtio_input_handle_evt);
     vinput->sts = virtio_add_queue(vdev, 64, virtio_input_handle_sts);
 }
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 1067e72b39..6fbcfd7cb7 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3392,7 +3392,7 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
     }
 
     virtio_net_set_config_size(n, n->host_features);
-    virtio_init(vdev, "virtio-net", VIRTIO_ID_NET, n->config_size);
+    virtio_init(vdev, VIRTIO_ID_NET, n->config_size);
 
     /*
      * We set a lower limit on RX queue size to what it always was.
diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index 34a968ecfb..2a6141d081 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -972,8 +972,7 @@ void virtio_scsi_common_realize(DeviceState *dev,
     VirtIOSCSICommon *s = VIRTIO_SCSI_COMMON(dev);
     int i;
 
-    virtio_init(vdev, "virtio-scsi", VIRTIO_ID_SCSI,
-                sizeof(VirtIOSCSIConfig));
+    virtio_init(vdev, VIRTIO_ID_SCSI, sizeof(VirtIOSCSIConfig));
 
     if (s->conf.num_queues == VIRTIO_SCSI_AUTO_NUM_QUEUES) {
         s->conf.num_queues = 1;
diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
index c595957983..b875640147 100644
--- a/hw/virtio/vhost-user-fs.c
+++ b/hw/virtio/vhost-user-fs.c
@@ -219,8 +219,7 @@ static void vuf_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    virtio_init(vdev, "vhost-user-fs", VIRTIO_ID_FS,
-                sizeof(struct virtio_fs_config));
+    virtio_init(vdev, VIRTIO_ID_FS, sizeof(struct virtio_fs_config));
 
     /* Hiprio queue */
     fs->hiprio_vq = virtio_add_queue(vdev, fs->conf.queue_size, vuf_handle_output);
diff --git a/hw/virtio/vhost-user-i2c.c b/hw/virtio/vhost-user-i2c.c
index 42c7f6d9e5..6020eee093 100644
--- a/hw/virtio/vhost-user-i2c.c
+++ b/hw/virtio/vhost-user-i2c.c
@@ -14,11 +14,6 @@
 #include "qemu/error-report.h"
 #include "standard-headers/linux/virtio_ids.h"
 
-/* Remove this once the header is updated in Linux kernel */
-#ifndef VIRTIO_ID_I2C_ADAPTER
-#define VIRTIO_ID_I2C_ADAPTER                34
-#endif
-
 static const int feature_bits[] = {
     VIRTIO_I2C_F_ZERO_LENGTH_REQUEST,
     VHOST_INVALID_FEATURE_BIT
@@ -227,7 +222,7 @@ static void vu_i2c_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    virtio_init(vdev, "vhost-user-i2c", VIRTIO_ID_I2C_ADAPTER, 0);
+    virtio_init(vdev, VIRTIO_ID_I2C_ADAPTER, 0);
 
     i2c->vhost_dev.nvqs = 1;
     i2c->vq = virtio_add_queue(vdev, 4, vu_i2c_handle_output);
diff --git a/hw/virtio/vhost-user-rng.c b/hw/virtio/vhost-user-rng.c
index 209ee5bf9a..08bccba9dc 100644
--- a/hw/virtio/vhost-user-rng.c
+++ b/hw/virtio/vhost-user-rng.c
@@ -203,7 +203,7 @@ static void vu_rng_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    virtio_init(vdev, "vhost-user-rng", VIRTIO_ID_RNG, 0);
+    virtio_init(vdev, VIRTIO_ID_RNG, 0);
 
     rng->req_vq = virtio_add_queue(vdev, 4, vu_rng_handle_output);
     if (!rng->req_vq) {
diff --git a/hw/virtio/vhost-user-vsock.c b/hw/virtio/vhost-user-vsock.c
index 52bd682c34..0f8ff99f85 100644
--- a/hw/virtio/vhost-user-vsock.c
+++ b/hw/virtio/vhost-user-vsock.c
@@ -107,7 +107,7 @@ static void vuv_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    vhost_vsock_common_realize(vdev, "vhost-user-vsock");
+    vhost_vsock_common_realize(vdev);
 
     vhost_dev_set_config_notifier(&vvc->vhost_dev, &vsock_ops);
 
diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
index ed706681ac..ad5c8ff5d5 100644
--- a/hw/virtio/vhost-vsock-common.c
+++ b/hw/virtio/vhost-vsock-common.c
@@ -224,12 +224,11 @@ int vhost_vsock_common_post_load(void *opaque, int version_id)
     return 0;
 }
 
-void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name)
+void vhost_vsock_common_realize(VirtIODevice *vdev)
 {
     VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
 
-    virtio_init(vdev, name, VIRTIO_ID_VSOCK,
-                sizeof(struct virtio_vsock_config));
+    virtio_init(vdev, VIRTIO_ID_VSOCK, sizeof(struct virtio_vsock_config));
 
     /* Receive and transmit queues belong to vhost */
     vvc->recv_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
index 433d42d897..696635b1f7 100644
--- a/hw/virtio/vhost-vsock.c
+++ b/hw/virtio/vhost-vsock.c
@@ -166,7 +166,7 @@ static void vhost_vsock_device_realize(DeviceState *dev, Error **errp)
         qemu_set_nonblock(vhostfd);
     }
 
-    vhost_vsock_common_realize(vdev, "vhost-vsock");
+    vhost_vsock_common_realize(vdev);
 
     ret = vhost_dev_init(&vvc->vhost_dev, (void *)(uintptr_t)vhostfd,
                          VHOST_BACKEND_TYPE_KERNEL, 0, errp);
diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index 163d244eb4..193ff5261c 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -889,8 +889,7 @@ static void virtio_balloon_device_realize(DeviceState *dev, Error **errp)
     VirtIOBalloon *s = VIRTIO_BALLOON(dev);
     int ret;
 
-    virtio_init(vdev, "virtio-balloon", VIRTIO_ID_BALLOON,
-                virtio_balloon_config_size(s));
+    virtio_init(vdev, VIRTIO_ID_BALLOON, virtio_balloon_config_size(s));
 
     ret = qemu_add_balloon_handler(virtio_balloon_to_target,
                                    virtio_balloon_stat, s);
diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
index dcd80b904d..0a1f3dfdbe 100644
--- a/hw/virtio/virtio-crypto.c
+++ b/hw/virtio/virtio-crypto.c
@@ -810,7 +810,7 @@ static void virtio_crypto_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    virtio_init(vdev, "virtio-crypto", VIRTIO_ID_CRYPTO, vcrypto->config_size);
+    virtio_init(vdev, VIRTIO_ID_CRYPTO, vcrypto->config_size);
     vcrypto->curr_queues = 1;
     vcrypto->vqs = g_new0(VirtIOCryptoQueue, vcrypto->max_queues);
     for (i = 0; i < vcrypto->max_queues; i++) {
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 664cbd9583..4ed5bb16ba 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -1033,8 +1033,7 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VirtIOIOMMU *s = VIRTIO_IOMMU(dev);
 
-    virtio_init(vdev, "virtio-iommu", VIRTIO_ID_IOMMU,
-                sizeof(struct virtio_iommu_config));
+    virtio_init(vdev, VIRTIO_ID_IOMMU, sizeof(struct virtio_iommu_config));
 
     memset(s->iommu_pcibus_by_bus_num, 0, sizeof(s->iommu_pcibus_by_bus_num));
 
diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index f55dcf61f2..465a996214 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -868,8 +868,7 @@ static void virtio_mem_device_realize(DeviceState *dev, Error **errp)
                         vmem->block_size;
     vmem->bitmap = bitmap_new(vmem->bitmap_size);
 
-    virtio_init(vdev, TYPE_VIRTIO_MEM, VIRTIO_ID_MEM,
-                sizeof(struct virtio_mem_config));
+    virtio_init(vdev, VIRTIO_ID_MEM, sizeof(struct virtio_mem_config));
     vmem->vq = virtio_add_queue(vdev, 128, virtio_mem_handle_request);
 
     host_memory_backend_set_mapped(vmem->memdev, true);
diff --git a/hw/virtio/virtio-pmem.c b/hw/virtio/virtio-pmem.c
index 5419dca75e..ec74890676 100644
--- a/hw/virtio/virtio-pmem.c
+++ b/hw/virtio/virtio-pmem.c
@@ -123,8 +123,7 @@ static void virtio_pmem_realize(DeviceState *dev, Error **errp)
     }
 
     host_memory_backend_set_mapped(pmem->memdev, true);
-    virtio_init(vdev, TYPE_VIRTIO_PMEM, VIRTIO_ID_PMEM,
-                sizeof(struct virtio_pmem_config));
+    virtio_init(vdev, VIRTIO_ID_PMEM, sizeof(struct virtio_pmem_config));
     pmem->rq_vq = virtio_add_queue(vdev, 128, virtio_pmem_flush);
 }
 
diff --git a/hw/virtio/virtio-rng.c b/hw/virtio/virtio-rng.c
index cc8e9f775d..7e12fc03bf 100644
--- a/hw/virtio/virtio-rng.c
+++ b/hw/virtio/virtio-rng.c
@@ -215,7 +215,7 @@ static void virtio_rng_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    virtio_init(vdev, "virtio-rng", VIRTIO_ID_RNG, 0);
+    virtio_init(vdev, VIRTIO_ID_RNG, 0);
 
     vrng->vq = virtio_add_queue(vdev, 8, handle_input);
     vrng->quota_remaining = vrng->conf.max_bytes;
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 9d637e043e..cbb4920f49 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -132,6 +132,56 @@ struct VirtQueue
     QLIST_ENTRY(VirtQueue) node;
 };
 
+const char *virtio_device_names[] = {
+    [VIRTIO_ID_NET] = "virtio-net",
+    [VIRTIO_ID_BLOCK] = "virtio-blk",
+    [VIRTIO_ID_CONSOLE] = "virtio-serial",
+    [VIRTIO_ID_RNG] = "virtio-rng",
+    [VIRTIO_ID_BALLOON] = "virtio-balloon",
+    [VIRTIO_ID_IOMEM] = "virtio-iomem",
+    [VIRTIO_ID_RPMSG] = "virtio-rpmsg",
+    [VIRTIO_ID_SCSI] = "virtio-scsi",
+    [VIRTIO_ID_9P] = "virtio-9p",
+    [VIRTIO_ID_MAC80211_WLAN] = "virtio-mac-wlan",
+    [VIRTIO_ID_RPROC_SERIAL] = "virtio-rproc-serial",
+    [VIRTIO_ID_CAIF] = "virtio-caif",
+    [VIRTIO_ID_MEMORY_BALLOON] = "virtio-mem-balloon",
+    [VIRTIO_ID_GPU] = "virtio-gpu",
+    [VIRTIO_ID_CLOCK] = "virtio-clk",
+    [VIRTIO_ID_INPUT] = "virtio-input",
+    [VIRTIO_ID_VSOCK] = "vhost-vsock",
+    [VIRTIO_ID_CRYPTO] = "virtio-crypto",
+    [VIRTIO_ID_SIGNAL_DIST] = "virtio-signal",
+    [VIRTIO_ID_PSTORE] = "virtio-pstore",
+    [VIRTIO_ID_IOMMU] = "virtio-iommu",
+    [VIRTIO_ID_MEM] = "virtio-mem",
+    [VIRTIO_ID_SOUND] = "virtio-sound",
+    [VIRTIO_ID_FS] = "virtio-user-fs",
+    [VIRTIO_ID_PMEM] = "virtio-pmem",
+    [VIRTIO_ID_RPMB] = "virtio-rpmb",
+    [VIRTIO_ID_MAC80211_HWSIM] = "virtio-mac-hwsim",
+    [VIRTIO_ID_VIDEO_ENCODER] = "virtio-vid-encoder",
+    [VIRTIO_ID_VIDEO_DECODER] = "virtio-vid-decoder",
+    [VIRTIO_ID_SCMI] = "virtio-scmi",
+    [VIRTIO_ID_NITRO_SEC_MOD] = "virtio-nitro-sec-mod",
+    [VIRTIO_ID_I2C_ADAPTER] = "vhost-user-i2c",
+    [VIRTIO_ID_WATCHDOG] = "virtio-watchdog",
+    [VIRTIO_ID_CAN] = "virtio-can",
+    [VIRTIO_ID_DMABUF] = "virtio-dmabuf",
+    [VIRTIO_ID_PARAM_SERV] = "virtio-param-serv",
+    [VIRTIO_ID_AUDIO_POLICY] = "virtio-audio-pol",
+    [VIRTIO_ID_BT] = "virtio-bluetooth",
+    [VIRTIO_ID_GPIO] = "virtio-gpio"
+};
+
+static const char *virtio_id_to_name(uint16_t device_id)
+{
+    assert(device_id < G_N_ELEMENTS(virtio_device_names));
+    const char *name = virtio_device_names[device_id];
+    assert(name != NULL);
+    return name;
+}
+
 /* Called within call_rcu().  */
 static void virtio_free_region_cache(VRingMemoryRegionCaches *caches)
 {
@@ -3207,8 +3257,7 @@ void virtio_instance_init_common(Object *proxy_obj, void *data,
     qdev_alias_all_properties(vdev, proxy_obj);
 }
 
-void virtio_init(VirtIODevice *vdev, const char *name,
-                 uint16_t device_id, size_t config_size)
+void virtio_init(VirtIODevice *vdev, uint16_t device_id, size_t config_size)
 {
     BusState *qbus = qdev_get_parent_bus(DEVICE(vdev));
     VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
@@ -3237,7 +3286,7 @@ void virtio_init(VirtIODevice *vdev, const char *name,
         vdev->vq[i].host_notifier_enabled = false;
     }
 
-    vdev->name = name;
+    vdev->name = virtio_id_to_name(device_id);
     vdev->config_len = config_size;
     if (vdev->config_len) {
         vdev->config = g_malloc0(config_size);
diff --git a/include/hw/virtio/vhost-vsock-common.h b/include/hw/virtio/vhost-vsock-common.h
index d8b565b4da..076b7ab779 100644
--- a/include/hw/virtio/vhost-vsock-common.h
+++ b/include/hw/virtio/vhost-vsock-common.h
@@ -44,7 +44,7 @@ int vhost_vsock_common_start(VirtIODevice *vdev);
 void vhost_vsock_common_stop(VirtIODevice *vdev);
 int vhost_vsock_common_pre_save(void *opaque);
 int vhost_vsock_common_post_load(void *opaque, int version_id);
-void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name);
+void vhost_vsock_common_realize(VirtIODevice *vdev);
 void vhost_vsock_common_unrealize(VirtIODevice *vdev);
 uint64_t vhost_vsock_common_get_features(VirtIODevice *vdev, uint64_t features,
                                          Error **errp);
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 2179b75703..afff9e158e 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -22,6 +22,7 @@
 #include "sysemu/vhost-user-backend.h"
 
 #include "standard-headers/linux/virtio_gpu.h"
+#include "standard-headers/linux/virtio_ids.h"
 #include "qom/object.h"
 
 #define TYPE_VIRTIO_GPU_BASE "virtio-gpu-base"
@@ -37,8 +38,6 @@ OBJECT_DECLARE_SIMPLE_TYPE(VirtIOGPUGL, VIRTIO_GPU_GL)
 #define TYPE_VHOST_USER_GPU "vhost-user-gpu"
 OBJECT_DECLARE_SIMPLE_TYPE(VhostUserGPU, VHOST_USER_GPU)
 
-#define VIRTIO_ID_GPU 16
-
 struct virtio_gpu_simple_resource {
     uint32_t resource_id;
     uint32_t width;
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index b31c4507f5..5d774684b1 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -165,8 +165,8 @@ struct VirtioDeviceClass {
 void virtio_instance_init_common(Object *proxy_obj, void *data,
                                  size_t vdev_size, const char *vdev_name);
 
-void virtio_init(VirtIODevice *vdev, const char *name,
-                         uint16_t device_id, size_t config_size);
+void virtio_init(VirtIODevice *vdev, uint16_t device_id, size_t config_size);
+
 void virtio_cleanup(VirtIODevice *vdev);
 
 void virtio_error(VirtIODevice *vdev, const char *fmt, ...) G_GNUC_PRINTF(2, 3);
-- 
2.35.1


