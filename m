Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F303B4822
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 19:20:56 +0200 (CEST)
Received: from localhost ([::1]:39276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwpVf-0007NS-7b
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 13:20:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1lwpUC-0006hd-6k
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 13:19:24 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:33782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1lwpU8-0008TA-HI
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 13:19:23 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15PHHiMU026954; Fri, 25 Jun 2021 17:19:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=rJZ0pzUEpril1A1ERWg7N7YnbzIDPva6ntYQt29RBRQ=;
 b=aXMxwxugfmjt5C2NLMuzZWeg4s1tA2Egrooqb0vAg0ihF8CJ4eo+4wKfEIi0xfJQark6
 LuKv1fXTZv/NTADvAWh3ftopqgKctdr1UO+AMZ9Gxfhzj9wfZM89GVoL4S7zdkLUB3UC
 r9kqM2QkTuDIqbiu92SnClhgXe3VJX7fwMiVuwY8+K1zUOio1qK4yoLuhYPW6YXTNpBZ
 Rv4R4tYm9CshRtOXOYSUf5pWISC5zTPlosy/V8GvFRl0gzNG9x9ZL15HzrTNrUO5aQ2p
 coRE6zpT+1rNA5rsqoPqQWqrimZNQLKufyA/IVoMuQHv7QGXJbXbVtCRJANw7fZRWLGq kg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 39d24m1w6w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Jun 2021 17:19:16 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15PHFPnY104468;
 Fri, 25 Jun 2021 17:19:15 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2102.outbound.protection.outlook.com [104.47.70.102])
 by userp3030.oracle.com with ESMTP id 39d23ydjve-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Jun 2021 17:19:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TzyjaA+CO6r/2N283kb0Zcn6hYTLORqjbN6sN7Ny1KrvKN0QxOXpA5vjQYJ0ziexreAZRmE3rKnfMl4SJtPxhYIa+TH1jvE6TTLLH8+Rl33g6Q7cps4MXNuVeCUP5yCMMCwMQkMewKAMkhO8acs9oBmBmjOOM8gzW5w+Am+g652t5mjX89GOc/EeeHRoAyipo6gOg9aYm64wY9Yyw6H6arqk9eOWAzzN7bzHtydWnrvADO8SPh1xhCtKsnErZVa4G4E6AyXzdy7IP9C08dZmCHkzn91m4l3U0E2eb7JxW4iOLtkecnXBRyu1Uk+BnuYI7OUOO/1SSBRv5Z1E0ghN/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rJZ0pzUEpril1A1ERWg7N7YnbzIDPva6ntYQt29RBRQ=;
 b=GP5jZ8TcKMUL4pizJlnYaIBfPKaPF6r4Su1XPehbPOq4j644P5J8lwY5ySi3GwpZbXCKAMFbZEezRm+YehIL1uoXkSCbhCJyLQ49sjujvVwoI7EZRsrah7S/kObLrK/XLYNaP0R/5zP9zjp0+JU0tP467rSc6rhHGHvL1IR6DLNnaaWYAWKod6txzNcMAx8S6GMOZTVxCjY/4b47LKqqxWogkvh4PquRbJ/ldKH2rpjTmeuKKD7qdsgULm7ckrvRmoRzDzqLJAQ2oYc1CKyxqI3/qgb25GrdZ9gxlQG6v7iD0v2OBmvSoBmHZ6o/t3USGZeD7X9pD0u45CZ+SPpb/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rJZ0pzUEpril1A1ERWg7N7YnbzIDPva6ntYQt29RBRQ=;
 b=Xk2Pvj4Lwa0+vjFRedYOiPevFB7MRXAJ/J5AsIbcalXeqUKKpJf8s0xCFDBPKNS6uzM7ZNxPhQFRX4iIBVuEszqe0sZz2BNiHOPUP+JTIGdFKWOpm4s8yjxzBrErfvN3EWs+TMDn7JF9og3nGsph+we/djCf5hp5bKl20fcrKbc=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by BLAPR10MB5379.namprd10.prod.outlook.com (2603:10b6:208:325::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Fri, 25 Jun
 2021 17:19:12 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::d875:3dd7:c053:6582]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::d875:3dd7:c053:6582%5]) with mapi id 15.20.4264.023; Fri, 25 Jun 2021
 17:19:12 +0000
