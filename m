Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D106E4702B0
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 15:21:18 +0100 (CET)
Received: from localhost ([::1]:42400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvglx-0001sl-W9
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 09:21:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1mvghe-0005M3-H2; Fri, 10 Dec 2021 09:16:50 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:47130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1mvghc-0000KP-BW; Fri, 10 Dec 2021 09:16:50 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BAE8xvI026532; 
 Fri, 10 Dec 2021 14:16:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=kuWFkhshg/ALlM4BUi4berUgxBFfAyyY7PTCowoK2WM=;
 b=npg08kUU9dYc80qvT3kJEjzc7nrbQ11R8ZqTMBtAjnOCGoI/JpgOGI4BMs4HapVsJxJl
 RxLhDKlM4JG5teqddgFGM59FC++maRlKyVvdEHOT1II2WS+l2W2nZAMXaVWSYUOnBrKj
 Qg6jQtjK+7n7ho7x4rtgOc0sU1hnhxc2gCrpASas6ms1+kT2WQCauGu8waaGoy1o++Xr
 m6CPlsnXyC/vDqyzGe9QAZ8QLj1+NUqtHcuw1t3AJCepU+R3GcD49Hn2We4bTxR+WVwa
 nwn0QK5DAgbH0QijCA2ZAmgdtc3z8N7iOQqbBPjSziGFQeiuncfyTNeH5J8RmES3iie0 Jw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ctse1p5st-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Dec 2021 14:16:38 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BAEGI9H084639;
 Fri, 10 Dec 2021 14:16:38 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
 by aserp3020.oracle.com with ESMTP id 3cr059bf06-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Dec 2021 14:16:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EF3yKHC37AdTgczZjQT+YuFM6v2uMrigwX2lTy4eP+CWFMUuSxu+a170J5/vJeLZfMxxnDMgsvRw+bwuD+AZo99X15+9cHFY1kkTrfi0uekqBD3iqYKWvAvlUL5UmU/rA/zHzklQWO+bqw9R6yg7zs137MMLPuoxYcVIaOLUbQgTYMC4+WOfZxAuGq2UcGiFKFV5OOxAx9ryKp4NlgsDmrmlerC1xTkasrLjmxgGNv7OsrQSBxMY7she/FOC7PPHFNKF0i+pW03AkDvdKSiAAoY4g1FM8Kj/spLnJhEfZHV/ge+YNngsphYIYZR4U2Se7EBk8xax93lPDTWVEhn6kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kuWFkhshg/ALlM4BUi4berUgxBFfAyyY7PTCowoK2WM=;
 b=oTFonJHtog2u+EKF38LdejAjPrRHshx1MB/yC4N+mLmKPTJA++H5DhPmoZ4vx+CHwDPAeYbRJgWEkK3EDWp0kmSVD9XKEJoXXtyfR8dm2zheC9G3QJMSbKygkZJj+1GbIWrBhfFcK8tvQSfBM+HXMiGauURyXsf0rxXMInp4KvaRUKu/vpbhAXYKAeLGlBnZVSgEE2xrg1mUQIqQeqWX3CiSz1k74BWjlrueZV2UMhiYPmchXhfnsKIqrROAvAbwNcTTgdUYarPLz486b8vrV32i964m2pEhy/vdg4Jhv79q7fsYHKiFG5kJUCf8zta5azCoNKJA7TmW/TTmCcm+JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kuWFkhshg/ALlM4BUi4berUgxBFfAyyY7PTCowoK2WM=;
 b=AXpZ8za2k7nfMSEIOjOcfv3NcIvMezeE0wLBlR3GTYSUvp1Rl0iW5bDzfHNb43T34wbZATqUURM+aCCL5BYgqae80hkhsCH1L+R0+pQbk9wIXP24qK9s+/MfnfEQecH+5wQmAOdQG9KoEccRyHoyfEiURxPO4pXI8EwOTCk5bqU=
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by SJ0PR10MB4463.namprd10.prod.outlook.com (2603:10b6:a03:2af::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.25; Fri, 10 Dec
 2021 14:16:36 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::91ce:8d4f:e5d1:c67b]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::91ce:8d4f:e5d1:c67b%6]) with mapi id 15.20.4778.015; Fri, 10 Dec 2021
 14:16:36 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 2/2] scsi/utils: pass host_status = SCSI_HOST_ERROR to guest
 kernel
