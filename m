Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA1A3C63B1
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 21:25:00 +0200 (CEST)
Received: from localhost ([::1]:59020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m31Y3-000135-W6
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 15:25:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m31Tg-0004Sc-To
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 15:20:30 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:5698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m31Te-0003h7-1e
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 15:20:28 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16CJJAwV004235; Mon, 12 Jul 2021 19:20:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=Bqf39mWqX5SQqqri1jUx6KOlJ3arDNHMI7cPtDYLAYY=;
 b=SMziRYqxAeXdVI81Ephi9s3wzaPquANN6lqJ1GMf/A3D/PgbSnV4wetkmwTuhQzQiSUc
 FW3kIt8nXXOLQi30jmo2ISFwEVATaNGOWtEXMo76vjtniQF/D5NIEpEzrzm72hs6H5E/
 WyH8YBE3eX8MIS7IFS1XfpbsuNzp45OKfEW+XsBsWJTXo/cgzByJAkTHB0XMs6QVOuzl
 jHZC1CMjVM/+ysd76E5jXAkaVlkxSlc9qje0MnVSLuGtqsCzfWmm6zC1r3SSEXlZUZZs
 v5iw7g6bYIHnUcp8XPc591AeQpIdFMrORuw/UB822HJCaivEAZ9K4jy8ulkssmhX13+d Zg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39rpxr8s8d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 19:20:23 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16CJEiBk083932;
 Mon, 12 Jul 2021 19:20:22 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
 by aserp3020.oracle.com with ESMTP id 39q3c89pgw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 19:20:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A7da7RQIBdOCdb3fHnLokBOHDeRqwsiH+0gNDatxntWKFF1JAOkbd/k47D7qfDEXqQ3Uk194z4w3LgeT4GfEwTtRUdU4hXmHIWB8soViMbJaGnWCf+qlqC6EZSkUJq/veKvLqnHZJhpS4VFycJ8HZHw8IDuc9LEROTbY8reO0hmzfqCc+ChKs8tRelDqBWQnKi97BLGZtLbIooFFxrkRQBdfB1ll+/h6qjLMF+jwY5fZL0ko6k5Iwr794dQv7HdB+43RgTuoi/0rvXxW7i7RCFrnsXDMVTV+gZLstqIcm6dgq0EenDOO3lqSNhL5aR5Fzwm5Z6yn8qI68+y8qy51Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bqf39mWqX5SQqqri1jUx6KOlJ3arDNHMI7cPtDYLAYY=;
 b=ogLY7WRc6FipyJUFhBh5zpO15MhiwcjApOi/ZEWlcVEMW5Nns0qihySBjDPRMQz1LDQNmSFxudrsINTnQNPtkJL687k4hll0hhy3p/rAxAVF63kYrrePN6597smhGxQkMjQEp+Gy3B1HTOgXsqNXEZJ5dUf851pTNHGkulS4HpnrLll19tuqmRYCXD3weBAasXGucqrgKwxJRTZpz8IKx0YqtBmySBy/aJ5RlCjcxi5r1UEDzhNPJKD/0P02xSIFFPVU6CY+bpu9OAuMOxtW5BuXcg/z9Vg5yXn7TKzSSUcKuJg2MkLZykcQAwHqJvelfPhmILxNZgnhO2pErZNkEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bqf39mWqX5SQqqri1jUx6KOlJ3arDNHMI7cPtDYLAYY=;
 b=nbB3P/HjKlnOiANW7Yzt2Fle+UDdGsP2C34VgHpCQaMhyiYx+ooqrOdCmw/6CM+rRScFqGmXTmboZiInjPH9z2ecEVnv/tWnjC4XMBykIskKhc8yemv6SSylKKGlo/P5kAcqTT28yok3vN23bfF8lrUfhMiCOKjzjHYSeE3T6Ko=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB3128.namprd10.prod.outlook.com (2603:10b6:a03:14e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Mon, 12 Jul
 2021 19:20:10 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::a00d:eb40:2bf6:8812]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::a00d:eb40:2bf6:8812%7]) with mapi id 15.20.4308.026; Mon, 12 Jul 2021
 19:20:10 +0000
