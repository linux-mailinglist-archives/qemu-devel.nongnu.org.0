Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6DF3C618F
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 19:08:51 +0200 (CEST)
Received: from localhost ([::1]:33656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2zQI-00027M-Sr
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 13:08:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m2zOm-0008Kn-5k
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 13:07:18 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:49230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m2zOj-0005Xn-Pf
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 13:07:15 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16CGv7QX003725; Mon, 12 Jul 2021 17:07:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=rdjB6i8ipvWyPdtHnLhFFFnOGHaHVUBZj1nQVg+3n+I=;
 b=OSKX77qRWV0iIXlcED4K78jM7iENV2fGwNpKOSyfmmDqmVYvFSYHXOxEmRYP791xndJ7
 Vv7XmDj2QUf4iOHCnYlgUAu3H7t2EaurMzI1cfJ9fU9i4gajK906NGmb5XV3D9D97AZL
 MDke0/XRHwLIy/szg8IS2KBLaMX6CP0iTEF+YW4RwrvY5FuIcvYi7bTsBB/lnh3ejgPQ
 FddoRjJ8lGL92Z/nfMsrqppnlyeL7t8aNZ7Cw0Sf/bwr7eDG4IF7PktyzRAzNhr2grMP
 etO5wcsU8l5diOcGy1lWSgkDAvL43syE93xrG8cLRl365zDfoTiV0O4dYVy3ggscAhFv fA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39rqkb0cx9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 17:07:06 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16CGtBlL065118;
 Mon, 12 Jul 2021 17:07:05 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
 by userp3020.oracle.com with ESMTP id 39qnaum7p6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 17:07:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=clmhsLHjqDj6QeXQ4OXJCpu9M/AxaugW9q6qYRRqZWi+fYbZK0YsjEPBJ0XQFukDEqi4CV7KHWNAqgOH7Dt5iLKUKAUAgFIxiiY7qEo0dTbpkm8RstBGeQpr7iqb6frjYS5ICThcUqroSHGFMH/nVOTNrtJfcQSMHbfIDB4cM0VQbapbsK2GVM1BfhMBV1S2Vl9VJQo3Vd3KmEkUVshwTa0dvqHFCU2sqotB6lT6qYJl+scqYc6o50J+uUui0ohiFr+fe+EsKz4bK/h8aZODwFHje4voS32gi5txdA/H2hVEul6ISzHswxJXXufyr7yns2+zeW0dxtdmpj0GC2MF/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rdjB6i8ipvWyPdtHnLhFFFnOGHaHVUBZj1nQVg+3n+I=;
 b=NH02giU1+p7wKm+RG8ifQyPgb89qqXrIhrJelc1DKIGCjeW1xp1lqb+caHB766UlmmKCDGazhtOW7geBZZT02P89aKD2aAMIKdF0EcuLc5UYH2+TGluaCN5A5UW4BpVbuQyJDZrj+GdOFrH7gndq0qK0b7q90dj1DwmeT2GELRRuGvy0AUnMDI3SJ2Jurfh9yGVVFZeLkpvcwqWi0NberWiAejTjQyxw5wX6VkObtkJPBaEhnralITNxB8UJz626sVoA43POm5pfL7ir+gWOkQOJZJzNLK38/RTd5fW1LZeOde4EQNhQQJKi2tBODtV1k1sj4JL26ZnqgeagGm98bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rdjB6i8ipvWyPdtHnLhFFFnOGHaHVUBZj1nQVg+3n+I=;
 b=xzjL1+SQ3yI5UvIf4SZBIeOYgTEbDeR373yXG6G/PxJA6O8uxGhWwtBCvYYs2229PCmMfHa//W9Ja1GalL6fRQiQ9KHBTMCK4ljHx9CrmxYED4RDWp2dokWWE/tGyWau+SZaVowbda02d5pgAyZNSugk30LTTuD3p8AwzZYqKZo=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by SJ0PR10MB4638.namprd10.prod.outlook.com (2603:10b6:a03:2d8::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.23; Mon, 12 Jul
 2021 17:07:03 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::a00d:eb40:2bf6:8812]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::a00d:eb40:2bf6:8812%7]) with mapi id 15.20.4308.026; Mon, 12 Jul 2021
 17:07:03 +0000
