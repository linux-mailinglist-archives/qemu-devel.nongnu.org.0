Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C1147D7F3
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 20:48:28 +0100 (CET)
Received: from localhost ([::1]:38020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n07b9-0004jz-OE
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 14:48:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07VH-0004ww-NJ
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:42:24 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:16310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07VF-0008LB-FZ
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:42:23 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJXxMZ028487; 
 Wed, 22 Dec 2021 19:42:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=1/HcDuIPgIskB3Y2RaISTDfFGiYao6zJj8o4PM1nRLM=;
 b=FxRNzDbM8GU6ILeyF0p2CFc8ZSLRlK2zi4k1BkfO5YmlxBdLouQe5TrqhGA/Ey7vF6lm
 0e9i3f4zxRFWEG/a7U+qE5PActwU3axzozU7Us7MiePGy/ijx7kXCZFYvpfcMnNGCmQ8
 JI2B6aU/a15OO4Fe53UU56AQd5JortWHeJTzbrncCvxV5LR11oZMnjkiAh5ua8nDfLPf
 dx1zIlzTXaVai9+c9iIXbWYvUYkvDpBxGvqYETb7PKAz3mjZAadup3FqNv03sOQkq0wv
 5Da4BDbiDO3dcXX/x44XfGnMlaTw/J4tQZXaIK7vw/LfXyV9CL1KqCSPGaiFGKy/drYZ ww== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3d410397k0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:42:06 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJfCF0049078;
 Wed, 22 Dec 2021 19:42:05 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
 by aserp3020.oracle.com with ESMTP id 3d17f5rftb-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:42:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MX52Mmm8Jiv6ZY3Ww3ikZ0y2BN5hi3kqek/SRqkFQbNFfvDbfYFLO0jRnVH2gRwL03izQY2qBrNmI9Fs7MG9DqYxi419Br8JI16F3HWBWQJnBka/D+B9RI7lnmCU7Sy1Kmzjq7E3qBMdYr/gV6s9Qm0M/FSQNbF5XM2hCT+TfyEHYtEP/huzUYJ5As4X5dflM2du+UhSuDPt3n/v5HeV0Y44TU1zzhF8uQrYs2DCO/0FGHKy/JzkFngpSLNd+T6PUa6fkw9wf2nq34Gv6EgF2gDavN+iDi8ztuSonGHZ1axa33DfaliIviVZw3t6ylWRcdgZX7MT/H7omS2VcaIBVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/HcDuIPgIskB3Y2RaISTDfFGiYao6zJj8o4PM1nRLM=;
 b=mHijRg8JTQQuG3/7bJCcyq3IIRSVRUjFzLMF450jJnSLtZPgnNKVBlXBkACDDsnYk/MRx3F3RrNGi06h3jrWeKZYWEPExORXLS7AvgvL1EaWDlAKP2/NFZhApPNP+yGXVev0cmdkybDc7mrAUzcM1XRkgzRWJZNPQP0fsmmFp0PoaeAGVpbEv4BOSO+zY9Syn3A19ZZUKMsuW+/m3gN//RGr2l4tF52WTemf1EE9mt7LfwRBCnokcJ3MmzBKUazWWZAoxF+LPvBT8UxZgN/vkeKPhgspFgqJqiMuOV2kRsrvrCwYfeBV7M037b+znqzyQMmmMsg25Ksk2oxraw8naw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/HcDuIPgIskB3Y2RaISTDfFGiYao6zJj8o4PM1nRLM=;
 b=pN3geOqVaHK1XxzDlQoacHljzQLlpuF1dAusEvjJzbZKIDaGJmIIKyC3T21yVTgG2eAB8N9NbzHmxEvo609vEyO2rtWz8SMfCCPFXnHI2v8N4XzXO8qbyz0x9VOqJcTBjM3zZoMRU2SjeTokfidJPqHGwi1b8o7GAeBemcdhVIU=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BY5PR10MB3746.namprd10.prod.outlook.com (2603:10b6:a03:1b5::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.16; Wed, 22 Dec
 2021 19:42:01 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623%4]) with mapi id 15.20.4801.020; Wed, 22 Dec 2021
 19:42:01 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V7 13/29] cpr: preserve extra state