Date: Fri, 10 Dec 2021 06:16:15 -0800
Message-Id: <20211210141615.2585-3-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211210141615.2585-1-dongli.zhang@oracle.com>
References: <20211210141615.2585-1-dongli.zhang@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0072.namprd04.prod.outlook.com
 (2603:10b6:806:121::17) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65230e0f-f061-458c-4b73-08d9bbe7acb2
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4463:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4463316DD3EB7F29F3821E83F0719@SJ0PR10MB4463.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g97u6YWJZupjaXKTevxF05RgkcxnZNDyvR8+z87SEHG4/YTsHseJKYxrksb4JFGNTYGp+yuJohHTrzyF0RItaXNOWp+IDKqPd2OYFyXV+ZJJeFbuHbpaHo8579sCv2O7q+I+tB9QOoPQ6ms0mi7MfBTmQgV1kPNOjblHYJKvRiyMmb1wjBdwD+ohWENKf2IL/6XZnlV0QOrh3d4unfY2v18bg44kttUR+g+7VsPGI424wn7PAMMhEBvExqA6h5X3pHsTR+8am9EIsovSFv0M8+F3udeduhnqYKfTw0pJ+vuqYOEYHebSRgWPXz+VUFVv+l0ssaeG8xtUVFoayWJpI/ui4kf1GRP8T8Ju6nd+8xTMG/feFzO8pJ/A+1NVf6OEXuDerjmmfCWhC0GumSXdMlMW+JBG0o9uzmZN1U4KkBcn7ftQ7WZhadz8aLR0ii6Q+M0f3OvuqyZb+x700HsRZXLPr2nIHdf/D6fEnvG8uiQd8253NBJ6xjND9SdxTkln/I+IxOLAYY97L1CyoEMS1s6GOIXk1dDAhoFWfbUKOo0fxyEjRMS1I3Rwep6hVDbkdZyfsO0s6gUjIeR5PJQh5+6hOgJZVtXftk5eGpVm766LHTY9opdneAyYoee3DwqAeq1SloBSTucXI3ncGYNFVrMHT2MzgmSgWGxJL+B8PgvMKSD8KsjCBDUQZ7/R9ur2E2R+9XkNaCwa4fuHJPC8zg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2906002)(6666004)(6506007)(36756003)(26005)(2616005)(4326008)(508600001)(107886003)(186003)(52116002)(44832011)(6486002)(38100700002)(1076003)(316002)(8676002)(8936002)(66556008)(66476007)(5660300002)(86362001)(66946007)(38350700002)(6512007)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pYPETsK+B3ouUpBkFCBXC8lTyfx7C7KMSwzE6zh6PC1cI6bQlNa9fLHMQ4WZ?=
 =?us-ascii?Q?1LPt8MgnCyEKytjW22DzwCfNXDL0BP8ReeStlqe+OJqAjfDl7ff0QbLhao5Y?=
 =?us-ascii?Q?/HF0Vw8fQzO1pFgZKRTe6to1f+4MiHFniK31md0DbFYZBDUOkA/lJF2v9zgR?=
 =?us-ascii?Q?h+bzaYRi9OFj3qkM1ZzAsHNl8PoHK0Sot5zL4dx4HtTC8ZMR6TvwxKkixUCF?=
 =?us-ascii?Q?QX4Rmm7RX/pqjk3MMLLbL4gnlJw5+uwal3NitJ6SMhM9hGThVwoW39/P/bvH?=
 =?us-ascii?Q?eVllpYK8Jojs2zQjc8wxI0MPeUYvw7adMPm5JJbUSPN6p4MZwPxgrX+tVkC8?=
 =?us-ascii?Q?j9IrCooE0mTUKkVN+dJ5BsdHgXA6L7tkyBh1/y/uRM0eb4TsOz6g7n/adTDg?=
 =?us-ascii?Q?OyjcoNui/moXoo4tTnemGs6y/EoWc9VqdEH0kCXjhrIcF8Cd0e3407PrYYlL?=
 =?us-ascii?Q?9grbHBrNc49gY1jmvhUnuW8grjcx3oFGF2gsYgpruoi8yrCrdN/WQTzYgxWr?=
 =?us-ascii?Q?UhelMScMwGDDxX2+ECcvVuoe6s9zdcV4w3JQBuVmBwugcEoii59OxwHnukax?=
 =?us-ascii?Q?pYJBz900bKzFSm5E5Fl53Afopk8ZbyDfhydiaDRrnKUiGSLQfFHnp4nmCIph?=
 =?us-ascii?Q?YUVQ5C8PpsntTO7HD3UzNeOdmx3bpOIJgjDAKap62hu6Gb1Rs9amL36e2q/p?=
 =?us-ascii?Q?OUbMhEJTD9d7EhrvZ75CV6ZzFPSRDsWr2nGmSucRXCGnS1jGN7LrAi2wuJOG?=
 =?us-ascii?Q?zWVVdsADs3JNDq6kNrYqbHeGnJc9xqSA+aOG2mI8XiVultvo9+BWXIKsdSQ5?=
 =?us-ascii?Q?7J0Ubo/k3EiFDWFl4lUSa1K4GCv3QEAVPN22nZdWBe5ZH5Wpbg5R3ToxO51j?=
 =?us-ascii?Q?R1jcffPRbl/l1rBHsNrI+ZFm4c8PHWvd+yru+yaqPN/18U/ZKU7HzXWoyVR7?=
 =?us-ascii?Q?LPevplKYSdwzZy3JEqhD4r0siv0hPMWgJhYvp0LfwGKqOpS03JcvFfX1BaJE?=
 =?us-ascii?Q?jEuzTDGOQVq6YVKjrkvnHbcHie4iJ13Q9Rc4VWjKy+eek5cWmW7sk0r2LXIr?=
 =?us-ascii?Q?q0gQvL3mrOQYp9f7OzEL8CYoCCcL8YsKWXTC52oAd++W0R18wRdI7rajRwPw?=
 =?us-ascii?Q?81qvKNANqiIG7IQ0cGHZs94Vd+kEZ22X5MHVFNQ971A87nnz7hUkZradK9kj?=
 =?us-ascii?Q?Ecb+PJstjzWVnfiJL3UIQNPfQMCdvOzhXBFVr/Is+bNHuu0VQfr0iTxFQicY?=
 =?us-ascii?Q?KI7jIDDnVsBzhvtUmbHOHhoCxfAIxpSe9IUlJEgneCoEG2O/h0u/Ptu94Yqr?=
 =?us-ascii?Q?OzxtssRiDHgmsIaQuG6MQqhq7u3wDXMdFKzj4x8ITsqZkjCk13ZwXBCOy13y?=
 =?us-ascii?Q?kOCi/dkPR+nk5SDKJt9aDiStg+2EPRG6hgs4vm4USCDXqzVYSrVYYcBBdava?=
 =?us-ascii?Q?UkUwyqTEsV/UIAltedTOOOMiWLnXFjZ5bFDVJTnTooCg8vHgesxhjP7crN3g?=
 =?us-ascii?Q?E4dPPGiq9/Yq5Nrj4uKW0I1E7Z+SOmmjAALJi7800PB+LoDU8m7IfJ3wNziE?=
 =?us-ascii?Q?Ul7X15ivYKesQtW507nWxdGzxeMzFdXvkR1+hX4YothpFEh+8BR8w/lqAQoc?=
 =?us-ascii?Q?FAOT0+WGwL4P+mZVCZyESgA=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65230e0f-f061-458c-4b73-08d9bbe7acb2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 14:16:36.0872 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ph/m0/hg7RWAurStrYZs5eLj826dUw5I+0EIb3Ni+jjWZPpwfEevEq6i6bdNxicDzMOZ/eRDLMleZMUOPICXqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4463
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10193
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 phishscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112100082
X-Proofpoint-GUID: j5l0qqx4dtQc-3Wp4zO9s1r08n5ftu-c
X-Proofpoint-ORIG-GUID: j5l0qqx4dtQc-3Wp4zO9s1r08n5ftu-c
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=dongli.zhang@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, pbonzini@redhat.com, rui.loura@oracle.com,
 joe.jin@oracle.com, adnan.misherfi@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For scsi_req_complete_failed() and when the req->bus->info->fail() is
