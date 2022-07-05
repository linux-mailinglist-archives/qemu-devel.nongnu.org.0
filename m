Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8ADC5676DB
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 20:52:06 +0200 (CEST)
Received: from localhost ([::1]:46422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8neX-0002hH-SG
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 14:52:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o8nIS-0005fb-9B
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 14:29:16 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:22192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o8nIQ-0002Zq-KI
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 14:29:16 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 265HEGib004798;
 Tue, 5 Jul 2022 18:28:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=RfiJuCgcgl2jpWN/G5u+Iuv6rPi/6523ivSuexewR8M=;
 b=ryer+7nZGjDdHWdeSQT5wRkIClGGHpVlnLpWCx14gsaHLubFniSCtu8IgzK2P0oIcY7G
 ZuTHw0VV8oRpG80OUHD5H5g3za+hD9KooOCKD4mjUuBvgZw0nOp5vN770S3qKNB+wFyU
 74+fIIWeSjZfV7nujwndS0N/AbnkbA3G3Bvd11SWc2aoJcDj2b5vrnc4/iG16uDLynl+
 Z6+pRZU2Sa0FEBXslwaEMfVaMAlK11TARW5YRO7zvelyjE/1VBoBaX1o8ngjatdAPCFU
 j2kFJ6DxPhGsbO4tRYpVAaoaGiaXWu/dH1qm1RZfYp2V3uoZTPnkvsQKZutb2N2lbufQ Zg== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h2ct2f0mr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Jul 2022 18:28:55 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 265IR3nx018946; Tue, 5 Jul 2022 18:28:49 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2169.outbound.protection.outlook.com [104.47.73.169])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3h32mjg07e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Jul 2022 18:28:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kPgQ5yxsA2b6OfyFoFnrllzcG1s2UC93/0Hu8zzo13gIrSYQJWEodq+gDAp82WYjO0BMhXrSrfMQq0hxPEJbAKPs78kawdp4ER6xnail4kFyhvhVHIsRqcuDLEze96zu3tuj1T4htW7OFzdNr7ko1WmdA8DiasG08XH3I+WOYQvl6HYa4jTOyrV8oAvCkfvWu6mPT8H+3gcT0HW727g8UDI1//aCnzrr0mQP+PI1FbSIflKlWl6peI5L1Bwp99tRCjIp+0YStYC9gnjQS1O0QXNJQmDNeDaKEGy2qTTBOh+kJBmrB+MwIdywcvpSf23fxr6L3syd//defndV8JnvUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RfiJuCgcgl2jpWN/G5u+Iuv6rPi/6523ivSuexewR8M=;
 b=PQzHQYiGWx5++82V/tnXvOVAugZ+M5AmJGk07a1Az69LVlxLJsFDF5tmdEf2wLnXcT1tkK8cFY4MOs7xf0TG5pnAkg0FfZCr5sjz8wc3+fw/W+sN08AY4baNEYPvFIJVnq9SxdGk5docFdhdWGA3ZzWmWFIL+Q49qjWFVE6JrY5118TEkLVOZYP1U58SdNUJqIFdMPAh5DMdTmKhgVCs+Cfsmo0twQ1M8flPULNyL9ohsNRK6JndbPlKWog/wGsa3QkC8lsrlz/nkhVM8toKd2xXl/LEGdU+evotP0aZ2voI6QtOJ6o6oFz1aecUAg8B3Fh6m4iXaZ2fQzaN+GENhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RfiJuCgcgl2jpWN/G5u+Iuv6rPi/6523ivSuexewR8M=;
 b=AlFGxFfaTroLqOapiMYn6SFWviWgqwufHx+Jrn/oPENTR446RwlD+oBqQdddkZysnCkq96PagKQpsnmijccidrTInCKPuarrXmK6ywtjd7V0VB148cFkfDz9qg69vQRRn2ypQAO1OnnzpyXMcnUpUlENGxoUjcCxbJuRePYZmCg=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by DS7PR10MB5341.namprd10.prod.outlook.com (2603:10b6:5:38d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Tue, 5 Jul
 2022 18:28:46 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::dc4d:56f4:a55b:4e9]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::dc4d:56f4:a55b:4e9%6]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 18:28:46 +0000
