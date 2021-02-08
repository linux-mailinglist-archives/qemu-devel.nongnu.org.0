Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAAB314380
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 00:10:17 +0100 (CET)
Received: from localhost ([::1]:47292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Ffc-0000Vj-Nu
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 18:10:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1l9Dc3-0000np-Co
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 15:58:28 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:56754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1l9Dbz-0002k7-J7
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 15:58:26 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 118KuPBg009595;
 Mon, 8 Feb 2021 20:58:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=PUkdIudox1n3NAqeXy3J/sh1lZ+ikVPvNiW5dwu3ih0=;
 b=gQ2X4SpF6peF0AuL70KAopKvIKAWnOVYpmC+ZU0cgSsc2N6/9ICXMrc7mCfjLogLeAU0
 t+/Kk3LDshUdssOC+tKOs4ZM5ylHi8bhgIDRfw/v/9bG9rxShIsind1A5a94xePnNRh/
 8NYaUhZMFbP2l99BNeB6eHCI/sJZzFfyX5H5+I/jyayzeRTmWvi4AlADy+jCeXA9cst5
 Ff7u3/RDbJA9E52R1cEqZTdqHIaNm5bI762w7moSVIQs9Dn4AcMN2DYvoS2bRlGpmxKd
 6V/3bhKlyx/JS5F2TXW21sV7O+GjVMrsLFvFY+KW4DG7kEDjcvGSxNE+APZtTIBOvT9F XQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 36hk2kdc64-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Feb 2021 20:58:21 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 118K5rqi157115;
 Mon, 8 Feb 2021 20:58:21 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
 by aserp3030.oracle.com with ESMTP id 36j4pmtykn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Feb 2021 20:58:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OQbu6iiE+eVcSGZiYOzDj/5gCZr48NBtxhB/3bF+C1/Kj3jCTpPRNgKcrVuB/UV+Rk9BZnrhsyFQCYA/HbY27WyBQJPPFor7P2nJGXLWzXzhEZZVL/kvrwVsywb40ZbTL1eaaR/9lgHqGGvJERtVz6/rSl/5uja7zVR7a2Z/+z+PsLCMy1x6bhetRf5rOpEHxa8GmghP6ru0tGEQmgL+EMyv8oEv+XDcXAS4nE3KPSEFeoTFYAZIA5G1TFFIYusvma1j1hHiaybvJefGIsBhl1DTlDVl2Xu8+ynVPUaZWCw2yn4ui//yoMgW0nk8tnqTz1SEvqRo5LAgFoo28tSehQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PUkdIudox1n3NAqeXy3J/sh1lZ+ikVPvNiW5dwu3ih0=;
 b=WNb3/YPVwo+CIYjI/FJFnVYDtHw+6TEvMJ34b0NH1WjGbFr8aw8tPhSe76J36yMSJ3Z02VsCDJ2o2/rQaia9p/+gCwS0Lr8xPWL2H+77fjCycCtewLQyMMmCnEDpQPLri4w8tg9t78iwmc0NaIf5RKrIO2KrS0XpZjdwtw1fm5eyns9pjtbXOyh7w/nNzpExb3yxlkzVZg15g1k7L282/dt8n1VnZ9gU/tzMIuVYBrKK2swpRPycTUcvHMbkpkXnSvDRGSp7vPqdCbebQQDaB9RBay9sfXhzebO9v8pt2R+BrIDbPkA31C32dlI2HPC5SM6SkCdl7xOUkhj9mOmJDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PUkdIudox1n3NAqeXy3J/sh1lZ+ikVPvNiW5dwu3ih0=;
 b=rIsT1E47YCVtpMCEJYkiU6/3rSEEW6mRCnQq4C54pzVsfNxLwEpNywkwSWE3dcbUwfAA3SBb+GpbQMkyx4HHjtmuSAq/mjqi0rWnk+3y/7sSF6tnKDuwQ8oJKVc/1nWf0XCWKs9u8L8203gYbqB9+hiemcwAmFtUgnm/9lHskcY=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB1599.namprd10.prod.outlook.com (2603:10b6:300:28::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Mon, 8 Feb
 2021 20:58:18 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::1193:5eb7:7993:85a2]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::1193:5eb7:7993:85a2%7]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 20:58:18 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: mst@redhat.com, imammedo@redhat.com, marcel.apfelbaum@gmail.com,
 pbonzini@redhat.com, rth@twiddle.net, ehabkost@redhat.com,
 qemu-devel@nongnu.org
