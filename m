Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FCA36D183
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 07:12:23 +0200 (CEST)
Received: from localhost ([::1]:57434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbcUo-0007G7-K5
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 01:12:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lbcTQ-0006j0-QZ
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 01:10:56 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:50578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lbcTO-0004op-0c
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 01:10:56 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13S552T3118818;
 Wed, 28 Apr 2021 05:10:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=P3xOvDn092sk+BTgkNuy1X77H2qBcIKTXca7LDx5klU=;
 b=iA76kb9Z/7AfKDv/WTudPAxaUjyiwbsd/edwmoRitP3PKZeL5mx3Tgu2TMWedXAj0Elq
 5dl/+/QPk/Ippvd1rp29OU9Pt1GPYAwiEyDkJzQvAKuwf+b239Vxbaxp4j6VHJtTtCpu
 aic1FnvlMuP5fzmUFw/rTFIZZnKza8XC6H4kwuv/h+BnqQLPbKbDqEKjpAeFXW4/S17x
 CaHEkdKbSy3JTVbqMyLoIbZrfu12jpQFZT/g7+YBypLy1XsAO8eMmDfZ/+Kj26tj/B80
 kfw78W6fZ+VNXR33eCVmiSOAK6fEQSUjclW6CH9XOJsyTfOivO4vfH3/n+/K1bMy8YZV hQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 385afsyh7t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Apr 2021 05:10:49 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13S59n2v071664;
 Wed, 28 Apr 2021 05:10:48 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
 by aserp3020.oracle.com with ESMTP id 384b57tvy7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Apr 2021 05:10:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nl8A8+Im0/RNUpvoveSwblwP/VDTkF7IQuLqoTaIVpeU7/yiT5Q3HlVMODLqENxslKmRdzbtnwr0kByfQeYcienwMNPF/lmVS9SrV3JTz2hNH+rPlOYBeEG2NO6Rc/5som+gMHl88twhOpY+jzDTcia/Ql0CXUpDGvijbRkFlaXSkDwrOjHdDWr/YCvHf8h0gZetvImATJvWp/gJ+tapFGbBTv9CSvVod3CPMCX0IFbMNY/1bdUvYDeIqDwOjgK7Fixr/fWhb0+QQ4Obh1s48NhGEjg9NTOxWAeOoyJWdl9EaWT+XfSGKrN6rkGsLwvfjY7tBYVJ1JFw0Rj4H/M7xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P3xOvDn092sk+BTgkNuy1X77H2qBcIKTXca7LDx5klU=;
 b=NrbdHxX0snINiqcZldW3owQmjfgRXdNy6GQ7Q0ujs/fIGSXLBlKjRh3ptkGyzeNKwAnhI6nM6R/Y9GtLZpv0f7+B4HFgbzUQfF2RUZFIcMxA3sRxBx9glCd9QKZahXkdPzk/yKRz36ba0i56WyC0OJl2VAL5G3Lk9dG6qRN6tMT1UOz2eXbGplGmI38uXc01ZZDzKo0icL2/4oi1bFtSKTT5WwWMHWhJdP5vOdRehNWQ67DqWcG5K9q6+QoDlpCitniJtaa1bU97/TyRvIWlHLtRzCYM2ZYDbX7JdJt/tL5xra5MHfQx2ewd5If/zC7QGMTvDcW8VkO63fp2YDOhmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P3xOvDn092sk+BTgkNuy1X77H2qBcIKTXca7LDx5klU=;
 b=0I1ULglSiGnLQ3EyB++f156hE0EIWg/V4cHPaD60J3lfq+n4a+LvsxBSvEVv9hzb3fafOjw+WSXhQtFdBm7URfrIMy6Dx8+jRfYGUTYZTLO+S+DQqsjNm269yv4LI9eFuiq8+gaYJLW9O9RtoXkX3hsiPWA9PJ9IaXUOdBTf72I=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by SJ0PR10MB4590.namprd10.prod.outlook.com (2603:10b6:a03:2d1::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22; Wed, 28 Apr
 2021 05:10:46 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::44f7:1d8f:cc50:48ad]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::44f7:1d8f:cc50:48ad%6]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 05:10:46 +0000
Subject: Re: [PATCH RFC 0/1] To add HMP interface to dump PCI MSI-X table/PBA
To: Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20210423044713.3403-1-dongli.zhang@oracle.com>
 <25113515-5c1d-c557-d0cc-04bfacecb6ee@redhat.com>
 <8aad1273-5c17-a2d7-46cd-eb149c6c57b8@oracle.com> <YIfRAKDvfZyOWrEL@work-vm>
 <37e7aa41-5c87-3276-67f6-b5bd64dde7ea@redhat.com>
