Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 289282DCD58
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 09:07:20 +0100 (CET)
Received: from localhost ([::1]:52100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpoJg-0007in-By
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 03:07:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kpoIN-0007HR-ER
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 03:05:56 -0500
Received: from mail-eopbgr80090.outbound.protection.outlook.com
 ([40.107.8.90]:13637 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kpoIC-0008CI-UW
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 03:05:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YUEpQe76UA7lcXfKDezT8QTHhlt0rnlvAd+LemuoRfUwl1ltv1v25vAP4mWlfz0HKERH5A2XjpGk1PZIHQcXIF1h2u2Koj04w/ILosNnamTpPvQggudBaCJrdrBvT6CuniBEUvWyJS79u4xfhWqdZZGFRAKKLr8SQ9XGQHmu+PcYtaj7NfYS+wajJ//KHvnA8tzMRKzuMJcP5Tu/IZuCjFIqHXjpOMs0PEA5WpV5grEhCCArv5loBzArg929ckSYLpHZdbirEpa66wsk3gZEawFDiotfJIj4OwQ5E16Bb5mw8b6nCHWaAUtA+bgLPNtoD4L3/PQC1+ReIoOyBNnv4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ScPSnNC+OUeo3+Z2awQ4nrLltWvLOFQ+QbOBlc+36w=;
 b=P5tmMcK8ugSRd11pa4xX4Ea8GKpbZtvhUJxMy5u3GWCSFd97fG0gWyCbhCEnautL+jmzEnQQ+oyEdzEBzuet8TjSe7VD2hbPy1zUvPSI2ACLlci7/DZafxW2FloWRup8vsypYr6zmCZidSD87Iu0WSJvM7KMe+gPNrvyYG/9mXE+z8SJ+Tkes3CTQif0Xa9Q+2ezUXZCWHbq01tACKjW6UFSaLkgelkj07yHazXV8SCgIVY9p1VQrQH4DMFYTB0ahVnNpyLrxk55evsB/++82gB+QInuan61gaCAV4aBdQFvjo3vL1gxznVTnvfHa2sg6WsHMBBxD5qcH03HkBIm7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ScPSnNC+OUeo3+Z2awQ4nrLltWvLOFQ+QbOBlc+36w=;
 b=nDpm7CReiiRwB6JmIT4EDXwTFFYOoNQ+sd51NZ6YdcN31KKglWitZc3c5wt1iCjs7sBYAgKVpfQk890hlkANAOffs6YrtDJURRCG2dv9VP8x+Y0rtB/LMCt6kPzSvoWZPRNdFV4EDAcnmamWf62EsvZsiZkjavehoB8t+JAZpwQ=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14) by VE1PR08MB5744.eurprd08.prod.outlook.com
 (2603:10a6:800:1af::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.19; Thu, 17 Dec
 2020 07:50:37 +0000
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::ac70:da6f:e05d:1cc9]) by VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::ac70:da6f:e05d:1cc9%12]) with mapi id 15.20.3676.025; Thu, 17 Dec
 2020 07:50:37 +0000
Subject: Re: [PATCH v6 0/4] migration: UFFD write-tracking migration/snapshots
To: Peter Xu <peterx@redhat.com>
References: <20201209100811.190316-1-andrey.gruzdev@virtuozzo.com>
 <3f19b8d2-0b4b-95e3-8a1f-a1cfe791a4e1@virtuozzo.com>
 <20201211150940.GC6520@xz-x1>
 <2a1f164c-94ab-0d35-96c0-792524d9ef30@virtuozzo.com>
 <20201216210226.GB39844@xz-x1>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <2f785315-ac85-2335-395f-defa550a6fcf@virtuozzo.com>
Date: Thu, 17 Dec 2020 10:50:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201216210226.GB39844@xz-x1>
Content-Type: multipart/alternative;
 boundary="------------DDCF9BC8C6CBA3DBF72C2F36"
