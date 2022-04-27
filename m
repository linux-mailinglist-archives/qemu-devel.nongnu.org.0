Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 582D65113B7
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 10:44:27 +0200 (CEST)
Received: from localhost ([::1]:44816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njdHe-0004JM-EK
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 04:44:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1njd4Y-0005Kj-Vs
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 04:31:00 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:61710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1njd4V-0005wI-KR
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 04:30:54 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23R6Wrs4003733;
 Wed, 27 Apr 2022 08:30:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=HCzqBCZEyHVXxyMcVDvAqb4MIcypJP2/pjPP2j94jpc=;
 b=te0yvzj0zsH/tQnVxte8GooNbJ8Z2WW2g9rvg1h7IOmNYtilcMl/ZxMthTjJq3etRAQ5
 TTjfvK+qdFrbrBvqdRs5j6quGuFG/j1Bf5/V9fZ5kieGo/eFMS+bMzOxpOU1do0gsQ5J
 tPXtaGFcRgxUYvoaX6gZ6A7JspgJqm/Ea7XvtTOcgvHkWxobReGYCNgKEMXMFWxM2t7p
 8IU147lTH2vB7XGK6ZwcPguOTSVXJXUeswVQik4siBdQVSie1YfeijZcFHMqxOOFRssK
 sCTRq72sPaPrrlFeTKY5Sm0UjUwkDL08LrycfiyD3k5mDWTx5QEjWa8wlWFwmJIjut9i 2A== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fmbb4r1b3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Apr 2022 08:30:48 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23R8UfWG030459; Wed, 27 Apr 2022 08:30:47 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2048.outbound.protection.outlook.com [104.47.56.48])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fp5ykf12n-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Apr 2022 08:30:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dP78CARvcFv9cVAwcaSfqUH3WWfzmdoACw9zvRw2zpQrwsNJB4jom2t817nYDhgS0pv4cZ2hJE8tGQNDuFjrLQBeYXLCTrLbHCi/lsqRJU5cKWNsMXQI4h2EuqyuBf0y3GRjSY0IVYEmIjUZY2ncQpgqlD4CJknvW4/QY+B+jZxT3T1HuN2GlwpOJbQKukiiW7FzMXEQzk/tG4DY+ROJNX5A+asbqJbOrvhmntoObYSboEEUY6O1g/6+HCovNeHYKOwuQvFY+0Lzw4gflZZ4rG2C08dckQjpYdktMNgPEBb7NbkvBWDz0y/WbqNghOv8XEnNaBCiD/9zYRe9Ro7pJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HCzqBCZEyHVXxyMcVDvAqb4MIcypJP2/pjPP2j94jpc=;
 b=krKzkU11xTuLu/vbPWlTeWvPNSqU5B9D/fFwtXWJLqbm3ER1j7dvK0RD6B+0rm6zmKSpOpCzcoLNq3WQkEJZqZZSYqY3fVUUJxB+M3VPN3LbSmtBLKJPTYZLymkF61ztagxWY5RAzsXaiDtMZiDJBclS6xCM/1+kEJps9mDjk6GmRH7LTfQR4iEYBL/1PoNZyxV5VgjiR4mEqgF98yszbzL7c+Dj9Wp8PtNhF0IVo29xscVcTL7DQAvfS6qMyfOsq6J9TjB3x6yWA020JqwytIIkU6BXWMWylDz8HR5/q2MvEcoGoGPGsAgqe+VGhlKeRG7dGwJTlIw1ownC8LzgMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HCzqBCZEyHVXxyMcVDvAqb4MIcypJP2/pjPP2j94jpc=;
 b=gEWTQC/Poe11S8ayvc/JQOvwLfPwHm1vijb20pxdKdLrzYEDTeGJvB0/s4eiQAg1tXww5UQ/2YYRUbKmWLBhZ4Dw1x7RSECKNOlfYiQNZVROGQnLI8xeDJU3+W+nRalb/Uos0aLOv7ZQ8iaFugSZ0vgYMFgXa9IL1SbO/Du22d8=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by CY4PR10MB2007.namprd10.prod.outlook.com (2603:10b6:903:123::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 27 Apr
 2022 08:30:38 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::c89:e3f5:ea4a:8d30]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::c89:e3f5:ea4a:8d30%2]) with mapi id 15.20.5206.013; Wed, 27 Apr 2022
 08:30:38 +0000