From: Dongli Zhang <dongli.zhang@oracle.com>
Message-ID: <3e4cfcf2-c4b9-028a-4d06-22b1e9a23455@oracle.com>
Date: Tue, 27 Apr 2021 22:10:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <37e7aa41-5c87-3276-67f6-b5bd64dde7ea@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2601:646:c303:6700::d22a]
X-ClientProxiedBy: BY5PR16CA0028.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::41) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2601:646:c303:6700::d22a] (2601:646:c303:6700::d22a) by
 BY5PR16CA0028.namprd16.prod.outlook.com (2603:10b6:a03:1a0::41) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.25 via Frontend
 Transport; Wed, 28 Apr 2021 05:10:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09d8b2e1-c117-4f94-761b-08d90a03fad0
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4590:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4590CBC9C7C0FAF94F31B8C0F0409@SJ0PR10MB4590.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yYRJJr5sA1X4oSzF9zeRwhFv84V+mwR9xPhmME7B75Koo3LMixHahKX+WkhnusZqb6IVP/mNRpmG7vFHfY/pbaGIFoXBIuFTt0JGhT40A4o/J4FzvFnBBQmmTbeqytkQyJsJjT3kKPYXCbIctZX/lP8PT3Q++V5rA5DXG/celPnHUfZ/wbvCfF1IFqkibmqZ2sn9VphhB+lksRY6eP42pxd5sTCf9kCn/BXGsBDY0OTBptKj4/twxnKmXbiXLMVje7jqBfys7/P6xkYNj39kggW/Wm1X2orkFPY9p4Ia5q+AYquBM8HU6kn40Aoq4R8OUbnmHCpiY900RY2px72Ooe9hdczUbGFmp6a1r2ZF05SFrTojRbKBpB/3MlOMlWlAyVfzq59GIX5Iu5eiNXHoZEkJW0qItNth+2rR59/UumrtSA7ftka9hMRkEXPV7Cdjd/GRNJ8Zy5AJmwQ7dYsly6/1mp6kftZGmPhN9bGMvVN5qQ0rrQARpqWOF0XocJoGhm6wwqPkiFsxCv6i41cfzAEwbz4c6ppDTAhUfy/A5+coRoh3mMEtHCjvaIBDuYfS5P65SQk+wIu1o4KZ/ovZmzNnXJJSwOBs0kadyaJNXyXc7Ivi0tosr0HghVB1fDEDmgTuQj6CRb8EhRrAf6SUO0Khtf1wXWBtHj5ExyK5iGRTz8Bs0WeymrFyEbB12+wR9zbNRCaT0isZOHOkoM26iJsz0qXKgszAkwwGFk5pfOBk/Ze7Uta69RtIvRuB8bOnpVx+Cj5p9wrd34Yne9l0mg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(366004)(376002)(396003)(136003)(39860400002)(2616005)(8676002)(38100700002)(66476007)(53546011)(36756003)(966005)(6486002)(31696002)(316002)(110136005)(83380400001)(2906002)(86362001)(186003)(5660300002)(4326008)(8936002)(31686004)(44832011)(478600001)(16526019)(66556008)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bURyOTBwRk4zSjkxcUczZWYvVWIwUGxBV1Qya2M2RXRpS1VBWUVVdWdvdG5H?=
 =?utf-8?B?UnFWa2ZzODZidDNBbll0SHhjY0JRNlBjNzh6RXowanV0OS8wKzdPcVdRc1I0?=
 =?utf-8?B?UkNpNXFqOWlLMkgzdUVVelNaeHVMT29aTjNoNTUxc2Z6cFYrZEltTHkrUUs1?=
 =?utf-8?B?RktCQWFWazJna3hlTHNZVm1jSmU5M2p5ay9CZ0ZwRlFSbktpYTVMa1l1Q0d3?=
 =?utf-8?B?RENiaEJ4K24xcmJzYUVWOHgyUDlvdG9IdzJUanJKL2RtSVY1YUpYU0pSWVdp?=
 =?utf-8?B?b1NjM2xkNW9jdzgvdkN0d1JqcU43ZlJEQmFGL3pFVzNLTUZWR3p1N3F4UThU?=
 =?utf-8?B?MkZJYjRzb1dHWU55ck1SV0NrRU83NXYrZEdwaitFUERrSE9JVmd3NmtyQ2o2?=
 =?utf-8?B?dEo0UHd3bk5GUit0U3NhcXRFUGtJV1ZaV2RoTlZaUlF2NTZwWEtyM0xJQk5o?=
 =?utf-8?B?Z0lhNUFPQXdRY1ZrQXd3bmtnaVRMVVJPakkyaStIZGRCNGszNTI1WHQxMGw4?=
 =?utf-8?B?d0ZDdm4wTjF6Q2JGNHJwcUgxdVZrV0RGTlZkaUFreFNnK0JWejVCdTlNY0x5?=
 =?utf-8?B?eXVZVkR2OFFBcnFjM3B0TlhQeEtlUzFIQzRMQWUzOTFHVDFFbjBzZXlGZUl4?=
 =?utf-8?B?RWhKSUR2YjZzN3BlekVtR3ljMlhCQXAzUlpoRm91eXE4U0dpd0ZHa0F5azBI?=
 =?utf-8?B?WExwMkZlYUlNT0huSlc2Tmh1Z3ZYWnFtOVpaVzNpWGhjWlpBdGxnNStRSmhr?=
 =?utf-8?B?V2RlRzJZczIzeTBzV2xuc2sxTGp1RGRFc29PT0trMEQ5ZURaS0lTMmpXZUly?=
 =?utf-8?B?Q09aK0FzWWNkeFRRWE96eDBVV1MyUGtrVHUwd21RaWtSWkxPeGUrbm8yZE9B?=
 =?utf-8?B?NnJDSUVWYmZ2SVozbDZFWUFmR1ByQjFCZmpPdHEzTjFVZEpuNFNudVMyQzJL?=
 =?utf-8?B?TXhCVko3a1hhdWhwSTBCOVlGQlQwbVYvNGFJM1BHK01jVEgrOGpOek5CdEg4?=
 =?utf-8?B?OFVyMUJCci9KaVlQcnBrMStRUzBlVVl0Yzl4b3VZTTVyRVYwRm92M3AxUWFI?=
 =?utf-8?B?NlJXU29ITWJkdVl2MlQraC9Bd24rWXNpTG1sa2I3cGJCdXdGblF0U1JkNE1J?=
 =?utf-8?B?c0VDMlZYaE9aa3NNR1VyWXkyRG1MNVNCRkFuUE5rLzhLVUFFSFVRTFdlWHZF?=
 =?utf-8?B?c3hxa3E1ZkI1Q0VPQW1NMTRSQTVwMzJ3dWV0QjF1YnFHN0JqUmlKdndSWFoy?=
 =?utf-8?B?blVjT3ZHeTdjRU9FTHZRWXJZTWUvLzBVUlo1cTJ4cEtXU2piQ3o2QjMxaWo0?=
 =?utf-8?B?c1Qyc3ZUaW84LzkrMEQzK0xTRlRxS0Z3UVBmdjJpK0ZSUmw2U1pyY1k0bzNV?=
 =?utf-8?B?NzN1ZGtaaDlTUlZ0cUVYbGRDaXFRVVl2Y1FtNExibVVCenJ4S0J4VTNkdTUx?=
 =?utf-8?B?Uk5MVkJhSGRDQWVOSUg0azcybllVbU5CbndDTHE4UFpCK2VKKzBJTDNkQWFw?=
 =?utf-8?B?ZnFCcGREOUhsYzVmQmNYeGRNRXlrWHVBaFNKcFJhU0JxVU1JMnZnMTcydnFX?=
 =?utf-8?B?TkZMNnRxckxFaGw4RnBacHErUUgwM2NTTEFMSUFBaHB5WWVEWXV4QlJzL2E1?=
 =?utf-8?B?YkRCaUpNSDIyV0g4VmNwZHpHWFhJZ1VURkVZOUcrZUtMNE9Cd3FLejNxbWVw?=
 =?utf-8?B?SlEzc00wNGdLbEM2VlpPOGNSVWJpT24vQjlLZlZScmNzTEZiaGo0bCtEM01K?=
 =?utf-8?B?WGFpUDBOMmU5eThtcmpVYk14YlFyVE9veVpjT0tRZVFhdmkxMGh3QTlvbTFp?=
 =?utf-8?Q?FYIxBUrTDKhBZz1v1+Nw6StXTI6LrCo4sZI/o=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09d8b2e1-c117-4f94-761b-08d90a03fad0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 05:10:45.9830 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jUg/62Kno9e7gEtZ6Mgs4/d3XGi4l1FbSU0zH9ahNNxql7qpQUDrkvcPv4u4mMEsGKwsPOkMJ7ZzqtzDGpJCiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4590
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9967
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 mlxscore=0
 malwarescore=0 phishscore=0 adultscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104280032
