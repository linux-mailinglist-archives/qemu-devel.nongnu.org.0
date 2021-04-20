Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E733655AD
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 11:47:14 +0200 (CEST)
Received: from localhost ([::1]:36078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYmyP-0006Q4-TO
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 05:47:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <igor.druzhinin@citrix.com>)
 id 1lYmwT-0005sU-VZ
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 05:45:13 -0400
Received: from esa3.hc3370-68.iphmx.com ([216.71.145.155]:8597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <igor.druzhinin@citrix.com>)
 id 1lYmwR-0006LJ-Rz
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 05:45:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1618911911;
 h=subject:to:cc:references:from:message-id:date:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UKojnfHF9gNH7BNW20kJaYWN/y874lHbSG8rjBK/yZI=;
 b=bDHoW/LjaYvH5nfeargcWQBM25EyYucy7Iq74a3JP2fGFXXKEPS6dwM6
 5ZrbHYWlV4Vo2heFhXHE35casykk6NRS0UotxAA2m5i9ry6DlGJ4CYQKc
 R8NvjuXkHyb2QZ5vTlSYgahBM+hF2cyqWnrTsJe7uSUsfpQ3YTxNs4aYu M=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=pass (signature verified)
 header.i=@citrix.onmicrosoft.com
IronPort-SDR: NYkUu6Sl9rA7jmFJlf7u8F9v5hWaP7HvKzrM5oBFAIKiTj5Ktub4EoPjwVd07SjlA7/uZBgZ5j
 iBi+Z7CWRF1RxppBcf3z0U/8LUnt+GuwfeOMLytty1h3+DyMv2GlZfx3tCemKu/KqQPa8Naddi
 GLBmPh7IKb0lUUB8uIFc9n/UrNTqE77Z4TE9ZJm0YL9hqfHkC9Wt2fGZx2b3OTO8xXn8dd2MCD
 e7GtrVSwTqS1LPYYxvdcfgK1kq0st0RgicT5NqFLFPi56gy0/TD0FG3HBLaCdQ+eOHc3xsprWB
 BXU=
X-SBRS: 5.2
X-MesageID: 41965223
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:/AP9hqnLYDnBF1jNt3mNUfd9L2PpDfOFimdD5ilNYBxZY6Wkvu
 illvgDyFvQgDEeRHkvlbm7Sc+9aFvB6J945pQQN7++XA/g/FClNp1m8JGK+UyfJwTV8OlB2a
 B8N413D9PtBVZ35PyKkzWQOdAm3dWB7eSUlf7Tpk0dPz1CRql8425Ce2SmO2JsQg0uP/UEPb
 qaovFKvj+xPUkQB/7LYUUte8jmi5n1mIn9YRgAbiRXlzWmqT+z8rb1H1y5834lIlZy6Iwv+2
 TEjAD1j5/L25rXpiP07GPd449bn9Hs0LJ4daixo/IIITbhgBvAXuVccoCCpzw8raWO71sngb
 D30nQdFvlz8H/YcyWJpwLs0WDbsAoG1nmK8zGlqEqmhea8eDU7E9ZM7LgyTjLpr24b+PB1yu
 Ziwn+QvZs/N2K4oA3No/zzEyxMumXxi3w4iuIXh2FYSuIlGcdshL1a2ENQHJ0JBj+/zpsmHu
 loBNzb/59tACOnRkGcmmlqzNalRGl2JA6PRgw5sMqP31Ft7QFE5lpdyN0Um38B8J4nD51Io+
 /FPbhynrlSTskQKaJ7HvoIRsG6Y1a9PC7kISafMF7jHKECN2mIr5Oy6rMz6+GlEaZ4tqcaid
 DMQVlcvW43d1mrDcDLxpFC6RrNBGewTV3Wu71jzok8vKb9SrrtOTCCT15rk9LImYRlPvHm
