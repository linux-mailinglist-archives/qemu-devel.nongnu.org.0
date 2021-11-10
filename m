Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A556144BEB3
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 11:31:05 +0100 (CET)
Received: from localhost ([::1]:48180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkksi-0002gl-Or
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 05:31:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mkkm3-0002Pg-5H; Wed, 10 Nov 2021 05:24:11 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:25124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1mkkly-0005Ba-Jl; Wed, 10 Nov 2021 05:24:09 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AA9TZoV023556; 
 Wed, 10 Nov 2021 10:23:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=EDyhOHnSSI0eU3CG7KUElf1bCePkvnpBTxbzpPGgmUY=;
 b=WvR6zT7Lo05QTO/QW4PCb3/FjipHFFn9w76cxgF8F3VSxar6hswTZkkWcLFv1zDR1dEA
 EyV3GSmqf3YTysEUpeYAs03pNGXKHOY0e2vFM0WlImjfEJ1pZ2xhwXHJSi/LPGQ0mhj4
 Vxbg6sRl/sLtkuPHOm7f67Bej1mhh8eqQ9PiwfFx3lejj6RMqNboG6Y/8cLnPwSvLVBG
 CIlH/b0fWFQqWUBKQ0GzWDbMoKVh1PchWf1etk4eejm2nFZ/2LH1lmP2bNVYFpyy0qet
 wpXfjb3rHJ8nNyETtU+AMpFV0mcDUF0qwyQJhR3KylOgvbxFL0WehYlcwxrE9WSLbCwk Fw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3c7yq7bubd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Nov 2021 10:23:48 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AAAH1fF156494;
 Wed, 10 Nov 2021 10:23:46 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2176.outbound.protection.outlook.com [104.47.73.176])
 by userp3020.oracle.com with ESMTP id 3c63fuebu2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Nov 2021 10:23:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e/EyUxmfK9B5WrpSPQcUfk0sYQf232Ag6T/o2fE71QHZTLw98XCvwyC0jGsAkQG5bIT8tjs8AxJFg5KQRaGnpxWxiK/ORXxj+I2/XDW+Dfb5oKgL3XcgS7ER9UMGizX0zunxCd2ukc/A0zbvaVm/dEXdOReLjHwaTEvWPPueYJ2CDpZ3GR0M2hh1vfFHgUz2bCZlrIOCVQSCAzs5NmWepEfdOdlb6MeEzQsnn578X4nAclxE/LnZv396/jswmFL1g8ijgtdIA83XJNmEuR/opcFrfCam/ogMreCT+sJmVOMe3U6QlNkj7Xt3ljEOBaCUbyRftavZDTzXjRLuHzp/oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EDyhOHnSSI0eU3CG7KUElf1bCePkvnpBTxbzpPGgmUY=;
 b=bqQ5xKXX2I2Ade52Z/UyxJU/qHdJJ3yQn436BeIoGNa0m2HE1AyeeblBPrwb2prA2nZ80s3D2X1LvS/b8uMP/TMfnym3c/eqKgvQd6Wmpxtb2c9/9Pe1axqiqHzI9Y/yE5Y8H48tJiEhrate2bNgvg/OMi/ij93KSfoFWh4VPrAGgYOIThqkKntBxyx/aAFlwl6jtJRCgyhAj09fSPY98c4Nd1wWJTo5E7TtMPrRpdTBfuVqswgN5+DaAiGrXh5bR/+mnxEswqGwtc31v63dr5qTckbzgmxvax3Ge7nBTmO44PYN4L0PAuVNkGj4Xla1sX/HQJq7HUabn0Kl0R9MpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EDyhOHnSSI0eU3CG7KUElf1bCePkvnpBTxbzpPGgmUY=;
 b=yO0w1FRRmCRyxKmKTCN0s57EHTK8D8mL7oPw3fhNGCBFFXPPNTeJG5hl+7hOMSUHVSdWFJO6hIiRhgs1k1i9cWMgbFG9WJjaEirp8acgzakqtRs9eKw192j1oTlZw7jGav33Kyqr9bDsUn7AS8hF/B9gVVarN2gCUWp7G6xsHkE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB4727.namprd10.prod.outlook.com (2603:10b6:510:3f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Wed, 10 Nov
 2021 10:23:44 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517%5]) with mapi id 15.20.4669.016; Wed, 10 Nov 2021
 10:23:43 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 2/8] virtio: add vhost support for virtio devices