Subject: Re: [PATCH V5 01/25] qemu_ram_volatile
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
 <1625678434-240960-2-git-send-email-steven.sistare@oracle.com>
 <CAJ+F1CJ+rOSfuvpmF=u-HbmWxKkA-F8cobww1b4M-tnZO=ra5g@mail.gmail.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
Message-ID: <6de8ecd4-fb59-b5cc-1e75-12b7b844d65e@oracle.com>
Date: Mon, 12 Jul 2021 13:06:58 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CAJ+F1CJ+rOSfuvpmF=u-HbmWxKkA-F8cobww1b4M-tnZO=ra5g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR13CA0149.namprd13.prod.outlook.com
 (2603:10b6:806:27::34) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.92] (24.62.106.7) by
 SA9PR13CA0149.namprd13.prod.outlook.com (2603:10b6:806:27::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.11 via Frontend Transport; Mon, 12 Jul 2021 17:07:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db35a15e-f681-45c4-5610-08d945577829
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4638:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB463883EDA14DD1AA33763EBBF9159@SJ0PR10MB4638.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c8FB2nOj1DvlonZURl5+KQPOD5nlAZgB5bRMC7IA724T9kCxhT7Rl2n1ay0HMAgZQlgOwjn55Nd60piBVdLuqun2asxHjJg0NGgHuRl6vicUW896qu3qHb1W+nSRRxyemTu7Ex0fACqzEvv354onivDMaLME/0G0E5DTAKR8L1wP44ZJux7b+VLMGJcNzzqyvypiCsyP5Y2qnFMnve4raquSs3eLg/KNavdphMW6E3GFe1moNWbjrON11+bC55ImkqvOXj9iZVjgtl5VTL2UJjLHz/polJMvccvJYJKnGymY9jIf6UtzP0qEXR/X/+TfGyNIu7PVULYDSpTQzqTdgm/m9ACe3s16m1bQUrCDvDAk75d0/oB7LQ5WF1Z7TOUNHMq0mRot/HOzjfkfgFmRkuWPEKD7yFRubiWvou2eZmQHtyKCs9xTigk2TfPISn/sx+IipzYdG01PrTwQhgF4dvzAnvCaLjxHUh5nYXytxEkKlSRj/V6wmCZce4ndzg5tyEHv2SFQqqKkUWNxlVqVWXJOqIrlfypNBFfvoWc6ByO7MDeDN0BxdiHao/a+OxLOzgpEGOCDXCdx1i8kMFX8JjmWdKLb5kvG80DR+ITvt4J3opnxrMHyst6ifITfVxfX3tTGJsaPT0En7aQ90w7TE2ciS5DC6y1eJWC+UoaD2JcbouMS36kqV5sQsN4Re2Ld7VkhbjvkxEVlBG8QiQ9CN/5DuzFNebUVXvu0Q6c9n2k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39860400002)(376002)(346002)(136003)(396003)(31686004)(316002)(8936002)(16576012)(54906003)(2906002)(44832011)(66476007)(956004)(38100700002)(2616005)(31696002)(66946007)(66556008)(8676002)(86362001)(36756003)(53546011)(478600001)(186003)(83380400001)(4326008)(6666004)(6486002)(26005)(7416002)(5660300002)(36916002)(6916009)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWx3V0swUkxadERQNlV2RnFTRStTMk5UTjY1SnFBM0pTV3pVK3JhMzV4RnVU?=
 =?utf-8?B?V003NTFIRHBlNFEvS0phUGI2K2ExUkJ2MnlsVTIvNDZPUTdPdS9sbENDUXFN?=
 =?utf-8?B?NFBYT2VJdG1ROEJ1SWVtaHdoRStHQVlJb3dVM1JIcVRqSUxGQW1sZXRFU2VJ?=
 =?utf-8?B?b29wTjhoR0FQRStYL0pyWG4vYzVmaG5aaUNjK2NlWGdsN0oxME9ma2Jwc2Ry?=
 =?utf-8?B?UTF0WWloSXdPdDQ1UDJlQ25kcE4xYVcvVjJoSUI4MEljTWkwcXJuRWVjWG8v?=
 =?utf-8?B?VUI0RGU4VnlZWlRFVGtKSVRxSFNsaWp0MTdTWVdrb1Z5NGxKaHFudXVKT1VC?=
 =?utf-8?B?VXg0c1hBOUJIaUR6S3ZpVzVxaU43ZTlycWVWTjlBUVVCQ1M4bENJcmFSUTMy?=
 =?utf-8?B?RXRSeEJSNWYyTUwzUTU0VUlLWWRYVjVhZTVZT0FIR1hQVUt1WGNEaGhzU3g0?=
 =?utf-8?B?STVLTnEwWTU5TEo2djl5MmU0bVcrSnVtaEVrYk5EUXZsM2Z0WUM5ZDIxdnRX?=
 =?utf-8?B?OHVnaVFZQUYvTXN6VkZsNS9BQUsvRUljeitRVGd4eWpXM1hsOWV2WThHQzRx?=
 =?utf-8?B?T01uZS9Lc3VKTE0raWVsU3Zzdnltdzc4Mm4yVm4rQmxPL0VGTS9EbDJ6bjFw?=
 =?utf-8?B?Q0xHaDZObVBOM1JMaTJzaktGU0sySmIvT25GVkdmU2FJUlB2NHNzang5Smx5?=
 =?utf-8?B?cGlkNFM1TEJ4U3RSb3ladHBva1ZXb3hSSFIvenM4bU9OYXZtRWFHcWNNMHhq?=
 =?utf-8?B?T0wyWTRCdzZJNzhZeUtBc1JaTGg3NTlwMDdzSGlMOFQ1dERRSXZTZzlOM3U0?=
 =?utf-8?B?R1FJcng3eklLRFpoT21SZk1rWnczdnJtMTFpRWJEaWRxbnpJQncvRGYvVm95?=
 =?utf-8?B?elhGWVY4SkI2ZlBkenRWZGQrRkNwSkdMREZGZmNENkp6aThMNEN6bUw0dWZ3?=
 =?utf-8?B?aGswMG1STEl5Z0ZaemNxYnhZQnB4bS9lQ0pja0dqaHBrZWtWSEZFcXhFSHl5?=
 =?utf-8?B?eUwrR3pLQkhGYUkwNUxOZmVaRlk3dFBUOVhQU29aSklDT0V5cVBzcTg4bzY1?=
 =?utf-8?B?ZzN5UXZINzRvMFgySGthOEkwVXVaNW96cmo3QTVLQVNubVNieDJ0dXdyVUJM?=
 =?utf-8?B?bkp4NTdkd1J0M212OW1mOWJpSHMvbTNMVUZMSzA1N2pock1VU2xsMTAzK0Jl?=
 =?utf-8?B?MW5qUCtsVy9YZFVQM2UzMHc1eGdZcVQ0aXNnV3JlOWFpS0lvRXBUcEZteDJR?=
 =?utf-8?B?Y3ZWTXN1MTNzVjVmb3REc0VFTXB3Qkp1SEVWT3VCYmlBWnZlS3R3eWw3WEZG?=
 =?utf-8?B?dElNYTM3SDY3OTl5ZHJUMzE2VHRCcXI0ZGRJdi9ZZ0dMTm5HcnV3QWVqV09m?=
 =?utf-8?B?WitHdkxIbVJhRGtNNmZuZGtUekVNUGJkYUZZdU4yQ1VqZVZ0ZDNDK0pucW9Z?=
 =?utf-8?B?Q0ZVSE92ZWZKNXcwTlhObzJ1MlpZNDFld0hiQnhqb3NoUTk4NTllSXZOUDBX?=
 =?utf-8?B?QmgwRG8veTZQb3BaTjBmUmJRbjhxZEpMaUIxcWVaZWdLY3JkdTQ1QllHd0hy?=
 =?utf-8?B?WklOeUZUcmpKbGl6UUlQcDFXbWdQenFQb0hmcVdpdUw1MWU3MGZVNmhoTWJN?=
 =?utf-8?B?ZmYxZGl6TVArV2RGYi9ORDdFMkVxdkgvQ2JkR3FBSDdITWpJUHhCUmI0N3hL?=
 =?utf-8?B?ekI5RHpEOEZkYnVORHFxOTNRek9SNmUzWXh0RlJPN2JpdTczN3ZTYVdYVDZY?=
 =?utf-8?Q?VBqITh7LqXmb/ymLcX0zFJ8PmbtiG/1big0iPhk?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db35a15e-f681-45c4-5610-08d945577829
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2021 17:07:03.2100 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0pUKmP/nO94YqVeS23CMakfHz/3hSGIb4tYCzWyl+ZPTq5zeFMzZnJ8wx4T1CojqOE1zDb4j6i4w+q9J9jDKBqBWkREtYZwzKcgY5+t5wNE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4638
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10043
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 malwarescore=0
 spamscore=0 suspectscore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107120126
