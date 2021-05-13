Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BBB37FEE3
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 22:22:18 +0200 (CEST)
Received: from localhost ([::1]:50136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhHqb-0002ir-Ck
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 16:22:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lhHo5-0001PG-5F
 for qemu-devel@nongnu.org; Thu, 13 May 2021 16:19:41 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:6708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lhHo2-00007T-Hs
 for qemu-devel@nongnu.org; Thu, 13 May 2021 16:19:40 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14DKGpTM028365; Thu, 13 May 2021 20:19:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=58ov72TjJfWeYGeB5AZ64fb1inda1HOQ88C71p0qMkE=;
 b=lzP5MS9GDdiTSGWLYTowp/YwkWqz/6ToxuHugNi3nFx5AZ3gEcLCQH1vWKJPlGeeqvDd
 VCYnybAUOQjft2XDB0xSxZ7yUzVIVWXl4u2C92K3XIz1+096dAyyBgxeWucBaEoflW1z
 mR7cU13TL7oNsM55rqCuSlwg+HKitcF/1u18xQaKb1Z/Ijs0H+jZE7kJhjPEnYavvX8J
 +yazgDYIrohsNsQFVYT+aCojji/1tzppj0b+tLkMN9+QiiU5manu5ZEQk4yRJ/gsDtwl
 pkuMIUgRlQCFlHKJteD6yq6VGxqz5J+hwNInWtVN5tGlM24N6EUDJII/VPEgPSdQlwNW bA== 
Received: from oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 38gpqsrdpp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 May 2021 20:19:31 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14DKH4Pr004224;
 Thu, 13 May 2021 20:19:30 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2174.outbound.protection.outlook.com [104.47.73.174])
 by aserp3020.oracle.com with ESMTP id 38gppcbhct-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 May 2021 20:19:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K5z1NhfCh+d1NHb3hszX8OPo13UVknhQql1HWP8EKRhc3yAQLRtNWcw8IKNpIm/bPf0dptNylTWHj464EHTDEXJrdGYCyPKiE6q0z2vM2LgBRq6jv7TGPJtYGrYTjbLud6VifnISTBCAvlqIURJLyz/TPfBp2rWdD53pfmGOStxne2Y0NOzotev5cwlwiV7XKJaq5/AfKAty3wqSN6DtWIyzS1yMTZcnXlqoMB0XH2x2I0tEGZoHP7oxF9fFUUX+iNpTskFJNfZjDYATLGH4hQGtfUAha1B0Je6KgvRo0mp1ukPsvrPFjI8FDUf5jm7xgd3YpApGx3YKSSb9utl0aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=58ov72TjJfWeYGeB5AZ64fb1inda1HOQ88C71p0qMkE=;
 b=acHqbVU0+RaPDyJz3jiYonOC9F0GULRTU/nG+3UB4nqSYMtIC2E3PJe7zEkA7CotP5FIQDSgmTeZRe1THXv2wIjYUBot5ukrtHfFdbm7z02OYMKgLwo7v+kdXIMNrs4lyOpZKmwOqTogeqZWmQ3XZfxw/KefpYK7CAX6aYVC+SyGpzoei358jHXwKzs2DX6ZV7DOoVveWW7LV99RydTiqEP8GJCzOdQKJwYZY0Qhe2nNF86H8WrbmWbmuEBpFXsQpLkxUhA/aJM6+MpBtGmdCjMUpVZ+4NcYRNoDAHvZ5Efec6uz+nlk/SzDygI4NsW0poHW/CkYqGFyGpOUPcbY2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=58ov72TjJfWeYGeB5AZ64fb1inda1HOQ88C71p0qMkE=;
 b=AARan4AFj+c8bomAgEDL1AOuG43xXGFzEh7dYTiz8A4Z1gmv4uelRHmSdHwYJnYn8WscVG4NxG3dXZ2HulTu0dr/1d4YUp3SgHdvkC83ixrt93g3BbdJyWHPvfJZaB7RYRLYoxjY9QkP/Zncrcrj5yVoXO8gv1l8xPPKUdGu/aI=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by SJ0PR10MB4719.namprd10.prod.outlook.com (2603:10b6:a03:2d1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Thu, 13 May
 2021 20:19:27 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6ce3:f0a3:c303:f851]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6ce3:f0a3:c303:f851%7]) with mapi id 15.20.4108.031; Thu, 13 May 2021
 20:19:27 +0000
Subject: Re: [PATCH V3 06/22] vl: add helper to request re-exec
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
 <1620390320-301716-7-git-send-email-steven.sistare@oracle.com>
 <e1a9e3ff-6708-f0a0-6f04-d3756aa84c15@redhat.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
