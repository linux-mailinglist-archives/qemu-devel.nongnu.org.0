Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F368B475CF3
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 17:11:54 +0100 (CET)
Received: from localhost ([::1]:36286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxWsj-00026J-UZ
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 11:11:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mxWMp-0000j8-Jc
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:38:55 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:6618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mxWMm-0000Ui-Qh
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:38:55 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFEYwLl009078; 
 Wed, 15 Dec 2021 15:38:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=BsKpnC7kaLxk41JtbrSpabPZ/1RGHWYpBxzYnzfhPiI=;
 b=id2hEJ/YgyQNjhm0oc7/vV2Wok9elSriBmI1947OBO0TlrY+AYMQMolgfziZWRjO7RMU
 7R4NRWq/ak5eZyhkQPh/I5zOYEdwPW6lB/vz10/TW3xJUAToFO9Vf2hhFyFUroJD9ES1
 v2PB4+Km2P8Cyn0bahmo2iR3NaxvKfIvilN+2ZegRWSxORMhJ3XrODmbgIOZIxzZt5jA
 dyclX9dngoLosZxd0p0CptSl1wjo4tDuDZOAYy/m5wd6TLOB0i8BwQKBosbREfv0+UpW
 syy0+s7gI/KWxgRgLVF3Zm0zgMCRFEREEtqeX7fy7x4q/1Be4RdOTMjkbdkhOxIJGdoy dg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cx5akey71-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 15:38:48 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BFFUWwG094240;
 Wed, 15 Dec 2021 15:38:47 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
 by aserp3020.oracle.com with ESMTP id 3cxmrc0ww6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 15:38:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FgXdHi8QT6IZciTHOVB/uXKLeef/nnhDZ2UKQEYfu+xt5D14XZI7b++dKPabHrxwalhgCw7LP6qtcasXZ0M86VzSQuL8WXPjX1ClRt1JP1tuP/boNhdBPwuVRGJn28xoThOgA9rdEkyGO5Q5ofeykX1rnogxwITNIyo1fq7O+EW8Hi3KTbMRDVtOTkcTbadfnjVOLg3pmZ0T9dfdTx6nvIdDF46z+jVVhoCNXSv7GA0MnAR3PgqHDeF9LCwr2PV2ABoLGYf6OKm/A5vywXy0/wK9chWWjJrBVEvuz1k6PLGE5JjXepBZZgLkD1Pkjren3fnTv7Bc0idt2YKkxfaHAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BsKpnC7kaLxk41JtbrSpabPZ/1RGHWYpBxzYnzfhPiI=;
 b=NsZIjk4nlYuKD1uIeoULWlR765vEbJMfMLc0UeFriVLi0SA6m57oZDV/rFr9Ff+0nvxXRVdn/o+w+lb2CjqIWmByRkjRZ61ZGnxp96jWGPOtjgVJm57ApRVkeS2tfWO45iH17b2GkzZWSJxCW1POm38/rkM+J2daB8+pRvXfF9GYQGCOg8mx1/K77gRuPzORx7l/53suljOsIXL8elarHjc0IZpjJucL5L5pIwATS97ZrgNp7CR2EYIG1XE1E/skQDQ6Bk4gyoyshkQ4LeDf5Es6TphCpY3dRa+5tZ+MDK+JQ/xkntPdBb4PNyGbmEy6M4nj+TCY9ZOLtMnunq7SVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BsKpnC7kaLxk41JtbrSpabPZ/1RGHWYpBxzYnzfhPiI=;
 b=DZ/AWA432Sb0r8IX1pGHSPOEyYK0aykfyddM+4GyT5Dyzbrsqf0sVwGASpfae+j68oMeFC94RkzHE3dtHj1JXvf9BjHiH+qLdPJ5YjhHnT1CMUOousB28u4xaR5cSkok1SgRGvj6a9zMLwuJNMnOjmef/mJUGHjo6kEnvnxtLrc=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO6PR10MB5474.namprd10.prod.outlook.com (2603:10b6:5:35e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Wed, 15 Dec
 2021 15:38:34 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f%4]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 15:38:34 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 03/10] ACPI ERST: PCI device_id for ERST
