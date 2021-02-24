Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C22323AE6
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 11:57:36 +0100 (CET)
Received: from localhost ([::1]:43352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lErrL-0000mO-GU
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 05:57:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1lErkU-0002Bq-Oj; Wed, 24 Feb 2021 05:50:32 -0500
Received: from mail-eopbgr40139.outbound.protection.outlook.com
 ([40.107.4.139]:15879 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1lErkO-0000C6-W4; Wed, 24 Feb 2021 05:50:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WQKLkpoRdip7IGxyzStkCBcKB5bhHR9VjGI9yiiuUhUnJS7tQwIeQ5/mhRDE4ZyUW8ule7QW4x0IwnpAYs6kJt8cGNeuExEo+K1ii+QurBG0DN1xfy/4bLUoxN5GNVQ8eSstpY8EUx6AofJATP9SaPwJHkyPGk/I6Qb6OCW67Fr6Mxp25X4z6wOQSgnjhTZb8FN1W6po3K+uaSwEceO2MgRQ0TvRX5o5PTZE36RTZfmtJkbqK3JjhzNXm4Aj9tz1FDYKffbkkhpSiUZeaOpyzqEvHVKrQZij4tN50/RPlM6JXUwXZMA0VRWT5bN6Mr7JMy+Ay3V4PqJNj22MMY527A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=13ogTtZrJQfCTjWr1U4G6GxWfkU6rbKzlCqrcgRYyvs=;
 b=HNm7egtiZILs7IGCtxt9/G+dnIJ6MWMItINsMEoM2CrzTUruNCHDihyXDpn5mVKJI3pRTRBsqrjhIR1VlvB59rWClck7aR4aR5GAP1M6RjcTIuC3cVp8KzlAvwxNPry3RuA/evBYcsP/ea37P7bRtwEQKOxgF1HhRf/nhSl4ObR26g2z55oy1nRkTfdjf+vmjZg8p3LyTzii9pfU8V/cX6Q4J+yJ1H5hjrE2Hk+U/Z93V+P3ud1xJUl6HnM5Umbu/iKY1hfZqepIBI/lyb/coCWtOEB/a7KxOBNHBGkZn0P9XljF0HoW2ZNTCJT1J4CRXlzXdG7CnlmZfTdnLeFfjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none header.from=openvz.org;
 dkim=pass header.d=openvz.org; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=openvz.org;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=13ogTtZrJQfCTjWr1U4G6GxWfkU6rbKzlCqrcgRYyvs=;
 b=nxkWn5/cd6hhpTq87oNW1uYOLovwsKSeuD92neqQZ+eUMe1bhfqZvEfruMijOdTsnVJUsY5s4n8/K0n0j3y7/bNZLXuc5FHbCz48c2ULUPb7BPgpO6oP6d1ilwG4y8lgvtktmuS2n364EU9FJx+ORCcsj9DolqbZeDMrY4y5qkk=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=openvz.org;
Received: from AM6PR08MB4214.eurprd08.prod.outlook.com (2603:10a6:20b:8d::30)
 by AM6PR08MB3959.eurprd08.prod.outlook.com (2603:10a6:20b:aa::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.28; Wed, 24 Feb
 2021 10:50:22 +0000
Received: from AM6PR08MB4214.eurprd08.prod.outlook.com
 ([fe80::b583:d143:8b9a:83fb]) by AM6PR08MB4214.eurprd08.prod.outlook.com
 ([fe80::b583:d143:8b9a:83fb%6]) with mapi id 15.20.3868.031; Wed, 24 Feb 2021
 10:50:22 +0000
Subject: Re: [PATCH v2 2/6] parallels.txt: fix bitmap L1 table description
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210224104707.88430-1-vsementsov@virtuozzo.com>
 <20210224104707.88430-3-vsementsov@virtuozzo.com>
From: "Denis V. Lunev" <den@openvz.org>
Message-ID: <bfd4153f-e2f8-fee9-52c9-515ee4db5ebc@openvz.org>
Date: Wed, 24 Feb 2021 13:50:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210224104707.88430-3-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [31.148.204.195]
X-ClientProxiedBy: HE1PR05CA0357.eurprd05.prod.outlook.com
 (2603:10a6:7:94::16) To AM6PR08MB4214.eurprd08.prod.outlook.com
 (2603:10a6:20b:8d::30)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.81] (31.148.204.195) by
 HE1PR05CA0357.eurprd05.prod.outlook.com (2603:10a6:7:94::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19 via Frontend Transport; Wed, 24 Feb 2021 10:50:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c37e857d-c527-4d5b-2454-08d8d8b1fbdc
X-MS-TrafficTypeDiagnostic: AM6PR08MB3959:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3959D71B8457F6CCFB550AB5B69F9@AM6PR08MB3959.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VMcfPKb+7+Ne5i7eIeD/+QeXIb+LMv1mKGTl3x3ipkYgI3l/qPGnL2ew0CqYmYYfJwD+f8SY5/W6rkiDytVyGfIpfSZYk8IbDYvtmQLaVdWrNDTcBp6MZxWAAjKu4A4aBB6AebvysWu75vJYg9bNpN6PirQnr/4p8Hul4FxdjSkSpurEKf1hhFRwrCQzLoglZtSTre4ldJRkD2Qglc70FHuBdhsip7jh6GwDFHzD5jrl0W9ILpzQdQhlaOFK0vhWrG+WXKU5HzwEvwpxUrFHBgawxucFSe9572HLwj6PGMO9oabny2H2AwvTFGoq1gLEqpfyfaVcgfC6RuvOxfdgItFyW29R9kl3iXCq8BX4vWmPVNZrt2zYh2Nde2m3k56JuPEVgFSJGmEeBwNUaYOCfk0MHPNaBxNuSIke1/rrSKTFEQibwpJqFu2Vj1hyrzcgPk0nldeNGLU9AVFCOp57VC66Z81BGG0n/Ip38AzG0O+Qqh82Y8vZiYWhlA1Uhi+Sy93GPKU39UCw3zhr7xciz27Y+R9YwGxp3YeprHspCUisLQOz8XzkbahxN/+wwxjTPv+rl7hQblym5yxnA9h+PNZkNqYqMw3czaBo0nj0/C8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR08MB4214.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(366004)(346002)(39840400004)(396003)(8936002)(31686004)(83170400001)(316002)(16576012)(8676002)(4326008)(6486002)(83380400001)(16526019)(26005)(31696002)(478600001)(186003)(2906002)(52116002)(42882007)(53546011)(956004)(36756003)(5660300002)(66556008)(66946007)(66476007)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VTJwUFFybHErODlteFdFVVUyOHMzYnV5OC9ST1VWT3FEcFBTZFhTTys1a0ZR?=
 =?utf-8?B?MXlnaWZad0VSLzVhdVo4aG9rRmN5d25JYTlyOUZGZnd6UUZNbkl6NWlLZGJC?=
 =?utf-8?B?ajh3QWFyWHk2WmsvZ0pxSHhDTEFPS3cvY1hqTzFoWkRlcklRa1ZQcStDaUlP?=
 =?utf-8?B?UldnYW5NdWcwSFZBVGV1Mm5OclNFSVo5MGJpUmFYeVI3aTUyVThCOUg2dnhO?=
 =?utf-8?B?RDYxMFB5aVlXdm9UQnhqMEJ6ejhGUWxXMFYweWhXWnZpQUZqNm1MY1FOaWpS?=
 =?utf-8?B?dS9TbGc4WThOeUV5RnlQS3g1UWpwTS8zV1VUYWxUNnZWUnFvYzNlQjhRRVVY?=
 =?utf-8?B?bjBDNkNoM1E0MkJVNlZrOXBnTkR1TFZQRzhJMVV2R1lmWU01MWsvbHA0Y0dN?=
 =?utf-8?B?SEkxWnpsdlBKTjJLZW5FYXloR1BOYTVWWlNnN0Z2U2RnaVE4RGo1dHRNT3Iz?=
 =?utf-8?B?MS96eGtVNWtWZHJkeVV1ZTZXNjZXb3VTQ0taYmsxZE9USGtKUUVkUlZUZ1lD?=
 =?utf-8?B?NGVlL0c0ZGVHUFNyWUplWFdEVmMxSTFZMXA3R3RUOGVTM3ZPRzNOZkplM296?=
 =?utf-8?B?elBNWTBrdGJyZFNUK2dqbzE4NktBaWJrb3pzYVBHZjlTdHhILzNYT1Rmb0Zj?=
 =?utf-8?B?QjhlejNTM21QY2RYZWNLR3M2d1lWK29sVjYxSHdtMk5zZFNpc1lRamJTYklG?=
 =?utf-8?B?ekN6UmxTMnFXS0RTdzBMY0J0b1NTUEc4dFVQVk1nd0hXdkRQZFh4NW5tZFky?=
 =?utf-8?B?NVU5Yng3Z3VTT3ZrSjlxR1dPV1RMWTQ0UlJ2a2VCamNLSFVMNmJOT0tzeEtt?=
 =?utf-8?B?OHQrYnowQk5HcXpVSkFqb0lPb05CUjFDekpCaWNVR0luRW11V09URk9TQ1Vz?=
 =?utf-8?B?U05XSUg1L3RjWkVvcjNnZXpaRlJ3NW11ekUzdFVWenpvbkFRTUxUbVNXUnYy?=
 =?utf-8?B?KzFiVERSWXJ4NXMzd00wSXlrei9oZUtpOGJ1ZXVSK2ppcHQzVTQxWThiSnNH?=
 =?utf-8?B?ampmQTlXTnFBVXovZlV0a253aS84ZTVIMCtFY3IyVU1FL1dWK3JsZUtJUU4r?=
 =?utf-8?B?SENDL2ZQVzZDVVlXNkRWMUtnZy9GQTUreHlFSEExVWkybHg0VlNOdFV6SGZp?=
 =?utf-8?B?Rkd4aHZrNkVQRWxyQVNnQmZWdDEvRWswVFVMTjFkLzVHRm5PWTZlNzE5VFFD?=
 =?utf-8?B?V1FmMlpkYVF1Zy9EbVFDWVBIQ1JpYzUvQU9NdjJGbU0vRG53b2xVOHZ6L0V6?=
 =?utf-8?B?ZTdBVzJYUyt4YmVtMlNqeHRaOG1oZEhjWGtaOGxja0Z4Ykw4eHhyUkQ5S0ow?=
 =?utf-8?B?WUd1WHVJSzROZ3RJZ1Ftc0Yxa2VwK3hxSnpWWHJzZUhXU3lQMHNld2poMU9O?=
 =?utf-8?B?eStIWXBlRzlGSVZnMFdJZ2kwVS9DQll3b05TNmhWbXVyNXRIYXNsS2taZkY0?=
 =?utf-8?B?QU1MakFEb1gzMDNvS2JZVk1aTEJ4b05LRGRrTWx6RWRqL2p1TUlKcU95NGVw?=
 =?utf-8?B?NzhQZHcxU2JydzlWUXB5RllrMzIwVkdNZlU5RzJnR0ZWTURQSE5BaFdLbER2?=
 =?utf-8?B?NDQ0bVNLWEdyeEhTM2NXWTAvOWx0ZzkzVmk3d0V6L0tBRVRpTHU2Um16ZkE1?=
 =?utf-8?B?RDhMN3ZkTEt0YlFUeDIxZmZEdTdnRUlNMEhuTlp5OUpUUjJ0NWpKSE1hckY1?=
 =?utf-8?B?cFkzaDNkTWRDaWV5cmpibWNEdUdlQkI1dTFXOEM2cXZ5NVpGTjRqUklWZ3Q0?=
 =?utf-8?Q?UFvzDj1FMSev1pr1c4YEqeCGfwhfVtH8hIffuBQ?=
X-OriginatorOrg: openvz.org
X-MS-Exchange-CrossTenant-Network-Message-Id: c37e857d-c527-4d5b-2454-08d8d8b1fbdc
X-MS-Exchange-CrossTenant-AuthSource: AM6PR08MB4214.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 10:50:22.0803 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q9vLPh6Svf65edmEWQunhXNZesB0tlRlyFCu1Td9LBFoolat15CP6qPVpMo7l+y6XnWq75F1zuO1kwIsBX6KSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3959
Received-SPF: pass client-ip=40.107.4.139; envelope-from=den@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/21 1:47 PM, Vladimir Sementsov-Ogievskiy wrote:
> Actually L1 table entry offset is in 512 bytes sectors. Fix the spec.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  docs/interop/parallels.txt | 27 +++++++++++++++------------
>  1 file changed, 15 insertions(+), 12 deletions(-)
>
> diff --git a/docs/interop/parallels.txt b/docs/interop/parallels.txt
> index f15bf35bd1..73af9a2c4b 100644
> --- a/docs/interop/parallels.txt
> +++ b/docs/interop/parallels.txt
> @@ -208,21 +208,24 @@ of its data area are:
>    28 - 31:    l1_size
>                The number of entries in the L1 table of the bitmap.
>  
> -  variable:   l1_table (8 * l1_size bytes)
> -              L1 offset table (in bytes)
> +  variable:   L1 offset table (l1_table), size: 8 * l1_size bytes
>  
> -A dirty bitmap is stored using a one-level structure for the mapping to host
> -clusters - an L1 table.
> +Dirty bitmap is stored in the array of clusters inside Parallels Image file.
> +Offsets of these clusters are saved in L1 offset table here. Each L1 table
> +entry is a 64bit integer described below:
>  
> -Given an offset in bytes into the bitmap data, the offset in bytes into the
> -image file can be obtained as follows:
> +Given an offset in bytes into the bitmap data, corresponding L1 entry is
>  
> -    offset = l1_table[offset / cluster_size] + (offset % cluster_size)
> +    l1_table[offset / cluster_size]
>  
> -If an L1 table entry is 0, the corresponding cluster of the bitmap is assumed
> -to be zero.
> +If L1 table entry is 0, all bits in the corresponding cluster of the bitmap
> +are assumed to be 0.
>  
> -If an L1 table entry is 1, the corresponding cluster of the bitmap is assumed
> -to have all bits set.
> +If L1 table entry is 1, all bits in the corresponding cluster of the bitmap
> +are assumed to be 1.
>  
> -If an L1 table entry is not 0 or 1, it allocates a cluster from the data area.
> +If an L1 table entry is not 0 or 1, it contains corresponding cluster offset
> +(in 512b sectors). Given an offset in bytes into the bitmap data the offset in
> +bytes into the image file can be obtained as follows:
> +
> +    offset = l1_table[offset / cluster_size] * 512 + (offset % cluster_size)
Reviewed-by: Denis V. Lunev <den@openvz.org>