Date: Wed, 10 Nov 2021 05:23:06 -0500
Message-Id: <1636539792-20967-3-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1636539792-20967-1-git-send-email-jonah.palmer@oracle.com>
References: <1636539792-20967-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0501CA0112.namprd05.prod.outlook.com
 (2603:10b6:803:42::29) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
Received: from jonpalme-lnx.us.oracle.com (209.17.40.43) by
 SN4PR0501CA0112.namprd05.prod.outlook.com (2603:10b6:803:42::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.5 via Frontend
 Transport; Wed, 10 Nov 2021 10:23:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0a65d82-f6a5-4b36-1140-08d9a4342c3c
X-MS-TrafficTypeDiagnostic: PH0PR10MB4727:
X-Microsoft-Antispam-PRVS: <PH0PR10MB4727095CF4EE57FFB32ACC98E8939@PH0PR10MB4727.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BAN0flc+JuR422WoGmwwQvUHlIg5XMwCgt17EYSpUyHcFFLIgb1bGrGjilxCF71QnW5PCDGhgqWDRwvgAb1nuf0WMxAN3wtKN67DG2TKCOFOKg5Y906P/UjP7epMAD+9LuWWtqe575wp4t1dN4ajjxy67CaOOMAT/yMqM1YgET8k5Wlrt9WT0tRAkR6SUKY6nXe1QUYjzVptBDv0QBs4gNEseGtiLzlf8nk+u5BYCBI5RyMKmkRlnTMcTTP44ozV1fKFXK4pr0A1vQ+eXZcOnNB2BdedP1YAJesiFN54GREZ25lAbFRJFQRuGwzURs9/dPT8/5feNANTPbihj6gu1BWMbR/LqTN24BExGviVzKMBXe1nqq6TF2P8MhLTPCqCWD7Vq8R8WjEPIFT+fhomksWqc2jkjDijewJbl20Ui7AoIEZTVkTWg41cr7/MVBrfeJkJRCrVKGLguw6toraLAYLjAbeeI0xgUTPsmK7s43+4FFlnJfUf/f5c2r/djhepPPzmPRWk1Hs0tOgPJrFyYpqGbvXBIkii9FGXnTGMJt++HrW/XPm3PeAf4Ppf0EWp+V3X8GbJBOjApesIQhz6oxYSL1T+v0MZulQCyZQz7OooHMHN5SLoAr+cEooFpEQBFcGQznbLa012jvLsDK20oVDcdsQbWO7wQKeK/ln1+xL4tym9IPJ2T5i0nGcW78CzDRgk1GfOLz0+pXLjgaSC5A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(30864003)(36756003)(66556008)(8676002)(7416002)(6486002)(66476007)(26005)(5660300002)(66946007)(83380400001)(186003)(4326008)(44832011)(86362001)(7696005)(38100700002)(38350700002)(6916009)(52116002)(2906002)(508600001)(8936002)(956004)(6666004)(2616005)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9qPI6jYgxAyi8KEtKOAcouoWHTMiVYI4in31QahQc+3gvloA43/iyb+ySxnb?=
 =?us-ascii?Q?u63w/D6nMGF3xndva10ipa/gEHZECgCGTNpeJDsGM+EFv8jwEOP+a+brlLOO?=
 =?us-ascii?Q?3ergSCfe50wxCQFG3H4t/4YHD81EuG3dZCgPMT+tykz6RI9aUR5PpKl1g9L5?=
 =?us-ascii?Q?UrkOyeksVon4U5bRsjRwanPTBN6NcYmXhZ9gnxOAM59EZ9JHn76Apk2wCjWZ?=
 =?us-ascii?Q?XPJQfdZo9FLZabaxdEzHVumN21cNxyE+jq6s2n68wZE2XvZW3RyaSGt8CUJt?=
 =?us-ascii?Q?5XlnUuNN0aTxUvSeAUkqYzcg1YtiKJhg4gUz9fUSw8Bfa0AMZYz6qRW319Gn?=
 =?us-ascii?Q?I2ga2TzO97RIFKgAbQ9IzrkDX238KPhLSAL105H7GqbA3n2EBRRPnli4zO3/?=
 =?us-ascii?Q?vo7T2jh10+XvIzUU/ibNnclj0MgJCVpoqho+Rt0GTLuH44fRE5i89O7JmS8V?=
 =?us-ascii?Q?zjIoqQ0ChewIbygLqyGmY4NqXtCm5in1OGqzA0JSTBpmrM6zC2tDE82iA59d?=
 =?us-ascii?Q?uNIo2qLhIzqLvRRLZipCJbZG61YVL1J1pVfOGK/q9GzcSnuFXQWsMe80trZG?=
 =?us-ascii?Q?gDghFaFS+oDIQVOzeZVGlETj1um4KwkyHoE1Q1R7BkbnS4lOdOoTaUJEE0ss?=
 =?us-ascii?Q?tVyNIEeIOOeCb3dk7Dc4xFYvHdLXQCIhoZDhcIKQDub6eI2l8Sq0dVoExWe6?=
 =?us-ascii?Q?swEujbLJFS9bjbYThXve6FkqyFwi2tyPEVZJALFClhgBfikqElIR5NhfP4bx?=
 =?us-ascii?Q?3Kwc3bO190WEyHRi+Vv1Uuwjf6qbb9NH/npOVaRXSdLvo5pchQ30Cefk+hT8?=
 =?us-ascii?Q?CG7TmEmlb319L8TRPa9qfJPa1IHpOeZAZk4EFB7B8U504lonJqMAtMJVayPQ?=
 =?us-ascii?Q?cRwhHkPEe7MSHhX//GcteaH1nDBwNU+WJDR2HzNwLbJAvyuSnwOxwC/chcUQ?=
 =?us-ascii?Q?2OGLRxkLXg7ZzFy8M1uzk+ZgcFYJFnvn1acHxQt5tuX9+4Obi2DIDUG99VN6?=
 =?us-ascii?Q?SN0MifPc1BgbCB+ZceGCPE4ZWr9pdboamhakyYQ06sEz+pDrUMa2hlLIGm39?=
 =?us-ascii?Q?tmNLXjKeUKH51EtteydL8dbmRPSXe/xdqAvD5V664mH84fj/N0CrUks3DdiL?=
 =?us-ascii?Q?wQDcnNBep8mfcQ8jZg29JWm/UAu0b/r/Mn1/uj/evwbiRSIV7J0aj4PM0loa?=
 =?us-ascii?Q?yI/78JGVs5c4drxsm87SpOHbyS2KdhabOMt+C1hzr3733oYOD3lHLOGzm/fI?=
 =?us-ascii?Q?/JYkAQJAEmW/6bGyBo2MgZVfjm0tsTujA4rkUI8rFRBOuhwoRuv8mf7WNzJo?=
 =?us-ascii?Q?I+kVESDkkusZO3Bau1eGj/zCvzvi5CQntjfcdhuZKF29UrhvAG5XI5ZSo8n1?=
 =?us-ascii?Q?umTkz3LjZlcB8Zub0WEvzZyBAe+kI3/HNJDzEaWimvrJAxcc58EydVSD+O9n?=
 =?us-ascii?Q?vEYYQGTloqctCP+Sr2L2AGIR3P0ziLhMaWskcWZeiUSgaMTg1nCYX3GlMixq?=
 =?us-ascii?Q?Lsb9n+4MJ3tRAQOJDsCWthtoNkB7qk6MGVP1OTjwVm/1XOmLQl7qv+W9O301?=
 =?us-ascii?Q?V8PZ9kjU6k2dWF6O9NdhByEQ/YI4mmy0SxXKw0gn1e8pgPN8+R1d1kLXslOO?=
 =?us-ascii?Q?zrQkgj+f/mShWGMxqW/duRU=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0a65d82-f6a5-4b36-1140-08d9a4342c3c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2021 10:23:43.8488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yvUmlPkQSN6tqmJ8OzvN0ea/9KVHH7ANmuAIE1yVOz6YMFkb2/OwyW3ANk57A0C49MnBAi1hoGN4NMFCuN4WjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4727
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10163
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0 mlxscore=0
 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111100056
X-Proofpoint-GUID: 89xipiC_Ku3AMpMZ_eFnT2A28QpHjGnq
X-Proofpoint-ORIG-GUID: 89xipiC_Ku3AMpMZ_eFnT2A28QpHjGnq
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

This patch adds a get_vhost() callback function for VirtIODevices that
returns the device's corresponding vhost_dev structure if the vhost
device is running. This patch also adds a vhost_started flag for VirtIODevices.

Previously, a VirtIODevice wouldn't be able to tell if its corresponding
vhost device was active or not.

Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hw/block/vhost-user-blk.c      |  7 +++++++
 hw/display/vhost-user-gpu.c    |  7 +++++++
 hw/input/vhost-user-input.c    |  7 +++++++
 hw/net/virtio-net.c            |  9 +++++++++
 hw/scsi/vhost-scsi.c           |  8 ++++++++
 hw/virtio/vhost-user-fs.c      |  7 +++++++
 hw/virtio/vhost-user-rng.c     |  7 +++++++
 hw/virtio/vhost-vsock-common.c |  7 +++++++
 hw/virtio/vhost.c              |  3 +++
 hw/virtio/virtio-crypto.c      | 10 ++++++++++
 hw/virtio/virtio.c             |  1 +
 include/hw/virtio/virtio.h     |  3 +++
 12 files changed, 76 insertions(+)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index f61f8c1..b059da1 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -568,6 +568,12 @@ static void vhost_user_blk_instance_init(Object *obj)
                                   "/disk@0,0", DEVICE(obj));
 }
 