Message-ID: <6b4dae8c-9f5c-cba9-b54d-6d54819ba285@oracle.com>
Date: Tue, 5 Jul 2022 14:28:40 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V8 16/39] qapi: strv_from_strList
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: QEMU <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Jason Zeng <jason.zeng@linux.intel.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Mark Kanda <mark.kanda@oracle.com>, Guoyi Tu <tugy@chinatelecom.cn>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
 <1655304746-102776-17-git-send-email-steven.sistare@oracle.com>
 <CAJ+F1CL3=Q66LC9OqMTD+ffC7p5gu4K1V9Yg+_y+qv8CH48b4Q@mail.gmail.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CAJ+F1CL3=Q66LC9OqMTD+ffC7p5gu4K1V9Yg+_y+qv8CH48b4Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR06CA0049.namprd06.prod.outlook.com
 (2603:10b6:5:54::26) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 999d34c3-3f34-438f-b40c-08da5eb43252
X-MS-TrafficTypeDiagnostic: DS7PR10MB5341:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fk8iQDt6zVxhrc8WLF2k2WOlNQ8ucr6MDhKaw3OR2af+VaSFRRQe1m3Sfnc77S3dIKLbwadR+Of17iLCcnbWwm7JQMfYQHtM8PEfycQywnc78OufHirT885wVAq0zAfNrXM+FKFzoQL+vSyMsks//Z1922E4T8OeGPnnZNWWcji5WPRnqpGXKy/3W4WD48ZXijobSJ88dEzxoAb/yIEmRlkn2vhLrcmdsH07M0NPDHZmLkbf8lYyN8CFobRNYBUan1DCqcB5+Q4T/uqnMtZ2BPi51/5LyBVrD4j3/j89CTvzulFAHuZ8c9OK+RJ8d4rwDESb0EN9MiXqr7uzlkDRJFEyomczq8G+jbIQEpkr6vnb/1jDCrqEnK7aRsXSRS8gxz+FSkFAHfy5wHrr/jBUoiB4Hd/n4os1PsIGYfg0EHRzmRlvIiKJJOYNZAYTXmvyea8DBH23O90vr84OzkVNP+DfhviqVgbFLCY23sqs361yks0O5vUbbG541WPywTAP7csmP9LZMDV5jUOBJcROoHlPIY1+5EmyXr6o/JQ6K8jf7X/vMN73LRzdCr2E9PXdolLmOrYdF5rNEBg+flxJOIv6U8+TTCi7QodIMDAzYL/Z1Bo8yoXIwrnva7ucPqZjU5sUN6mjyzm5DSKF2qjyX2XhQoiK5fnThcW+bSCjXfIJs+pZ/H/kwZgeyTjwjAyj6s1SToMIq3z8N98pTakWFdPF1N8Id6tEoFOBu0pPDSQsjycogmgfmFUXbBBq2DahKjMz8Er8X4pDKx2izO5pZcFNOjDGhkyliZ6bXT5yW2daeShr40vT91Kj7wIlAtoklJVwXyslZftx1AZ4zoll2A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(366004)(39860400002)(376002)(346002)(396003)(36916002)(8936002)(7416002)(5660300002)(54906003)(4326008)(8676002)(66476007)(66556008)(66946007)(41300700001)(86362001)(31696002)(6666004)(6916009)(316002)(186003)(6486002)(26005)(36756003)(6512007)(2616005)(6506007)(2906002)(53546011)(38100700002)(44832011)(31686004)(83380400001)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEg1TE9pMURlc3FxckwrV0paNEhUWEo2ZTdwaSsvYVVvS2xtenhLWm15aG83?=
 =?utf-8?B?c2Z6NTJOTVB3WUdDMlltYmZoNzVYSjJrd0ZmME5zdmlwU0g2RU4xL3pWZi9I?=
 =?utf-8?B?TjFNZnpQKzZiYUhGT1I4MUVxRnFyQzk1TWdxNThnZWpqa0hOTDZXM2dZTkxF?=
 =?utf-8?B?bkNwQlN5SlZyOWNqUDVNaVlHR1BaaElLVE9oQzNla2w3a1ZrVVM4MDg1ZWhw?=
 =?utf-8?B?QWFENDBHLzB4L2xtdDhmanA3OW5Dd2oyWFZYYjNoN2M2bG55K3lQcWpRSjg0?=
 =?utf-8?B?VlJWUEE0MkgzWjF0L3dOcWFyOW5MSzgwTkFQUFdzMzRXVzdTK1gvWW5ldjNB?=
 =?utf-8?B?dko0VmFtMW51ZXU2WXdvK1JhdWdubkJZUU44SGJxbTYxWTdoQXNvMVJkNm9m?=
 =?utf-8?B?aU9MRm9pMWZvSDcrN3JGTzk5Q0U5U2hHRGVIa2hDdC9pY05aTHhFWTVLUE9X?=
 =?utf-8?B?N3lReVBZeEJURHcxU2dkYVpIcW5POTVybEliUmdmTHBBc0FFWVVoY2FHZFpz?=
 =?utf-8?B?SXlReDJOMjJ6K3I1Q1RWZEJiaHZqZ0c1L3ZZMXQ4SkZBUzBCSEtJZ2YrUjVS?=
 =?utf-8?B?bU9BaXBsclJPSlZ4WUtNQTMwcUtMaW96dGtJNEVZcW8wcTIrdFk4dnV2N09i?=
 =?utf-8?B?bjk5aXcvN3dNQ3Y2c2tuNlZBSDJjaWcyUzBsUzh1V3JPZklyelA4d1ZMcmQr?=
 =?utf-8?B?S1JHNE56WHFkeFpkSmhneDZ6Vi91VmZKcXRFNm4rWHdmejhsSys0OUVhWXVI?=
 =?utf-8?B?UmtMRnhaZjBkYmF1R3RXb0dmNVQ3cXpKWlZ2MUI5NktsNTRFUFEyL3NlVW5D?=
 =?utf-8?B?S2ZuYjl6NFl3Wk1MM2JxVksrNVNDNGZwbVBlc09KVHRqcHR0NzAwdHRjREsr?=
 =?utf-8?B?RWkrWEdSa0VLL1E2bXg5MGczcncxaE1JUWdjbjdKdWdOZVlqNXFhWWxZSklr?=
 =?utf-8?B?U1ZJQm1xbzNXZDhBcmNPNVNKZWkvNVZhK1RZeWx0QTIzaWNDajVOb0ZMaFVz?=
 =?utf-8?B?dmc3ZnNHdHJ5ZGY2bU1LWi9PbVVMM2FPMHltRllMWGI5b0dkZGl4bFdNNWhm?=
 =?utf-8?B?Nk1SRXFYVy9nM05VSnlBcVZSZmRIM1hPaEZOSEFZTE5SYitQRjBhdHNPT0Qx?=
 =?utf-8?B?TmF1bkhlZ1BvdnVxdkxKSVVyQ2RjS2MraG9vd1ZNak9iMTJ1emlTeEhSYUpB?=
 =?utf-8?B?RUdsbFdxbGd1b2dvNlFONU9NVnd2dDlQYWU3V2x4RVI3MEZ5ekdjU1JRUDFp?=
 =?utf-8?B?akxBQzRXZHlsMUxHNE9jSCtpdVlXeXNrRFB2NGhPTkZzS2pGdU9QeWsrM3pH?=
 =?utf-8?B?SHlZWU8yeUZQK3VTN3Vkam9sMnNQR0FOL1pBZGNCd2p1ZU1MbFIvQ1d5ZkE4?=
 =?utf-8?B?K1lzVUNidnpwT3BGZVNlQVNlcXkwazRYdUJuSVBWS0VsYnVDREc2ZEQxTENY?=
 =?utf-8?B?b0dhdmdRYlQyRzRSVmRYVTByQ2lWTTRwNEkwSHRoZGdNOHlGQkdBd0hGQ3JJ?=
 =?utf-8?B?eGw3TThEMzY1Tml4c3FWZktXL3MwcUlGbE5BWXZwaFk0YUlYVkl4WTl5YmZH?=
 =?utf-8?B?bW9aK1JzL0pkZENSZ0QvZ2VYRUUxRUsydzRDOTBwWDczelJZUm9iS05wd0pJ?=
 =?utf-8?B?azRkSjZ6T1VJRHUycjlCdFVQdWRQOVZjN0p0Q0VJdVhFZWZOemV6bG9FMW9B?=
 =?utf-8?B?RWxNS1BnM1FGNnRoQ0t6bnI1bU1BM0JldkRzb21GYlpiZ1JIU0YwQjJXa1Jt?=
 =?utf-8?B?Y1dlSDBMNktkT0FDeEZhYVpRQm14VlNESTZBVjFwTUpSUUErQUR6UE4rNWpz?=
 =?utf-8?B?SUkvWFVHQkhjM0xxb05HTE5xQXhZY0ZZMHM2UlpLc0ZaejJ0ZWlrRWdma1NX?=
 =?utf-8?B?My9pRHhHMEFPNFRrNG1FUVZVWDRvK3N0NkRMZ0FRU0JIVEVkYzBMQVBqVk5Q?=
 =?utf-8?B?ZjlpUUdhaWpVK1JBeXZ3d2VhMk9vRDlSM1h0K3owL1d3V1hpbnNQdEpmR2l3?=
 =?utf-8?B?eE9RN1MwOTJ2M3FleFBLaTh1elpIeDh4ZGtJMjFMVXM1bFFKTXJSRU1UMG9o?=
 =?utf-8?B?dkZQMlY1dUdrMk53ZDlWb2NCT0ROMmZzSE1LMXEvbDZOSWJmR0wweGtJQWNy?=
 =?utf-8?B?ZSt4aXFxbjhCVC9aZHljR0lwdEQzKzZOTTdxcHZGa2xzUHZncXo4T2VYZlV3?=
 =?utf-8?B?aUE9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 999d34c3-3f34-438f-b40c-08da5eb43252
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 18:28:46.3844 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0UT0+FU5ZK6xaMXubPa70h3lCh21pdsbn8GaCfU4ax3Y1HthwCaFHT3Jm3g0xlQVqFGHJ9hBIf0JePgCS85N3vE3Ygpaujl+ta/ZLxlxdN0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5341
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-07-05_15:2022-06-28,
 2022-07-05 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=999
 malwarescore=0 phishscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2207050079