Subject: Re: [PATCH RFC 4/6] i386/pc: Keep PCI 64-bit hole within usable IOVA
 space
To: Laszlo Ersek <lersek@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <20210622154905.30858-1-joao.m.martins@oracle.com>
 <20210622154905.30858-5-joao.m.martins@oracle.com>
 <20210623143031.1dd7faa1@redhat.com>
 <e0fa96c9-34e1-1ce7-b3fa-f82b75219b06@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
Message-ID: <7ab722f1-6765-4af5-2e23-36d972767894@oracle.com>
Date: Fri, 25 Jun 2021 18:19:05 +0100
In-Reply-To: <e0fa96c9-34e1-1ce7-b3fa-f82b75219b06@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [94.61.1.144]
X-ClientProxiedBy: LO4P123CA0412.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::21) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.67] (94.61.1.144) by
 LO4P123CA0412.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:189::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Fri, 25 Jun 2021 17:19:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d576c16-0a3c-4ee1-af60-08d937fd59db
X-MS-TrafficTypeDiagnostic: BLAPR10MB5379:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BLAPR10MB537977B5C7397255E8518476BB069@BLAPR10MB5379.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YUZdrnCFPY5jrrUT00zX9A980vMDoq2vKiObXKWUh4lD73L/T//ILHFXzKbT6t56KjqaPr7Fs2+C1QGEvgkc/Rcu66nfFe+fQPLboHP77TAVsSyP4ROdNLTg2FnHcrhmujSLksZIiW0nedMcsFrlKv3dnpIPEyt3b40f52MDxLclaSansWZR1J501Bpx3kxyWG+mKRdhhqvKRBbRVQkOmjcl8zWKM5vuu8PsQvY25qWb1A8hFjw6N1x6Q3/xCcuWuucwA+92G3JuuGi6ktaPpvNatmT9P15c6HuiHeMfwiuEmUYlXl7ItsThSV/U0uYVh5HCC44n9OcPLCTt/cybC+shg6ZFm7Bbl0QtogPVUEzrLEwfB5do6172R65GfdN1o8CZWewTlLxEydz7H/P3gkxAbwbOKxxxxDtef+R//YDVAe9Fj4y8gDABsBbAT6r4v5Hh4vI12e68B4Dg7+lk46Djnf/gB4RbZp5ONmb6uQBn9DMuGRx0J2wirQkcHQ8/bQGwH/KQ0K1PaS9QMz8QN++GDb//RHAx50vGAvkjoU0DXpz3IlZj2SEgQB9sc0+J8YQ3ofmKvhpabuxZBs+7XBdMj/Lwc1poC4jY0eaknpmrk5dqM7S+bH06T2RsqE2mPU1WImxx+JNVa1VAXP38laZTcwwz8/ZjXruulytWCWEndOaOFYmuIaA1lzB7nw+8DYaAqHa9djA/0Ez7Wl/ZwZpBjWB2QIGpgyit1lkE7a0qryZ6xuXPw9Z6UgshYwnbj2mB4axqDvI6EkJHTEReLw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(366004)(376002)(346002)(136003)(396003)(2906002)(8936002)(16526019)(53546011)(186003)(31696002)(316002)(86362001)(26005)(16576012)(54906003)(83380400001)(478600001)(7416002)(110136005)(66946007)(5660300002)(4326008)(6666004)(36756003)(31686004)(38100700002)(66476007)(66556008)(6486002)(956004)(2616005)(8676002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NThKajlkK2ROQVVTeGNFQWFNU0t0LzB1amsxWEZYSjUrQVhaaitoRHpOTHh4?=
 =?utf-8?B?QW5tdzZ0ZFJSTWtBNFNhdndtdGxJT2xoQ29sbjdKTjNJdEN4MU5oY0Y3UzBx?=
 =?utf-8?B?WElUYzhITmJLdFlXa1g4eHJoa3JvSFdWN2gwTG9PdEwzcVRwMFZnSjh6Ukkw?=
 =?utf-8?B?TVpsL1BxYlZpalllZ3o3TVV3WG5KUmR0Tkx4WFJGV3pGK2RLVU1IaTFGNzNE?=
 =?utf-8?B?YVJ3Zzh6bnFYUEVKWWxScEhac3BYNHNBSVhjK3p2SjR0UDd4SGhTeE4xQWZU?=
 =?utf-8?B?bUxkQUNsOWM0M25YWmpFNmlBc3kzbUdEN1JHenB4aFhxalhOcGV5b0NtQVB6?=
 =?utf-8?B?RHBENEtFNk5RdkViUi84YkIxQVo2S0NveGE1bVVhUzBhSm40Z3BiVFZnVGZQ?=
 =?utf-8?B?bWMwckZmazl1cU9kZU1ZT1RQdWZ1SWFBOXNZdUFjM2ZyNXBZdEtYSFFJa0Zz?=
 =?utf-8?B?a05UV0VSaVdoR1d6ZFNSeXBvVVhpWlhGc3A3NUdhaURZL3pnRWpEdC91V0xI?=
 =?utf-8?B?dTYxaUJmNUpQSmN3QzlKMGFOTHVsb2w5a09Oamp6VnhOcGs5N3BQR0hESjRu?=
 =?utf-8?B?OEFXeWpmVWlydnppYnFvejliWHV3d3VNakpFOFJFblhqeGhwUHNrM0lERERF?=
 =?utf-8?B?Vlp0VXEwOGpycFMvWHlOREttWFJYMzZ3N1l1UUMzYlJWQlJ6dTdXbVhRTTZw?=
 =?utf-8?B?NFhxUWo3Rk1yaDQ5REFsUXVGOHRwa3NjRUNJeGp2aTl0cDh4eFpRWTQ3NEEr?=
 =?utf-8?B?Y3VEOVc1MXN3Y1orL2dyZWtKeXhDcDBqZmtlWmJUSEdmS2dyUTFyMHQvQm1E?=
 =?utf-8?B?YXlINzBLL2lpZkU0akprK3lhdEhMT1hDMWx6bjl5MkpxSFF3MDBmZm0xY3E1?=
 =?utf-8?B?Skw3c2prUU14cTNCZ3p1ODRQdWhMRkNIN1lpbDBsNlRzV3pFMlozR3JPVzdi?=
 =?utf-8?B?QzhUSS9KV3pwRDY2YWQwWW1PTVA3UjBsNG54QnZsRVlRZENnaURlN1RQMGpu?=
 =?utf-8?B?cU40RmpONmJCNjBVTXlPU2pYMytyaGp4M0xuTGFuUW9EbHd5RWZUUzdSYmlv?=
 =?utf-8?B?a2loanRBZzgxUDQrNTd4eWxoMmsvSVZxMFZwN1dYZzA1RkpXUERRWFpmOUVp?=
 =?utf-8?B?OHhnVkVLYU5LZjdIZEFIRzBEMG5VUm40K1lmamttdWpiV1RoZVA2Z1ZhOXJh?=
 =?utf-8?B?UFArYW52QTdFRU5DeVg1OXdROWpFTmI4UzlyWStPUSsvU2ZHbE4vamxmdG1s?=
 =?utf-8?B?NVFXWDcwTkF6WTZGaHlwSHFqUXFaSkRLZTYvbXhET1lFb0l0S2p4WHY1SElY?=
 =?utf-8?B?NEVXWmdGVGx2TnpiVHhrSlBrUm9mVlJ3U28zV252QXdHcU1KaGc4alFHd3Vv?=
 =?utf-8?B?TzBFSmZ3YytSaitlTXBzU0dWaTVnMlZJS3ZOTzU0bW81Q1VPeUpGUWdQa0tm?=
 =?utf-8?B?dThvU2h2VnBCdFFLRTdxeUJkMW5pdjlSMXVXZUcvZzArdHE5SXVnODVnTHdr?=
 =?utf-8?B?UmZKeWJaS0VpaG1VQ05vYmpwQnUwUTEwUExSS2hBRmFaSUhDb2RHZkpTQTNZ?=
 =?utf-8?B?SnRBTUZyRk1HNXdtRGZnSU9zY243RHBiazIzU2pvSWhxdm9IZkdtdVpRdngy?=
 =?utf-8?B?MDBqN2tlb2ZjbGxOQnI3UU9ua2JNV2VWMGZ2Y2tXOHdOL1BYL3dVaU0xbk0v?=
 =?utf-8?B?dDNNK0tYeVNQeEhvdlZsMTNQTjVXUS9tVm8xR1lKVWlUYW5JMnZxL1JqR2dl?=
 =?utf-8?Q?7iRb+6L7s2ZArZB4abe80FvVww1FneEzOvuXU0B?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d576c16-0a3c-4ee1-af60-08d937fd59db
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 17:19:12.5032 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LgMuxl7W5L35tM8o4XgWb2iHwpnLTEh+AW5zOZ3PBxzxCRlzt5e6CzJUmYmxsooOyclsuqzqT72usXjdmlua3jzl1g3LjrzpB/CzSRQSLjI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5379
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10026
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106250103
X-Proofpoint-ORIG-GUID: YdWxYCzaKHtAGL0GqGGFHIZ9hz3Es0Zb
X-Proofpoint-GUID: YdWxYCzaKHtAGL0GqGGFHIZ9hz3Es0Zb
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Marcel Apfelbaum <marcel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 6/23/21 5:33 PM, Laszlo Ersek wrote:
> Adding Marcel and Dave.
> 
> Adding Alex (seriously, a vfio- / iommu-related patch set without Alex on CC?)
> 
> comments below
> 
> On 06/23/21 14:30, Igor Mammedov wrote:
>> On Tue, 22 Jun 2021 16:49:03 +0100
>> Joao Martins <joao.m.martins@oracle.com> wrote:
>>
>>> pci_memory initialized by q35 and i440fx is set to a range
>>> of 0 .. UINT64_MAX, and as a consequence when ACPI and pci-host
>>> pick the hole64_start it does not account for allowed IOVA ranges.
>>>
>>> Rather than blindly returning, round up the hole64_start
>>> value to the allowable IOVA range, such that it accounts for
>>> the 1Tb hole *on AMD*. On Intel it returns the input value
>>> for hole64 start.
>>
>> wouldn't that work only in case where guest firmware hadn't
>> mapped any PCI bars above 4Gb (possibly in not allowed region).
>>
>> Looking at Seabios, it uses reserved_memory_end as the start
>> of PCI64 window. Not sure about OVMF,
>>  CCing Laszlo.
> 
> (thanks for the CC)
> 
> Yes, see "OvmfPkg/PlatformPei/MemDetect.c":
> 
>   //
>   // The "etc/reserved-memory-end" fw_cfg file, when present, contains an
>   // absolute, exclusive end address for the memory hotplug area. This area
>   // starts right at the end of the memory above 4GB. The 64-bit PCI host
>   // aperture must be placed above it.
>   //
>   Status = QemuFwCfgFindFile ("etc/reserved-memory-end", &FwCfgItem,
>              &FwCfgSize);
> 
> 
'etc/reserved-memory-end' is *I think* advertised correctly after this series (taking into
consideration the HT range).