X-IronPort-AV: E=Sophos;i="5.82,236,1613451600"; d="scan'208";a="41965223"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mBPIPHfumyHrYVzz5Weilh2/xWfCzv+0vG0TMOTsaDIF+T13LIxR4lAR/oHlwQYnuFpUM+BPN/9YKPAkXUaueYb6FcbLguy+1S5qgj6iXbsS5Qo7qAwZGYMG/d0S2a1GNROxh5o65g4RVb5aec7ld34mbUnz2RHtLOli0+2nJjTA6e6Kuw/lG0POfQB3RHIAssR+K8U11vHOGey71ksh/DVhV/Z3B+KSGsYgY1a0+rSW4Dce6smPIKXEd/ogJRlLc+2PT8JXFgvf5jmwckaUBzRJ9mGzd9PE2tzRf3YtLrXu+aj4OGohWB9wYCibLcFsqCR8nTUwmlyDNGHO4NgiRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sOVTIxGK8axq+Xxi2TZ+Jjqa+ohX+QH4QqjR4m5CteI=;
 b=M/uVZKiFZS803Y80OlUsb53Up2LrLb7bA1TGeJZ4uCRHgkGACg8k98+nNisPUwejjNupUbXUfF/lQkjeZVABlr1MqIPv6qnY1MHhElu/D1aFqN6riZejKazK6ojIUZTtoLXpg072lJvoIbZHV0uotxokeLqswbUeAMh2M6zUrSFOKl7LfHterUiNBplbBCPJRR6VIQLXysVvcLsCrnZz1VF+H5aMA45ajRTCLcNx4HqafzK305VQ/RMZDSejKHN+Uns6EW8d/4TG19QwkSar1xISut0diK+SJUoOYe+OYt7HOwgnLM+yiFKW6hr5jdG+Iyd8QtP84RH1hm3GlbjiLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sOVTIxGK8axq+Xxi2TZ+Jjqa+ohX+QH4QqjR4m5CteI=;
 b=YtnQ9K2Y4glGXZ2FCYS+5Og/HpU3RqiuNktq0P/9j9GRLH1+S2kD+I4p8ehD8uCH0LEYyAEmwGTzwDPeEPf7Nj5azbQ9K736chG0L1d5l7V8e/EkEGAaEJ9nUo6k1dAB+ZmI9gB3O3FvTM7EIl5Ie7hPoU5++F+mnsxBmpcPdRs=
Subject: Re: [PATCH] xen-mapcache: avoid a race on memory map while using
 MAP_FIXED
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: <qemu-devel@nongnu.org>, <xen-devel@lists.xenproject.org>,
 <sstabellini@kernel.org>, <anthony.perard@citrix.com>, <paul@xen.org>,
 <mst@redhat.com>, <marcel.apfelbaum@gmail.com>, <pbonzini@redhat.com>,
 <richard.henderson@linaro.org>, <ehabkost@redhat.com>
References: <1618889702-13104-1-git-send-email-igor.druzhinin@citrix.com>
 <YH6WfgdFpFaMYtvC@Air-de-Roger>
