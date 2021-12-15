Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AEA475C4E
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 16:54:24 +0100 (CET)
Received: from localhost ([::1]:51940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxWbn-0007hD-4L
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 10:54:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mxWMb-0000VD-NB
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:38:41 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:31462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mxWMW-0000RR-4b
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:38:40 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFELE6Q028543; 
 Wed, 15 Dec 2021 15:38:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2021-07-09; bh=PQpKa0GeLZZ0v7hw2nmXYMgHQ62e4OvLpvmZ2cFN0gs=;
 b=eWeYaehO0oUi/OflAI6rXCu0tGkcm7BWDVP0vzWUEa5aCreMgYXeQATuwozWwSueB+nS
 tdejRRwKYppnmV5SjN4R1aZscR1fPZ++7hKM7Jllm3wNKyUAhCA2lOAMoZI3nTTT0Xe1
 h5lUTa3Se5CW3eIVOsRuGCNcxNn6HioJSilZxJcgqM7kUP2FgXt7Y/qlnB/WFPFzEyYe
 2sw9rWK+33CO5OGyNgKBt6BQ4Uo4w+4f9qtCN6xayQd0fREPu9FdcRUkS1BfPT3DmzGB
 +YmXnDlg1dJCqG0c59lnXFCpkvuAPfKx3l4Bi6EN1GKWS0b9Z6jrBi/HuZcDprZ8OzYA pA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cx3ukf700-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 15:38:32 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BFFUXT4094314;
 Wed, 15 Dec 2021 15:38:31 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
 by aserp3020.oracle.com with ESMTP id 3cxmrc0wfr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 15:38:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=geKO+MROcTiAq90X1EzbLKJwyq+sg+WpgHQ9k/YkKXLZoRjANBMbKCAdfEDzvqNIVgpXexInPPY+9qnlnxckThchDRNKGg9d4P8m7aomPdon0jYQEUR9fVLQapso0m7LqGtryiSfZr7puPQ2O7WSWI5c6cFqTnaGPLHR1BxY53qxSasf4YA1T2jbLaS87PexSQoN0Tt4I3+sJ0uOZ8hiuraQ2/c0UsR6LWXzUFjxvJLKua7LwYR8MZFQwvSvzg/xf9qY3BnpV+5Fxt4i4b7k3z0L/4PPobjnZ9UGbjjyCb/Hd44HxUp6c/jmJ4NPbzL59mTBzadenahliKyyT/1dZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PQpKa0GeLZZ0v7hw2nmXYMgHQ62e4OvLpvmZ2cFN0gs=;
 b=oDieam8Jzp9w5vP7B6o0LrIs+g6mb1mCUM41jlCjkjyZLlDSig9eEQ74YaUJ1CWFHvOc3LUKM0lBhsKmnztqflQMipEsnP9HoyI61HajGhcw3I1MIjajD1HK1ntjMva6KpmldhSyJCAjFCR7LtW9hviL1y6id3Yz18gLCYBcxgdRbxWz4UiUbdIPmCxUK/3/0OaiwnTC3nDxBoPH8nV3C21+IPdgWZ2BrGdan3ADM5sIUtxC3CcQjH+LJNrOQAd7xfNNw8FoudYAMraR1Rg3Jmm0z2qvvRZL/Ev+kN0R5FkjGZs+wKgqFXc3C/EFHcidj0CA3s0w3mijKpz7NrV5wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PQpKa0GeLZZ0v7hw2nmXYMgHQ62e4OvLpvmZ2cFN0gs=;
 b=Gyy6eoQr4tGsbwO4yBd4KgzTmNBYnz3eRwcr0bReNHQuoo4NTk8/NXJdzL+VxTSiYvedjwf1YmGDJ8Ir+ZtNShDkCdKS1we50pk6IA6ZYFCuQXyyuiaX556KUSnaupR9JLUoEIekUFoGchwAwhVI5POJZqhjuyaTDutC1vZgxhU=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO6PR10MB5441.namprd10.prod.outlook.com (2603:10b6:5:35a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Wed, 15 Dec
 2021 15:38:29 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f%4]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 15:38:29 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 00/10] acpi: Error Record Serialization Table, ERST,
 support for QEMU
Date: Wed, 15 Dec 2021 10:38:05 -0500
Message-Id: <1639582695-7328-1-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain
X-ClientProxiedBy: SN1PR12CA0073.namprd12.prod.outlook.com
 (2603:10b6:802:20::44) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7a78f5f-930d-4816-dede-08d9bfe0f0fb
