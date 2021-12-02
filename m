Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C518466A30
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 20:12:04 +0100 (CET)
Received: from localhost ([::1]:60140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msrUw-0000UG-0T
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 14:12:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1msrSU-0006o6-O4
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 14:09:30 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:19786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1msrSR-0006M1-Tb
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 14:09:30 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B2Iu78B024260; 
 Thu, 2 Dec 2021 19:09:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=kw5zRb6fcbfjGiIjU/ZOl679L3q3FAE7+fmlUiHRVQ0=;
 b=U/APcbRjx/kqPDFuYTLLcPKUU0+DOCXlpSx4XuLcbdvwLRLzwt2v+vMlQYpVBQBhIje1
 a2JV2V82iXeR0wUAnKIccvEOlMP5qbOtAiSXddATl1DaCe67N5WJOSliUSqI9+4cTYRw
 oUhsrv24ZueS9ThCo73GHJBFNhY+EX8kh6hWMmXmGavgOaAED08jve3h34RSe9A0nhKr
 T6hpnWkrZrGo0Cdss8ctSYoLtGA7VxYaku+HA18JXlUxfqEKrtfF3m8ZQthReIW4q9F0
 SDGa5UP4T4Vk4ksRlhIFs6WTvljtgOenruuMhI6eND/vW8jdUfo+CvN6VeXSPAWbxOnD 1w== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cpasys3a5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Dec 2021 19:09:20 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B2Ippc8051222;
 Thu, 2 Dec 2021 19:09:19 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
 by aserp3020.oracle.com with ESMTP id 3cnhvh76bg-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Dec 2021 19:09:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NySA77rvV57pVy3t2+Xz8SMz6YXjfV5E+8OMFberjOkBpdGpqqLwiuB+su+XdXUTVOCLS9bYLhtU3p6KV0KZQv/imM+FfE+IiTmekGpFUF0sP1M6OJi9TR3LLGqzJrK9rJ/mtVYP/yVr0x7HtL8AvbI4K6njr2cRu6co0aCKU2acU0FajJhQCsFbkx11JKziQk5fJivILosbaBi4jxfE2KnrHixiq6Up0+mJDzrrZKgFsdj9N1eCRFC0XDgmMkznzqG3VpZ6s3q/HoM0nAFEEteESe8091vHvNVLEnWo+SlY/5vdP23yDUOZOzQJ62Al+X0o8/TUjPX7oUC4/SEbfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kw5zRb6fcbfjGiIjU/ZOl679L3q3FAE7+fmlUiHRVQ0=;
 b=f4t6uSOLDXGXgPGtXfVBSzRGzO7fUaT+DIFtcOt8XcePq6ZTXAqzejzoS0cGn7vsZI5P3cf5QTaDZkTq135vPEXKjkaWyaVf48+lz9lu0Em8HY7yBPHWCnOZAtzrfSlsVhukB04ARrm7CCARsFiM40PRNZs6bZvZjFAJ67Lnm0sY2+Q7CRO7XOXCd9KgmlHqZcrdbgOIK9cF1egxLI0+TPJeYvHtnPvAy6BEMeWwUlufalbtqCO5pl5hINw4fZGYziQ5UfmcCK6WfegktxphgET79hAga9xPdDloaFxWDKihfe8dR5bvQu5weD9PVtOTbc+PWCA+O+VFUFKvJ69YwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kw5zRb6fcbfjGiIjU/ZOl679L3q3FAE7+fmlUiHRVQ0=;
 b=hxTgJrZy7SX2E1vfujGoUf+hx6qW0Vyltthz6Ujxg/KT2As7rCHW29u1ySlk1nQhIGBJINb557XoudPN2IJyM9UtxB/AWVyk/Hq80K3Oxgf93vtT0h/kHNbYbTADldfZTjAng1UpYxBLxI/2AiZKyRyAfCkm+rEpsq0Cb6uN60Y=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB1693.namprd10.prod.outlook.com (2603:10b6:301:a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16; Thu, 2 Dec
 2021 19:09:18 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f%4]) with mapi id 15.20.4755.015; Thu, 2 Dec 2021
 19:09:18 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 01/10] ACPI ERST: bios-tables-test.c steps 1 and 2
Date: Thu,  2 Dec 2021 14:08:53 -0500
Message-Id: <1638472142-14396-2-git-send-email-eric.devolder@oracle.com>
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
 Transport; Thu, 2 Dec 2021 19:09:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad86cde1-2161-40b8-380a-08d9b5c73d4c
