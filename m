Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D859537FF69
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 22:45:56 +0200 (CEST)
Received: from localhost ([::1]:52624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhIDT-0007Mz-Mz
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 16:45:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lhIAr-0005Af-BL
 for qemu-devel@nongnu.org; Thu, 13 May 2021 16:43:13 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:41502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lhIAo-0006Xe-EE
 for qemu-devel@nongnu.org; Thu, 13 May 2021 16:43:12 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14DKZ2oL145750;
 Thu, 13 May 2021 20:43:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=fEgMGUBXJXYnxYgqd0AJZSWzKPJLB8gp5KhvvDspmr8=;
 b=Bi2UMD8NqyjFNyd8woFJkuy9NZxxeozEeSSQN7y516tD3FuqxbKhFwH8UUm8jIDiPCQx
 h/1dIfzNVkrkIrV9m34+tamgr5QFJfxXIlpwME/InkFUx9PTux2hfWLbRlP44o+Z/7Vg
 uendz+OYnTKyrDBhOyTi9H3Nsts40aZZUzsZACb2d7ovj/0XDi34CvCZsLNXgE/3TvAo
 wNb+EBrqWh3hIXYMxZdwXEOH4XIbjWzER2g2mwID6r2INDSLbzT93vvtXB0Ew4HRRuKI
 JyYNDOrV+70neZzQL+LL91UujWU/wlXGC1kmfG5CDS5dUJ2nMljEvPPYWtCBdLJCOuOm 0g== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 38gpnujsh0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 May 2021 20:43:05 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14DKeAmn012626;
 Thu, 13 May 2021 20:43:05 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
 by userp3020.oracle.com with ESMTP id 38gppgk46g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 May 2021 20:43:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cY6Nqcp8/H5aV2H8/aROJvP5fXr85DoVF1jVdLkbWEkADul2LPDAjlTZEPSaA1uOoDM2eRwVdP8rwrHrdqTJo39aHjxoTZL3S/l2DLUxKpGuZqUSWlb/USncoDUkBu3pSYwZCaxfqmVJ3E3K0f8iYOjsjh/KT2tBASHlApaPjJxXJAi6jG4/4qOy96lKMRa9RYIxmtU8g5wlwkUdihBtMCAlT7OXEPQSc0dVtaBOH560OJEiOJdezfHeSH/5ye3ZYf3skMMbCi/hmMx1IobGgJfR2M0f84YgQEKuLs62mezuwZZgq9OHFU0Hi+sbxEtKf3NxQs2v1X+vYKYVids9EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fEgMGUBXJXYnxYgqd0AJZSWzKPJLB8gp5KhvvDspmr8=;
 b=fuIZ+STWeLoYsmnb6Zq20Fu8MdYTVHF4XiWX73qiAxfO4NzCFTrAPIsEldpF/CSBCku8WPL9TRnECqfx4aT1+5wzMroRpdspYHonxe2YCOwFPIwHrXsS3PjAG+y6476zsBUYyJBrdt/BfflryQBpAk442daGiwBa5sQMTEOn66JC/L4bk3tGZzxbvXSjpzbHGG6xc9cSlg+VPUcnmuYJMPw71PT389vSGUxgsqt47xz9Ndu6YXavKJ7Rs/nVWKr09yQt1Jg8HIlR4dgpUtP01bMPcDI5K4EDr0hCN6Fg+22Vk8JnMsgnZlITi2ayK2cb29kikIaB06MGWV7RdB9f7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fEgMGUBXJXYnxYgqd0AJZSWzKPJLB8gp5KhvvDspmr8=;
 b=xbD+5aqUn+X3N5DtRQPPL7/ts7hV1PnVerTN+7k4ZDnDHGupC2wekyniOwbJ3C3ULdNbeXxAzZeo5t/QJnuiCWtaeBO/cIZKS5cE1F7ocRFbUPBcgFzIwLQ55Q8nLB01t9BiS8cauakst2dWAcWwpYXK7VopbNKEVG+ZqZvsoPY=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by SJ0PR10MB4589.namprd10.prod.outlook.com (2603:10b6:a03:2d0::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Thu, 13 May
 2021 20:43:02 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6ce3:f0a3:c303:f851]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6ce3:f0a3:c303:f851%7]) with mapi id 15.20.4108.031; Thu, 13 May 2021
 20:43:02 +0000
