Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0961D46F2B9
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 19:04:10 +0100 (CET)
Received: from localhost ([::1]:45532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvNm3-00082Y-F5
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 13:04:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mvNgJ-0007rY-Gf
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 12:58:12 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:17312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mvNgH-0002tl-JR
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 12:58:11 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B9HnC9x007294; 
 Thu, 9 Dec 2021 17:58:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=BsKpnC7kaLxk41JtbrSpabPZ/1RGHWYpBxzYnzfhPiI=;
 b=gSsIHOQh7YrOLLIJeLnVQUHayEyyIEnh+clsbBA48rR7QQpdGKhD2EFE8kmW0iHPOU51
 UrTCMB2XeLFa/GfVM/mAQ+agmrCLxCl/4pX6/cpV83ZXoKhDtDxlQe/aLw79jwa+y3vE
 Ge3zL5WjlsckQvbb7yHQ94mLYEDPt5aL/Lc0V7J855Wm/eJhLAp+lM+MIY9bssUtUjA+
 jm9K6D0Mhf5IVT3KUyhFeV1zxWgubD9D3W9eMaQ0ItVrH3ProzTj723H/YoFw7jreFZu
 vYyNAicCJ5HIKLe/9i7RN++GMKZMtXInvfQRz/Ka8QLGdn3T/qPwiw8Bif6ufU437gVm aw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ctt9muxmj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Dec 2021 17:58:07 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B9HpWpA190098;
 Thu, 9 Dec 2021 17:58:06 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
 by aserp3030.oracle.com with ESMTP id 3csc4whm9w-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Dec 2021 17:58:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RiweL2EiSXiczJTqrghR8qDCTryF9QXYn2lBFMx3bkFSyvD8taAvQS613+QotwXNJnuif11c4P9mDPfOTbQyLWuVGCDFDkk6sbiVTydcibPF8bVpHWNdrZUGjmB2Z876XNhUJ47tko3BLPNH2akAQRFoCcZ84YjpgXLI1KGR3omzC+l1Yx/LgCltah7hfzpUsaSed7sLbUC8vVH7oP4c7NpTn6naR0CiKM9wRRn+ByglEHLWzk3TYwX4WA3uR9Wlb12xBseHOdGnFrlt/0432o64hYGv/M8Wk3cC7V8obDxanOEVCC5b5eA0uOpgK20MnuA0SrdsCs3Sseh/8/8fdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BsKpnC7kaLxk41JtbrSpabPZ/1RGHWYpBxzYnzfhPiI=;
 b=ZEGPgrcIZbb91Slk/cL7fb+aAhPxTvuG64haqmSlLKStxNe7Wxu4CMwHbJ1hIMqdkdgIO6hat/+prKCD9FxQ+gQb1LBoUkg4aS+R+wunc6mXpkukVq2Lydlhygflszfr+OBmtmc13Qvci/FJsyfVrszjiPB+xGze14STajVMeb+C89DTYrUoRe6zssn0sy1zM9ARC915f9Ey//w+FiYZKMc+APtKIN8wWyaYJjl4zQyTHGXThZJluQca0tQpZlifsZrJMbx87IIs41/ZeW2CyiAax0uyadWkA+6iajGdUCLJ4LF/26AhJiMr4Q60ileR0qna7SDxxCCu83gKUQYTPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BsKpnC7kaLxk41JtbrSpabPZ/1RGHWYpBxzYnzfhPiI=;
 b=YFsUJj9Av8EJDoM3FYW3wGtBuZwZ6MdCqZkfZ2Qb7/cGBab+SvObyabnnQM1Zr+81ipSFSjEB9fv74fuwpC2m1ugly8q14S5INAHLIZxyXScLUnhI3RGuLkGwxPUD+YPYYqAK0JSkpsWbQX8s/PSJKUE7aG1YGJow+t/GCbSkKg=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MW4PR10MB5810.namprd10.prod.outlook.com (2603:10b6:303:186::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Thu, 9 Dec
 2021 17:58:05 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f%4]) with mapi id 15.20.4755.022; Thu, 9 Dec 2021
 17:58:05 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 03/10] ACPI ERST: PCI device_id for ERST
