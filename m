Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD883B891E
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 21:21:31 +0200 (CEST)
Received: from localhost ([::1]:37830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyfm6-0007co-Av
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 15:21:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lyfZE-00072J-FD
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 15:08:12 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:14702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lyfZ8-0005nj-OC
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 15:08:12 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15UJ5Evv024203; Wed, 30 Jun 2021 19:08:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=LSaieLJN0g8ej6ziWlySQI1wPp+O+ZyY1KQJ6kBBXn4=;
 b=iJo/HtfNoxFcqAW3AUPlECF50WyzrRsTSwFtq4BAgX2ADiwfTB2uaP1B+iztQp4MT2XR
 dr0cO3/vudjpLgrRwUzZF+6EC1xxRkuk2Yq9mdq5+twQaBGJFhZwHU1WTPIMWXvAFq+8
 Qkc24EeF55M6ks/9aX9PRtyVdOTS0CfjL5mzA5JaGjcIRG9zFAZalLQgInmXvpSpZgnG
 KGVvQu8gzhNl91EuY6UtX2P4L2SHBxTeI8yla1L8AX5Y62sSr6WtCYuUNHMhbWtg/+Wp
 5L2IrZVwhJFUR9tafnsEXxyTDkoPWcnQFiMwHhLxWX4O+NCIX1UtbSToVa2TJ3JhrPVX zQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39grmaruus-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Jun 2021 19:08:04 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15UIxvjD089823;
 Wed, 30 Jun 2021 19:08:04 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
 by aserp3020.oracle.com with ESMTP id 39dv28kymg-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Jun 2021 19:08:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hl5VIhHardt20ntvjH8ZLDgGwLs8kjxx9B1Pvw4jVoM83hxtN2eYsiLmZK9J6akrU+X6b55U85l/+Sn2lTOS7uxCF+4/FMwgv2vvrhOSlrcPlTbo0U+lLDU3BGJyeQuG0pkBRPm3o6k5EQX3bF4DDIrmMEsh2sITFkHATVGNWstbkqrLJDvk1Sr3na/FpJYC3Pdw3ugcwos3dz0QME8EJOHiHrtJv6dso6OElzB7b8qiXTep/B2ylpHQl2BVKeWm0jextM1dbDszn/prJjAvHjY0fJRSaupOg19u5BwORo8Ykd6aqcHNnky6p5o35XkghL/w7nlDl2v2DMsmnlQYgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LSaieLJN0g8ej6ziWlySQI1wPp+O+ZyY1KQJ6kBBXn4=;
 b=mkKlWaNWlmoW0bA9bzYD52tPnPGqsQPvB/OL0ur+cy0BYsQpqIJBNmB2UjgU/PeqSnjRmOWqJSoNoff6/SLwhyOPIy3ORAVUWJjzimq/87fW1YkSTMViLSg+MDkjzocqLN23sJYdouEvUe21TaaibBaX2XmSAwhS9bpExK4bEBZk+BRDVgigbmr9NQWKXg4zIv2IH3eP7onYWVgaPZ2GXxYB46eb2z/YXHMUMWV4Mk78woDpMH089igaFVIfo6q6IdxkmAWQytupFG5IygHAZvlxLYuAzTVIhbs9Up+XUKUtNuLLcioUQgHfui+mKb+8iLK3t6np/MYMri1ugwp5eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LSaieLJN0g8ej6ziWlySQI1wPp+O+ZyY1KQJ6kBBXn4=;
 b=ni6ZoRDsyhhYozP+6/3kFANrMk7Hde6roOv0/xEx/oTlZv2847AgtoCTmCsACktDgZQ6Edp/I/0bAB+2yrYj5aaDox/R6RWugEAk3DM5x74ijiJ7H9/YVqHm8+0n85ZxgvQarP8XnNSArnS7R0CF2+d3KgTMXiRY69bsrZy3GcE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO6PR10MB5473.namprd10.prod.outlook.com (2603:10b6:5:355::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Wed, 30 Jun
 2021 19:08:02 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc%7]) with mapi id 15.20.4287.023; Wed, 30 Jun 2021
 19:08:02 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 07/10] ACPI ERST: trace support