From: Si-Wei Liu <si-wei.liu@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/5] vhost-vdpa: backend feature should set only once
Date: Wed, 27 Apr 2022 01:30:16 -0700
Message-Id: <1651048216-3365-6-git-send-email-si-wei.liu@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1651048216-3365-1-git-send-email-si-wei.liu@oracle.com>
References: <1651048216-3365-1-git-send-email-si-wei.liu@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR20CA0030.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::43) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 94e45c28-89bc-46da-2cd0-08da28283548
X-MS-TrafficTypeDiagnostic: CY4PR10MB2007:EE_
X-Microsoft-Antispam-PRVS: <CY4PR10MB200783CAACCD5C8761D67B93B1FA9@CY4PR10MB2007.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rZ63wz4CG+c0B6ftx6cSOm7hRQMniPAnt5NwQU4X6OFujDfaQMsbHpNCZa1E2Pi5alluwp0l8Nczrf17ugvqnTFWQNzyg1S8C6TvKp4FEEPN0BOT3HS5Wo3svYzZZfZj7Qv9y+IhCkSBj4JgYATAE5CHwW/QJs6itPw9d/8lOtJQ9RSps7zYLPju4C8ZPeHhPr6DUpL8+dNDpliUeKYdZBrdOI1mdUhoIHuqFdcBPt301NjRAXMlbdhAQhzfEUieTICmfBLBjST/DzWChqG1j5ySUedUzhNUDOCFMuBjalpl1qdEI3Fyf75aBldi11SRSPGWJrlC2cHVPzqR0ChB/nMvfFJEn12Cm4j1lJkeeAOl4M9dTQYJ+nFCKuz9/DjREb2OF9/KCM60g2E/fP7NbEcPQLklmY2Dja0cp/2+UJr7297x/PdAQgHhYRwfjw45B27vsjt59RQ+ORF+7YVugm4qCTI4eqxCNyXLIj1CIEl4AR9FMfHQf0pD17BtCu96FepTWGmfkyLqclZImc4AUenKiy7v2ZIX84Xkk82TjvVQ32SmfXUGjnrxPlvGsHr6xoKQct2uZk2eYDY5jWTfU+CBUN+U62iSvvY0Fa3xMlSgcl4kWFJbz0ZPJJdQFvGt8X992Pfz7GGHF1XBjmRh+bxHw0f/AYBHsgEJ0r9UM7nWC9w5H8UwH1vhbNAa3xWXO6ZOVBmZfYYsdL5joJPkUw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38350700002)(36756003)(2906002)(316002)(508600001)(38100700002)(107886003)(4326008)(66574015)(6666004)(6506007)(6512007)(52116002)(6486002)(83380400001)(8676002)(186003)(66476007)(66946007)(66556008)(6916009)(86362001)(5660300002)(8936002)(26005)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2RZN0FpYmNDeGFiL3MxSG1vOHpGSER1SDh0REtRNlk0SmRZaHdmWlFQNkxR?=
 =?utf-8?B?MGo1djN1UDVqU1RVWS9xaHMyTzNqV3RWQ050WFFXM0pxWGk5Ung4QndKVTcx?=
 =?utf-8?B?YjNkcFNLeGdaUDhDelpxN1RwZkxEbWNWYkJLZVpaZWZHeXNPYlUyckZwZ211?=
 =?utf-8?B?aDEzQjB2bGgzWDNxWmhsU3ZlU1FlcjFMNUJUTG9rVU1PVlpkY2RpOC9qNTZn?=
 =?utf-8?B?ZlVTR2V0RjIwV2diV0xERmczS3pUaFlGMldxZjMrYUN3TldpSUROTmFkYnFV?=
 =?utf-8?B?QVdaVlM4T1lOZmVBelNkcGt4M1ROSzNTd0tod2x3WHA0NmdqKzcxMTd2TU9s?=
 =?utf-8?B?eVgrcklLNkdqeU43dnBwNmExLzZTSUxBeW1LNUFhM0J1c0dzTUc2Z0l2dEVm?=
 =?utf-8?B?cXhVeEdrSnc5ZTBXdmljaE5CSUdNWkNpbzBlM2h4NUtZSUIzUFRqMGY3SS80?=
 =?utf-8?B?aHRGd1g4N0hXN0FyQXJkd3gyM2VjUGVWZ2VRSUdMT3YrdWRLQzEydy9PKzNO?=
 =?utf-8?B?ZGVkZFBzUjBkRWtSanJ2b0ZBaUorOGdsZjBGUE81Z0hNbWlXM3dqaWlZM1lx?=
 =?utf-8?B?UzhBZFAzU1NoTHZuV2NzenJyYWU0Nm00dHpPcHl4aHFTNWFFN3ozZFNLS0pL?=
 =?utf-8?B?eDhVa3o3bXcwcTFWZmxJZVk2N3JmWG9vVTc0a2RZRnpYTzdNRzNQaFprb1Fn?=
 =?utf-8?B?OGRZWW9UM1JQSjFTcUJISFFNSjBzQlg5bVQ2bTh4bHNRazF3bTdRNjJUaEVP?=
 =?utf-8?B?VUpXRS9rUE9LM3A0TDFtZzBvSCtKZVk3UGpwaWVFVUxlOUNIMXpjOU5nL1pz?=
 =?utf-8?B?UGw0TmovNERHMlBJd3E5YmdPUGhjQStaWnRqbTEvSFp0QWMvVUdhUkdXTFpU?=
 =?utf-8?B?cTJtdVZVMFR6bEVLbTg1Y0hXU0t0Zm5JSHFvbndHdG5LMEhQeUNFS1hYNTVw?=
 =?utf-8?B?S0tyVnp0R2lsUVQvOC9GRUlTWDRiTk1CbFcvYzdEeWVMeXZBRVcrZnFjYStj?=
 =?utf-8?B?RHVvVzRQNExVVk1UbGNTNklVaUU5QnROdXBjZjRxalVGOVpGUUZPM1cwcW50?=
 =?utf-8?B?bDZ4LzRId3lERHRoV0dUREhUbWlzeTdqYUVGNlNSUnpZcWg5Mnlia1BHcHBS?=
 =?utf-8?B?Qzl0SEdmaEx4ZG1Ta3kwd1Z4dlBnenlWY3V2a3N2K0VPSmhrQmFFMlBjRjRx?=
 =?utf-8?B?YmpCdXVmWXRueUVPRFc2WHl6VE9Sd09QQ0NZUFFBZ3I4cUFJSG5CL2orY2xm?=
 =?utf-8?B?dlBzd1Jadzk0N1o1TC85eHBtRDFHM0dkeXNGVUU4azVHQmZOc0U5K1hGR2xO?=
 =?utf-8?B?QlVNQ3R4eGVKYUJWVXUrTC9pajdDY3lkM1k4a3JzNDMrRExuUUhjNUlkK3ps?=
 =?utf-8?B?VXc4MTVFYTN3aGd6citFbUpUd2JwY2RKLzJISDFORFFDd3FhTzk2K285Qm1n?=
 =?utf-8?B?bjlkbFBqZnl0UExMSXFlS2czSVhCM3Z2UHhpWVVYYWNnUGo4TVlDK0VGNm9J?=
 =?utf-8?B?bE5ZN01IdUFodk5iUDljUHRsaVN4K1VVZUdNekxPUkh3SXJmRzdRaUszT3Jy?=
 =?utf-8?B?RmF5R3JVVVNGTnN5OXkxVDArWk92OU1TdGQ0SUQvcmZjR0V6SllFSkdyNnlr?=
 =?utf-8?B?M1VzL1AzaGhVMkJ4aTlUZFdob1l2bGVKdW5Wc2RYWGFwMExjNGVwUGxIMG1X?=
 =?utf-8?B?eVltcWFkOVJqeUdJSmJ6RnN0VHZCV21jSm90Z3BiU2szOXA2VlhmbkJUQlMw?=
 =?utf-8?B?dEI2bi9VWDlCYnc3b056Y0dmdXBrVUltMDlIUXcvbWVjc3B0dlp3cGx3OGFz?=
 =?utf-8?B?VmVoakExU0JJMTArVDhhNnhCQ2FjSlVXL2lmSkFrUjd2RXJydDJVUXQ5U200?=
 =?utf-8?B?V1JDMTRhWEpDeUhWM2RxdW1jODNDeHd3V2FjYWdPQktPcTVmWGgzTzdzZEV3?=
 =?utf-8?B?dE41TUN0dWUyd255YzYxZlpsNTFzVWcrOHV3VUFFcFFyVks2T1lHY1QyWWpJ?=
 =?utf-8?B?R1hyYUtkM1NzYzB3MFNOSG1YUjYxMzdQcDJ3aXFSSmlEZHBVOWpoYklYK3VQ?=
 =?utf-8?B?amhFcjRCVjZEZDFxUEh4RHhEN21YdXpubE9GamlvNDhldEc0R0dsM1gxdlFs?=
 =?utf-8?B?UERVV0d2S2hvdHBoNjVwSFN5UTJ0RmF5UkZCTUt3OHMwM0M4bTl0aWt4RkNI?=
 =?utf-8?B?Y0dzY29PcjlYL0pKei9oVm5waVk1Z3ZGdWJZM0JWWUVZcER2czFtYUlBVjht?=
 =?utf-8?B?N2IwMitheXJwTUcxQy92Skk5ckY1M0hKQzV1NFI4U1R2ZjBUYy93UlpFV1BJ?=
 =?utf-8?B?MzRrUlhPUUtuWng3cWtqT0pVQWl3cWNQdjBva1ZSVXlWa0U1OWpkdE1TbDZY?=
 =?utf-8?Q?aVVdPAoo5XT6JlSQ=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94e45c28-89bc-46da-2cd0-08da28283548
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 08:30:38.6103 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xzWqzy2msuzSqPjer6LhNJqzpoa3wulI2MauD+HgnHFNE26K+A5mgog3b1TglP1yex35CwAa/X1gM5Vbdkq8sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB2007
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-27_02:2022-04-26,
 2022-04-27 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=999 mlxscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204270056