X-MS-TrafficTypeDiagnostic: MWHPR10MB1693:
X-Microsoft-Antispam-PRVS: <MWHPR10MB1693F9F900305E90E76B76CB97699@MWHPR10MB1693.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3/HzaHQDlaHQNwxedLf0lrrSdT5GVrKiPM1uZ61TRCLaN+XvRfSGivjy3rhLXyuMVyu0hXRvqAdgEDtObINnpPUmGawbl3GAItoaL+J/cBu+K4MlXnl2Qmwe/KbXh9SUcT8uY+tXQZAK//+cmNPVl/HPYYAo+feJZJHgSggra9b5X03/5DFPFQjHPgutkJNQfnYOgw8wfKAvFSi7XIEcgLlL9tiJY4ijhMT9jDSTccaLHFhmYgYE1NmejUQ4h7/qvIClhZ5DqjtjO6MQh7vLfLvHPLLAXPokBeZzIVctsVuKLr/tQrhrevUCVI1bIRhFQhaJXJKuhz9Uu0PNlSUj5SI+8y9EW+iSHea2yaqGWa3N1Wb0cK+bKMPgF96UUZvi3gnah+dJGQsl7YR3TAf5HMsloYF+ZPN7/91LozNPUbDs3EOLy4R9vHBJX2l5gZIw639mwR66zq7Kbf0jSk1rZe6tQ+ksd1QqN9ff37ogeFi3BdurtOJP7uzZE58IgtrjP8crbe4hMGgfyYOLYPUwJJNnF4AlqLVofxFh7HssuafbJtA4zVJOZF7YbfEOauBq1oRTicFysgw4tpVdAJ9YcI0n0O5mJBE2/NU7Fz2InE6CRyRnqjIafqA0p07rlRDoIHs+CxlN3ic484+xCyvIX82R6TGWvdM5PxmRm07BUHpe4cB/muOCA9hXMtkJsQUXiFzY/IXEwam1h+2L1kPNjw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(52116002)(7696005)(186003)(4326008)(8676002)(2906002)(6666004)(86362001)(38350700002)(38100700002)(36756003)(508600001)(5660300002)(6486002)(26005)(8936002)(6916009)(107886003)(956004)(66556008)(316002)(66946007)(66476007)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ohJfbAPUxpLVU3p6yCnKL2RcDrYp/8GXWF0pQvEkiqO3D6Mc7/LLD7ObFxOM?=
 =?us-ascii?Q?UQ56BMMKDCX7yKSbKxEKdBZFNu8u/sqgq1soDB8gbjKJTj1c8XFmNKNFYAAH?=
 =?us-ascii?Q?QST68v2W6ptSTZ6+tGe+tG1PNBnxTn4I+UF1ojy4h9OtWE1BMC/hk9gXSw2g?=
 =?us-ascii?Q?DYQFQudpwexnZWXz5X2hfnoI5fHH4zBsieftIqexD+pPdSg8CWLW30RZXauV?=
 =?us-ascii?Q?cKrV6XxoM/rCh7GeRBmwL5dTjkPDXgrCdOyGda0ySVj0xjSR6XZ1Aunrkliw?=
 =?us-ascii?Q?lohjONuJBqlTg6zwkFvV4gwEO08Wtv/Fr5kw92wMBXpK43HG2iBxhDoBnvJn?=
 =?us-ascii?Q?tC/1BMnQHe0IsC/FMMjpedXWJ1z66cqsd6fcKHYsY3nQYWOqY+f+WnkDrdWv?=
 =?us-ascii?Q?p6IEvGOCItWa6bCy1VGLCLGFSw9YsjgTbcofolVohGJlOxJ5ZdbxuKa3n2ZJ?=
 =?us-ascii?Q?KLmxkaj2Hntk4uwtnTdJOmvrAjsJo8OfsmQZXM4vdrXRH0mxZ6g27hza3NM8?=
 =?us-ascii?Q?tbbShIR4L+U8GPIiEmS23OE4Ppd2S3vVbaECX6HgXOhuMIY+LmL6nwzZ4gh3?=
 =?us-ascii?Q?M7rQbR45Wx7jUDfjahk4sqt4+mtOJ0zYtwm01yOPAKDfVdtqCI4Wz+F5Jcb4?=
 =?us-ascii?Q?SlBEG1rF6y70+3IkkPdm3yPM0k+2j7RoeaodTw9EVhe2CSH5tQx7D81bBQ30?=
 =?us-ascii?Q?K78t/JWs0EZtkxqoXlWRbeLUjBOaCkBa9kxgDhffVTcyckAvLvjZD6yQ6Owu?=
 =?us-ascii?Q?7pxfNP0YX0Ln9nZ8ffNEeRUeYa0Bdo2rS6saC6AkGAX3PGlN/XWmwT9yWufQ?=
 =?us-ascii?Q?hEYSVHAYQPfPVAa21bGTUHezoS80e0Oc0UJBZMMUT9lYivzY2E15XupugzgA?=
 =?us-ascii?Q?W6N+zsEKBvtwz5Nmb/x7Qni6FMx+y6XaSa43cTZi+gMn/Isn30ZJ/DTHyz9f?=
 =?us-ascii?Q?VyFa46oaXVuPIHp0SDoRUxB3PimyHOH3YV+vsFhi0ZRI3dtdoyLIrO+IumcA?=
 =?us-ascii?Q?loWsJk4LpviMq7yvUMecGzEpVRkop6/oUCemDqwZV3RrRfTv8OLFwt6TJyQ9?=
 =?us-ascii?Q?3kRXZtRA5O3ZN11sSSgjesTHpeKCyAc2jSYxQgnZLC89NKP3KcklrLNZJ0qG?=
 =?us-ascii?Q?x4xSqdQBBR79DrFlRjQ+h6T00+cfD/VbEWmsVn83dHsOxwbHRL7fS4r1AOK6?=
 =?us-ascii?Q?fPh9+XTcoiCTkg3eEKtyAtOV6FRJc4rCOuIDSc3dz39cTHLPsgYxXD4pMeId?=
 =?us-ascii?Q?TgkMMlKaxIfeoc0772+ydSVfPme+LXOq2ux3Lu0TLONTbcdpTIibERsfv/df?=
 =?us-ascii?Q?wiMneshhhcmO3h6aQVtPA/h3djsSc+UKrbF1ADAghe27+u/HTQEJNX/Bk085?=
 =?us-ascii?Q?RTNoFxJdtQpFEgHyfB8c/7j4bpw8EE9TGLTkU56G3/F9ihBdKCO3Q6chfodR?=
 =?us-ascii?Q?RiprX6+R1ilpkhhhxI31XFUH6jgq/fdsXupMrrj5N49w8meiFLWA1sW5CP22?=
 =?us-ascii?Q?Ly3StTLebE6w3ZyY9CVdH9BBdTSSY+fM+x4/KeS4g2aJ9A49D8UkzhUF5I3Y?=
 =?us-ascii?Q?rW9KbXLICk2FHA0Bg+5haHpWTJSGX0rWrhBn/PZEYue8/3/iqaaCy8/tGEUE?=
 =?us-ascii?Q?Ajz0luJIJNrWlVtg/Qhc1affKubJ7TVQXs1HpPcpYN7wyjM+tETCSBQk+FET?=
 =?us-ascii?Q?DdgvsQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad86cde1-2161-40b8-380a-08d9b5c73d4c
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 19:09:18.3503 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tL7JhhJgQ/DsGEOyCEXJ91wUZkhTxJTBtrGUFzk0qVzZexjXEMC3uc7kx6wIi8cYQmVVQHMyBsFOPbUsv6lP8nx25Q/5og0GrGUFv1Xmpdc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1693
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10185
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 adultscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112020121
X-Proofpoint-GUID: BhmCCO-_2H-OnBu37SabwDmr6PUrvSpw
X-Proofpoint-ORIG-GUID: BhmCCO-_2H-OnBu37SabwDmr6PUrvSpw
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

