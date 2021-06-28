Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D35E23B5F50
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 15:45:56 +0200 (CEST)
Received: from localhost ([::1]:42150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxraF-0004jf-5t
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 09:45:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1lxrYY-00043H-FS
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 09:44:10 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:23762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1lxrYR-0007Gk-Hu
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 09:44:10 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15SDfSGE001495; Mon, 28 Jun 2021 13:43:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=NyXAyW4YgbDfizB6h/LBzmJ4gx6U2lVogeQhoMO12SI=;
 b=zCk47J2BMyqVBY4eF3TvsRDNLodoMy6yLCGsT0gS8fbpWcP/6dz8tSCXJ0VLrzrDImL8
 mJhcrjmPAUbGj5Zrt/U2GpIkNQclF3j+zBbIfEoCQI6wtD7406obF1rKSXfjzz54YhYp
 qqHPUaJCUHQHVDQmO3tufzKdu5p+iAQ4P91lRGXMEgSZKgc3WHjguVoYZAJdiTzbp7uc
 dmp+rTeAMh7itcsk/gmA+RCKJLLt2EMDgTg1SF+9oVsyoU7ZB3gI7MKEZC0h/xpUhy4m
 Hu9MrQw/jHmZFF+hGiWXL/25E12Tx/6Lz9kr3lvkzxNLGqRFkuj6fNC05uZ1zpgazUzM Cw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39esfksnnh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Jun 2021 13:43:57 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15SDfnX9112218;
 Mon, 28 Jun 2021 13:43:55 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
 by userp3020.oracle.com with ESMTP id 39ee0se193-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Jun 2021 13:43:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lEjuLDaB9xJvF3S2annNAmG2dITMmpzBOF5syR6cPFMrzh7KKgArtNJXR6ro3fCxTTVdQ7RYd43wLjbWLFZ/GclWBWjoesKxNfPKLSkeHIhkdTCTBg5Pq9Bq1GbXRIUWbkNRCgp57hNfaKcACqM3tHnj0It84QCUvJBVTVFupF4cd8rVmcoM9ShB7SSznBUKZFd88yf+kCc1L2U/XEHl7E/tGxp2kpzyY7H1agW5jdsQsiKdL9azpA+bH9osfl+B8agSWmEK38yOTbjd5PNfwm5rwQOLi5OWNepRoJtiifH4RBBfQnHgjd/AoczSzxOT2pPd1/5LaKGHvGb3vnc3hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NyXAyW4YgbDfizB6h/LBzmJ4gx6U2lVogeQhoMO12SI=;
 b=WJD73e71Tfm+HW1BMpIoDRF83dYfyw3GFQt49Ozi6j9uhDkyakyzzqbg6smFd5YCuzfp9DZsJ7hGQnRh7undrZx7w0dEdb/ITZsjmhwI2YgZJsPPC6OU+tpfwDUN+mj8owtQPfOnxKUBN44jqREzhPmssFMEkSlbNnG8EKAxL1Od7TuYBNj8P19vrA8zYfW+BKeA3KiJsu0cH8zhVCOw0VlWduZvRLD2IND+Q6fjDosYVCdQP7wNrq/NQ79M+aF8W2VAQ7H8ndr6WPAyRZRd7YD8TmkEA11N4XNDGN6mfk7eRnshj2eNf0qe6N67o4XIxxr93qqVp+g3o7MsstduhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NyXAyW4YgbDfizB6h/LBzmJ4gx6U2lVogeQhoMO12SI=;
 b=hMB7n8dHJmHteGK9i1SFx0rKO3dBq73nK7HNWnSbRVeReZ8Dolrekv6+yvsc+l7HNixpHGATPpdJf+8gqyqWZnFsPlVkauXSEXIhEQ6tYPQ+SMEGPB6I9dmIJUfS6uhxQfIwLPI/fP5i7mpNGHi0jZJc/v6CEcsNH84CPhHYtcE=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=oracle.com;
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by BLAPR10MB5282.namprd10.prod.outlook.com (2603:10b6:208:30e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Mon, 28 Jun
 2021 13:43:54 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::d875:3dd7:c053:6582]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::d875:3dd7:c053:6582%5]) with mapi id 15.20.4264.026; Mon, 28 Jun 2021
 13:43:54 +0000
Subject: Re: [PATCH RFC 1/6] i386/pc: Account IOVA reserved ranges above 4G
 boundary
To: Igor Mammedov <imammedo@redhat.com>
References: <20210622154905.30858-1-joao.m.martins@oracle.com>
 <20210622154905.30858-2-joao.m.martins@oracle.com>
 <20210623110341.0ceca1b4@redhat.com>
 <21f86eb7-e9db-b7ac-9014-2baa9fd44741@oracle.com>
 <20210623140922.404b280b@redhat.com>
 <fabd186e-bfb4-3aaa-e207-72dc67ba4214@oracle.com>
 <20210628152550.6c86a43a@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
