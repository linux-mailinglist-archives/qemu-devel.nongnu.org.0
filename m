Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BA253E145
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 09:28:05 +0200 (CEST)
Received: from localhost ([::1]:58786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ny79f-0003M2-PR
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 03:28:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hnarukaw@yahoo-corp.jp>)
 id 1ny6ho-0007V9-25
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 02:59:18 -0400
Received: from corp-ob09.yahoo-corp.jp ([182.22.125.216]:51792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hnarukaw@yahoo-corp.jp>)
 id 1ny6hk-0006Ws-4F
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 02:59:15 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01lp2171.outbound.protection.outlook.com [104.47.23.171])
 by corp-ob09.yahoo-corp.jp (Postfix) with ESMTPS id 7C04119FB184;
 Mon,  6 Jun 2022 15:59:05 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo-corp.jp;
 s=default; t=1654498745;
 bh=XIlYW9nWlsYd+tZW+4r7QARQO1LAguXHKhqMUJWlJYs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=bw18kam8R+jjZ2usV6Opnq+naBycVwz129YP0Tl9m4fEbTIGGwjx82HhRo9NVFIFC
 1bzl/WQu5wU4kWG06u1etaiahloS4nYdhurakuBki+h1jA1AE42z1rGLVU/pnuqYqn
 trc2rIvPIEQKEjnWehDFz4/++6+kB0VPxZhni2AI=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QLcObU0UTCSXu92L43ZLVxMNFITuBX1AOpZK+L4rlH6n078DjaQarWvxEfTCmWCSrhKMzWB69X8lDkZjzI77ij8307yMGgw2epWYZ97cetkNiYG5QQcnLvfom2bROpHH7gJu4aY08WH485sNc/hnD0wkKYA2+O/IM89FknM/KFhIhkFDgosh6ToZFWisiFTgzAe39Hv/Lc0RQPP8vu4ixnICJGEup0UJLqNkO1bn4xIOzVgP7leOGiadmwwpIYV/aCYSCI1g9WS6RYViCdL6qEsKjF+JXGeqMrtbrSKW1pL0bMNicbe0prj3tgiGm49O8BG9b+Aw1904S1KhYzamdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XIlYW9nWlsYd+tZW+4r7QARQO1LAguXHKhqMUJWlJYs=;
 b=QzZ2RtLNEogT05f+1xFY9jcKLlcXE/0Ru/K4TqEdt9druGCe+IDvfDCEj6X/ezdYMM93KWwVUzNlJV9AIpNFmQEz4joW52epxt6939LfDJ1K5vIOZ9b0yx8SRkUwKEnQkDx+YjbWGNmPMQggBogLDN/sZ5ePcTHZDDpE/d2/npLdn2UMEN1Fw9tqtx6NKw3SKOQ8Wqpfd6RM4oFVOq0ingC57b0mTBLAtQYhwQ7kXv9nAhDh3ngR52s7viiht4KYqOBlHIiH7f0qd6rKcaYHbgVeTeDkY+010XrGW4sYub7qmACceOUFTWR5WdEo+HPQe7I1cexSH2M0dDIQ+b9lUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=yahoo-corp.jp; dmarc=pass action=none
 header.from=yahoo-corp.jp; dkim=pass header.d=yahoo-corp.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yjcorp.onmicrosoft.com; s=selector1-yjcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XIlYW9nWlsYd+tZW+4r7QARQO1LAguXHKhqMUJWlJYs=;
 b=NKJfNWYO4f/0FtAlHPhzn40xqvH3Qu6BJLCHsU3/nl7YUDOcOtvsMxM2F58Sj6WKSnI1tIeZVlkLY07uKmpeCOJaPkpcquproXM5+zkyqtXtMLIY5rTucPOcnSOK/H6csaGUNZAgpkpXQVdFEih/6nEJ0t3dZGMVHj/2YsOhRY8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=yahoo-corp.jp;
