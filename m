Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E38D34A023C
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 21:43:48 +0100 (CET)
Received: from localhost ([::1]:50856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDY60-0008Er-0o
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 15:43:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nDY0v-0004DL-2z
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 15:38:33 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:35636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nDY0s-0002fB-CI
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 15:38:32 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20SK45Q4004956; 
 Fri, 28 Jan 2022 20:38:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=5bfrGEpcDlwIt34rDQ6Kwj4z0gh6xYDO3jicc/PZcHI=;
 b=dCkhUejW53vBmXxBKiIPVrHAXWIzWgylr9QCH1Q/afHPQXNpREHH9MDrOq/xQy/NQKkd
 D3+/gtpayn0ZX2jnPj35+KmUu+KBP+L2lvGX/gJkvqshejsfGe3lxbg3zF56wbJbc/Jf
 e/I3V3Eg1pSPiRnEAlXJPEndXh972bEC7ZamVrDt+x7nXLP2PfKylxKbQPe7W3uw8Eub
 jNJ0SdK7e4XnH2LwXmfFBvHSTzI/Gz4rzwe8Ub98HNO/fE+6EIFLWGUoHi6j4oX3vTMg
 tEsV0Oh7CzxUxlhDw0/xHdHkLYUdZHhermMGH5GoMDZMk1/CbSyZ++SDCHOuvF9qoWoJ yg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3duvnkch1u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jan 2022 20:38:26 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20SKQxox139537;
 Fri, 28 Jan 2022 20:38:25 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
 by aserp3020.oracle.com with ESMTP id 3dtaxd4kgd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jan 2022 20:38:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BZQI00X8eBF7V9/1NxpZiYhXv5wzEu6OttuV77vN0QyOsaRYEqgPj3dk+SYTf7whz4iNtRzkr6pBxq1K2Lc+E3Km4BbaF4nHyJqU/Nb9WbOthxCeYyLoisOpYcza50zPNK+MCbz495hilvoOGZt4yg1HLNFfdTe8W0JdGFCThk8dUoi8CpcrEYHtk5uKvxdFU+znsBdqflkbwqEqM7ftblaxnUP+hup7VQPIgDRv8w32mBSOti0TvImnBDlfk9CtMxd+OqwInVDCWeKLVV8nIpTNbHpNjPxwuB114BGwnlScuRd3hdeE+1nRGJUUZ4mf3Tye6rqW5iLECAqftoglPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5bfrGEpcDlwIt34rDQ6Kwj4z0gh6xYDO3jicc/PZcHI=;
 b=GEte5dHlrCunPQifp1EJ5MKu/uyyrndHSAMuraTrG8dicFMJgWuLJXuxkQjQl6gGkm81pGwBeXQ4FJweAoyLkhmTh4jSGjmQZe5jKgAtwDh962eukpRntPP94lf4gjfPb0kW0YsVhxEvDN9Vz9+pMqXJiNoEw/8ZshH95r4LKjVxe8s5PqLQ2yBXNGZ6baAgyYEhxOCTXASagAkZ4WOl4PyV9h/B+H3FKlCKlhIwXWvNxq7UyySkDdC8VCixWe6z+Qa4WlDlbkJpm/eO6TONXH80V03a44qrsebjjl2FN8yPD8JV4+P92o/6ptVdF/2A3vW0Tb6lCP+ekbYs7Qtoyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5bfrGEpcDlwIt34rDQ6Kwj4z0gh6xYDO3jicc/PZcHI=;
 b=EjqKhbGSqxBptkTPJe1ttwsxv5woriH/N+TpKo2uqXYUemmfxEwINFShaEreEPqRlubnuvedeyRFZ+9mPqPvFujYEnH1gwE/bjIl8qLMy4s/0NrzWHb4ypfAlsG9HE/bHhcFRRN+702QlPyUaHfsXHDYQzjaeV0JABae+1I1bOE=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by PH0PR10MB5530.namprd10.prod.outlook.com (2603:10b6:510:10c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Fri, 28 Jan
 2022 20:38:23 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c%4]) with mapi id 15.20.4930.019; Fri, 28 Jan 2022
 20:38:23 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v15 03/10] ACPI ERST: PCI device_id for ERST