Message-ID: <e4be49b5-69ea-5f15-8c35-bd4be51f5adc@oracle.com>
Date: Mon, 28 Jun 2021 14:43:48 +0100
In-Reply-To: <20210628152550.6c86a43a@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [94.61.1.144]
X-ClientProxiedBy: AM8P189CA0018.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::23) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.67] (94.61.1.144) by
 AM8P189CA0018.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.19 via Frontend Transport; Mon, 28 Jun 2021 13:43:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5035b3f-46ee-40b6-7469-08d93a3ac512
X-MS-TrafficTypeDiagnostic: BLAPR10MB5282:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BLAPR10MB5282FC2D505286053DD24074BB039@BLAPR10MB5282.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L31K+E7MqTrL0bZLc3wUSW/kEdOSquCODzUHgc0lX5AJqLQD7LqNXEI/+sB57sC/FG9pbGJD/j0XNFSt1xIk0h1+u+PkcBKkX8FC+pDmlSfNAHY+1pWaUCqdwpvG2RW6oXTg0LCymGfgPb8qPZyMA33iZPjP9tv4l0jHqMdn75xym2rmapK6D8vKAU/dlUE0vcFutt68XXScKc0jBJ8laeRoYAYS6puW+IBFbqY/hLtHUp07/A8dbgkV4OUn4IbCGzjOeGqfjH1E9yHY6b0CGxzV3vXl60qixEkJWsflddtIbMoNZrG4GWlKsYA+zZDB3+jgrhy9FYXQjJklDBLUSkkspCXNqI+2MgXXEh7rlQTdaiIfr5YCv5GXGcA/28mMvW7X0M9TUwEgSXCsrG3a9Om5jM7OsijtPJilVQbboX/6eYw00aH3NKROq9dXbuKppXmJKKA35SqrZTcQgOx/Kns5GWUtWmEnM48PflBxxAw5BvZzh9FSN/uHxbIb3j9g4zNb4ah1tmYL1JRiwaw96q+Jmd5wCoPIKOA6NIfgXQ2rfGTIFESRqRilfonH0tkWkphdd8NFe5Wsh5khNOzyOp9Epk4dZXnF3z/x0Y/tbsN7n6IUrVF6RQsuCeW5UJMjBJRhMXXKpRyP+YU4Afb5Pg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(136003)(376002)(396003)(346002)(39860400002)(66476007)(8676002)(66556008)(31696002)(66946007)(15650500001)(5660300002)(8936002)(6666004)(38100700002)(4326008)(478600001)(2616005)(316002)(956004)(2906002)(6916009)(86362001)(16576012)(54906003)(53546011)(83380400001)(36756003)(31686004)(16526019)(186003)(6486002)(26005)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1Z5V3NlZkJEN2JJMFE4S284VzBKTlFCMWd4c0xpampYS2VxSmxsV2srbGxS?=
 =?utf-8?B?d2p1bWVQNDhYZnFSOWQrNFRySWttRFFKUzNiaWNnVnpaNXNNTWlEbWVWMUMw?=
 =?utf-8?B?RnduRW5zYUNETzBJQjh3WUlLRVplM3FiNlhBcWU3NS9COCtCZVVuTHZoTXQ4?=
 =?utf-8?B?Ri80QW43QXZnUjB3WTJHcjk4Q05KSGU5R0JIVHJ3MU42dys1RHBWN1VYaExp?=
 =?utf-8?B?QWxxYnF3aFI3dW5DOWxURk1FMGlOdWJjeHk3NlZSOFgxN3A1RUZBaUJ1UFEx?=
 =?utf-8?B?UW1zQXZ5Mkg0cEp0b3dwUWdaNDdZSDNySVZVTEluMjNNdTdKQllnQk54dDUr?=
 =?utf-8?B?Q1RkT1lWNEhoMFhsUWZmMllRWVRlVmozTVZmRGlnVVNEQnQ0K2oyUEp3NGxZ?=
 =?utf-8?B?M1BSSTIvREdOYTQ2c1BzZWRmc1c1TXZOU1VrT1NnUkdxejhnS2dOTVNVMkg5?=
 =?utf-8?B?ZVVIMkhHTlNHaGcvZkQvaEJsV0NqNTZFYUt4YkhxdlZZSU9ENFdYNWpsbk9F?=
 =?utf-8?B?Qk9tSGhHVElXNGNkSGNwQzZhelc3ZFJwUjBFcnE3bUttdFpmU1BiQ2k1N3Bk?=
 =?utf-8?B?STBKZW0xS1lkci9jNFhDblY5Y1FQQXlrTWxGb0pBcGI4RGNlTUlTbGw5eTYx?=
 =?utf-8?B?czhwN3dmdE1VU010eGtSSkNNL0NjaGt4U1l1Z2VLWUVjaitiSlVEL0VoREZq?=
 =?utf-8?B?OTZ2aG5EWFFHcHRQajZ2TGg0RENFdG4rNHFYS0pzZmlURGJvRjhRMEtGU2NH?=
 =?utf-8?B?b1NXT3FSakpqYzNXbHdSMFFPZCs0MWlTMzBNc2UzRnEvNUxCSEpoZjZFMzFQ?=
 =?utf-8?B?R0oxUm9NL0JsSWp0UGJZTjFGVDRUWnM2R09OTmJjRUlSMGtiUDNBYlEvZmx4?=
 =?utf-8?B?Wkh4WUVoRGdXamtSMGttS0c1azlvS2tPS0dDQlhEcDFDdS8rUTRSUEZVenB2?=
 =?utf-8?B?d1lvTGZEeGkzeHBaUmRCaVFCQWNMY29ROERUaitOWnF2U0hPek5KSFVTVXB6?=
 =?utf-8?B?MTdmVXFjbkprRk5MblNQa2FxUnF5YTlZdGUwcEdTR2ZHWXNQcUNXWkZGbCti?=
 =?utf-8?B?TW5nRHBPRlRJRW4xeXlEZkNkQ0JlVjFZeW5FcVdVVCtKeEE2aXNMTmtGaTBv?=
 =?utf-8?B?U0JiYW54aGtoeWtvMnhtZWJ6NzNSQWRrMnZGdnRzMlFrSHllVjVob0F1ZHBY?=
 =?utf-8?B?cE9PQ1plNEpkVlJZMDZ5NHk1QlVHaXROV2NxZlhjMTRxYjRrSjlmTXFMUVFC?=
 =?utf-8?B?UFJpMHRncXdFUFZ0YzZUMmZOZGNiUEpyNnhvZG9hUzNsU3hyNUFrL2pRSHFm?=
 =?utf-8?B?TEFrdWttbVNzK0p3Mk9yazFlZXlzdVVnTFVMUGNQWDBPY2NlMU93eUdSVFJC?=
 =?utf-8?B?SFVrMjl5azhuRFdqYXdqZzJteDhTRWNmdmNaUnVRSVIxUW4vZzZyUFAzMzJG?=
 =?utf-8?B?NzcyOWFwbVNselFXaVpBMmtjejBNYlFLM0hUYlNlamZBNGZITjJFU0hmT3hq?=
 =?utf-8?B?UmZzNitkbit4bHkyOFhlcUlVQTU1OHY5SzFmb0xob25CTGF4akg2TXo5cHI5?=
 =?utf-8?B?N1Vza2F5c1lqM1pWTHg4TkNldS93SEhqUDdjOXl6dHpiRXFXWFJUcWVLM0Uy?=
 =?utf-8?B?RDRLTlNHTGo2VkxvUVhRKzhIWTV2S0ExUlU2L1h0WmE4bTFZU1BvKy9nRWVn?=
 =?utf-8?B?SWl0a2MzUmxsMGFLVUYzOFF6c1V0c2daMVZ3dTRhamdPbkcydmFQRmNTMmlK?=
 =?utf-8?Q?R/poFiSw5D9doKVaGtpyoo83Z5M5EDwxoWKPDw9?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5035b3f-46ee-40b6-7469-08d93a3ac512
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 13:43:53.9815 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PYkNHmbVfe2cygIA+Z0VYLOGMDEuYmkBj8fid+IZi1hKWOGFO899lhsVNByxITbexHsnhyeCt2Dtmmue7mw6LrFdce0A7tTzHh1lciJQEts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5282
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10028
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 spamscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106280096
X-Proofpoint-ORIG-GUID: bmvHIIiS6aOllSAyEoNfqaWsMwws7g1m
X-Proofpoint-GUID: bmvHIIiS6aOllSAyEoNfqaWsMwws7g1m
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 6/28/21 2:25 PM, Igor Mammedov wrote:
> On Wed, 23 Jun 2021 14:07:29 +0100
> Joao Martins <joao.m.martins@oracle.com> wrote:
> 
>> On 6/23/21 1:09 PM, Igor Mammedov wrote:
>>> On Wed, 23 Jun 2021 10:51:59 +0100
>>> Joao Martins <joao.m.martins@oracle.com> wrote:
>>>   
>>>> On 6/23/21 10:03 AM, Igor Mammedov wrote:  
>>>>> On Tue, 22 Jun 2021 16:49:00 +0100
>>>>> Joao Martins <joao.m.martins@oracle.com> wrote:
>>>>>     
>>>>>> It is assumed that the whole GPA space is available to be
>>>>>> DMA addressable, within a given address space limit. Since
>>>>>> v5.4 based that is not true, and VFIO will validate whether
>>>>>> the selected IOVA is indeed valid i.e. not reserved by IOMMU
>>>>>> on behalf of some specific devices or platform-defined.
>>>>>>
>>>>>> AMD systems with an IOMMU are examples of such platforms and
>>>>>> particularly may export only these ranges as allowed:
>>>>>>
>>>>>> 	0000000000000000 - 00000000fedfffff (0      .. 3.982G)
>>>>>> 	00000000fef00000 - 000000fcffffffff (3.983G .. 1011.9G)
>>>>>> 	0000010000000000 - ffffffffffffffff (1Tb    .. 16Pb)
>>>>>>
>>>>>> We already know of accounting for the 4G hole, albeit if the
>>>>>> guest is big enough we will fail to allocate a >1010G given
>>>>>> the ~12G hole at the 1Tb boundary, reserved for HyperTransport.
>>>>>>
>>>>>> When creating the region above 4G, take into account what
>>>>>> IOVAs are allowed by defining the known allowed ranges
>>>>>> and search for the next free IOVA ranges. When finding a
>>>>>> invalid IOVA we mark them as reserved and proceed to the
>>>>>> next allowed IOVA region.
>>>>>>
>>>>>> After accounting for the 1Tb hole on AMD hosts, mtree should
>>>>>> look like:
>>>>>>
>>>>>> 0000000100000000-000000fcffffffff (prio 0, i/o):
>>>>>> 	alias ram-above-4g @pc.ram 0000000080000000-000000fc7fffffff
>>>>>> 0000010000000000-000001037fffffff (prio 0, i/o):
>>>>>> 	alias ram-above-1t @pc.ram 000000fc80000000-000000ffffffffff    
>>>>>
>>>>> You are talking here about GPA which is guest specific thing
>>>>> and then somehow it becomes tied to host. For bystanders it's
>>>>> not clear from above commit message how both are related.
>>>>> I'd add here an explicit explanation how AMD host is related GPAs
>>>>> and clarify where you are talking about guest/host side.
>>>>>     
>>>> OK, makes sense.
>>>>
>>>> Perhaps using IOVA makes it easier to understand. I said GPA because
>>>> there's an 1:1 mapping between GPA and IOVA (if you're not using vIOMMU).  
>>>
>>> IOVA may be a too broad term, maybe explain it in terms of GPA and HPA
>>> and why it does matter on each side (host/guest)
>>>   
>>
>> I used the term IOVA specially because that is applicable to Host IOVA or
>> Guest IOVA (same rules apply as this is not special cased for VMs). So,
>> regardless of whether we have guest mode page tables, or just host
>> iommu page tables, this address range should be reserved and not used.
> 
> IOVA doesn't make it any clearer, on contrary it's more confusing.
> 
> And does host's HPA matter at all? (if host's firmware isn't broken,
> it should never use nor advertise 1Tb hole). 
> So we probably talking here only about GPA only.
> 
For the case in point for the series, yes it's only GPA that we care about.