Received: from TYWPR01MB10194.jpnprd01.prod.outlook.com (2603:1096:400:1e6::5)
 by TYAPR01MB4992.jpnprd01.prod.outlook.com (2603:1096:404:127::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Mon, 6 Jun
 2022 06:59:04 +0000
Received: from TYWPR01MB10194.jpnprd01.prod.outlook.com
 ([fe80::9d9a:354d:e1f6:70c1]) by TYWPR01MB10194.jpnprd01.prod.outlook.com
 ([fe80::9d9a:354d:e1f6:70c1%7]) with mapi id 15.20.5314.019; Mon, 6 Jun 2022
 06:59:04 +0000
Message-ID: <cf3f35af-2f0e-4ff5-e596-3ad1f3adf523@yahoo-corp.jp>
Date: Mon, 6 Jun 2022 15:59:02 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 0/1] Fix occasional test fail on multithread
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, aoiwa@yahoo-corp.jp
References: <20220517082954.1566-1-hnarukaw@yahoo-corp.jp>
From: =?UTF-8?B?5oiQ5bedIOW8mOaouQ==?= <hnarukaw@yahoo-corp.jp>
In-Reply-To: <20220517082954.1566-1-hnarukaw@yahoo-corp.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYWPR01CA0046.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::10) To TYWPR01MB10194.jpnprd01.prod.outlook.com
 (2603:1096:400:1e6::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 714948a1-7961-4472-8345-08da478a0b14
X-MS-TrafficTypeDiagnostic: TYAPR01MB4992:EE_
X-Microsoft-Antispam-PRVS: <TYAPR01MB49924C4E9AB04B3140E5545A80A29@TYAPR01MB4992.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qo/sJuCX6fKTVrVCbnkRdQccSoCh3mJukApxU8tZwbZJ/LQqP/x1e/wOmZzoJ0Md4+mdcjNBTblEBkjAszbax7Q81u+juO33g7ndA+8IE5AfTcz6k3asGusJAn9cDqWuHNAnjRHiDSpjm8okl6FJiyoZquhW6/fcXIjFt0qo/uE7T0Mqa2ybbf20mR0JsWh13yNs30LfV5um8cu1TD2jAosZ2cZ3XMEwDYwmgqTevb6BUHqCM0I+VLMIq0WOQY0ykp18zh+CWPQzppm8eWgAt341J/I5P6rXljWj9yR/8RpM8PgjpPR8yiVxITUt7te8DZ6ghYrCMAMbKZhV5hqHWZ7aLoHGPClWksLbKPxC5zSJQ99nZIRDNpiFh+qq62rRa/rUjOjCEYh8hDJz/lRP9vyEnqEELJNYwztdIrHt6vtpKFn1BNrXIcJqtyZ9aBcDHyE3Wd8CJ8jVPJ50bcHvvTOfBgC8WeEHN8yYcxNeizwSOST3LnN5NLqr8Tb+pvTp8rw69tByo/XxiFIrDTVKrhgl00Vu3Slqo9GPqnNMNCJtzdrmSpk08SRVjHfTscC9bVct7U6rU1RgQvclpq1+HKeLiAoOlvl0mTYHLuyQRdKXMgvie6knCPXVW3nlPsqTGvJ3bzMNFYSHz5QjTF9MB7kSJABx/CWOBRFNLAt/QaaDCKJkD/+hjO/x2l3Z8KNRvxmDUe16pTuV6EffptwHM2FrQy+Ccg/0YdWd2L1/1gxKZiZ4hX5KrrPgvfPscLY5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYWPR01MB10194.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(86362001)(4744005)(316002)(8936002)(2616005)(66946007)(508600001)(66476007)(8676002)(66556008)(31696002)(107886003)(6916009)(4326008)(82960400001)(85182001)(52116002)(2906002)(5660300002)(38100700002)(26005)(6512007)(6486002)(31686004)(36756003)(38350700002)(83380400001)(53546011)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1J3d3hnYlRIenBzcWg1WURoLzlMMWE4R2ZIb2lPNmdnbjBjelhIVVZjME9D?=
 =?utf-8?B?ZW84YlZ2ZEJJVm1ZTlVqTXlmMlU3allnaWJvSHJBZUpTaVh6MktxaG16L1NW?=
 =?utf-8?B?eTVVcVd3ckdseFZ0SHVYSG9xNW9LNmZOR29sdlpWWCs2b2dlOWZSZjl3OG1r?=
 =?utf-8?B?RTNCRTgwN3JyZW1rdVhhOFp6Si91VGJEdGExUWlWN3krV2w0WFg4NFo1REhG?=
 =?utf-8?B?SW16eWhSa0l5blZNZXRVbEVDNzVJeCs3SDVPVCtWRVRyaG5OZlBjcHhOMGJr?=
 =?utf-8?B?OHg3Z2xSejZPWmJtOStCdHRuMU5YRFp1dTFCZmNNTFdwdGR2Wm1IVWNXcGdL?=
 =?utf-8?B?bWRVSm1uMFlKd2Q5MlQ5enJnbGlxWVp1a2MzZFZyc0pEbFEyQitrUldyRGlO?=
 =?utf-8?B?cnQ3amhMcTR5Z1lzODVzbUdUN28wTzVTWmdHNUUrc3ZZNlA0NlppUGNVMUJQ?=
 =?utf-8?B?WVVBWjY0VGg4YnZGVmlJdmczamtnVm5UcG43T0dBMHhkUFZ5NGlFR3VnNXNy?=
 =?utf-8?B?RDRuM1VpOFRJdE1BZ3FGLzlBMEdIRTljQlU0TWk0MTQ1cWtNbFA1WndpanU3?=
 =?utf-8?B?eUEvY0JiT2RraDVJMHFjREtreDc4aXhDZjhJaWR6THduUU9jRXZJa28veEJ2?=
 =?utf-8?B?SUVjNWQzYktXejI0VFRLcS9kQ2VraSt1UjB6TTRCNXBBM1I1Znl3S1RFVFZi?=
 =?utf-8?B?UXBMdnVwZWtDZG80bTVpMGlZcnRBSWh0YmllYkEwSlErcUZNZkJqd3lpdUtY?=
 =?utf-8?B?YnJQbDRJOXR5eFdiRk96OHc1ZmhkWVZXUnJaa3RKc0p5ZUVoY2ZLSGorcE1h?=
 =?utf-8?B?Mnpjd3MvTXdDUGRFZ2VxUzVLNStaTVZrdmpJQTdlVWdDWVhqQjNYUERFL0cz?=
 =?utf-8?B?QW8wRnJ1NlhJNnlPZmVnTUcvblhyMHVUUDdJRXpoT09lakdndHorZ2RqZDEr?=
 =?utf-8?B?cE9QL1pyaE1yZ3RZQ25Cd29NTnV6YUVzMUFudkxKU0xRaDFzVjJkQzJMODYw?=
 =?utf-8?B?bkIzWFErWHZtc1ZJd21CR2tVYWF0QjR3eXlzNlJ5aURSR3Z1ZCtrUEczVE9s?=
 =?utf-8?B?L21JN21acVNJd3BDaWpka3puOEdsc1lzaDllbmthS25YN0lCaTdQRFF0dnE1?=
 =?utf-8?B?N012VU8yVTllcjhXN2ExemZBVTd5ZFl5dFViaDdIeFVKZFMwUHNOT3VudlAw?=
 =?utf-8?B?RzZ6a0grS3J1cDFsWUJqRDh0STBDdWQwaS8rTHQvclBUaFJaQlk1RVVQV3hv?=
 =?utf-8?B?SWo1bmRndFJlbWd3dnVqQ0JFL3h4cUgrNWRLczFxS1lhOUEyOHlvUTNpcFhG?=
 =?utf-8?B?RlBod2xzY0JWd3dsQm1FbTdycjhmeVk4V1VLRVRQNGV0cDExTXoweDhIYUxL?=
 =?utf-8?B?Nm45NDlITTBvaTVRbGlVS0hTWDNzZXlZYXZkNStsM2VVanhORGtESDZNTHd2?=
 =?utf-8?B?NTdOODBuYVJoMUJzRzhjekdRZ3AxK1Q3eXM5WHNVQU1SNjVhOVIxbTRNYlVl?=
 =?utf-8?B?dE5TVGMyVE1kaVRyMk9TYmJZc3VROElIMUJFK1h4V0pORk1ud1hZL3lRaFZs?=
 =?utf-8?B?MXcrenBLbTRCNklPRGg2LzBqamRjeTNqemNMMmtJN05TRWY5czhqVURZVWNP?=
 =?utf-8?B?REV2dmdpUDZtc2J6aUUwVUtyaFVKSTVPVDdjanA4RXlNdGNpN2Z4T3M2N2NL?=
 =?utf-8?B?RnY0SWlXa0EwK1FuYjlJQ2hTZVE5YjZlQ0xCZmRramJKdHFTb0Z3bk9xaTFS?=
 =?utf-8?B?REFiYWsxVHhHK0lQd2xDd1d2R3d4VEkrREIwUGJtV21iaEpLUTdvdWtvWEUr?=
 =?utf-8?B?VGhveGJBTGJzdEEzaCtKNVluZlkyU0ZkOVJQRDVobFpkelZXc2xZMjMxampv?=
 =?utf-8?B?eEY5TWtGSzhWRWRPeFZVdldsa3pVVFFsNERGWFF6N3lwcm5BMzQ3YzdDQ3hZ?=
 =?utf-8?B?dDk3UXpFWmx1Ri8xalNQT28reDgxVUJZaXdteUtGVGlnUGhrRFJjOFMwYXZm?=
 =?utf-8?B?dGhmclZKK0hZR1pKUDllV3lML1Z3eFRXaVhGVnlCeDR0TEpYanZ0TXVOR2Y5?=
 =?utf-8?B?b1RSZTM3VmdJUTROL0t3VWhDVWhBNzhDNUI3LzBadVEzR0dBdVc0b01Bd1M3?=
 =?utf-8?B?V1A3ckU1ZVRlTjJTV2dQUnkwK2h5T3Q3S05DN2Fmc25SdWdsbUNJQWJsS08z?=
 =?utf-8?B?dzF0STUxTEM3bVNqMTZoWlJVVE45eFM3UVBDM2JxTzgxN0dReGFUYjBwbENY?=
 =?utf-8?B?cUJQTWo3M29weXhmNFRaWlBMUERBY09qei9xcjhvdzhDVjRVL3JsSVhpVmFU?=
 =?utf-8?B?R0Q5YkVjeHdpRHNjL2E0ejZ3VE0vZzF3Ym9PajZvMUwxd1hSRytLdz09?=
X-OriginatorOrg: yahoo-corp.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 714948a1-7961-4472-8345-08da478a0b14
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB10194.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2022 06:59:04.4236 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a208d369-cd4e-4f87-b119-98eaf31df2c3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yCER35c/WGS0p4MCZXe48PGVskkq9mjkxknhduSt2XM43wmJdc/3hstjjq51oOqGYSQH7TiBqYweg/2n/acceA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4992
Received-SPF: pass client-ip=182.22.125.216;
 envelope-from=hnarukaw@yahoo-corp.jp; helo=corp-ob09.yahoo-corp.jp
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

ping, how is the status of this patch?

On 2022/05/17 17:29, Hiroki Narukawa wrote:
> In some of our environment, sometimes test did not pass due to multithreading behavior.
> 
> I think this fix will check correct behavior. Could you review this patch?
> 
> Hiroki Narukawa (1):
>    test-thread-pool: Fix occasional test fail
> 
>   tests/unit/test-thread-pool.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 