Subject: [PATCH v2 4/7] ACPI ERST: build step for ACPI ERST
Date: Mon,  8 Feb 2021 15:57:56 -0500
Message-Id: <1612817879-21511-5-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1612817879-21511-1-git-send-email-eric.devolder@oracle.com>
References: <1612817879-21511-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-Originating-IP: [138.3.200.23]
X-ClientProxiedBy: BYAPR04CA0024.namprd04.prod.outlook.com
 (2603:10b6:a03:40::37) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ban25x6uut23.us.oracle.com (138.3.200.23) by
 BYAPR04CA0024.namprd04.prod.outlook.com (2603:10b6:a03:40::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.21 via Frontend Transport; Mon, 8 Feb 2021 20:58:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1845e0f-1d95-459b-4385-08d8cc7442c3
X-MS-TrafficTypeDiagnostic: MWHPR10MB1599:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB15992C1EFFB957B2525D511D978F9@MWHPR10MB1599.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X6D38zuaBQqtDvSjdpHgHUtPE9jTBLCm7qYPl84ULngmIq453N1/XRCPExPqykTG/nDK9HjvMPnEv8r89as4KBGK2P2kpSadM8WgaaMmAUvflHjasGZNEKuwtQ7bGfxPohpYtjjoEX8mIhEJaxA+sV3WFiomi7G2kOu6p4KITqGOWwJ4YFfVXL0o3swZJPCIey/SuFnalvMjkyJaMWW49ISTgVopEW9/AvXeJROO+Qh0BK4jRwiBidpYLQj3CU8q8w23PIFPzykGXQEq9nhPWjo3XB1fni/mL8iXinGmR9OwtGozQDGZ6kfR2KdAkzdNBXlOvmwBw5OgKtaOsOcAZ66CC8K9KTjBTBAlGt5qEZgO+8QccLsrMze413RgIrwY8qFHSLVb9MCgOqmDp4nc5m0tdEFR5yrs60RjGUgbp7ZfbEpeKsaI93mrmIDiN0vGXciLfyIaDVCZlYTrTulqor0igSlLRrZcoUtGN1EHRhCBd5qxbzmf72nc1dxeNlfwtKcS/6g1ggdvjKvrMMZAYw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(376002)(396003)(346002)(39860400002)(6666004)(4326008)(316002)(2616005)(52116002)(186003)(86362001)(36756003)(16526019)(956004)(4744005)(5660300002)(478600001)(66476007)(107886003)(8936002)(26005)(66556008)(8676002)(66946007)(6486002)(2906002)(7696005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?IlcwWkS/rKYsG8e4ZyiVgJ03our21Dypw/Jw0Bxhv84NiG5qpUw93TChMEZK?=
 =?us-ascii?Q?u9Q0Ul+7Y47Iawger+JIf0+F3uUFMVq5lsfV3Vg9oB2zvGym6Z0aqTuBKixz?=
 =?us-ascii?Q?xitmQ0W3sGdMKRyHI0T6xSvNfmxnmfnqT6n5+75LbwGcFWCIUNBTFzj88kze?=
 =?us-ascii?Q?vQR6/z2gZGYEfqa4b35cZAERBEi50zphi+BMIKX1bkwMNteOF5GQSAbozet9?=
 =?us-ascii?Q?FfWP86yfveYnwQcX5JnUL7jrbz6WjR0XFWYJuEFBi6LUZPUkfTmzpCRuXNox?=
 =?us-ascii?Q?u2fgpRwLIkFGC5i1LWPUDfhwzu7Dm5tQ46sT5Giz4TzYh1BMS71b8orBKwPr?=
 =?us-ascii?Q?isNSFFpPHOf69t8sSijn5Tuag4rc/StbbCWOzWTlegMES23UoLHGxTc+BA3d?=
 =?us-ascii?Q?3GgvHg8S7TxGdKw3diggb71Kb+qdJpyaXKNikZCDZVVe3KvsCI7EQIXU/xzW?=
 =?us-ascii?Q?vsWVTKTQiXIys5RGnHQy5/30QBragktPbV4EZxkFT1UwgB4oMWNAE1hWSjLP?=
 =?us-ascii?Q?O9acgsLN1GS99RqbhtrhfxmZ2vwfnCrl1NvVFVRwvYb1YUx9VdU2cYMx3mBh?=
 =?us-ascii?Q?dk/Sip/0pBV6WH5fntf3ZoJoC2oscuIyA0FLYRpmiu10XD7TKk/QH61u1oGe?=
 =?us-ascii?Q?hqwP+GPe5xPLp5/mJ5HPzkIWIAGIT5lgu/ZERHhSArtOVEDm3jzjEkYOLfuY?=
 =?us-ascii?Q?vOa882mMfOlSofazuhZp2LEZ3B8zFWr2XfKrPIFntjfpsZs0ZC8WopSYz7PS?=
 =?us-ascii?Q?SIO6J0mxpIURlVA7B69MQ/yMpCwps/yPTJVc4DuTy4cl/kl233M84ip9gMUP?=
 =?us-ascii?Q?Wn/3y9W0BACOW5HZ1f3mJpSKhVKEJvGYA/t5WGpiYg7WLIggSPNNTpnv2vyS?=
 =?us-ascii?Q?wW5arjMdGYYbH7Ayd5WaELqTaXEh+TYqMBJxcbnon8Q0B7ZkpYNqXt6NzDNM?=
 =?us-ascii?Q?ykFXPivkoAAQQ/cIi7vJ1vEAIlCk8Yx/Md7SumTLuYp/aMt+aZIv7mZImXl9?=
 =?us-ascii?Q?IA6W76iwJVvV4arvRIwC42cKHNQzzuaeSXv9hKKkfH9q1aMdcz+wzXlOKc1F?=
 =?us-ascii?Q?1i+HUH+Z/i/8w169SSaTigyIyWd9JziF5x+JxjYsuRsD+IUefg+SctTyTLt1?=
 =?us-ascii?Q?LNbE0/+ihYflL+zchcx/dNb+41x2S0Zhuvi1AaRfqy1LGcHKf/phP0wFUQ+T?=
 =?us-ascii?Q?4YucqFaHP+Umh8DfkiXfCvVUOsCkkd9q8U/bLZ7FzLNPuDnVEX51ItqqKj4G?=
 =?us-ascii?Q?78f2qg62df0G3YlBDdfZ3bJZRAtAWOXjSZb5xN5T5kdDB1ruiYFVkWDnjA8t?=
 =?us-ascii?Q?Z9aSXi8AC6PiQyvO+8dvY0qz?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1845e0f-1d95-459b-4385-08d8cc7442c3
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 20:58:18.3252 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jLVHwPIpHzDrahCFSNUKmnFOAsA7TbRFv4E/xX3A9ZbGn+fQZTYLVXO6Yyc8rXipvxtlCSSbQTJt1xJg98/0YSfXTZxYuZJ6Z/l/21wu1BQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1599
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9889
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102080119
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9889
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102080119
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=eric.devolder@oracle.com; helo=aserp2120.oracle.com
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
Cc: boris.ostrovsky@oracle.com, kwilk@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This change includes ERST in the build of ACPI support.

Signed-off-by: Eric DeVolder <eric.devolder@orace.com>
---
 hw/acpi/meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
index dd69577..262a8ee 100644
--- a/hw/acpi/meson.build
+++ b/hw/acpi/meson.build
@@ -4,6 +4,7 @@ acpi_ss.add(files(
   'aml-build.c',
   'bios-linker-loader.c',
   'utils.c',
+  'erst.c',
 ))
 acpi_ss.add(when: 'CONFIG_ACPI_CPU_HOTPLUG', if_true: files('cpu.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_CPU_HOTPLUG', if_true: files('cpu_hotplug.c'))
-- 
1.8.3.1