Date: Wed, 22 Dec 2021 11:05:18 -0800
Message-Id: <1640199934-455149-14-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0196.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::21) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a1ae158-2d9b-4cc6-2513-08d9c5831fca
X-MS-TrafficTypeDiagnostic: BY5PR10MB3746:EE_
X-Microsoft-Antispam-PRVS: <BY5PR10MB37462D3E350976526889FE27F97D9@BY5PR10MB3746.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:341;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IPhyKQ3X3hrQTXgwVp8mym9Avw/cd9chvLEjzvqrwOjeYwdD1AisfMy0d9GG0maXoR+e+6ggiVC5ZJrIFMn4ElDYH45aiJygeffe3LTQbq1HYkfE2Pu00nl1spwp6KKPqSqq6v3lZlA7xRaBRMdsgYr8N1S5vM4i3R+FsitTpIzPtA0qpInniXjBGGF0MP9dbLb7OzH6mAP59Q3eKe/ooCwORCfnXwKbb/KcN/q6fFsn0/BeFHK32/kyMT8pblFg1d5xzHUb4mch5lVBV9zdmtRJsioP0YS3UxnDF1COW7AhoonPVsejYF5c37lEoTPDvnP6Po/t9YWeQoR7H2LLuSPTgNJA6QD/WsDKnxezX/lU0BBfHQgWfzQbcyEO3nwKiF/b7vB9b0VkbOfv5Fq5ezTcKQfiMpS+ebR9bj4nXJmWELlpFRwjdksN0uxUxlEs4eB9UCPvJoxf1Z0H+NSZQEcMM+2On03AU5p2CkmEFRWOa76w2+fbbHrutcoxqfP1zQ177QZxsvyDVP5KfOHkwPsl3LI6ikiHUgSy+OJ+zvCE93TO7+Kx80+lFn/1TFMdrrrHaZijc8MsbbWIdzG9WPBiGS9mpr5fDuN4YUiCLIbjmotRAuPMNA7SXwxiP7qU5eg7k5xF0J10Q9WJresryeLkHo2+kdj3p42DwiyeoIU+KwFeYC/fh0IJYW1/I46mXFIUSM4FKCDZ7Ve+2SvE+Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(66946007)(66476007)(508600001)(83380400001)(38350700002)(38100700002)(4326008)(2616005)(52116002)(107886003)(5660300002)(36756003)(186003)(2906002)(8936002)(7416002)(8676002)(6486002)(26005)(86362001)(54906003)(6666004)(6916009)(6512007)(316002)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NV+jqqUzfvzZWMbJhsuXQwPj63HLiT3QuaG2dh9yR2M5dthgteLNZAV8+yFE?=
 =?us-ascii?Q?M9++aKEjTau1u7PSfJKw7bDrSrJa82Z2mgdyd5GDSdfWJTp9AHeEPvBXVe91?=
 =?us-ascii?Q?xyh9yZve3wXJCaIK/rlDOH0y2R20cY9rZfemPYj2WLGNFqfprOxJr1cGoLhB?=
 =?us-ascii?Q?UyOTRfT4+27uRpmbvg4D47f2rM8HW02ms0/I7qGXvxjohrLmGYoWmF5dWBeW?=
 =?us-ascii?Q?6K4Pb2ft0Wp1h9cIHPPf95t9RmcjzLWquBcrUQ8AyrzC3+SLfCVgaTUH2kL5?=
 =?us-ascii?Q?vvyfJW4PZSyP63heTDgjC5TL7TWsbiCL15A7Ap5Cj01A3jIaA2BTAdc3S3/x?=
 =?us-ascii?Q?NCuqr9bXGAXwJe3GPb2iV+ZXICoAT4pExZJqgg469s9AgVJj4/Qc2Nw3/sMC?=
 =?us-ascii?Q?PgS3C3k1fYToT9/QL2wD2wMljTfdeMUqlbA8X+3cgkjVMuP2VhxLCCKJZgoW?=
 =?us-ascii?Q?QfvJ7XqADHsW/nj5L7umluKQ6oHMzo4pBkl/Ky0sqbKdVLqC34ni5qvfCq4u?=
 =?us-ascii?Q?RPJ4k6P/DSFY2n1z1YyLBVS7INMdDke5MdHxhrcJ/0hwBwQG/n1lUn18DULp?=
 =?us-ascii?Q?qKTsIge9E7rhZxwYZd8r9IDdV2YGjlY7eVbqQWdnULwPsF4JgI7bDWorGe0C?=
 =?us-ascii?Q?FcnqTBeZdKed30y4Nr5l/NVRGKB/scYe7TakRSf7cheD/B5VZDcJvprkxX5q?=
 =?us-ascii?Q?L5yJyk40CrYBsOlGpAd7UnfsCxpG3acIgzh1EYQFuB3TEjWa6dtxGijzPyBD?=
 =?us-ascii?Q?7V7Vm1imPnmx03dYM6bM0bBB+6AVkZn9HeGHG1n5BSvnCfbxN2TfNKMrQjt7?=
 =?us-ascii?Q?xyB1IX9mmVpSbmGPAU1x1NCHPHLCNsyC8mP/uuxFTCUHslVhsNVgg/ub+tIv?=
 =?us-ascii?Q?Pp/aHf9lvn3t3NQurrFgJhnlRJnqfwP8RNBRgsbv3Wx47gYe4BRwhIUenW8Q?=
 =?us-ascii?Q?j4kg3rY9olkhc5zCQMnOuvpq+nmCEkgydLONc5I/nWJptFcA6qH20mZAW4bG?=
 =?us-ascii?Q?wCwkKNccszOAoiKCs7RjwR8nQaXlo9qLRAisArtQKGO+KWxwgsXAqtxaXEnJ?=
 =?us-ascii?Q?V6AbDCZ2leTjcoh92MZX0AZqOiga4s9q7G3SxRbdV65wxeVBsCAKZRSQE6m6?=
 =?us-ascii?Q?0YcIWT5x5dKPQV9G3pjaX8Q6kNvEh59IFWZfBX0+A1FfdDVdraIuTdh7TMwO?=
 =?us-ascii?Q?5J5BpPtWSUqworPXbZ1yRF8r266CJ24wX5Cee7NW2mJyOyc1EZ1OIcOpevtQ?=
 =?us-ascii?Q?I00DqXacj8OTLjC32XuL8VRsKVTP3WopC/rCA3Wg7qEURfQuEGPib0ve9CL+?=
 =?us-ascii?Q?nO1ZazicamSiGyOxCj3cb0PqschprS8Yh5A6fRVz4w1RtzumP7XXFWWur454?=
 =?us-ascii?Q?thTtlt7N5AHDKYXe16/KEFxcAREA7qaddFVXdEkTfFqZ34f/mFoHd15dFxQ1?=
 =?us-ascii?Q?hocet17HQPCT/zw9auYJnomfxwh9wu2Ix4fvFdUYEUvaj3b8BbMYcB90ny0V?=
 =?us-ascii?Q?91gQPYgX9VP6Tw4KWQoV8+c1CPOxXw8kLwCLvA0GuK9lqoZrFDcuh4PBiPBr?=
 =?us-ascii?Q?spMlXiCVlFAzZeX7xxGA9ZdX2hK4LSGtwCo/smqZA3Q/IbsanNXKRLH8PfKQ?=
 =?us-ascii?Q?hnucG280s6ZQtSvs4uHKXbebYqmXjwBsqvc2b4IQtClkr7QOXEwNEEuFAhpA?=
 =?us-ascii?Q?kzVj9Q=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a1ae158-2d9b-4cc6-2513-08d9c5831fca
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 19:42:01.5458 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KNocGORCaGSW7vFZ14RgQDGdsdL2aLSwQuHTVEBqhBi7crgKr1cDjR9Ntxsa/4P602tQXm7vw3nCakTQ8OVkGMcG49tqAo77PHvAU+2g1Tk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB3746
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10206
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=979
 malwarescore=0
 spamscore=0 phishscore=0 mlxscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112220107