+static struct vhost_dev *vhost_user_blk_get_vhost(VirtIODevice *vdev)
+{
+    VHostUserBlk *s = VHOST_USER_BLK(vdev);
+    return &s->dev;
+}
+
 static const VMStateDescription vmstate_vhost_user_blk = {
     .name = "vhost-user-blk",
     .minimum_version_id = 1,
@@ -602,6 +608,7 @@ static void vhost_user_blk_class_init(ObjectClass *klass, void *data)
     vdc->get_features = vhost_user_blk_get_features;
     vdc->set_status = vhost_user_blk_set_status;
     vdc->reset = vhost_user_blk_reset;
+    vdc->get_vhost = vhost_user_blk_get_vhost;
 }
 
 static const TypeInfo vhost_user_blk_info = {
diff --git a/hw/display/vhost-user-gpu.c b/hw/display/vhost-user-gpu.c
index 49df56c..6e93b46 100644
--- a/hw/display/vhost-user-gpu.c
+++ b/hw/display/vhost-user-gpu.c
@@ -565,6 +565,12 @@ vhost_user_gpu_device_realize(DeviceState *qdev, Error **errp)
     g->vhost_gpu_fd = -1;
 }
 
+static struct vhost_dev *vhost_user_gpu_get_vhost(VirtIODevice *vdev)
+{
+    VhostUserGPU *g = VHOST_USER_GPU(vdev);
+    return &g->vhost->dev;
+}
+
 static Property vhost_user_gpu_properties[] = {
     VIRTIO_GPU_BASE_PROPERTIES(VhostUserGPU, parent_obj.conf),
     DEFINE_PROP_END_OF_LIST(),
@@ -586,6 +592,7 @@ vhost_user_gpu_class_init(ObjectClass *klass, void *data)
     vdc->guest_notifier_pending = vhost_user_gpu_guest_notifier_pending;
     vdc->get_config = vhost_user_gpu_get_config;
     vdc->set_config = vhost_user_gpu_set_config;
+    vdc->get_vhost = vhost_user_gpu_get_vhost;
 
     device_class_set_props(dc, vhost_user_gpu_properties);
 }
