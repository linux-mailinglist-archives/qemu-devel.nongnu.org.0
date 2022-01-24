Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D064986A1
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 18:25:07 +0100 (CET)
Received: from localhost ([::1]:43290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC35Q-0005tc-Tv
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 12:25:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nC2yE-0005Rj-Ly
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 12:17:34 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:14556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nC2y4-0007jm-3C
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 12:17:26 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20OG2mbH001330; 
 Mon, 24 Jan 2022 17:17:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=5bfrGEpcDlwIt34rDQ6Kwj4z0gh6xYDO3jicc/PZcHI=;
 b=vVrNP7z+p8bHiAbw9sonqlIE5U3ZwuDboZPZbtUTfdEO7XNxbJpmzTQ6lHh9XTZonJrz
 Z/DHCETTPo5mgbIf2WFRupgd7HISzn+KixXNGYgwRxik/Y0oxKDRGEQhh6qxUwaqsUeW
 k/2k0Jp6arW6SazMD62TT4jSMceBJ6pkxXjhpRQUAwOnWhOFwBglZP6KNdPiMwsU1Ri1
 P+3aM50vOgpXpyBNyOX1UtqkDiaccVVHosJi9npqHSWtzJyHNjmPqP0kwlsVU91cD5tB
 w/3ORknipG/T+6f1zo8o6tln/30YN6eMJ/4TV+ZdIsF8RSgw6thXhywQJsQNdQtPnfGw bA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dsy9s0ak0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jan 2022 17:17:22 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20OHAitb051734;
 Mon, 24 Jan 2022 17:17:21 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
 by aserp3020.oracle.com with ESMTP id 3dr9r4djcn-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jan 2022 17:17:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=frz5tlzF3+1QMBGwbbEnQNh+lR2by35elRiFoXkxLRPMZ01W7nS2uSFoo0kYuSSD3bo/mXJc0MGXDTjOfRbMR60VXBuRYlhn9AxQ4V96RrUe/Ilr8qSijZAvfsxQ8xjDvGrxxHzPrrcZTBHPD1YMTbkKSh5vLYKgLDrRbQFYsoRMAm6EeT8j2tDtEu2qJgVA7T5QT9sJUBjqwCx/0DZbQzKdFfclv9r/C9GXeNqjZAkvX4Pst81E55Y0gbGsKEb6ZxLHKUkZipdgzn8mW+7MoFtiN+aXklhur80sG3B58tgX0t0+nuHjeViatkmxh2r0nTdzrHifzNJdp3XRE8sxJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5bfrGEpcDlwIt34rDQ6Kwj4z0gh6xYDO3jicc/PZcHI=;
 b=No+rU0uRMdiDF41YTnXUHbIoeTeIk4ccadfuBGmBlg+245JNDbwGnhlwLqFfLPgwSIXbvOeoHE2dgDw0UT44BhmKu2DD7rrPdOZ91JOiCAMcqKKhbU2FsME+sRkD9nUmvsG5Z5p/wXGtrNVXYw+AVpY2trC8Cc4HhHdojvE0lulIZOSTMkJCGR65jrIILGe4eig1noC2i0o+VIbhrnnDj16yqhNjOTRkBPk8vFHQJstXHzSN/SJoi9RXlLdCT7jrJGy3EdMDAJ81Bh9zyTMxJ3NzskJFQ//Jgucc/bLpYoHd7+76nJh2Jo+Dvsj/1Zqj2SwfrEHtDBLMdt3R/GmzqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5bfrGEpcDlwIt34rDQ6Kwj4z0gh6xYDO3jicc/PZcHI=;
 b=Vw39s1LGUczzC7ybLFVAX8i76lKPVh5nEzljxnhM2MqQOm/+Lbsgk1kRf4KdCGh9ewgPKYhbIsUd+l2OemhbbzXgnHIxdyw6Zra+VtOfr5nprkbAPHjDL2x6t12FY36KX6O5za7e13iWpMKRd4ixspSdF7D6cjyKW5DgS39dvdU=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by DM5PR1001MB2265.namprd10.prod.outlook.com (2603:10b6:4:30::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Mon, 24 Jan
 2022 17:17:19 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c%4]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 17:17:19 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v13 03/10] ACPI ERST: PCI device_id for ERST
Date: Mon, 24 Jan 2022 12:16:54 -0500
Message-Id: <1643044621-15892-4-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1643044621-15892-1-git-send-email-eric.devolder@oracle.com>
References: <1643044621-15892-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0055.namprd04.prod.outlook.com
 (2603:10b6:806:120::30) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84b86fbc-014e-41c8-e878-08d9df5d60a5