X-Proofpoint-GUID: wDK6gbEpsq7pJ4agU7EXSrQFdKq8YC-8
X-Proofpoint-ORIG-GUID: wDK6gbEpsq7pJ4agU7EXSrQFdKq8YC-8
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9967
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 lowpriorityscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104280031
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=dongli.zhang@oracle.com; helo=userp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 joe.jin@oracle.com, qemu-devel@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jason,

On 4/27/21 7:31 PM, Jason Wang wrote:
> 
> 在 2021/4/27 下午4:53, Dr. David Alan Gilbert 写道:
>> * Dongli Zhang (dongli.zhang@oracle.com) wrote:
>>>
>>> On 4/22/21 11:01 PM, Jason Wang wrote:
>>>> 在 2021/4/23 下午12:47, Dongli Zhang 写道:
>>>>> This is inspired by the discussion with Jason on below patchset.
>>>>>
>>>>> https://urldefense.com/v3/__https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg09020.html__;!!GqivPVa7Brio!KbGQZW5lq3JZ60k12NuWZ6Th1lT6AwmBTF0pBgoWUKKQ4-2UhdW57PtvXUN5XQnZ2NU$
>>>>>
>>>>>
>>>>> The new HMP command is introduced to dump the MSI-X table and PBA.
>>>>>
>>>>> Initially, I was going to add new option to "info pci". However, as the
>>>>> number of entries is not determined and the output of MSI-X table is much
>>>>> more similar to the output of hmp_info_tlb()/hmp_info_mem(), this patch
>>>>> adds interface for only HMP.
>>>>>
>>>>> The patch is tagged with RFC because I am looking for suggestions on:
>>>>>
>>>>> 1. Is it fine to add new "info msix <dev>" command?
>>>>
>>>> I wonder the reason for not simply reusing "info pci"?
>>> The "info pci" will show PCI data for all devices and it does not accept any
>>> argument to print for a specific device.
>>>
>>> In addition, the "info pci" relies on qmp_query_pci(), where this patch will not
>>> implement the interface for QMP considering the number of MSI-X entries is not
>>> determined.
>>>
>>> Suppose we have 10 NVMe (emulated by QEMU with default number of queues), we
>>> will have about 600+ lines of output.
>>  From an HMP perspective I'm happy, so:
>>
>> Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>>
>> but since I don't know much about MSI I'd like to see Jason's reply.
> 
> 
> I think we'd better have more information, e.g the device can optionally report
> how the MSI-X vector is used.
> 
> Virtio-pci could be the first user for this.

