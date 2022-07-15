Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39272576124
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 14:10:22 +0200 (CEST)
Received: from localhost ([::1]:35220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCK9F-0004U1-2W
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 08:10:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oCK7H-000324-Ed
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 08:08:19 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:35686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oCK7D-0007kj-RW
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 08:08:19 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26FBZpjq018530;
 Fri, 15 Jul 2022 12:08:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=rK7aHRuEaE6phV7jL6OJtYuJFOID2WfQUdB61hsJC5o=;
 b=L53XY4Y3mwo9KwwWbFI6xsEhupU546wADuRX/RLgB5A2KndKELq5iChSsYTvMfZS83yp
 vJUIf4DkB3yzJDPar5jJx+rwCQggsySd0gu+KHa1o5R/xo7dg0DwUw1I7h4c6vXKm0Tg
 E1DOa9DpGDDe4kBwdTope6boSUTMuUFtxAcTDFx1V/vY2XYyFmY45pGBI3Sr6b5278Lj
 GfjHBGMga2lAYJdgKMx33OjRE0JPbyXTmerkKevlMDp08p4+ltuZNTZFmK8uUi+Y3g5/
 6r31WwHFKDMWFHlJgM34yZt3+03HMSs8mdLXiU1vW24oDqsjkZBL2b9op1XLT0YRzKBm WA== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h71scfuye-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Jul 2022 12:08:09 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 26FC5Ug3002638; Fri, 15 Jul 2022 12:08:08 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3h7047d5j7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Jul 2022 12:08:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eyzyOxwzONJRnpLPbgLeqPk/KJTjjw22nppgY6ODPw3I2ENDLhlxwK7DTEQwAWm6MrGxTp04XZIJjXMsHzCSVhjbBKUgif32+cf2E0JSAU9G6dXXrUBYA/XePn/agHL9zKu7kYm9I/uGLx4eIIazDHwyKcvkDBk7u61MOcCsb80oTt8IxTNix+xr7MCw9xQoTIPTldk+fRfTuBJqGc5Eq787Nd0VlMGOFpdTgLrJqu6MZdn9+XVY5caEAxKAT/2bA201j6hicRvFvgryr4j12A6Oio/2HJBIWgPDAq80hn+yty7cXZmP5fkJgjS48HqLoheJrfgjvd/aYEzujNku+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rK7aHRuEaE6phV7jL6OJtYuJFOID2WfQUdB61hsJC5o=;
 b=UGhci+DDDOW9Qw+5rWnBR01ipvb7xleEYbb9LFVkN4vACHF03GdlNRWhTyz8nQs3IvcVRkh5z3fvnAy/HQhn3+pXk7imvlRNMOdhoTC83n6ZbkQX3WqLLQoqvsJkQvmzlzandt5bp3e2N0K9esrFeEPHuMLT0mZpdI9RwfrIRbR7LVoDC6LY+EA1RMCiUW0ChfPAok/cI67rWWM0a7t6FmxHK1VbKKgiBxzgnRPZWCg3c0NX1v2s/laSriRtdt8FnyoyQ4I5a3PI66D8Ouv3GzEIul08+qHc8/A+MhjYJG7jqAIS2yacV67s0E6GfFRuZQItO7vIX3VyyNPdih4x7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rK7aHRuEaE6phV7jL6OJtYuJFOID2WfQUdB61hsJC5o=;
 b=B8wSmKPbPdjppilANDxpQJlphYuge+h9RAWDiZ7YY639v1N7YQeZZTXh6OQNaXeQNGfzCKHhSPNTEi5hVYQVSiZ+eJmRUsB9GVXkmxqQmdIglaRpilaxn/DNARPB2iIk7wBS1hy0zG4i0hhUC1HoSYdnDaWb2g/8cBK4JYpAVXs=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by BN6PR10MB1730.namprd10.prod.outlook.com (2603:10b6:405:8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Fri, 15 Jul
 2022 12:08:06 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e%8]) with mapi id 15.20.5438.018; Fri, 15 Jul 2022
 12:08:06 +0000
