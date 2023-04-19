Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B8C6E7A51
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 15:10:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pp7Y4-0002u8-BS; Wed, 19 Apr 2023 09:08:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pp7Y1-0002tf-Kc
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 09:08:33 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pp7Xy-0001qo-Ir
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 09:08:32 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33JBcJCK027940; Wed, 19 Apr 2023 13:08:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=NToTNrnR4ns9QYxRHJXiUTBRXyhNSVOaAE1RxGvY8/s=;
 b=Mh9z2ChuUrObB6VD6g1n/d4mzzL/6UofL+KLUd/FtE4wY4807luwZ6WnthQKDUer8Bpk
 /vSr4XNNBwpf5rSr0VFW0CtjFQuVKNXghw9dUorByV6/wY0mRY9jzllvkcYheocsKUpT
 3ebWEkptdvL7BfEt4AwRfNzcocXNQTqzCuAtQa51Kfs6UF9Wp1vRHdUu89eTX97dpnd9
 dQxbNPUNmAUHWFcDOzSV7t4zOHXklgdoaO4daaRFyxgXhNTmvUQJFDWkV7ofSvkh7pe3
 pjhsnapAAqJQaKtQb5vKN0MNq43mf5MTRLA+DfteM/co84bi7zoa/YiC4AlkOHl4ZXcr bw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pykhu06cf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Apr 2023 13:08:27 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 33JD7nDI037887; Wed, 19 Apr 2023 13:08:26 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2172.outbound.protection.outlook.com [104.47.73.172])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3pyjc6wmds-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Apr 2023 13:08:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lzRgwZMBRCZTSIukz6h8V+wCuf28xCvfdJ/LPFDVrcYG05J0t04svcDBLH9JTpx5KlgXD/ChF7qoCTdIpvZkEbmctj2EOrcwDKPobsdDs2PCPD9pWWVz2HFv+qJonZsmOpdmefkOmpyWcynqPqC6K5pYV1OlI+4QuEXf6q4ED6efdn0RzpNfx9b2X2zX1RRddYv1a7uAfz1ILdtFcHYPb+8Z2rx6/y4aDqfAsK8pHHouUHxqrYshM/8T/5I7WSUgRQLhI5Pn6seiA0B1WzTAlfK7vDkKKee/w0It6b4XCOPeG8I+W0k41fT+XKlojJ1IFxBl2svpl/adihF1jlrHqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NToTNrnR4ns9QYxRHJXiUTBRXyhNSVOaAE1RxGvY8/s=;
 b=OJ1nK1yacX+aXSRZ4TYyruh+9jAHtH+qolEYaTYUtsqSzwaiz44HoFvIj3FTtb3pQarnfU95pzZ8LjUdmlaK7LzIv3LPCAvblNBRWLPSMbe9fcO0ZUbBJfdIvHAlkE2nWjPDTxScY9Rfv5N6uw8AL1zQGWzJk2ukkkPgKRC1AnnX4B6GifC1LQjtCWhHd4VF3UV/eEBtUg4Gdmmf+Mp76IPfdKHl/Wg81x8yipf5q9y48ruu4+E3DsRtLI9hDMmAu6n9hbn0fcR7fZIk5UELS3+kQ5RoQ1xwT1TG6PDlNQ/A5USz+PyMgS0ypfTrEFOnf3bHSpeC1WY/KPKtRkpuEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NToTNrnR4ns9QYxRHJXiUTBRXyhNSVOaAE1RxGvY8/s=;
 b=R5NuUuU/nzSNADdHKuj8yAIFsZ5M5axQuZwlp80YD8YGW8lTmu/nszEVcS/V3Jn1ElCQA/g2EZ2CzktWxx+2FEGApdpMDj0XzqSayRz+9pAQzqZdcWmSqiRJQKhcsFzpEqSL+l+Hfp9+IjtnqF9mjBhma9pr5bCWatKXPfvb6VM=
