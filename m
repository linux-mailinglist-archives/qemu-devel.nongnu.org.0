Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 962333C61B0
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 19:13:26 +0200 (CEST)
Received: from localhost ([::1]:46010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2zUj-00023J-L2
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 13:13:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m2zP5-0000N3-5E
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 13:07:35 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:28438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m2zP2-0005oS-Vl
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 13:07:34 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16CGv7SP003719; Mon, 12 Jul 2021 17:07:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=OeKDxFgq4dY0OjQJEeIIWxgl0IHDYEN16/yyCW+iZyg=;
 b=IdZXFhzGV8yiCCrczv6p/GDy5ESMDTi7AO9xXSFCvmUWeBoIP0ooTYU5eKQzgPClFuy1
 aJa9GA7LZf+eCfa8lXnwhLL3MniQaf/4FFqQamMOrPg8u4g1nl/gGyjuTwctAfBF2UZF
 Z9tDezM39611Ps2ZpVxvMBgmJZR/JfORZjhbU8mqTTI/Gvxbfx2nUwE6FsGZbXqai9yQ
 C6tnmAWA2tC6/p3uGCVzQdDBDRGYFkECAwiv/GwA3TVB9ZGndq7ITTMtaptf5ytl5IfM
 86PWBZDqEh7Gsgc8os6ezo34l6frhAiKgNQcYJLB7CTvKCcQw/CDgjBLinq9UfzGAW7k Uw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 39rqkb0cyn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 17:07:28 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16CGt4SF186654;
 Mon, 12 Jul 2021 17:07:27 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2046.outbound.protection.outlook.com [104.47.56.46])
 by aserp3030.oracle.com with ESMTP id 39qycs8ys6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 17:07:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RoMg4ybn/ChSdGYrBivFRcdwVL3bm0nWLhxOSBmycjE3+H5Xq8AggB0+xt3VBUAakDNrx/te8+rOyyeOXiqqWP9k8IktH8zKa/zdDpjP0XaEIHbHBoQfnvxDn63NWhjtKvCqyMnZqvnD96oVmmvuNeZVl+56nXDzLxj6CYCUWqISW2KJKuIY+c/Y71C71RcqwmpQI/5SWhlPxyo42Ze54wPDxmkRFWu+OcylSMZWqioW3UPTkcXfcAvewrRdwi31rJ+4f/CWNAQdbdFUZWS5koSTuk4fzE/cDLJ1Y/WxMMETaWpRAF6F69hpgtLnh4kd4HhTASEaTajcGN5bbmB4lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OeKDxFgq4dY0OjQJEeIIWxgl0IHDYEN16/yyCW+iZyg=;
 b=VSYPs6xRoyk7pa5pZwJk2ZnzzltuZc4fiZcL55adu0yeIeSsU9FQSJvL1scSRGtBqo1kh77j0XwU34cXhQI8354UjJhCTzPqA+Ri8N3FF5JUimAOT0BnFS1NR0pT7kn0VX7D7YJWS7Z+qA3Sw6FwsSZPl8WUtdhuuYN+L5wFB+KPuYex3jrShzqczCuRPqrRe09IQ95jo7xdJpWxemA8c2SmAZ1fuJ8e+zmMXqk0ZKWTYF1paMZp/fh65XoFJDgT4YoYrWiC0/5WxuVfLmvqIuDT6Ij5lYo9RFE5j2QCmZtPv0MPfdtaK6kklyGpZmLKmEeWFLM4WS1BR5I5UC2VqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OeKDxFgq4dY0OjQJEeIIWxgl0IHDYEN16/yyCW+iZyg=;
 b=gDmZ83Ai5tkcZjBmbViekq8BHh0vuTEIOPK3lSfjcxk7iAkmsVQo+gfuuYRvRN3ZEDFjhmv+3dgeaAf4LOeE7rsjuDiKWhzrTpEYOKab+0fVaDlyAqvz8M4j8OgM3B54iBne+UvWAYdK3gwBaf6DWDgGh9wv9GO7t9T2yUkKlj4=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by SJ0PR10MB4734.namprd10.prod.outlook.com (2603:10b6:a03:2d2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21; Mon, 12 Jul
 2021 17:07:25 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::a00d:eb40:2bf6:8812]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::a00d:eb40:2bf6:8812%7]) with mapi id 15.20.4308.026; Mon, 12 Jul 2021
 17:07:25 +0000