Following the guidelines in tests/qtest/bios-tables-test.c, this
change adds empty placeholder files per step 1 for the new ERST
table, and excludes resulting changed files in bios-tables-test-allowed-diff.h
per step 2.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/data/acpi/microvm/ERST.pcie           | 0
 tests/data/acpi/pc/DSDT.acpierst            | 0
 tests/data/acpi/pc/ERST.acpierst            | 0
 tests/data/acpi/q35/DSDT.acpierst           | 0
 tests/data/acpi/q35/ERST.acpierst           | 0
 tests/qtest/bios-tables-test-allowed-diff.h | 5 +++++
 6 files changed, 5 insertions(+)
 create mode 100644 tests/data/acpi/microvm/ERST.pcie
 create mode 100644 tests/data/acpi/pc/DSDT.acpierst
 create mode 100644 tests/data/acpi/pc/ERST.acpierst
 create mode 100644 tests/data/acpi/q35/DSDT.acpierst
 create mode 100644 tests/data/acpi/q35/ERST.acpierst

diff --git a/tests/data/acpi/microvm/ERST.pcie b/tests/data/acpi/microvm/ERST.pcie
new file mode 100644
index 0000000..e69de29
diff --git a/tests/data/acpi/pc/DSDT.acpierst b/tests/data/acpi/pc/DSDT.acpierst
new file mode 100644
index 0000000..e69de29
diff --git a/tests/data/acpi/pc/ERST.acpierst b/tests/data/acpi/pc/ERST.acpierst
new file mode 100644
index 0000000..e69de29
diff --git a/tests/data/acpi/q35/DSDT.acpierst b/tests/data/acpi/q35/DSDT.acpierst
new file mode 100644
index 0000000..e69de29
diff --git a/tests/data/acpi/q35/ERST.acpierst b/tests/data/acpi/q35/ERST.acpierst
new file mode 100644
index 0000000..e69de29
diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523..603db07 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,6 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/pc/DSDT.acpierst",
+"tests/data/acpi/pc/ERST.acpierst",
+"tests/data/acpi/q35/DSDT.acpierst",
+"tests/data/acpi/q35/ERST.acpierst",
+"tests/data/acpi/microvm/ERST.pcie",
-- 
1.8.3.1