Subject: Re: [PATCH V5 20/25] chardev: cpr framework
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
 <1625678434-240960-21-git-send-email-steven.sistare@oracle.com>
 <CAJ+F1CKewOW60x281gNM_8mfsygGL5jK7GOJba0MPmHgR3nk1Q@mail.gmail.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
Message-ID: <7e07ac54-e6dd-4554-1e2b-c51b12239fd2@oracle.com>
Date: Mon, 12 Jul 2021 15:20:06 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CAJ+F1CKewOW60x281gNM_8mfsygGL5jK7GOJba0MPmHgR3nk1Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR06CA0026.namprd06.prod.outlook.com
 (2603:10b6:208:23d::31) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.92] (24.62.106.7) by
 MN2PR06CA0026.namprd06.prod.outlook.com (2603:10b6:208:23d::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend
 Transport; Mon, 12 Jul 2021 19:20:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32f290bc-f029-4bce-d03c-08d9456a10f9
X-MS-TrafficTypeDiagnostic: BYAPR10MB3128:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB31283CCE48899028BD035CD4F9159@BYAPR10MB3128.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:655;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hiHMyy9H5A+oGUDF6wPmAPjrx+ZNZFvs1HAzl/q20t4DnZviXFi2Gzt9qQXVK3ThxTtaGMNT9FqWb76QwhLNldrsKsf+ZyO0wFjF0BdZ+zeUw+jBhDleMfglY7B19UEBqQA2QntEQA9iMUTaIQi7DYzIoRsazQK6PUYDwRiAQ/0wFfEu65HTsrqV98L65V9YWjV2i7434K/bQccYxst428PlSXKix9KYiVHz6zfrisWdTnqBQFuSVeVeKwFtIxauYfP2pCn+s02S37INjPluQImcdMSNFK/F58wimrqVzyRLhlZETQqsSxCyPfjXkhcQt0f6mM9EF0wIhok43W3j7erMVQAZP0/UXBEHJkeQIMlV9yuBZem6T9mcJGkLJ6HPgTtP5YNaAB5pb2hLSoNeYRD5ICLoUmZZ+lngAPpL/IWnSxSZEjiy968UfDgSuxc46K2s5ti/3ZR7YQiR5jCYycBkXnnNdB+w+tAFu8tU/i6pRygHItyBNfz6M5Xiaj2Skt6MHrK/Dl8oKBSezOijjmJBwPIBhkwNrU7eQTc/SGs9sGqcDPoSD3GYNRSvMgv0YP0vePNUjvHHVSWKTYNEt1tYBbg+m/eGSCi2KwwSKVQ7ObHrScl51N5X7+HLCXwEjsHhD38DgL6pd12RZeLYRkTSJr+red6GL8+NeJkyva/E1RuIcMDaTMg8tpe2116YXpYp+GTKv0t4RCuoGPzpaQOWdb2r4/Rdls6akPxpOZs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(376002)(39860400002)(396003)(346002)(366004)(478600001)(2906002)(66476007)(5660300002)(66556008)(36916002)(26005)(8936002)(6486002)(8676002)(53546011)(66946007)(83380400001)(7416002)(30864003)(44832011)(6916009)(31696002)(4326008)(36756003)(186003)(86362001)(38100700002)(54906003)(316002)(31686004)(16576012)(2616005)(956004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0tNVVducG5kcElsOVFBWE1sanBzVWxyYUppcU5RUDlGcEdLV0NQZDUrekhW?=
 =?utf-8?B?T2pGSzRudDRxa1pkeEN0a0ZpbnVlQVBMU2FFc1FFbG9jNGFZTldESTVYRjI5?=
 =?utf-8?B?L25neW5vcGN1Y21HRit2b05uSDExOUljbXROVE93YVlRQjVnN1BCQ0NZWCtl?=
 =?utf-8?B?d043ajhrdmhocFFHRzRhdno3NjZZT2xRR0lCc1daZHF6d1VXSzNwOWJXeG95?=
 =?utf-8?B?YXIxUHdTc2p4TzRhT1FnUFFRbVhxZkgzMERxNlJjWVZZTjlkYmJCZy9Lb2w3?=
 =?utf-8?B?VElYQUNQZGV3OEhmOW4rK0tBaWF1TDhjSWlZN0s2N0tQMFhzREJTc2ZiODBI?=
 =?utf-8?B?WStSanUwY2pNNkR3RUVCbisyZUluZ0VLQzRFTEhiQnErMU1jYnNIWlA0T3pY?=
 =?utf-8?B?a3pXN1B0WWJuN0szQVlUL1pIOWRCTDFpN2FNS0NFanJKazNPYy9VZ0NjSWhK?=
 =?utf-8?B?cUhOTjdKekJQOWpsdDZYcjYwZk1vVmFaV0hyU0pHYU8zU2dXSHJ5bmFrWklG?=
 =?utf-8?B?bDlOb3ZQOHdDM2MwQm8yM21CMXhsQkxVdjJHUTBObGY3QnVDNGNtWkRiNGZn?=
 =?utf-8?B?SjVIQktzSW1ybVp0dkV1SjBhNE1tQVpZWVM3cUxMKzNMSVJJNUQrckttenFh?=
 =?utf-8?B?QkY1TXZqNzh1UzRCbC9GK0hIN3gyem9zWC9oRHFlWS9xMER5OXJwMWVkakdz?=
 =?utf-8?B?SHNwNlZlUExoSkFvNXhNNWxDY3Z5UVVVcWJxS01UUWtGeHArOE5XVXlxaUp4?=
 =?utf-8?B?U1FsQUVBelZVSU8rV1A0UmJOckpjYnpJYjlRUTd5eFdGZ3ZvQW1qVFZGRlNP?=
 =?utf-8?B?YXc4eUxXNHJpOVNna2QyTDBSUXhXdG9wOXI0bUk2bE9zUkdlVldzbnBDTnk2?=
 =?utf-8?B?dFNPZHEzblVCV2FFS2RvRVhESHo4Y2puMy9XbDM5ZzFpUFZONEg0dFQzQU95?=
 =?utf-8?B?L3dvbjl0RDNyQ1QwcENqZkNOLy9UNFJhM3NmazJpS0dFTm1PM2VNWWRTbUhw?=
 =?utf-8?B?WlRleHBWb3lTclYwZUVCMHlJdUZWWXVjUzNodFJsamsxMlJJcnI5Tm5zWDhE?=
 =?utf-8?B?emJGSDVnQnNDeTJIdXExd3YxNTlVeVFLTmhTT09YN1lqTTJzZ01sZEVyL2dw?=
 =?utf-8?B?WEdKOG5rdlJ0Q21tb3pObDBlaUZMc3lybGlacnp2aG40bXUvdThGUmt6V0FW?=
 =?utf-8?B?YUNnd1h2TExiZ25PVnBwM0g5YkRwUk1pTDJENjFsZVo4cU9vS2hpK2R2UG4r?=
 =?utf-8?B?cENNTUlLM1VSS09XWE1RZjRrNnVtZEFYbUFhZVhyRDFhQ3BDWUxQbFR5aitv?=
 =?utf-8?B?WFd0cE1Gc1djZTN4SGVvMUFvTUpHd1dqdHQ0dmNZUWxRbFlmVHdIODZzM2Jz?=
 =?utf-8?B?VXNlQ2R5YjZrNEtuZ29nSzhnakdCK0cxTVY1L2lnNlhCbEFGMlNzMGJNcWVB?=
 =?utf-8?B?QlNmQVNSM09vR0xWRnZSTVhPVXpZWEYxOUR0YkwzRlNyZDRwYnlLbDJoVG5H?=
 =?utf-8?B?RE5oUjZxNnlGVG5OcHRVYzhPSlZKWklrYkFrdzdycDJybXdRQyt5Q3hSZm01?=
 =?utf-8?B?eUZjR2ZjT3V6aUxkLzZQYTZ0YWxJMDlpa0hQLzVrdXRrSTR1aStwQ3IyR095?=
 =?utf-8?B?RWtUc09uVkYrRVJ6NWorc3JwUkx0N1h5c3N3VEhDRFBFUmtKOWlRVkV3a3pX?=
 =?utf-8?B?d2hKTEVwZ0xxUXl5NGJINmtKSDcwZE1aQmlZdmRZOWVWQlRSeVdNRWduZS9F?=
 =?utf-8?Q?/htlQuFIJlASSixpdpbl0FWnYG5lDaOKDVWRYHF?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32f290bc-f029-4bce-d03c-08d9456a10f9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2021 19:20:10.4702 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MImaWL/7wNSk6khoN5wJpxBt2JYzOLT1RZDsdojbZ2kin4p7NdoMdjAmeO+odiQ6p95y21DN53/bu1NhTiAVGCATuN3WaL9Xc4yYqJYROrE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3128
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10043
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 mlxscore=0
 suspectscore=0 phishscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107120137
X-Proofpoint-GUID: pJzPbdn0dMOwY8RpDIPwIne6ND4dyEIl
X-Proofpoint-ORIG-GUID: pJzPbdn0dMOwY8RpDIPwIne6ND4dyEIl
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

On 7/8/2021 12:03 PM, Marc-André Lureau wrote:
> Hi
> 
> On Wed, Jul 7, 2021 at 9:37 PM Steve Sistare <steven.sistare@oracle.com <mailto:steven.sistare@oracle.com>> wrote:
> 
>     Add QEMU_CHAR_FEATURE_CPR for devices that support cpr.
>     Add the chardev close_on_cpr option for devices that can be closed on cpr
>     and reopened after exec.
>     cpr is allowed only if either QEMU_CHAR_FEATURE_CPR or close_on_cpr is set
>     for all chardevs in the configuration.
> 
> 
> Why not do the right thing by default?

Char devices with buffering in the qemu process do not support cpr, as there is no general mechanism 
for saving and restoring the buffer and synchronizing that with device operation.  In theory vmstate 
could provide that mechanism, but sync'ing the device with vmstate operations would be non-trivial, 
as every device handles it differently, and I did not tackle it.  However, some very  useful devices 
do not buffer, and do support cpr, so I introduce QEMU_CHAR_FEATURE_CPR to identify them.  CPR support
can be incrementally added to more devices in the future via this mechanism.

> Could use some tests in tests/unit/test-char.c

OK, I'll check it out.  I have deferred adding unit tests until I get more buy in on the patch series.

>     Signed-off-by: Steve Sistare <steven.sistare@oracle.com <mailto:steven.sistare@oracle.com>>
>     ---
>      chardev/char.c         | 41 ++++++++++++++++++++++++++++++++++++++---
>      include/chardev/char.h |  5 +++++
>      migration/cpr.c        |  3 +++
>      qapi/char.json         |  5 ++++-
>      qemu-options.hx        | 26 ++++++++++++++++++++++----
>      5 files changed, 72 insertions(+), 8 deletions(-)
> 
>     diff --git a/chardev/char.c b/chardev/char.c
>     index d959eec..f10fb94 100644
>     --- a/chardev/char.c
>     +++ b/chardev/char.c
>     @@ -36,6 +36,7 @@
>      #include "qemu/help_option.h"
>      #include "qemu/module.h"
>      #include "qemu/option.h"
>     +#include "qemu/env.h"
>      #include "qemu/id.h"
>      #include "qemu/coroutine.h"
>      #include "qemu/yank.h"
>     @@ -239,6 +240,9 @@ static void qemu_char_open(Chardev *chr, ChardevBackend *backend,
>          ChardevClass *cc = CHARDEV_GET_CLASS(chr);
>          /* Any ChardevCommon member would work */
>          ChardevCommon *common = backend ? backend->u.null.data : NULL;
>     +    char fdname[40];
> 
> 
> Please use g_autoptr char *fdname = NULL; & g_strdup_printf()

Will do.  
(the glibc functions are new to me, and my fingers do not automatically type them).

>     +
>     +    chr->close_on_cpr = (common && common->close_on_cpr);
> 
>          if (common && common->has_logfile) {
>              int flags = O_WRONLY | O_CREAT;
>     @@ -248,7 +252,14 @@ static void qemu_char_open(Chardev *chr, ChardevBackend *backend,
>              } else {
>                  flags |= O_TRUNC;
>              }
>     -        chr->logfd = qemu_open_old(common->logfile, flags, 0666);
>     +        snprintf(fdname, sizeof(fdname), "%s_log", chr->label);
>     +        chr->logfd = getenv_fd(fdname);
>     +        if (chr->logfd < 0) {
>     +            chr->logfd = qemu_open_old(common->logfile, flags, 0666);
>     +            if (!chr->close_on_cpr) {
>     +                setenv_fd(fdname, chr->logfd);
>     +            }
>     +        }
>              if (chr->logfd < 0) {
>                  error_setg_errno(errp, errno,
>                                   "Unable to open logfile %s",
>     @@ -300,11 +311,12 @@ static void char_finalize(Object *obj)
>          if (chr->be) {
>              chr->be->chr = NULL;
>          }
>     -    g_free(chr->filename);
>     -    g_free(chr->label);
>          if (chr->logfd != -1) {
>              close(chr->logfd);
>     +        unsetenv_fdv("%s_log", chr->label);
>          }
>     +    g_free(chr->filename);
>     +    g_free(chr->label);
>          qemu_mutex_destroy(&chr->chr_write_lock);
>      }
> 
>     @@ -504,6 +516,8 @@ void qemu_chr_parse_common(QemuOpts *opts, ChardevCommon *backend)
> 
>          backend->has_logappend = true;
>          backend->logappend = qemu_opt_get_bool(opts, "logappend", false);
>     +
>     +    backend->close_on_cpr = qemu_opt_get_bool(opts, "close-on-cpr", false);
> 
> 
> If set to true and the backend doesn't implement the CPR feature, it should raise an error.

Setting to true is the workaround for missing CPR support, so that cpr may still be performed.  
The device will be reopened post exec.  That is not as nice as transparently preserving the device, 
but is nicer than disallowing cpr because some device(s) of many do not support it.

>      }
> 
>      static const ChardevClass *char_get_class(const char *driver, Error **errp)
>     @@ -945,6 +959,9 @@ QemuOptsList qemu_chardev_opts = {
>              },{
>                  .name = "abstract",
>                  .type = QEMU_OPT_BOOL,
>     +        },{
>     +            .name = "close-on-cpr",
>     +            .type = QEMU_OPT_BOOL,
>      #endif
>              },
>              { /* end of list */ }
>     @@ -1212,6 +1229,24 @@ GSource *qemu_chr_timeout_add_ms(Chardev *chr, guint ms,
>          return source;
>      }
> 
>     +static int chr_cpr_capable(Object *obj, void *opaque)
>     +{
>     +    Chardev *chr = (Chardev *)obj;
>     +    Error **errp = opaque;
>     +
>     +    if (qemu_chr_has_feature(chr, QEMU_CHAR_FEATURE_CPR) || chr->close_on_cpr) {
> 
> 
> That'd be easy to misuse. Chardev should always explicitly support CPR feature (even if close_on_cpr is set)

Given my explanation at top, does this make sense now?

- Steve


>     +        return 0;
>     +    }
>     +    error_setg(errp, "error: chardev %s -> %s is not capable of cpr",
>     +               chr->label, chr->filename);
>     +    return 1;
>     +}
>     +
>     +bool qemu_chr_cpr_capable(Error **errp)
>     +{
>     +    return !object_child_foreach(get_chardevs_root(), chr_cpr_capable, errp);
>     +}
>     +
>      void qemu_chr_cleanup(void)
>      {
>          object_unparent(get_chardevs_root());
>     diff --git a/include/chardev/char.h b/include/chardev/char.h
>     index 7c0444f..e488ad1 100644
>     --- a/include/chardev/char.h
>     +++ b/include/chardev/char.h
>     @@ -50,6 +50,8 @@ typedef enum {
>          /* Whether the gcontext can be changed after calling
>           * qemu_chr_be_update_read_handlers() */
>          QEMU_CHAR_FEATURE_GCONTEXT,
>     +    /* Whether the device supports cpr */
>     +    QEMU_CHAR_FEATURE_CPR,
> 
>          QEMU_CHAR_FEATURE_LAST,
>      } ChardevFeature;
>     @@ -67,6 +69,7 @@ struct Chardev {
>          int be_open;
>          /* used to coordinate the chardev-change special-case: */
>          bool handover_yank_instance;
>     +    bool close_on_cpr;
>          GSource *gsource;
>          GMainContext *gcontext;
>          DECLARE_BITMAP(features, QEMU_CHAR_FEATURE_LAST);
>     @@ -291,4 +294,6 @@ void resume_mux_open(void);
>      /* console.c */
>      void qemu_chr_parse_vc(QemuOpts *opts, ChardevBackend *backend, Error **errp);
> 
>     +bool qemu_chr_cpr_capable(Error **errp);
>     +
>      #endif
>     diff --git a/migration/cpr.c b/migration/cpr.c
>     index 6333988..feff97f 100644
>     --- a/migration/cpr.c
>     +++ b/migration/cpr.c
>     @@ -138,6 +138,9 @@ void cprexec(strList *args, Error **errp)
>              error_setg(errp, "cprexec requires cprsave with restart mode");
>              return;
>          }
>     +    if (!qemu_chr_cpr_capable(errp)) {
>     +        return;
>     +    }
>          if (vfio_cprsave(errp)) {
>              return;
>          }
>     diff --git a/qapi/char.json b/qapi/char.json
>     index adf2685..5efaf59 100644
>     --- a/qapi/char.json
>     +++ b/qapi/char.json
>     @@ -204,12 +204,15 @@
>      # @logfile: The name of a logfile to save output
>      # @logappend: true to append instead of truncate
>      #             (default to false to truncate)
>     +# @close-on-cpr: if true, close device's fd on cprsave. defaults to false.
>     +#                since 6.1.
>      #
>      # Since: 2.6
>      ##
>      { 'struct': 'ChardevCommon',
>        'data': { '*logfile': 'str',
>     -            '*logappend': 'bool' } }
>     +            '*logappend': 'bool',
>     +            '*close-on-cpr': 'bool' } }
> 
>      ##
>      # @ChardevFile:
>     diff --git a/qemu-options.hx b/qemu-options.hx
>     index fa53734..d5ff45f 100644
>     --- a/qemu-options.hx
>     +++ b/qemu-options.hx
>     @@ -3134,43 +3134,57 @@ DEFHEADING(Character device options:)
> 
>      DEF("chardev", HAS_ARG, QEMU_OPTION_chardev,
>          "-chardev help\n"
>     -    "-chardev null,id=id[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
>     +    "-chardev null,id=id[,mux=on|off][,logfile=PATH][,logappend=on|off][,close-on-cpr=on|off]\n"
>          "-chardev socket,id=id[,host=host],port=port[,to=to][,ipv4=on|off][,ipv6=on|off][,nodelay=on|off][,reconnect=seconds]\n"
>          "         [,server=on|off][,wait=on|off][,telnet=on|off][,websocket=on|off][,reconnect=seconds][,mux=on|off]\n"
>     -    "         [,logfile=PATH][,logappend=on|off][,tls-creds=ID][,tls-authz=ID] (tcp)\n"
>     +    "         [,logfile=PATH][,logappend=on|off][,tls-creds=ID][,tls-authz=ID][,close-on-cpr=on|off] (tcp)\n"
>          "-chardev socket,id=id,path=path[,server=on|off][,wait=on|off][,telnet=on|off][,websocket=on|off][,reconnect=seconds]\n"
>     -    "         [,mux=on|off][,logfile=PATH][,logappend=on|off][,abstract=on|off][,tight=on|off] (unix)\n"
>     +    "         [,mux=on|off][,logfile=PATH][,logappend=on|off][,abstract=on|off][,tight=on|off][,close-on-cpr=on|off] (unix)\n"
>          "-chardev udp,id=id[,host=host],port=port[,localaddr=localaddr]\n"
>          "         [,localport=localport][,ipv4=on|off][,ipv6=on|off][,mux=on|off]\n"
>     -    "         [,logfile=PATH][,logappend=on|off]\n"
>     +    "         [,logfile=PATH][,logappend=on|off][,close-on-cpr=on|off]\n"
>          "-chardev msmouse,id=id[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
>     +    "         [,close-on-cpr=on|off]\n"
>          "-chardev vc,id=id[[,width=width][,height=height]][[,cols=cols][,rows=rows]]\n"
>          "         [,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
>     +    "         [,close-on-cpr=on|off]\n"
>          "-chardev ringbuf,id=id[,size=size][,logfile=PATH][,logappend=on|off]\n"
>     +    "         [,close-on-cpr=on|off]\n"
>          "-chardev file,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
>     +    "         [,close-on-cpr=on|off]\n"
>          "-chardev pipe,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
>     +    "         [,close-on-cpr=on|off]\n"
>      #ifdef _WIN32
>          "-chardev console,id=id[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
>          "-chardev serial,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
>      #else
>          "-chardev pty,id=id[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
>     +    "         [,close-on-cpr=on|off]\n"
>          "-chardev stdio,id=id[,mux=on|off][,signal=on|off][,logfile=PATH][,logappend=on|off]\n"
>     +    "         [,close-on-cpr=on|off]\n"
>      #endif
>      #ifdef CONFIG_BRLAPI
>          "-chardev braille,id=id[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
>     +    "         [,close-on-cpr=on|off]\n"
>      #endif
>      #if defined(__linux__) || defined(__sun__) || defined(__FreeBSD__) \
>              || defined(__NetBSD__) || defined(__OpenBSD__) || defined(__DragonFly__)
>          "-chardev serial,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
>     +    "         [,close-on-cpr=on|off]\n"
>          "-chardev tty,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
>     +    "         [,close-on-cpr=on|off]\n"
>      #endif
>      #if defined(__linux__) || defined(__FreeBSD__) || defined(__DragonFly__)
>          "-chardev parallel,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
>     +    "         [,close-on-cpr=on|off]\n"
>          "-chardev parport,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
>     +    "         [,close-on-cpr=on|off]\n"
>      #endif
>      #if defined(CONFIG_SPICE)
>          "-chardev spicevmc,id=id,name=name[,debug=debug][,logfile=PATH][,logappend=on|off]\n"
>     +    "         [,close-on-cpr=on|off]\n"
>          "-chardev spiceport,id=id,name=name[,debug=debug][,logfile=PATH][,logappend=on|off]\n"
>     +    "         [,close-on-cpr=on|off]\n"
>      #endif
>          , QEMU_ARCH_ALL
>      )
>     @@ -3245,6 +3259,10 @@ The general form of a character device option is:
>          ``logappend`` option controls whether the log file will be truncated
>          or appended to when opened.
> 
>     +    Every backend supports the ``close-on-cpr`` option.  If on, the
>     +    devices's descriptor is closed during cprsave, and reopened after exec.
>     +    This is useful for devices that do not support cpr.
>     +
>      The available backends are:
> 
>      ``-chardev null,id=id``
>     -- 
>     1.8.3.1
> 
> 
> 
> 
> -- 
> Marc-André Lureau

