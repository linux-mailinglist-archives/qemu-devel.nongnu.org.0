Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DDA4B55A0
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 17:08:39 +0100 (CET)
Received: from localhost ([::1]:58746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJdu0-0007kO-RO
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 11:08:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nJd86-0003Lf-Od
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 10:19:07 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:20038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nJd83-0002TW-3q
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 10:19:06 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21EDtIQn016453; 
 Mon, 14 Feb 2022 15:18:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=GtSxljkuib9MyQec1GLHaAFnl+o0dFJpmlIl7XsSFyI=;
 b=ZP1LYoYSz55+t4dcL5MNCa7tMatsedb7z3Kjs5ywszniF0EKtJpjYDaVa4lItdTPP9x9
 gcTAoAFq/408F+AKJrtNNoNykZxqINjsJ8gObBpHeS9n08s2kg9QHAHC09GCOsQue126
 QMwAVzLxvG6SM0F484t1CoPMeUz6MD+nolesLS9jKYE7TZpn0hIz0w+j4BiQ5z3wuOvR
 Vyq9CFgpTC+xBFwgCzmHQRFmit3ML1Dk0RHzJKcJOVOPlhO4N+t5l8Pw5cDFNJ5of290
 EXLWCNpu97vsUcynhu2BAnYQO0yAFUv9V97bP3+EATq1xl2En953BlEgVf9JUS7DhX0i bQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e64gt4sv6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Feb 2022 15:18:54 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21EFG2Xt045253;
 Mon, 14 Feb 2022 15:18:53 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
 by aserp3020.oracle.com with ESMTP id 3e6qkwu940-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Feb 2022 15:18:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WTADmM8IUleOELx6C6gKErL2GwJkB4/AuP18Ep0Yf7W1KfA2CZSJyUvG9fzk31RsRAhOErXOBRNgLtPT5bFF0lVZr0KwMYK8RvYPUg28k/IHxdyRm4As6VGpu3RvG2eyfBjxN3M0I5juOycynb+BBBnyzJ3Iiz0LNDMfgFMp/7ll8oJEqtjV9okDT7pVM8cF8CIduTsYkSHnR0DR1zT6vnM+eRaIwsTT+b7gnomAtqvbsczahnpXvW3qLnkv/bpIruxLa7dAP9joGk3/WJb93WMxZg26pj1hUH4n8SmHCrHR24O6Cy3s+DJoVa4pCvyXcy7w7NLVAF6783UW32tEdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GtSxljkuib9MyQec1GLHaAFnl+o0dFJpmlIl7XsSFyI=;
 b=MyhGKQ1PUYk46K5UPpRZhSHJIzT0jKkEikVMv4ovF5QfMGDZVZ1KGzzUMguD9KJv3+GnYEBl5hooCmGM8iueyjygUK6Xl9RTGY+gYldbp326py0yPWhHRHdW7Ommi79B73UH/AhL6JPz+wmE5s6zWNiTHylEO+UAdINT/kNOhCu/tpwBHNdF6LYD3K5/UxzQ1BzE68Cg98Ocoy2x6UoYuEOg21LV9tFLASZE+wAI2L4tbKpdtVuOfYLR6KHXLrOnn8SHqCDqCDaZsxQEr7fjCubT1A/5vMxrhpj/SCdV49qF+pL1IXHAaLwE1Yv9+DyP86g8JnCtkQKXAxWJXdbGaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GtSxljkuib9MyQec1GLHaAFnl+o0dFJpmlIl7XsSFyI=;
 b=IK2NGjJIkJF73fmHrbrSYPp5Tnx6pV2uTFXLWmqwcXzez25ERWrabmPdxWaNkdw6DeMeGA2gd3Y5Qo8m508VY7NbNP4M9bckPmZqQrrNc0aXUk5Txd0uOdPgxEviLluujEuLxCL6qw6/4Y/MsEgozK5o3CRC8uF1vHH6P5KcQ5I=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by MWHPR10MB1999.namprd10.prod.outlook.com (2603:10b6:300:10a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Mon, 14 Feb
 2022 15:18:50 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::4910:964a:4156:242a]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::4910:964a:4156:242a%5]) with mapi id 15.20.4975.019; Mon, 14 Feb 2022
 15:18:50 +0000
