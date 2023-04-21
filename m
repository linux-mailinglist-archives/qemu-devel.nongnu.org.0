Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 045C46EB3E7
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 23:50:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppydE-0001kb-H4; Fri, 21 Apr 2023 17:49:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1ppydB-0001jg-C7; Fri, 21 Apr 2023 17:49:25 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1ppyd8-000512-US; Fri, 21 Apr 2023 17:49:24 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33LKfbna006820; Fri, 21 Apr 2023 21:49:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=mtDqxJOaTmAxa/h/LWFvucA4bK+TBae3LNVBR6PCqOw=;
 b=DyazEjZV3CLNVDcDxXSHNRKg5xQklPsTf6t/JR4HjjOIhVMlv9OAAiZQv2th1oWGje79
 50ynsALjVGPjvSelUKzG5eth/+A4fXyMJ77ouPU/dApyPRAjI6h6lJAgr1+tVnVKF/KW
 9sN6a9bAHy2qedxYDsHFVopnI+84Sa2jsWXaFkbR1eUozv7BHkhjyNBI8ziST1Try3jj
 w57xJcwGrmwXfUpXnoxXHkQiSP0wMhKg8NlKg15cc28nM/pMcWAbxKohGxwh4AvBDBRH
 GJ4R/F/iH934hrGpyBbNjW5SnK3N3Min0SP68j5DFqyM7/XS7yKpQoL7mgYm8PckI+bS qg== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pykhu67y5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Apr 2023 21:49:15 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 33LJiQFh026537; Fri, 21 Apr 2023 21:49:14 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3pyjcgf5c3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Apr 2023 21:49:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JFYCr8Ajd7Ts9zauihAyRlAEroG5MGCnAGUtkS/9QY+MoQ4/1zzrH4X8oA79fmIowEf7NEoY3akvrdOkoHEQHhQy8xZ1YvUQoqZzXrTIcRsDZ+Xr/TX4u6IXoTHLFLYzblnsMRTC0I7tDWHXmHOi7vA/3lfmG9VBwTzaqIzQkanScSGbdSXgFJZXEu+4Puo8iZsrjX8/DOcPxgNQJagM+Suska9tICdhS57lyLhHd7BbP0eOeLrZUMtivTTUdSw0GcYHL1eny+oJMAJQ9gCAyqM+xiqiOTxdrOa19PJTmjiUXcf5c9tz7lWIczNRCqLA9pmXT3IyC/oiPScBfCpAaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mtDqxJOaTmAxa/h/LWFvucA4bK+TBae3LNVBR6PCqOw=;
 b=iLlkp0W3ZsKGJlqm7oYEjKbhd4yFIC7zzPpsDUV+2AbCKFgo5+zrieJb/xOTE0PYgJxXYu1yfBXr8QZ2wFxpDyHPI0DMJKBe4pgIoJctm708CL4zm1Yqe5vwc9gUlXwSkTTnRRFKs2W/qsj5BFHMjJynu8Ar8GpMuM6ZhiiJp0OvLNfO5sWfVOKwGvfz71HNc/iMvlVXim08EWc2stPejLKf6W4tb5FTwoiuW42ldqluGs2XzR9C2+eObdn7iw1MEJYzNrNiB8Ad0YDUwPMmm/omQR2vMBDnV0P7l0h0AQDvwYXbT4kOD8DQH+H2fENoMfpZnBe4sRG3h/SPo1EjiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mtDqxJOaTmAxa/h/LWFvucA4bK+TBae3LNVBR6PCqOw=;
 b=gKdr+I4+6FIYlwXUYZ/VFm2ZjxtKT740q4IgysDbE//K9avULiGX15sGnXTQL2y6K+eRB2vu+3Z+i/tbD6EvJSuT9H5kItDe0u/meEH7BTfWUhds+R1mrv9O16xv/tkgApz0DDisqbWbQ4oZdzP+16fUIytlxvnvIRfzY0za5U8=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CH3PR10MB6857.namprd10.prod.outlook.com (2603:10b6:610:14a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Fri, 21 Apr
 2023 21:49:12 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac1a:bf88:bdbf:2573]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac1a:bf88:bdbf:2573%5]) with mapi id 15.20.6319.020; Fri, 21 Apr 2023
 21:49:12 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: shannon.zhaosl@gmail.com, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net
Cc: boris.ostrovsky@oracle.com, miguel.luis@oracle.com,
 eric.devolder@oracle.com