Content-Language: en-US
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM3PR05CA0148.eurprd05.prod.outlook.com
 (2603:10a6:207:3::26) To VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM3PR05CA0148.eurprd05.prod.outlook.com (2603:10a6:207:3::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Thu, 17 Dec 2020 07:50:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e8f47b0-60b2-432a-feaa-08d8a2607150
X-MS-TrafficTypeDiagnostic: VE1PR08MB5744:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR08MB574466BD1022A959BB06B77E9FC40@VE1PR08MB5744.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M3aKbIwtBTYIPO5iJW/1yQmk2ICeoegc065c1dHXf8GvSwhQTbF7/uZwSz5EcQFHgofAj2NAogJgb7YHlTU9Dyr8v7Hz+LKVySXKlZcsOzLOZwWeDVq3dvOoQ+K2HnrD1UVl6n6wUBWDZPw+oiiBooDlL9oIWlTeGRGcXTugA9aqdGUOzhj4bZh33sv+gGMjEUGMX38DOiNGa0Qx+H9WvqbEDyhTLUNNcMO8i0MkVKUHvupVI5dF5Q9eXAh+U+kzZ1mBVYKCwPVB7T9nQHzy33sUJBBcUGOAahO4QWiFfQrl7J4+c86DKDLuoQutv30sEYEYQ14gWh1ZOLVEyp9+alf2azD2u3TJJy4HF8Nlk0rAX/aOpLX3cTEeoPrtfn5bMq5OIOZ8YRP2Zu9MsgEq7DLge15PTnGy7dZEw3zFm/Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0802MB2510.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(346002)(376002)(39840400004)(366004)(52116002)(2616005)(66556008)(956004)(33964004)(8676002)(5660300002)(44832011)(31696002)(36756003)(6916009)(54906003)(8936002)(6486002)(31686004)(16576012)(53546011)(16526019)(478600001)(83380400001)(86362001)(316002)(66476007)(186003)(2906002)(66946007)(4326008)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RStLeExCWnhIVERIOTZtQ0l6QUZHQ0NoQnJ0RENRZ1JWak5rMDBVU2tkZEhF?=
 =?utf-8?B?Qk4zSVZmemFIR1Z2QTNuUkg2V2xKdkVQSk56cEtFUXR4dldpdHZUa21hVjhS?=
 =?utf-8?B?VUg0eUY2aWtRYmp1VitBYVFSeW5NSy9EeW1YNGFUbWlHdHBxb0ZQOXlBOHlB?=
 =?utf-8?B?WklNaDM2VUhRR3cxeTFWOTVCVnNGR29TNmZoelI0cGZURTQ2dGRzTFdGSEVl?=
 =?utf-8?B?dzgyTEFhaUNIVWtsRVRvT0R6OGpCT2hxRzVmNElUY2ZjbG12WndqeXhhVWF3?=
 =?utf-8?B?NUs2R043QmtxK0NKa3pzVnQvc0llL3c4dDZoYVdSR0VTU3ZRUTRrbkFOenZ0?=
 =?utf-8?B?SnF2OXB5bVJobDJyejdRVWFWUHpROFVYa3V0cGVsWlkyMGhuOGFWMG96dElm?=
 =?utf-8?B?RytqQlNXQSs3Z2sxVGZjTmVIb3FjZUZCU0V5Y1lmSkVXTWFiZFozOVJzZjhq?=
 =?utf-8?B?b0doU2ZPdE5ROE13MlN3dFRuK2JEcTNOQ1NXS29iK3lSS3FFeTloMmRrZVlD?=
 =?utf-8?B?RDhpNUJpUFJvWndVcjlnMWs5L0Vqb1pSazVZd1RWbmdRRk1aUmFHUUVELzFX?=
 =?utf-8?B?QU0vdmpoSzRmVlN1MFBIc3RhTE1VUm5oajYzRGMwZEdudENTcG1IM1JtOGtT?=
 =?utf-8?B?WVVoZ3Z6R2pzMDNMdDBFY09CZlZTRWxreG9kRkJSOEVJWGUvVkFpT0tMck00?=
 =?utf-8?B?bURpNmxBbGQrTmxySVlZa3VQQmNaTnNzYnl3bGx5MlBNRzczNG8vOG0wT0pv?=
 =?utf-8?B?SDBRMFlyQlJNUVZmemhzSDZuQmF5RmxRNlNXWGQyV0NubUt5TC9ERmkxdmlY?=
 =?utf-8?B?UTJId0dlMDVXSGxJYjVnWmcrcHVONGRHOVRpbkNKbHYvNzB6VjZxejRsb245?=
 =?utf-8?B?TmVSS2psZSsxb0pCVjJIY08wNzFyUEZnNVhtQnRtTjhZNDFGSXpLTEsvY0Iv?=
 =?utf-8?B?S0x0N0EwMXRqZkpsU3Z1bWxFZGN3VEdWZ2NBdDh3SGZuS3ZDSG5WUTJ0cTdM?=
 =?utf-8?B?dldpY1J6dGlNVVBuMnlPUFl2RUI3OVZKRUFuV2xOaXNkZlBpcDQ4TUNFdkR0?=
 =?utf-8?B?OFhLaEx5SU9YTmdUN0xBNVVVRXdTUFRFc0F2MVQ3alRoSExQVzQ1eFI3Z3ZN?=
 =?utf-8?B?OG5BMXljRzZVQ3pCZ1hpWlYrSnQ3R0xiUWdUQWtOR1FMdXpHUERSWkUyTEgy?=
 =?utf-8?B?QlRya2phdnZhcDlDdVVOaU9KdHFzcnI0UHE0b3kyMzFVS3NocDQzTkQ3ZWZl?=
 =?utf-8?B?UTlTV2RDVkFHOGpyR05SNTBDNzNqL1pmWFo0VmNIdTluRDEwL0kwZG9JWGNr?=
 =?utf-8?Q?rkUuXiiM/cgCE=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0802MB2510.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2020 07:50:37.3429 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e8f47b0-60b2-432a-feaa-08d8a2607150
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B7zJ+gjQGLj7b6/miFYyw02ybYJ33WhVVN9aA9/h8V/3hUwUaqHlqSTt+XtExvNYuDQxFQ2Ox0a7doYG1xGBpfdH3dTDQHNuW3/1NHzzFew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5744
Received-SPF: pass client-ip=40.107.8.90;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--------------DDCF9BC8C6CBA3DBF72C2F36
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17.12.2020 00:02, Peter Xu wrote:
> On Tue, Dec 15, 2020 at 10:53:13PM +0300, Andrey Gruzdev wrote:
>> First are series of runs without scan-rate-limiting.patch.
>> Windows 10:
>>
>>       msecs               : count     distribution
>>           0 -> 1          : 131913   |****************************************|
>>           2 -> 3          : 106      |                                        |
>>           4 -> 7          : 362      |                                        |
>>           8 -> 15         : 619      |                                        |
>>          16 -> 31         : 28       |                                        |
>>          32 -> 63         : 1        |                                        |
>>          64 -> 127        : 2        |                                        |
>>
>>
>>       msecs               : count     distribution
>>           0 -> 1          : 199273   |****************************************|
>>           2 -> 3          : 190      |                                        |
>>           4 -> 7          : 425      |                                        |
>>           8 -> 15         : 927      |                                        |
>>          16 -> 31         : 69       |                                        |
>>          32 -> 63         : 3        |                                        |
>>          64 -> 127        : 16       |                                        |
>>         128 -> 255        : 2        |                                        |
>>
>> Ubuntu 20.04:
>>
>>       msecs               : count     distribution
>>           0 -> 1          : 104954   |****************************************|
>>           2 -> 3          : 9        |                                        |
>>
>>       msecs               : count     distribution
>>           0 -> 1          : 147159   |****************************************|
>>           2 -> 3          : 13       |                                        |
>>           4 -> 7          : 0        |                                        |
>>           8 -> 15         : 0        |                                        |
>>          16 -> 31         : 0        |                                        |
>>          32 -> 63         : 0        |                                        |
>>          64 -> 127        : 1        |                                        |
>>
>>
>> Here are runs with scan-rate-limiting.patch.
>> Windows 10:
>>
>>       msecs               : count     distribution
>>           0 -> 1          : 234492   |****************************************|
>>           2 -> 3          : 66       |                                        |
>>           4 -> 7          : 219      |                                        |
>>           8 -> 15         : 109      |                                        |
>>          16 -> 31         : 0        |                                        |
>>          32 -> 63         : 0        |                                        |
>>          64 -> 127        : 1        |                                        |
>>
>>       msecs               : count     distribution
>>           0 -> 1          : 183171   |****************************************|
>>           2 -> 3          : 109      |                                        |
>>           4 -> 7          : 281      |                                        |
>>           8 -> 15         : 444      |                                        |
>>          16 -> 31         : 3        |                                        |
>>          32 -> 63         : 1        |                                        |
>>
>> Ubuntu 20.04:
>>
>>       msecs               : count     distribution
>>           0 -> 1          : 92224    |****************************************|
>>           2 -> 3          : 9        |                                        |
>>           4 -> 7          : 0        |                                        |
>>           8 -> 15         : 0        |                                        |
>>          16 -> 31         : 1        |                                        |
>>          32 -> 63         : 0        |                                        |
>>          64 -> 127        : 1        |                                        |
>>
>>       msecs               : count     distribution
>>           0 -> 1          : 97021    |****************************************|
>>           2 -> 3          : 7        |                                        |
>>           4 -> 7          : 0        |                                        |
>>           8 -> 15         : 0        |                                        |
>>          16 -> 31         : 0        |                                        |
>>          32 -> 63         : 0        |                                        |
>>          64 -> 127        : 0        |                                        |
>>         128 -> 255        : 1        |                                        |
>>
>> So, initial variant of rate-limiting makes some positive effect, but not very
>> noticible. Interesting is the case of Windows guest, why the difference is so large,
>> compared to Linux. The reason (theoretically) might be some of virtio or QXL drivers,
>> hard to say. At least Windows VM has been configured with a set of Hyper-V
>> enlightments, there's nothing to improve in domain config.
>>
>> For Linux guests latencies are good enough without any additional efforts.
> Interesting...
>
>> Also, I've missed some code to deal with snapshotting of suspended guest, so I'll made
>> v7 series with the fix and also try to add more effective solution to reduce millisecond-grade
>> latencies.
>>
>> And yes, I've used bpftrace-like tool - BCC from iovisor with python frontend. Seems a bit more
>> friendly then bpftrace.
> Do you think it's a good idea to also include your measurement script when
> posting v7?  It could be a well fit for scripts/, I think.
>
> Seems 6.0 dev window is open; hopefully Dave or Juan would have time to look at
> this series soon.
>
> Thanks,
>
Yes, I think it's good to have this script in the same tree.

Nice news about 6.0! For v7, I've added a fix for suspended guest since previously we'd finish
in assert() on invalid runstate transition when doing initial vm_stop_force_state(RUN_STATE_PAUSED)).
Also disabled dirty page logging and log syncing for background snapshots.

