Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FF048A31F
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 23:46:00 +0100 (CET)
Received: from localhost ([::1]:37214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n73QN-0007R2-45
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 17:45:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1n73N1-0004Is-Sn
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 17:42:31 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:33518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1n73Mx-0001pN-SF
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 17:42:31 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20AJlXpv026175; 
 Mon, 10 Jan 2022 22:42:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=MB8O/Wx44fiOO4tajPhOoi+TPbIywhMH9vCc7AXmJFI=;
 b=fvxcrk8PI0T7JgqRW1GzPpLTDqaQbcY1eKh0FVvqO/K56bnXYREnFg79cmMHP7tSlCZ8
 95seWrGUuri10DR1a1Ubhmf6camNU8CxWJelocZg64hb1Z/ZtUtHA/LSi6RQLKMHhCI0
 CXSeNLKdIOobglsBWZIUN1I4XmjDMeCBl61/7NMbfZm4J6/QPXdvgW8OXz7e3U7fRyn3
 4NpD/5V0aP6JBvx84JHGNh1/gPWTN3bzFz3gmgZl6vkXbzjOL8my6vIGlK1ZZVgbUvUJ
 GRTNxeD7xYjU3Zt+waK7EtPyMcYZ5or5lQL9c0T7bzP6bqUb1WlBAmOs4oR+r110zd+W bA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dgjtg9uxn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Jan 2022 22:42:26 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20AMZaeM009140;
 Mon, 10 Jan 2022 22:42:25 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
 by userp3020.oracle.com with ESMTP id 3df42kpj6d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Jan 2022 22:42:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UB1y5BtDuS1f3Oz0/MGO7DKfWOEDt+OAqd9Ts3JqwxnsIxKpF9j4MSlADymuawQka+p7pmQRgtC2hARuEV8lWu5wTj0+pWq5B4gVP+XzRdmxSDmvCHmuQUepcEC0Kzq+MsZLvgR0GmgJ7rzN0XT7wihuM2zNzw9PaFJ+BTiyBxVf3cYagxBktnF4hGGA6l88+77NO/i8PJnJ6yFGM5WyyQrNcRpOtO3oO/fP/GZSTaMPx3hKCQnTplH0UH1jRYjw/6VDDVuRjVnUM0XodCdti3h9DOb3kCoYToZ36VHpEEgBLLtaUJfbpEygUeZJCYG6jwHrfiehJPvP7x4pZJOCkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MB8O/Wx44fiOO4tajPhOoi+TPbIywhMH9vCc7AXmJFI=;
 b=aQDkY0/U6DWSQlE/ZUgDPOgSwXGUTJzXkWi/9PlFZvRT6zNQWxzRF85+O4/Fdp4ztSbnj7xgoFZLuKzE0kfbvDuzQXBELomO+TWD0vi+SBUDkRrachhwotNAnwtM6ZB0zMeWxjjglYKdQrLdN78org+LQDdlzoWJp2rL3fPkY0YhUDCPlLPwTkoV1PaX/0NCBdEyrXPmh/anOR2GPbGiSMYth6a+N7DXBe69P24DJJ6hdYKePKYDmUEhYzuXEG6I55YYmJG3tTO9v3UBBuEMoun5AiXHgpBmmG9AmzDq5DsftxdPvCkxivKjAMQ4qgJ+P0HbG+mrlEM4oPByyWYeZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MB8O/Wx44fiOO4tajPhOoi+TPbIywhMH9vCc7AXmJFI=;
 b=UaS8A7CT5zVd2cRL1TefkFEjImVcSjg8GCTXnYk9OQxkCRV0J1GEWmuIiij0Nf8q+vUGMJ4spZfJ6iwxnQhMauM/ckPNAOh33dsiWXRqZdDYlR2cQ4Rcge36OANTyw523hfN6JSPh7Af4oSq2/PrQsZKMJeSoJS5CFvvlrdIdS0=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB1598.namprd10.prod.outlook.com (2603:10b6:300:2a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Mon, 10 Jan
 2022 22:42:23 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::d573:6cc0:c616:6f2c]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::d573:6cc0:c616:6f2c%6]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 22:42:23 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v12 3/9] ACPI ERST: PCI device_id for ERST
