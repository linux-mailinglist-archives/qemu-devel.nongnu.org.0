Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8B34A0254
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 21:52:57 +0100 (CET)
Received: from localhost ([::1]:39556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDYEq-00049h-Dc
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 15:52:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nDY10-0004TJ-Ip
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 15:38:38 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:44974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nDY0x-0002hT-Eg
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 15:38:38 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20SK3r2h028573; 
 Fri, 28 Jan 2022 20:38:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=dvd3TJK7lkY2oMO+G7eQICUs2fDYP8r2sND5i+Obgkk=;
 b=h3sotPg7tapRI1zZZdkeS4Fev05LixOSG6uGDt7j9xGg5fstkvO0g51xCyPXHSxaSejo
 YgEVDggwHR+JzPdm0QLEWHzTAgG5OsNNJccxDR0gT3Vl4DUgWvnGmpVgisupcf/byJb/
 Kcd1zhHOXkBypZqQ/VYlBM9ZncIo3cw/IsX7qOId3xhdarBT2Jlk9JNzPSv1mqSZCJAa
 gT0QHp2L7hySvSMI8hcNaplZ/N6eE0aPLa7QmzYU3m3KzOgvmsHuOHAsrUiEvzvpXBtp
 4RTUyHx8snfEp4bbiAObrmjfT6mS2ewkUm2b1n1BRyWFniBaLCuXcxaWTE3XwC12Rk2i rQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3duwrxmeak-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jan 2022 20:38:31 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20SKQxG2139572;
 Fri, 28 Jan 2022 20:38:30 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
 by aserp3020.oracle.com with ESMTP id 3dtaxd4kk6-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jan 2022 20:38:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fYmse/8aGDfeudwg17eKBq6+DSzdJsB0tZMegYhUstrf9IC5Uc8ZxZVusdiSGKHQNyr/AUYwYIOA0wDGQEsq7TckdvKNDBW74EWy/VAtX8QjsT355D4gjkFbdnTtYiUkCnext7GCp+nwh4GiO6YK0AivEUCfWEcWL0wKJwaEhOkRXQLLw0m4pJVCQ5LQ+jZ8yKjIOR3g+xxdID8WIka8byJd+F9eBa42l4jg3bKK31rdm8Flkq1f0PkHzuKpzWTgPky/oQt92ytUYj/s+nyN+GwVz+X+c5eSZ0w1LcGoc3xfAZ3skthaWl4Qj2DKeYWTN7u+zb5ZIPfeJHNdp9w3uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dvd3TJK7lkY2oMO+G7eQICUs2fDYP8r2sND5i+Obgkk=;
 b=n3aCOBpgVVnwSPbzd7PMjiJ2lSRprnkM/Z9AgPGbBDKykZ3xHe3kTnuLKjYLgFoBgdckq845ghKlbIDkNxmaxteMK1kMIlAtA8NxXVummbtHflGNPl/5QZK0nrQ4GDOJPLDr+ayPbrV4YHcEfnuy5UbDBtJcukNwYvt9WOdvGa2DpWc6eL8lJ6ofuyij02vmZMH9WrwiviVbQQwWLtjejygWUGeGhu9Yo5LnUUUGq9obKZI+aPDVYvpAjuzX7G02jdsqv6vJWFo4zWhEbL1JYlGBcKQrHDhcBNyEsPZYk39uPF3lwjaMJjedkEZoLBsTbvXKMKI3xjE0NXPyP9/QVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dvd3TJK7lkY2oMO+G7eQICUs2fDYP8r2sND5i+Obgkk=;
 b=xdUNJHNGmmGtJuE3VyfDCBT/tB4SYlJyW469OB5TOsaTzc+EGkNEw5u081dkcaDttYcBmiXnAKe5MwC9iXeAfpWVntrpynAyzsRUFzHa7MPTZwo2Gzy95pnve2sbDZYG2OIYAhilJs0uwK7rxI57AeuRa9D9QLYxwFV4lH9VCQs=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by PH0PR10MB5530.namprd10.prod.outlook.com (2603:10b6:510:10c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Fri, 28 Jan
 2022 20:38:29 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c%4]) with mapi id 15.20.4930.019; Fri, 28 Jan 2022
 20:38:29 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v15 06/10] ACPI ERST: build the ACPI ERST table