X-MS-TrafficTypeDiagnostic: DM5PR1001MB2265:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1001MB226554C956747827B3C14AD5975E9@DM5PR1001MB2265.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wzdjkJTIEK0SfnCnxHFoNU6TpRINbna3/akt47VTF650p68sp7uRlM28hzX+/vJUkakwVWtEr6TkDlQZcIWVHlB446Lv/sB7UNLklsK3mfAESIXrnEbFoARlMeY/Zv5bDN2d7OaamKD4t2qiLrfhYmNz4rJC8sTf2Tblz9J/L9hWxEAkDU8859g5GkwT5Pmvyh05Reyfa7pWKmEpWakbX7IL5+m5fw3kSAWvnCfcptjM0XOVMoGfTrRFM3qYl4JukERAr45sTv18WFI5arrQrU+xEG1OKpBsr9k/Atm8gaGQzFHXa+gMuo7LI5or4xqV2rCsc4AuHGr5tIGXhgLvDlYefNZFTgXV8xoXeyoB2oo6CnjHsZrJ8bSSjTaHXmfYd/Jpg6SgWz03Dy6NdutVkWBUwkEoT1K48JaO+i8yILRxZuDLDwU5Tm/GMnHEmIzIzcWg68c9TfaSeaLdLri9fWruka8EzFP7/IqAXDANHN9/Sxdcani5R0VFUkzeGuwFu0FaUvydkr0htaeOXjLzzb20G252Ccwhp93PJamd30YdyNDIxlvnbBlCf7wC1CVJGAVB8eKxTrnxe/IQUkXLUcfrEUisAw4uROAFWQQvlMNtTvTQRs8h9Ctb8hyG7mZqjYrco7jtAztNdRQtpx0mXO+IKfyfuY+++tQz4GZQ/uV0YIBJ1uZSK5l0LuM1qvkfSbiDy2KbBNMMCfni0lAXjw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(5660300002)(508600001)(6486002)(316002)(6916009)(66476007)(186003)(2906002)(38350700002)(38100700002)(36756003)(52116002)(4326008)(66946007)(6666004)(4744005)(8936002)(6506007)(8676002)(26005)(2616005)(107886003)(86362001)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/TrqimFM0SAj8nAAuYM6FrFJK8uuz+iQquvBgnPyrjl44GLvcaMeMCdAcU9A?=
 =?us-ascii?Q?yZ2rWuAMd2m4L1Tb5hunoZj/XKrMIP2ieutVDwMaa+67QcPzmVMh4jAIxEAK?=
 =?us-ascii?Q?WJpqNmQNPNtERuwoGv+kgXl3TCIJVGm6aG3uckxexu8hPaBIi/1DT7h5RqFS?=
 =?us-ascii?Q?ig7CQ7I8jcx3prSnd/BVqH43QbXMA3GEWAKjpEkjucS7+jL4rJhbT7CzUDGS?=
 =?us-ascii?Q?zV8ie2k+2iFZajKQljG8aOn23XxAyK2aWXA4Jn6Pw3T8uPpob7YcIcLM2MKK?=
 =?us-ascii?Q?HTt9z7hUltV0c8CflpCW60nSuFbMbaEbKjm7thom4HSY9GvGQD/TsKWFF6NV?=
 =?us-ascii?Q?9I1b6FXicwqL9MYZooUYyOBNACDwI+w4MdrnLpWMipTP+UYMqg+bg9B7J0xL?=
 =?us-ascii?Q?p0gZ19ouTxy5PMvb09vfUhqrQF7V7fu6g28aKdR7g+QgJWD3KgGLEl5Xb48W?=
 =?us-ascii?Q?DDMW8drUuUsVnK+gCxbcX2wp5sgYc3dqRHhFVI7JT+12zzGM/hjKbzmSGtDa?=
 =?us-ascii?Q?VVzIAkVCe1INctgpwwDOcr1ORHFuYbO/a3WHmeeGEa259XqwnS8awMIEVD8k?=
 =?us-ascii?Q?uGjNwroKxo7lVDa02/xyMNhgar2mko+Cb1Hhtss9nbbtY6XE96p37c0/6afl?=
 =?us-ascii?Q?MSA+HyFyb5Ap90XtVMZNPL7Jrwl3t07I5N68tfaQ35WhMs6z0iI78SXtalyx?=
 =?us-ascii?Q?JSURut/+J7vR8RDOmgMw5aX1zcxXQSizz+9JpZo8JcVRvHy1aYZH24Xg//vv?=
 =?us-ascii?Q?GfHGRKWG8TsvgND47BkK8ucoYW2yiabs7jgutYCfmOGcWqNiSMP3nPSAsFao?=
 =?us-ascii?Q?4Gxz4Yz+xGQAZW2OHMoH/NGggWb3qX31mCzlcu05qt+PvqT0Y/lewY4Ux9/H?=
 =?us-ascii?Q?Zm8W8azwLYS8R/Fhi5ObkAQCxcVPcdxkfyrfrHoHKyLI+mCWQE3ICxhrVu7Z?=
 =?us-ascii?Q?x4JH3nHIrD9XTuKSDDYS5tYpVhgDlNMiYBH4V5apIoCDY0Az+kHzZxBL+0Yv?=
 =?us-ascii?Q?Py4fNxYBs5K0ZxpfUJn3xlrkt8c38sbqvEaHLEFyCMyydOeSTNFec6nW1rEk?=
 =?us-ascii?Q?O3O5Z90qqUUhdXZFlUmWsnT/UrS28EWhjqIXKJdd/M9FCWkRgZw+lZIv0ncS?=
 =?us-ascii?Q?P9mzvIwoVPgRvZop94HIDbvW+OWJoVavd9THo1UpUwBz3VqskEVJxc3VSqSn?=
 =?us-ascii?Q?j7VGDgPdXCDKM+Hvbs9iNvbx4hdIIjz/f8tGPResIdDNCoC/ne9eMPFB07Nv?=
 =?us-ascii?Q?UVeCHp0jAnsHb/HfJFDDOCJiVihJQICBwUzBlz86DWe0c5bkTZqMtJvBpCDo?=
 =?us-ascii?Q?e6e+RNIhP0qVLt9hKDhJrvcLV3YBnRU3bJIaGtnp57W2bLzyhEIzz9KCi8wQ?=
 =?us-ascii?Q?gjDdjPl6dLyN+De9hqs2suP1S7xIeK+w4KgMMoI8CDDr9cKWmQL0KBsb+ilt?=
 =?us-ascii?Q?Ol4r6UUms/jpLCtTxGVJOzIz8Bpgdgxc7Go0jfptv1ua6lzedm8YQ+/VzRoZ?=
 =?us-ascii?Q?ovrnt2UsoEmF33mUuuAH6rel1jDkXQzo8abYLuYDcINRGDX53bQezgEQH4Bk?=
 =?us-ascii?Q?/8H1xkT+0edsC2C4tJlcPb5tMltPCV6zRrREL31c2wKmS7zGJEjRYZWwMDwc?=
 =?us-ascii?Q?R9hUdpakqAsQ45yR06zVabWK/hBLQwXswbo2cyykClPPzM12P/nk1OmwyqtV?=
 =?us-ascii?Q?yYkFHA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84b86fbc-014e-41c8-e878-08d9df5d60a5
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 17:17:19.7780 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LySMTV4uXtOG3wxztX1P+iqf9kx5oQ1kpOtKud0i6BiffjlMojyqdTxRwfvGQ5tf9cMHA1sshaFgeCwDcO8u0PW/5YRAwXzMSDcp/fo3eCk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1001MB2265
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10237
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=930
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201240115
X-Proofpoint-GUID: vobi2zSkBeVODJKLCDtWGtIpdZkYtijR
X-Proofpoint-ORIG-GUID: vobi2zSkBeVODJKLCDtWGtIpdZkYtijR
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 konrad.wilk@oracle.com, pbonzini@redhat.com, ani@anisinha.ca,
 imammedo@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This change reserves the PCI device_id for the new ACPI ERST
device.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: Ani Sinha <ani@anisinha.ca>
---
 include/hw/pci/pci.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 023abc0..c3f3c90 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -108,6 +108,7 @@ extern bool pci_available;
 #define PCI_DEVICE_ID_REDHAT_MDPY        0x000f
 #define PCI_DEVICE_ID_REDHAT_NVME        0x0010
 #define PCI_DEVICE_ID_REDHAT_PVPANIC     0x0011
+#define PCI_DEVICE_ID_REDHAT_ACPI_ERST   0x0012
 #define PCI_DEVICE_ID_REDHAT_QXL         0x0100
 
 #define FMT_PCIBUS                      PRIx64
-- 
1.8.3.1