Message-ID: <f627c202-5281-affb-c439-ea394c3ab70a@oracle.com>
Date: Mon, 14 Feb 2022 15:18:43 +0000
Subject: Re: [PATCH RFCv2 3/4] i386/pc: warn if phys-bits is too low
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>
References: <20220207202422.31582-1-joao.m.martins@oracle.com>
 <20220207202422.31582-4-joao.m.martins@oracle.com>
 <20220214160325.62b6436d@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20220214160325.62b6436d@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0098.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::13) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89c0b3b8-851f-4429-cfa2-08d9efcd4dd3
X-MS-TrafficTypeDiagnostic: MWHPR10MB1999:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB199902F7EA12B3934830C118BB339@MWHPR10MB1999.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hoDofDZ2hX47SZiYCPkQRzbiv+f25LNYt2i2hyZT0wgHlWuXPQomeZG5YJtaOSyHUPIapTrYcNHsbC9xLGt63pHstg6b0CSog1mStdm94Jj3zZd6QTuE15cipT+BSpwIBXpZT+Sp/kalh/Vs3MzOzE30bUav21ADPqt6NJHT/IcMJBCdioC4jqDrCRENXpS8KUPTl9OOAhzZgLfKc04r3DWjFEU4JCBaaYsh03ylNSUOiMABo48J72YXR3EmLdBdkbJwv+sSFFUKpqW0Hm4rE1bEOIges1uZLsYsG7g4cy17B2CMe/SOIomnkQpdNGrScaE4O4Nx6z5ChTmayIuD7okw/mL2rTZTTu3QB1jTbN9DL6RJbVNJqzl/aLu+uBKGfFxj5zaNN9ZJme5uiR2elO6SCX/fo/xyj9Nky2KejyYBjMbQfFaSCu2YXAq+3u9H45dBUrJN3t5lplVUv3yUawk4Y96Jz8ojgeCP9uCKBZY4VlWQS7tKct6Etx1bLO6K3qU2Pj384IMEa4nJa2cifXfFHBbO/F36TeiiN09MXbXlQnrnWyia03bHb6mBoayg4DLMR53nPWIOasUqg749Lm24jLJ2Nq/yoRIq+9qLebaOab0/53cy7FF+gIcpH/MlKQ7UpgJwS7oDMYfI4HV9VDG2+Y8vNBUenWfxyt7ST+N3S7QJLD1L2uZkgulg+cB9tPU05O4+KhkOI7/ApBr9bg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(66946007)(2616005)(53546011)(8676002)(66476007)(6512007)(66556008)(26005)(508600001)(6916009)(54906003)(6486002)(86362001)(31696002)(6666004)(316002)(83380400001)(4326008)(38100700002)(8936002)(5660300002)(36756003)(2906002)(31686004)(186003)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmdFbFdpWG1LbnMwT2hUT2E5bE1rcGdVbjl0Ny9GVllHQnBjTXBnOE14QXA5?=
 =?utf-8?B?RExOODgrbTVYN2YyUTFIeXVjdEVqZlZEaEpnejR1NUkxWmZzZjNKUW5ZWlAv?=
 =?utf-8?B?TCtoYmJWaUs1RUZUc0lMQnlhSnI4c28wUnp2QmlSeTh1YW5RL0pBd2xHWThZ?=
 =?utf-8?B?TmN4UzRQZWVQUmV0TGxMdzJKRDl5cGdETWRNWHc0Vno2bmZla2QxdE1yUXM4?=
 =?utf-8?B?NCtDT1NobjZoTTg2Rmg3ZzV1S2RtbThjb2daWCtyUTJFZEdlUTFDSXFSWFQx?=
 =?utf-8?B?OTRHdWd3TDh6UER4NXA4bDZLNDNwZGE3NXBEMjA2VE9NUlpKN01QeVM4S3Vj?=
 =?utf-8?B?NHM1dmN6aCt4d2E5c2gvUDI5TmZTQm5GTjV3TDBDVVZDNVZOYmh3akpnTVQr?=
 =?utf-8?B?VUhJY1Vwcnp5YnU1cWRzYm43L1lTZ0lyREtiREdqc3M3RTc3NWlKMFhzTkJD?=
 =?utf-8?B?MVdScXZWSnVRbmxNSzZUNUlpcUFaV1BlT3JGWExXWEpZRnNYcDJsWDJNa2th?=
 =?utf-8?B?TzY3NjU3dVVwQngzOFQ2Uk5ja1gvK2dsQUoyWGp5dFIzdWpnbVNSSEZJeFRh?=
 =?utf-8?B?dXlYZG9GSWFWenViNFRiSGt6dDlpNzZWQWZ5azRxV3NaM2xrNnlpbGQ5MzFZ?=
 =?utf-8?B?Y1RlL0lDRDBCVldGM1NseTZqRGl4OExlckk3VFZtTXpIZkRBY25VU1BiTWlP?=
 =?utf-8?B?anRZY1RDK1FxZkd2ME5pWnA1TXZrNUJWTmtna1RBakJyMU9RRHJobjRzMkU4?=
 =?utf-8?B?WFR3TmE4MjNxdjFkVU13UzVFTUdnMTBCRi9kZHlVWkRJY2dsbkl0aWMvVVJQ?=
 =?utf-8?B?bmZRdWV5cjB3YmhqZlVwcERMNWFMYm1iV2hTd1BHYXhTV1IvS1djZVZ0KzI3?=
 =?utf-8?B?cmJCV0VTRTZrVlJia3NDaW4yS0dWK1ptQVQ4ZExFcGlsamJuMmNNdVh0ZFZj?=
 =?utf-8?B?U1lHazE5Z3huSk5rWUdKRDVZUzhqVlY5aVZ0RXJSUmhVb1g1YlY5VEF5NjFX?=
 =?utf-8?B?dUEyWjA0RHUyWWcwejRObXBNM3hDWjl0ck1QUzViZnpaVjVqdU1UVHR1Z01j?=
 =?utf-8?B?V25QZzdGbkI3blcwcHo0cWpUUE1hY0M5cWgwVE9ZUEJQUWxNOUIyZTZWbzRr?=
 =?utf-8?B?ZW9lOHZkSFgvbUtoMGFZZHAreDU4bkhzQk40UCtkM0czY1FjUEdkRUFBWGdS?=
 =?utf-8?B?OU9lMkE1V21FK3N5NHdZQU9QUGpUU0drcWlRR3JqRGU3Zjd0ZkFJOE9acTJW?=
 =?utf-8?B?dXMwMGlpdzRoYVhBWDlVZjF3cUg1S0RkNWIrWS9TdFRZc3RiRjFZbjFkMGxG?=
 =?utf-8?B?azV6QjB0U2N5V0ZhNnUwRzN0aWI0czYxeVpxS29TNzFBTXozVVRBeWo3VjRt?=
 =?utf-8?B?WHIrenRMUnpJdXBLWE9aQWlZMWZWWG9CTVRPRnRhZ0djU0txSndpeGszWmp3?=
 =?utf-8?B?bGdlSU1KajJwM3FWNkxoOXRJM0tnQkZIb04vTktybmczZE91REVQc25PdFZL?=
 =?utf-8?B?eGlFV1NQeDhmcncyMmJIQUlqUGhETDlFMWdRR05UcHNCQzlNZDZaeXV2SDNk?=
 =?utf-8?B?aXRRN1JtckJKWm80Qk1sL1VSTmRZTWc3dElpcFl0REdiNGNxTUVwaUtnVjAx?=
 =?utf-8?B?T1V3bTFlNlE0NTlEbGdhSGFqK2JycURZU2tjRm42cjV2elVTUy9JR2JXRTR4?=
 =?utf-8?B?QjhLdlBWcFVZbU9HeFh1bkxkeEp3Q20zWDhWdmhzemFmamJ2MDNhRFVWbWJz?=
 =?utf-8?B?bm9ZdmtzOExwZ0s2bEh2RmxrUU9OUVU4Wkt1eUVkSDV1T0lWNVNQV2RITkt5?=
 =?utf-8?B?SGtOcmFvWWVXZHBveSs1MWR6NGZ3dDREMmVnUEZWQ2ZKWVNXR1BCWGc1eUdY?=
 =?utf-8?B?R2paQkRTaTU5V2dwczF2S1RaaVdwaVBadGhJV1RidnVuajBFUzA4eWpDbzgz?=
 =?utf-8?B?RmVCMjRjQXlxelQ1VnNVcHpyeG9qZGUvSmpRWlI1WG5zQ0RRYXhFeU1NR0Zh?=
 =?utf-8?B?R1A4c3RKVGQ3QlRKamtUTXZ6aytlZzBjQU5saHQ5SlZxSXlJdm93RkFpaTQr?=
 =?utf-8?B?dUVCeFVOaDRNV0NRZmZodEpNSE1IaC9zY3U4UnJDSTZBTWttT1BWS1hCb2NF?=
 =?utf-8?B?YTEwdEVtdVpZTjZ4a0FnSjRhNWVMMlNJb1ZJS3hmUkFNTmVyU2ttQ29xODJj?=
 =?utf-8?B?bGN0bkZTSHBweGV4eXE2Sm5icllnNng1MEp4WWt5M0g1NFpjcGlmaDg3RTNl?=
 =?utf-8?B?NU1XMFZYUmtqRjhETnRWdTFNaURBPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89c0b3b8-851f-4429-cfa2-08d9efcd4dd3
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 15:18:50.5665 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vx8L9+Bng2OuSHs1AP4EJzxwaCz63aOSKKWKDu1up6Fv1/T6EqyYdbaBo2N4P8nkXl0WxTCS89CHh9xdFidaT0ua9Vvnaax8oHDRaW/DppE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1999
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10257
 signatures=673431
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 suspectscore=0
 phishscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202140094