Received: from SA2PR10MB4684.namprd10.prod.outlook.com (2603:10b6:806:119::14)
 by CH0PR10MB4923.namprd10.prod.outlook.com (2603:10b6:610:da::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Wed, 19 Apr
 2023 13:08:02 +0000
Received: from SA2PR10MB4684.namprd10.prod.outlook.com
 ([fe80::7361:8416:8d4c:7733]) by SA2PR10MB4684.namprd10.prod.outlook.com
 ([fe80::7361:8416:8d4c:7733%9]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 13:08:02 +0000
Message-ID: <c151e75a-6c4c-25c5-8f86-0060a7b5f805@oracle.com>
Date: Wed, 19 Apr 2023 09:07:55 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: clean after distclean gobbles source files
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
Cc: Michael Roth <michael.roth@amd.com>
References: <bafc456e-34be-f2a4-71fc-e52ed964484e@oracle.com>
 <5caa18b7-9920-7867-77aa-5d9770cbde14@redhat.com>
 <bb433891-8f08-626e-21f1-e002f7a842e2@oracle.com>
 <c48c2c3c-3ddf-d11f-a119-0bc0b22176e9@redhat.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <c48c2c3c-3ddf-d11f-a119-0bc0b22176e9@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0015.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::20) To SA2PR10MB4684.namprd10.prod.outlook.com
 (2603:10b6:806:119::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR10MB4684:EE_|CH0PR10MB4923:EE_
X-MS-Office365-Filtering-Correlation-Id: 07e74a47-e5e9-4aae-560b-08db40d71b3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yQbswQtGhgJvIGuBSq9U5AhgApOpYrBziDgdI5elPelJasv22w3Ue/VUEmdWC7OR/Jb+U/KBQ4nIlNeOILvItMJn0opge2plnsf2fQrNUVy1xnu7sTTgiEKKIr3Sla0WY3FZWr4vhU3LydmjG0/Q25zYZK+owgzWxKyn7qIP4yaoxA/ZFtUO4sTpI0LPuWH/Uk6rB8QQbauSLucSpAVnbtmwV6S+tJlpwuo2rRWnQguelURMFGvjAbXmFVrhY3srojGSXtdBP67DLW73/bIj0gnRtSBwkLdDqpBAJhgljj1ArMwXloJi6OClg9m72IbFeyyL5/GchU6qAr2FfFCcZcsX9GyU3ifOTt0p3bfv1mZHT7iCoc6l7iFME+YVhsPiGAvQIoo2A/ugxtYMOYT6zC1o4ytz6CTnt5d3sugP0Z3spA70YNirC5qPepeTJmGwgL+8D5n1QB8x7qCrHgT4sFGyT13ksa+cl6m7z+U+DS9ANxsnATvqtRHTJYC2MaBxAzvxjzKEQUQs+4iirPwQz61T3EFQ/E8MsIvMC0kV4MWPVd+obcPRu69l+AS+qtaeEBMz3R3dbOyojWwJGZjp4RzUFQXoBmh37Y4TpVvGSYLM11Lvf7m43qeFiCF1TguunK10entKi7S0jWJx/Y6dD+H9m70bnGTvp0fZ4q1dnvc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR10MB4684.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(136003)(366004)(346002)(376002)(451199021)(66946007)(66556008)(66476007)(4326008)(478600001)(110136005)(19627235002)(316002)(8936002)(8676002)(5660300002)(44832011)(41300700001)(38100700002)(186003)(53546011)(2616005)(6486002)(6666004)(36916002)(6512007)(6506007)(26005)(31696002)(86362001)(36756003)(2906002)(31686004)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2ZXd3g5MEdlc3VlSjF2RWhxRERyU2lpck5neWdtcTJoaFh1TUZzaXdmamdw?=
 =?utf-8?B?SlJIaFRja2Niclh0c0FkSXN4WHR1S2VJckNMRW9oSHdkb2JPajQ0UytjY0lV?=
 =?utf-8?B?bWtNakRXMVRHelMxVmZxRUdHNWNHbXBPZWozOXdzVXpoSHNRWDg2clJSdjVj?=
 =?utf-8?B?WWxOZ2xHS21QeGEzNmNkYlhOeVhjczVKandGRUtyMGtQaXBMckpFL1pyUjFK?=
 =?utf-8?B?Y1dzbmNTUzhkV3RIdzZ5Q01xQ2doWXdnMzN4QnVmeERseE9VZ2p6VW4rVXhI?=
 =?utf-8?B?ZDJKeS9tYkpuM25ySEhsbWNYOSs5Z2lGUWd2bmN5VEdBc1JBc24vYmNjek1C?=
 =?utf-8?B?WFZYdlNXN3A0R243Q3dkN0FRaTg2Q3MxME9XK083ZnM1QnpYd2tweTFHakFk?=
 =?utf-8?B?OHRGTm1IRXk4aXdybTJWN054VDZvOEJTaDE5SXplSStqS2V5M3h0dXg0WHhN?=
 =?utf-8?B?OEJxRy80dWE1eWNtVzAwR09hWUJ6dmQxNDlSdmRjcmsxYTVuazZ5WDh5RUw4?=
 =?utf-8?B?bFdCdVl4eTNyVTNQT3djenN1Q3dmd0p4TUx1UngxZ3RobjI1Nk5BQUVCQnBE?=
 =?utf-8?B?Q1l4NVpmamJMWU9ZVGtyYm04Q3ZwUkt2elhReUluckFHQWp5Nm9hSjQwUkdZ?=
 =?utf-8?B?R3RYZkpIcURVcFVYRXROWDl5MGtLbU03NWEyQzVNa0p6UWdaNmc5RDhoL0Nj?=
 =?utf-8?B?VTVGWUpKQlViOGw3c1hWSVVORm4yanU3L09nWkQ3SkpNM2tnTE1WZ1FIVjJl?=
 =?utf-8?B?Y1Vqc0RWRnJYYndpY0dOOVRISGlNclhOVXRlSWxZMmE5U1dqQ0JCWFVqcXpY?=
 =?utf-8?B?cUp2dGUvWFZjOEg3WEpEMmVwZ2hucmhQYW9OcjRwUWpITktHMDBQTFd0dTZV?=
 =?utf-8?B?SE1sZ0tlL3EzOFBsTDZQV3dVZ3VhRDFNOFVoQUoxcDVGb1o3NEMyeExxejFo?=
 =?utf-8?B?c1hrQ2FRRUxDNUlxbTd1Nkx2ZjZkVmdBRWRaSmJMajJHZzVyd0pzNHl5eTNF?=
 =?utf-8?B?OS9iYmRTSVAvKzlLWGN4OXFMcUR4TXpSYW1MaVhsby9sSkRmeXlNcE1TMWF1?=
 =?utf-8?B?eEpzR0tVNEZreVcvUTRUU1FwMXNVandERTJkdDFNcUdWaFV4NW5XYUxWeGdE?=
 =?utf-8?B?UVBSREQ2cnEvRi9DcEw5dHpvcHhLV2FVL1JYQ3RjT3hHSFJueCtrSmllRnpE?=
 =?utf-8?B?cjJtZnF0TzNnWXdKc0lNM2NiSWkwSjNJZmtiTkxSTzZlUXhmUUQwNHRUbmZB?=
 =?utf-8?B?WDhaaW5OYzNZQldyaythNUNpVlhkQzRzYUF2OFRmUlRuRHpyOXJuK1FYWXZs?=
 =?utf-8?B?WHdWcmMzZXJhOG50NVNsbzNrZks0RXNwQXgzNHprcTNLMXBzREFaN0xyVXll?=
 =?utf-8?B?OHJXUjhiTDU2L2FRaEI4aTQ4dTdFUkg0aGk2VGM3bUJUQlpOZFdHei9LV1dK?=
 =?utf-8?B?ZHVBWDUzdUlzLzVwTkpFYnArclRxa2RpakpIL1BNL3FSVjBFRFRFSnBVOE1o?=
 =?utf-8?B?OG5jTlRNS3BTVVpSUHRUWHFYMGlqQUR4WjZrV3NhYzBFT3pxaG9xNjgvR1Nz?=
 =?utf-8?B?NkdKM0hrczZCQlJvK25vcWsyMnh5Z1g4dmNEOVNFSkQvSE1wY0ZUS3BvamtD?=
 =?utf-8?B?eWxSa0NQM3VtRWJtTGZLUHlXWSszemZTZVVkZSt4Q3ZNeWx6NkpkUW5mM3Iz?=
 =?utf-8?B?SHAzcFc4WDNtaXRzK0ZHelJDWjJ3bzZ5MXBXeER5dlZ4ekdjNFpRUjFDd0tl?=
 =?utf-8?B?ay95YlpnZlBjb29LRUJXekdQNHN5ZnpnZzBxTzVpd0dER2dWT3RtZFYrd3V2?=
 =?utf-8?B?ai8vV1cvZ2wzb1BwOHhaNElXaTJiTFA5WHEva3N1enVqNThGMTBqTFNKSWpa?=
 =?utf-8?B?OGVhQW52VkFINXhJMW5wNW0wME90S2ZGRlAxeGNncGVLT2NhVEIwTlphalhC?=
 =?utf-8?B?UmNZYktWMzVuTmp0dW9lcEJpT2o4N1VFL1lNcHZab2lqVWhPL2xjRURYVzhN?=
 =?utf-8?B?SzBVcEI3b3A5NEdEeHllblZlMXRwdFh6NUNQRWYxdktrNXJjUjd2WXo1cS9O?=
 =?utf-8?B?Qmo1cEdMM0s1TG90YzBzSUpqUjVuODlsdXMxVjVqUjNSb240NWJ1RVZLek1D?=
 =?utf-8?B?ajdjQlkwTnFRWHU5bzdqWEx4LytHUTRqSk4wdlAzQ0dTd24rT2pkajE5czVx?=
 =?utf-8?B?TEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: wl6G7yRhhSDGRUVAv3/GXqIRBPMrT7FmudGc8cRjcSAaum0gNvB5b9JbE8xBse7cFTRxF74qe+UobIMk5F6JcnRA5cjUvK+lX5u3APVJV/nWDvPqUrPSvGj9yPlgxpgMcEGy7q5qVMJw5oQOCLoPtGMevQKg6ytqYy/ifsVWpGYvQ7nPsPrcnDMakDmWVnuLhYQNjOO+CbL+U5M1PJMsxJsBciszrJQiFBD0YGLeMFpeJ6ZNpjI7Q3wjflYuILPNzOEyhrshD+yorn6TloYmjnG+fNgHM2ksaEzhLnQqRSSUk30a5ClQ0hPtRxrkDnUdE5QSD9/SgVWlu3aQi0XixbseS3qBr8t/JQJdutjAo35L87aitlCuQsVq+MbxXDES4MohbvWSB3W98+NJrIHTrNm90AwcjLpC+cJZRjyYqzEoJzZWXCbJxFOOsvGtx0JefGrXlu7FejHNW88s+xXnqnpVWhSPTbwqs7ABbSQLnpcBVr5+sKHJud8xlw4uiEx9V0VT6oqodWQBfJDBaSNAqXY/qkK90SGxZU3jLLCugC1zBU0FFGor5To1J0eC110Ps62YdJbP+U4nz74AWp6uquSG/VhpimaLioHk0PUTqIhXjXDDw48kCOsv4t1I7160lVh+tcUJlNd2O/DbmdlMsACQn47E5oAvIVgB8wIUSsbRqfjj1aKZk3GiP3eolTHHQwP26N+8qsL/SqurRu4CmtZp2talhqk0c3OFd7X/0Cf+Oh5b+rRRuCGj4rMUi9+JUf6FfGF/JJ7sc8s+m/nBqJfBW0xc+VBvWPFnQPwhYUmUHaustg3BLovZztTGsxk7063nDwq2TZs2se6bamqdSA==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07e74a47-e5e9-4aae-560b-08db40d71b3b
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4684.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 13:08:02.5713 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bbk37M7USiVge8dKY8PSlMVyD5SNINiZCI3EuuVwGGYWJbM6GcM43MiuJ9li4Ny9+v/BmyJqOiHtjpX1YDd++vcDHsn/qTyrSJXXDAdTujY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4923
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-19_08,2023-04-18_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0
 spamscore=0 malwarescore=0 suspectscore=0 mlxscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304190118
X-Proofpoint-GUID: kFFv2mCreZDXFuFv46KdV_eU3frMWHdp
X-Proofpoint-ORIG-GUID: kFFv2mCreZDXFuFv46KdV_eU3frMWHdp
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.597,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/14/2023 11:41 AM, Thomas Huth wrote:
> On 14/04/2023 17.30, Steven Sistare wrote:
>> On 4/13/2023 7:41 AM, Thomas Huth wrote:
>>> On 07/04/2023 17.44, Steven Sistare wrote:
>>>> Run 'make distclean', and GNUmakefile is removed.
>>>> But, GNUmakefile is where we cd to build/.
>>>> Run 'make distclean' or 'make clean' again, and Makefile applies
>>>> the clean actions, such as this one, at the top level of the tree:
>>>>
>>>>       find . \( -name '*.so' -o -name '*.dll' -o \
>>>>             -name '*.[oda]' -o -name '*.gcno' \) -type f \
>>>>           ! -path ./roms/edk2/ArmPkg/Library/GccLto/liblto-aarch64.a \
>>>>           ! -path ./roms/edk2/ArmPkg/Library/GccLto/liblto-arm.a \
>>>>           -exec rm {} +
>>>>
>>>> For example, it removes the .d source files in 'meson/test cases/d/*/*.d'.
>>>> The damage could be worse in the future if more suffixes are cleaned.
>>>>
>>>> I don't have a suggested fix.  Recursion and the GNUmakefile bootstrap
>>>> make it non-trivial.
>>>
>>> That's somewhat ugly, indeed.
>>>
>>> We could maybe disallow make [dist]clean if running in-tree? Something like that:
>>>
>>> diff a/Makefile b/Makefile
>>> --- a/Makefile
>>> +++ b/Makefile
>>> @@ -26,7 +26,7 @@ quiet-command-run = $(if $(V),,$(if $2,printf "  %-7s %s\n" $2 $3 && ))$1
>>>   quiet-@ = $(if $(V),,@)
>>>   quiet-command = $(quiet-@)$(call quiet-command-run,$1,$2,$3)
>>>   -UNCHECKED_GOALS := %clean TAGS cscope ctags dist \
>>> +UNCHECKED_GOALS := TAGS cscope ctags dist \
>>>       help check-help print-% \
>>>       docker docker-% vm-help vm-test vm-build-%
>>>   @@ -201,7 +201,7 @@ recurse-distclean: $(addsuffix /distclean, $(ROMS))
>>>     ######################################################################
>>>   -clean: recurse-clean
>>> +clean: config-host.mak recurse-clean
>>>          -$(quiet-@)test -f build.ninja && $(NINJA) $(NINJAFLAGS) -t clean || :
>>>          -$(quiet-@)test -f build.ninja && $(NINJA) $(NINJAFLAGS) clean-ctlist || :
>>>          find . \( -name '*.so' -o -name '*.dll' -o \
>>>
>>>
>>> ... or if we still want to allow that, maybe just make an exception for the *.d files:
>>>
>>> diff --git a/Makefile b/Makefile
>>> index e421f8a1f4..0cb2a7aa98 100644
>>> --- a/Makefile
>>> +++ b/Makefile
>>> @@ -208,6 +208,7 @@ clean: recurse-clean
>>>                    -name '*.[oda]' -o -name '*.gcno' \) -type f \
>>>                  ! -path ./roms/edk2/ArmPkg/Library/GccLto/liblto-aarch64.a \
>>>                  ! -path ./roms/edk2/ArmPkg/Library/GccLto/liblto-arm.a \
>>> +               ! -path './meson/test cases/d/*/*.d' \
>>>                  -exec rm {} +
>>>          rm -f TAGS cscope.* *~ */*~
>>>  
>>> What do you think?
>>
>> Actually, all make targets are broken if we do not cd to build first.
> 
> I think some of them work from the source directory, too... e.g. "make help" or "make vm-build-XXX" or "make dist" ... not sure how important this possibility is ... I guess "make dist" is still a thing? Michael?
> 
>> This should do the trick.  If you agree, I will submit a patch.
>>
>> diff --git a/Makefile b/Makefile
>> index a48103c..3d03101 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -4,6 +4,10 @@ ifneq ($(words $(subst :, ,$(CURDIR))), 1)
>>     $(error main directory cannot contain spaces nor colons)
>>   endif
>>
>> +ifneq ($(notdir $(CURDIR)),build)
>> +$(error To build in tree, run configure first.)
>> +endif
> 
> If we decide to go down that road, I think you should remove the existing "Please call configure before running make" UNCHECKED_GOALS logic in that file, too.

OK, UNCHECKED_GOALS is supposed to handle this situation.  I will post a patch that does so.

- Steve

