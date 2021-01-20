Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC312FD7E9
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 19:13:08 +0100 (CET)
Received: from localhost ([::1]:34052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Hyd-0006c0-5x
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 13:13:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alejandro.j.jimenez@oracle.com>)
 id 1l2Hv8-0004Z7-CD
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 13:09:30 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:49874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alejandro.j.jimenez@oracle.com>)
 id 1l2Hv4-0007be-V9
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 13:09:29 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10KHxXNv184468;
 Wed, 20 Jan 2021 18:09:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=FljvPsth2LOxCDkVIdqsQnri7TmbdcEXT4lfuFS60G4=;
 b=oy5W1DFGTxzCc+McGZYFSBwg/Day3kljSb7XVv0082u40zjVQbu4pM1JxGXp+oQgV8u6
 KxQTMv1hsw/KWMwkmqdmA8+ysf14ysUFQX2EuCA0ZtTNS7mQwtJvPUflatVbsNNIv9sr
 +Bpd6igKDCKiUfhzhs+aG8Vnxl9zeOgS543jTSP1q52crw9nKo4pVukhoA5slbGQ6YgV
 k+eZXonKxwWsdqGMRxwUvv//yew7ul58BJAvoQn9XUI7cIE+mZJIAJ6Klr2QavYxHC1d
 0YUczoTtIMH6SdoSJwp9OmQeMbgmIjDsAxtHBkrGeG+L0QDal7tzmrHUsYOBO5ma6+G4 bQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 3668qabs5d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 18:09:24 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10KI5gri113882;
 Wed, 20 Jan 2021 18:09:23 GMT
