Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 644113B8919
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 21:18:13 +0200 (CEST)
Received: from localhost ([::1]:33540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyfiu-0004gt-En
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 15:18:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lyfZ9-0006y1-L8
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 15:08:07 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:5524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lyfZ2-0005lE-VF
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 15:08:07 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15UJ6Sf5005959; Wed, 30 Jun 2021 19:07:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=eHHDboAr+3QTfgez9yzEOmFZ6nhz+PyPoLteuj/+Kwc=;
 b=bB69q/OijVXwUrm5KWlFpxuif1cPhS0Z0360ttesYQ1kS2NDqnpNrRDI9M4nklebugQ8
 HB1Xs7bhLVA309Nfk/7wLVJJoJeKrwCo2NBB3rn6vI5yWU34hSKfTrxDs5xHf/Q/SnG3
 09pn3Wn5f7faPPl21X6+b/+JL5d4/oBIfRuXoKN7QSolWFq/2FEFsryl8kKYEGkgNE/f
 4qbKfDmHbY/Az5mMf4kTZEfCbzdXLrIMOwXC8+r1C2dbSWA0qX/g2PjugXMMeZ7DxjV2
 2JRWXNbWDivi/JfvzgIMMBEVXUCBDqga6ax8mtC0qifS0M7ljSkxvEYc0QJlOJ3arLno IA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 39gb2t26wy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Jun 2021 19:07:58 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15UJ0CFI101369;
 Wed, 30 Jun 2021 19:07:57 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
 by aserp3030.oracle.com with ESMTP id 39dt9hqny5-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Jun 2021 19:07:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EZKyPcm/dY/C5vQ27qhUIsi5sSFOyKtVqwriNcddmqf7FymGbId1ZaG8A2NHiV3hPownecIHAZvlGfXYAlGCk7X1Sp+gV+e9XoLVIXjV6/R75OrRNNZG9jucwolMEIY2XXimXphaCxBSjq0scNjjLHGbcR3fem+E5DJC/VN31cocH6lJI5zYpbi3LvYaDIMdHheodh/5xqGv90CaVOIZ7Qdr77VejaGMFkSIsrYhpIf7+PpWy6JUxaR8xQK0Q+l0/suhLbtFSWT6VyoSv23JMMp+iyXNIGNYobo3YLfmiJ9OVQtrFeYIh1FSTPgI5S8z9OAzWi41gMfgJYkHwTGwMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eHHDboAr+3QTfgez9yzEOmFZ6nhz+PyPoLteuj/+Kwc=;
 b=EKX3/Z12EpEJR6ZPIoxaaaPTUNFC65z1OVB9PMp14By5GBDEDdEu/65+x4d/fcCr2QsJtNBjcEcXObIgp0NmqsizESEYDFS/oqvQhbw3J5ECwP7fqwlQsmksqCkZxCHKZWIdmBab7y5szVhRVDXa4ZiLsmYqwvBafcjyPWE7XN0TGSAkwidnnRStH48TIpJvgfnenZsBbtfKIvTAP6ggWqwp1EnnIJaRofUi4sYIdjEwvXOOf7LRL3/hn8KHM85yLU2RMAeaxLtf5/2JavU628jocgP+s4PiljdB112qFWNc/XpjzAB4+FxXsSiSEQblzNcpUy+ihLTtSExlN8U56A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eHHDboAr+3QTfgez9yzEOmFZ6nhz+PyPoLteuj/+Kwc=;
 b=cTaq1MwBidDgw2DOrSFNoX33MUtU2pmDr4VRZEp9tEXTeM34uytvXgvI4dGssXQMbsKeVHVH1A28uJMKJYTi3izAGacbFuINvtwW80lpQIx9xM2XNACuRCwKfLEzsuBR90JGvesIA6+dXbBgMkfJJiKssA0tm5BY6f1aeuszEQ4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO6PR10MB5441.namprd10.prod.outlook.com (2603:10b6:5:35a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Wed, 30 Jun
 2021 19:07:56 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc%7]) with mapi id 15.20.4287.023; Wed, 30 Jun 2021
 19:07:56 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 03/10] ACPI ERST: PCI device_id for ERST