X-Proofpoint-GUID: e8drAPFkZRAJaNIg0KhE19BCgLxxATMe
X-Proofpoint-ORIG-GUID: e8drAPFkZRAJaNIg0KhE19BCgLxxATMe
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 6/16/2022 12:08 PM, Marc-André Lureau wrote:
> Hi
> 
> On Wed, Jun 15, 2022 at 7:30 PM Steve Sistare <steven.sistare@oracle.com <mailto:steven.sistare@oracle.com>> wrote:
> 
>     Signed-off-by: Steve Sistare <steven.sistare@oracle.com <mailto:steven.sistare@oracle.com>>
>     ---
>      include/qapi/util.h |  6 ++++++
>      qapi/qapi-util.c    | 14 ++++++++++++++
>      2 files changed, 20 insertions(+)
> 
>     diff --git a/include/qapi/util.h b/include/qapi/util.h
>     index 75dddca..51ff64e 100644
>     --- a/include/qapi/util.h
>     +++ b/include/qapi/util.h
>     @@ -33,6 +33,12 @@ bool qapi_bool_parse(const char *name, const char *value, bool *obj,
>      int parse_qapi_name(const char *name, bool complete);
> 
>      /*
>     + * Produce and return a NULL-terminated array of strings from @args.
>     + * All strings are g_strdup'd.
>     + */
>     +GStrv strv_from_strList(const struct strList *args);
>     +
>     +/*
>       * Produce a strList from the character delimited string @in.
>       * All strings are g_strdup'd.
>       * A NULL or empty input string returns NULL.
>     diff --git a/qapi/qapi-util.c b/qapi/qapi-util.c
>     index b61c73c..8c96cab 100644
>     --- a/qapi/qapi-util.c
>     +++ b/qapi/qapi-util.c
>     @@ -154,6 +154,20 @@ int parse_qapi_name(const char *str, bool complete)
>          return p - str;
>      }
> 
>     +GStrv strv_from_strList(const strList *args)
>     +{
>     +    const strList *arg;
>     +    int i = 0;
>     +    GStrv argv = g_malloc((QAPI_LIST_LENGTH(args) + 1) * sizeof(char *));
>     +
> 
> 
> Better use g_new() here. Otherwise:
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com <mailto:marcandre.lureau@redhat.com>>

Will do, thanks - Steve

>     +    for (arg = args; arg != NULL; arg = arg->next) {
>     +        argv[i++] = g_strdup(arg->value);
>     +    }
>     +    argv[i] = NULL;
>     +
>     +    return argv;
>     +}
>     +
>      strList *strList_from_string(const char *in, char delim)
>      {
>          strList *res = NULL;
>     -- 
>     1.8.3.1
> 
> 
> 
> 
> -- 
> Marc-André Lureau