Message-ID: <8cd5ae50-dff8-2ccd-0036-f27b82242f74@citrix.com>
Date: Tue, 20 Apr 2021 10:45:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <YH6WfgdFpFaMYtvC@Air-de-Roger>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0486.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::23) To BN3PR03MB2401.namprd03.prod.outlook.com
 (2a01:111:e400:7bbc::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae1218b7-350c-450e-3cbb-08d903e0fb1f
X-MS-TrafficTypeDiagnostic: BN7PR03MB4354:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN7PR03MB4354438D699BC392AA61BF07E4489@BN7PR03MB4354.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WUDeTIT3tZqXAr+AkyngZteTVb/E3l+DF0dZSJreDSF9yOteskOyHCLVGQDK6/fFaFIfdJtZQoPXGgTWqXcylIxg+8SRq73VgaYu1Px15VzYUl2QsFcFwXHIzYiIP201BH/rm96L/i4LFrkEi+0wTxIEbO/O1qFqOMVCfTpaVNJ8vZ3Ei9uzuSLp56JUagK4GerMmAXOF5swM9Sj0Phb0g52+qpRGrc1p/ovPvfngEXgLceAcRRy0wPW3GPgnOi9/43Xd5UnnUr99xL9P/EbRp/9rkt8gcXteA9X8JrrBFyVgEayKdnePWqC8ygTx5J5aFqh2LtM5i/vUjNr4betFMFUm4vxV2IQBKQvYULpovQVa8uDRbvoYNQrivwRscTj9YqUCoR5DiELrt1r4PadWQXzZrnt4yzC+ynWXum2pISZjJhqLjY/LI3V7QxBYKCauqXqpnQi0Bpdhda05bLJcrujJGc0JgbyUVy3vwIT2TPna4jqcwTbu4NXqSvddxcXRa0IwdZHXfUZ/upznIa5Ysda+zLBu2rC5ypt4gpFpjeAzNqXFWOMeFe54RsP3oL2/sDjA/AjbFQ18xFEiIm6PisKWUhkdwWTS2YAUNvzdg7b2JKe/5V1w/h0qz2zOd7sUNqankHQUJs4t3PCnuC6mgOajn8kTAhTLIdb845BRwTVltyxedh4l/Gm14cU4H+k
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN3PR03MB2401.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(39860400002)(346002)(396003)(376002)(2906002)(66556008)(6486002)(53546011)(86362001)(83380400001)(478600001)(5660300002)(38100700002)(66946007)(31696002)(956004)(2616005)(31686004)(4326008)(44832011)(6862004)(36756003)(16576012)(8936002)(37006003)(16526019)(8676002)(186003)(26005)(66476007)(6636002)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?c2RTajgyUFp2Z2t6YW9NOS9CZ2xaaWpFMnJRR0RucS9FTGE4WmFQRnBqMkZJ?=
 =?utf-8?B?eXpkZG81YjJIRGtGNk9vRFhZQmNPK3FtQW1mZGE5Z0JHSUZKTXN0cUxUL1Bn?=
 =?utf-8?B?SHBPNk5jQWhvcVk0eVVQNk05Q1cwVjExOHpYOThDYWw5VXJuc1N1czMrTzhy?=
 =?utf-8?B?bnV2R0VHb0VWc1BvWkVldzVaRWRyeHN0bm5LMGFPSDJqaEN6YkliZjh1VFJW?=
 =?utf-8?B?V0Vqbi80eTMwOFZlcU1CcEpLd1dDUGhjRnJHVDBDTVVrUXpNWlVmSlB5Z0Rv?=
 =?utf-8?B?ZjNuMUtlRjV0WWF4U2ozcitPZGhuM3VYNEdOeFZUWFRjNlV0WVgzd0xTS3hw?=
 =?utf-8?B?MlJtMWpvWi81VWxEUlducjV3NmF3RXdsNThaUmhSMGVtU0hUNGFUUnZObk44?=
 =?utf-8?B?K25TWG5LNUY0OE0rVG1oQUFKMVI1dGlJTmtzQ0drTGpQcjlBdDIzWUpjLzZE?=
 =?utf-8?B?RTc1REM3VzlNTkk1Y3ZTZWtvRVY1SG1EMm8wSUpQbC84NmdheHlPTytrSXI0?=
 =?utf-8?B?M3dydEdiRzB1QUhyUElHSEZaaFYzZ0FBNkxocklud3pKbWozMzh4eS9ERW44?=
 =?utf-8?B?Ny9VR0lkTGdKaHorVHYwSUNKajRGMjZzOURNdVArbi92QXRiMzA5QlRrRmRi?=
 =?utf-8?B?ejVTekhNbnpYRmNnRXB5YmRUOXlMQ3Q5cEc1TlRBaFJZL1dyYm1sbmszUmwr?=
 =?utf-8?B?TXhHZm5IaklGeVNKRE1oTjl4M05DNkJPOGRBMjhpYU95dTNhSC9KZExZbmVI?=
 =?utf-8?B?NThheEp6TTVwUmZCUnpObXpUcktFclNhQlZ6ajByTzlpRTBZSWlEbi8zT2hx?=
 =?utf-8?B?bWNDd0Z1WjVUQzlIZWF5ODZSK25wU0xoa1ZDWVBmTmhuRXhvZUxTRWVvVnNl?=
 =?utf-8?B?T05wK0RheUp5ZWU1QStUaVFCajRybzV5LzBjVW9HdUZtajl6WHdQMS9FWHpU?=
 =?utf-8?B?Zm5pZXNoYlhBY3N5aE9hekkrbEpabDhNVjR6S2dkVXVIMW9kZmpuTndUZDJX?=
 =?utf-8?B?TjN4VlErajV6bzRMeC90aWRtYkVuSDNRZWR5ZjA5bmtyQ2JUQVFZT3U5QUNR?=
 =?utf-8?B?ZjY0dHBxRUVmbWFwcGI0VGJUVWtjQWM4NnBtQm1jTjFMbHl0YUp0R2lXOGJk?=
 =?utf-8?B?M0RBS2lWc3dFOTFiT1F6cU10QVJPNUpGRld4dHUzQ0dzdWF1VGhXL0loYWZJ?=
 =?utf-8?B?NHBnaTgySDcwN3NoenJDUFprSGZsTUY3ZUlrT0E2SkFZUVJWNCs2RWJrUVhW?=
 =?utf-8?B?MkZuKy9ZZlc5SVl0cUVuRU14TXZnTjFXUXR0YTJJNi94RWNsSWdjUDdWQ1Va?=
 =?utf-8?B?UWI3US9weFcvTWZRaXdCU3BSMUVhc0w5Y0FCcHVFVUNVNEllWU9QVUdTRDdW?=
 =?utf-8?B?U2JjMkdHMnlUYk5MY3JicFRKRmt0Qnp5eE5rdTV2OHBkOVVBZmpLcmRPOFRG?=
 =?utf-8?B?MzgreXIwRUlpVEhXSFFkYURmNnNjSnN5aVE3NmZneEljTURzaUpub0x6ZjAx?=
 =?utf-8?B?QjdTcklPVWhrYmM5VUF0cGZuTHZjYUM0OU54R0c1ZGxxRG5qcUdPM283M29w?=
 =?utf-8?B?eXE3S05HVHpIblFrTFYvVlh0ZzdlOTRJQm1DRHQvVnFISmF6THczREhEN0VU?=
 =?utf-8?B?cmtGd1NoNTFOMEZQYm5MUkgyREkwdmRlUkxCN1RuNm1qOUllTFdaS2k5cFBW?=
 =?utf-8?B?QlUyRituRmNaWWxTK2hkanFpcTJDbDdKYWtVbWNNNnJiWTFYYzBvNjU4MWpI?=
 =?utf-8?Q?eGur+JHvKRdyfCRSqSarY7g9149Dqgo1Rkex9bh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae1218b7-350c-450e-3cbb-08d903e0fb1f
X-MS-Exchange-CrossTenant-AuthSource: BN3PR03MB2401.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 09:45:07.2111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p8HF+VpxXlYm+oYZOg7H7R9CExoq61sf9vQXvPMN9Xu2BEB2Zme2qkzaSS/0T07urLwHF+qeQERVdVVx+gLqFbLS2RhVgYbrJVaj95Zk7JA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB4354
X-OriginatorOrg: citrix.com
Received-SPF: pass client-ip=216.71.145.155;
 envelope-from=igor.druzhinin@citrix.com; helo=esa3.hc3370-68.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Reply-to:  Igor Druzhinin <igor.druzhinin@citrix.com>
From:  Igor Druzhinin via <qemu-devel@nongnu.org>

On 20/04/2021 09:53, Roger Pau Monné wrote:
> On Tue, Apr 20, 2021 at 04:35:02AM +0100, Igor Druzhinin wrote:
>> When we're replacing the existing mapping there is possibility of a race
>> on memory map with other threads doing mmap operations - the address being
>> unmapped/re-mapped could be occupied by another thread in between.
>>
>> Linux mmap man page recommends keeping the existing mappings in place to
>> reserve the place and instead utilize the fact that the next mmap operation
>> with MAP_FIXED flag passed will implicitly destroy the existing mappings
>> behind the chosen address. This behavior is guaranteed by POSIX / BSD and
>> therefore is portable.
>>
>> Note that it wouldn't make the replacement atomic for parallel accesses to
>> the replaced region - those might still fail with SIGBUS due to
>> xenforeignmemory_map not being atomic. So we're still not expecting those.
>>
>> Tested-by: Anthony PERARD <anthony.perard@citrix.com>
>> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
> 
> Should we add a 'Fixes: 759235653de ...' or similar tag here?

I was thinking about it and decided - no. There wasn't a bug here until 
QEMU introduced usage of iothreads at the state loading phase. 
Originally this process was totally single-threaded. And it's hard to 
pinpoint the exact moment when it happened which is also not directly 
related to the change here.

Igor