diff --git a/hw/input/vhost-user-input.c b/hw/input/vhost-user-input.c
index 273e96a..43d2ff3 100644
--- a/hw/input/vhost-user-input.c
+++ b/hw/input/vhost-user-input.c
@@ -79,6 +79,12 @@ static void vhost_input_set_config(VirtIODevice *vdev,
     virtio_notify_config(vdev);
 }
 
+static struct vhost_dev *vhost_input_get_vhost(VirtIODevice *vdev)
+{
+    VHostUserInput *vhi = VHOST_USER_INPUT(vdev);
+    return &vhi->vhost->dev;
+}
+
 static const VMStateDescription vmstate_vhost_input = {
     .name = "vhost-user-input",
     .unmigratable = 1,
@@ -93,6 +99,7 @@ static void vhost_input_class_init(ObjectClass *klass, void *data)
     dc->vmsd = &vmstate_vhost_input;
     vdc->get_config = vhost_input_get_config;
     vdc->set_config = vhost_input_set_config;
+    vdc->get_vhost = vhost_input_get_vhost;
     vic->realize = vhost_input_realize;
     vic->change_active = vhost_input_change_active;
 }
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index b275acf..2449b9c 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3610,6 +3610,14 @@ static bool dev_unplug_pending(void *opaque)
     return vdc->primary_unplug_pending(dev);
 }
 