Subject: [PATCH v3 1/3] ACPI: bios-tables-test.c step 2 (allowed-diff entries)
Date: Fri, 21 Apr 2023 17:48:59 -0400
Message-Id: <20230421214901.2053-2-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230421214901.2053-1-eric.devolder@oracle.com>
References: <20230421214901.2053-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0199.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::24) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|CH3PR10MB6857:EE_
X-MS-Office365-Filtering-Correlation-Id: d2499b8b-af92-428f-aa61-08db42b23e3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bmjmM1UQz3C8yOq36wrhXjGIzD2fl+FVaaQ0lk1IdJQGAgRDXuY1bZYpheKhFLOp4FVUQtT8lCj1KA/niv+1RzWPPoRt9bvq/nTOjGEQe7/TU1FO8mFg54vCt+Ehk8swoswr6ujMYje/BaiWnEuLIr+8i66W6UHlzwsOPa++gkUtbJLgXIAssZXtBbLRWbYO4RfB+tvxSG7T7/Q9Jtn2MmcNaLr5ZkulT5QFiYk7J9sd4dSZtCKS6JfiEQew8JkaOEvEt5ECyWnQqPlE+WxhnHtl7RMHdTJNWLOmT2Y968g7ryK7/P7tmGQbv+k/u5+ZfPsFgSWTK+DjqbK862LDaZ3neP5rk5QLM0ARUVvoebidt0SS+ohnivJGl/D8zoUd6yM3AfzMtAGzxHvKD3/SbBykRjglzMeGWTD/whrLVUvd6on1eFeTeefzW+Xq9HregUw8xhlQJaMx2tIHCrCdmH0ffWvSLg2/G9jELodDu+UboL159V9TpY4fYU8oCU1Tsx71pPMfxwL5+116Ns3b3RrCGQodjQ/s5CHxaJB4qTesiMDptu9Ye24nYAjYmJtG0BnDpNOxF/+WaCBmoLQib47624G/Yav+7aQniQhYXIA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(39860400002)(346002)(376002)(396003)(451199021)(36756003)(86362001)(478600001)(41300700001)(921005)(8676002)(38100700002)(5660300002)(8936002)(2906002)(7416002)(4744005)(4326008)(316002)(66476007)(66556008)(1076003)(6506007)(6512007)(66946007)(26005)(186003)(107886003)(6666004)(6486002)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KgkEpHWvwkM/tPu+sD1vl7l/B8L05Cp6lMCBGTpYWVRCUrThNe0wOGKP4n+y?=
 =?us-ascii?Q?KK3jwnQbK5tmXIV/6M6ZJ4oUT6W70KfHEeNpSo2lNfd4W8G4l7TAYaLy7MTO?=
 =?us-ascii?Q?qZSGqECplavFa+2NQrb/TC+r7tK0nQy49nLF/o/4m0K8qfnHjzJvy3y6XCOl?=
 =?us-ascii?Q?HOOiBU64h8MJmcV1yXTGlFrjt+/NZVW70q+JFHtd06AQ1+3CmgJuZSt6OFNv?=
 =?us-ascii?Q?+4irhKyGGR7TUSEHsHPRwlrJ7C88nQ9yALj4BzVgr4A/XUAqH84Fo+IYDk/e?=
 =?us-ascii?Q?It4uDPvSyh9Aibvs5gorX1EvGad+0n0XnRCUnpXee1XkDFRrjMGlIvu92erQ?=
 =?us-ascii?Q?8DOEhoYJAhqdyh5fKKJ+RRl0tLDZnEUMDEz2SWfxSsI36XwQoI9UUCv9C73h?=
 =?us-ascii?Q?Wyu/i30sgF1F3L4nn/bvIWoCgqKuXHTtmGedpQJ9xS7tRqsmtJ7aDndX4Vn2?=
 =?us-ascii?Q?piS/2NZbpS9rLhx11w5vVqxYdTJ1yFz6TaJ0sCkf73ZwaLR4DC8l2NPFbCBK?=
 =?us-ascii?Q?dHwln1iLJBdsfQm+L8tJljxadTWjceKpuNRhI3MFlL4eg2DVDj3kw5PfS8Vl?=
 =?us-ascii?Q?SX9zpDzLkgRIkcC5DQd4smZ1rcIB3SDmcP9qWZb55exCsCvJFfQgyCYNBH5m?=
 =?us-ascii?Q?o1bznOs+AGXxiUXlDz6eqickZaIoUxS1MfRegFf4693bIc+NlCkLYAaVErKD?=
 =?us-ascii?Q?B5qVODFB5naTk5pxsARfCzTaNMqILPnmED8slHEI73mPA0h1dFMiJfVRqvpK?=
 =?us-ascii?Q?ti74NcMV3CHDWaOgfxjo368ipJlLK8dfFzBdxdBvjR9NjnFNPFUf7Xs3Ln95?=
 =?us-ascii?Q?VOZdjPV7dEMK1emyPqu05rhhkQHRXs4eSEji1Cb3ecLskRd8O+a1PwVjY8pO?=
 =?us-ascii?Q?Kd+jJeFb2WIXQ6ZcElaPzv8hUoZJ3uWbSya+c7LlEC5UBmgcW762XehleGq1?=
 =?us-ascii?Q?6p+C/0AfQ4KEp0zwG/NYg+S6Znt4kLaXMtf04SvMcwIRPCnKm0DbGZ+DkFdr?=
 =?us-ascii?Q?zZvCJlBDWvbxPET5Docp57coAD74C+QENdBC1Eu3I3Zqb8Oly/a9owvo4+N0?=
 =?us-ascii?Q?uawHiY/i+EyNVyknc1QSNBxj4cPXgkw2kJplb6SiLPhOoZL7VC9EIbIfQpPb?=
 =?us-ascii?Q?Wws6ZqqbcrFT8VJkATvAB67NWPae+T+iAUQRYh51VNerosRMF9WhSeNCdEOe?=
 =?us-ascii?Q?zyXtJRI9h42LWyUM2ujgfsz9FF0sM+C2CV1klXwgltNx5Pni/EseFNL3Gee0?=
 =?us-ascii?Q?8FgFaA6uJAgQ22huXu1YRIqL6lqW3HIIOmfTC7jWBL3tLfazPU23VOI6yD2j?=
 =?us-ascii?Q?ialBk6KChmpnbphbZwlKkpfxwTFR23d1uoxRN8MMr5VQuq6nYKF+UpyqdgCY?=
 =?us-ascii?Q?vianV/l1qcT585N0VkY9tORy3Ywxouna3+5VBIdtVQxbyZHCtiK45/cbkJS5?=
 =?us-ascii?Q?H6xS4ggD6SEdGCXCp8KiueJ6aZFSSB5YDGngEW2dk1IxHEouwtcofE8UyE2q?=
 =?us-ascii?Q?q7ldHaw2J2fdjXAsUJlt5x8QvhxsMEqW5wggXJ9cyXgLEyZcQ8wrtjLjjNiC?=
 =?us-ascii?Q?yPP52T5G3KXk2Eb6k7h47l89nsdtkzlba42b3KKHPvc8kx6GwAduIBbYqFtd?=
 =?us-ascii?Q?Nw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: uXQrdPxM3gflBbJE5+LwRNpeWXHpMqzm48yC1LIUjNEm+mXwyTnVtLpqqZ/42y5vKEaLABafnccGLcDZ1dCcnW5KuSoLqMhIr8gngyDqi+wGM9G/2bo4n18FBAoHJuIP2zfDmOI4STbRkwgqe7WkQ+GFakFPxsk7AanzLDe5gf4k4KCjl+iSEQkqGnlKdLzTyR6AuNUkBLzDM5MxQgx0AWTHLR1jYxAFaU7XzG0MLTXEHfw+HxBK83Vw9YzzRqkt+aSQOWcAtCutlR9amGnYB0fyXQl1oRIGJCNzWjjATDKL5GYGyFuyqbwOVQHlPzxWQzfYVEN1BnplwhcsZwyDFIHi29oV86bvzFRXlg09Fy0QaQ2dLJKEIJn6oh77UWN32owUTbZErjIaWEwPq11WdEkNtt/u5YYHuE04kl7c2SZOZA6I+6N2LuDhuV2WhHAd4v3Pu+K8almIwbfxwl77Z5IaVpPygug8uft2X9rYuC7Y0VEpfb3rxUWNuJHHMqWM6/iLL4xvo7wlyg8pTSbNvekPma8lSxKkcBiU5a/KgS2zXwJLuItgkALKFY+SJP/b6vB9APoqtii93pbmJ6K5lpi1s9EBpEi7zu8qeB/fPowrIpW9cGEBcz277TcjRDoGENOD6ugqtM3VzH9yBYTMA5xFKGtevBy4YUys4FY9C7rzWru+L34FXp4uOXrCKS4LmKfeRQ/PaVyQTrY69k0wO4QFG7cOxs4B0hvBQVwnRmHv9NB+M9wUceUCC3540nBkeTFtb1Sb++GE3JDsJiVloOoeRAlcC6Ii834GA1L6zYwP82Dmkff+3C5UfEgfNxFQ+SBHXBOLSouZjc+EO7CUYrfjoRcwchlGsr6Eet1EC6PO14SxsXd1KI+uyJfS2xq01528khKEsfa5OvNRrcaO6w==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2499b8b-af92-428f-aa61-08db42b23e3f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2023 21:49:12.0305 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SRvPl6MIq7rW6WWkhmi8zn9DCA17YX5sYLq2KNYkv4WUKOXOUBLFnpeZs8t8spT9m84GBkbbpJo5JJ6HaHjjJk7L7fpt9Hj6+0UYQ2WUzUM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6857
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-21_08,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999 mlxscore=0
 adultscore=0 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304210190
X-Proofpoint-GUID: LO75E4jJzqUFSSIE_tQfetWqqnMNsXZx
X-Proofpoint-ORIG-GUID: LO75E4jJzqUFSSIE_tQfetWqqnMNsXZx
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Following the guidelines in tests/qtest/bios-tables-test.c, this
change sets-up bios-tables-test-allowed-diff.h to exclude the
imminent changes to the APIC tables, per step 2.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..1e5e354ecf 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,5 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/pc/APIC",
+"tests/data/acpi/q35/APIC",
+"tests/data/acpi/microvm/APIC",
+"tests/data/acpi/virt/APIC",
-- 
2.31.1


