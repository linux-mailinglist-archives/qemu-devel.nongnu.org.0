Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C3349CFC2
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 17:32:04 +0100 (CET)
Received: from localhost ([::1]:35694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nClDH-0008Ua-Uz
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 11:32:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nClAG-00062e-LT
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 11:28:56 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:21852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nClAE-00032N-Pl
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 11:28:56 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20QFotfB022427; 
 Wed, 26 Jan 2022 16:28:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=5bfrGEpcDlwIt34rDQ6Kwj4z0gh6xYDO3jicc/PZcHI=;
 b=gWy0yHc4EsC4IczbC9aGMtwSxNy0YOHQ0VHtUpOAnhjL2MsZFiRhIsZcMc2ZPK/SmNBU
 ltIkSHjP2ZsOaAYkuiZpwQ1Ttvjp15GF+VGmrmiw6o1u0FcwYQVIeHpjHOKgDOnG5BzX
 u6O4PPv1rN00igkCl1hn/Qrx/sxBAJjrM9uc7C3SV4Hw2FG1lyr7ZTg43XEWkvv7BErC
 vD2r7CJrOXAEMaIQinsRv5bLz6u13FwR8faPZCUt0YO3BKa4lxNiAZhaeVxYnXhBwtLo
 ivmRgW/1d5HP9cddnmlBH+Nd6eLgZsFoC3kbLWNIysCul57+AgAHMAVkj+nmjyn6HWu7 6w== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dsvmjf3qq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 16:28:53 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20QGB3UQ148885;
 Wed, 26 Jan 2022 16:28:52 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
 by userp3030.oracle.com with ESMTP id 3dr721gta6-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 16:28:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jng6p0l4EO/P+1wKjvKfWtt6AXRIDd1c/vUxsye3wwXRPGS6jDIIAqpopDGrYQdsisxgi82CUpcIbbWw+vfwuETlS32YuEsh/eOaOcUhxkSE4fLSxvPo+01px5m2RAK8azni8yEAbe2A4g46l1X4exJFD4M070+dml9/bKpJvRMP5H0zGi8B8V1cgNTqrhCKJt5MSqAbLwmbBbxxzNpdFsD5BbG8hGyV14Aq6zffJvi+C6VRg4A4ddQTCAsyhrkh60DhQDGNO9IsIGg8ZpF40v+jDqQa5ZCAHnNfuIb6cxZAmNLtk419uGy5VffdksGpRFgKEzR3hZmvzmhshnd2PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5bfrGEpcDlwIt34rDQ6Kwj4z0gh6xYDO3jicc/PZcHI=;
 b=g8JnyXboflcllXO+/2xkT/3r3xyycRFylF7ZshaBYNOMTg51UdjUzPu8QfRN+UvbBWxBY38FZu1tBuOybnOTgZrTpK4T6vwRQrAoTRsrXfr0yzwkzFybo2sfY7qtn7lbawYrXBReeon/32JXILwwO7SIFUKqIstcO5fv0Q2cYr7JBq9L+GyY9U7E5Gjt2AvMX2z+tVFyLEpSudk67Ri956uzA0VHEIo+qOUFaRaeNs/YPB6zf/wpp57Nf9dRXldpEIMbYwbd29xKyqoZNIgoMkaygjcfGMsAr3iEev1alf96Zqt3YDXb8iTChSE1/CGLL7mZ37A8uklFjv6VaBx4RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5bfrGEpcDlwIt34rDQ6Kwj4z0gh6xYDO3jicc/PZcHI=;
 b=jJPQF5sdjAMaWDUxTONqkVKRHhSRCk3fFXkONhNjbJrlHibHlsIuBSqxfxAnG6PNPCrF8at7bhJxA8JT/IPTq/ByYHB2ihIlv6TyZk5h7QY3R7iyCA67swbQl1m+pQb5NXFpcYp6fFrwhjj/f967RoSOp707kjV/ye0n86iM4e4=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by BN6PR10MB1571.namprd10.prod.outlook.com (2603:10b6:404:48::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 16:28:50 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c%4]) with mapi id 15.20.4930.017; Wed, 26 Jan 2022
 16:28:50 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v14 03/10] ACPI ERST: PCI device_id for ERST