Thanks,

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com


--------------DDCF9BC8C6CBA3DBF72C2F36
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 17.12.2020 00:02, Peter Xu wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201216210226.GB39844@xz-x1">
      <pre class="moz-quote-pre" wrap="">On Tue, Dec 15, 2020 at 10:53:13PM +0300, Andrey Gruzdev wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">First are series of runs without scan-rate-limiting.patch.
Windows 10:

     msecs               : count     distribution
         0 -&gt; 1          : 131913   |****************************************|
         2 -&gt; 3          : 106      |                                        |
         4 -&gt; 7          : 362      |                                        |
         8 -&gt; 15         : 619      |                                        |
        16 -&gt; 31         : 28       |                                        |
        32 -&gt; 63         : 1        |                                        |
        64 -&gt; 127        : 2        |                                        |


     msecs               : count     distribution
         0 -&gt; 1          : 199273   |****************************************|
         2 -&gt; 3          : 190      |                                        |
         4 -&gt; 7          : 425      |                                        |
         8 -&gt; 15         : 927      |                                        |
        16 -&gt; 31         : 69       |                                        |
        32 -&gt; 63         : 3        |                                        |
        64 -&gt; 127        : 16       |                                        |
       128 -&gt; 255        : 2        |                                        |

Ubuntu 20.04:

     msecs               : count     distribution
         0 -&gt; 1          : 104954   |****************************************|
         2 -&gt; 3          : 9        |                                        |

     msecs               : count     distribution
         0 -&gt; 1          : 147159   |****************************************|
         2 -&gt; 3          : 13       |                                        |
         4 -&gt; 7          : 0        |                                        |
         8 -&gt; 15         : 0        |                                        |
        16 -&gt; 31         : 0        |                                        |
        32 -&gt; 63         : 0        |                                        |
        64 -&gt; 127        : 1        |                                        |


