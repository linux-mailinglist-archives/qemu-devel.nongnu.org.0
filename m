Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A88335186BA
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 16:32:34 +0200 (CEST)
Received: from localhost ([::1]:43660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nltZp-0004GN-M6
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 10:32:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nltLt-0001bl-Ch
 for qemu-devel@nongnu.org; Tue, 03 May 2022 10:18:09 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:38822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nltLq-0001RU-UL
 for qemu-devel@nongnu.org; Tue, 03 May 2022 10:18:09 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 243DAHcD019339;
 Tue, 3 May 2022 14:17:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=///lrZXZWqHcbD1GL0YEEYdYTKaDn4rh06gGgGd9UVE=;
 b=sUWkrIORa85FPvSI+NvV5vQS1VGRBriHFqtIxFHQ+du//vjW43g3nrwwYu0SJ0X2DLCl
 wQ+5I2APslgm25B1Q3q7IAUAQofTmatAVFfblhCMuXhCPn3LiBJGLB6ZQ7kfn6Hy8zSs
 T5KVQK7IBhCFhXdNjh4+7g6Iw4AXtHs+FN3rpuCj4wmHWA2RqDSDx4cVy9I+d5/OYBE+
 FJuHDI11AEcxyQv4Bcw7EuOhSNdCtkI2cNOzQr+1donoGZyV2ki9btN1C9q4Tkrg+dDA
 G4xMdZUhFeHU5zUAc4IDS9aCIDfboZAhuVGQB1WS76Hgo4LYWYkhGquwvV8hPYp4ohVD 3g== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3frwnt5ryw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 May 2022 14:17:52 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 243EFNum019043; Tue, 3 May 2022 14:17:52 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2042.outbound.protection.outlook.com [104.47.56.42])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3fruj2eaux-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 May 2022 14:17:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H1fN8HPoiloF8ScfriQr+yLU6r0gH/Bu+zl25IOsoF83o7rJIg+E6WNaE/IYTpiB0Bz54Kz3AeqtQ61ZdAUjIVL1crPCPYgqi3FofGD6ei+LjK3X2Ce8fr6FvxPMwJarZlh51XPwAS/DkLbHkaVMIRG5Otv38nEikdyFUnolj1MVNUrGJjuEkk68XRjvo1XGOX3tUqTq215oh3E1RZYdqV2Hetgeokq1NKKCOPj9gAl8k84zWa+YKSK3O4rkHtL5wW/Yr5i1P+m+OImN9tAALkmwhDHbyzq0MIQ9xhfDrDm0Ja9SOUxMitDpvMuvCiFmxpqc5czsa1k466m6ugf3GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=///lrZXZWqHcbD1GL0YEEYdYTKaDn4rh06gGgGd9UVE=;
 b=YtidafnD3whVLCkAjZFq4hsJ3qSsQJwohr1IuC07Ai81tpPtpgRIMzsYs2tja8YbDd6TM9uni9ybKvx/zqjwptwgO0nS2NoJT5VJYj43QHEU1GG3JgZwZAOcbrWmL1K0thvRFU9bYoN+yNpxPrSIQjPaz5RPFo2o+2wdgldU93wSf2UlKzO7GM4PnvuDz16XOpN6/7m/wUO4qv2QIiWBuAvfZDbYrwGJ/I8bhO0KjXICtSH4/oF1wmUvRxEIE4PV2JNeF0QNHkESECT1Lq1G2jH1q3UaRadWB9GvkrAMD/mvsOMdi7YlZyggZbgAjmYpyfitwvlf7gLuPHP32W1vXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=///lrZXZWqHcbD1GL0YEEYdYTKaDn4rh06gGgGd9UVE=;
 b=EbySnOkHgq1VEEAO7+oCLX3bDh4A7f0EQvtAoM5875cMe03GACzTNGcl8H05w6vZZ9P7T5JeoHS5GRDzbkEmwoOiH4JDCExteVnsKL7x5XzdRoL1Dc30tvYQK16NJrErrb6IFut0/1c1+JdXB7TCzlTEX/XSbgSsNKTsbdHo6A0=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BYAPR10MB2983.namprd10.prod.outlook.com (2603:10b6:a03:83::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Tue, 3 May
 2022 14:17:49 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5206.013; Tue, 3 May 2022
 14:17:48 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, mst@redhat.com, f4bug@amsat.org, pbonzini@redhat.com, 
 marcandre.lureau@redhat.com, thuth@redhat.com, bleal@redhat.com,
 berrange@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, quintela@redhat.com,
 dgilbert@redhat.com, imammedo@redhat.com, peterx@redhat.com,
 john.levon@nutanix.com, thanos.makatos@nutanix.com,
 elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 kanth.ghatraju@oracle.com, jag.raman@oracle.com
Subject: [PATCH v9 17/17] vfio-user: avocado tests for vfio-user
Date: Tue,  3 May 2022 10:16:58 -0400
Message-Id: <fed0fbe8ee48383f6a018bf9eacd8a7258e2201d.1651586203.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1651586203.git.jag.raman@oracle.com>
References: <cover.1651586203.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9PR11CA0005.namprd11.prod.outlook.com
 (2603:10b6:806:6e::10) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50f57c8d-953a-4e48-29d0-08da2d0fb35e
X-MS-TrafficTypeDiagnostic: BYAPR10MB2983:EE_
X-Microsoft-Antispam-PRVS: <BYAPR10MB29833831558F34DFC843920190C09@BYAPR10MB2983.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c8cJOzirv8KU6dYa3UCgnRre9Y5m5RsUs+22mbP1TATp7Wnj42wF2kls8maq8ILwFhtC++vaS7+UZ8t2GbgfvEU+nfUrgvIRekrqhBhItL2Swxu1ueGlDDbxXaN/JR/V2fPQHTktn7sS+lNLsJ29MlWWz2ck874MGhRKIxRf2cLES7rBPli16W4+afZN3gS6byLYy1xSotyBEZF518qy1LJaXYNvxbIm8Q3KBacicyduON9cEgpUGXf3xPLJqFVf1hHf3kTR4VZ1NmvCa/Uu6Y8FAiZFYUZETQ4aSeza+BR1eu/YUdNQT784oMaxManZ5bHg9y+/WL/WxLdula2TcB9cQESjThpa9rL7WnlZxZ308sBZ0ElTyNKeNrZ/0s0F44SJ6RS2dnHm260DwM5pUan8x4MUwV4vqoeN+WedRzX3ASANQO5d67q09wjVNrHHAtOR1FzvLXsBkYxozztc1hhsf6pqZQrxeTY4LBgiUwN9sc5EV3BBwDlV3Tvs/PqLBEOlqVYeQAefkzQqgmYfdfWziwz2t86rHQbyGfebrk2Q0gMEne8LSAUjL5EMC3NsZjrMEbCpp+fbyzl03DUs7TJ+ti10CCNjL6gQVl5Nq6dx5kNAiO/izY0YnyzSlyEVXUyk3P0wakslKPsitCoDI0KI3XklrD4P3Lv4LyY2HTuuWiUkSRRd+5uYXqDxXSA5NOhx1Ds1/qWocQ3QfWc2IVakxXjO6WvruFdySeJb8yAMXYMEiZi5cCf5rfIdH/fX2HLZM4B72u5/HSJiFq4T2PZu0HUwbs07iLHGTTCo2is=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(6666004)(6506007)(52116002)(316002)(6916009)(2616005)(186003)(26005)(36756003)(2906002)(8676002)(38350700002)(38100700002)(4326008)(66946007)(86362001)(66556008)(8936002)(66476007)(5660300002)(7416002)(508600001)(6486002)(83380400001)(107886003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B2sYrw2LeSkZaP8tDKIiCrthkWihXLQ1cPDv1f9KlLoS3uQ7vQLhm05r6N0G?=
 =?us-ascii?Q?y0gqv+cxfGhLKChdloiwj2pAGOcdjAWflcU01+e5dp+BLOTjCLI+sLQBMFCh?=
 =?us-ascii?Q?sV2PaXhq9cHqHBgBsywEbrcjvUH97D38Dlw0ODavZg5XX34SDQ1PrkosYSr2?=
 =?us-ascii?Q?y8761hBTwHdYaSK3ejOS3OhCeC7z7Wnc7IqT4fiNfEJAedqkeKveEQ4jenzF?=
 =?us-ascii?Q?zf58L4iDv11XSipSvW3pH2yKcUox2N/zuOmKXHHKZrZDgY0fbrVYzlNe6hFt?=
 =?us-ascii?Q?X/ejJmS5tLATYBdABP2j8SuCzLgxC0P+brwEysvAofzdj85iwjFqaRZEHrrn?=
 =?us-ascii?Q?6czawE3QLqOUuoGlWJQRTxTmmGdfYdB3R9D4/H7L5mAr2C3HOf1JZoIb8kRn?=
 =?us-ascii?Q?POE8i6zFs/3L4jn/m0O6yLONlrkme8tO4JH07vNbmURuw9Hp/q7refHWuCWj?=
 =?us-ascii?Q?wQAmSFlqSmPHGuxGayOV1M1VmdHNObKfRl26EiMuXzxQ9gyvqcO3fzXmZeeX?=
 =?us-ascii?Q?2VareJarQSqkadTSQhskjvjH1DZUp1MgUZS+9sjlTGLzlSxARFMUWjKjN8l9?=
 =?us-ascii?Q?FA6iZtAzuzn636ow5Dt3UdKujhrRJnn7oDWSgc10ajunU0/xGCRwInkckPvz?=
 =?us-ascii?Q?nBd4yZ/lcQjYFJt+EEbHTbDD4TQpQtg4uhYPvx8N1gpK8mBiQQxrmh9NdttT?=
 =?us-ascii?Q?DoiHTCaahB27f15xXZ/z6mTAjadB0iWoKmf0qqN000ffyo4jwbp81JfZghSh?=
 =?us-ascii?Q?G6NBHL9ysr/va4OsyHhBIb2ZwHXaTvYVrC2QODaXtFHBc6Sh95DkzEwgV3VC?=
 =?us-ascii?Q?97ev27mx5lDy7GoceckvAUHF8qA2ZRXtZ1N3xZz51DDxyi0wzIyCP73cKMfo?=
 =?us-ascii?Q?E/iotjyTB0gBeBzBmuZuAWCy3PhNixNvyaG7OG3e3+XJY930tgLUvTM/4WMq?=
 =?us-ascii?Q?VqT7118TuaN7kTZbXNGeyzS0oW3iSsRhxlM9nmRxs8iXoFhjAqZqb1NRgLgR?=
 =?us-ascii?Q?WA2FPv0YLDAb2jQZg53Qfm5Ej1k+XoaX/FzfeJOkB/Sgrp6NL5OSk1XkfKXt?=
 =?us-ascii?Q?jIKEX6AXmVBYiZNO7REcK/V2By3QvTlNDTzWxR9eOcwzr8nzxm1GTQXl0j4B?=
 =?us-ascii?Q?b4nWB0Eew1g5IhWf+4elveHvk/71B7DX2Y0GZVHApIVT1+0tpfYpI0EooKmg?=
 =?us-ascii?Q?XC2mKDSK/CzF8YYWNvEm3RpkRSpnZBCo42fifnb0PIN/rUFPa4zw1oGU3R3N?=
 =?us-ascii?Q?IDT5oU1XabFicK0wElAvfqq4h7BPFKhRGDemvexXf5bKFvlvZDOo6B1H2xr8?=
 =?us-ascii?Q?rhwcn2QrO40FCLyQ8AbTWuWE6a3iv481r+MjYNdHN/Q1gKhgzMFQchtssxWK?=
 =?us-ascii?Q?cnnSmfAeOPcg1uUYe5qAOOvxrKmHN/iBa/5vVdiCuVH1BpmgpC5rOTA6i0R2?=
 =?us-ascii?Q?juAyvK9KJfttkQERJV45OHxXEhWf+29DO8UezIGwytRJiVc9LBNelEKZrvoa?=
 =?us-ascii?Q?tfyKHpHfpOv0N+JKJoYxD6luBbzZA2sjBYiHESjnCYsbynJ8vFEV3ihYfLKw?=
 =?us-ascii?Q?1SJzhGm/iuMRU5yOWrZI98IR/CHkksmQvNeRIU1gVIzosUeZq88AqUQupBmb?=
 =?us-ascii?Q?GgfUEKZEsjtdVIH9tJWM1r2u5bIcHvbp06eg7nus1hMvLW/XdvStv/N12agG?=
 =?us-ascii?Q?BnxVvts2FHleUddNIsq0JN8alftwPPM5Puxy6WHBdC2Tkb33Ag7HnE4g5EFj?=
 =?us-ascii?Q?H79HQm5gGw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50f57c8d-953a-4e48-29d0-08da2d0fb35e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 14:17:48.5429 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MiuO+4BYp5c7JCygG+ZO+uM3cBRkLlm3Eybvh1rrCnhNr5KuTyWDJzxZSLPQ3q2s3ybZlGeYaY1ZXkqIiJ6U2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2983
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-03_05:2022-05-02,
 2022-05-03 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205030103
X-Proofpoint-ORIG-GUID: hZyt-2ROMCn8sFrSlvFFbiVFznBmrnDe
X-Proofpoint-GUID: hZyt-2ROMCn8sFrSlvFFbiVFznBmrnDe
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avocado tests for libvfio-user in QEMU - tests startup,
hotplug and migration of the server object

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 MAINTAINERS                |   1 +
 tests/avocado/vfio-user.py | 164 +++++++++++++++++++++++++++++++++++++
 2 files changed, 165 insertions(+)
 create mode 100644 tests/avocado/vfio-user.py

diff --git a/MAINTAINERS b/MAINTAINERS
index d2e977affb..103fcb472f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3603,6 +3603,7 @@ F: hw/remote/vfio-user-obj.c
 F: include/hw/remote/vfio-user-obj.h
 F: hw/remote/iommu.c
 F: include/hw/remote/iommu.h
+F: tests/avocado/vfio-user.py
 
 EBPF:
 M: Jason Wang <jasowang@redhat.com>
diff --git a/tests/avocado/vfio-user.py b/tests/avocado/vfio-user.py
new file mode 100644
index 0000000000..ced304d770
--- /dev/null
+++ b/tests/avocado/vfio-user.py
@@ -0,0 +1,164 @@
+# vfio-user protocol sanity test
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+
+import os
+import socket
+import uuid
+
+from avocado_qemu import QemuSystemTest
+from avocado_qemu import wait_for_console_pattern
+from avocado_qemu import exec_command
+from avocado_qemu import exec_command_and_wait_for_pattern
+
+from avocado.utils import network
+from avocado.utils import wait
+
+class VfioUser(QemuSystemTest):
+    """
+    :avocado: tags=vfiouser
+    """
+    KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
+    timeout = 20
+
+    def _get_free_port(self):
+        port = network.find_free_port()
+        if port is None:
+            self.cancel('Failed to find a free port')
+        return port
+
+    def validate_vm_launch(self, vm):
+        wait_for_console_pattern(self, 'as init process',
+                                 'Kernel panic - not syncing', vm=vm)
+        exec_command(self, 'mount -t sysfs sysfs /sys', vm=vm)
+        exec_command_and_wait_for_pattern(self,
+                                          'cat /sys/bus/pci/devices/*/uevent',
+                                          'PCI_ID=1000:0060', vm=vm)
+
+    def launch_server_startup(self, socket, *opts):
+        server_vm = self.get_vm()
+        server_vm.add_args('-machine', 'x-remote,vfio-user=on')
+        server_vm.add_args('-nodefaults')
+        server_vm.add_args('-device', 'megasas,id=sas1')
+        server_vm.add_args('-object', 'x-vfio-user-server,id=vfioobj1,'
+                           'type=unix,path='+socket+',device=sas1')
+        for opt in opts:
+            server_vm.add_args(opt)
+        server_vm.launch()
+        return server_vm
+
+    def launch_server_hotplug(self, socket):
+        server_vm = self.get_vm()
+        server_vm.add_args('-machine', 'x-remote,vfio-user=on')
+        server_vm.add_args('-nodefaults')
+        server_vm.launch()
+        server_vm.qmp('device_add', args_dict=None, conv_keys=None,
+                      driver='megasas', id='sas1')
+        obj_add_opts = {'qom-type': 'x-vfio-user-server',
+                        'id': 'vfioobj', 'device': 'sas1',
+                        'socket': {'type': 'unix', 'path': socket}}
+        server_vm.qmp('object-add', args_dict=obj_add_opts)
+        return server_vm
+
+    def launch_client(self, kernel_path, initrd_path, kernel_command_line,
+                      machine_type, socket, *opts):
+        client_vm = self.get_vm()
+        client_vm.set_console()
+        client_vm.add_args('-machine', machine_type)
+        client_vm.add_args('-accel', 'kvm')
+        client_vm.add_args('-cpu', 'host')
+        client_vm.add_args('-object',
+                           'memory-backend-memfd,id=sysmem-file,size=2G')
+        client_vm.add_args('--numa', 'node,memdev=sysmem-file')
+        client_vm.add_args('-m', '2048')
+        client_vm.add_args('-kernel', kernel_path,
+                           '-initrd', initrd_path,
+                           '-append', kernel_command_line)
+        client_vm.add_args('-device',
+                           'vfio-user-pci,socket='+socket)
+        for opt in opts:
+            client_vm.add_args(opt)
+        client_vm.launch()
+        return client_vm
+
+    def do_test_startup(self, kernel_url, initrd_url, kernel_command_line,
+                machine_type):
+        self.require_accelerator('kvm')
+
+        kernel_path = self.fetch_asset(kernel_url)
+        initrd_path = self.fetch_asset(initrd_url)
+        socket = os.path.join('/tmp', str(uuid.uuid4()))
+        if os.path.exists(socket):
+            os.remove(socket)
+        self.launch_server_startup(socket)
+        client = self.launch_client(kernel_path, initrd_path,
+                                    kernel_command_line, machine_type, socket)
+        self.validate_vm_launch(client)
+
+    def do_test_hotplug(self, kernel_url, initrd_url, kernel_command_line,
+                machine_type):
+        self.require_accelerator('kvm')
+
+        kernel_path = self.fetch_asset(kernel_url)
+        initrd_path = self.fetch_asset(initrd_url)
+        socket = os.path.join('/tmp', str(uuid.uuid4()))
+        if os.path.exists(socket):
+            os.remove(socket)
+        self.launch_server_hotplug(socket)
+        client = self.launch_client(kernel_path, initrd_path,
+                                    kernel_command_line, machine_type, socket)
+        self.validate_vm_launch(client)
+
+    def test_vfio_user_x86_64(self):
+        """
+        :avocado: tags=arch:x86_64
+        :avocado: tags=distro:centos
+        """
+        kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
+                      '/linux/releases/31/Everything/x86_64/os/images'
+                      '/pxeboot/vmlinuz')
+        initrd_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
+                      '/linux/releases/31/Everything/x86_64/os/images'
+                      '/pxeboot/initrd.img')
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               'console=ttyS0 rdinit=/bin/bash')
+        machine_type = 'pc'
+        self.do_test_startup(kernel_url, initrd_url, kernel_command_line,
+                             machine_type)
+
+    def test_vfio_user_aarch64(self):
+        """
+        :avocado: tags=arch:aarch64
+        :avocado: tags=distro:ubuntu
+        """
+        kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
+                      '/linux/releases/31/Everything/aarch64/os/images'
+                      '/pxeboot/vmlinuz')
+        initrd_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
+                      '/linux/releases/31/Everything/aarch64/os/images'
+                      '/pxeboot/initrd.img')
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               'rdinit=/bin/bash console=ttyAMA0')
+        machine_type = 'virt,gic-version=3'
+        self.do_test_startup(kernel_url, initrd_url, kernel_command_line,
+                             machine_type)
+
+    def test_vfio_user_hotplug_x86_64(self):
+        """
+        :avocado: tags=arch:x86_64
+        :avocado: tags=distro:centos
+        """
+        kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
+                      '/linux/releases/31/Everything/x86_64/os/images'
+                      '/pxeboot/vmlinuz')
+        initrd_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
+                      '/linux/releases/31/Everything/x86_64/os/images'
+                      '/pxeboot/initrd.img')
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               'console=ttyS0 rdinit=/bin/bash')
+        machine_type = 'pc'
+        self.do_test_hotplug(kernel_url, initrd_url, kernel_command_line,
+                             machine_type)
+
-- 
2.20.1