Date: Wed, 15 Dec 2021 10:38:08 -0500
Message-Id: <1639582695-7328-4-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1639582695-7328-1-git-send-email-eric.devolder@oracle.com>
References: <1639582695-7328-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN1PR12CA0073.namprd12.prod.outlook.com
 (2603:10b6:802:20::44) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03d81187-4f22-406a-04eb-08d9bfe0f454
X-MS-TrafficTypeDiagnostic: CO6PR10MB5474:EE_
X-Microsoft-Antispam-PRVS: <CO6PR10MB5474CE935761D5AAB14362EF97769@CO6PR10MB5474.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gat6x62l77Y+BE+83TIX7s0a053fKZrQA7JqGZ8pmnsxNTGMmyXZFMafQG5d1G9+2IW7QzauQxZDmWRjdnFuS8GznUoSlHFzYbTpUSHNTby4q3DXxwi0ilWGQeAoX3zfFHnBNGDY/YJGhcdidyLBacq9CzCL1tdqg2vX1Ymuw4EU1l0X/yrV9nnAF8EeOLhFHb0fVPO5qCMQmfP/Huy/OyktExRkkxRmR8lnO6TZNIUJVLek0LFjaWur+y5wGJCSHzOflWIkE1NdamOEpdFrSmjMpkisFrpBtRGdsWZo2A4cZv0bFbZN1PYtv/lFgc+MQLv+/yTqEwPflOoHZ3614yq4EdLA45fqntL0zORkSHA7k5H1Ma9IQZXnCF7QImJMqVR//7SKgxyugH4dAqwV4rT2Uxqk1NeAgYMdLGETDv/ywqWCTukdF+ldOw0a9EVU+i86slCXISlEMMkoYwjiVGF64BMdtdmBXPDrEbWnldTHTj4zKJ6MD3TGacbmB4lzT+z2uRAtgU+CJXCcmtpInxsmgCilA54r8ATyMNTLl4KbdznjHQ5y+7wM2ENPKLG7/m7fnIcO4/kwcjhYJGSDXlXu/sC5nQZttxf8PVeWMe0+sb+987qSETJjj7+yaMVhINEMTJq/hWLEb2gygHLrX1qduhHLssmvYrOSDhWkDW9Xjgo9G9J2+/Kl24u16baEQ9pzs8kbQ0G/NOorggyL3w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(5660300002)(4744005)(508600001)(316002)(8936002)(38100700002)(8676002)(6506007)(38350700002)(2906002)(36756003)(107886003)(6486002)(26005)(6666004)(4326008)(66946007)(66476007)(2616005)(186003)(6512007)(86362001)(66556008)(6916009)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H+SiAhUlGuJW9IPHKzzOcDneALAOO3kYz5nWHHnuVC7btdyOH4d0W6N/eq6N?=
 =?us-ascii?Q?cRyoQlEIc0hU7PEPk6LjMop432v//4+pwtr5yhpjALD8y+1gnAbA/9bDzVpt?=
 =?us-ascii?Q?QsBtQa4DP8B22mcGMp9GLHJbef07r046sB7ydDTnvFd5K3VjhaPITGvHzDxO?=
 =?us-ascii?Q?+XIJf0WCjNIBAoOtOne/PAiCQuf/k5eDdGuGHpqJjxRrIYrJfycrImm9mOVB?=
 =?us-ascii?Q?y1NxdxzHi83I+Nz7sVQUuxt7l/wqmVw8OtYcSIXBFVOq8NiYylZHY/YFhPiD?=
 =?us-ascii?Q?1XQ44kkbxW5FBRjEbPBib+xDb2DyhZ7NSpOu6OVNwkmE4c95Gr9LzyOmRVb+?=
 =?us-ascii?Q?hfIy5uBIx+f3dsn7DSsdOT/mRiEX6xDYuUeVVIsYYlo9AK3HodASI6MHPA4v?=
 =?us-ascii?Q?MgrSRq+2Dp5fTt7Aa/mXd25D2bFGXM94yX7wcYfBRus530A6Zty6/3wOTHW1?=
 =?us-ascii?Q?PrMLUXMzPW9NFAQ4pHGo6DYS2Qke2OrH7CF2dlS5wMkK1sgg9C6u4xy5qjET?=
 =?us-ascii?Q?VJjvTdeRk/zoNuutJlMDZaiQfrmuz/mnhuu+HkyWs2gkHwjjKfaXxs+D7raZ?=
 =?us-ascii?Q?KyWcSJoLfDaBZe2HlDfdbdBdMNyk+ryvb7rW7fM30fiMrX5Z3tqR0eHGYfil?=
 =?us-ascii?Q?sqMeC1e2h/sbq5EoT3a8+rPMX9kXJlRWLPnUkeaMbn0gw4PLmTIIrBiUwbgJ?=
 =?us-ascii?Q?kqTsbVmlbQYxOZCZohPpaGOtrQLolh7qt77IF7b1NOtUUfqE05tqGcy0T5Lt?=
 =?us-ascii?Q?hEVKvbTnBfL0gZgSbeS7fsC9JrpfdzykMzuJuxcszWkBMi+Z+mpxCO3v32DT?=
 =?us-ascii?Q?Iu8NRPIDi++RNPWa2N1IkqUKCz+QAJqqO/xBpokZj858gkDg5b3w7kDlicuS?=
 =?us-ascii?Q?+QogzYMLcVFUQMqRHoc/0NS3mUPst6Hj+u+2KXtO0UOWykOeBTbExofoLKlU?=
 =?us-ascii?Q?wRVbT237QoPfDFQ1aP7rShi9sM1IMBPsDcgeVtAq+gU1pCVOwO3IPBkkgapD?=
 =?us-ascii?Q?P47n/Jz4vrMEOwpi0sdLWrGe8ep+JuJJi82lfa2pLT75VcusuyE6W2Q9xXi2?=
 =?us-ascii?Q?Wn/AbQNXSMFyIQE8fSKs7iG3jio2AZOc8OmAkXezKN6lz6f7kfiwwP3ZIVFg?=
 =?us-ascii?Q?UaX1RNqpJEO49fUqXk/qnDsuvsTFrswhQEgWAWCHMPsyQs3PFK8KMoOfxCU+?=
 =?us-ascii?Q?17GrK4GMpOILGQKss9mSqhESTjC7jGP0B+l4RYv6Hb6iLo8pgfEeD03YY+BE?=
 =?us-ascii?Q?XdYy+39BJkcZkN77RMWhLGmdgmcoatx+9kUkYuJVzdT1oMzpr68YsCSKiuYG?=
 =?us-ascii?Q?rSgJ5aBdd4vq8I+FKFJPcf8g/42NCjtONZhABdlD0guPjVCbHdHtyLD7KxLJ?=
 =?us-ascii?Q?Zggoz25t+daD+zeWxOgQhnhh0t6a6FFD4OqrzEgBoNvCcGU4tUN6vYQI7fvo?=
 =?us-ascii?Q?hWe8DENuxceNrpsVPSOrmHgmiitDoLRLq2mmvJdjfTu/ZJ8GFKZSVOCFzjvH?=
 =?us-ascii?Q?/UGJkUPskpIYnVni7cy9a7G0L4O3to8Ly5Kj8AFjD5rdh0RYh+9jy9M/Ya+L?=
 =?us-ascii?Q?7rkO/HL3mE5F13FY+3NrDHM6UmtEeoyxym89wk2hgkkb86DuYYBTEL+vANEq?=
 =?us-ascii?Q?9k4zSnB9LuF3/stEBLVLGxaK5+75FVCtnfMzorbQH3L6/mFlCb3jj0TJCFI9?=
 =?us-ascii?Q?sITJ6g=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03d81187-4f22-406a-04eb-08d9bfe0f454
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 15:38:34.3924 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cluP1w8R+mUSfjsxX9Jc8aLca3kUlxGA5IMHjKpOSuVtxjtetJDmdVeicckJIzYeTcNTUPk7pdjsu99EmmdkR4xjO2LjPYvAOsHcWN6dIt0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5474
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10198
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 spamscore=0
 mlxlogscore=862 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112150088
X-Proofpoint-GUID: amPKzlWL66B6lKWEVz3aPDbwg1CtPKZA
X-Proofpoint-ORIG-GUID: amPKzlWL66B6lKWEVz3aPDbwg1CtPKZA
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
index e7cdf2d..d3734b9 100644
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


