Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B483C61AA
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 19:12:38 +0200 (CEST)
Received: from localhost ([::1]:42484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2zTx-00086V-Ae
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 13:12:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m2zPM-00019S-1F
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 13:07:52 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:60220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m2zPJ-00061T-FC
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 13:07:51 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16CGvIJK001826; Mon, 12 Jul 2021 17:07:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=1KIETWFUL86n+e79MDI0xxLl1YIcYZgoWvR1BiqBUec=;
 b=gUQPjGs4yzmxTb5EWs6ho/0dKgdkDhCnYzMKGC/wKf8fmVUfWUu11ZyMCER0H3/TjvzR
 01F2vVLjQreCoC0Ysw+GAU42YJAZaDHFmXkAiKxQ1BSmYwT1HL7PXOoq6fg1IeB9RzuN
 vwKj9f3/tejMW1O8oEh6wxVK8v54nPsk7+CWcJ1MrXhYTEDNEqXCf5yYgB7xnkx4mgPB
 S/+f3UeGcWHQTfKjDg6MCcS3yJNDW1rF48lR0CKG/vXdfp3wXC226AIF4JsALt4I048C
 5bwOXd34AE1alfvyEsB16a5P4xmYs11d3xFOQWbpgwJ2jd4ZstkfMba2hx48XxRMrfNL bA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 39rpxr8gck-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 17:07:45 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16CGufBS038395;
 Mon, 12 Jul 2021 17:07:44 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2045.outbound.protection.outlook.com [104.47.56.45])
 by userp3030.oracle.com with ESMTP id 39q0p0udvj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 17:07:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R5jBtdHCy3thVuzmxgxhFEMLpF0qI3NtZtrX9ci5d0tGYRMfGIaAMLSAWtpBVYBb7xYeKgFAKKlbVJvxX/nraMDH4A2XBiMkYLjDq7lNE9U/s5xUhBgTf6m1InNc+48haHVgKu6PUKGEscfnn3yLYt0b4Qcyz7+PgNmg7SRHZpcXC7o1AJHBpDPkcYw2wxWuK5l/i7gYwUI5TQ+2PjOHa84unwk4za5eHoUe/2RGSc1vsjqvpGck7ymoC19lkOOEW1taTNKngyw/VjC87rWBRcWaZKbfm0csiH0rsKA5dGQr1tO+sU4HmgSlnGPxIU+5aZ+uIhBZZ8OJIK2nWVUD5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1KIETWFUL86n+e79MDI0xxLl1YIcYZgoWvR1BiqBUec=;
 b=nFo0ycmKSlLRw6Ut3gSt1zZWkbMktXNqnRckWgPtIsDnhNomsMYbCl6ksgrcR6lw+uJan640IOJOfeDw1KKVQC++ocStwGAlyK//8hmS8nNQ91Lc/bBJaaHjDdK0f7NclHaf3DyFQZG9TxgkaCobsWIWQed+Abp4ucr3j1vqaYhWTpMv0lrnmTN/0UarGGRA2UCWD+KFkDwlWRfgk0Qc3o4WbdaSalE68W6fr5vfd+oOFOJ0qCkVTQB6vYaUcSnxoqKUcvGQ+oSxRrKBlzAxDJmCQkppzGav9ovMTyi3FaPevJNS7+xgdKWre0H3OHcvIjfoSSpM8G7Rr5jkKjknPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1KIETWFUL86n+e79MDI0xxLl1YIcYZgoWvR1BiqBUec=;
 b=dguOU+icfaqa+GZhR+RzdUAcfX2AX4ia7az7XgzI00x/odGRjY5OfvUNNs908OU6/3WC+mNzTy+RJveV2dojp2sq0AGte6lXdTNgtqnjBLKFygoJfZ2WoGe00C4lqygNx+WPSNgXzYUGztkIXiFIloP9K9jSoNFJ08WUpBVJ78U=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by SJ0PR10MB4734.namprd10.prod.outlook.com (2603:10b6:a03:2d2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21; Mon, 12 Jul
 2021 17:07:42 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::a00d:eb40:2bf6:8812]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::a00d:eb40:2bf6:8812%7]) with mapi id 15.20.4308.026; Mon, 12 Jul 2021
 17:07:42 +0000