Message-ID: <19d18308-c52c-8b87-8deb-98faecd730f6@oracle.com>
Date: Thu, 13 May 2021 16:19:22 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <e1a9e3ff-6708-f0a0-6f04-d3756aa84c15@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [24.62.106.7]
X-ClientProxiedBy: SJ0PR13CA0172.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::27) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.92] (24.62.106.7) by
 SJ0PR13CA0172.namprd13.prod.outlook.com (2603:10b6:a03:2c7::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.11 via Frontend
 Transport; Thu, 13 May 2021 20:19:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab9cd5b6-f152-45a2-b9f0-08d9164c686e
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4719:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4719B0D82B3759982DA155ACF9519@SJ0PR10MB4719.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nEGV/CdZlPXW2xd+ZG78Hk+Pfc625jk8CC5n5smw0vT8ebTYhHB2pq+ZWMaJWni/vqzj2N3mo1z5Uyrv5HhRkD1e5tQneYQT4bsWE02BTkiGRjo1qQqPHRaZDVs4XHT9n+4CI3JmEgkbQiQay+FjQsRb9GuU3amzbW58IarovVwr9Hoe6rerdBGSb5HFeG9UNWa0+Nxr7OjvxbFOYt1MYk1RK6qvaO8i1fZqTvdRFImGr3ZdSpFx53KWs/RX3jSmLTM14OqsQpecElr4CsOWwN0+o4aizSPdPfDz6Ok0S58rInHcaKqPb0ugzU/lSGvvukkjpSeETkfi9FfWNhiD38tjJUiMLlxXSfSBAK71gaVwWmQxexKGupcAlxjWu66pSk0y1EjlvK+sCfI3l1NVtpk4TS3FKSb6Ilr4JI/lmgj1v4Z2jyY6kOz613nJg73ujzf0E0BiJElDKzv7UWU00uYDjoFjmEJi7uwjTd+FUTgvx/CzRAeuf4BnCxElHrnxXbMvCLJhUiGpfbLG7/8YjsyDqNV5t9uzPFL11tihuVFhDQNPLbMh9BZgCQkFTea7+Rvv7iQHVewLhcquCXKDClkYeEPXeaH1bKBdpKtYTzoqnJ67xoqE3L3A+RjkaamLnkzDJuWmoAZENPPVoMn61JGNFWFAvrpbdLdOKsUJ1poNzFW9XjRot0NAkQ8ccF27
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(136003)(376002)(366004)(39860400002)(396003)(44832011)(956004)(2616005)(31686004)(36756003)(6486002)(5660300002)(16526019)(16576012)(31696002)(316002)(478600001)(186003)(66946007)(8676002)(53546011)(86362001)(26005)(66476007)(38100700002)(6666004)(36916002)(7416002)(54906003)(2906002)(66556008)(4326008)(107886003)(8936002)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dlhkRWZyVGYzZEowdVNib1ZockV4V1AyeVJkVGRFYlJNb1BIWjF5dXJkT0Iv?=
 =?utf-8?B?MEhLbTIyTk45UXhvaXlSL1RwWlZLN1JTSWpUL1I0NDRZSVNiaTUrb0hTWXdy?=
 =?utf-8?B?aE5Id2JyVW9manYxczdOUnFPeGl5MWRXTDIzT2JNVXp4K25UbUNxNGtKb0pi?=
 =?utf-8?B?N2dNazVPallvY21Ba2FlRDRIOWt0TGdnZ01MYlRINk5lOUJtWVYwaHRYNXlj?=
 =?utf-8?B?am5yNUNYL3F6N0wzdndhZ0tlR1dmNGV1Um9VTDBGU0dXSUpBRTI0elZydGRZ?=
 =?utf-8?B?Y3RibEtOWGZTZnlndk5QSnUydzd0NTRJUUtOQ0o4VDg0d3FSeHhSOXhNZE5M?=
 =?utf-8?B?V1ljNU42akJKdVhhTHEyb3JVckV4WUovOStnSVNoL3liK212bmN5b3F4YkI2?=
 =?utf-8?B?dlRsUzAwandZMElVZlUrTDM4SUhRaFVyc1J1U0dtUW1veHQrQ2VQc0g0Wjhi?=
 =?utf-8?B?RjZZNnA2SXQvSDZlWXgyblg1RXlORWFQN292NUpHem5nN1NDVWxIcVcva245?=
 =?utf-8?B?dktyOE9YTGU1UzJEMVd3TDVFbEtWQjRLeUxYS2l5dHBlcTVwWXd2WUQ5emJ5?=
 =?utf-8?B?Rk9yQ2dxRDlxb25lNkhvcEx6Q3dEejgwaTJQUmJrWWM5V1VYa1NsQzBJQzRZ?=
 =?utf-8?B?WGtmbmZreHl0MmhnNG55VEcyRSt5WmN4OUFMMzBGb1ZtNnlvSFQ5c3FtMGNH?=
 =?utf-8?B?ekRtbEp3WUpPeHBKUnAxd2pTTk1GdHQwQVNURTNMVmtqaTc5d0RndS8rMEls?=
 =?utf-8?B?MWJnYlFxVE1kTjErR284cjdRZ0dKVlJpYldPdk82UkVScHRyTzE1aFIwdWtV?=
 =?utf-8?B?cyttK1V4Mm94U3cwdXI3aHJzWUFtbHFBd3cyWFkvN2hxdWppMTAyWWhKVWpr?=
 =?utf-8?B?SW1RNHlONk83WDNGaTF6eFFNRk5uRHZZdDY1WUhqbHp5cVdGMHJGYzI5ay9E?=
 =?utf-8?B?cjJ1dUI1ZDQzQUFwWGN0MjFJSHJaMklCTmh5aTRIOTZ3TVRHMjhVRVNPaVdJ?=
 =?utf-8?B?MW5nQ0djUjM1WWdHczFjbGpLa1VuUXZ5VWJMTWFHT0ZZVjBzbTJTUU5iM016?=
 =?utf-8?B?N1JTNGljKzgwang1RDN3QnpXQisxMWZRSHdqSWU4RTM3VWs4Q1I0WmsvNkp5?=
 =?utf-8?B?cDZ0cmpHbHpSZUZ5UHQ5S1lIdUlVQm1Ga0tOaDdoaEk0emdWQzRZdTVQVTRV?=
 =?utf-8?B?QlBDaUgxYlk2bVpmWHh3dlh0MUJqNjY5U2o1V0k5bHEzeGpSaU9wMEVaMVhX?=
 =?utf-8?B?N1pTd1J3QzJHQUQ0c2tBd2I1endiQUViNm9ITEFzUENITDV5S1dRZjlDcGdm?=
 =?utf-8?B?RVYwTG5tY2RMT0xGQXZ5M2FEVmYwN3pyd0UwSm9jc1ROM2s5aXVnSzdJVXk4?=
 =?utf-8?B?aDRQUFd3RTJxZ05icnB0RXFOYUlWblRybW41TkFBNkNvV3NZRDNucHNwY0lJ?=
 =?utf-8?B?SktGc2ZpTDR2MDBMaEt2akRySVk3eFVNaXNhbzNMdnltWDNiOWM5amEvL3Q1?=
 =?utf-8?B?QWF3WG9KWHZwZ2RzVHdKd2R1ckhXVjFlS08rdFZwaTI1bGNScndYL0x2MWRX?=
 =?utf-8?B?SGNSZWZKbW5DTXRrbElyeVVjNkNncDlrTGtKcVYzWnVqL2dvS0QvSUg2WDhv?=
 =?utf-8?B?anowNVg2NDRzL29QRmR5Z0FMRnBqalZFZ2I2WHR5RTh5MHN0LzJvRXZ6T09D?=
 =?utf-8?B?Rkw1cFNhMmhPS3VoeDIwNERQM0Zmbjl3MldvNFZGYVNMWnMzSStoOFlNZjhB?=
 =?utf-8?Q?JoHKStFw/D1viHE7jKk4S2EZdU18gev44FHCayz?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab9cd5b6-f152-45a2-b9f0-08d9164c686e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2021 20:19:27.6717 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5yB4PxcMNs4VJ6AAq75nowGSsm3ppw4K9bIgNNCYj67NfHOmSwskzo6oUgyp9zziKfq58hXj7lVshRbcBBq+RYivS3Otgd7yup60EzBCdxo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4719
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9983
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105130143
X-Proofpoint-GUID: mGod-Ktvl9PuSfxkFhW2Gc-3UKTRAJSU
X-Proofpoint-ORIG-GUID: mGod-Ktvl9PuSfxkFhW2Gc-3UKTRAJSU
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

On 5/7/2021 10:31 AM, Eric Blake wrote:
> On 5/7/21 7:25 AM, Steve Sistare wrote:
>> Add a qemu_exec_requested() hook that causes the main loop to exit and
>> re-exec qemu using the same initial arguments.  If /usr/bin/qemu-exec
>> exists, exec that instead.  This is an optional site-specific trampoline
>> that may alter the environment before exec'ing the qemu binary.
>>
>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>> ---
> 
>> +static void qemu_exec(void)
>> +{
>> +    const char *helper = "/usr/bin/qemu-exec";
>> +    const char *bin = !access(helper, X_OK) ? helper : argv_main[0];
> 
> Reads awkwardly; I would have used '...= access(helper, X_OK) == 0 ?...'

Will fix.

>> +
>> +    execvp(bin, argv_main);
>> +    error_report("execvp failed, errno %d.", errno);
> 
> error_report should not be used with a trailing dot.  

Will fix.  I was not sure because I see examples both ways, though no dot prevails.
Perhaps it should be added to the style guide and checkpatch.

> Also, %d for errno is awkward, better is:
> 
> error_report("execvp failed: %s", strerror(errno));

I shy away from strerror because it is not thread safe, but I see qemu uses it
extensively.  Will fix.

> 
>> +    exit(1);
> 
> We aren't consistent about use of EXIT_FAILED.

OK, I will use EXIT_FAILURE.

Thanks for reviewing.

- Steve