Date: Wed, 30 Jun 2021 15:07:14 -0400
Message-Id: <1625080041-29010-4-git-send-email-eric.devolder@oracle.com>
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
 15.20.4287.23 via Frontend Transport; Wed, 30 Jun 2021 19:07:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f29f5b5-3f94-4c98-f399-08d93bfa5e42
X-MS-TrafficTypeDiagnostic: CO6PR10MB5441:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR10MB54416CB8402A6CCFCCF489BB97019@CO6PR10MB5441.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 972KebZ0eRtZhm91Ma64v0Zb10h+ThLTQ3MlgA7JM7toNXRL38Loevggsp6sY3TT3lPhnDF9pr/U8q7YQkUyzq0y9Kfk3h8+rkwbPu5hqmkh3zYmOoGGUv0Mw4mkLtb5b4MKytYMvqZwPN+s+iUfcPsJEsp5MNYxTcTeDfkMKIEnmlZUPGhJVhnCP56ygBIcWs3baVBooZ5wjQkQpVHVAr7Bb8isZi8Ho3+gDSIDOQJC00Iex8PcglWMm13NogGzxPh8pLQu9dNoCMHbc1Oo1xzyuFifseP9gbXBK4lgh58DnPvL+ARfjvcrUcrgYKNxL+oymm/y8uMHq8nG8LLMtfTwXoDUscWywM5ojUoCUb0JxwhCSzAwYIR5a+SaiQxmvzbyoUMoiKcsfy41fU6HzGF1nXm4fThavcEG3QPK45cI2PvLTKWVPoZljxIrCDC5y/LXs3hbv+sZKH5qoJpchU1uWuZdCS0OAzKvYbD2GNyCWpUJLFAyclnEwKwKyC8SWZizERCPcOWwCKprcdSTwOHasXMxz5hEAIDUmRKA25h7fZS/LrURhMyxomrteOF35SFgHX23+L30i4GfbHJSkyx2t4SjJc+hcPpJXtmZD/8qkSKh7ofdjRSDTuMIPT44GwurCQUeUF/ObherpA0ihFMxh/tK/wOCYwh/zBZfjStFPn8AiMgNngqtTNwU2mIaX+oaTaKPDX81DznjFnSxOg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(346002)(39860400002)(376002)(396003)(136003)(8936002)(107886003)(38350700002)(38100700002)(26005)(36756003)(186003)(8676002)(5660300002)(4744005)(2616005)(956004)(16526019)(4326008)(86362001)(66946007)(7696005)(52116002)(316002)(66556008)(6666004)(66476007)(6916009)(478600001)(2906002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oQHg+IUsvAcDolSp6+WSYyNPDR8Q2Qu7HgNXT7LS+ifLFpmhz8DepJoPT/KD?=
 =?us-ascii?Q?YMKMTxW6TO6n2OzowPWiM/if9rMIm+2dX74Fk13l+RLCFq2eQ2zzUOaIGskb?=
 =?us-ascii?Q?AXMv/gYgw9mcCFpPtHAAdvFh/swi7YbvVnSqe2MbprNle5WsXq9NubvGZhP+?=
 =?us-ascii?Q?6mKE5ehWsIU32QdPY4BllwxnwrRJRbEjb/AaC37jQkIPosHzLOGHAIzR9NPv?=
 =?us-ascii?Q?IEhHTQqJjum8koyghHjHlkfkEIioRHz8JzCq9kYNgp5LpfI8LMs0tpRk2DwF?=
 =?us-ascii?Q?BtuDXtchDTe1zgKD6fL8NLlhiLoGb0QTCLWwnNe9brOtvogKIalKbd20EQBu?=
 =?us-ascii?Q?6QdPa3sFiooP1j8deJ+2OdxHJG2RCSTD1SgxXRtXV7eZtf0JzUmULPZOT21N?=
 =?us-ascii?Q?HodHrUhGT91z8JzwFDYmMjL0TGkdWQr4l1xZad4wO9rxM3PA9ELChhELpxZA?=
 =?us-ascii?Q?t+hIyoz+j8VTEBUO3Yrq58oEji34G97Te7bWX1hZGFgHjIZwRRijL+fM5vJP?=
 =?us-ascii?Q?5LaJ+LaMDbGb4v5AF6o3OnG/H6Ky0R4lpzlNV29hdXqi7Fet9Gn4E7Zzr4TW?=
 =?us-ascii?Q?fQhkQmU7pXKjnLB0P3nsUeYeMsTBMg7ofiTYwZHnccs2Y0DLhR/FJJ6j/qMp?=
 =?us-ascii?Q?PWrpSBa+6lsKxYGkkWxH9c+vDhWA6Lope3TyfZG9uIKstI4fgif7/0kpUWYL?=
 =?us-ascii?Q?VFCUNL/LXWIQtMGjI9i11+sqLRgNvDuYtgoOjk1ygniONKpPGWEtQ5L1AlSq?=
 =?us-ascii?Q?uFBJ0IgnBEhxfYCDLH7AslVB+LS0zTOgJeZumcpLw1YzeMq8OcbidGPEZRdg?=
 =?us-ascii?Q?oiRgU9vq6rT7NP11pY24x4+AhpmyuzKqJZI/Erap6dSupJ/3lULV62p8HjK3?=
 =?us-ascii?Q?RvwKtW78tl5I8Z3vAmwPH1zSgAVe1WnXQZb6GO8VbrqEl9RGumDATUaJZfd3?=
 =?us-ascii?Q?lQyet+K9GtyZV6MGpSaz25vDM3BCBKmsVtgcb1pkeoh/Wjilya5QAxevLMo/?=
 =?us-ascii?Q?l+d/k2OJWEhBLSxgSjpZobmP49OjLAeTvX15DZsG2ZrrYRJDbF5b9mhZAvfC?=
 =?us-ascii?Q?KtzqQ9ojzXku34woK2oZhOTem4DStLFVbgufD3ehn+w6QkFZkbTUzZ0r/LtT?=
 =?us-ascii?Q?A+MDnqfodaDrGpTeEurZYyLkBP14lYQuZG/pZocCUI6Xaa0f3EyUvB0gDlfR?=
 =?us-ascii?Q?WT+fC/DMyW/ym8qxlNaPjjrw0JCUCUejrfIQu5kwrmM2zW/Kb1JesfD5++y0?=
 =?us-ascii?Q?gcQP0plLBCgg0diWfiRdl9jiU9/e6Fo+2YIcZ22iA1EG8NhEG0Sxxm6UhbRm?=
 =?us-ascii?Q?s1F/Ir2GqGGSUULRxDLhRhEi?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f29f5b5-3f94-4c98-f399-08d93bfa5e42
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2021 19:07:56.1254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4BbKdpX4B6X7G9IaLdPYctRP/YhIZhRL9S+QRCXquYLuaVUnWUo5vItvfYfTiW4SJHm/Ts+mLL0Vo39xsukIJ6XmsM5oLhELB8wC5WouGqo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5441
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10031
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106300106
X-Proofpoint-GUID: tgww3rbPyicS4vtTMF3rUy8x21PKudgy
X-Proofpoint-ORIG-GUID: tgww3rbPyicS4vtTMF3rUy8x21PKudgy
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

This change declares the PCI device_id for the new ACPI ERST
device.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 include/hw/pci/pci.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 6be4e0c..eef3ef4 100644
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