X-Proofpoint-ORIG-GUID: FXdByisw4r-QZM77nRSxZXOL9Tdq9nWW
X-Proofpoint-GUID: FXdByisw4r-QZM77nRSxZXOL9Tdq9nWW
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

cpr must save state that is needed after qemu is restarted, when devices are
realized.  Thus the extra state cannot be saved in the cpr-load vmstate file,
as objects must already exist before that file can be loaded.  Instead,
define auxilliary state structures and vmstate descriptions, not associated
with any registered object, and serialize the aux state to a memfd file.
Deserialize after qemu restarts, before devices are realized.

Currently file descriptors comprise the only such state, but more could
be added in the future.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 MAINTAINERS             |   2 +
 include/migration/cpr.h |  13 ++-
 migration/cpr-state.c   | 228 ++++++++++++++++++++++++++++++++++++++++++++++++
 migration/meson.build   |   1 +
 migration/trace-events  |   5 ++
 stubs/cpr-state.c       |  15 ++++
 stubs/meson.build       |   1 +
 7 files changed, 264 insertions(+), 1 deletion(-)
 create mode 100644 migration/cpr-state.c
 create mode 100644 stubs/cpr-state.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 3c53b0d..cfe7480 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2995,6 +2995,8 @@ S: Maintained
 F: include/migration/cpr.h
 F: migration/cpr.c
 F: qapi/cpr.json