Subject: Re: [PATCH V5 07/25] machine: memfd-alloc option
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
 <1625678434-240960-8-git-send-email-steven.sistare@oracle.com>
 <CAJ+F1CJFV8G+7sR0BLKODypcMeuV-O2Ox+S-jK0sRiRceevFXw@mail.gmail.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
Message-ID: <5567f7de-b0dc-053e-6000-3b12ac10a480@oracle.com>
Date: Mon, 12 Jul 2021 13:07:37 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CAJ+F1CJFV8G+7sR0BLKODypcMeuV-O2Ox+S-jK0sRiRceevFXw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN4PR0501CA0079.namprd05.prod.outlook.com
 (2603:10b6:803:22::17) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.92] (24.62.106.7) by
 SN4PR0501CA0079.namprd05.prod.outlook.com (2603:10b6:803:22::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.11 via Frontend
 Transport; Mon, 12 Jul 2021 17:07:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2546580a-8a7d-4b5a-3ff6-08d945578f46
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4734:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4734CEAE2D52CCE82F5339AFF9159@SJ0PR10MB4734.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:192;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TdCwPJGS/Wlm3ggVRRTG3p+HtpgDNLpMfNj7r0g0zLR7RWuyHZYCHRNgzvn/LhCl450jPGLOaZ4S01FjIgNSfNgsdboJ83ge1X6JR4c33O2q8TL+kiwyMDUYDf5Q1soNC6qHaTA24iTAvQt4KOgz0PkGlzaKwmDT2ZrFeCEYr7xzltwENJgxrDti6Rh0yEONjaR+izJjVjKu7iHhOmxmB/eEBWTDSVLR9cAX0ZspCdzKCRM5w9fyVfI7aEEq36HTzdl/HAqcoqIGHHEveZDYfpL0kZpmFTBC7ShlUJJKeipoTtJwNLQX469veKGByEaR67naAupLsGxNTV/5gZi+MY2Jl2kDlBjWsDAfuXUfRHJ7/94U3CZ4FBWm9yLF6kEc17iVSUG9YxSToS2Cqpv6U5pIaBjaPh6Cxu6q8PoMMl+//cLnO+Lo87i13zou3pfWolHMQyJfGpK3iSzJ88TvEiU3vzjE2srzAEAQypyeSKkU6iy8vGKYchwMk6RrpI3nkTI6CFh//iq1R3M/VyO6ovZWNUbETFaAqZ4zNi7pUSKQ2thfopS5OmPXpi5MRbBiZ5fP5KYJxkjER3gzfQ30y4MhGpdyMmMDnyTaRX/D640a0UIGgS2eW0vdTbXmhGu1l1nVY3MI/tghfDMJES/TLr7HiFM67+y7HFUrbzPiogvm/Rt6iCiRzsfKO1Ycm/2UcGSNF62Ackg5OdwbPLpOohi6XZGH5YuQlKkjCkp9dMQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(376002)(396003)(136003)(366004)(346002)(38100700002)(6486002)(8936002)(36756003)(36916002)(44832011)(31696002)(8676002)(4326008)(186003)(83380400001)(6916009)(5660300002)(7416002)(31686004)(86362001)(956004)(2616005)(316002)(478600001)(54906003)(26005)(2906002)(16576012)(66556008)(66476007)(53546011)(6666004)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXNrbGhyZ2ZYcElFVkRJa1NwQy9scWZOY2MvTFgvNm5IQ25vVGk4ZkMwZ0Zv?=
 =?utf-8?B?NWxMNEVzVThkV3B1OVh5NnBoWjJxa1B4R2VuOWNCUXgvdzdWY2N0ck5YSHh4?=
 =?utf-8?B?R1cyczZMbHA3eHFDQ0NPejQ2d0pTRDVWdmRZWjRyQXpYSjlXZzN0b0x3am9N?=
 =?utf-8?B?VTF0WkptRU4zdGNJRjU3S1dVRTlJRTFMbVI2WW4wSU92SVdOOVlvOTdLSERZ?=
 =?utf-8?B?UVZJZFFwKzRYZ1JEVjVGWUdJN21GU2tBek9zdXRHY090L1g1MDdrZHVOKzdX?=
 =?utf-8?B?M0hRY2RWQXVhdC8xcTZodW1Ud1crbVVkdm9yU1RrZXJXQWFBZk9tZUZNcVhI?=
 =?utf-8?B?aFRUaSt3NkEwNmNOdGw4aHFkNEJrcHVOS0k0a0xYUXFFN203cG9KRUxJNFhD?=
 =?utf-8?B?a1FsTEkzeHllVjZZM3VOeXZIR3RvNUtTUlJqQUhRR1h1elhzZW5TaTNpSFZj?=
 =?utf-8?B?UVIrNEk3UHY2cGU3Mi9zTkxKNnNkSmtJbGVaNkdGdk5jMjlTL3hVZzkyQzc4?=
 =?utf-8?B?azVTa0pvMGUwbzFMTWxVZjZleS9tWXE0ZjloODJzMmZybjRyWlcxQzJWaDRt?=
 =?utf-8?B?YTd6MlFnZk90aEVmQmhjbzlDQUxJYWM4UkE5R0hGMHg1M0VXZkhrQU16bytS?=
 =?utf-8?B?MGRSVXdEckdHY01MVW9LblJQK2p4MUNFVVVMZWdKV1E5MFpDblRSZ0Q1eC8x?=
 =?utf-8?B?OUpUbXM5YTRJallDWVhIVjArcWo1b0pZRTBFV3NxOWJDYzF4RlhXQjZKZ2o1?=
 =?utf-8?B?UTJFbDM5aTYxdHM5aVF4eGtGeTdycWx2bmJiUC9ONnl2ZS8xRmI2WnlKczho?=
 =?utf-8?B?aU92MHBrL2xzYjBzazNIM21uYXB4YnBqNVVXYjVyM3Rpb0ZnVWRFcXdwNkhh?=
 =?utf-8?B?clFyWmx0eVpaZFoxaVlvbWxnMVkxeXYwS3dXek0rMWtEWHhGdjYvdHFIUTRB?=
 =?utf-8?B?YWZkL1BtMzUxY3JTamEzWU1QVVlQQXpqR1lkYThlSzJLQXA1K0JnaG1lNkpI?=
 =?utf-8?B?KzNueUJBSUQxSFpGVkN3Qy9WOXl5YnRYU1hUNjk4R255Mlh1MlREcFhvbllw?=
 =?utf-8?B?YndPL09wL0EvTmRod0ZDVGRHb3oyQkRsMEh5bVhSZy9HOTRPZnZxSU05a0g2?=
 =?utf-8?B?V1lqTWZSWHhUU29RRFFieWw2blJHSUUyQjVPdmtIeDRQbkdCSGg5ZWFVWGJp?=
 =?utf-8?B?N1B1NEtUYWJSc1M0SjZoTWo5WDFPeWhoM2JjeUJnYUFPNTk1WDdiS3pOdlZ0?=
 =?utf-8?B?RVNWSGptNk5vekJ4dDRrSlUxZytHOGxvN1dlZ0hOcjRmYkF2MG9DeGd5M1E2?=
 =?utf-8?B?VzNRWS9tNXN3aWZrSzdsVFlVQW9DSFRrWEpPQTg2d3AyRGlOWE4rY01ITGJo?=
 =?utf-8?B?RmRpOXNUUE5KQmNpc1JCZnRoaTA4L0llVGlKS3VoUXB1NnFiU3EwcDZTeUlR?=
 =?utf-8?B?R1Q2OSsvaldrenVMa2VMRDNSWFF4SG5GMDB3amRlTEpXdS8wMkZ3aHhNWmRh?=
 =?utf-8?B?dmRrV1hnaDVLQ202emZFbHN1cDYzQmE2RytZV3B2Tk03ZjYrR3VZMFdGQzlp?=
 =?utf-8?B?VkdOdTMyQWdXZlNvNXZPNWlWWTBOV3V4WEp1RlZOV0paZDZQanVFMFRqMlRp?=
 =?utf-8?B?YUw1bklZUlZ3ZHVJS0w0UDRDbUtLM21OSlpCWEFXa3FZV1Ztck1Kbks1SlBx?=
 =?utf-8?B?eG1TYmFCSm9WTGFOSVhyK2kzWG5tQVoyakFSOEQvL3NKVENiYWhJQmsydjdU?=
 =?utf-8?Q?C7OCtuKFe5mCiUf0wFXSiaq7V0du5BM31nKrOJJ?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2546580a-8a7d-4b5a-3ff6-08d945578f46
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2021 17:07:41.9072 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UWhVc4h3Qbfy9mX0zqkw3Zbep1AFfkSp2/Jvrqx9E7DUYQ5KQ6+SbGwKM4kNArsSLEwfQSEhJHo9r1lYJshF0VlgYoxVKVhtWLW3qhGSny0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4734
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10043
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107120126
X-Proofpoint-GUID: sXvbYf-SrhaaUtcCTwz6j0CiIM9CE2U2
X-Proofpoint-ORIG-GUID: sXvbYf-SrhaaUtcCTwz6j0CiIM9CE2U2
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.479, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/8/2021 10:20 AM, Marc-André Lureau wrote:
> Hi
> 
> On Wed, Jul 7, 2021 at 9:39 PM Steve Sistare <steven.sistare@oracle.com <mailto:steven.sistare@oracle.com>> wrote:
> 
>     Allocate anonymous memory using memfd_create if the memfd-alloc machine
>     option is set.
> 
> 
> Nice, I'd suggest you send this patch separately. (we had discussions about an option like this several times)

I would like to keep it with this series to make sure it meets our needs as the patches are
reviewed and evolve.  We can always push it solo later if the series stalls.

>     Signed-off-by: Steve Sistare <steven.sistare@oracle.com <mailto:steven.sistare@oracle.com>>
>     ---
>      hw/core/machine.c   | 19 +++++++++++++++++++
>      include/hw/boards.h |  1 +
>      qemu-options.hx     |  5 +++++
>      softmmu/physmem.c   | 42 +++++++++++++++++++++++++++++++++---------
>      trace-events        |  1 +
>      util/qemu-config.c  |  4 ++++
>      6 files changed, 63 insertions(+), 9 deletions(-)
> 
>     diff --git a/hw/core/machine.c b/hw/core/machine.c
>     index 57c18f9..f0656a8 100644
>     --- a/hw/core/machine.c
>     +++ b/hw/core/machine.c
>     @@ -383,6 +383,20 @@ static void machine_set_mem_merge(Object *obj, bool value, Error **errp)
>          ms->mem_merge = value;
>      }
> 
>     +static bool machine_get_memfd_alloc(Object *obj, Error **errp)
>     +{
>     +    MachineState *ms = MACHINE(obj);
>     +
>     +    return ms->memfd_alloc;
>     +}
>     +
>     +static void machine_set_memfd_alloc(Object *obj, bool value, Error **errp)
>     +{
>     +    MachineState *ms = MACHINE(obj);
>     +
>     +    ms->memfd_alloc = value;
>     +}
>     +
>      static bool machine_get_usb(Object *obj, Error **errp)
>      {
>          MachineState *ms = MACHINE(obj);
>     @@ -917,6 +931,11 @@ static void machine_class_init(ObjectClass *oc, void *data)
>          object_class_property_set_description(oc, "mem-merge",
>              "Enable/disable memory merge support");
> 
>     +    object_class_property_add_bool(oc, "memfd-alloc",
>     +        machine_get_memfd_alloc, machine_set_memfd_alloc);
>     +    object_class_property_set_description(oc, "memfd-alloc",
>     +        "Enable/disable allocating anonymous memory using memfd_create");
>     +
>          object_class_property_add_bool(oc, "usb",
>              machine_get_usb, machine_set_usb);
>          object_class_property_set_description(oc, "usb",
>     diff --git a/include/hw/boards.h b/include/hw/boards.h
>     index accd6ef..299e1ca 100644
>     --- a/include/hw/boards.h
>     +++ b/include/hw/boards.h
>     @@ -305,6 +305,7 @@ struct MachineState {
>          char *dt_compatible;
>          bool dump_guest_core;
>          bool mem_merge;
>     +    bool memfd_alloc;
>          bool usb;
>          bool usb_disabled;
>          char *firmware;
>     diff --git a/qemu-options.hx b/qemu-options.hx
>     index 8965dab..fa53734 100644
>     --- a/qemu-options.hx
>     +++ b/qemu-options.hx
>     @@ -30,6 +30,7 @@ DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
>          "                vmport=on|off|auto controls emulation of vmport (default: auto)\n"
>          "                dump-guest-core=on|off include guest memory in a core dump (default=on)\n"
>          "                mem-merge=on|off controls memory merge support (default: on)\n"
>     +    "                memfd-alloc=on|off controls allocating anonymous memory using memfd_create (default: off)\n"
>          "                aes-key-wrap=on|off controls support for AES key wrapping (default=on)\n"
>          "                dea-key-wrap=on|off controls support for DEA key wrapping (default=on)\n"
>          "                suppress-vmdesc=on|off disables self-describing migration (default=off)\n"
>     @@ -76,6 +77,10 @@ SRST
>              supported by the host, de-duplicates identical memory pages
>              among VMs instances (enabled by default).
> 
>     +    ``memfd-alloc=on|off``
>     +        Enables or disables allocation of anonymous memory using memfd_create.
>     +        (disabled by default).
>     +
>          ``aes-key-wrap=on|off``
>              Enables or disables AES key wrapping support on s390-ccw hosts.
>              This feature controls whether AES wrapping keys will be created
>     diff --git a/softmmu/physmem.c b/softmmu/physmem.c
>     index 9b171c9..b149250 100644
>     --- a/softmmu/physmem.c
>     +++ b/softmmu/physmem.c
>     @@ -64,6 +64,7 @@
> 
>      #include "qemu/pmem.h"
> 
>     +#include "qemu/memfd.h"
>      #include "migration/vmstate.h"
> 
>      #include "qemu/range.h"
>     @@ -1960,35 +1961,58 @@ static void ram_block_add(RAMBlock *new_block, Error **errp)
>          const bool shared = qemu_ram_is_shared(new_block);
>          RAMBlock *block;
>          RAMBlock *last_block = NULL;
>     +    struct MemoryRegion *mr = new_block->mr;
>          ram_addr_t old_ram_size, new_ram_size;
>          Error *err = NULL;
>     +    const char *name;
>     +    void *addr = 0;
>     +    size_t maxlen;
>     +    MachineState *ms = MACHINE(qdev_get_machine());
> 
>          old_ram_size = last_ram_page();
> 
>          qemu_mutex_lock_ramlist();
>     -    new_block->offset = find_ram_offset(new_block->max_length);
>     +    maxlen = new_block->max_length;
>     +    new_block->offset = find_ram_offset(maxlen);
> 
>          if (!new_block->host) {
>              if (xen_enabled()) {
>     -            xen_ram_alloc(new_block->offset, new_block->max_length,
>     -                          new_block->mr, &err);
>     +            xen_ram_alloc(new_block->offset, maxlen, new_block->mr, &err);
>                  if (err) {
>                      error_propagate(errp, err);
>                      qemu_mutex_unlock_ramlist();
>                      return;
>                  }
>              } else {
>     -            new_block->host = qemu_anon_ram_alloc(new_block->max_length,
>     -                                                  &new_block->mr->align,
>     -                                                  shared, noreserve);
>     -            if (!new_block->host) {
>     +            name = memory_region_name(new_block->mr);
>     +            if (ms->memfd_alloc) {
>     +                int mfd = -1;          /* placeholder until next patch */
>     +                mr->align = QEMU_VMALLOC_ALIGN;
>     +                if (mfd < 0) {
>     +                    mfd = qemu_memfd_create(name, maxlen + mr->align,
>     +                                            0, 0, 0, &err);
>     +                    if (mfd < 0) {
>     +                        return;
>     +                    }
>     +                }
>     +                new_block->flags |= RAM_SHARED;
> 
> 
> I wonder if ram_backend_memory_alloc() shouldn't be updated to reflect that the memory backend is "share" = true. 

It already does this:
  ram_flags = backend->share ? RAM_SHARED : 0;
Did you have something else in mind?

> And I would say so in the doc as well.

Will do.

- Steve

>     +                addr = file_ram_alloc(new_block, maxlen, mfd,
>     +                                      false, false, 0, errp);
>     +                trace_anon_memfd_alloc(name, maxlen, addr, mfd);
>     +            } else {
>     +                addr = qemu_anon_ram_alloc(maxlen, &mr->align,
>     +                                           shared, noreserve);
>     +            }
>     +
>     +            if (!addr) {
>                      error_setg_errno(errp, errno,
>                                       "cannot set up guest memory '%s'",
>     -                                 memory_region_name(new_block->mr));
>     +                                 name);
>                      qemu_mutex_unlock_ramlist();
>                      return;
>                  }
>     -            memory_try_enable_merging(new_block->host, new_block->max_length);
>     +            memory_try_enable_merging(addr, maxlen);
>     +            new_block->host = addr;
>              }
>          }
> 
>     diff --git a/trace-events b/trace-events
>     index 765fe25..6dbcd0e 100644
>     --- a/trace-events
>     +++ b/trace-events
>     @@ -40,6 +40,7 @@ ram_block_discard_range(const char *rbname, void *hva, size_t length, bool need_
>      # accel/tcg/cputlb.c
>      memory_notdirty_write_access(uint64_t vaddr, uint64_t ram_addr, unsigned size) "0x%" PRIx64 " ram_addr 0x%" PRIx64 " size %u"
>      memory_notdirty_set_dirty(uint64_t vaddr) "0x%" PRIx64
>     +anon_memfd_alloc(const char *name, size_t size, void *ptr, int fd) "%s size %zu ptr %p fd %d"
> 
>      # gdbstub.c
>      gdbstub_op_start(const char *device) "Starting gdbstub using device %s"
>     diff --git a/util/qemu-config.c b/util/qemu-config.c
>     index 84ee6dc..6162b4d 100644
>     --- a/util/qemu-config.c
>     +++ b/util/qemu-config.c
>     @@ -207,6 +207,10 @@ static QemuOptsList machine_opts = {
>                  .type = QEMU_OPT_BOOL,
>                  .help = "enable/disable memory merge support",
>              },{
>     +            .name = "memfd-alloc",
>     +            .type = QEMU_OPT_BOOL,
>     +            .help = "enable/disable memfd_create for anonymous memory",
>     +        },{
>                  .name = "usb",
>                  .type = QEMU_OPT_BOOL,
>                  .help = "Set on/off to enable/disable usb",
>     -- 
>     1.8.3.1
> 
> 
> 
> 
> -- 
> Marc-André Lureau