Here are runs with scan-rate-limiting.patch.
Windows 10:

     msecs               : count     distribution
         0 -&gt; 1          : 234492   |****************************************|
         2 -&gt; 3          : 66       |                                        |
         4 -&gt; 7          : 219      |                                        |
         8 -&gt; 15         : 109      |                                        |
        16 -&gt; 31         : 0        |                                        |
        32 -&gt; 63         : 0        |                                        |
        64 -&gt; 127        : 1        |                                        |

     msecs               : count     distribution
         0 -&gt; 1          : 183171   |****************************************|
         2 -&gt; 3          : 109      |                                        |
         4 -&gt; 7          : 281      |                                        |
         8 -&gt; 15         : 444      |                                        |
        16 -&gt; 31         : 3        |                                        |
        32 -&gt; 63         : 1        |                                        |

Ubuntu 20.04:

     msecs               : count     distribution
         0 -&gt; 1          : 92224    |****************************************|
         2 -&gt; 3          : 9        |                                        |
         4 -&gt; 7          : 0        |                                        |
         8 -&gt; 15         : 0        |                                        |
        16 -&gt; 31         : 1        |                                        |
        32 -&gt; 63         : 0        |                                        |
        64 -&gt; 127        : 1        |                                        |

     msecs               : count     distribution
         0 -&gt; 1          : 97021    |****************************************|
         2 -&gt; 3          : 7        |                                        |
         4 -&gt; 7          : 0        |                                        |
         8 -&gt; 15         : 0        |                                        |
        16 -&gt; 31         : 0        |                                        |
        32 -&gt; 63         : 0        |                                        |
        64 -&gt; 127        : 0        |                                        |
       128 -&gt; 255        : 1        |                                        |

