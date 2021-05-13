Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCC437FEE4
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 22:22:24 +0200 (CEST)
Received: from localhost ([::1]:50554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhHqh-0002zk-Dm
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 16:22:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lhHoG-0001Th-7Q
 for qemu-devel@nongnu.org; Thu, 13 May 2021 16:19:53 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:25180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lhHoC-0000G7-Lt
 for qemu-devel@nongnu.org; Thu, 13 May 2021 16:19:52 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14DKIImX008927; Thu, 13 May 2021 20:19:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=fgmKxcbgdH0/V4yZ+exIcxlBn69wjIdZfdbVjZ1QNOA=;
 b=Hfvw2glqayV25u+3HP0G00MjbI5p26EAkg8bmOWhG81omfo55JCMzxo/sqGgqVB9FWD5
 wkaqQ52KvXgW+CL01+vQbVdDimG0Fe4jkYPx7Fi+esDJq0IlJtEK7yhuKyKlLSN+5Je3
 xohGZprYV6s/wmuYoaJw7AjPXnT18z8hR/bC1CeUBr3II7RDTOhHw3wZHuTAhLyMZ1lv
 IrVOuak4RBgX8lY5eWWeQnv4+Js91dzlEwK78rOVGrdHHxTn0BcjDgdAdIzRstGly5h1
 z/OA9jVgoRvKauZS1Kny6KPr4M0cVcxy3oQzxIr/6gPg23QFzt7N852Q3bh8oxqwJodd Kw== 
Received: from oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 38gppjgdnf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 May 2021 20:19:44 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14DKJhxB083761;
 Thu, 13 May 2021 20:19:43 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2173.outbound.protection.outlook.com [104.47.73.173])
 by userp3030.oracle.com with ESMTP id 38gpq2d26g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 May 2021 20:19:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lSSYyYE/Gm2M0gc+9uEWKFO17pv5gAXoxouedtzavVSdCOBnP6J/DrxRCAbNYiaAFmNnZDq/zu5qqHpuBFzZD3eLw9HJFWwE6nfSofIGQKirDigBHhr0Yk+D4SFIDO6W2UDds5UD6htkcZW1ZT74sBjJkxPLzJXMtBLaC2SaSJiW7tUlVznxJmjEqUsEMAMVULn9VUrDphyTWvLePLRjPDK2C3cNiNHSkahaLbkyHdi/x2ybmJ49h/TwGzee94BS7dXKkbZn3XnyR+CgbRK8emr1+kaPWcfKt0450X02zE8bzAseYobBlkfZ45SWQNHuUULL4wJMeCJPERmUyVp1+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fgmKxcbgdH0/V4yZ+exIcxlBn69wjIdZfdbVjZ1QNOA=;
 b=baSO9Pc6rixrFBFfbff9/v4PkZ0R6xYKhHTaalgzvTs+hrgoUnkiU3aE5o7sP2U/8IM4OFyHM9WiLONyzJ8RChYYfEnemp7gpmE1Z0URf85eZklWXoSlVkHWMsBwDheboLgdIm3Hn8NWQ2DyMWfg0awsuIgfMu3SGu+v2u3UlinxPDxpQmcLOTbdkFtWWnlvWetY5ruMAkDuR/b08djoT2SPR6uektd0T5OF90Dv+uz9k645P4Q3+xJSf4K7jFd0tg5dPaj2KyWFdSfuk5MjDWLn9Xnqjtme6BugF6vjm1+4h5TQ0o+lkxg2IT5ronrSzOMxP6o7lCWu9PcuDmVx+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fgmKxcbgdH0/V4yZ+exIcxlBn69wjIdZfdbVjZ1QNOA=;
 b=lJdXPKn1S56HnsQ5qy8FhUfWALOhEsx4sok6BhlZO3NqsjrCNT6gRkH2XpqMnIwBK4lHOPTfhBhHSyhMfe28GBoiq90OeriijPOwQCWDPwVSba6Qx1vjE4XQMnLdCP321ubg3i8fOn7yB4BYsxpEzMw0x5EK+OXe4mW/D0Tbmpo=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by SJ0PR10MB4719.namprd10.prod.outlook.com (2603:10b6:a03:2d1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Thu, 13 May
 2021 20:19:40 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6ce3:f0a3:c303:f851]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6ce3:f0a3:c303:f851%7]) with mapi id 15.20.4108.031; Thu, 13 May 2021
 20:19:40 +0000
Subject: Re: [PATCH V3 16/22] chardev: cpr framework
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
 <1620390320-301716-17-git-send-email-steven.sistare@oracle.com>
 <a02486f7-3882-1117-d60b-9775d534576e@redhat.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