Except when memory is sufficiently small that it doesn't need to deal with the HT hole.
Which could well lead firmware to not know the said hole that it should avoid (with big
enough aperture). Maybe I should advertise this nonetheless considering this sits below
the default phys-bits/maxphysaddr of 1Tb.

>>
>>> Suggested-by: David Edmondson <david.edmondson@oracle.com>
>>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
>>> ---
>>>  hw/i386/pc.c         | 17 +++++++++++++++--
>>>  hw/pci-host/i440fx.c |  4 +++-
>>>  hw/pci-host/q35.c    |  4 +++-
>>>  include/hw/i386/pc.h |  3 ++-
>>>  4 files changed, 23 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>>> index 2e2ea82a4661..65885cc16037 100644
>>> --- a/hw/i386/pc.c
>>> +++ b/hw/i386/pc.c
>>> @@ -1141,7 +1141,7 @@ void pc_memory_init(PCMachineState *pcms,
>>>   * The 64bit pci hole starts after "above 4G RAM" and
>>>   * potentially the space reserved for memory hotplug.
>>>   */
>>> -uint64_t pc_pci_hole64_start(void)
>>> +uint64_t pc_pci_hole64_start(uint64_t size)
>>>  {
>>>      PCMachineState *pcms = PC_MACHINE(qdev_get_machine());
>>>      PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>>> @@ -1155,12 +1155,25 @@ uint64_t pc_pci_hole64_start(void)
>>>              hole64_start += memory_region_size(&ms->device_memory->mr);
>>>          }
>>>      } else {
>>> -        hole64_start = 0x100000000ULL + x86ms->above_4g_mem_size;
>>> +        if (!x86ms->above_1t_mem_size) {
>>> +            hole64_start = 0x100000000ULL + x86ms->above_4g_mem_size;
>>> +        } else {
>>> +            hole64_start = x86ms->above_1t_maxram_start;
>>> +        }
>>>      }
>>
>>> +    hole64_start = allowed_round_up(hole64_start, size);
>>
>> I'm not sure but, might it cause problems if there were BARs placed
>> by firmware in region below rounded up value?
>> (i.e. ACPI description which uses PCI_HOST_PROP_PCI_HOLE_START property
>> won't match whatever firmware programmed due to rounding pushing hole
>> start up)
> 
> This code is a hornets' nest. Marcel and MST too surely remember the troubles between it and OVMF from the past years.
> 
Thanks for the explanation below, appreciate it.