implemented, the virtio-scsi passes SCSI_HOST_ERROR to the guest kernel as
VIRTIO_SCSI_S_FAILURE, while the pvscsi passes SCSI_HOST_ERROR to guest
kernel as BTSTAT_HASOFTWARE.

However, the scsi_req_complete_failed()->scsi_sense_from_host_status()
always returns GOOD for SCSI_HOST_ERROR, when the req->bus->info->fail() is
not implemented (e.g., megasas). As a result, the sense is not passed to
the guest kernel.

The SCSI_HOST_ERROR is reproduced on purpose by below QEMU command line:

-device megasas,id=vscsi0,bus=pci.0,addr=0x4 \
-drive file=/dev/sdc,format=raw,if=none,id=drive01 \
-device scsi-block,bus=vscsi0.0,channel=0,scsi-id=0,lun=0,drive=drive01 \

... and when we remove the /dev/sdc from the host with:

"echo 1 > /sys/block/sdc/device/delete"

This patch passes sense_code_IO_ERROR to the guest kernel for
host_status = SCSI_HOST_ERROR.

(This issue is detected by running a testing code from Rui Loura).

Cc: Joe Jin <joe.jin@oracle.com>
Cc: Adnan Misherfi <adnan.misherfi@oracle.com>
Cc: Rui Loura <rui.loura@oracle.com>
Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
---
 scsi/utils.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scsi/utils.c b/scsi/utils.c
index 357b036671..086a1fea66 100644
--- a/scsi/utils.c
+++ b/scsi/utils.c
@@ -638,6 +638,9 @@ int scsi_sense_from_host_status(uint8_t host_status,
     case SCSI_HOST_ABORTED:
         *sense = SENSE_CODE(COMMAND_ABORTED);
         return CHECK_CONDITION;
+    case SCSI_HOST_ERROR:
+        *sense = SENSE_CODE(IO_ERROR);
+        return CHECK_CONDITION;
     case SCSI_HOST_RESET:
         *sense = SENSE_CODE(RESET);
         return CHECK_CONDITION;
-- 
2.17.1