Date: Fri, 28 Jan 2022 15:38:02 -0500
Message-Id: <1643402289-22216-4-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1643402289-22216-1-git-send-email-eric.devolder@oracle.com>
References: <1643402289-22216-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA1P222CA0007.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::22) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e6b8079-018c-4b52-e2d7-08d9e29e20f9
X-MS-TrafficTypeDiagnostic: PH0PR10MB5530:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB553085938C738DD450CBA7BE97229@PH0PR10MB5530.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dXHKQLQFkYA7AAmRw0GHXXSDWLJl2iJTnbEzGX5Qi3ME0tNJjp3t5Y6rJ6g61NMhkIEFeWEoax2rMDQf2sRcaymKDDC5xzKp4rNkRkjVe2nH8frRns3S3V8DHtRp1swukbT2TppI3DAwMDKHjXnZsnmBsYDy30oUixXmmrzOkQ7DuOVvybIAeL/HpZbhOm1vTbJewVKtAhGpgINZjxJf92Wp/0kx5/x5pknvYcDyleT0t+9jrea+zFG6iQXUtr2JRhXaKPML7+H8yQSOa4OmgDwXNci4VLZm4RfhA3zOSCosrXfnXuZqO2ijjjVC9IYQYD8rWt3kAvO1ffV3YQQqzQ0kr1irVsNb4rhuOv4DPMPkAkckCYiYnQ8TK6hyRR26nRgWfeU8h4gVSaWnb0xFK1U0zCKDNMUPrfOyZ4j0nl2o+XOnCH4sJ/NVtY7mxwz4+NmLHPfQYBIVjqHxjftxCCrWwv+HBoHsGtwNS8Ux8S4CUW6KEf3rkOymWYx55GTlwABiy2t8ycQrLXOMZtpC0J54C+38Q466ajHvwj3ZWlV7U5P+kDQ6SBt7wAbiDKCyvmNrdtn1Cem06Dv83CB9n/3ylb874NXx0c5kOfYRsPMHJTeRvr/fOGD8Z+GW9c6S96kFHEwQp1mfxEFQwPAygJ6YRHGskelx6TvaQ9fmDS52u303XwTRBp+BZ5WMVExXCDJAW8zgPiNOibK1PQm9dw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(52116002)(66476007)(26005)(4744005)(66946007)(6666004)(38350700002)(6486002)(5660300002)(8676002)(6506007)(508600001)(6916009)(186003)(36756003)(2906002)(4326008)(107886003)(86362001)(6512007)(316002)(2616005)(38100700002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wxMCRzfqD0+65UxSpiiX7/SItVpTT2uisAqJ0rpbe+lIsGImCqZ8DiQSlN+B?=
 =?us-ascii?Q?ngm6sVxbJj7qi6FBRT9IK4FVDVHqq5FtvbK5iGRYj+f7gAAb2qAQv9YQbQOE?=
 =?us-ascii?Q?+aKdXt7BOAVREX72CySTOFcppKKAYx8KFz6m4h3xfHoKkjusSfrfNqoZKBp8?=
 =?us-ascii?Q?jtvD2bGaXduSIMWXs3CekAOLPrpUAC0ONRUIohGjI5bS5AHTfocrjtfV3qh9?=
 =?us-ascii?Q?dV5QMSu4PZ0nG+LYBhTAStl1o6WOTkfWkp3eGPrkdhgPcTda+vzOXKrW2PRl?=
 =?us-ascii?Q?VZzVmfNjTXRik5wc6WMrn0E/Hwu2BBBrjx3cvTT3Jkx57AG96yOyB0crXbdl?=
 =?us-ascii?Q?/whgpOLcvYjeVEeE3hJloGfhPt5D6b2viblWP/r/M29yKFR/LdM9IQjQ/O0F?=
 =?us-ascii?Q?RcMVw/NnqiBK5toOyfRNCFmIoh/VeukZCjrFFEEikVJWY5ZlNlnS5txJyqjZ?=
 =?us-ascii?Q?0+f9BkupxPB+4I7wX5HrUlt5CcL23OXLdYKRwoo5QaAArIXMLj7bE1YFVevZ?=
 =?us-ascii?Q?Elfc+pKdRy71i5l2kJAeWai0CzRej3JKsbd+/8IiPbVFfg/DHWjQcuecINV0?=
 =?us-ascii?Q?JMCWC23f8WnqabsyRyVROwPY9jnCjimxEYYLyhQDs6NoFzKfyxxgFyrNHeaq?=
 =?us-ascii?Q?5WUNarJQLJRbzRyaY8gL0ybzNi6rxdZIyOdZ3zlvU4BknP+kKOGnBaTNfidF?=
 =?us-ascii?Q?W0QpiA/4NRWCrs7Ot+y6Y+mphNpTwL7ymguQYJfuIUHNyJhA8NSelbbPBSPc?=
 =?us-ascii?Q?+6Vu6lUHy8wMoxLLRtYywgtXyxff7WXLwMvOVZ8GY/l6wkVz+G/+NjTHhDw4?=
 =?us-ascii?Q?p87CKf31Pr8mBXJlhFhcuD7sNtzZPrYbiIEWVZhqeUYg1Xb2F7K2t5B6qBa5?=
 =?us-ascii?Q?yUDMQrpIaOVctv1AbBE/7zqe3pmPCKaY9/5pqgW/KYVTp+qRnUVwlYQa/RPQ?=
 =?us-ascii?Q?FUhgUtFQcc3wwBOecS9ckFgskvDQQN3Si5SZAFDbDvQhwYd/kJcs/vv2IeTX?=
 =?us-ascii?Q?xUBTTbmWJGgGrOpkAQfxjdDwGIK2PZUS6XWHRooh0rsZz7YUrDHtCXV9bhYL?=
 =?us-ascii?Q?IJwvJRZ/YUxQ/5pPVbkR1ZCAxdj+gWtsvFtD/9KhdjxHl8KUObmxD0vlOP2x?=
 =?us-ascii?Q?ZybnafWd9wT0Rw3YOkdJd203x3cXQJdvjKsmOJrIbUPMjSr+P84k7EL3Ft+E?=
 =?us-ascii?Q?EBiiFfOY6fJWla8O+etqHQ3aee+qUSQMOnnIeiSP0ut8tcCO4XtX0+iCoIij?=
 =?us-ascii?Q?IcU5ZFEvtpgn5/mILhAM5rGNiTyEplNW1Bm4tNJnzGs42MMiHdc41y8YJD6g?=
 =?us-ascii?Q?ECmcSgBgaJOIrFebLFnEjTLw/cupSae9m76xrAiMKxht2HDvS1gOnQh3xZnK?=
 =?us-ascii?Q?XxN7RhrJcRrlIyGACLdzx06tXBN4NeniML+m2XGboQuwM/XJKQPMvhu98Yn1?=
 =?us-ascii?Q?YQGi2/kKfCWD5AvkirJHGFCNN386Wmw4+Bnd303xUFe4EkSIf7TMsr3S6i7p?=
 =?us-ascii?Q?9PWqY5pMuhjLxntJWZp7QrGE1Wr9DAqrcxFORtOJvubfuiEpBZhrEPpB7tyv?=
 =?us-ascii?Q?Ipf5NSkZxCYuMI/fz+zNtPrHsYa2mgdH0lVwzsj/1vHR8zCUNkacdcifcPIx?=
 =?us-ascii?Q?SvtgAdV3hHPNDLy1xNn6VakMsRGVpILb7ZBxh9+LzMyZazpSaDe4TQ+bhC7G?=
 =?us-ascii?Q?PdCRZA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e6b8079-018c-4b52-e2d7-08d9e29e20f9
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 20:38:23.7251 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +1LSoWnS1YAEzW4VL2Xf9lZxdveKeoVWu1QOtqjWWuO5mVUSK7H7JMKnrKGGIs8gBJxP+NqclwNHI0aCtkX8MrUG9MBCw4n6yI/UC7iHBxw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5530
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10241
 signatures=673430
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=929 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201280118
X-Proofpoint-GUID: Wus56pI7pQXznQUQeq6vREAadfej9YB-
X-Proofpoint-ORIG-GUID: Wus56pI7pQXznQUQeq6vREAadfej9YB-
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