X-Proofpoint-GUID: xXAPxsaok-PQjA2eOI3mCkklaOYjzcBo
X-Proofpoint-ORIG-GUID: xXAPxsaok-PQjA2eOI3mCkklaOYjzcBo
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/14/22 15:03, Igor Mammedov wrote:
> On Mon,  7 Feb 2022 20:24:21 +0000
> Joao Martins <joao.m.martins@oracle.com> wrote:
> 
>> Default phys-bits on Qemu is TCG_PHYS_BITS (40) which is enough
>> to address 1Tb (0xff ffff ffff). On AMD platforms, if a
>> ram-above-4g relocation happens and the CPU wasn't configured
>> with a big enough phys-bits, warn the user. There isn't a
>> catastrophic failure exactly, the guest will still boot, but
>> most likely won't be able to use more than ~4G of RAM.
> 
> how 'unable to use" would manifest?
> It might be better to prevent QEMU startup with broken setup (CLI)
> rather then letting guest run and trying to figure out what's
> going wrong when users start to complain. 
> 
Sounds better to be conservative here.

I will change from warn_report() to error_report()
and exit.

>>
>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
>> ---
>>  hw/i386/pc.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>> index b060aedd38f3..f8712eb8427e 100644
>> --- a/hw/i386/pc.c
>> +++ b/hw/i386/pc.c
>> @@ -842,6 +842,7 @@ static void relocate_4g(MachineState *machine, PCMachineState *pcms)
>>      X86MachineState *x86ms = X86_MACHINE(pcms);
>>      ram_addr_t device_mem_size = 0;
>>      uint32_t eax, vendor[3];
>> +    hwaddr maxphysaddr;
>>  
>>      host_cpuid(0x0, 0, &eax, &vendor[0], &vendor[2], &vendor[1]);
>>      if (!IS_AMD_VENDOR(vendor)) {
>> @@ -858,6 +859,12 @@ static void relocate_4g(MachineState *machine, PCMachineState *pcms)
>>          return;
>>      }
>>  
>> +    maxphysaddr = ((hwaddr)1 << X86_CPU(first_cpu)->phys_bits) - 1;
>> +    if (maxphysaddr < AMD_ABOVE_1TB_START)
>> +        warn_report("Relocated RAM above 4G to start at %lu "
>> +                    "phys-bits too low (%u)",
>> +                    AMD_ABOVE_1TB_START, X86_CPU(first_cpu)->phys_bits);
> 
> perhaps this hunk belongs to the end of pc_memory_init(),
> it's not HT fixup specific at all?
> 
It is HT fixup related. Because we are relocating the whole above-4g-ram,
on what used to be enough with just 40 phys bits (default).

> Also I'm not sure but there are host_phys_bits/host_phys_bits_limit properties,
> perhaps they need to be checked/verified as well

When booted with +host-phys-bits and/or with a host-phys-bits-limit=X, the @phys_bits
value will be either set to host, and ultimately bound to a maximum of
host_phys_bits_limit (if at all set).

So essentially the selected phys_bits that we're checking above is the only thing
we need to care about IIUC.