Date: Mon, 10 Jan 2022 17:41:58 -0500
Message-Id: <1641854524-11009-4-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1641854524-11009-1-git-send-email-eric.devolder@oracle.com>
References: <1641854524-11009-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0029.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::13) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69fb1bb3-7614-43e6-7c33-08d9d48a77b7
X-MS-TrafficTypeDiagnostic: MWHPR10MB1598:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB1598773FE4E583107FC0DFF497509@MWHPR10MB1598.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WuKvKB5x44S8sFekMbFIrQufyxW9Wr19cUmb3+ql5z+Ah5Ban0j+n2W+xCe0vGY27ziBsPKY9jS+Dh+0g3Tad/koz+B5g3Y1f1PnZS+sbZMOHRiVt4QILt7G2Cc7E1HpknTcfLcTeE/dwdNjn3ch/tDLFzAmViAj3B5d5Lr1VDfOQDFGf6U+z+x/NfJfdYkwqM6EeRpszcxVwL0j2N8YtlDfLt9MyzaJpXQnIMj/Z1XqYFuGxg1eXzZBsiUQ7hVfDrjPlg/tVowKYVdgH8NauR152Q3q05d9HJYhrravLbokRy727UgoKM6z39+CYlr87BTfMf7EOjhyG8UUbNbH0L1/+bwdJfrJqX6SEmAYMh8O/N2PHW5h4Eu7YPwpCaTYu8t6iaLYPS3TVmeRZJpPaKdcv/aqgyQ/sCYBb/r5M+gd2xpY0iGxROtjGL0QSvznLQySGtMERbKCX+NO7kHOAeqN1hNPdC0jVVGSTXmRrs2EAUHgEHgoUWTGaJSOdwzVOrzN5mkDBIUywWC+TKATomgK4CzP0DDpzspJ9TdBNr5GjNPjCHObGTkqkP+kdRdoBLluo3r6Goz6/rRfQWKzCrUH6uhFdgZe4jtyHHNUzeCAq/q3v6Gi8hMSZuWfub+yF1nZKQl1vsvoXXdT5V7Y7ZV09ZxAsNzy4Rl6gHLwabd6L7ZYVkl++ikqiSlxrCMC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38350700002)(66476007)(6916009)(6666004)(66556008)(6486002)(66946007)(52116002)(38100700002)(2906002)(6506007)(186003)(8936002)(316002)(6512007)(508600001)(4744005)(4326008)(2616005)(36756003)(86362001)(107886003)(5660300002)(26005)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yJE653Y0VN9evPpzzYQNGJ75MjbhJ6B1euiwauhZjw53pFbEnDQ01T2SAKfB?=
 =?us-ascii?Q?6LpxGvdEq7btMIIxjdEyp+1KmqkN9zF/YHSgeM0oYcotoW4RAqZ9MtgjPvZo?=
 =?us-ascii?Q?nxLbi8LjKp6vYuMC9XBIjeETMY455RQ5F2yz+uRxs8zpEOG3gLzrqjeiGCD0?=
 =?us-ascii?Q?JiZTQ9Plhb/VnpZKApWWw12xx/L8m0Xl6hcpeebKZ5+8BE+5Kd3Bio+uS39R?=
 =?us-ascii?Q?Q+WbWi03PKJTKmaZx+v3uGeNJ7tF+SsRq6tErK+lo1WKL25LLYpzfTdLs2wc?=
 =?us-ascii?Q?ppQWx5D6Il2CbNfQyiIi17FPbTLB0Bc33yQ9XtbbN9Em8CwSrctYL3Z+g7K0?=
 =?us-ascii?Q?M05ycqnLyIheL9Jc9Mw8jr6Op1I2C3q+z344gjXbstLNPm5/VHaXhIA61pSR?=
 =?us-ascii?Q?crMSVhT6/gW2l7qT4xwcrt8GZXWqys9HPlxSitJXGFroNUOmP3oYmSOnGfbh?=
 =?us-ascii?Q?s51cIFCdzvxNZ+Lxk/0O8Fq5kPxhkBTyacP83e7qrBSTX+Ct+2jpgGHcrgMe?=
 =?us-ascii?Q?vjRrL36UERrv6Coj6PAkFO3Cs1xeb2txnteLGgRlGUySA2jFpMtq4b4KhL5W?=
 =?us-ascii?Q?lpr8M1kipuUBLbYTvqx4rAEJhLh3cgoA1wfNHHvlw6QKeBhJZFvy7rt0WDiS?=
 =?us-ascii?Q?yEanCP8idyzPkC18lhhEoiQPBS0tcz8MogC3469aW5lHtZ2LE/KV/kcVv8Hq?=
 =?us-ascii?Q?rYhbGVc989vOoNTHEOc8+UKeONxB0us0e/OiUsP/1nGDZMHfzZyyvtbKtHMJ?=
 =?us-ascii?Q?NXyEZ/poEsYzLvV9eb9FhdfYW0ufIXseRVxEXEq62zJwl6rdWi8oio695wTT?=
 =?us-ascii?Q?LxDAizVVrPSTnjB8utdetEpKnMoObiebpWwiuTDOBVTx6ytLJIPhiPE9re61?=
 =?us-ascii?Q?8aspzvDesDjPE1FfBGWI0YKyz/Nyqv59+0LfRl37HikoWpSTHBfxNqPTsyOA?=
 =?us-ascii?Q?KbP7hEQ/lQQSrlhQ+FG7z7QVFKDkhhLde0HOh/Q0u5qH+7JUk0nzxUDmyG+i?=
 =?us-ascii?Q?YCBMdTDJeUrZ16ogowybI8y4b72hWVpBxmE+xbsbsy16GbjbijZevBBgIMh2?=
 =?us-ascii?Q?p4mpk5INd+2MiOyct3P/exMsnXUu97T7yaxEQ2DvMvfRhRGQZHVqzuhf6OyG?=
 =?us-ascii?Q?RQJSqtLGqgnAz9gDbMG4lFRb9kz3HVzBT10+ONsXm5OF8tqBt5fS5cDd8yfs?=
 =?us-ascii?Q?y5vai6NO518N5H4VoMdLPn/hNkcLQyFESmDIFgmZ44ANVU9o9UmHlPg6xDfA?=
 =?us-ascii?Q?VP6/xZXS+y5jV6FQQeYfgI290ot49J3LWhOSLChfpIiyXv2uix3d+gC5GDxo?=
 =?us-ascii?Q?tion+lDE8EMEf+wnKdawjc+2G7dVRzP2EiWz+F3a3Nynpdeh2CpDEl3IRp9a?=
 =?us-ascii?Q?igXxo03ehRT8nzcMCtN58WcmowmXCqVVCQONnP/cZoEIyVEkalcmHR5/V5wt?=
 =?us-ascii?Q?lkCgduR5WAxg7DjviT/U8zrmAT+7FfHJBxZWcuaPt9VwuE4KAwqgbXF/Ymhe?=
 =?us-ascii?Q?qt3hqpPKqJtmYF1RjfWMDXItHKB+YDGLd3qF31SCTsVSQxr5j8pD0bRKuca2?=
 =?us-ascii?Q?814z7HTG5CXIKULrKhuS2ek7CJ79Ss8VoYX9p+1SQ1GW7lHsApvkyjR3UEjS?=
 =?us-ascii?Q?N5/+Xpb4TkLPiWDoPMOJVBZe2GkfapJU1OG50z0ASNTfO2xRTIY3aZeldPid?=
 =?us-ascii?Q?LTQ26w=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69fb1bb3-7614-43e6-7c33-08d9d48a77b7
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 22:42:23.0911 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t4Rlqse7ZT2zzG9xYS0N1Rn1gzxqC78TxAugnvOXgAHZdyxrMV9/4cAMAmhaJfH0IkcpIUGfWFJV4uFrchvuPBt4F5rxRBzO0AeCj9Fb/1Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1598
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10223
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 phishscore=0
 mlxlogscore=958 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201100146
X-Proofpoint-GUID: ICVg57L4096oFWgCUN2gY7-ArnvcppQZ
X-Proofpoint-ORIG-GUID: ICVg57L4096oFWgCUN2gY7-ArnvcppQZ
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
index 483d5c7..19db80e 100644
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


