Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A21466A36
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 20:16:17 +0100 (CET)
Received: from localhost ([::1]:40716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msrZ1-0006Su-FQ
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 14:16:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1msrSd-00073w-PZ
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 14:09:39 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:32508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1msrSb-0006Mn-Ia
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 14:09:39 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B2IwqsL020410; 
 Thu, 2 Dec 2021 19:09:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=BsKpnC7kaLxk41JtbrSpabPZ/1RGHWYpBxzYnzfhPiI=;
 b=GTycuGdpK6o/nVsic/mqjsy7MjT1KGFO6ZBh/J+Odpss41Nj9P9HAViClk8Lcs0cJ4x+
 boWwXvI21KIKQPN5tJrwfd/U/lL2Up/grPu0lGhJwteoZM0IeSFWNHIzb00+ysmvT0MY
 hpmXvndl4B1yHdsgf50T1zq7iTc92GuIMxXDdxiCVZa1CDuHeJfLJ/jaD5twkzlkKVam
 5C8kHi+OUc0TwzSWEQ8KTv1QSrkmLK/x2dYOm6lBqMz2Y+ouzwUtYfkNprqKOhgRNmJe
 T3QO1HjqoAUprXxFqp2kaLD/D3BsTnCJHJcWP+pm/bxZeeYJuNxEOUU9CZInwoZ9c3eW 2A== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cp9r5a8ra-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Dec 2021 19:09:29 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B2IoPRk115619;
 Thu, 2 Dec 2021 19:09:24 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2102.outbound.protection.outlook.com [104.47.70.102])
 by userp3020.oracle.com with ESMTP id 3cke4urw6s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Dec 2021 19:09:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fP2qbDB+Y3Js0Sxwei+9KkLwVbbPHwyfUT+ApC4gCf7EqLYGp5UHUZFMQOQbfwC3YbKOpZ9q4aVdekc/u5krrfgDYKRk/ngXBAWxhMdQ+pM4a1N32Imx7rQJxPXHeNkwcaqR4nktk+HuoJvbGtEANEuXEq46P7sdwv3y8tgvXvYZUD1XvsewPc98pX9kE9+fZzfQkrqTMMk4gFQmWArNkMFiIw6tMySNhurzEILyiUfAwpC/lzz4e+UAjpl7bXMP+ET59t5UH9h1BDc+l4DDQR11bT3zYa7ms9+yONdPJbLL0vpiQD06rc30tCVTOBgoOPcEXNFVa8Dn9YeodHD+eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BsKpnC7kaLxk41JtbrSpabPZ/1RGHWYpBxzYnzfhPiI=;
 b=B3/JMbagZmhyb9R0vzHArILNOXU0PFtxNT+a8CqAQmwxCnNgoKN9cBgALqF/bioyBg1wOPZ+e68NnQaz/B9d+LS+ceoaphk2bnByDaWdSEnoA/QIXJYUALM4XwLfq++0wECtN1DhNnLGAwxmZkEi7OW3AX+SD+Z2DptYpY5xEFY+Fb6Jz0OoUNZVKYrMdPB9Af38+x8bPZRF4Pk8OxGJedHyRrk1pf+0WbO2w1L/UjoZCwXNE+m94cJwuoXMawNUkubD5uEonwlif3leufsYFu+RQWRI4aGrWNDVKSgafRpifCiwPwmO426qtg09zI7NFX0bvw81QZ7S544TuSDP/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BsKpnC7kaLxk41JtbrSpabPZ/1RGHWYpBxzYnzfhPiI=;
 b=GnTstZ4uMRkSXtG48X5ssA/asOWHQeLcWmRKg2/4frSFG26QT2z0RnzeffB6rWrOSMhSIWSvjNmBY325vBqIlu0npVYwRT5YXKOVCmaBq8EDnwhqhFKySG3Ez8F6TxeWyvf3HrgzN7NY/sm1JaE/pShfOCRkebMkkTndcovaxeE=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB1693.namprd10.prod.outlook.com (2603:10b6:301:a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16; Thu, 2 Dec
 2021 19:09:22 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f%4]) with mapi id 15.20.4755.015; Thu, 2 Dec 2021
 19:09:22 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 03/10] ACPI ERST: PCI device_id for ERST