> The firmware assigns BARs, then distinctly later, the firmware temporarily reenables MMIO decoding for all PCI devices, and fetches the ACPI tables blob via fw_cfg. At that point, the ACPI content is re-generated by QEMU, which (due to all PCI devices having MMIO decoding enabled) involves computing "bounding boxes" over the programmed BARs (32-bit and 64-bit). Said "bounding boxes" are exposed in the _CRS. If the bounding boxes exposed in the _CRS are shrunk after the BAR assignment by the firmware, the guest OS will almost certainly reject at least some pre-existent BAR assignments by the firmware, by virtue of them falling outside of the _CRS windows.
> 
I think I am doing that here? That is limiting the said bounding boxes.

At least with this OVMF doesn't seem to be doing the wrong thing. when looking at the
configured bars.

> If you want to keep the 64-bit PCI MMIO *aperture* restricted to a particular area, then you need to steer the guest firmware to allocate the BARs from that area in the first place.
> 
Hmmm, why isn't E820_RESERVED entries enough? That is exposed here.

You already look at E820 RAM entries, but so far we assume that the reserved always comes
at the end, or via that fw_cfg entry.

> In OVMF, we have an experimental fw_cfg knob for controlling the *size* of the aperture. Search the above-referenced OVMF source file for the string "opt/ovmf/X-PciMmio64Mb".
> 
> Regarding the *base* of the aperture, its calculation in OVMF is already non-trivial; please refer to the GetFirstNonAddress() function in the same file. I'm not sure what you're trying to do, but you might need another piece of guest enlightenment (fw_cfg?) for steering OVMF to place the base at a higher address (if that's what you want to do). If you can recognize the AMD IOMMU limitation in the guest without explicit paravirt stuff, then migrating part of the logic to OVMF could be easier (not that I look forward to reviewing related firmware patches, TBH).
> 
> The topic overlaps with the vCPU physical address width problem, for which QEMU guests cannot trust the otherwise appropriate CPUID leaf. Refer to the following upstream TianoCore BZ for details: <https://bugzilla.tianocore.org/show_bug.cgi?id=2796>.
> 
> Hmmmmm. How about this workaround. Might be worth a shot. The 64-bit PCI MMIO aperture in OVMF is "naturally aligned":
> 
>   //
>   // The 64-bit PCI host aperture should also be "naturally" aligned. The
>   // alignment is determined by rounding the size of the aperture down to the
>   // next smaller or equal power of two. That is, align the aperture by the
>   // largest BAR size that can fit into it.
>   //
>   Pci64Base = ALIGN_VALUE (Pci64Base, GetPowerOfTwo64 (Pci64Size));
> 
> This means that, if you specify a huge enough count of megabytes for the *size*, for example 1TB in total:
> 
>   -fw_cfg opt/ovmf/X-PciMmio64Mb,string=$((1024*1024))
> 
> then you'll also end up with a high-enough *base* (1 TB). From the blurb, I reckon that should work, without any patches at all for QEMU?
> 
Yeah, albeit like you said it feels like a workaround. Firmware should either parse
'properly' what's reserved, or machine model should provide a representative memory map
that lets guest/firmware know that it should avoid that said range (either
implicit/explictly).

> (OVMF currently allows a 16 TB aperture size via the above knob:
> 
>   //
>   // See if the user specified the number of megabytes for the 64-bit PCI host
>   // aperture. Accept an aperture size up to 16TB.
>   //
> )
> 
> Thanks
> Laszlo
> 
> 
Thanks!
>>
>>>      return ROUND_UP(hole64_start, 1 * GiB);
>>>  }
>>>  
>>> +uint64_t pc_pci_hole64_start_aligned(uint64_t start, uint64_t size)
>>> +{
>>> +    if (nb_iova_ranges == DEFAULT_NR_USABLE_IOVAS) {
>>> +        return start;
>>> +    }
>>> +    return allowed_round_up(start, size);
>>> +}
>>> +
>>>  DeviceState *pc_vga_init(ISABus *isa_bus, PCIBus *pci_bus)
>>>  {
>>>      DeviceState *dev = NULL;
>>> diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
>>> index 28c9bae89944..e8eaebfe1034 100644
>>> --- a/hw/pci-host/i440fx.c
>>> +++ b/hw/pci-host/i440fx.c
>>> @@ -163,8 +163,10 @@ static uint64_t i440fx_pcihost_get_pci_hole64_start_value(Object *obj)
>>>      pci_bus_get_w64_range(h->bus, &w64);
>>>      value = range_is_empty(&w64) ? 0 : range_lob(&w64);
>>>      if (!value && s->pci_hole64_fix) {
>>> -        value = pc_pci_hole64_start();
>>> +        value = pc_pci_hole64_start(s->pci_hole64_size);
>>>      }
>>> +    /* This returns @value when not on AMD */
>>> +    value = pc_pci_hole64_start_aligned(value, s->pci_hole64_size);
>>>      return value;
>>>  }
>>>  
>>> diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
>>> index 2eb729dff585..d556eb965ddb 100644
>>> --- a/hw/pci-host/q35.c
>>> +++ b/hw/pci-host/q35.c
>>> @@ -126,8 +126,10 @@ static uint64_t q35_host_get_pci_hole64_start_value(Object *obj)
>>>      pci_bus_get_w64_range(h->bus, &w64);
>>>      value = range_is_empty(&w64) ? 0 : range_lob(&w64);
>>>      if (!value && s->pci_hole64_fix) {
>>> -        value = pc_pci_hole64_start();
>>> +        value = pc_pci_hole64_start(s->mch.pci_hole64_size);
>>>      }
>>> +    /* This returns @value when not on AMD */
>>> +    value = pc_pci_hole64_start_aligned(value, s->mch.pci_hole64_size);
>>>      return value;
>>>  }
>>>  
>>> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
>>> index 73b8e2900c72..b924aef3a218 100644
>>> --- a/include/hw/i386/pc.h
>>> +++ b/include/hw/i386/pc.h
>>> @@ -217,7 +217,8 @@ void pc_memory_init(PCMachineState *pcms,
>>>                      MemoryRegion *system_memory,
>>>                      MemoryRegion *rom_memory,
>>>                      MemoryRegion **ram_memory);
>>> -uint64_t pc_pci_hole64_start(void);
>>> +uint64_t pc_pci_hole64_start(uint64_t size);
>>> +uint64_t pc_pci_hole64_start_aligned(uint64_t value, uint64_t size);
>>>  DeviceState *pc_vga_init(ISABus *isa_bus, PCIBus *pci_bus);
>>>  void pc_basic_device_init(struct PCMachineState *pcms,
>>>                            ISABus *isa_bus, qemu_irq *gsi,
>>
> 