+static struct vhost_dev *virtio_net_get_vhost(VirtIODevice *vdev)
+{
+    VirtIONet *n = VIRTIO_NET(vdev);
+    NetClientState *nc = qemu_get_queue(n->nic);
+    struct vhost_net *net = get_vhost_net(nc->peer);
+    return &net->dev;
+}
+
 static const VMStateDescription vmstate_virtio_net = {
     .name = "virtio-net",
     .minimum_version_id = VIRTIO_NET_VM_VERSION,
@@ -3712,6 +3720,7 @@ static void virtio_net_class_init(ObjectClass *klass, void *data)
     vdc->post_load = virtio_net_post_load_virtio;
     vdc->vmsd = &vmstate_virtio_net_device;
     vdc->primary_unplug_pending = primary_unplug_pending;
+    vdc->get_vhost = virtio_net_get_vhost;
 }
 
 static const TypeInfo virtio_net_info = {
diff --git a/hw/scsi/vhost-scsi.c b/hw/scsi/vhost-scsi.c
index 039caf2..b0a9c45 100644
--- a/hw/scsi/vhost-scsi.c
+++ b/hw/scsi/vhost-scsi.c
@@ -264,6 +264,13 @@ static void vhost_scsi_unrealize(DeviceState *dev)
     virtio_scsi_common_unrealize(dev);
 }
 
+static struct vhost_dev *vhost_scsi_get_vhost(VirtIODevice *vdev)
+{
+    VHostSCSI *s = VHOST_SCSI(vdev);
+    VHostSCSICommon *vsc = VHOST_SCSI_COMMON(s);
+    return &vsc->dev;
+}
+
 static Property vhost_scsi_properties[] = {
     DEFINE_PROP_STRING("vhostfd", VirtIOSCSICommon, conf.vhostfd),
     DEFINE_PROP_STRING("wwpn", VirtIOSCSICommon, conf.wwpn),
@@ -298,6 +305,7 @@ static void vhost_scsi_class_init(ObjectClass *klass, void *data)
     vdc->get_features = vhost_scsi_common_get_features;
     vdc->set_config = vhost_scsi_common_set_config;
     vdc->set_status = vhost_scsi_set_status;
+    vdc->get_vhost = vhost_scsi_get_vhost;
     fwc->get_dev_path = vhost_scsi_common_get_fw_dev_path;
 }
 
diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
index b875640..e513e4f 100644
--- a/hw/virtio/vhost-user-fs.c
+++ b/hw/virtio/vhost-user-fs.c
@@ -276,6 +276,12 @@ static void vuf_device_unrealize(DeviceState *dev)
     fs->vhost_dev.vqs = NULL;
 }
 
+static struct vhost_dev *vuf_get_vhost(VirtIODevice *vdev)
+{
+    VHostUserFS *fs = VHOST_USER_FS(vdev);
+    return &fs->vhost_dev;
+}
+
 static const VMStateDescription vuf_vmstate = {
     .name = "vhost-user-fs",
     .unmigratable = 1,
@@ -313,6 +319,7 @@ static void vuf_class_init(ObjectClass *klass, void *data)
     vdc->set_status = vuf_set_status;
     vdc->guest_notifier_mask = vuf_guest_notifier_mask;
     vdc->guest_notifier_pending = vuf_guest_notifier_pending;
+    vdc->get_vhost = vuf_get_vhost;
 }
 
 static const TypeInfo vuf_info = {
diff --git a/hw/virtio/vhost-user-rng.c b/hw/virtio/vhost-user-rng.c
index 08bccba..3a7bf8e 100644
--- a/hw/virtio/vhost-user-rng.c
+++ b/hw/virtio/vhost-user-rng.c
@@ -247,6 +247,12 @@ static void vu_rng_device_unrealize(DeviceState *dev)
     vhost_user_cleanup(&rng->vhost_user);
 }
 