X-MS-TrafficTypeDiagnostic: CO6PR10MB5441:EE_
X-Microsoft-Antispam-PRVS: <CO6PR10MB5441A214E032154F36DF45AA97769@CO6PR10MB5441.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HRoppXIfQNlx07c/4ieI0UYeWqnMdrxsHFSPtJ8tOMHAQy69hd3cTCnVN4x/Q2fz28DLSktqUVxp+BIl3c41cKCYcZN2TaoFUfB8ZGUAWSJsOfciW96bPZhPIYwob79N/E2gkOws7xBEwkP9jv8VsZKW/t5lbpvJ1bPBEwZucS7B/hfQO0dnrcQbqc/O+wKj1Hp77vbVhE7PL5/5nzpl1LWvIcK+ZT5xBodxE88b4RpyCjhTjgm/c9ERFyLjwZkfOcM6PNB8fkkbxxECEShzc4o0EbimFyJOdzLcrW1XY36RIZO++1/eflx0ffkfLdub5yE6LXasJIOqOFw4z3REJpzuaJ586t5mxxD3gjSbsoScpmRiLFsWm9uFYk8JPC6ehAxzZmN3kMMmZmGHM6MIhvJ0xZhV5ZAAQoAciWS+1IIFL7Ta2SAHftzLs0UsV8YwepH7f5DnCNqKTswF9nFYHZugJrlOwbxV5HTIE+ZmNPyhJiND4EIx16xBMcnMha1iyixG/Ryjgb0QYZzfcUchRd6ztxBh5NEpXBBS3mbHdhe8boWXLlqyu7Xz59o5HfTTwD/8dmXdUwaIGt3zyY2cmlpwf+/G7UDTRoJEY+q6QFDSQkNsUQVIswFA9zWgOU7mk12b+UMszP3PWF1uVxaj65fk3A7cJvAZtJt3kUawZG9OIWZWs6G5HJn2ZUMuSnkVLuBbZp3VZ5aO5TjFVr4huQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6916009)(86362001)(38350700002)(8936002)(66946007)(52116002)(316002)(66476007)(83380400001)(66556008)(6512007)(6506007)(6666004)(2616005)(38100700002)(5660300002)(8676002)(186003)(6486002)(26005)(508600001)(36756003)(107886003)(4326008)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q/kQrQZjRj+LKQ00qEqKtpeNUvkN/Tu8hLnS2e+BxgmaH0oJIt0YGlQTZrJC?=
 =?us-ascii?Q?0SI5+tIhEcoCVYNC+qE/kJI5T1dhGZmgerX+3Cp2m6j2zdRPRR8TdjRBNBiP?=
 =?us-ascii?Q?/sBdL+cz/2f8xOL3DdMPEhMNziaESGtFTd0OaU61t9qjZOCdD4eobv2dh7/2?=
 =?us-ascii?Q?e2mu2epYGuk6HsQC8mgSAtv4cGjXQzmi6QEH75oL40PT2oLozaL7WWhPUDXJ?=
 =?us-ascii?Q?KkmD10mrcKh1qWLCvJuH5Gz3hf8F2qK41MjGPvO7htTF+oGMXpDxlLdxEdRr?=
 =?us-ascii?Q?rQh7qVeemYLJHfggTB4FC1PoMmm08+dXzfsJbAWwYPWNbHYP6Jfn4ZTImr7l?=
 =?us-ascii?Q?cDRZJwRboU5tCsUagHEf2xaCbivhLhF6Ub8NYhIObSa/O3jI0JyIncrOpV5r?=
 =?us-ascii?Q?XPmpFdfGLwdL7HPHtfqqXFRXyOaJoZwOWDYsy4PbHUhqQGTpAnG5MLM5tlgp?=
 =?us-ascii?Q?crv+VZs+5tRpTwDV7nqNncUlmRQx72KYZOVSgKj9qe2iFrW9QV6NxwoG5JF6?=
 =?us-ascii?Q?K7OOgqbWizXOqnI43GCTBWiGVtkb32/6n4r3ufEdHo7+NBODEPjNS2J5jQj1?=
 =?us-ascii?Q?wJgAKwwgG2ED9q1dvSTjP/vJbxRvNj5KeYkJw9XTOVp9yRJh/hJzZeJcxpR9?=
 =?us-ascii?Q?qp8cs9lyBq7Xb8zzNRSZgGx1rE5+O3e3PmJ/vNlKML0PHco/gvLPQfcEqCn/?=
 =?us-ascii?Q?AkELuOKZnpnOk8hNB6aSz09Qc9OXDVFt9m6B1DkSQm3h1M39vqbWbWvWBre6?=
 =?us-ascii?Q?StLOvp5fCxo2K4Bg2pdXtfwE1H58qlz4dNYoPQ/q/8R8iHwk+sZVq19jg4e+?=
 =?us-ascii?Q?y6aMB+pwN3LOqxB3dil2EmqWOTaZGaKHPZ+wh85NCXUl2NwlMT5aaOYNeDvo?=
 =?us-ascii?Q?mT+tap4U3YjAjvQ4p+UFlLQdyehwf9nG5iFxVRni08MfxfiPkWpFM1yeqyDd?=
 =?us-ascii?Q?HS+RhxUEAKtFfnXbPcs4lRArC/hX7x/flKyTdlAUwNI+1OFAFWQxOEgrDYTM?=
 =?us-ascii?Q?pPLmazy1L4MFFufs9xa0vewGS2qjkZHZYrZwA/BBf4+PZlxr6lrvAC6ZyiNd?=
 =?us-ascii?Q?hMCLmi75lJyHdnUY/kE3Ze108S2lbZNAPcXQZietcFNdvF7ZkDZL+oKdv5ev?=
 =?us-ascii?Q?bHKoS/ys4afrlfA7oNTbNHA/cnG6uvTClBJ0U8ykJ4jHFPnkJybzLRy+CWY6?=
 =?us-ascii?Q?tzWQ3/BT2ySLhDU8YWSj/a4D2vA7SjMscK0IQKvAsEG/urVsI1ei78tBGVAI?=
 =?us-ascii?Q?SkUV2C/O+S8bPh0hE1RNM8q4m9p6TF7jaBAIo3qYSeUdh7LdLr5mK5jVqpgO?=
 =?us-ascii?Q?3wI9kR6ZrROub6+Nd3o90NgkQe+dlvA7pCKJe64vFOxWWQcUs1zDIsbIvpZv?=
 =?us-ascii?Q?OAMVzUXEhTKF9zU+drGrOFndMbccardm30MowAOJ3EIqPj8M/ssGX9H4vc8K?=
 =?us-ascii?Q?8mLSfqCbIfXCDG4NNxHiuVRL39Gl1iMI+7WpdJcNB1seKjPj1ICOptT7rG+Z?=
 =?us-ascii?Q?jwXAk1jqjAi0xvNhyDPeW9vlqlu5KD7T0iq8axrV2NVLAzKmLBaV0Py6FCc8?=
 =?us-ascii?Q?C3fRG/L0ekPZXJoYtXrF+m/6glzqYKyTjKk6ZSjWvJvUaRNdSwVbS9r9zE71?=
 =?us-ascii?Q?2tf4OKBglTpk6IyxCnhXVbfk7EczWMX7UVgnjlfFmwMl7nr3hlY1Riuqtt0J?=
 =?us-ascii?Q?2j83eA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7a78f5f-930d-4816-dede-08d9bfe0f0fb
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 15:38:28.9222 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V7B6gqhp6UsJhHwcQWSbzrK1hWfkQ89UeIUWyFtulp/98KOgWCXtajp2A7Mge31zhILs/djYYJt5zIqH7v1WUy/fWRqrDKJc3VaetggYzx0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5441
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10198
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 spamscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112150088
X-Proofpoint-GUID: UwsvbiU7-Gx9wbkaENPJLHfkmycfa9Pw
X-Proofpoint-ORIG-GUID: UwsvbiU7-Gx9wbkaENPJLHfkmycfa9Pw
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

This patchset introduces support for the ACPI Error Record
Serialization Table, ERST.

For background and implementation information, please see
docs/specs/acpi_erst.rst, which is patch 2/10.

Suggested-by: Konrad Wilk <konrad.wilk@oracle.com>
Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>

---
v11: 15dec2021
 - Simplified build_erst() via feedback from Michael Tsirkin
 - Addressed additional feedback from Ani Sinha

v10: 9dec2021
 - Addressed additional feedback from Ani Sinha

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
 hw/acpi/erst.c                    | 1033 +++++++++++++++++++++++++++++++++++++
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
 17 files changed, 1535 insertions(+)
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