Date: Thu,  2 Dec 2021 14:08:55 -0500
Message-Id: <1638472142-14396-4-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1638472142-14396-1-git-send-email-eric.devolder@oracle.com>
References: <1638472142-14396-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::19) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
Received: from ban25x6uut23.us.oracle.com (138.3.201.23) by
 SJ0PR03CA0014.namprd03.prod.outlook.com (2603:10b6:a03:33a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16 via Frontend
 Transport; Thu, 2 Dec 2021 19:09:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0707a636-c863-4b99-c034-08d9b5c73f81
X-MS-TrafficTypeDiagnostic: MWHPR10MB1693:
X-Microsoft-Antispam-PRVS: <MWHPR10MB16934C36139D6ED55A0FD03997699@MWHPR10MB1693.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cBCUr2jdanylsYhzS39ZYbX9DGv9O0weNeFiSdJujUOR9dUz/xn4hGnS0inmUa978UlS55NvjqgACQdqhb9JMXKjeXKSi/A0zWz0DEtyhWNpZjgf/GumMGaYBbfhRo+zwMK4kuetLKS87qVqPOgBU2+3JkmMVE+A0r05e97HGxjbTrrfHlwd+0a7vGttHIwQozgKYmuABurw7vW+94nhV78scyYzuUgKLl19oam0OAepUES6bHYZPyy/hca/fRXgaO9oRXgyDQ3uEI4c6UCWH7IO5rZ8vSL3a3xPBZ+osm9R00dcr4bi1Q2OkqucTeLSkYoCjomHjF/o5A0O6vCR0Vr4Wr3Wa8RCWVBcgab3RvOpBMSTbbDrvKvnqm60+L5R0ENRKB8cyNW18crzX1fqlymTznhmhItAr9HQ+CEZ0onP8g7aDEo5dRFcULMpt6VcisoevwYThhN6fmjkES9IlXyQ+dqcsbarM3ebJNw/5oOVZcvF9iCXe38c438gMd2B/0PcN2+NMUBSpMbalAm9unDxL5B8X4D17iAqMKGp33umNyd8zhp/9CUIvJn+TINJMEpJAxk8N+K9XcrTizWnT498323wreit6ndf8MT8crhuyY7V1kcp4w9S8qubvsyB/jwJW4anweE0BOedVZo+7BBzMhDh19d+NeeuN4jAKJpINySObkHA2JbcuDEqmX57CWw7fsLxut+X55vSeXVVhA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(52116002)(7696005)(186003)(4326008)(8676002)(2906002)(6666004)(86362001)(38350700002)(38100700002)(36756003)(508600001)(5660300002)(6486002)(4744005)(26005)(8936002)(6916009)(107886003)(956004)(66556008)(316002)(66946007)(66476007)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FaCq3yfOr9QKoC10rwMjxjNl0iFIwdtyqm8PD597UiLeD+hMKn+vJemQWRsO?=
 =?us-ascii?Q?BDLVCWod5yjhHuC3mkJrSE4DGCfLoEH0+4UPGL+Xl/T6tPAYlbNHLiJ1jOut?=
 =?us-ascii?Q?TuRA1boo9mRD6sjmPtpnDw4f/Xn02bApVbY3WaKoX7fwJrNcLX6DuVtEUy3j?=
 =?us-ascii?Q?LbEoyVB7/Jd4XZj8y4jfRO3lil/QZpcjAWSXjyAXr7dOQGYnSlxuyArw/ztG?=
 =?us-ascii?Q?HrEU76p8qcdC8A4/mBf4g0kWJgK7Svc/gX0Q53HqQeYr+9HI4h27OVhEaoCf?=
 =?us-ascii?Q?KuUHR8Kf60nfNGQ4P/h63rG2wbq3L0HKdUAs04AVqLHbvtkwHi17MArBLRzD?=
 =?us-ascii?Q?CK1EFrzop/DPAutNbDmWKQzidJAehv1GSJEhUK3yCmxqVWJ3g5vcsVKr9fa4?=
 =?us-ascii?Q?8f2RxrGrxPkxGED4EWYjK8EY6UVyEamhjR7/yycFbIPzSfRCt/LpJZSVh6Pt?=
 =?us-ascii?Q?5BPbcuiad1aD06Gxv+4FurUbTS6o36y/NsizXSzXIqRyxqmVSjY57YnTDcBa?=
 =?us-ascii?Q?SL8DDUsrHXEbhxuRsgGfJuMqHx730b+spCqApucuQKbuQKWe7G5uluMvnTka?=
 =?us-ascii?Q?Xp92PkXVkgF13l3vd2FiDweRmTRMwKNvmPo4/BXCwbQO+xt6Ae6ZLmXiPQTr?=
 =?us-ascii?Q?ptqCxsHz8k1RTjJRvQgeW1qsuQqDWUAAHvI6SXKVUscdY7G8gQM9lG8D6yFw?=
 =?us-ascii?Q?OUHJ4EMBoOWmnc5s2x4WjDHAz0y+XFILQfSXixqRljD6rv/lr233rMVWEYDs?=
 =?us-ascii?Q?sahL4WDMbG9ItvXtBvXPA6j8HuE37nXnO7j0iFsnI3qrqDIOuEOXSbvSEAsh?=
 =?us-ascii?Q?QXjBU9XPEf5vrDPSSdM4l20EW8z+TXTjRNAy79SNnG7CcSIoP9cHROclaepR?=
 =?us-ascii?Q?FBz7Z+TjnuBbyz8NpNLljScQZK7ohMqHOc1amLMy3qyFBHt2r0E6Da1Ghw4K?=
 =?us-ascii?Q?2dItg1Ipr4C9YnHSPMoEIQqe8tJVe0n+Bbyi3Cy6s2PnqgSme+BLYxMfE3wo?=
 =?us-ascii?Q?xglV0k+kdVvAHX9r2BrSH1JTEegpnpa8g+pMB2xExMiNdbSqcuadsvGMMGkK?=
 =?us-ascii?Q?63gxpKFIt8EYY4X+HItWL3tRIhA5D7818dcibC7ZWDCMFL5/G/7adCbsrnV6?=
 =?us-ascii?Q?Ssa3CzpuT8LGH7MNIni4rKdgo00GUcePhlsIvsvmJkG5+SjKVrL5mym9e5zl?=
 =?us-ascii?Q?TV/540Y7I5BbkDcQkakwskUAxr5o/Qm1MsA7K5HDpQ3YgYGOFZRUg/1FkDSG?=
 =?us-ascii?Q?T8tcKVxPUeBdaccxzgDbzPAvhpxXPq3rimKxevyCEJg/r16m54Ppwg5W2rqc?=
 =?us-ascii?Q?0LJX5Cc0mV9gOXxf7I6BFdFMGlv0xQsmVEeaX9c4lN7+6RGTi8r8P/e6EyOJ?=
 =?us-ascii?Q?otk3MaLLOSjrBr2XG2cy6dwiiMz3N4FxIt6FJa4iJUcO2WaASUbzmc3Wts/D?=
 =?us-ascii?Q?zlzjJMCfUevEPzy1PvtYZcOhodoVDvabKlNTSqT6ULSCig11hRrE4ogaSBuD?=
 =?us-ascii?Q?uzFNc6vj/+xsozv8etZhSSxB6jkx9DJd6ja4PKpTfdb28eU2hENiHjm1gEjF?=
 =?us-ascii?Q?AuOm9NmElN34nvqraREOxAp9DqATwYcqaa6ehKbrTniyIyefsbs8N7Xy5K60?=
 =?us-ascii?Q?1Qk6XAJ2X6azrmRZr78p0DQeQ3PElUKYdYWvtv4kVaS1u75H6GZuP4spEDwt?=
 =?us-ascii?Q?atOV9g=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0707a636-c863-4b99-c034-08d9b5c73f81
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 19:09:21.9941 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MbM2m59B4ZaR02yEgtHtbRMPx/ReuFTwrQ2aZPh6erkbM4MWwvDDr3RqS3ma1Vys5J+Wd/oVdKbZWpipe/AoG+kBiBBpFbWnQjnQi5BRLwI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1693
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10185
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=924
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112020121
X-Proofpoint-ORIG-GUID: HS7HiGz1u9EY9-F4KeiArbm3YToWrDrp
X-Proofpoint-GUID: HS7HiGz1u9EY9-F4KeiArbm3YToWrDrp
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


