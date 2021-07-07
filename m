Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E15E3BE817
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 14:38:04 +0200 (CEST)
Received: from localhost ([::1]:33088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m16oV-0001qw-LM
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 08:38:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m16nK-00016k-2b
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 08:36:50 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:4826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m16nH-0005Vc-3m
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 08:36:49 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 167CFqcI014051; Wed, 7 Jul 2021 12:36:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=4tz0ZQ/k3+OPJ9j+fN4jvxffzqLEOUYJxiSJa3qFhUM=;
 b=W4LR+KQeGF6xQ8Oi86wPO1ppuvBDqpKKshXRoCilDqPxbklGQDp5Ts6qzOqSk6t2V85T
 XQOvRDVRLMu2u8lFFFx5gCjVlEe5Kz/osrDiTlvsOPrVKk/qnEr2O305Dsb1yzhz4vKk
 jf5rdzbNnsPd7m1rcWq72qPM9M4NIBE48yVGr2X/DXsv9THrCJdjDMrTb43CiyjLjmIS
 JNqpr8a5VhS30X8DJG/oBHdPhtLBKor2xjD751T2Xgo4HjOO3EzOsCDPxW2joDKUvKYR
 hgwy1g9xghhCqd6H5+Jk2JfGT4E3LpbCQke0yqEl5sAxHerY/Sv8GBGQ3Glvg8r39p+G DQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39n7wrrjep-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Jul 2021 12:36:41 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 167CaZRU073232;
 Wed, 7 Jul 2021 12:36:40 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
 by aserp3020.oracle.com with ESMTP id 39jfqag9mj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Jul 2021 12:36:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HqdEMcfj+GMWk+PxwJaTg497Me/80onJnphKs6K7igpR3QqjefPPDxT/dEXlfupybT+9VIqusNHdnzh/NCawLwnsIESNNjGOekVwcSVP8hxQap7QfunQpHR7bxSYGQzt4Oz+I96i+QZZjRgE579PUFBAhX3v4kZES+JFZN25OfWO/7vIDW7UvBBlCCXBOCdQti4OMDLdOHtijPzNYj1doVEBWfYMJp3xK1DSxMWSgQWfXawlE1v7xtV+g/fe+fgDTA5XyKpU3umJyzY8w0KjELqZK3EsvZZVdYbu0Am/BcpN416OqrlCk56x230QUepkmGFmkkE96EkLrNG8CJQfYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4tz0ZQ/k3+OPJ9j+fN4jvxffzqLEOUYJxiSJa3qFhUM=;
 b=XVijIbSVbwJ5hYhfrgfoZc1S1OlPUyMFtsrQTqJhz8/9tMkigJytuzeI3E8rdC+UfrDzgAeCJERz+jOZr89upQJih7wHnGHxbV5FiYpao1K5GiHb3n00xEFLvBOdbV7c+JVLi+nXRz5+Qc9zNI5I10GGciJ2ZRCVdPeVUlJSScJCHjxtoGYwCVOjZmqr7PUCNW0Od+M0Va9m+eStPcbQ+m5mUJYk4v7YttoTi2nAmKaQI3SYElonrjjiTCuRpOGXYthIthhy/MUd8+mAilE0GOQ1DR80hwuYXkL7eU46bboFx6ljbnpe4HIq/407oe0m8jkudiZTc0lIScc8mYR+wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4tz0ZQ/k3+OPJ9j+fN4jvxffzqLEOUYJxiSJa3qFhUM=;
 b=mt4LSLA1g1r3cq0DlTkxSgHRDlgQHk0WbHjn2EYT7BexZaVzsy/ACh6J75BjCPQixAZ1MK7HWn6WhZFq73i4xP5M1F5EJiPO1SUNJPDRVkMEv7J9mLE7bVFxOfwqmPJWFUFD4Y9Xvk3zRYO1RPYijDC219jVYff5TE7FbdyLeAc=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB3528.namprd10.prod.outlook.com (2603:10b6:a03:124::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.27; Wed, 7 Jul
 2021 12:36:26 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba%7]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 12:36:26 +0000
Subject: Re: [PATCH V4 00/25] Live Update
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <1625589956-81651-1-git-send-email-steven.sistare@oracle.com>
 <CAJ+F1C+SvHq3w78vevxMDUi6SFD_E_HnOEqapJFVBQAZp=ZxrQ@mail.gmail.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
Message-ID: <6b100daf-ef09-ad6e-cd5d-42acb75c0f59@oracle.com>
Date: Wed, 7 Jul 2021 08:36:22 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CAJ+F1C+SvHq3w78vevxMDUi6SFD_E_HnOEqapJFVBQAZp=ZxrQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR08CA0026.namprd08.prod.outlook.com
 (2603:10b6:a03:100::39) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.92] (24.62.106.7) by
 BYAPR08CA0026.namprd08.prod.outlook.com (2603:10b6:a03:100::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend
 Transport; Wed, 7 Jul 2021 12:36:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d5c3fdf-d33d-4ecf-fbdb-08d94143d648
X-MS-TrafficTypeDiagnostic: BYAPR10MB3528:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB3528EA88E037D31597B02F80F91A9@BYAPR10MB3528.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:639;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1eLaaTq/VkjqlP4NaGJLjlowFOYMkpp2JflwCwgV5heW+yPzGpwuGH0YkYfMSmjsHSjWsIPNhQRgw+AFw7GGVXHWME54OtAlDDWvQJEQmyOZg5as3bAGHjWgYa4IlfHlt2V58nBnVQzcassZdYDn541bd+171eKmsW5m7asnKHLBZtp+F+bCZ75F5p3mWzk5YiPv6l2TaTA6F9d54JrzHATpUp7AfNiw3zR94xQZQOyY6Xz7eCzRG/64jiG4Du8BWLmmU3Od0thpnJAzkj60O+uMCtBPQ9Nz3KoaLPJH4rkObOKK02OnAp6+XrichAXY0tS6EtE/iQ1kNg9Q3Wr2Kqmncav5aK5rg5ZgUQkc7BxHHQzWv0iJcXd4SE7P5nUCkHRAnAFpmLt6usQ/SlxErH/QuS0x73SR/XJf2Ki0yoipgemiPydVNxqKQiKEtC/MiTX6EQmHu5TvOaa9ajFEMcifch9yzvK3zAWVQ03Dc8rm6+mSJFK9OjK7Wfi4AxD9LXmDn7ualOdAkqpeSl1GSNDrWEISd0RCE8CW4hyKpDBvlrFcjWtY0OBM4MA5pFWpyJ+P9CpC7MgKd9UWv/76e+nIsDCzHXes2So5J1V9iWeGHTDuFG8AEeQUIgEuinZ30avt7hYWDg7Dvtc4i1lvvZGds1iAWpfhelCsMpyeNRz73rwNKrxoBYZBhmbaglWzyBnjWgq1tmG/K+qXgOR5My4SK3jLxUQRNdnilU6u61s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(376002)(136003)(39860400002)(346002)(396003)(66556008)(8936002)(4744005)(38100700002)(7416002)(53546011)(4326008)(31686004)(2906002)(44832011)(8676002)(66946007)(186003)(26005)(6916009)(956004)(36756003)(66476007)(2616005)(6486002)(36916002)(54906003)(86362001)(16576012)(478600001)(5660300002)(316002)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzRlZmhrRnRQenYrdDl3OEdWT3FpeGZMYnRkRkVyQ2pSUTFBeUJUU2J3QjRi?=
 =?utf-8?B?cHJ2eEVweUNNNzJ4anlDVXBZODUyUXUxb2Z5NFN2UEVjNjNncnNrQkZDTVJy?=
 =?utf-8?B?ZkVHNm82MmthRHRUWXltWVZBV2tNYjEwTlh5blVJQjM1YW5FdzNBbXdYaWRB?=
 =?utf-8?B?WGVkSkV5VUg0YmxTREFXNnpDTmNPTVY5TjNNTHRIOWN4R1RXZDFtUmM1cjdy?=
 =?utf-8?B?anBIb3dXUUFWbWdXS3l0WmpOUWRGZjhoY2F3cU9XakgwczhzeFJ6R3Y0djYr?=
 =?utf-8?B?N1RWSlkweTBINkFDK0xTN0o1RFo0MWpsRUszdTg0Y3pvWWJFb2tqendxU3Js?=
 =?utf-8?B?T1dZN2diQmQya2U1Z3ZiQm82TXFsazNyYzhWUDlrTlh2WE05cUNoWVY3N25H?=
 =?utf-8?B?VStCY0E4dTg5ek1aU2h0ZU5HWjE5TDdlclA3NUt4aUFKL1hZZXVZOG1iUlh1?=
 =?utf-8?B?SGdYZnJiZ0QzN0s3WXZXVHN4Q0grN3ZTeGF4WnZjRFJqa2h4YitIbnBsbm04?=
 =?utf-8?B?a3R0YjJJSkJ4NlJMblkxWnFoUXJnZ1ZEVTFpQkdwRlZEcDRXQ0UzQ0M0VFZE?=
 =?utf-8?B?clA2Q0dSZThzTkptcGErVDd6OG4rOFJObmNZeWRlR3ozenhiOEd6cGdnS2FD?=
 =?utf-8?B?cUNrQ0RkUVZRYWpQaHNKM3N6YkNlMklCRGFPVGlrOTcrOStYSHNIRG8wU0pL?=
 =?utf-8?B?bER2ejgwYUZJbjBWOCs1WjJVY2VMQlJCYWozajd0M09VNFZjZGdBS2FVVTE5?=
 =?utf-8?B?MFYxcis3aXRkT01EWVk1cm1NR2dDYWVDQjVqaUZPRk5YNDhMdjVpdGhXN2dY?=
 =?utf-8?B?KzliQWFWVGFZZ1Ard0lkK0huR0hNMTBGcjM0LytubmdEczRlM0Z3akJLTyto?=
 =?utf-8?B?MTkzLzRQNWZwZndCSHdGR2xYK1pYL0hPcnkzWW03VlJKNHNiRnUvMjVrcnhs?=
 =?utf-8?B?UGIwNEJ3czc5TmwvQjhRK3dnU01TTE00bExrVjVpSVRkWkVsbXF4Rkg1OVlp?=
 =?utf-8?B?RmVYNFRSOHp5MURkQ3lJZGtlYXN0K2lXUysydDgrYTdydHFYK3NpWEhkS29L?=
 =?utf-8?B?WnE1SWpaZnBHZUFaZFlORHoydDhaTVd3ZUtVSlpxMU11SUI2aGpNRUhubWtO?=
 =?utf-8?B?NVdETzR2K3p4R2dUL2ZnOUR6VW82amJabmVwcEFHaGFjYmMzTHdweVhmWjVY?=
 =?utf-8?B?ZGNWN1ZKdk1MMDYvQXRlM1ErWFVJSzdvSjRXOXB2QktQV0tQc3IvNkQ2blZM?=
 =?utf-8?B?L2xLc2dHNmFRbkZIQnJQdVpPVVBLeUZJS0pCZ01Nc3ZrU01ubUpLT1RVZTFO?=
 =?utf-8?B?Y0pSV0xqY2M4eWJ6VEpZaHpoL0ZUelpsTlUrSEFpRDF3MHZQdllPYVNlcld3?=
 =?utf-8?B?N1o1MjhaNXh5cTBUSFA3UnEvZ28vbmtDejh0RzB0LzVrR3RlREx0Zm0vR1g2?=
 =?utf-8?B?RENMQlVtT0dwdmhPWFZKeC91eG1sSU82aVFJQ0ZrTmNpVlRqYjBTb0Vuc3Zy?=
 =?utf-8?B?Q01lU3dwNVI0MlVNeG83Z2RnOWI3cU9aRW1UNmN0Q1BhajNjWUZyTmFPTExO?=
 =?utf-8?B?OHBlWEZ1M1Roc09MUWVBMHNBMmJSTXFvTWRBRCtOaVVIUnZNZ0JrdXlITHZU?=
 =?utf-8?B?Tk9SdGZlYUNrcVlaaU9Oem1hamNlTiswczZjdUF5VHlaT0hmaE5JMGZEdWx6?=
 =?utf-8?B?ZW9XSWZWMzZzMjZPM2lNSnFwNVpWVDJTQnJ2UHp5UHZYYkpiblJDU0ppVzBT?=
 =?utf-8?Q?KKd9zxSNroNthlQSeikxIAmfskcla8e3pWbkPGX?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d5c3fdf-d33d-4ecf-fbdb-08d94143d648
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 12:36:26.4246 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iUAXHsk1pymPaHBnOvXfcVaqPfxprm/aL2Xyn4KVyLMTGdrMQ5fJ5ijSQVqDWHlxQdaMODjuG3PAQbAqkH3pOq4mq9ObEKksG3fzsUFGoEM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3528
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10037
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 phishscore=0
 mlxscore=0 bulkscore=0 malwarescore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107070076
X-Proofpoint-ORIG-GUID: 1J79qLJtQ0xw-26ZGYn6VN4IBjySDbsN
X-Proofpoint-GUID: 1J79qLJtQ0xw-26ZGYn6VN4IBjySDbsN
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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

On 7/7/2021 8:31 AM, Marc-André Lureau wrote:
> Hi Steve
> 
> On Tue, Jul 6, 2021 at 8:58 PM Steve Sistare <steven.sistare@oracle.com <mailto:steven.sistare@oracle.com>> wrote:
> 
>[...] 
> It doesn't apply on master, could you rebase and resend?
> thanks
> -- 
> Marc-André Lureau

Will do, sorry about that - steve