X-Proofpoint-ORIG-GUID: Gkq6dXPGo8ySTrDAJmV-vIBAFNpq3x7T
X-Proofpoint-GUID: Gkq6dXPGo8ySTrDAJmV-vIBAFNpq3x7T
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

Will do for all comments - steve

On 7/8/2021 8:01 AM, Marc-André Lureau wrote:
> Hi
> 
> On Wed, Jul 7, 2021 at 9:35 PM Steve Sistare <steven.sistare@oracle.com <mailto:steven.sistare@oracle.com>> wrote:
> 
>     Add a function that returns true if any ram_list block represents
>     volatile memory.
> 
>     Signed-off-by: Steve Sistare <steven.sistare@oracle.com <mailto:steven.sistare@oracle.com>>
>     ---
>      include/exec/memory.h |  8 ++++++++
>      softmmu/memory.c      | 30 ++++++++++++++++++++++++++++++
>      2 files changed, 38 insertions(+)
> 
>     diff --git a/include/exec/memory.h b/include/exec/memory.h
>     index b116f7c..7ad63f8 100644
>     --- a/include/exec/memory.h
>     +++ b/include/exec/memory.h
>     @@ -2649,6 +2649,14 @@ bool ram_block_discard_is_disabled(void);
>       */
>      bool ram_block_discard_is_required(void);
> 
>     +/**
>     + * qemu_ram_volatile: return true if any memory regions are writable and not
>     + * backed by shared memory.
>     + *
>     + * @errp: returned error message identifying the bad region.
>     + */
>     +bool qemu_ram_volatile(Error **errp);
> 
> 
> Usually, bool-value functions with an error return true on success. If it deviates from the recommendation, it should at least be documented.
> 
> Also, we have a preference for using _is_ in the function name for such tests.
> 
>     +
>      #endif
> 
>      #endif
>     diff --git a/softmmu/memory.c b/softmmu/memory.c
>     index f016151..e9536bc 100644
>     --- a/softmmu/memory.c
>     +++ b/softmmu/memory.c
>     @@ -2714,6 +2714,36 @@ void memory_global_dirty_log_stop(void)
>          memory_global_dirty_log_do_stop();
>      }
> 
>     +/*
>     + * Return true if any memory regions are writable and not backed by shared
>     + * memory.
>     + */
> 
> 
> Let's not duplicate API comments.
> 
>     +bool qemu_ram_volatile(Error **errp)
>     +{
>     +    RAMBlock *block;
>     +    MemoryRegion *mr;
>     +    bool ret = false;
>     +
>     +    rcu_read_lock();
> 
> 
> RCU_READ_LOCK_GUARD()
>  
> 
>     +    QLIST_FOREACH_RCU(block, &ram_list.blocks, next) {
> 
> 
> RAMBLOCK_FOREACH() should do.
> 
> Or rather use the qemu_ram_foreach_block() helper.
> 
> 
>     +        mr = block->mr;
>     +        if (mr &&
>     +            memory_region_is_ram(mr) &&
>     +            !memory_region_is_ram_device(mr) &&
>     +            !memory_region_is_rom(mr) &&
>     +            (block->fd == -1 || !qemu_ram_is_shared(block))) {
>     +
>     +            error_setg(errp, "Memory region %s is volatile",
>     +                       memory_region_name(mr));
>     +            ret = true;
>     +            break;
>     +        }
>     +    }
>     +
>     +    rcu_read_unlock();
>     +    return ret;
>     +}
>     +
>      static void listener_add_address_space(MemoryListener *listener,
>                                             AddressSpace *as)
>      {
>     -- 
>     1.8.3.1
> 
> 
> 
> 
> -- 
> Marc-André Lureau

