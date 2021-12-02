Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB23F466A35
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 20:16:04 +0100 (CET)
Received: from localhost ([::1]:40568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msrYp-0006LT-Dw
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 14:16:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1msrSe-00074p-3l
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 14:09:42 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:33694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1msrSb-0006Ms-Sf
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 14:09:39 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B2IRjZZ015785; 
 Thu, 2 Dec 2021 19:09:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2021-07-09; bh=QRJ+kA5jpt6NL+8fQ2nVgEZ9Jmvt68nPIUZkiKqBIwM=;
 b=tDM4WCDQ02khkMsvO3ZBHBvpyjtvVbVS4erJJKiPNYO1jij+pvo0SqoFFSuAQpqJcSzf
 OfYwMh2QmsgdJDUIUf3jpREdT51I4SGUDg1BSDroMRKQHeMGrwTS0V/nImb9CgLWI3De
 zBKctrVZXCqRvs1L7heUhTf3QnpwsgFaMyGLH59O8L4gIuelnKXri+Chxhw1en4+gfKZ
 gbstclMODT0MgoEqdUcj9Bt/+RH/yNeKC74eIAVwOBtm5LGinwveV3Hw5BU0ACaxjhPy
 GgJ1We0XacUlgSPPuPEJaIHjzVB+tYE+v4Jb4lLTpAubq/icoFksTRp29HhVnGNXpqlh eg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cp7t1t6v6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Dec 2021 19:09:32 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B2Ippc7051222;
 Thu, 2 Dec 2021 19:09:19 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
 by aserp3020.oracle.com with ESMTP id 3cnhvh76bg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Dec 2021 19:09:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YZmb+SBs0uSI4kUPehuIyQWlmfyX7J9b0j/E1yDClBbVV4xjOw/6e2BNPhS1I9UQjih/fzkBHc00mB0+5ipBqqWcRFld1YpDuuUiwAy3+7BuN7fsQGqlEVGMKhS8qe9eZRRvZRmxoY9FQ4Bdu/T2RLnGWJAivhunpQzZ6NgZxaNLeHHz6XMDNMJazI+FmzpFzzKBUMvyRFyKlerKsxWK+FfevujVT7RcX3Jdu6r1y7y34E6k11DkBr8vYZg5HxTG9vEcnl5Yz2gpgZzl0bG3aiI12htk32iHdSwM6nZKdKM76to+nikLbEtwmGcr+JhvkNCKUOHShPEGuWJZa6FCfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QRJ+kA5jpt6NL+8fQ2nVgEZ9Jmvt68nPIUZkiKqBIwM=;
 b=AxQummCh+a15ylLHMgCfcNGV/yIeEGm+f1Aoo2/JWUHRFVSw6YzfSCdaR6etlUp9PgiqA837KuHedA0m2MGpCm3O9NQYQg4qPin+qEClYi0QpXgOLiaACkLPGlT7jTUapegCzdogigkZ1Is77AagJCtNy1nSSoDd3gzftYmpfucO9LmU4VPJVj4kzjA+THP7lHlVg8NsPiW0wNw9RfQiqtLYZ39vAz/rbfTm9CU3cIG+kBeTOeb5qwQZe+s02RGPPiN5KpMj2QxuiziYs65HnpIqDio0+iKdEDAquXVgN1xlY2mJ+KerdO/dfxdeOy6Yb0sepXSq079EdAdJEW0MIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QRJ+kA5jpt6NL+8fQ2nVgEZ9Jmvt68nPIUZkiKqBIwM=;
 b=EHob+DfQt60uD+rh99CvO2KUoav7uXM8q5by0R4h3MG9VD08q5Qa8qXfpwTbecBKVEKzjK2exZ1Hiu3uzPboA0tOJHHp0vVzO5hGS1noPP8yg0BPrMb2XCY4zAOIXhcMjsbdM1HGhZxuBWn4ZJy/w7qE87+bgmEeUmp/F4YK6oA=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB1693.namprd10.prod.outlook.com (2603:10b6:301:a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16; Thu, 2 Dec
 2021 19:09:16 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f%4]) with mapi id 15.20.4755.015; Thu, 2 Dec 2021
 19:09:16 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 00/10] acpi: Error Record Serialization Table, ERST,
 support for QEMU