Perhaps I misunderstood your earlier comment where you said how HPAs were
affected, so I was trying to encompass the problem statement in a Guest/Host
agnostic manner by using IOVA given this is all related to IOMMU reserved ranges.
I'll stick to GPA to avoid any confusion -- as that's what matters for this series.

>>>>> also what about usecases:
>>>>>  * start QEMU with Intel cpu model on AMD host with intel's iommu    
>>>>
>>>> In principle it would be less likely to occur. But you would still need
>>>> to mark the same range as reserved. The limitation is on DMA occuring
>>>> on those IOVAs (host or guest) coinciding with that range, so you would
>>>> want to inform the guest that at least those should be avoided.
>>>>  
>>>>>  * start QEMU with AMD cpu model and AMD's iommu on Intel host    
>>>>
>>>> Here you would probably only mark the range, solely for honoring how hardware
>>>> is usually represented. But really, on Intel, nothing stops you from exposing the
>>>> aforementioned range as RAM.
>>>>  
>>>>>  * start QEMU in TCG mode on AMD host (mostly form qtest point ot view)
>>>>>     
>>>> This one is tricky. Because you can hotplug a VFIO device later on,
>>>> I opted for always marking the reserved range. If you don't use VFIO you're good, but
>>>> otherwise you would still need reserved. But I am not sure how qtest is used
>>>> today for testing huge guests.  
>>> I do not know if there are VFIO tests in qtest (probably nope, since that
>>> could require a host configured for that), but we can add a test
>>> for his memory quirk (assuming phys-bits won't get in the way)
>>>   
>>
>> 	Joao
>>
> 