Date: Fri, 28 Jan 2022 15:38:05 -0500
Message-Id: <1643402289-22216-7-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1643402289-22216-1-git-send-email-eric.devolder@oracle.com>
References: <1643402289-22216-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA1P222CA0007.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::22) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9cf870a-a888-4bb2-86d7-08d9e29e2430
X-MS-TrafficTypeDiagnostic: PH0PR10MB5530:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB55307A9AA6260B8148B6E77997229@PH0PR10MB5530.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sxhp9yJ9exg1PVbKpbYoafaefVNoS4sdkDt2mx4fKN/+st9qiPJtqBpNjLCJr0lKfpnsUOBwEDNTUH/BG6BgiZKvlt9e6FXYiSzY83UmRAKf4ZqFq8jmNLgOINYs3aHXugFnnvWG7RwLXluhSWg4W4rgNMynNfZ1cILtq0MhwX3/RUqn91QmNEeJr+lJ9U5iEVjImBejTwyifeev3HkYf8Pm+0h4Y/Dj9U3CO7omSvAb6tebJWN96bpb1RSGPwozWVGoguzZY7RMNMw1vtPmjq6UbYrUlBivg2gTTzfvhKEhEKjgg7FmJlshi7KitaAuDipMMbewAT+h7uSxsJUPfGFsnzIJjsZzY8bDoVjlOChs2GZo1h+F7hDeDFi1E4f1Fl+4dLxOxBnNjcn+xtETpExWWVTxAKQokVrpwsHQcYFztrvCF4r5/ePfCdNMzifbSG8IV9vS8QjzSY5u4DZ1HgA/Yw8xhl6WKT643arzoYpRnnAGUb1xYOG9png/FRb4mz1imWBIaw8FRHvRQQ3ozFCG14gN48ZR1qMe+QNwbF8Gp3YQk8qfZOPGGixuCeH9HN8GFmgfZ2TAJO9FgifTMku6Vu8t8hxAx8QC1GbWK8+3sMYUF/Ug5fJjDXTOUqcn43G63eHJ8mK+EyEiERzRIZNSRStiebi8O3DPFU85pXGHN+Umci4yLjnNF2frYYWjujnvlK4H7gnz1LnqdlG5wg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(52116002)(66476007)(26005)(66946007)(6666004)(38350700002)(6486002)(5660300002)(8676002)(6506007)(508600001)(83380400001)(6916009)(186003)(36756003)(2906002)(4326008)(107886003)(86362001)(6512007)(316002)(2616005)(38100700002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AeiVZYEZCKxaHVWdIZBtxIu9uVkMO83WWgf+LFZvrl+Nl8F+8D2pD8GUlq3H?=
 =?us-ascii?Q?TN3xMSuL20VUD57oCtWUs7WrVQ9IUgI+InsRAlTD4FoqIKwupIYP8i592qKG?=
 =?us-ascii?Q?YhzYEQp954L0i++t9c1Dhs/vx4uQs2UAB9zhW8wKL47McG/NE1wgxAVHQh/u?=
 =?us-ascii?Q?PebrblLnVQcVOdHsqcw98gUlPYtdJ4qchI5QOdpUuiwulpvJSe5s39qsHyPP?=
 =?us-ascii?Q?CE9Zg4yz9ocs6aKKPEmasNiZKBT13rOvYSNfDQGxyfh+g/4Hug777VbvARmu?=
 =?us-ascii?Q?gC4VfJfgZHRbpaBMn1h1VfZvrt67QP2/buZeMMaTjhAKcJN/IaGCUUTA8RQP?=
 =?us-ascii?Q?sF5i1qmG5rPS3aZspuCD9HZwqs4APbbErsvMerPWAO6nrZrVg7Z2Ls+NXtYu?=
 =?us-ascii?Q?y0qdC1f7r2NIM7ESaOTviQiVNJWHlulDpRjDAkc6BZ1fJeRIiZO2p42eB8w8?=
 =?us-ascii?Q?RCtv5YyskhkAiyeVjbQ2KrYx57dyL6p65zfDelJfC1co6wVBqtbgVjkVdobk?=
 =?us-ascii?Q?PYFjdR6sQKdSFNwm8ENk+QSxv51S/09/Q1tGnhvqWsaVkL399huh9EzraRkM?=
 =?us-ascii?Q?WK4kCWcMrK2DfE/NNDojqDNxNUdYBmlnytdRUI8R9dlA0t97oaNs14AKGSjV?=
 =?us-ascii?Q?MdGf3wIJIUxn7540q2D13JvxrGBq8YZL+DCbRmNneAHqCuGI5VCcXSJBhffR?=
 =?us-ascii?Q?DzcJbJFmIGIQw0hpma5SQMFayQyB+9AgM+JW5dLhiymiWpNwdHbcHTZOuzvP?=
 =?us-ascii?Q?KfVOL6VaFKi057GDUwGi7TQcC2hHV6qd6wSN3j+lyhenHntDjmnHERwEyZjP?=
 =?us-ascii?Q?4xx4zBPx46q/ve8F/gO9Nvr7C9Oi6n1H4ClSeEeQJiyt5EK94XT4To9k8As7?=
 =?us-ascii?Q?p+0cRXN06nSQ5WtCtO0zGkndpDPdqdiag9Bl4Fo1Si8b8y4GlptsllyBjbKw?=
 =?us-ascii?Q?ey1RlxTqG6++JUa+C/afsQEMq+QrVDJkPF5N2qCdiV8b33j6SthtBnNP6TmO?=
 =?us-ascii?Q?mgP2sx1uHzmgfaWA1yIu5wD4lW4NpX5VoADke7TwhGlnwK750jJpwJS7s2F3?=
 =?us-ascii?Q?VVh8ZTJwzOA1MR0lnqIt+my9uDBsnITrjV137wZTU1kQk6P17y84zAA2WmRO?=
 =?us-ascii?Q?pTwmPwB02ya65PjUAoE5bXHYQk8KmjCfN5v6jkTkkS9l7MG91XXVhzSnNUoU?=
 =?us-ascii?Q?Fj+QR0mtTNz3MzO7mHJV0NcXra8dKwojPG9tcdV0aPvv5jIPIbG3d+t2uCHK?=
 =?us-ascii?Q?rsZbD2004ebN5KUiZGgpWZlHIa49Qsubd1nYA07TFMstSntO0hvLnYv8/F3D?=
 =?us-ascii?Q?nUm0ZZIlQxQIlILW0GS3MBciD3DdMqczXgoYp4EKsfInn3PWcCt401cRh2wY?=
 =?us-ascii?Q?ZBOcGUVMCobxa/hf2JE0hZ2tiutCMlyGCVAjWkbskpOAmi3MSJ7rireEQInj?=
 =?us-ascii?Q?QJ4Jtg/SmSNXENKCaNeaQQjqDpnXRDHRmCvZShK4YU0euFsn3ezzanUmL0/W?=
 =?us-ascii?Q?a4UyLd3VnTKKNDepNk19NIFDKLGSXMZu4fLSAhQQ1tub0LKHt/nD32uSKOEa?=
 =?us-ascii?Q?0T6bLO/F5Fk/mAZgy8dR3c7moix+sB0fYwPDtW95ohPewuowGqOt2JyDI1Ue?=
 =?us-ascii?Q?is0WWMOIHFKNOOZ79mhIAdW9NFODlXMj8XbdzoqftS+8o2PylmcNhqCiJ2ev?=
 =?us-ascii?Q?tczi2A=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9cf870a-a888-4bb2-86d7-08d9e29e2430
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 20:38:29.1068 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u4P+3PbqIVafTJ3oHvhXp1egrT/NS9wkXtpkEl0krWp7jc8ydyxI8gA4ni0uYih5lAxE2W1SdIs9ajBaZET+WgJnOGxiwHuNyvnmSgJCs2g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5530
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10241
 signatures=673430
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=928 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201280118
X-Proofpoint-GUID: cngE7RibxTCTJVzlk8CMMwDmRSZUmkjU
X-Proofpoint-ORIG-GUID: cngE7RibxTCTJVzlk8CMMwDmRSZUmkjU
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 konrad.wilk@oracle.com, pbonzini@redhat.com, ani@anisinha.ca,
 imammedo@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This builds the ACPI ERST table to inform OSPM how to communicate
with the acpi-erst device.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
---
 hw/acpi/erst.c | 211 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 211 insertions(+)

diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
index fe9ba51..cd32aa7 100644
--- a/hw/acpi/erst.c
+++ b/hw/acpi/erst.c
@@ -59,6 +59,27 @@
 #define STATUS_RECORD_STORE_EMPTY     0x04
 #define STATUS_RECORD_NOT_FOUND       0x05
 
+/* ACPI 4.0: Table 17-19 Serialization Instructions */
+#define INST_READ_REGISTER                 0x00
+#define INST_READ_REGISTER_VALUE           0x01
+#define INST_WRITE_REGISTER                0x02
+#define INST_WRITE_REGISTER_VALUE          0x03
+#define INST_NOOP                          0x04
+#define INST_LOAD_VAR1                     0x05
+#define INST_LOAD_VAR2                     0x06
+#define INST_STORE_VAR1                    0x07
+#define INST_ADD                           0x08
+#define INST_SUBTRACT                      0x09
+#define INST_ADD_VALUE                     0x0A
+#define INST_SUBTRACT_VALUE                0x0B
+#define INST_STALL                         0x0C
+#define INST_STALL_WHILE_TRUE              0x0D
+#define INST_SKIP_NEXT_INSTRUCTION_IF_TRUE 0x0E
+#define INST_GOTO                          0x0F
+#define INST_SET_SRC_ADDRESS_BASE          0x10
+#define INST_SET_DST_ADDRESS_BASE          0x11
+#define INST_MOVE_DATA                     0x12
+
 /* UEFI 2.1: Appendix N Common Platform Error Record */
 #define UEFI_CPER_RECORD_MIN_SIZE 128U
 #define UEFI_CPER_RECORD_LENGTH_OFFSET 20U
@@ -172,6 +193,196 @@ typedef struct {
 
 /*******************************************************************/
 /*******************************************************************/
+typedef struct {
+    GArray *table_data;
+    pcibus_t bar;
+    uint8_t instruction;
+    uint8_t flags;
+    uint8_t register_bit_width;
+    pcibus_t register_offset;
+} BuildSerializationInstructionEntry;
+
+/* ACPI 4.0: 17.4.1.2 Serialization Instruction Entries */
+static void build_serialization_instruction(
+    BuildSerializationInstructionEntry *e,
+    uint8_t serialization_action,
+    uint64_t value)
+{
+    /* ACPI 4.0: Table 17-18 Serialization Instruction Entry */
+    struct AcpiGenericAddress gas;
+    uint64_t mask;
+
+    /* Serialization Action */
+    build_append_int_noprefix(e->table_data, serialization_action, 1);
+    /* Instruction */
+    build_append_int_noprefix(e->table_data, e->instruction, 1);
+    /* Flags */
+    build_append_int_noprefix(e->table_data, e->flags, 1);
+    /* Reserved */
+    build_append_int_noprefix(e->table_data, 0, 1);
+    /* Register Region */
+    gas.space_id = AML_SYSTEM_MEMORY;
+    gas.bit_width = e->register_bit_width;
+    gas.bit_offset = 0;
+    gas.access_width = (uint8_t)ctz32(e->register_bit_width) - 2;
+    gas.address = (uint64_t)(e->bar + e->register_offset);
+    build_append_gas_from_struct(e->table_data, &gas);
+    /* Value */
+    build_append_int_noprefix(e->table_data, value, 8);
+    /* Mask */
+    mask = (1ULL << (e->register_bit_width - 1) << 1) - 1;
+    build_append_int_noprefix(e->table_data, mask, 8);
+}
+
+/* ACPI 4.0: 17.4.1 Serialization Action Table */
+void build_erst(GArray *table_data, BIOSLinker *linker, Object *erst_dev,
+    const char *oem_id, const char *oem_table_id)
+{
+    /*
+     * Serialization Action Table
+     * The serialization action table must be generated first
+     * so that its size can be known in order to populate the
+     * Instruction Entry Count field.
+     */
+    unsigned action;
+    GArray *table_instruction_data = g_array_new(FALSE, FALSE, sizeof(char));
+    pcibus_t bar0 = pci_get_bar_addr(PCI_DEVICE(erst_dev), 0);
+    AcpiTable table = { .sig = "ERST", .rev = 1, .oem_id = oem_id,
+                        .oem_table_id = oem_table_id };
+    /* Contexts for the different ways ACTION and VALUE are accessed */
+    BuildSerializationInstructionEntry rd_value_32_val = {
+        .table_data = table_instruction_data, .bar = bar0, .flags = 0,
+        .instruction = INST_READ_REGISTER_VALUE,
+        .register_bit_width = 32,
+        .register_offset = ERST_VALUE_OFFSET,
+    };
+    BuildSerializationInstructionEntry rd_value_32 = {
+        .table_data = table_instruction_data, .bar = bar0, .flags = 0,
+        .instruction = INST_READ_REGISTER,
+        .register_bit_width = 32,
+        .register_offset = ERST_VALUE_OFFSET,
+    };
+    BuildSerializationInstructionEntry rd_value_64 = {
+        .table_data = table_instruction_data, .bar = bar0, .flags = 0,
+        .instruction = INST_READ_REGISTER,
+        .register_bit_width = 64,
+        .register_offset = ERST_VALUE_OFFSET,
+    };
+    BuildSerializationInstructionEntry wr_value_32_val = {
+        .table_data = table_instruction_data, .bar = bar0, .flags = 0,
+        .instruction = INST_WRITE_REGISTER_VALUE,
+        .register_bit_width = 32,
+        .register_offset = ERST_VALUE_OFFSET,
+    };
+    BuildSerializationInstructionEntry wr_value_32 = {
+        .table_data = table_instruction_data, .bar = bar0, .flags = 0,
+        .instruction = INST_WRITE_REGISTER,
+        .register_bit_width = 32,
+        .register_offset = ERST_VALUE_OFFSET,
+    };
+    BuildSerializationInstructionEntry wr_value_64 = {
+        .table_data = table_instruction_data, .bar = bar0, .flags = 0,
+        .instruction = INST_WRITE_REGISTER,
+        .register_bit_width = 64,
+        .register_offset = ERST_VALUE_OFFSET,
+    };
+    BuildSerializationInstructionEntry wr_action = {
+        .table_data = table_instruction_data, .bar = bar0, .flags = 0,
+        .instruction = INST_WRITE_REGISTER_VALUE,
+        .register_bit_width = 32,
+        .register_offset = ERST_ACTION_OFFSET,
+    };
+
+    trace_acpi_erst_pci_bar_0(bar0);
+
+    /* Serialization Instruction Entries */
+    action = ACTION_BEGIN_WRITE_OPERATION;
+    build_serialization_instruction(&wr_action, action, action);
+
+    action = ACTION_BEGIN_READ_OPERATION;
+    build_serialization_instruction(&wr_action, action, action);
+
+    action = ACTION_BEGIN_CLEAR_OPERATION;
+    build_serialization_instruction(&wr_action, action, action);
+
+    action = ACTION_END_OPERATION;
+    build_serialization_instruction(&wr_action, action, action);
+
+    action = ACTION_SET_RECORD_OFFSET;
+    build_serialization_instruction(&wr_value_32, action, 0);
+    build_serialization_instruction(&wr_action, action, action);
+
+    action = ACTION_EXECUTE_OPERATION;
+    build_serialization_instruction(&wr_value_32_val, action,
+        ERST_EXECUTE_OPERATION_MAGIC);
+    build_serialization_instruction(&wr_action, action, action);
+
+    action = ACTION_CHECK_BUSY_STATUS;
+    build_serialization_instruction(&wr_action, action, action);
+    build_serialization_instruction(&rd_value_32_val, action, 0x01);
+
+    action = ACTION_GET_COMMAND_STATUS;
+    build_serialization_instruction(&wr_action, action, action);
+    build_serialization_instruction(&rd_value_32, action, 0);
+
+    action = ACTION_GET_RECORD_IDENTIFIER;
+    build_serialization_instruction(&wr_action, action, action);
+    build_serialization_instruction(&rd_value_64, action, 0);
+
+    action = ACTION_SET_RECORD_IDENTIFIER;
+    build_serialization_instruction(&wr_value_64, action, 0);
+    build_serialization_instruction(&wr_action, action, action);
+
+    action = ACTION_GET_RECORD_COUNT;
+    build_serialization_instruction(&wr_action, action, action);
+    build_serialization_instruction(&rd_value_32, action, 0);
+
+    action = ACTION_BEGIN_DUMMY_WRITE_OPERATION;
+    build_serialization_instruction(&wr_action, action, action);
+
+    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE;
+    build_serialization_instruction(&wr_action, action, action);
+    build_serialization_instruction(&rd_value_64, action, 0);
+
+    action = ACTION_GET_ERROR_LOG_ADDRESS_LENGTH;
+    build_serialization_instruction(&wr_action, action, action);
+    build_serialization_instruction(&rd_value_64, action, 0);
+
+    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES;
+    build_serialization_instruction(&wr_action, action, action);
+    build_serialization_instruction(&rd_value_32, action, 0);
+
+    action = ACTION_GET_EXECUTE_OPERATION_TIMINGS;
+    build_serialization_instruction(&wr_action, action, action);
+    build_serialization_instruction(&rd_value_64, action, 0);
+
+    /* Serialization Header */
+    acpi_table_begin(&table, table_data);
+
+    /* Serialization Header Size */
+    build_append_int_noprefix(table_data, 48, 4);
+
+    /* Reserved */
+    build_append_int_noprefix(table_data,  0, 4);
+
+    /*
+     * Instruction Entry Count
+     * Each instruction entry is 32 bytes
+     */
+    g_assert((table_instruction_data->len) % 32 == 0);
+    build_append_int_noprefix(table_data,
+        (table_instruction_data->len / 32), 4);
+
+    /* Serialization Instruction Entries */
+    g_array_append_vals(table_data, table_instruction_data->data,
+        table_instruction_data->len);
+    g_array_free(table_instruction_data, TRUE);
+
+    acpi_table_end(linker, &table);
+}
+
+/*******************************************************************/
+/*******************************************************************/
 static uint8_t *get_nvram_ptr_by_index(ERSTDeviceState *s, unsigned index)
 {
     uint8_t *rc = NULL;
-- 
1.8.3.1