+static struct vhost_dev *vu_rng_get_vhost(VirtIODevice *vdev)
+{
+    VHostUserRNG *rng = VHOST_USER_RNG(vdev);
+    return &rng->vhost_dev;
+}
+
 static const VMStateDescription vu_rng_vmstate = {
     .name = "vhost-user-rng",
     .unmigratable = 1,
@@ -272,6 +278,7 @@ static void vu_rng_class_init(ObjectClass *klass, void *data)
     vdc->set_status = vu_rng_set_status;
     vdc->guest_notifier_mask = vu_rng_guest_notifier_mask;
     vdc->guest_notifier_pending = vu_rng_guest_notifier_pending;
+    vdc->get_vhost = vu_rng_get_vhost;
 }
 
 static const TypeInfo vu_rng_info = {
diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
index e8f6249..665a0df 100644
--- a/hw/virtio/vhost-vsock-common.c
+++ b/hw/virtio/vhost-vsock-common.c
@@ -261,6 +261,12 @@ static Property vhost_vsock_common_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+static struct vhost_dev *vhost_vsock_common_get_vhost(VirtIODevice *vdev)
+{
+    VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
+    return &vvc->vhost_dev;
+}
+
 static void vhost_vsock_common_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -270,6 +276,7 @@ static void vhost_vsock_common_class_init(ObjectClass *klass, void *data)
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
     vdc->guest_notifier_mask = vhost_vsock_common_guest_notifier_mask;
     vdc->guest_notifier_pending = vhost_vsock_common_guest_notifier_pending;
+    vdc->get_vhost = vhost_vsock_common_get_vhost;
 }
 
 static const TypeInfo vhost_vsock_common_info = {
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 437347a..96b15a1 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1745,6 +1745,7 @@ int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev)
     /* should only be called after backend is connected */
     assert(hdev->vhost_ops);
 
+    vdev->vhost_started = true;
     hdev->started = true;
     hdev->vdev = vdev;
 
@@ -1821,6 +1822,7 @@ fail_mem:
 fail_features:
 
     hdev->started = false;
+    vdev->vhost_started = false;
     return r;
 }
 
@@ -1850,6 +1852,7 @@ void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev)
     }
     vhost_log_put(hdev, true);
     hdev->started = false;
+    vdev->vhost_started = false;
     hdev->vdev = NULL;
 }
 
diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
index cca5237..7d63b8c 100644
--- a/hw/virtio/virtio-crypto.c
+++ b/hw/virtio/virtio-crypto.c
@@ -961,6 +961,15 @@ static bool virtio_crypto_guest_notifier_pending(VirtIODevice *vdev, int idx)
     return cryptodev_vhost_virtqueue_pending(vdev, queue, idx);
 }
 
+static struct vhost_dev *virtio_crypto_get_vhost(VirtIODevice *vdev)
+{
+    VirtIOCrypto *vcrypto = VIRTIO_CRYPTO(vdev);
+    CryptoDevBackend *b = vcrypto->cryptodev;
+    CryptoDevBackendClient *cc = b->conf.peers.ccs[0];
+    CryptoDevBackendVhost *vhost_crypto = cryptodev_get_vhost(cc, b, 0);
+    return &vhost_crypto->dev;
+}
+
 static void virtio_crypto_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -977,6 +986,7 @@ static void virtio_crypto_class_init(ObjectClass *klass, void *data)
     vdc->set_status = virtio_crypto_set_status;
     vdc->guest_notifier_mask = virtio_crypto_guest_notifier_mask;
     vdc->guest_notifier_pending = virtio_crypto_guest_notifier_pending;
+    vdc->get_vhost = virtio_crypto_get_vhost;
 }
 
 static void virtio_crypto_instance_init(Object *obj)
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index be98b4d..7050bd5 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3289,6 +3289,7 @@ void virtio_init(VirtIODevice *vdev, uint16_t device_id,
 
     vdev->start_on_kick = false;
     vdev->started = false;
+    vdev->vhost_started = false;
     vdev->device_id = device_id;
     vdev->status = 0;
     qatomic_set(&vdev->isr, 0);
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index bfc73ec..105b98c 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -22,6 +22,7 @@
 #include "standard-headers/linux/virtio_config.h"
 #include "standard-headers/linux/virtio_ring.h"
 #include "qom/object.h"
+#include "hw/virtio/vhost.h"
 
 /* A guest should never accept this.  It implies negotiation is broken. */
 #define VIRTIO_F_BAD_FEATURE		30
@@ -102,6 +103,7 @@ struct VirtIODevice
     bool started;
     bool start_on_kick; /* when virtio 1.0 feature has not been negotiated */
     bool disable_legacy_check;
+    bool vhost_started;
     VMChangeStateEntry *vmstate;
     char *bus_name;
     uint8_t device_endian;
@@ -160,6 +162,7 @@ struct VirtioDeviceClass {
     int (*post_load)(VirtIODevice *vdev);
     const VMStateDescription *vmsd;
     bool (*primary_unplug_pending)(void *opaque);
+    struct vhost_dev *(*get_vhost)(VirtIODevice *vdev);
 };
 
 void virtio_instance_init_common(Object *proxy_obj, void *data,
-- 
1.8.3.1