Date: Thu,  2 Dec 2021 14:08:52 -0500
Message-Id: <1638472142-14396-1-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::19) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
Received: from ban25x6uut23.us.oracle.com (138.3.201.23) by
 SJ0PR03CA0014.namprd03.prod.outlook.com (2603:10b6:a03:33a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16 via Frontend
 Transport; Thu, 2 Dec 2021 19:09:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bbe25e61-e9b2-45c1-3b0d-08d9b5c73c0a
X-MS-TrafficTypeDiagnostic: MWHPR10MB1693:
X-Microsoft-Antispam-PRVS: <MWHPR10MB16932F07D50EB01D9FB4361E97699@MWHPR10MB1693.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gm1AeMVWi/SPhS5+hnuJpvmPdYCbIDH68zp0tCWlZvBmleAF+ZFnJ7RCZ9qY3ecb0eZbVMXHt4iFBBT9w1Vq64pmTOyodfRuyOETthZwlNY9KSAtyJMcrMA1xMftRPvUkcH/gnnBPemRKvi+Kk0SaucLuZhie6vW+k8Q03Kq+dJ56PLhD4p2DD/xC3SbLZaTCywmhrk4oc8Ksy7wdpQ6F05SDCR6XDtEXxnSoPf05kpO0YMPI8QJY3HwkoqMIYiVJWa7WSp+TI9U82sNzpNVVjLh+faCKAqwQBu8xFV5uxQ8CtdmtNCRsOVstZNFJBssZYT0m+G0weZhV8kjUL2eXAB3ArHd2g5mJ8TzO2rRB3tkFp/tWkkhhOmD0370dsWem1/ENKuXYWlHaO7aC5tfJGXCnEcUhhQcrwoZfCetZqiO/H+TfPGAaOIBmG6KlgOrKWRlOUj0bp5Kw3qBa+q4Vfy2RK8HaHzbgUDM52odiBTUw/+f3XhhNt3bRklRoQ+i0Jilmiq1M3L+O2tCUgfR9w8NBC62vKYgbP1NK+OzfmSiYi/z5q7Asm852xIcaO4uMjYBHg/LtP3JFsEm3Bv91iJmKjByttdmiMom8UhN0ga9nd8YHEnNYzgRX0wyaK5Jbgwde1cA15EjG71gZShPM4lgNEEVhih/IIZK5tUFXOMjY2gN6yV/YuQjDVKD5F/zrEdroQNIiA4iBGAvHq/+Jw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(52116002)(7696005)(186003)(4326008)(8676002)(2906002)(6666004)(86362001)(38350700002)(38100700002)(36756003)(508600001)(5660300002)(6486002)(26005)(8936002)(6916009)(107886003)(956004)(66556008)(316002)(66946007)(83380400001)(66476007)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oV+2GPsAmoI4NWACKsJTjxi8hj5Gdc07mD+Ru2L6yOJYJFirvrpmogxHXto9?=
 =?us-ascii?Q?qDbI1HpEjE2OyBM61dxRvWawtu9gGZU9TfLZFaXLDwzjyKy0Ieg+gnR5tADS?=
 =?us-ascii?Q?iFRKqStHHTI4lApWrhog0t31d478CoMcJxhVzJwvb9pc8KynVubZrCq6Hwse?=
 =?us-ascii?Q?tGsyiXaQiCqhiMwhX2Lip1uhGG1geJT1MULBi5+xZbP1WXeVoXY643HAFhXW?=
 =?us-ascii?Q?Olpq6qHVQT5g4KyeRCgbtFW0Pemjv051ONKLzBgX+YWn6lZBQwvn9Fi7l2Y2?=
 =?us-ascii?Q?YTxrhXtz+29G/QtT8baOTdQVnX+vG5QapHye8A8MqYHhBKcuyIIbK3SYfVOP?=
 =?us-ascii?Q?3RvdQMnr76hO7f0mHT1UTeqqcRdpuqAol9X4tz0nnBKVx7pscxDks2s20/bW?=
 =?us-ascii?Q?jnq+P2ITUlp7JJg7BUGbQ09LFqKVS6sethmzlEyG/hdIjlfpMH8lznXMm5H9?=
 =?us-ascii?Q?noelZo1htlhRvx8gWceJH9pSSN4XKoT6rULwBWbrpYhnfoZB6pbxmFh2b+zv?=
 =?us-ascii?Q?Z1Q1VU5nbEpYAdN1yfhepuJ8N2/6rVCB6Jf46WODSPp9PPAdaGEWt++sM6gp?=
 =?us-ascii?Q?BlbkMm/wfNpAnuoBOw444PDhOyTsCcK6S0sOnkQy6/R09f8lF/vachvm1Wwd?=
 =?us-ascii?Q?89RlUQX7W6/g3iMr30A/3guEFKd2gCZcMf4AdvgLp43A8lbB/sQa6KfNq4bi?=
 =?us-ascii?Q?gvKP5y/mrSp+iHwobtdDPCasr1YrIOulKt1GSIINFinjSKL5xh3ScKMYOf3K?=
 =?us-ascii?Q?bmmWQJEAIesSOXjqEH8UPVLma0Z+O1W4tPRYQJ9apUuETakAtLH2zzCE6ZAL?=
 =?us-ascii?Q?EA7hDo5GcPqhIH0BdJOxsG1c/14NohChnKiRxKSp3Rb8AwYIbP8QtP+7wMux?=
 =?us-ascii?Q?S2fNvQVduCJCJ/u2ptlxOU0thmYVeoSSw930/qHyg2mKOKrj4HXItMQpYYtb?=
 =?us-ascii?Q?9ZckD5bD8OMrr/Yr5ao0yPl2BiZeO7firWHxWqC4Bt558VYY9P1s8nfwCftX?=
 =?us-ascii?Q?ky8r4tlT+deP0wcrcQzoOVKqOjOQ4gA2Bq8idpddHdIL1lwTq/s/BGLpjFaE?=
 =?us-ascii?Q?Wqrj33ViDMkFOBJ9UhnomoeaI8iOj2/r+RH6gfRw4uqJ9bQ7TIydvkbZLlgL?=
 =?us-ascii?Q?dB8zG4iZo3I2puSMauySg4mkEla4qWoN3rjODwYE7aDbaRnkboLODRDBuEOy?=
 =?us-ascii?Q?ehmMCEX+w7WLGAiCzbEfD1+sBMs3OLj1UY0W9Gh/dGG/SUnJIaW+A7iBJ3r+?=
 =?us-ascii?Q?oL+mhoWgYYb6WIMh3x78QapHMOzWT8x4XfTHGSWUOR/L2Hike+rHQSH56LSo?=
 =?us-ascii?Q?pE/WQhxql2fYnSObiSR+ihHR/zumXt560yjz+B9ZhE5onL7UtGlizxmjVp9v?=
 =?us-ascii?Q?Y7dGdbdmkdePh7XEBpRJFp62TjXc+GNiruz2Bg1+QgYpwv2pIpdG7F8N8I+m?=
 =?us-ascii?Q?A8vPzAUnYuBrq/xbF7qP09gHD3CjMYShYrZ2fUepberO/mcjD5y9oMjY0Rs4?=
 =?us-ascii?Q?kJfEQ/mXHRMtjWZJ7sZdI1NJJYltgr4IBv399XIrbjEeP7gz7rn9SYwHdI7Y?=
 =?us-ascii?Q?gOMTPnpAFVfLTGZiA7OsvC9RBfHQf8Aw3lMd97LrQQqpEGYBOREOI4mP2FtL?=
 =?us-ascii?Q?dZcW4EEA7RRwHxwTOizWDunIA4dCgw6gDLWTUcptzNzZe0MqpiFfi6BsbwaL?=
 =?us-ascii?Q?fUgf3w=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbe25e61-e9b2-45c1-3b0d-08d9b5c73c0a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 19:09:16.4432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p4qSL0xj4rBvZngmMcGI/CLobj5VhD0NOTjo2o4S1de+NBwpt854Y+hVYgStPTpzESRR9/3V56kXrJU+rTW4sclVJaRuZxX23+r/NXrO2Ro=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1693
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10185
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 adultscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112020121
X-Proofpoint-ORIG-GUID: CBNidBivTEXuTCDO7H14R5z-x9zgp0iL
X-Proofpoint-GUID: CBNidBivTEXuTCDO7H14R5z-x9zgp0iL
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

This patchset introduces support for the ACPI Error Record
Serialization Table, ERST.

For background and implementation information, please see
docs/specs/acpi_erst.rst, which is patch 2/10.

Suggested-by: Konrad Wilk <konrad.wilk@oracle.com>
Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>

---
v9: 2dec2021
 - Addressed feedback from Ani Sinha

v8: 15oct2021
 - Added Kconfig option for ERST, per Ani Sinha
 - Fixed patch ordering, per Ani

v7: 7oct2021
 - style improvements, per Igor
 - use of endian accessors for storage header, per Igor
 - a number of optimizations and improvements, per Igor
 - updated spec for header, per Igor
 - updated spec for rst format, per Michael Tsirkin
 - updated spec for new record_size parameter
   Due to changes in the spec, I am not carrying the
   Acked-by from Ani Sinha.
 - changes for and testing of migration to systems with
   differing ERST_RECORD_SIZE

v6: 5aug2021
 - Fixed compile warning/error, per Michael Tsirkin
 - Fixed mingw32 build error, per Michael
 - Converted exchange buffer to MemoryBackend, per Igor
 - Migrated test to PCI, per Igor
 - Significantly reduced amount of copying, per Igor
 - Corrections/enhancements to acpi_erst.txt, per Igor
 - Many misc/other small items, per Igor

v5: 30jun2021
 - Create docs/specs/acpi_erst.txt, per Igor
 - Separate PCI BARs for registers and memory, per Igor
 - Convert debugging to use trace infrastructure, per Igor
 - Various other fixups, per Igor

v4: 11jun2021
 - Converted to a PCI device, per Igor.
 - Updated qtest.
 - Rearranged patches, per Igor.

v3: 28may2021
 - Converted to using a TYPE_MEMORY_BACKEND_FILE object rather than
   internal array with explicit file operations, per Igor.
 - Changed the way the qdev and base address are handled, allowing
   ERST to be disabled at run-time. Also aligns better with other
   existing code.

v2: 8feb2021
 - Added qtest/smoke test per Paolo Bonzini
 - Split patch into smaller chunks, per Igor Mammedov
 - Did away with use of ACPI packed structures, per Igor Mammedov

v1: 26oct2020
 - initial post

---

Eric DeVolder (10):
  ACPI ERST: bios-tables-test.c steps 1 and 2
  ACPI ERST: specification for ERST support
  ACPI ERST: PCI device_id for ERST
  ACPI ERST: header file for ERST
  ACPI ERST: support for ACPI ERST feature
  ACPI ERST: build the ACPI ERST table
  ACPI ERST: create ACPI ERST table for pc/x86 machines
  ACPI ERST: qtest for ERST
  ACPI ERST: bios-tables-test testcase
  ACPI ERST: step 6 of bios-tables-test.c

 docs/specs/acpi_erst.rst          |  200 +++++++
 hw/acpi/Kconfig                   |    6 +
 hw/acpi/erst.c                    | 1077 +++++++++++++++++++++++++++++++++++++
 hw/acpi/meson.build               |    1 +
 hw/acpi/trace-events              |   15 +
 hw/i386/acpi-build.c              |   15 +
 hw/i386/acpi-microvm.c            |   15 +
 include/hw/acpi/erst.h            |   24 +
 include/hw/pci/pci.h              |    1 +
 tests/data/acpi/microvm/ERST.pcie |  Bin 0 -> 912 bytes
 tests/data/acpi/pc/DSDT.acpierst  |  Bin 0 -> 5969 bytes
 tests/data/acpi/pc/ERST.acpierst  |  Bin 0 -> 912 bytes
 tests/data/acpi/q35/DSDT.acpierst |  Bin 0 -> 8306 bytes
 tests/data/acpi/q35/ERST.acpierst |  Bin 0 -> 912 bytes
 tests/qtest/bios-tables-test.c    |   56 ++
 tests/qtest/erst-test.c           |  167 ++++++
 tests/qtest/meson.build           |    2 +
 17 files changed, 1579 insertions(+)
 create mode 100644 docs/specs/acpi_erst.rst
 create mode 100644 hw/acpi/erst.c
 create mode 100644 include/hw/acpi/erst.h
 create mode 100644 tests/data/acpi/microvm/ERST.pcie
 create mode 100644 tests/data/acpi/pc/DSDT.acpierst
 create mode 100644 tests/data/acpi/pc/ERST.acpierst
 create mode 100644 tests/data/acpi/q35/DSDT.acpierst
 create mode 100644 tests/data/acpi/q35/ERST.acpierst
 create mode 100644 tests/qtest/erst-test.c

-- 
1.8.3.1


