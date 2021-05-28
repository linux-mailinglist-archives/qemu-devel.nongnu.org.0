Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6813946E7
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 20:17:21 +0200 (CEST)
Received: from localhost ([::1]:42640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmh2u-0003oM-CE
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 14:17:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lmh0J-0001aF-Lo
 for qemu-devel@nongnu.org; Fri, 28 May 2021 14:14:39 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:26440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lmh0G-0007Q4-BK
 for qemu-devel@nongnu.org; Fri, 28 May 2021 14:14:39 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14SIBqcI012061; Fri, 28 May 2021 18:14:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=RZO/PQxJgaUO9HSdzCzvHTYWpsr3sip6Xep6/9JYHek=;
 b=wRbFaq0RA3pCzYcWSinqrDgCbBilaMers7sMddrEeeZLYx116oRVX7L6wNAKriF93pbg
 xn3dG201x0NRjGaOrZe3ybriU6hgPDhSfE3B4y1S2NhrdfY2dY743X04Mvya4djXrqmh
 Z82msMA30CFLoIBYVS9Z6lUtJ/CYTyU5ajwfXrMYRu8a/23o9cFVo7l8+FR47NWG6Wbg
 ugo/llv0JyTH/QAEAOh3R6OeMNKf3ai36CMXdUyrdNRMJAZ8dJB2MyKiEvjvy0TnbyNL
 oUS1cC4WSdt+HdMigexJd2BD6TG0B8fb6SidFG3H4qfZIKyQABMa6kBJTO0QPm27xFxy 9Q== 
Received: from oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 38u31br1qx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 May 2021 18:14:35 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14SIBXbc088913;
 Fri, 28 May 2021 18:14:34 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
 by aserp3030.oracle.com with ESMTP id 38pr0es1jt-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 May 2021 18:14:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O43vUGkzGcnqXZ1J+Sq2bnRUhidT+FwcBp1XJmy0W2PFklvmIRUVbtiNcRQ0XH51J6N+fwtcFGMpfbjQLyHgqsFCQSi2STNvBAsUXogJ18MS8IqttWZTnDuzwKO4mmm02gnFWT/4SA5CLiqExh6M+XdqHex0k90XSewvbzPVcuLpIdfBb466io/T4LIJTVP/CWANqTKCLkbHdWSye1v+UMa+PBEy1znX7rSw3LY/2P1UWJPnwxR8hHNdyfeb5OWK6BHMd/lQpAOKzoaWoXuVcBFVN15YxA+jmhBscJhTNiEEyE2rrlybVEivu6p7NZN07jG/pdnAf8dpWpsswQmFIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RZO/PQxJgaUO9HSdzCzvHTYWpsr3sip6Xep6/9JYHek=;
 b=gcu6M/Dr5sUmP1Za8aCFV+o+KtuFxMZx0BHvyApwbusN7Gz25AR7n2F6Ur9lwWIpzE9rn6a6a6xMKY0dF1+2XhhcG3R37qpnXB9CR+W6IaQiVkhS4YKhxprsjVvMJQ4ZS4Fd1SZMGXxMBy+k/UPCgx7PQ+8aMF91WEDAZ3yqy6g2RG1Lo2cgio0XS9OefaLvGJjokgkFSFEyY72+Pj18W/5UQIGVKmdHUq8X8zuILvO8VabjVnH8Tcz70O/CjlJXCCkXxqUt22KaTJIuqn1tIq5AjhrZCJ7bVLYdGG3LPa9joB2uCeLKIqtAkRJ2BDk/eWTF1Nngi8DU7t7FoUK1BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RZO/PQxJgaUO9HSdzCzvHTYWpsr3sip6Xep6/9JYHek=;
 b=RiLwezZkc4YIm73lkNkQBR2gKTfzUa3e9SR1xQB3JGYfwGABzprnc7O6vAUoJGA8umoTWIvEDGwg7h+hhLOOldyfsuh+Z0Kf8F3Bi5gRKuRfty0kG4redYvCLx6/5QsJWIRFCIowYBrBW/ERDOk6g1zcwWGB487J41CnIAdOTvc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB2045.namprd10.prod.outlook.com (2603:10b6:300:109::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Fri, 28 May
 2021 18:14:33 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc%6]) with mapi id 15.20.4173.024; Fri, 28 May 2021
 18:14:33 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/7] ACPI ERST: include ERST feature in build of ACPI
 support