+F: migration/cpr-state.c
+F: stubs/cpr-state.c
 
 Record/replay
 M: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
diff --git a/include/migration/cpr.h b/include/migration/cpr.h
index 0f27b61..a4da24e 100644
--- a/include/migration/cpr.h
+++ b/include/migration/cpr.h
@@ -12,6 +12,17 @@
 
 #define CPR_MODE_NONE ((CprMode)(-1))
 
-static void cpr_set_mode(CprMode mode) {}   /* no-op until a later patch */
+void cpr_set_mode(CprMode mode);
+CprMode cpr_get_mode(void);
+
+typedef int (*cpr_walk_fd_cb)(const char *name, int id, int fd, void *opaque);
+
+void cpr_save_fd(const char *name, int id, int fd);
+void cpr_delete_fd(const char *name, int id);
+int cpr_find_fd(const char *name, int id);
+int cpr_walk_fd(cpr_walk_fd_cb cb, void *handle);
+int cpr_state_save(Error **errp);
+int cpr_state_load(Error **errp);
+void cpr_state_print(void);
 
 #endif
diff --git a/migration/cpr-state.c b/migration/cpr-state.c
new file mode 100644
index 0000000..42465f8
--- /dev/null
+++ b/migration/cpr-state.c
@@ -0,0 +1,228 @@
+#include "qemu/osdep.h"
+#include "qemu/cutils.h"
+#include "qemu/queue.h"
+#include "qemu/memfd.h"
+#include "qapi/error.h"
+#include "migration/vmstate.h"
+#include "migration/cpr.h"
+#include "migration/qemu-file.h"
+#include "migration/qemu-file-channel.h"
+#include "trace.h"
+
+/*************************************************************************/
+/* cpr state container for all information to be saved. */
+
+typedef QLIST_HEAD(CprNameList, CprName) CprNameList;
+
+typedef struct CprState {
+    CprMode mode;
+    CprNameList fds;            /* list of CprFd */
+} CprState;
+
+static CprState cpr_state = {
+    .mode = CPR_MODE_NONE,
+};
+
+/*************************************************************************/
+/* Generic list of names. */
+
+typedef struct CprName {
+    char *name;
+    unsigned int namelen;
+    int id;
+    QLIST_ENTRY(CprName) next;
+} CprName;
+
+static const VMStateDescription vmstate_cpr_name = {
+    .name = "cpr name",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(namelen, CprName),
+        VMSTATE_VBUFFER_ALLOC_UINT32(name, CprName, 0, NULL, namelen),
+        VMSTATE_INT32(id, CprName),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void
+add_name(CprNameList *head, const char *name, int id, CprName *elem)
+{
+    elem->name = g_strdup(name);
+    elem->namelen = strlen(name) + 1;
+    elem->id = id;
+    QLIST_INSERT_HEAD(head, elem, next);
+}
+
+static CprName *find_name(CprNameList *head, const char *name, int id)
+{
+    CprName *elem;
+
+    QLIST_FOREACH(elem, head, next) {
+        if (!strcmp(elem->name, name) && elem->id == id) {
+            return elem;
+        }
+    }
+    return NULL;
+}
+
+static void delete_name(CprNameList *head, const char *name, int id)
+{
+    CprName *elem = find_name(head, name, id);
+
+    if (elem) {
+        QLIST_REMOVE(elem, next);
+        g_free(elem->name);
+        g_free(elem);
+    }
+}
+
+/****************************************************************************/
+/* Lists of named things.  The first field of each entry must be a CprName. */
+
+typedef struct CprFd {
+    CprName name;               /* must be first */
+    int fd;
+} CprFd;
+
+static const VMStateDescription vmstate_cpr_fd = {
+    .name = "cpr fd",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_STRUCT(name, CprFd, 1, vmstate_cpr_name, CprName),
+        VMSTATE_INT32(fd, CprFd),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+#define CPR_FD(elem)        ((CprFd *)(elem))
+#define CPR_FD_FD(elem)     (CPR_FD(elem)->fd)
+
+void cpr_save_fd(const char *name, int id, int fd)
+{
+    CprFd *elem = g_new0(CprFd, 1);
+
+    trace_cpr_save_fd(name, id, fd);
+    elem->fd = fd;
+    add_name(&cpr_state.fds, name, id, &elem->name);
+}
+
+void cpr_delete_fd(const char *name, int id)
+{
+    trace_cpr_delete_fd(name, id);
+    delete_name(&cpr_state.fds, name, id);
+}
+
+int cpr_find_fd(const char *name, int id)
+{
+    CprName *elem = find_name(&cpr_state.fds, name, id);
+    int fd = elem ? CPR_FD_FD(elem) : -1;
+
+    trace_cpr_find_fd(name, id, fd);
+    return fd;
+}
+
+int cpr_walk_fd(cpr_walk_fd_cb cb, void *opaque)
+{
+    CprName *elem;
+
+    QLIST_FOREACH(elem, &cpr_state.fds, next) {
+        if (cb(elem->name, elem->id, CPR_FD_FD(elem), opaque)) {
+            return 1;
+        }
+    }
+    return 0;
+}
+
+/*************************************************************************/
+/* cpr state container interface and implementation. */
+
+#define CPR_STATE_NAME "QEMU_CPR_STATE"
+
+static const VMStateDescription vmstate_cpr_state = {
+    .name = CPR_STATE_NAME,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(mode, CprState),
+        VMSTATE_QLIST_V(fds, CprState, 1, vmstate_cpr_fd, CprFd, name.next),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+int cpr_state_save(Error **errp)
+{
+    int ret, mfd;
+    QEMUFile *f;
+    char val[16];
+
+    mfd = memfd_create(CPR_STATE_NAME, 0);
+    if (mfd < 0) {
+        error_setg_errno(errp, errno, "memfd_create failed");
+        return -1;
+    }
+    qemu_clear_cloexec(mfd);
+    f = qemu_fd_open(mfd, true, CPR_STATE_NAME);
+    if (!f) {
+        error_setg(errp, "qemu_fd_open %d failed", mfd);
+        return -1;
+    }
+
+    ret = vmstate_save_state(f, &vmstate_cpr_state, &cpr_state, 0);
+    if (ret) {
+        error_setg(errp, "vmstate_save_state error %d", ret);
+        return ret;
+    }
+
+    /* Do not close f, as mfd must remain open. */
+    qemu_fflush(f);
+    lseek(mfd, 0, SEEK_SET);
+
+    /* Remember mfd for post-exec cpr_state_load */
+    snprintf(val, sizeof(val), "%d", mfd);
+    g_setenv(CPR_STATE_NAME, val, 1);
+
+    return 0;
+}
+
+int cpr_state_load(Error **errp)
+{
+    int ret, mfd;
+    QEMUFile *f;
+    const char *val = g_getenv(CPR_STATE_NAME);
+
+    if (!val) {
+        return 0;
+    }
+    g_unsetenv(CPR_STATE_NAME);
+    if (qemu_strtoi(val, NULL, 10, &mfd)) {
+        error_setg(errp, "Bad %s env value %s", CPR_STATE_NAME, val);
+        return 1;
+    }
+    f = qemu_fd_open(mfd, false, CPR_STATE_NAME);
+    ret = vmstate_load_state(f, &vmstate_cpr_state, &cpr_state, 1);
+    qemu_fclose(f);
+    return ret;
+}
+
+CprMode cpr_get_mode(void)
+{
+    return cpr_state.mode;
+}
+
+void cpr_set_mode(CprMode mode)
+{
+    cpr_state.mode = mode;
+}
+
+void cpr_state_print(void)
+{
+    CprName *elem;
+
+    printf("cpr_state:\n");
+    printf("- mode = %d\n", cpr_state.mode);
+    QLIST_FOREACH(elem, &cpr_state.fds, next) {
+        printf("- %s %d : fd=%d\n", elem->name, elem->id, CPR_FD_FD(elem));
+    }
+}
diff --git a/migration/meson.build b/migration/meson.build
index fd59281..b79d02c 100644
--- a/migration/meson.build
+++ b/migration/meson.build
@@ -16,6 +16,7 @@ softmmu_ss.add(files(
   'colo-failover.c',
   'colo.c',
   'cpr.c',
+  'cpr-state.c',
   'exec.c',
   'fd.c',
   'global_state.c',
diff --git a/migration/trace-events b/migration/trace-events
index b48d873..35b4627 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -312,6 +312,11 @@ colo_receive_message(const char *msg) "Receive '%s' message"
 # colo-failover.c
 colo_failover_set_state(const char *new_state) "new state %s"
 
+# cpr-state.c
+cpr_save_fd(const char *name, int id, int fd) "%s, id %d, fd %d"
+cpr_delete_fd(const char *name, int id) "%s, id %d"
+cpr_find_fd(const char *name, int id, int fd) "%s, id %d returns %d"
+
 # block-dirty-bitmap.c
 send_bitmap_header_enter(void) ""
 send_bitmap_bits(uint32_t flags, uint64_t start_sector, uint32_t nr_sectors, uint64_t data_size) "flags: 0x%x, start_sector: %" PRIu64 ", nr_sectors: %" PRIu32 ", data_size: %" PRIu64
diff --git a/stubs/cpr-state.c b/stubs/cpr-state.c
new file mode 100644
index 0000000..24a9057
--- /dev/null
+++ b/stubs/cpr-state.c
@@ -0,0 +1,15 @@
+#include "qemu/osdep.h"
+#include "migration/cpr.h"
+
+void cpr_save_fd(const char *name, int id, int fd)
+{
+}
+
+void cpr_delete_fd(const char *name, int id)
+{
+}
+
+int cpr_find_fd(const char *name, int id)
+{
+    return -1;
+}
diff --git a/stubs/meson.build b/stubs/meson.build
index 71469c1..9565c7d 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -4,6 +4,7 @@ stub_ss.add(files('blk-exp-close-all.c'))
 stub_ss.add(files('blockdev-close-all-bdrv-states.c'))
 stub_ss.add(files('change-state-handler.c'))
 stub_ss.add(files('cmos.c'))
+stub_ss.add(files('cpr-state.c'))
 stub_ss.add(files('cpu-get-clock.c'))
 stub_ss.add(files('cpus-get-virtual-clock.c'))
 stub_ss.add(files('qemu-timer-notify-cb.c'))
-- 
1.8.3.1