Date: Wed, 30 Jun 2021 15:07:18 -0400
Message-Id: <1625080041-29010-8-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
References: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-Originating-IP: [138.3.201.23]
X-ClientProxiedBy: BYAPR01CA0060.prod.exchangelabs.com (2603:10b6:a03:94::37)
 To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ban25x6uut23.us.oracle.com (138.3.201.23) by
 BYAPR01CA0060.prod.exchangelabs.com (2603:10b6:a03:94::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.23 via Frontend Transport; Wed, 30 Jun 2021 19:08:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81e4be1b-db21-49b2-4263-08d93bfa6220
X-MS-TrafficTypeDiagnostic: CO6PR10MB5473:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR10MB54734F082691CA808DD36E1E97019@CO6PR10MB5473.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NhVRXM9eQiVTmZ31SABsx9XCDaaj8yV2GR8PqmGVnJtDeRPTRZc1BZnsvwQx+pJqM2h1ZDGlqGfnwdfhVRW+UfXqZBT8GfBpdTwGR3khR4nlH+7PFkznoJQCT8IqTN6ZY3rLmAmWhRBR54wxzi70fKJvQPQQj3onb4gAMqhGUVwfgKzm78QWEbn9imaRy3ihjf8VzYpirh6jbfiZb1Au8TXW6XLxSLbhfVv6UtTBKU1kWw2xN+Upckz2UsK4FNKOzteGXZaOBmI+RplC1mB57nTv0Qx/GOkmaiPAU/7dvVrS3jOeN/hXiE0+IKSVrVuI/Dp0bamKXf0YPhR+s+7Nfcq2v/D6AsrqbvoHevuLkjyubWdAuRNd9defh3mPZBdwVYA1WjSFtSzg8UOTXTzd9vzsqYtIU8yGXB89MGrvKgL9r3HriR2qlmd2XqrbSF2bF5Edy5y4O1XHiDrLGDG57ma9t+r30LdvmwoADpttYSA/LUc8ivQu2dxB3kDan/18R6ATgahT1wNkC1ZDjYiVKKAs2C8lRq/rtqH48HSM44+jmGzD8ObPwLTWLEL/FiLv2zsCLaWjAhM6iDkXMCVk6wou9sEs+wlWJxHtVk3Y4Y4Q+/QBrtrjINb6AeEZ0NYpBNfIzTcSAlMsldUlQ1YlrL4rjsXBjjfuSZC2U0X8U5LWTVnQ+kUckKzI520KyhjuRaH9Q8Zvdv8D0BNdTIqDzg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(39860400002)(136003)(396003)(346002)(366004)(107886003)(2906002)(83380400001)(6666004)(66476007)(66556008)(8936002)(6916009)(8676002)(66946007)(4326008)(2616005)(956004)(7696005)(86362001)(186003)(16526019)(478600001)(26005)(38100700002)(38350700002)(5660300002)(36756003)(316002)(52116002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IHpxvaoEGqpo19dckrdabfFSSw7OW0bwFu3ske9ERYouOF5ZVGOsVmkUePUf?=
 =?us-ascii?Q?WvBrW9QISuFL5tNR7yMyQU4Pd5u/TthqOK7k2EDNR4WYaYc+PCWufKX8Qlm1?=
 =?us-ascii?Q?elfZce2n4TxBgX1UkmkXl4EZSC+y+9BPJd4YWzE0dOELsBI/wTSEkbs0+7Fl?=
 =?us-ascii?Q?4c5QUVbh4b3yi+rXPPFUZq+5VnTKTlFQTp6G6esNYpQUXmTKbcfg1RcYb8W9?=
 =?us-ascii?Q?NoUqtHPce1wOr+caQJI8+YTMAnAKoxIxt8yZeO+AwLk4/ePb6FbIo5qL+5IJ?=
 =?us-ascii?Q?dfcfG7Ct73xbttB8OsKxnwKDlw7CBO0f5UnXDyO0g3tgxYQcIaOgnT0WNHV/?=
 =?us-ascii?Q?142ZFXhs/v0dSIIp8ij6jYqXBd9lzbnj95bp55gxjj2b66q2UEST7SDPDQ5i?=
 =?us-ascii?Q?YpaSuMBzo9C9S/0UilbQDWSCx8/E25tTsJV8EJs9kiNB0wzSRPUgB0HXIF3D?=
 =?us-ascii?Q?kMr6mvZXN8m/bC1woX59WLh33Ig776y1+YLdtksur0CutXe+zbUw+VnHdoQx?=
 =?us-ascii?Q?sEu88OeO5ClbpFpH06NhlZByQ6eE7owbshDhZGR5qBD/UlDuJYN6X/fBEf6t?=
 =?us-ascii?Q?g22BR+7tilMt+CejnmT/VGX02vvSnYnkPxiYUmyVcxZbcNr5Y4k8RHCo3QX5?=
 =?us-ascii?Q?Um2DmFRa5xOZNHstw3XMC3C2RCbGDFkFam0X0UPrQFzcoHbQ888IhemFBqho?=
 =?us-ascii?Q?Q2tDbrC9E8hup1k7TsXrdp9cJaGYSM78B4rHchgCxAZI6l79ZdK5SZNLvCFR?=
 =?us-ascii?Q?7616Kq+P8Pp44awD7LtCLGfDmqmGILigb8NmBVgjRdqiq1KJUt9A2q9G+iIC?=
 =?us-ascii?Q?4VXBfoa/XvSfOKIjVLE2nF0iCjVImIjbSzHFkcpQ0Nid0oMDvkr3Xrp1eujv?=
 =?us-ascii?Q?hQJZ2Eu7n0K88rp9tai0clydc6/NC/wdR8SzaUaOG+xSOudyuMDVBQHEEZOA?=
 =?us-ascii?Q?3K+HR1JfekXn7GgL5N5w8fdChdZXdshbHW8f1ifoEaUkv2Zagfn0kdlS5GPE?=
 =?us-ascii?Q?o94h/52oI/0H+Q2FGoDxOvZtlv9TZU5g7cUHbMpBvvY9MSwmD6jySZvxoWnn?=
 =?us-ascii?Q?nIOdulM8maaulDSPHpD7xsXuZS/QSIMsWfiTEk9HrBKLvL6mbmEgO0KHQnK4?=
 =?us-ascii?Q?wE6QXHA4xYtFXjlbFGhSIRsejA/XzP26AU2IwM7xsJhnc9RJUSkWYNCSFzwM?=
 =?us-ascii?Q?CKsp5ErLQO1DNlh73ZpMT1roxvgO68miMjan17YHzZTJy4UshHFPITsUSL2O?=
 =?us-ascii?Q?VBySYMeeS1bZo0ZXVJTUdNMVweaxvgnspW/OuVEg59TZi3Lxq1220KN8Fjme?=
 =?us-ascii?Q?TU1C3w5Hw1hHerpW6NM6C6fp?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81e4be1b-db21-49b2-4263-08d93bfa6220
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2021 19:08:02.5492 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rKuldWfxPVuLiY5pAI3QC61DBc8SCGlVl1KLhU3NRuGXHM6J+rIHH9CBEVGlyF+HhPnHVNptLZreQk5Sn+EGeatUfj2mv5EWrdvyhSxyNCQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5473
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10031
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 adultscore=0
 malwarescore=0 mlxlogscore=999 suspectscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106300106
X-Proofpoint-GUID: Jl3he2jDrrwcePlEDQe1ohAsD872YQZO
X-Proofpoint-ORIG-GUID: Jl3he2jDrrwcePlEDQe1ohAsD872YQZO
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Provide the definitions needed to support tracing in ACPI ERST.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 hw/acpi/trace-events | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/hw/acpi/trace-events b/hw/acpi/trace-events
index dcc1438..a5c2755 100644
--- a/hw/acpi/trace-events
+++ b/hw/acpi/trace-events
@@ -55,3 +55,17 @@ piix4_gpe_writeb(uint64_t addr, unsigned width, uint64_t val) "addr: 0x%" PRIx64
 # tco.c
 tco_timer_reload(int ticks, int msec) "ticks=%d (%d ms)"
 tco_timer_expired(int timeouts_no, bool strap, bool no_reboot) "timeouts_no=%d no_reboot=%d/%d"
+
+# erst.c
+acpi_erst_reg_write(uint64_t addr, uint64_t val, unsigned size) "addr: 0x%04" PRIx64 " <== 0x%016" PRIx64 " (size: %u)"
+acpi_erst_reg_read(uint64_t addr, uint64_t val, unsigned size) " addr: 0x%04" PRIx64 " ==> 0x%016" PRIx64 " (size: %u)"
+acpi_erst_mem_write(uint64_t addr, uint64_t val, unsigned size) "addr: 0x%06" PRIx64 " <== 0x%016" PRIx64 " (size: %u)"
+acpi_erst_mem_read(uint64_t addr, uint64_t val, unsigned size) " addr: 0x%06" PRIx64 " ==> 0x%016" PRIx64 " (size: %u)"
+acpi_erst_pci_bar_0(uint64_t addr) "BAR0: 0x%016" PRIx64
+acpi_erst_pci_bar_1(uint64_t addr) "BAR1: 0x%016" PRIx64
+acpi_erst_realizefn_in(void)
+acpi_erst_realizefn_out(unsigned size) "total nvram size %u bytes"
+acpi_erst_reset_in(unsigned record_count) "record_count %u"
+acpi_erst_reset_out(unsigned record_count) "record_count %u"
+acpi_erst_class_init_in(void)
+acpi_erst_class_init_out(void)
-- 
1.8.3.1