Date: Thu,  9 Dec 2021 12:57:28 -0500
Message-Id: <1639072655-19271-4-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1639072655-19271-1-git-send-email-eric.devolder@oracle.com>
References: <1639072655-19271-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0073.namprd04.prod.outlook.com
 (2603:10b6:806:121::18) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
Received: from ban25x6uut23.us.oracle.com (138.3.201.23) by
 SN7PR04CA0073.namprd04.prod.outlook.com (2603:10b6:806:121::18) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 9 Dec 2021 17:58:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18b041b7-c4d8-4ae8-16fd-08d9bb3d732f
X-MS-TrafficTypeDiagnostic: MW4PR10MB5810:EE_
X-Microsoft-Antispam-PRVS: <MW4PR10MB5810EB1254B31AA8F10209CC97709@MW4PR10MB5810.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J1kjDnsz0bHXWEbErwQzvdMMrRtG4VJM6+U4oVIO6NkBuLRVi09pIEWA+rH9f8gElHVaeVzpj10TNGxM3iwv+BNddmHHMrwHciGLQC4LLdS0BDZ5cmNtHAUkVC3lXxlR4c+5RjnOE0H5F90w1NObi8ISvqWcwAftREdiMx+KQsicRytk8HBIa0Z7+RNl6IHI2uDbNz+ex4diL/6NXwJhhoOk6eK8BQuwP/9MXXzLnCuV1Cr7Co5HEm5hMXTqCB9Zt0O1xmKuiGhBvvLRHtfbn2bM1R+/nPfdYbiJAd0dzHHeyncfWjwe8ckPZPSWs7l6JiRSaYXJb1MD7o9U+beWTVtfEYJOf5YuKY6z54a3dLm+/KklB+34bR1a2/AB77NAj2mTUaUbuaZb9SCjkhNwf7TZOCIWu3QVfeYhdtZR8dC97knqYkDAvDHb325piaTs71LaZ6DyVWTQPflqkPy8ZHKYieCtRlw0ko6n0u/gtYNYtozjP6Z4DhidgjTyH1W/nXhZHwxiptOOcTCA8QWEsx+EpVabRLPizn0T6GPEUfzcStcUkSyKdbfblhpKdiwCRyrK5H2MK/BC8/WGJDgaIsAbC6lCsoZtC6mRV7vSHNPI5Dp80IGldf0yAbrNILip1ZHADaZn0JV4iIMiwEOWR8V5/Ce3nwzB5SwN+yQqqAfkXxvyR3xp4MHBi9wKP8EwFF+ZM+cKUv5QebFAq0YV5g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(316002)(508600001)(6916009)(5660300002)(186003)(66476007)(36756003)(26005)(6666004)(86362001)(4744005)(52116002)(38350700002)(956004)(38100700002)(2616005)(6486002)(66946007)(107886003)(4326008)(7696005)(66556008)(8676002)(8936002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9oUpYj9pf1zGFSduY22ZDIZH0bCBSkAVHkFUgN5Aaf3oS6+emwzX04kzXNa1?=
 =?us-ascii?Q?Efjbj0L8OuoCYsEuXBy3ibFmkj8snDRLoSxm6bphB5hrbH+Qcg1BBPRzVEvY?=
 =?us-ascii?Q?Ln6HUNX/FecfmAxBxESGtplD100FFA8XO6feJuiORnJTLFdi1rzVfOT6j73+?=
 =?us-ascii?Q?WiJJdYjMb+mSGZkcsjbIwfk6+DEVLBjUnPgB+8bnuNzQ3pbHl1tdCBiKUd/H?=
 =?us-ascii?Q?S+kwxRzFOmDR5GLaeByUpGqOhAn/RZM2D5RyVNdcTR3jRn0L2gJXz2vtLY4p?=
 =?us-ascii?Q?6voZhgeyH1o1x6Y0uD8tauAnPpACDBSi2lcNnYDdtxZLEwaRoQc9fkylB+yu?=
 =?us-ascii?Q?s4oWN+1uw5omVEBKGlQd2341neU3AAk5vw2pVW647IrCQV0EhfR4vrkscJkk?=
 =?us-ascii?Q?O/tggTJSy/MUA+bKS8rZcVcTUK0mpC9pwoIOxTpVGFbthE3yxVDHOLj+T8Mi?=
 =?us-ascii?Q?/u1CM61/B0b6MxjkZ80vDyHc2eoJOD++0K4XXi4YOoE43emp8cWJ/ZQlda2n?=
 =?us-ascii?Q?TEzHRpEf3cFHh8ful07Skd79VdO+axu0AzfO0Apvmx9zEyaxGsRFQxNmRFDc?=
 =?us-ascii?Q?Pn5mQOQ1c/A72YZWzOTGF7LF6Uzlal007waq3j7vugvY6G5+pP+L6g/U9dQs?=
 =?us-ascii?Q?A5Uj6kSr4sdI2U4MYVPG9iVau5aMelfTlt3PHLjv+NSZ4YGP5pDr1dQnI8tB?=
 =?us-ascii?Q?bduV3DPdC367ae393MG5gsrbzOruYHx91HT4jvIKYekDwaIt+/jcIGIhCmB5?=
 =?us-ascii?Q?j/s3j/qYG3c2zcFnC1145BpL51ph8uCOqEcEc+K7ZdnTIPTBhcpvCYHhWEHT?=
 =?us-ascii?Q?BKmbTzXEdmq8cjPAhU7H2TjgZt9lEbdap1ANMDzZklf2/QKbsTrAi6oOSuXM?=
 =?us-ascii?Q?QfM++AAMPgsrwY9WmeP04o7HubOF9IyPOF+/O7fXoXhm17mUZBQiPRqoDG5g?=
 =?us-ascii?Q?MFsDHpr0m7gchL/reBkGO0Xlsid6LxcgXiNDcN8A4Apb/oNB7fQ30gQrC7ME?=
 =?us-ascii?Q?sdFl0HXx9fNdEC++XdozO36bdbMjwtXKncMosxt3lJfLHc3LvTBakclIXoEA?=
 =?us-ascii?Q?pcp273OlCsHaXjNfLBK7M5YrBgvkk4cBBmktTX1deqxIZWpJg9Ou/Y9HfmFC?=
 =?us-ascii?Q?p2K1b9+q4GIILwdbVm8WbezdFA/EtNrabuMNT6SZLQpshpPNOb42LJLchrj5?=
 =?us-ascii?Q?nXRgag8FeltA6oRoalmG/9SGeRctD/ERLlXRlFZkvHqqerrhADOWWG/5zRKG?=
 =?us-ascii?Q?y+llK1KIdK/jsdoD2WtfmlSFWSuDKDktdlvYQS8YzQO3grGwn8RaeS4zjIei?=
 =?us-ascii?Q?hKElHy4tSgXNFlxek2dNsJ/HQr+bFvRzMAVm3mp94kDCpqBHUK9o1tMJEPLA?=
 =?us-ascii?Q?kgBLhJeoaS7iYT0HlYyJaP5mMZp+d1SPOBbeF3uT1mcFGqyvJE67ywCqzxmp?=
 =?us-ascii?Q?aPayHlqrxCOAm9yYk4bjaT8UJgYWvTxPYt6KtMZTCawgOWUHNXkr4TR4XKRm?=
 =?us-ascii?Q?SowBwpICjahGGKAXbI1gJgZ9vImnbd5XzDAjzAR5RRNAc/3ETM7I0HF8U9Qm?=
 =?us-ascii?Q?Qv5DDIsJ2yr70nQePFUPVreWrWTjkvQRvyzW4HsHbK0lrtyOiJyd+1HPfuRj?=
 =?us-ascii?Q?1IZKWsOO2mnVk8ElFvEzmLS+ea95T4a9Rh1VGDk8S1zwAblmV8+G/0RMeGVT?=
 =?us-ascii?Q?SSf1Lg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18b041b7-c4d8-4ae8-16fd-08d9bb3d732f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 17:58:05.1375 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qaDNLFvUfktSc53gqjmXHexNvuFCPNHz/S1jjj4YeOLm1VyHH2+rCrmRcaRcf8s1PPuYtUGeVYJCd2fW1Ska8bWHl/Y0h7X3HP4TsrOTHRA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5810
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10193
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=935
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112090093
X-Proofpoint-GUID: WWm2C-gEnwciKbS1t9UH4J2c_vYuD2Ks
X-Proofpoint-ORIG-GUID: WWm2C-gEnwciKbS1t9UH4J2c_vYuD2Ks
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