Date: Fri, 28 May 2021 14:14:16 -0400
Message-Id: <1622225659-16847-5-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1622225659-16847-1-git-send-email-eric.devolder@oracle.com>
References: <1622225659-16847-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-Originating-IP: [138.3.201.23]
X-ClientProxiedBy: SN7PR04CA0201.namprd04.prod.outlook.com
 (2603:10b6:806:126::26) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ban25x6uut23.us.oracle.com (138.3.201.23) by
 SN7PR04CA0201.namprd04.prod.outlook.com (2603:10b6:806:126::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.21 via Frontend
 Transport; Fri, 28 May 2021 18:14:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77818cc3-7508-4b60-bde4-08d922047176
X-MS-TrafficTypeDiagnostic: MWHPR10MB2045:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB2045190B7F573F3D9783FF4497229@MWHPR10MB2045.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J3XIJMcycJYTxPqVbDpJEBhCcnR4OyS8KaChyTuAvL5qjCktWfCxDnIo1blwHoD7tMLxItYuvXOAUAXGZYguJaNlZS4rvmiUnzPvuJtydMzjc3WaW+hWRynWoeeRIufQqQQwoqEGEtHe9E0QR1WIjVraBfsyKLJWSg0baW2qmN7nJPkkjkee/W1QVPyuHDIEES2C++5c2BFF6Kr5PzucxdVxIwSPQO3FuX20tSNL0KWbCRueETLskqwM0ypPGCR57PfpwoxGbO+knTr4RaUC03KGHK3XgBdaAG2RqilVgEVIyZLA9bT2PxClIO6h+JOmsepEdQba73CVL9Wq/oCTyEU6LrcDwxEwIhgkD7M4dOKql7TWSncaymCEToGCYo/Xlrg8HPM3P3pLHa47KZbzde0CuXdHgbQw1pC4azHogmAnpeyb2rBhwhSuv82iliY54JB82NKgxNgF45P+t0r7qDHZJCQyARBnDh/O93/pQb65yYilGry7lV2Zf2KoXlPn7iRrOT2m8t8V9sf7FjvWeaXRFnf3Q4mFh/wh7tO3oBW9SOtql0CBw+Vjjof7Z1mSDvlM2iMwmtVjwd4o3fPxf6vBhj3JSo6lCUidimGllCY1CHn6h5qJ2/VqlJBxQBUbh9LoNbvnSody91eY1SaFRA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(39860400002)(376002)(136003)(366004)(396003)(4744005)(6916009)(38350700002)(956004)(7696005)(38100700002)(52116002)(36756003)(2616005)(8936002)(66556008)(16526019)(186003)(8676002)(478600001)(26005)(66946007)(66476007)(316002)(4326008)(107886003)(2906002)(86362001)(6666004)(5660300002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?U1RPqcpHEpEETOBYnRziaD/YGHzEyOXZsHbpL44aJLRU3w7fepq2PvNKUfF3?=
 =?us-ascii?Q?EFn66wlqYSI95bDVFdGwCKmhy+eaoxbTvmhC2AsckpFgPgNI8DPKbyVgKMJj?=
 =?us-ascii?Q?V6o4WpErLHs9d5vp7JYwqk1bjrogGWAqfI9Df4Zm2+YlgBmMS5OSsATe1Ik7?=
 =?us-ascii?Q?AvPAolURFTwb5Z276M+n1Ryi0QFp/TLwJgGSxg7Je5O8jT1aLsb1uWJZCASG?=
 =?us-ascii?Q?0dthvRLtgLNE/h7VE51GsTihIytkV9J1FxfblRK6KMhZw0s3AGdUJHIxgSjm?=
 =?us-ascii?Q?KAxYSKr4E06pHWG3WDRY4ajCwFkk4ZWhzLIC7ykfNgt14bHMedi59r/vgaeE?=
 =?us-ascii?Q?9TqUwu6IymnAImvEAenzSQrh93sZfMtgIBy+KmJ9e0rwSXPOC0pwDOOxUNV3?=
 =?us-ascii?Q?qdxTA5LP4d/GGJ7dF5aK6FvenyBtyskJ4bzkg9ktWWYTlW5ab2fvaQur8ww2?=
 =?us-ascii?Q?laqsBSRKTaA3N8zTAy3Fb6f8FFIgkW/KCL7T+pAMdBtBBkLUUJwVzPHVA8Pb?=
 =?us-ascii?Q?YabvDIE2xPlhwyXWBBtVbwcMOV+um0+qPHRo1oaOwn4bQILcw0nLEGTQ/g07?=
 =?us-ascii?Q?TIo0g9RpOuTCRB8hSRmpIMyxn9bE0ahh2QOFKsHU8OLvO4kh780iZhGdyI9W?=
 =?us-ascii?Q?XD8dLeuE9uTOaVLTyNT2uGm8uU+9rGRJQGoORwWoWI38CMwfy36JmcZnmeNO?=
 =?us-ascii?Q?t5Vsf7a7b09s9oRRWIz+6qGfumjvaTdUFC3eJ1VVww6QvlxZf2/EIhOzX6JH?=
 =?us-ascii?Q?1gRJgQcnePfiWyFaH2L2H9C4sph6qU2m35P9j0F40d4Ym2e7/KYPyebQ6NvF?=
 =?us-ascii?Q?FFqY38rthx3DHj2kiZU5Rp+fqTV/VgS/mkotwoVugoyTgLEpe1dk/yZe2V0/?=
 =?us-ascii?Q?PX38Ki86VRkxmzhuxJPM9qOpA5IlUd6cA7EfJXgIg620KwRNSybWfP7S39w2?=
 =?us-ascii?Q?VwwDzg392BQHtdmgdvUuvFOQq/xQWAX7Ts13LGapDeeNMLT1ikVJIROmiSSF?=
 =?us-ascii?Q?/IQHJmadCXsJmklaA8OKTmX6dTL3271TN+4u7wTsCh9Zp0zcfHI+gZzzKIR/?=
 =?us-ascii?Q?/AATGNxxdBWRlAcpKBA0KJ91Xhh+2WbXZB4+4SFCv3wE2re34RZT8ohsXM1s?=
 =?us-ascii?Q?64sLL9MvAiaqHnSMqHGdT+eUIxcy7pkdDFOehke3ykp6k7qsYR313uRzIoah?=
 =?us-ascii?Q?J/5oqLHT+PtNE9qRLosk9FH00w60S10HWwGvC0Rupef9KvHobCPqibtzaRKq?=
 =?us-ascii?Q?y8af+9qft1Gv4IdiF8zLwrOlsYSoynn3WMpjghlwMJzXDzanQ7ZsFNGurWpF?=
 =?us-ascii?Q?xvbckIpNyaPz1eC5URwuWC0h?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77818cc3-7508-4b60-bde4-08d922047176
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 18:14:33.1244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a/XRzRtIt4IKsFHbLO2fJsLtq5aAAoT6OyYDqsDaAK4se/Ibvk2D8vDz0MgZHDgR5krn+72rskDdH5DqjXPg4t2a0uav5Q5JxMXfBEEf3oM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB2045
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9998
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105280119
X-Proofpoint-ORIG-GUID: VvJb55Uo2PrnouVq-lZFFpuayIzvyYmj
X-Proofpoint-GUID: VvJb55Uo2PrnouVq-lZFFpuayIzvyYmj
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: ehabkost@redhat.com, mst@redhat.com, konrad.wilk@oracle.com,
 pbonzini@redhat.com, imammedo@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This change includes ERST in the build of ACPI.

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