So, initial variant of rate-limiting makes some positive effect, but not very
noticible. Interesting is the case of Windows guest, why the difference is so large,
compared to Linux. The reason (theoretically) might be some of virtio or QXL drivers,
hard to say. At least Windows VM has been configured with a set of Hyper-V
enlightments, there's nothing to improve in domain config.

For Linux guests latencies are good enough without any additional efforts.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Interesting...

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Also, I've missed some code to deal with snapshotting of suspended guest, so I'll made
v7 series with the fix and also try to add more effective solution to reduce millisecond-grade
latencies.

And yes, I've used bpftrace-like tool - BCC from iovisor with python frontend. Seems a bit more
friendly then bpftrace.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Do you think it's a good idea to also include your measurement script when
posting v7?  It could be a well fit for scripts/, I think.

Seems 6.0 dev window is open; hopefully Dave or Juan would have time to look at
this series soon.

Thanks,

</pre>
    </blockquote>
    <pre>Yes, I think it's good to have this script in the same tree.

Nice news about 6.0! For v7, I've added a fix for suspended guest since previously we'd finish
in assert() on invalid runstate transition when doing initial vm_stop_force_state(<span style="color:#871094;font-style:italic;">RUN_STATE_PAUSED</span>)).
Also disabled dirty page logging and log syncing for background snapshots.

Thanks,
</pre>
    <pre class="moz-signature" cols="72">-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                virtuzzo.com</pre>
  </body>
</html>

--------------DDCF9BC8C6CBA3DBF72C2F36--