Subject: Re: [PATCH V3 00/22] Live Update
To: qemu-devel@nongnu.org
References: <162039245100.3634.16001097156143157146@d887ba82c771>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
Message-ID: <74bc9f50-5567-ecd3-187a-da51b33b5184@oracle.com>
Date: Thu, 13 May 2021 16:42:58 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <162039245100.3634.16001097156143157146@d887ba82c771>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [24.62.106.7]
X-ClientProxiedBy: SN7PR04CA0229.namprd04.prod.outlook.com
 (2603:10b6:806:127::24) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.92] (24.62.106.7) by
 SN7PR04CA0229.namprd04.prod.outlook.com (2603:10b6:806:127::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Thu, 13 May 2021 20:43:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c62d961-eac0-46cf-4502-08d9164fb382
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4589:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4589112A3874D67D9BA95051F9519@SJ0PR10MB4589.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HCmcY6inQTjRlpgmfN3MXYSNm4X8XVgq8MaPOgGhaSpjss6A7YYxdCzta3C/KvmMlx8CEvxskaEAph2kRyopeIMPedSx7wcBMlxgfKHdCbM7ojI6cK+Prjeoq+xRNQU5/WwZiGMgivq3k5eq5dCVohjvVB7wQFmZOj7y+b9/zgKLUy0vL29IPX+6axnhQYE5A0NJLM94CiOXIGUQv907TwHomGCex7atxtGfW2bde6lADPBZOd4QGUhQJNNmrPfovCYJ8olhwFJ2WRHPTFJecEwQqQ4CAjHrsUSrZANCW2oVizgQxRyu21+R0BTHhfuYM4xNKv1YrsN9cFmRCylCrkuZCBGHSWKIdE31tAni+tZrfo/tyUfBDRUefFQ+Kag9Kbyr0gFtQT8z6ddWF18J6riKeY7K8V3ExiS/I9WUqypilMGPuCNU09ZumLK69nPMFx2hEquxZdOyorpqERhiznAcCgHuMVIVg6902upvTTqg4UTpyV4V9haSIO45eH7ckVxHZdcrRbAGxhpWsqZOQo0BB6zYGrpAHxZ0EhdJBXRyN4GkAICW18WmpFY7rpBpNRUlYYr0GYsyViOyU8U96o0VN6cLHncgggEayHC7abU6/JcOXba1WivXrobNygmsGEBrSFz6S5pMSPLs8Kj9UIpOtewXC+Am00ma+g8hl3fqgEU5woLvXfGc//Qe0KqJXqBn/R0fkmgxRU1+0tQy+SyzgyIb57A18Zg7H6BjUDeLsi5UcDFcZ14hBmKGhq9I
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(366004)(346002)(376002)(136003)(396003)(7416002)(186003)(66946007)(66556008)(66476007)(31696002)(16526019)(31686004)(316002)(83380400001)(36916002)(44832011)(8936002)(15650500001)(2906002)(36756003)(478600001)(5660300002)(38100700002)(966005)(8676002)(2616005)(4326008)(26005)(53546011)(86362001)(956004)(16576012)(6916009)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QmQ1UlNWdXV6Zm5pTk1XTGJrTW5pbEVXZ0Q3Z1h3QXRqa0ZDYkpPbmo0aTJm?=
 =?utf-8?B?RitXTkl4ZVZPL3FLM2pxeEVsemFNQnlxYWJNMUxUZndNdFU0eTlORk9iaUU3?=
 =?utf-8?B?MDVuWWl2Q2g0T1p6ZGNSRDVYMlFyMlJ4NXBZTGVaRjNGcXJlZXdjdWhZZUVM?=
 =?utf-8?B?Vm1GSUFhVGY4bGcvWHVJMVcrOGJoMCt6YkFoVmhaVjdVWXlmUUw4c2RMSDds?=
 =?utf-8?B?YWhkL3oxdE4wZVpKbEQ0aXhMZVlMMC81WlI1dURzRGJ2RUpMSmZQZWFCRlpU?=
 =?utf-8?B?ajVNeDFNeVpRYzM3WndwbDNEd2VHamxrSlRzaGVwTm9PWGNiQUE0OFc2cVhV?=
 =?utf-8?B?NkFZbHVhRDZxYTgvbzNUQWlEZWdWWWhVdEJWT084L21XdGVKQm1jMDFtWXpZ?=
 =?utf-8?B?UjhFUXB3UG9FcENGaFVpU3pjSnA1dElJam9GY2Vmd0VyVlYwQWtWd3ZubDRR?=
 =?utf-8?B?a2JvdExhdVVuVXM5K3lTaVRTdWR4Yi94MlAxbjY1WkVUT0JIU0RYN3BGNmh6?=
 =?utf-8?B?dTR3ZTJPWTNtRWNVVEpBUDYrKzR2M0JaaG9TSlFnbUNXQXQvQWFiQ21RS1JD?=
 =?utf-8?B?NU9vNFdQWE1QTEFqUXlOdXZRZEpudkx4emNnV0lvUjdwdDUvUFVmZkh4VE5y?=
 =?utf-8?B?L2QvbDVmcnV0YkFFbExiUFRVYlN2VUVXdnFrVlJqdURkenpxaGxIdm92MlhF?=
 =?utf-8?B?RzZwellZeHhoK2V1U2ZqMjg4Y0U5Q0Z0RFlwRitDSVgrNHNGdVBEVURzWEQ4?=
 =?utf-8?B?MjRnTGJoVXhCbi9wMHdaZVhmc2lzSUQranJTZWtkUTRrWUt2OGF6UkpIUXZ5?=
 =?utf-8?B?alAySDhtYXRIQkZqQTlyNnRsTXorVklNVkdIeDQveUw1M2RkUDNvUTcycUxz?=
 =?utf-8?B?ZmpYb1RjbUdXbzd4dWI2NUFQdSttZTVaS2dGL3l6T0RTYm9DTHRqd29UMFlp?=
 =?utf-8?B?aTBqdld6RDhIY2ZKalBGNUd0aEhLNVpCaDUrSCthejVuV2ExWXFWSUdlQS9C?=
 =?utf-8?B?K3c0eERZSHRaMHI4bXVnNzNOTmV4OHdSeDMxSXRhWVQ2bENyaXRwbVZxRlZp?=
 =?utf-8?B?NUtEamhTODNoRFRLWkp4a1VYYmRGeEdLVGxlRTBFdGFDRm81MlJObFZ1R2tR?=
 =?utf-8?B?cVF2bk9uNXVVWmZlTURnRDEwSm0wV2hEMzVwUmk1NDEzdFBvUTFKYlFFZlEx?=
 =?utf-8?B?dEhsVlgyc1lWVjZkMEdlNjQ0UUNPeEc4RUxURFlHM0RNRnVVMG04OTFFU1E5?=
 =?utf-8?B?WnBSSDRlNW1rNktSU25GK3pKbmplNEFPekRoMVhPTjAyelJiRmVmWGtZZlEz?=
 =?utf-8?B?TTVodVhTd08yZWZGa3RGZHZuU1hNbDdMRU1QRXlsbGtyY3ppWjF0RVpnZmdl?=
 =?utf-8?B?RFJxUFQrZnc3ZEptQm1TbmpYMzNlR1BlK0QzQ1BwNS8zT2ZQejFQN2JvUGcx?=
 =?utf-8?B?bllFNGhxcnNBQ2xRWlpxWWh1bVpwTkxVYmNvV2RHcVJRV2xpZXVYMC9VbU1R?=
 =?utf-8?B?bXVnaXp5cG8wY0hKQlQ0cDY4MUxqVHhKRGdkOThvcFNHZ2NxekY3T1hIc2lk?=
 =?utf-8?B?dWNOZ1VxMUc1V3lkbjdORlc5cVpXRW91TE1DRG5uaW5YaUpVRHlvMitIYitl?=
 =?utf-8?B?dGlaZjVzLzJrTlYyMTBzWFA5ZzZscWlKeU5QMGZCTUlkTjg2MVowWENZWTY0?=
 =?utf-8?B?eFFZZnZkVy9JcENDUTNrNHZBYW5vZEVuMjNoMGRXRnprK1Y0NXJLdXdWa2pp?=
 =?utf-8?Q?fjvD9SEoRnRzVGZhSCb3sp/s5P3Zkna3xLi7e7m?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c62d961-eac0-46cf-4502-08d9164fb382
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2021 20:43:02.1461 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rVmk06NLg2k59wnqvMzXF2FhbAVxEW/S5sx1VWf2ytINvOLxNy+8tqMOiNLn5EmQwumKkF8On/w/UHLEwUbwjFw2LlafEnFgsJolVsuUeh0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4589
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9983
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105130145
X-Proofpoint-ORIG-GUID: P3594drJfo8Ia9-VzvRH7GnfBAFxwLf0
X-Proofpoint-GUID: P3594drJfo8Ia9-VzvRH7GnfBAFxwLf0
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9983
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 impostorscore=0
 adultscore=0 spamscore=0 clxscore=1015 mlxlogscore=999 bulkscore=0
 mlxscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105130144
Received-SPF: pass client-ip=156.151.31.85;
 envelope-from=steven.sistare@oracle.com; helo=userp2120.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_PASS=-0.001,
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
Cc: jason.zeng@linux.intel.com, quintela@redhat.com, philmd@redhat.com,
 mst@redhat.com, dgilbert@redhat.com, armbru@redhat.com,
 alex.williamson@redhat.com, pbonzini@redhat.com, stefanha@redhat.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I will add to MAINTAINERS incrementally instead of at the end to make checkpatch happy.

I will use qemu_strtol even though I thought the message "consider using qemu_strtol"
was giving me a choice.

You can't fight The Man when the man is a robot.

- Steve

On 5/7/2021 9:00 AM, no-reply@patchew.org wrote:
> Patchew URL: https://patchew.org/QEMU/1620390320-301716-1-git-send-email-steven.sistare@oracle.com/
> 
> Hi,
> 
> This series seems to have some coding style problems. See output below for
> more information:
> 
> Type: series
> Message-id: 1620390320-301716-1-git-send-email-steven.sistare@oracle.com
> Subject: [PATCH V3 00/22] Live Update
> 
> === TEST SCRIPT BEGIN ===
> #!/bin/bash
> git rev-parse base > /dev/null || exit 0
> git config --local diff.renamelimit 0
> git config --local diff.renames True
> git config --local diff.algorithm histogram
> ./scripts/checkpatch.pl --mailback base..
> === TEST SCRIPT END ===
> 
> Updating 3c8cf5a9c21ff8782164d1def7f44bd888713384
> From https://github.com/patchew-project/qemu
>  * [new tag]         patchew/1620390320-301716-1-git-send-email-steven.sistare@oracle.com -> patchew/1620390320-301716-1-git-send-email-steven.sistare@oracle.com
>  - [tag update]      patchew/20210504124140.1100346-1-linux@roeck-us.net -> patchew/20210504124140.1100346-1-linux@roeck-us.net
>  - [tag update]      patchew/20210506185641.284821-1-dgilbert@redhat.com -> patchew/20210506185641.284821-1-dgilbert@redhat.com
>  - [tag update]      patchew/20210506193341.140141-1-lvivier@redhat.com -> patchew/20210506193341.140141-1-lvivier@redhat.com
>  - [tag update]      patchew/20210506194358.3925-1-peter.maydell@linaro.org -> patchew/20210506194358.3925-1-peter.maydell@linaro.org
> Switched to a new branch 'test'
> 8c778e6 simplify savevm
> aca4f09 cpr: maintainers
> 697f8d0 cpr: only-cpr-capable option
> 0a8c20e chardev: cpr for sockets
> cb270f4 chardev: cpr for pty
> 279230e chardev: cpr for simple devices
> b122cfa chardev: cpr framework
> 6596676 hostmem-memfd: cpr support
> 8cb6348 vhost: reset vhost devices upon cprsave
> e3ae86d vfio-pci: cpr part 2
> 02c628d vfio-pci: cpr part 1
> d93623c vfio-pci: refactor for cpr
> bc63b3e pci: export functions for cpr
> 2b10bdd cpr: HMP interfaces
> 29bc20a cpr: QMP interfaces
> 3f84e6c cpr
> 0a32588 vl: add helper to request re-exec
> 466b4cf machine: memfd-alloc option
> 50c3e84 util: env var helpers
> 76c3550 oslib: qemu_clr_cloexec
> d819bd4 qemu_ram_volatile
> c466ddf as_flat_walk
> 
> === OUTPUT BEGIN ===
> 1/22 Checking commit c466ddfd2209 (as_flat_walk)
> 2/22 Checking commit d819bd4dcc09 (qemu_ram_volatile)
> 3/22 Checking commit 76c3550a677b (oslib: qemu_clr_cloexec)
> 4/22 Checking commit 50c3e84cf5a6 (util: env var helpers)
> Use of uninitialized value $acpi_testexpected in string eq at ./scripts/checkpatch.pl line 1529.
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #19: 
> new file mode 100644
> 
> ERROR: consider using qemu_strtol in preference to strtol
> #72: FILE: util/env.c:20:
> +        res = strtol(val, 0, 10);
> 
> total: 1 errors, 1 warnings, 129 lines checked
> 
> Patch 4/22 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
> 
> 5/22 Checking commit 466b4cf4ce8c (machine: memfd-alloc option)
> 6/22 Checking commit 0a32588de76e (vl: add helper to request re-exec)
> 7/22 Checking commit 3f84e6c38bd6 (cpr)
> Use of uninitialized value $acpi_testexpected in string eq at ./scripts/checkpatch.pl line 1529.
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #55: 
> new file mode 100644
> 
> total: 0 errors, 1 warnings, 314 lines checked
> 
> Patch 7/22 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
> 8/22 Checking commit 29bc20ab5870 (cpr: QMP interfaces)
> Use of uninitialized value $acpi_testexpected in string eq at ./scripts/checkpatch.pl line 1529.
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #81: 
> new file mode 100644
> 
> total: 0 errors, 1 warnings, 136 lines checked
> 
> Patch 8/22 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
> 9/22 Checking commit 2b10bdd5edb3 (cpr: HMP interfaces)
> 10/22 Checking commit bc63b3edc621 (pci: export functions for cpr)
> 11/22 Checking commit d93623c4da4d (vfio-pci: refactor for cpr)
> 12/22 Checking commit 02c628d50b57 (vfio-pci: cpr part 1)
> Use of uninitialized value $acpi_testexpected in string eq at ./scripts/checkpatch.pl line 1529.
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #271: 
> new file mode 100644
> 
> total: 0 errors, 1 warnings, 566 lines checked
> 
> Patch 12/22 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
> 13/22 Checking commit e3ae86d2076c (vfio-pci: cpr part 2)
> 14/22 Checking commit 8cb6348c8cff (vhost: reset vhost devices upon cprsave)
> 15/22 Checking commit 65966769fa93 (hostmem-memfd: cpr support)
> 16/22 Checking commit b122cfa96106 (chardev: cpr framework)
> 17/22 Checking commit 279230e03a78 (chardev: cpr for simple devices)
> 18/22 Checking commit cb270f49693f (chardev: cpr for pty)
> 19/22 Checking commit 0a8c20e0a8d4 (chardev: cpr for sockets)
> 20/22 Checking commit 697f8d021f43 (cpr: only-cpr-capable option)
> Use of uninitialized value $acpi_testexpected in string eq at ./scripts/checkpatch.pl line 1529.
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #200: 
> new file mode 100644
> 
> total: 0 errors, 1 warnings, 133 lines checked
> 
> Patch 20/22 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
> 21/22 Checking commit aca4f092c865 (cpr: maintainers)
> 22/22 Checking commit 8c778e6f284c (simplify savevm)
> === OUTPUT END ===
> 
> Test command exited with code: 1
> 
> 
> The full log is available at
> http://patchew.org/logs/1620390320-301716-1-git-send-email-steven.sistare@oracle.com/testing.checkpatch/?type=message.
> ---
> Email generated automatically by Patchew [https://patchew.org/].
> Please send your feedback to patchew-devel@redhat.com
> 