Received: from nam02-cy1-obe.outbound.protection.outlook.com
 (mail-cys01nam02lp2050.outbound.protection.outlook.com [104.47.37.50])
 by userp3030.oracle.com with ESMTP id 3668rdjxeu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 18:09:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nG83H3qpZklqw8TrZMfBGOJhySdp43Ptjj4wXxBXuNUZZk+VuOGceHY3ByUtI6UO1wOWui9Pvr/MVNoYKhtnRs8jCjo8ICMBsuebCRosAeVBuE1CRjLhpWms05XHjbvwy4U/Ctb6J3+sK1WSYmLk0AqgcvU82RQkAvX4rpGW7LNCEbU1scV55Cv9B+qjQHUROPtban9BdoS2zah/Gm90xbV9iuTkU1Q1yEWSHqmKFx21LHEppmONBjXOxqBm2IieGr35kZpUXgPih5JJpCMfFgfEsGE7eDGQfdeDZt8lEhObDjoAwT+6jQueEPKVAxcADEtp4rMr29vU5M1SGEopQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z+pijxctpDWyj9UHEsNRjyFqhZ2ZfYrMYWk7H9KOzKE=;
 b=h/qD+0DnDEfAngw5zysRU5k9dcwPZHS07cGLoiN/dvUxGCQFgG4IkJKyRBUYYbeO0PLrmdvu1KgN+papOT+iFA469OmzuSJbrgh0lwqKsabyK0FTyuydZkVp7nKy30DZs4lNuUFwEU3wRv6lveWRqL/ILbSRxIIg5m2wwxCe3gqjgC/zRYYuQdhmIaasqzUJmj79zmZw1mxSh6xb6yZjQSM3srEshcfl9rjxyX5XRQ+OXWWXtmxz8gEilK6TiMeJ1lmaR02opja+vnBx1NFN+C1rUj91Tu03/LLe5E2yaFyb/jUKSn5GLJmAd4UdnEFMTevyJTJQmwY3gN4rYpm8Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z+pijxctpDWyj9UHEsNRjyFqhZ2ZfYrMYWk7H9KOzKE=;
 b=uN/EIuLd3pUqsSdXg2rcP9CNqT2ph73YKaAhxhn+Mmjf72aTWiMyPRG1hCsrq89K5+xKmwWzaX/V+WYwShmTfBQ1oe7R5tZEqlV0vuAOlEZdrpWbVC18NJ4OEmKWdvTzpTDmwzUSE33X9lvEM0N8E5o67yjWnYOoK1ApLnLsT34=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from SJ0PR10MB4750.namprd10.prod.outlook.com (2603:10b6:a03:2d5::7)
 by SJ0PR10MB4576.namprd10.prod.outlook.com (2603:10b6:a03:2ae::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Wed, 20 Jan
 2021 18:09:20 +0000
Received: from SJ0PR10MB4750.namprd10.prod.outlook.com
 ([fe80::8cee:110d:7287:821e]) by SJ0PR10MB4750.namprd10.prod.outlook.com
 ([fe80::8cee:110d:7287:821e%6]) with mapi id 15.20.3763.014; Wed, 20 Jan 2021
 18:09:20 +0000
Subject: Re: [PATCH] runstate: cleanup reboot and panic actions
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210120143706.345821-1-pbonzini@redhat.com>
From: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
Organization: Oracle Corporation
Message-ID: <ce11601e-fca6-bd6a-aad5-423587982e12@oracle.com>
Date: Wed, 20 Jan 2021 13:09:17 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210120143706.345821-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [24.125.97.121]
X-ClientProxiedBy: BYAPR01CA0034.prod.exchangelabs.com (2603:10b6:a02:80::47)
 To SJ0PR10MB4750.namprd10.prod.outlook.com
 (2603:10b6:a03:2d5::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.50.86] (24.125.97.121) by
 BYAPR01CA0034.prod.exchangelabs.com (2603:10b6:a02:80::47) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Wed, 20 Jan 2021 18:09:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d02c4cda-19c5-46bf-d262-08d8bd6e821d
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4576:
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4576A3FCFD186D21A4FAFFA1C7A29@SJ0PR10MB4576.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fFZZJec2M4w4HHyTkjjjuNI0qMCFeM9HE63mHGwykXr5yr/JQHUFtwQmWGzI0ZJ8Lb+xfvpZCmzO98kjDiX4BJkfe+OSlAImoawLeLuLCdQvsXvfLE0gPuAbAUpVtVvYHS1eHAjU7GlGsYxx1h2scg0VUtF0BuVkXrQAkyVyOXj2vj0kwgnKV/JrLgGpoYQ2xsDRwhxPYYYdurS0sF2xKA95JCcBVbF6MFObNvhh6N01v9pWnHP5NBFLzPxnFx/x2MnL0oJviEuPGaenP1tTL7nF4YxtL1Eh6o2Ck/qfmstd58SLlbNqk4pePXyqNe4kn7fTybhntsYxgzuwJVbD3lsqbANu1CXUZ7YC2yyYbgHaPgP0B9zZu0woJQHjfaO/mrAZQ8XrvcSM0M9boaix1Icv2XRaDl/I7ooqFq62WUaxgQ/hr5l3G0DUEyL6CnsssydxGhYFAdbLKr1SAVGlax0S3xxg+ps/R/sCMRChoww=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4750.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(86362001)(498600001)(6486002)(31686004)(83380400001)(2906002)(31696002)(16526019)(2616005)(16576012)(956004)(53546011)(8936002)(36756003)(66556008)(66476007)(186003)(66946007)(5660300002)(8676002)(26005)(36916002)(43740500002)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?4r2mL4oexjgN8n5prVCTTxT/nPnKsLxBlpQbQeJB4kdjS34y5JO56dX3?=
 =?Windows-1252?Q?YEmq7UmAJ9LAkGvtvPXwC/j3+s6qGkHXMkQmEQg5aIDD89hufpEVL56a?=
 =?Windows-1252?Q?SzFfYbeKchDm4xIOnOnVJ7o8FjVEaN9Hyw0eAqc5TOSycTzJAa5eeHdu?=
 =?Windows-1252?Q?/tJoMrdn45cOoXLzW8ZXDk2g+9Ca/nitJPHhxyICoWTvRVfND3hzBXtV?=
 =?Windows-1252?Q?rrze8uVakVzV/P4hi6Bc22dU5F+BI3C1BsDNjZEZw9HTi71+suxHMxUb?=
 =?Windows-1252?Q?9dAthWUYU6kbkp6ZNG90Z3hbZW5t70GzrnopVuUTBPQrcfpLqVILdbpN?=
 =?Windows-1252?Q?dm/+EZB0BlwDiJdn6h83xKrGct/58FLWsswNWVMJBWT7i4hsLiBf0ou5?=
 =?Windows-1252?Q?iSWwQDIgDWbKJXYXBJwComv/QdOFM+ZngqaMCCqskLp4fWhzSa1eLcsC?=
 =?Windows-1252?Q?wxVPZ9i+6JtQpW+1AJ914QrpD9poHsfVJ3a25L4/GeRDigG15c9rekDq?=
 =?Windows-1252?Q?skkpEaipDdtSMGkhpDMPjfr3SNmwtrvUh5Ls0gfw7NToxxLZ9bsVDjHQ?=
 =?Windows-1252?Q?lcce5NwRemp5O3z+2ty5HsnqeuIhyPn9XtxIB6lZN+aX4U6BAVwa4PRz?=
 =?Windows-1252?Q?qSGj/7BRPvS8Y8VqjrD/7zBu8KMvehmFFimHNEbDGr3lhvHlYoB+4FrB?=
 =?Windows-1252?Q?f3CAoafw6Uw+m9a1mMOspLQ7RVeqV3KfZkOEDauZpYGYsdMGbI6vPfx4?=
 =?Windows-1252?Q?EaMfBj6Ec6n1Q6K5VNLfBlMN07dunoO0/XQBVLGaEcybDVd6kdI3AuCI?=
 =?Windows-1252?Q?ycogBOa+7nj6WW+upIeZpLPckWPQ6gpFu2Fd+aoJ8TYunAHSrXYeyGHd?=
 =?Windows-1252?Q?LHeMVaeVnJclHG+dqJiGgVxahSVAyrnR0NRtHawSIuIRzn+61haNvE41?=
 =?Windows-1252?Q?HBdwnYufahjefLpuO17dbkwkXFLUJR2UHPytg3kkr0UDZSiuxfnfe5XX?=
 =?Windows-1252?Q?W2BkB/YvSr8S7pvs3YinGerC86Ae8lC3HzCn8XCtzZf76EXJi9caMW7D?=
 =?Windows-1252?Q?eay41ccCUn4U87Ka?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d02c4cda-19c5-46bf-d262-08d8bd6e821d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4750.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 18:09:20.2598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZVrNIYNDM2rcsPe2sTjHkfxKdmp1DpTGLxm9y1p189Ijj4t//tOYTvzJ2Jhu5Zz8OlZOUZEqbu/d/zfqbEnBvWvlxZs9uvZwNGWGWOBPvko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4576
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9870
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 spamscore=0
 suspectscore=0 phishscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101200106
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9870
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0
 impostorscore=0 mlxscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101200105
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=alejandro.j.jimenez@oracle.com; helo=userp2130.oracle.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_MED=-2.3,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/20/2021 9:37 AM, Paolo Bonzini wrote:
> The possible choices for panic, reset and watchdog actions are inconsistent.
>
> "-action panic=poweroff" should be renamed to "-action panic=shutdown"
> on the command line.  This is because "-action panic=poweroff" and
> "-action watchdog=poweroff" have slightly different semantics, the first
> does an unorderly exit while the second goes through qemu_cleanup().  With
> this change, -no-shutdown would not have to change "-action panic=pause"
> "pause", just like it does not have to change the reset action.
>
> "-action reboot=none" should be renamed to "-action reboot=reset".
> This should be self explanatory, since for example "-action panic=none"
> lets the guest proceed without taking any action.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   qapi/run-state.json       | 10 ++++++----
>   qemu-options.hx           |  8 ++++----
>   softmmu/runstate-action.c |  4 ++--
>   softmmu/runstate.c        |  7 ++++---
>   softmmu/vl.c              |  2 +-
>   5 files changed, 17 insertions(+), 14 deletions(-)
>

> diff --git a/softmmu/runstate-action.c b/softmmu/runstate-action.c
> index 99ce880886..ae0761a9c3 100644
> --- a/softmmu/runstate-action.c
> +++ b/softmmu/runstate-action.c
> @@ -13,9 +13,9 @@
>   #include "qapi/error.h"
>   #include "qemu/option_int.h"
>   
> -RebootAction reboot_action = REBOOT_ACTION_NONE;
> +RebootAction reboot_action = REBOOT_ACTION_RESET;
>   ShutdownAction shutdown_action = SHUTDOWN_ACTION_POWEROFF;
> -PanicAction panic_action = PANIC_ACTION_POWEROFF;
> +PanicAction panic_action = PANIC_ACTION_SHUTDOWN;
>   
>   /*
>    * Receives actions to be applied for specific guest events

Hi Paolo,
Since you have removed the need for "fixing" the panic action when 
-no-shutdown (or its equivalent action/qmp command) is issued, I'd also 
remove the following comment on qmp_set_action():

      /* Process shutdown last, in case the panic action needs to be 
altered */
      if (has_shutdown) {
          shutdown_action = shutdown;
      }

> diff --git a/softmmu/runstate.c b/softmmu/runstate.c
> index 6177693a30..beee050815 100644
> --- a/softmmu/runstate.c
> +++ b/softmmu/runstate.c
> @@ -471,14 +471,15 @@ void qemu_system_guest_panicked(GuestPanicInformation *info)
>       }
>       /*
>        * TODO:  Currently the available panic actions are: none, pause, and
> -     * poweroff, but in principle debug and reset could be supported as well.
> +     * shutdown, but in principle debug and reset could be supported as well.
>        * Investigate any potential use cases for the unimplemented actions.
>        */
> -    if (panic_action == PANIC_ACTION_PAUSE) {
> +    if (panic_action == PANIC_ACTION_PAUSE
> +        || (panic_action == PANIC_ACTION_SHUTDOWN && shutdown_action == SHUTDOWN_ACTION_PAUSE)) {
>           qapi_event_send_guest_panicked(GUEST_PANIC_ACTION_PAUSE,
>                                           !!info, info);
>           vm_stop(RUN_STATE_GUEST_PANICKED);
> -    } else if (panic_action == PANIC_ACTION_POWEROFF) {
> +    } else if (panic_action == PANIC_ACTION_SHUTDOWN) {
>           qapi_event_send_guest_panicked(GUEST_PANIC_ACTION_POWEROFF,
>                                          !!info, info);
>           vm_stop(RUN_STATE_GUEST_PANICKED);

I see that you are moving forward with only sending the GUEST_PANICKED 
event once.

Reviewed-by: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>

> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 7ddf405d76..59304261cf 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -3202,7 +3202,7 @@ void qemu_init(int argc, char **argv, char **envp)
>                   break;
>               case QEMU_OPTION_no_shutdown:
>                   olist = qemu_find_opts("action");
> -                qemu_opts_parse_noisily(olist, "panic=pause,shutdown=pause", false);
> +                qemu_opts_parse_noisily(olist, "shutdown=pause", false);
>                   break;
>               case QEMU_OPTION_uuid:
>                   if (qemu_uuid_parse(optarg, &qemu_uuid) < 0) {