As discussed in another thread, you were talking about to print MSIMessage.

However, I prefer to print the raw data as I think the user of this interface
should be able to understand it as MSI-X messages.

For instance, below is the data printed by "info msix".

0xfee01004 0x00000000 0x00000022 0x00000000
0xfee02004 0x00000000 0x00000023 0x00000000
0xfee01004 0x00000000 0x00000023 0x00000000
0xfee01004 0x00000000 0x00000021 0x00000000
0xfee02004 0x00000000 0x00000022 0x00000000
0x00000000 0x00000000 0x00000000 0x00000001
0x00000000 0x00000000 0x00000000 0x00000001

The 1st column is Message Lower Address.

The 2nd column is Message Upper Address.

The 3rd column is Message Data.

The 4th column is Vector Control.

In my opinion, this is equivalent to MSIMessage.

26 struct MSIMessage {
27     uint64_t address; --> column 1 and 2
28     uint32_t data;    --> column 3
29 };


We use the similar way to read from Linux OS, e,g., given the address of MSI-X
cap, here is how we read from OS side.

# busybox devmem 0xc1001000 32
0xFEE00000
# busybox devmem 0xc1001004 32
0x00000000
# busybox devmem 0xc1001008 32
0x00004049
# busybox devmem 0xc100100c 32
0x00000000

Thank you very much!

Dongli Zhang

> 
> 
>>
>> Adding an optional option to 'info pci' to limit to one device would be easy
>> though; that bit is probably easier than adding a new command.
> 
> 
> One interesting point is that MSI could be extended for other bus, (e.g MMIO).
> So "info msi" should be better I guess.
> 
> 
>> Figuring out the QMP representation of your entries might be harder -
>> and if this is strictly for debug, probably not worth it?
> 
> 
> I think so.
> 
> Thanks
> 
> 
>>
>> Dave
>>
>>
>>> Dongli Zhang
>>>
>>>>
>>>>> 2. Is there any issue with output format?
>>>>
>>>> If it's not for QMP, I guess it's not a part of ABI so it should be fine.
>>>>
>>>>
>>>>> 3. Is it fine to add only for HMP, but not QMP?
>>>>
>>>> I think so.
>>>>
>>>> Thanks
>>>>
>>>>
>>>>> Thank you very much!
>>>>>
>>>>> Dongli Zhang
>>>>>
>>>>>
>>>>>
> 