Message-ID: <4a0c15fd-d219-de4a-8d32-871f3b121aea@oracle.com>
Date: Fri, 15 Jul 2022 13:07:59 +0100
Subject: Re: [PATCH v7 09/10] i386/pc: relocate 4g start to 1T where applicable
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
References: <20220714182820.30970-1-joao.m.martins@oracle.com>
 <20220714182820.30970-10-joao.m.martins@oracle.com>
 <20220715135721.491f754e@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20220715135721.491f754e@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0322.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::21) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9471bc5-042e-469d-a8d1-08da665aacf4
X-MS-TrafficTypeDiagnostic: BN6PR10MB1730:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /nHo6KFlIgqg4buqy3NzHKHnvVxAU/iS7CzOFZtErp0s8JKHoo51VxoGlxl+2POA9S+EL3X3+QTW37pmfiy5id5qq2qJAIuHpGSz6oD7gNYobmsrKoR8EewI4vdkVLdHf8Hh4n9/ejbIG2ZEfzy1blL20444Aqzi/vKq70HOXgKu9nBZSg0fPV8Zd4XZYdw1W1X80ZfbgtkhuGAwRGCOMxeiqb2iORXFCouP3njRmoPeCLzAQl2XpZu+cJp1ZYgIO2uNnmnE4Im7DswrtPDB89nppWl90f/iuTI/So40R52J1Hz4dP/Cpa4HTYhuIMTxSxYvUGkE7iCd/M2OkTuyRjdjoTLzaITB+3dQI+50hckfBVgRSATYdWi+01UP1OLO4QQ8r6YCbJ+RG3S5Pb7YsAG7MIk22GiCjbOA4ajgfo5kFDiX6y2J/B41KsCDYqyeyo0aat6VGrnZTk3FF9y3P9dlo2gZCDuLxA4CQvztpl8y9Dk0d/kG2ayiMCe6/QIpz0BmoxJJ3FHvfvlNnuxvFXJtNW6XwesKpmpymCjIaoeAiMs1RnhkcwEyzoZBTF2aBB0w0w8tay7joRLQW9Tcd7YuTUuTvikw6eSQ1oE+4fOBmRxmqSGyMqtXDR6+pCkdEG9tuOmDAL9CZE/P3eT4+FuGnMh0glyIwIR3Yfw5a6hS+mz4JbwOIlI6JHKSdchmTQZUtguAe/dUc09GnmyGu2r2SWgdT7TpAA9rZu/2mvT2DZJLWXhllEVndr3cYum0+Jq3p/Y3oOzZ7shj5HeZ84hXqQUfB5ChJ8rzRLLikxuB4US82Jm/Q4p69DosgaJV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(39860400002)(376002)(396003)(346002)(136003)(54906003)(66946007)(66476007)(186003)(8676002)(2616005)(316002)(6916009)(4326008)(8936002)(86362001)(66556008)(53546011)(478600001)(6486002)(41300700001)(31696002)(6512007)(6506007)(26005)(6666004)(36756003)(38100700002)(31686004)(7416002)(5660300002)(83380400001)(2906002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUJMTk02bUJZR244V1hyZDRaRnZST3ppYmQrSDJoTGpCaHI5elNRNVFyWGEr?=
 =?utf-8?B?WHNac21tcGo5TXQyeGdwalU2UVk3YlBOYlM1UmM2S0NkUE1aekljMkZ4SGxC?=
 =?utf-8?B?bTNmdkpxak93VllYVWlzMHRSUmRCNDFZcWd3UGZtMXVSSXBhSGQ1TjJnVFpp?=
 =?utf-8?B?VEpmK2NkcG1yTTlIU015TkxvaW1iSkVMMlNoNUhnNFpTUVNCbkZlV1c5ZGJZ?=
 =?utf-8?B?MFZFNWFGNWo2Y3J6MUgyTmFlT3FyL1NReCszaGxhaXNHUzVCK2ExaENiSFQ2?=
 =?utf-8?B?T2MrS2dvZDdjWUFZNm0xOHE1bm1DVzd2U2xxc0g1aUk4TVBzbnpXSjVaOGJE?=
 =?utf-8?B?bTlLckpaWSt3SUFqbE1FSU9BU2phN0MrWmlIaEorRE1pT1g2YzBpMU5ia2NN?=
 =?utf-8?B?cjg2N3lleXI3TEhYYkJsZ1oySitEaDlySG9aWm9tVjQ1VS9rTExmQ1JtUUt2?=
 =?utf-8?B?UnkvWTJZK2Vvc3RWN2dWZkZ4YzJ3dmdJVVBXMjBPeVBuMkZ5dnllaE9jUk1Q?=
 =?utf-8?B?Z2J6WFZPaVRvbzRBOHNBWGZscUVrcjhweVF6UUdudmFFQzQyY2crdGdtSnVr?=
 =?utf-8?B?Zmd3NHVING02OWpYalQwZmhSTGhoNCtRbkw0emNaZThXR1kwNnhnbExkS0hO?=
 =?utf-8?B?VEZvVWNNV3hUTEhOZGlDZlR1NU5WT1J2VWRweGpQQlpaYS9sVVJ2Q0VQRW9a?=
 =?utf-8?B?OUNSWHRaUmd4WjFtNnFGWjJidWp1Zyt4Z3ZXSlpKajdiSEdZRnpkYUt0MW5r?=
 =?utf-8?B?VUtmNWNab1BWbUZFNm4yOWRLYVNiL3JsSDVaYnd3c2pucFhZdnd2cEpsV0Vo?=
 =?utf-8?B?MHVjQ1Z2VGxUcktpdUhDWVNOTmRLRTIyZHMrV2RuUHdtSGZCV0JNcWpmRElW?=
 =?utf-8?B?MW81OGV5WWhJdEc0bjBLcUJiZnVTQUc4dElhb1dENzhLcm0zdytucXF4ajkw?=
 =?utf-8?B?b1hOU1Z6TTgxQ1hCc3owRGNmZm1EOW56UFRqK2ZYd3k3UzZxcWhlSUg4YzJZ?=
 =?utf-8?B?V1ovT0V6aXFHQkJzVzdWd2RaR0tRYjQ1dHNMZmhQWmtoWXQyRFZOYUcwWFBL?=
 =?utf-8?B?NlBwanI5N240UUs3SzF2VjRUWVJvNTF0TUF0OW5GS3F2MFBOZGhHUW5rWjZp?=
 =?utf-8?B?VXJ1amN4WWIvV2dEbGRtTGFtV1M1eWNvM0xFY2I5YWlQV2daTHB6TTdzREVG?=
 =?utf-8?B?bkw3K3lYS1BXN1F1WERXanN0TTVuUG5JYTlsZUJhT01WamdZbDQrUDF3S0p5?=
 =?utf-8?B?RG0yVXBqaU1XUUY5Qk5OSHB6NDVoalNVMTZpSTl4R1k0ZWpZNDRrLzI4UCtL?=
 =?utf-8?B?KzcvSTgzNVhZNHRORS9FcGtpdjRhRlovbEdSNm10Y09LakJ1MndFeFJUR1Jn?=
 =?utf-8?B?WHIwYnFzSWhldFd3SC96YS9EWWw5SEFRelNhT3RyVmRuK0Y5NW9pVURNN2gv?=
 =?utf-8?B?WXNycFZIRXJVNy80N1QrTnIrcldnYXVQby9pblY3cjdvVyt1bHc0OGUvQlp6?=
 =?utf-8?B?bXB2V1hVTFM4VmNyNEg3QmFvQTNNTWRWZEZNK3hGQjlUNlZ3WnpyMm9PZldh?=
 =?utf-8?B?Y2lid1RYd21XZStMM0RrUWw3YmZ1SHJacVcyc01rVWRnU2l0Q3BUQnU2Smlt?=
 =?utf-8?B?Rm95aXBSWmJrMjlpNVFMQVhhUzJTYkR6Zk1EVERmckNKOVgzWWFlVW1rcnhp?=
 =?utf-8?B?cUNYNlQ5d1Vjck80RnlMMmE2b0dnQUhKWkxWZVU3UUVKQktBS1ZCZWF3VnhE?=
 =?utf-8?B?ZUVBVmIxSHhmU0pRc1JGNkUveDRGMmNJd0hBYnp1Y1pIaTlnKzVscWZ1dUFK?=
 =?utf-8?B?T1FET1JtTlBVeVVmZGdYOWhpSHV2SmdDRVY4TmNMSityeVVLam9PWWFjRWVZ?=
 =?utf-8?B?YTdrSVdRRlh5R3VyOEdjSXdGWEZ0Q3JEOEpkVEhFVndlV1lPUCs2bHZPNVZp?=
 =?utf-8?B?ZlpDSXZycDZQMHVlTHpHV1ZhUUpiRVdDN2tjbEliazRTUCtnZFZpdXJnV1FL?=
 =?utf-8?B?UkNYREZNa1FTWGQ1VVF0bXVjdi84V3BOaU9rTzNmMll5c1JabGc4eG9jVHFF?=
 =?utf-8?B?Zk9Ockx3N0lLMGFPeHcvUkJ5RUhMWEZkQkxLV2dGN2FvaGh4M3E0Q0pham9F?=
 =?utf-8?B?UWVaeDJDVEUraXoyRUVkNUZMbC9LdXRKVmN0REcvMGc3c1gxOEs1YWZOQWdW?=
 =?utf-8?B?K1E9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9471bc5-042e-469d-a8d1-08da665aacf4
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 12:08:06.3665 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6h2++lee5iqxBr2v7IXKqJI+HGO2XzOZ3qR7MnRonNdvkTwe0qyTbiKWj3S7SGkYj9bBMIrCwG+PXAu5rDg2WOjDUaR5K5PvKu4C5mFdbVI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR10MB1730
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-07-15_04:2022-07-14,
 2022-07-15 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0 mlxscore=0
 suspectscore=0 adultscore=0 spamscore=0 mlxlogscore=895 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207150053
X-Proofpoint-GUID: aTztglzXnpPxevaYNerUZNLktZvwuuC3
X-Proofpoint-ORIG-GUID: aTztglzXnpPxevaYNerUZNLktZvwuuC3
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/15/22 12:57, Igor Mammedov wrote:
> On Thu, 14 Jul 2022 19:28:19 +0100
> Joao Martins <joao.m.martins@oracle.com> wrote:
> 
>> It is assumed that the whole GPA space is available to be DMA
>> addressable, within a given address space limit, except for a
>> tiny region before the 4G. Since Linux v5.4, VFIO validates
>> whether the selected GPA is indeed valid i.e. not reserved by
>> IOMMU on behalf of some specific devices or platform-defined
>> restrictions, and thus failing the ioctl(VFIO_DMA_MAP) with
>>  -EINVAL.
>>
>> AMD systems with an IOMMU are examples of such platforms and
>> particularly may only have these ranges as allowed:
>>
>> 	0000000000000000 - 00000000fedfffff (0      .. 3.982G)
>> 	00000000fef00000 - 000000fcffffffff (3.983G .. 1011.9G)
>> 	0000010000000000 - ffffffffffffffff (1Tb    .. 16Pb[*])
>>
>> We already account for the 4G hole, albeit if the guest is big
>> enough we will fail to allocate a guest with  >1010G due to the
>> ~12G hole at the 1Tb boundary, reserved for HyperTransport (HT).
>>
>> [*] there is another reserved region unrelated to HT that exists
>> in the 256T boundary in Fam 17h according to Errata #1286,
>> documeted also in "Open-Source Register Reference for AMD Family
>> 17h Processors (PUB)"
>>
>> When creating the region above 4G, take into account that on AMD
>> platforms the HyperTransport range is reserved and hence it
>> cannot be used either as GPAs. On those cases rather than
>> establishing the start of ram-above-4g to be 4G, relocate instead
>> to 1Tb. See AMD IOMMU spec, section 2.1.2 "IOMMU Logical
>> Topology", for more information on the underlying restriction of
>> IOVAs.
>>
>> After accounting for the 1Tb hole on AMD hosts, mtree should
>> look like:
>>
>> 0000000000000000-000000007fffffff (prio 0, i/o):
>> 	 alias ram-below-4g @pc.ram 0000000000000000-000000007fffffff
>> 0000010000000000-000001ff7fffffff (prio 0, i/o):
>> 	alias ram-above-4g @pc.ram 0000000080000000-000000ffffffffff
>>
>> If the relocation is done or the address space covers it, we
>> also add the the reserved HT e820 range as reserved.
>>
>> Default phys-bits on Qemu is TCG_PHYS_ADDR_BITS (40) which is enough
>> to address 1Tb (0xff ffff ffff). On AMD platforms, if a
>> ram-above-4g relocation may be desired and the CPU wasn't configured
>> with a big enough phys-bits, print an error message to the user
>> and do not make the relocation of the above-4g-region if phys-bits
>> is too low.
>>
>> Suggested-by: Igor Mammedov <imammedo@redhat.com>
>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
>> ---
>>  hw/i386/pc.c | 82 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 82 insertions(+)
>>
>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>> index cda435e3baeb..17613974163e 100644
>> --- a/hw/i386/pc.c
>> +++ b/hw/i386/pc.c
>> @@ -880,6 +880,52 @@ static uint64_t pc_get_cxl_range_end(PCMachineState *pcms)
>>      return start;
>>  }
>>  
>> +static hwaddr pc_max_used_gpa(PCMachineState *pcms, uint64_t pci_hole64_size)
>> +{
>> +    X86CPU *cpu = X86_CPU(first_cpu);
>> +
>> +    /* 32-bit systems don't have hole64 thus return max CPU address */
>> +    if (cpu->phys_bits <= 32) {
>> +        return ((hwaddr)1 << cpu->phys_bits) - 1;
>> +    }
>> +
>> +    return pc_pci_hole64_start() + pci_hole64_size - 1;
>> +}
>> +
> [...]
> 
>> +
>> +    /*
>> +     * Relocating ram-above-4G requires more than TCG_PHYS_ADDR_BITS (40).
>> +     * So make sure phys-bits is required to be appropriately sized in order
>> +     * to proceed with the above-4g-region relocation and thus boot.
> 
> drop mention of relocation here as it's orthogonal to the check.
> Important thing we are checking here is that max used GPA is
> reachable by configured vCPU (physbits).
> 

OK

>> +     */
>> +    maxusedaddr = pc_max_used_gpa(pcms, pci_hole64_size);
>> +    maxphysaddr = ((hwaddr)1 << cpu->phys_bits) - 1;
>> +    if (maxphysaddr < maxusedaddr) {
>> +        error_report("Address space limit 0x%"PRIx64" < 0x%"PRIx64
>> +                     " phys-bits too low (%u)",
>> +                     maxphysaddr, maxusedaddr, cpu->phys_bits);
>> +        exit(EXIT_FAILURE);
>> +    }
> 
> these hunks should be a separate patch preceding relocation patch
> as it basically does max_gpa vs physbits check regardless
> of relocation (i.e. relocation is only one of the reasons
> max_used_gpa might exceed physbits).
> 
Yeap, makes sense given that this is now generic regardless of AMD 1Tb hole.

>> +
>>      /*
>>       * Split single memory region and use aliases to address portions of it,
>>       * done for backwards compatibility with older qemus.
> 