Message-ID: <1dec4c84-bf6b-69c2-4d5f-6475e6a0ff76@oracle.com>
Date: Thu, 13 May 2021 16:19:36 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <a02486f7-3882-1117-d60b-9775d534576e@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [24.62.106.7]
X-ClientProxiedBy: SJ0PR13CA0171.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::26) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.92] (24.62.106.7) by
 SJ0PR13CA0171.namprd13.prod.outlook.com (2603:10b6:a03:2c7::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.11 via Frontend
 Transport; Thu, 13 May 2021 20:19:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a337be3-021a-4670-a369-08d9164c702c
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4719:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB47193C5B9547DD716E585BB9F9519@SJ0PR10MB4719.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jwzDOnHtmMwP9z+5BLe4YEPxJjBKCC9VFUjdFOaGD+e+OmSpSpzgna+Zzu9o4JXHfwSea9hGHwDxTwDeIAYU+IYl72K76cMuNeB4qei8aK6fmvPPiGNzOfhHdkC/YerDElS9OPegU+vI2zggfVo1/ivcQMPMzWv0/LfxTUIL1g8kO6HoL0ijVcleUaD/ZDnYpHAPIrZngrAUaCaXR4FoUVXnOv2bIsuxBm+taBoNsm5B0L0kHvMfAhvOcnL5Dlp+kHAytdnOiXEmgX3uxCDIB6cHD2anY+5s/gSN750LR7oCpesSAeKkBzPJYX7tlaRS4TW0qbZ2lsKolFaKvwoPkAUq2M8lcDomtnsvP3v+uEu5HxVTQXHVy5RxOFK6aDvkQwLOT6KgeklXLglAWcxX0TAfE8AQl64+BwQIDj1jMyxxEvYYwY3kM847P6d0yAwR/e7S0u+fT8pw5Teaee60qynmejLdnLiUtuYF3jcQJkdiGCv9YjS9Entn1fq4xmeKHipSPo4SQluCeY7AL+qeSoyZEJ+BohvWFoiyVxqW74W/XBkkGhgoIcGyM4mTdJNEAV5q20iIKAn+8DSATAvThZDSUqfcRJBqkSKje2UgvM1UA81tAm4MCmoFPrQbuX38Vj2qOxMMaHpTRkifQQQfhjRbuRx4coks3AtDgpTQUz+Ahhz84XwgmwqiEH2bCuBR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(136003)(376002)(366004)(39860400002)(396003)(44832011)(956004)(2616005)(31686004)(36756003)(6486002)(5660300002)(16526019)(16576012)(31696002)(316002)(478600001)(186003)(66946007)(8676002)(53546011)(86362001)(26005)(66476007)(38100700002)(36916002)(7416002)(54906003)(2906002)(66556008)(4326008)(107886003)(8936002)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SmdPY2dJZHpqd1R5b0l3emFvVzg1Y012aW5vS0poL3JOTktSWmpIeDZuTnMy?=
 =?utf-8?B?YThNUkhId05GSEVCeVpjMldhd2UxbXlmbDdIeWtQU1preHlUSy93L29xbnY3?=
 =?utf-8?B?V0JRSzZUMmdmMHlQb3hRUGRabHcwZEhwY3JFd1BEb3l5VnBmQ05URXZuR3U5?=
 =?utf-8?B?T1ZtRFRjU3JhOWIwUWlObWJiRGpZNEFoS0x2RHlpemRUNGJ1TUdxdEx2QjFn?=
 =?utf-8?B?Y0NUejJxY1dDTkdrYmhPRm15REtmVlZUR3kwYjRGV3J0VW5TYVRyWllCUmpM?=
 =?utf-8?B?TW8wN2Z2TVA1YktBODBaTEZoaVRudi9BcktIQ29GQWRuVXpSUXBuTWFSS3cw?=
 =?utf-8?B?dytFWHdZa1N0NlhTSnBVK2ZtU0JxRXNUcDIrVFo4YXQ2eml6bkg0MG50OER1?=
 =?utf-8?B?djIvSXA1SjN3ZFJkbnVqWTVQSGZnU0FKQkM3UWJ6TnZKbzIybTZvTG05T3Zq?=
 =?utf-8?B?aHY2MkVrVjFxUEJvOHNnVTRkTGhJTnFsM1dML2lua1RCUjRvYUJISkp2ZGNT?=
 =?utf-8?B?SDZBbG1VbSs1RkNjV3U3d0dZSUM1RXQwK2xvWE9JdXhPenBmbWpsNXNFaU9Z?=
 =?utf-8?B?OEFhL05pb2FrN2RQL0dpV2l0b1gxYTAxcEpxSVJjUFp6dW5KV1g3Q25VT2kw?=
 =?utf-8?B?NC9wQ09pOTQyejF3bnFNUjhPc2pDNExQTHNsaXJtMVRsT1hpVkJoOGV2Z2JH?=
 =?utf-8?B?eVR3cHNMdWQ4eHRtUi9EeVlLMXpvbk1vUzA0Y0lZY2xwU2lwTHhkdWxQK0Y0?=
 =?utf-8?B?MUQ3ZVVEby9KYU1uKzRZNFV2UTRUQTNwMmlaWTRoMXJnQ1NFd0c2b3RrTkRO?=
 =?utf-8?B?cDlkS283eGZnM3cyZDRQRG1YdXJlSEY5aDQzRDVWbTNwSitMZHcvSWtlVUNE?=
 =?utf-8?B?ZVFaeXZNVndEd0hzWFA0RGd2RVhBQXg4bzNmbUdDVGtiZEdFYi9qbEVYUjdp?=
 =?utf-8?B?enpHcDJaeFFuSU5JZEVlUzh6L05RM1AwYm9pMDl6NkhoWHdjc3NXK1Z0RWt0?=
 =?utf-8?B?dzlxVUpuZ2JvdTF3MzFEZGVTVTcrOGVoMnVxY0dyK2dscWN1QW1WaUtxZVBJ?=
 =?utf-8?B?QW5mYkZheVh3N0JjSEIveUF1RHVrNXJSRDFGL0tFdWdWejMzUWNSNGpKelpL?=
 =?utf-8?B?c1NoL0R0QzhCcVVNV2Q1eS8rYnJEdjE5ZW4rTXdNZ0Fscm5RTTZFWVJJUVNq?=
 =?utf-8?B?b1lhclNuYnJra0hhK3pvN2V5OXdmSnAveGxhRXk1M3l2U0ZhZnBkOXBXbi9P?=
 =?utf-8?B?YkIrcFR2YUN2b0NwbXlaQUwvRDlURWs0bGpLeWFqVHVkNnBHRHB4ZDdsM1hy?=
 =?utf-8?B?Ykw2STB1dmRYbjhtUERoRSt0MEdCNWJ2MDcxLzUxTGVhOHIxZ1lYZEdka0ZR?=
 =?utf-8?B?TnRoUVlyc09YVTRGRmhocFdNNTJMOFUrMklLZk1lOFJKaktkQ1pUWXZ4Rm5O?=
 =?utf-8?B?aUw0ZXpwSVdJZ20yUDhxT1Q5aVUxeWZuenZjQTZUL1Rtdk41UlpmQkNMYWU1?=
 =?utf-8?B?Ky9YUjZPY1BoakU5dUNNVFRxdjk3eHhoZzFmVlFhd0k0alNuT0lVZ3JNUG9u?=
 =?utf-8?B?Q2JLb3NBWXJiUTZsbkJVeGNzcUh4bEVKclFtSVp2eStFb2l5T29KUndzcVp0?=
 =?utf-8?B?K2RSc0VqdzJ1NVdNZHhidWZhQTk5ZFNXZUZVbWVQbzFDWjhPeU8ramZudXh2?=
 =?utf-8?B?bE52dStVeEgwcTEvTFFjUjE2WFB1QWhiNktaVlFLK2NJQ1ZRbkhtOTBoRWRY?=
 =?utf-8?Q?vaOcOLL8UTNz6eK8aAIrs4X3RusAg2M469xP8QB?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a337be3-021a-4670-a369-08d9164c702c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2021 20:19:40.6724 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JTQ2s+JlBGCB/Fm49Idt01gMzsvJxJPdLYEphOIx8lehAOHtz+mJoR+Gg74fqLHmjueJIDPhSpVPRWzlbK+iDDKvGaIgQHet9kNkMECDfHE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4719
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9983
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 malwarescore=0 spamscore=0 mlxscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105130143
X-Proofpoint-ORIG-GUID: nT5d_2GaeYiz0HuzVOD2pbjzqD7xPT7i
X-Proofpoint-GUID: nT5d_2GaeYiz0HuzVOD2pbjzqD7xPT7i
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/7/2021 10:33 AM, Eric Blake wrote:
> On 5/7/21 7:25 AM, Steve Sistare wrote:
>> Add QEMU_CHAR_FEATURE_CPR for devices that support cpr.
>> Add the chardev close_on_cpr option for devices that can be closed on cpr
>> and reopened after exec.
>> cpr is allowed only if either QEMU_CHAR_FEATURE_CPR or close_on_cpr is set
>> for all chardevs in the configuration.
>>
>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>> ---
> 
>> +++ b/qapi/char.json
>> @@ -204,12 +204,15 @@
>>  # @logfile: The name of a logfile to save output
>>  # @logappend: true to append instead of truncate
>>  #             (default to false to truncate)
>> +# @close-on-cpr: if true, close device's fd on cprsave. defaults to false.
>> +#                since 6.0.
> 
> 6.1, actually.
> 
>> @@ -3182,6 +3196,10 @@ The general form of a character device option is:
>>      ``logappend`` option controls whether the log file will be truncated
>>      or appended to when opened.
>>  
>> +    Every backend supports the ``close-on-cpr`` option.  If on, the
>> +    devices's descriptor is closed during cprsave, and reopened after exec.
> 
> device's

Thanks, will fix both - Steve