Subject: Re: [PATCH V5 03/25] cpr: QMP interfaces for reboot
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
 <1625678434-240960-4-git-send-email-steven.sistare@oracle.com>
 <CAJ+F1CJ6pa1nVu5BgskV3xG+j9wWRroC-=ChmmCKg6Q=ofA2SA@mail.gmail.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
Message-ID: <b8b94898-ca5a-a1a1-25d8-1e575df96aff@oracle.com>
Date: Mon, 12 Jul 2021 13:07:20 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CAJ+F1CJ6pa1nVu5BgskV3xG+j9wWRroC-=ChmmCKg6Q=ofA2SA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR13CA0051.namprd13.prod.outlook.com
 (2603:10b6:806:22::26) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.92] (24.62.106.7) by
 SA9PR13CA0051.namprd13.prod.outlook.com (2603:10b6:806:22::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.12 via Frontend Transport; Mon, 12 Jul 2021 17:07:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ac20250-2805-4de8-ffb1-08d94557854b
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4734:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB47344129499D118663AEEB44F9159@SJ0PR10MB4734.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DraIqRjmOPpWXq6CcRurEdQvm3B/UpJi2FQAwi71K/g7K1dCb3irj0JVnsJp1waOw6lhrt2hQXydxUngBilLeqRXsvyFNJmwRannHMdvG1fRewFoQJ5M0h4oWLw624YdV1V03Hbt7acEClN6vUhwn8QS3iD93yaukUUsph93PjHJ0ePf5z4BVx54FU8DYWLI1i5UIrkkOKBO/1gJhddLm9hw06IRwvgOomgBprTfOhqWMccoR5KHpLMPev7fZKzeWWt89I1Cito4Ar98/nPyoOjTwhlR9pbG26xFK8zLGPD0U2ZdVuBaneiiajQAhTTYtGRagxsLzVWoNRJDRqocd2BYssvNTqrCh+Ui/ScClp0EwzEDFHlgnTHB8kQJo3xc3ZgIvKSJKxD/jDU987zbOvOIaWFQJCwPPy2C6cvuDNVxzZFaA7PtAuH2K/xOxBfGmmZjFfpVBt9XI7HvhEZqX1v9wIwkEcpDbSCJNePFOVfOEvboY+1b7SCuBaKcnQJs+IJmi/l3TO0hclNgjMfLPhSYlfLX0h3FFZ6SoKGy9Wc7l0YP6QKKCNZIHItBYXtDSw5vCksKeAmZ18V7uUswNZzFdcrGcqFRncV22fHmE/kT2Mq2CTxk5BVfMzDnWLt7SDZyj6w/P4m8n9dcVcyOMYHUsJygI4ZfnlnH1II+biISY6U53eXnILJMCpiOK1rMis+QGblc/vaii/lkaEkvjZPFDphzC9BkjT9T5IlndR4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(376002)(396003)(136003)(366004)(346002)(38100700002)(6486002)(8936002)(36756003)(36916002)(44832011)(31696002)(8676002)(4326008)(186003)(83380400001)(6916009)(5660300002)(7416002)(31686004)(86362001)(956004)(2616005)(316002)(478600001)(54906003)(26005)(2906002)(16576012)(66556008)(66476007)(53546011)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1d0b1JNMlhWQjFvWWpXeGRkZGppRWNyeDVBdnlkT3pSVmVBRG1aWXk4UzlR?=
 =?utf-8?B?NmhPdElpd1p4YmxEaUZ0RGNsOHJIaUtoUGFGRXYvZU9hZi96MXc1ZXBndWJn?=
 =?utf-8?B?WWpCSWdIZlE0cjFsQlRpY08xSG9mNWRVeGVNeVluVklnTmhQTXY5K0liaDJh?=
 =?utf-8?B?UHk4VWdiNHpnaVg1cHY0azRNY0FZc3hCNHJCUlhGR2o2M3UzMWE2S1UrVU13?=
 =?utf-8?B?Y3BwMGU0WUkzMWpiS3NMTXFJV3FyUTZQdExxSzJ2eGVqTVZNYU5PczNXVGIw?=
 =?utf-8?B?dHUzT3A5S0I4bXFPRmR5R1B4VHpSRDBUU0Fzc0pWZGloN3FKTXZBTEl1WEdK?=
 =?utf-8?B?bldnVi93NHdMUzdJaEg0OUt3VHYwYWVlQVl6bVprNC9wZzk5SHhSM3ZPTDEy?=
 =?utf-8?B?QmVrVUszdHBCREV0eGZOeVYzVUhlOVRiUEp6RUU4R2Izek9OMjZsR0psU0Yv?=
 =?utf-8?B?SXorT2daTGJuNWtYb013ZUhkR01mc0dMdHRvanpvcm1CTGNXbFRCOEg2NnBZ?=
 =?utf-8?B?SW9uWDNIU0w5dkZlcVRmMXhjUzc1T25TK2U5Q0RET2ZXcUM4bVdpOXNETVhh?=
 =?utf-8?B?UTVBakFWTUl1SmpHajZqU2NkbmpTNjNSczJlMnNZMHNNVWl3eng5MDFtZjdQ?=
 =?utf-8?B?K1NUSlQyWG9jTVFTOUFCa25tVWlndk51MkxsbS9KbzFIcW4vWDVxMHNxTGw5?=
 =?utf-8?B?OWpJYXZVWnVnNlk4OVBGNElNQUpXTWVmMHZsVkpKRFRKa2d2Q2NPRHliNG02?=
 =?utf-8?B?bk1meHk2Q2dOQ2RJTmk5ai94OVVRZ2JITGl3TThrbGl4UjhoWi9tbFYxZnNz?=
 =?utf-8?B?SW8rYkk1clE1S05ueU1iaXFCdEVuNExhQzZISU5LcFViWGRtclRjamVoQ2tD?=
 =?utf-8?B?TEQzb0ZrSUpsSWFIcGVuc2JERWQ5anpBQVNEWVlKTkpsRllkbDVXaWxaUVZh?=
 =?utf-8?B?WUxjeTlxM0NqWmNOTTdHVUZad0ZrT3V4ZXJIdExSVmZMcTdBQ3EyaUhvbmI4?=
 =?utf-8?B?V1hYMThMMnJDVzkzSmRUdG5QK1BlWnNVZEU2dHZNWGxQbGUwRGN3VlhmWEhq?=
 =?utf-8?B?OGt1b1pzbUJPN2JZQnA1NjZ0bGpyRElIMG5idkNQOXlPZHVQQWhWWmFhS1NY?=
 =?utf-8?B?blVScnRnaldDYVhPbnNKcHV2WTVVWnNqRjIxbUFGUzNNVjViYjBVRmtGQUhx?=
 =?utf-8?B?YTBOblJMcEJXSTN3b2E1c1UxN2x1bjNkaTl3THQwYjNndC9lM2hReHIyV1Ey?=
 =?utf-8?B?aWgrbHlyQVlSSDdJZk15ZVJkQ2w2QUJwb1Zsa1pMdlFQU29Ub0QzMEhCR2Uv?=
 =?utf-8?B?dnJTWlBjRXJtdFhmUEEyU1J3VWxlQVU1dVl1RmJENXllMi9rc3ZYeHRReFBC?=
 =?utf-8?B?cU9Ga3Z5OVQwa0dlbmZoM1N4cndoNEdITm0zVnZmV25ES0pYcCtraklVdXJL?=
 =?utf-8?B?ZWJGTjN3TGdDL2xlRUZUL1NxR0t4a3JScWhubXRhL1d1TWtNMi9YL0hIM1l1?=
 =?utf-8?B?RmVqU0JWeXJxYnFkZVVveFhxcnhudFczM20wSGR6bk1wbnlidnFhOEhWcG9Y?=
 =?utf-8?B?QzVMbHRlb2gyODIycFJYNjBNZWJqTCtUaFJJUmovT25mYUtZZzIwRGtSakVR?=
 =?utf-8?B?bUpoSVdGTHhLWm1WNjJNcFFlUisyUWVPVko1T0tOUk1rVUU0Mzl3Q201UmV1?=
 =?utf-8?B?VEtNRU9HbUJCbXlzVnVhcEIvNVF2Vkg4NkhXU0VOVklIeXZFMFQ4UUwvUk5n?=
 =?utf-8?Q?A1Pl8Z2kI32kF7u+4vqaLheH23X7ljiKLoDj737?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ac20250-2805-4de8-ffb1-08d94557854b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2021 17:07:25.1736 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 27ag9TNAVIz0J10P9f0958WzI7iKtyiNsAaNT0tANAJfQBRzdItroAyB4Jbsh9smJ2Q8j2JhWfkNB4bx19Olw6KiWmSP7Se0pFt4+v2EeEo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4734
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10043
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=999
 adultscore=0 malwarescore=0 bulkscore=0 mlxscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107120126
X-Proofpoint-ORIG-GUID: sW72zoZyp0NdjjZRMUnb_PYVeII-8Cs_
X-Proofpoint-GUID: sW72zoZyp0NdjjZRMUnb_PYVeII-8Cs_
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

Will do for all.  Good idea on schema introspection. - steve

On 7/8/2021 9:27 AM, Marc-André Lureau wrote:
> Hi
> 
> On Wed, Jul 7, 2021 at 9:28 PM Steve Sistare <steven.sistare@oracle.com <mailto:steven.sistare@oracle.com>> wrote:
> 
>     cprsave calls cprsave().  Syntax:
>       { 'enum': 'CprMode', 'data': [ 'reboot' ] }
>       { 'command': 'cprsave', 'data': { 'file': 'str', 'mode': 'CprMode' } }
> 
>     cprload calls cprload().  Syntax:
>       { 'command': 'cprload', 'data': { 'file': 'str' } }
> 
>     cprinfo returns a list of supported modes.  Syntax:
>       { 'struct': 'CprInfo', 'data': { 'modes': [ 'CprMode' ] } }
>       { 'command': 'cprinfo', 'returns': 'CprInfo' }
> 
> 
> It may not be necessary, we may instead rely on query-qmp-schema introspection.
> 
> 
>     Signed-off-by: Mark Kanda <mark.kanda@oracle.com <mailto:mark.kanda@oracle.com>>
>     Signed-off-by: Steve Sistare <steven.sistare@oracle.com <mailto:steven.sistare@oracle.com>>
>     ---
>      MAINTAINERS           |  1 +
>      monitor/qmp-cmds.c    | 31 +++++++++++++++++++++
>      qapi/cpr.json         | 74 +++++++++++++++++++++++++++++++++++++++++++++++++++
>      qapi/meson.build      |  1 +
>      qapi/qapi-schema.json |  1 +
>      5 files changed, 108 insertions(+)
>      create mode 100644 qapi/cpr.json
> 
>     diff --git a/MAINTAINERS b/MAINTAINERS
>     index c3573aa..c48dd37 100644
>     --- a/MAINTAINERS
>     +++ b/MAINTAINERS
>     @@ -2864,6 +2864,7 @@ M: Mark Kanda <mark.kanda@oracle.com <mailto:mark.kanda@oracle.com>>
>      S: Maintained
>      F: include/migration/cpr.h
>      F: migration/cpr.c
>     +F: qapi/cpr.json
> 
>      Record/replay
>      M: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru <mailto:pavel.dovgaluk@ispras.ru>>
>     diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
>     index f7d64a6..1128604 100644
>     --- a/monitor/qmp-cmds.c
>     +++ b/monitor/qmp-cmds.c
>     @@ -37,9 +37,11 @@
>      #include "qapi/qapi-commands-machine.h"
>      #include "qapi/qapi-commands-misc.h"
>      #include "qapi/qapi-commands-ui.h"
>     +#include "qapi/qapi-commands-cpr.h"
>      #include "qapi/qmp/qerror.h"
>      #include "hw/mem/memory-device.h"
>      #include "hw/acpi/acpi_dev_interface.h"
>     +#include "migration/cpr.h"
> 
>      NameInfo *qmp_query_name(Error **errp)
>      {
>     @@ -153,6 +155,35 @@ void qmp_cont(Error **errp)
>          }
>      }
> 
>     +CprInfo *qmp_cprinfo(Error **errp)
>     +{
>     +    CprInfo *cprinfo;
>     +    CprModeList *mode, *mode_list = NULL;
>     +    CprMode i;
>     +
>     +    cprinfo = g_malloc0(sizeof(*cprinfo));
>     +
>     +    for (i = 0; i < CPR_MODE__MAX; i++) {
>     +        mode = g_malloc0(sizeof(*mode));
>     +        mode->value = i;
>     +        mode->next = mode_list;
>     +        mode_list = mode;
>     +    }
>     +
>     +    cprinfo->modes = mode_list;
>     +    return cprinfo;
>     +}
>     +
>     +void qmp_cprsave(const char *file, CprMode mode, Error **errp)
>     +{
>     +    cprsave(file, mode, errp);
>     +}
>     +
>     +void qmp_cprload(const char *file, Error **errp)
>     +{
>     +    cprload(file, errp);
>     +}
>     +
>      void qmp_system_wakeup(Error **errp)
>      {
>          if (!qemu_wakeup_suspend_enabled()) {
>     diff --git a/qapi/cpr.json b/qapi/cpr.json
>     new file mode 100644
>     index 0000000..b6fdc89
>     --- /dev/null
>     +++ b/qapi/cpr.json
>     @@ -0,0 +1,74 @@
>     +# -*- Mode: Python -*-
>     +#
>     +# Copyright (c) 2021 Oracle and/or its affiliates.
>     +#
>     +# This work is licensed under the terms of the GNU GPL, version 2.
>     +# See the COPYING file in the top-level directory.
>     +
>     +##
>     +# = CPR
> 
> 
> Please spell it out in the doc at least (it's not obvious, I had to search for the meaning in list archives ;).
> 
>     +##
>     +
>     +{ 'include': 'common.json' }
>     +
>     +##
>     +# @CprMode:
>     +#
>     +# @reboot: checkpoint can be cprload'ed after a host kexec reboot.
>     +#
>     +# Since: 6.1
>     +##
>     +{ 'enum': 'CprMode',
>     +  'data': [ 'reboot' ] }
>     +
>     +
>     +##
>     +# @CprInfo:
>     +#
>     +# @modes: @CprMode list
>     +#
>     +# Since: 6.1
>     +##
>     +{ 'struct': 'CprInfo',
>     +  'data': { 'modes': [ 'CprMode' ] } }
>     +
>     +##
>     +# @cprinfo:
>     +#
>     +# Returns the modes supported by @cprsave.
>     +#
>     +# Returns: @CprInfo
>     +#
>     +# Since: 6.1
>     +#
>     +##
>     +{ 'command': 'cprinfo',
>     +  'returns': 'CprInfo' }
>     +
>     +##
>     +# @cprsave:
>     +#
>     +# Create a checkpoint of the virtual machine device state in @file.
>     +# Guest RAM and guest block device blocks are not saved.
>     +#
> 
> 
> It would be worth highlighting the differences with snapshot-save/load.
> 
> I guess it would make sense to consider this as an extension/variant to those commands.
>  
> 
>     +# @file: name of checkpoint file
>     +# @mode: @CprMode mode
>     +#
>     +# Since: 6.1
>     +##
>     +{ 'command': 'cprsave',
>     +  'data': { 'file': 'str',
>     +            'mode': 'CprMode' } }
>     +
>     +##
>     +# @cprload:
>     +#
>     +# Start virtual machine from checkpoint file that was created earlier using
>     +# the cprsave command.
>     +#
>     +# @file: name of checkpoint file
>     +#
>     +# Since: 6.1
>     +##
>     +{ 'command': 'cprload',
>     +  'data': { 'file': 'str' } }
>     diff --git a/qapi/meson.build b/qapi/meson.build
>     index 376f4ce..7e7c48a 100644
>     --- a/qapi/meson.build
>     +++ b/qapi/meson.build
>     @@ -26,6 +26,7 @@ qapi_all_modules = [
>        'common',
>        'compat',
>        'control',
>     +  'cpr',
>        'crypto',
>        'dump',
>        'error',
>     diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
>     index 4912b97..001d790 100644
>     --- a/qapi/qapi-schema.json
>     +++ b/qapi/qapi-schema.json
>     @@ -77,6 +77,7 @@
>      { 'include': 'ui.json' }
>      { 'include': 'authz.json' }
>      { 'include': 'migration.json' }
>     +{ 'include': 'cpr.json' }
>      { 'include': 'transaction.json' }
>      { 'include': 'trace.json' }
>      { 'include': 'compat.json' }
>     -- 
>     1.8.3.1
> 
> 
> 
> 
> -- 
> Marc-André Lureau