X-Proofpoint-ORIG-GUID: JFm68mETmgtNj98Xo2zTBaaC8MVox_vC
X-Proofpoint-GUID: JFm68mETmgtNj98Xo2zTBaaC8MVox_vC
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: mst@redhat.com, jasowang@redhat.com, eperezma@redhat.com, eli@mellanox.com,
 si-wei.liu@oracle.com, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The vhost_vdpa_one_time_request() branch in
vhost_vdpa_set_backend_cap() incorrectly sends down
ioctls on vhost_dev with non-zero index. This may
end up with multiple VHOST_SET_BACKEND_FEATURES
ioctl calls sent down on the vhost-vdpa fd that is
shared between all these vhost_dev's.

To fix it, send down ioctl only once via the first
vhost_dev with index 0. For more readibility of
code, vhost_vdpa_one_time_request() is renamed to
vhost_vdpa_first_dev() with polarity flipped.
This call is only applicable to the request that
performs operation before setting up queues, and
usually at the beginning of operation. Document
the requirement for it in place.

Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Acked-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 8adf7c0..fd1268e 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -366,11 +366,18 @@ static void vhost_vdpa_get_iova_range(struct vhost_vdpa *v)
                                     v->iova_range.last);
 }
 
-static bool vhost_vdpa_one_time_request(struct vhost_dev *dev)
+/*
+ * The use of this function is for requests that only need to be
+ * applied once. Typically such request occurs at the beginning 
+ * of operation, and before setting up queues. It should not be
+ * used for request that performs operation until all queues are
+ * set, which would need to check dev->vq_index_end instead.
+ */
+static bool vhost_vdpa_first_dev(struct vhost_dev *dev)
 {
     struct vhost_vdpa *v = dev->opaque;
 
-    return v->index != 0;
+    return v->index == 0;
 }
 
 static int vhost_vdpa_get_dev_features(struct vhost_dev *dev,
@@ -451,7 +458,7 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
 
     vhost_vdpa_get_iova_range(v);
 
-    if (vhost_vdpa_one_time_request(dev)) {
+    if (!vhost_vdpa_first_dev(dev)) {
         return 0;
     }
 
@@ -594,7 +601,7 @@ static int vhost_vdpa_memslots_limit(struct vhost_dev *dev)
 static int vhost_vdpa_set_mem_table(struct vhost_dev *dev,
                                     struct vhost_memory *mem)
 {
-    if (vhost_vdpa_one_time_request(dev)) {
+    if (!vhost_vdpa_first_dev(dev)) {
         return 0;
     }
 
@@ -623,7 +630,7 @@ static int vhost_vdpa_set_features(struct vhost_dev *dev,
     struct vhost_vdpa *v = dev->opaque;
     int ret;
 
-    if (vhost_vdpa_one_time_request(dev)) {
+    if (!vhost_vdpa_first_dev(dev)) {
         return 0;
     }
 
@@ -665,7 +672,7 @@ static int vhost_vdpa_set_backend_cap(struct vhost_dev *dev)
 
     features &= f;
 
-    if (vhost_vdpa_one_time_request(dev)) {
+    if (vhost_vdpa_first_dev(dev)) {
         r = vhost_vdpa_call(dev, VHOST_SET_BACKEND_FEATURES, &features);
         if (r) {
             return -EFAULT;
@@ -1118,7 +1125,7 @@ static int vhost_vdpa_set_log_base(struct vhost_dev *dev, uint64_t base,
                                      struct vhost_log *log)
 {
     struct vhost_vdpa *v = dev->opaque;
-    if (v->shadow_vqs_enabled || vhost_vdpa_one_time_request(dev)) {
+    if (v->shadow_vqs_enabled || !vhost_vdpa_first_dev(dev)) {
         return 0;
     }
 
@@ -1240,7 +1247,7 @@ static int vhost_vdpa_get_features(struct vhost_dev *dev,
 
 static int vhost_vdpa_set_owner(struct vhost_dev *dev)
 {
-    if (vhost_vdpa_one_time_request(dev)) {
+    if (!vhost_vdpa_first_dev(dev)) {
         return 0;
     }
 
-- 
1.8.3.1