Date: Wed, 26 Jan 2022 11:28:27 -0500
Message-Id: <1643214514-2839-4-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1643214514-2839-1-git-send-email-eric.devolder@oracle.com>
References: <1643214514-2839-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0223.namprd04.prod.outlook.com
 (2603:10b6:806:127::18) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5db1ba0c-e908-4f30-6b17-08d9e0e8ef58
X-MS-TrafficTypeDiagnostic: BN6PR10MB1571:EE_
X-Microsoft-Antispam-PRVS: <BN6PR10MB1571CB2A7D141730ADFA173897209@BN6PR10MB1571.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z7jVp2PDb8VTqr2P4twiPUdiS3sYdv0LwH9ukN0dF+nferAsHIHC0yJ3RMvtZ+LqKYFd97HfxNKK3pePuz6Alp9YdiMYY3doAcIekxJCiBo92F6RD8o6KbYhRPxc/HID2I8x0lWrvpaVbpuV/RusC0kEypZXcVQiLelgRwZyxR1QlNojaTwMjwJP/B1CdiCNLmcU34b19u+uXf9e/+rnS5amV/MrVIuA8XUhca6atoFFmasE8tE27iQkkgzniel/Xe1GZD4rDYU49Rph8cVI5wiGe/BND29rI8bwdX3KDbe1IavSZZOZkLgWfqqfvyM+zoOxl4F0I6BAhHtVst0YeWXCqMMemCj6fKv9AtDFLML3Au8kMdMuhwhZlRvJSmHz5+0Y53eVefZcjScyczpnUdvQYCpTPL9K9IHkuLenaU8T2oSqPey7Dzw2IKBxjoYKhDWVJxSygn3pom+R+tHfBg+B0a7JgR3ev4MZqSdhwfUfetTqoM6cjhzly1tu+vrX/Sl6q72jjRjc4Pwct0lp1afqSuiptXAPAPRR8nW/wKFgVwZrKVbRv0jkoX0mBaKOTgM8J+oacALQjduvz0A/ih70WNbGVN9lZSu0aoypnNLWvYtCKLPRyA3aXkYJXKjjioIYxx7cpghOlTaV0WAWvZ1/2BugcMjF8mgeoPWh1jiCKC/K3YN+SakI5jhq8SxzgBUII1XILzf1L7x3yRO8Lw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(4744005)(6512007)(66946007)(2616005)(6486002)(36756003)(2906002)(52116002)(6506007)(508600001)(5660300002)(6666004)(66556008)(4326008)(8676002)(8936002)(6916009)(26005)(107886003)(316002)(66476007)(186003)(38100700002)(38350700002)(86362001)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ny8iAhJMHPxWXPgtycPiEjn2tNBxVkPxiFUu9G5iBH0mPaGZRmtE0Wllkclg?=
 =?us-ascii?Q?+6WvGYlplqs9Pnh73PtqvUAn3y4TmtOs+C4MN8raSdNx/1FaGER/L5aQ6B8r?=
 =?us-ascii?Q?nTODdL2iL65YxnFVFHUKsXlB2XXDsj2+9Iivl9GiHRlE64i5XkEbmia8udxI?=
 =?us-ascii?Q?nKTS74TpmEKQyWDe2BoR3voZUH1cHqYYRHE/lxQ8A2Avycz6Kdkqmqk0KOIB?=
 =?us-ascii?Q?B8e0KRNWWbXCQ9pUL6dpafEFZs9nBFa3RLlNixadV9JFmpPFaxnBGZgIvowg?=
 =?us-ascii?Q?NK0T5MLRgFp8HSk4cR8Cy2CYSiYg8J/7m8KbBOs7oy7IsUeXo7mDf3Q+rMHW?=
 =?us-ascii?Q?UtK9Xp/DHBtIzi5szEP6CaPphuCRBEti9s+4wh0Ih/eCWiJ7RCXq6e8ia1BQ?=
 =?us-ascii?Q?gXV9miiAaY4XxWtJGltr1K/6CFSzWrT4f497YglSDc19m3Z9Et0iXLtRnRG9?=
 =?us-ascii?Q?XMJ8PKPGiilS0Kmya2g9lt+p8Shrt+k0XepVw4/KLAPatt1kS3pkAElpRAiv?=
 =?us-ascii?Q?S0UZPeMUMrOKKvpYySc4i44yuvP8Tz01ofvIk+quEi1FVQTwxXTQaOJs4v+M?=
 =?us-ascii?Q?lSrztMF8hmjECTqaNLuVARwV13ODPEhGDUFAnul7wt/pRGd4vgHMLL6GaoX0?=
 =?us-ascii?Q?LgDmgEPUhn/x6V1SQfjO/HOvY6fgeamJ/u2gHABFQqgzoHkqWCHIY+EiQPBd?=
 =?us-ascii?Q?eMBxtiRXJeVS0KsW5dOFMhZ8LBDcve4pMkkYP+T3YionEnQcDBsSv3Zwj6wl?=
 =?us-ascii?Q?o7HTvE9kWF9XvA9EGyFkl7c6y1hu+ZIqzQhUYrQnCbILKA1EFh2odT+AIqud?=
 =?us-ascii?Q?pmF6sNEe3LMezYQAs3hiBpm6wik7wwqgQPeY6GO6Sq1ObjjcIYDj40z9EflZ?=
 =?us-ascii?Q?tD8oIqZZfZhfGY0O1s8y5pyMeSrW9ZkRHkxItNq5IdpSqWDemvXgPJ52NRRa?=
 =?us-ascii?Q?cGsUPS/1rVO3fGbDNJAhrAEcdD+pmyySQsOHJi11YxnL3UZL/1qI0zgSwe4Z?=
 =?us-ascii?Q?ppP9OqfryrTXwtqGfX3kPw9QUQSu7FeN541HRlzwkBb6jaJNTq63ipAUDyUK?=
 =?us-ascii?Q?08J9kPDvc4Nh4jm5Nua2ZwGafvzVOh74Hpx0MwptapMXzNE34PBuh34AeLGA?=
 =?us-ascii?Q?2xgXCEjowoP9TkiqG0MPgtWV+tAPS1MVug/Wmvkrw0/TJS/IMPCI94ILEhww?=
 =?us-ascii?Q?xpOdrWJX5Du7oa4SOb93QjNF5DrU40hOYgNQgz81NhPtdlQBxQp/aEHjnJJ1?=
 =?us-ascii?Q?jaMW85uNiAvUzcOAYLyknctYlzsQ1H80HqjnG+e3/ww2forvw/IWNAdhmqz+?=
 =?us-ascii?Q?XVIuKTaPxoSX6ffuFRpvqcRq3NFoI1tPRrRReD2gcTTSJePFNAROtyDW1YiN?=
 =?us-ascii?Q?gUxiUp6BewYRrVCoy0tRnT1qtdzPtloM3HD0/Zos2ebjUK2GAfx+0BuFBU2N?=
 =?us-ascii?Q?NeAM8Ub0Ga9e6IQTsPJZzGtq04DvZKu5s/w+QcWp8jCgZUgFu9dHSOr+10nP?=
 =?us-ascii?Q?Xu3wA/RaFV+qfQP/8IlBkUz8LXcxumLIp98oRawKSFAZq3aA1tTjz1+FoG1h?=
 =?us-ascii?Q?eWwk5cgnJWKqKIlct1VwZokG863igfRObQmfw/3buqBH3CztJ4u4zxC4AtrC?=
 =?us-ascii?Q?x4CdZgcvaPHWVvGk7Iau3j18Y1RLIoXYS0PguIFQH3fskNRb/GCKDRkdDOct?=
 =?us-ascii?Q?I3Tr1w=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5db1ba0c-e908-4f30-6b17-08d9e0e8ef58
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 16:28:50.3641 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NVEzhxFVz4eH3D9Zjt6bnPw2ziMEK2EQnRQmuFavVtyHxcqbm4Xb2sxsDcXsu3pti6uxSHA8m5YUTzDM+461PFhzLsgm+iPIs+H/SU1ba/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR10MB1571
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10239
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=928
 adultscore=0 spamscore=0 bulkscore=0 mlxscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201260102
X-Proofpoint-GUID: OZCZbRtPezsUh15YYF3F7LO7ah1lAsWP
X-Proofpoint-ORIG-GUID: OZCZbRtPezsUh15YYF3F7LO7ah1lAsWP
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


