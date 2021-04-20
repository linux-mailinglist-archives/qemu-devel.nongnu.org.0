Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DC636562A
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 12:29:44 +0200 (CEST)
Received: from localhost ([::1]:49530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYndX-0000Ra-KK
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 06:29:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <roger.pau@citrix.com>)
 id 1lYnas-00073t-Ba
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 06:26:58 -0400
Received: from esa4.hc3370-68.iphmx.com ([216.71.155.144]:16685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <roger.pau@citrix.com>)
 id 1lYnaq-0006WC-22
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 06:26:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1618914415;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=V1G/ly4vKIcR4VuoZp8yZ2n7j0haqeMWA0nzlJG577Q=;
 b=iDTVvUtZFQCx6F1UJR7EMnvYAG9NB5eW1sX+utWdfhjuEPoboQf9Dg72
 7KaFHSsDYf637jb0cSzg1rcBzYhXYbMP25YZaS1uwAm1GM548QfEtrFWd
 ryaPJFfiYqOgkGbrX3SiCmT2sbaNIuoYwHvQgtS+THRej6ArqaJ9IPNyU Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=pass (signature verified)
 header.i=@citrix.onmicrosoft.com
IronPort-SDR: SgYqYk9E/02wCfi7S6/YPYFuO2zCXtPzS48MtR/wzUA/tQZ7m5qqnxfKVJyONl7gZe37/turJk
 x1yzIQyhB8LoVBygCeBBNoZpeKrEaI9ylwmDPDMBegQrAEA08mLr9/ax4+pQqvo8ruflfwBiNh
 dgYuq5CWGkoThrXhe3o00ixCxODjgH3BrFHu6b+M9ylScwxUjduSaYlAl/gV3lz1nH+UkRCGlb
 zki2C9Ob/j3pp0/MQUuYR/n8O8l//ySp+lw6xvlp2cvh8ax9l03O7CdE2LFfiKsKY0xftjW2i4
 S1M=
X-SBRS: 5.2
X-MesageID: 43451651
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:kYS7RKOs0m4BEcBcTjajsMiAIKoaSvp033AA3SlKKSB9WMqeis
 yogbAnxQb54QxhPE0ItPKhHO27QX3a/YNo+oV5B9yfdSTvpWfAFu1fxKT4xTmIIULD38p88Y
 slTKRkEt33CjFB/KPHyS21CcwpztXC0I3Av5a8815XQQtna75t4m5CY273LmRMSBBCFd4FEv
 OniPZvnSaqengcc62Adxs4dtXEzuerqLvWJT4cARkf7hKSyRuWgYSRLySl
X-IronPort-AV: E=Sophos;i="5.82,236,1613451600"; d="scan'208";a="43451651"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NuZdLOglEfg1R2vL9OStc4gXVWH57GUkFORr6Ygu+6VOnFmH4BiYFCgC1pL+hvAn1XVsg3uyvZdlYlPJUlncfFX8fe6q9ZkGAkw6t33vUEetiVR3TOQESoR82KbmhVn3+yBznyCPYvY4TxxN6qMOeXn3p4zscmzfpX3MfRkRJ5Ie31863Ra8hG9OM7jbTUcsA7ppvp0L09aQjCZllJyfwhGIsINtQlUL3lpeESBuaYt/ZozUXFHJlyifxhe5AM9we/1cTodTgah3dbJMGCTwIyoTpmqwN6g95XtomBjMwtg1JQDZATe6dZNIzMeUUklgTKo0V7u9C8z/6a9+THGaXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jpWLRdkqxEup8pvZVCLInMLs+8avjXBNMuSlaH9B3QU=;
 b=N4R6G9SawBQtzp8fBbp7wYpJvjHkImWliO2Pp40aFOrO5lq8G6YaMsASdFvCzcMzPAFenRCA3ULs/DaaoS1sFiD+lCPKLh71c6YCE70sh3qdUnMprYqLWRSCAue/YEiKQxhrr9xRx5c4zLJXzIZpbTzQtumCM53mY57eA/TbvIg6j19j6567RpxTa3IPZhTQ+aXjx92FA6m2Fpr+bDZ1k/zGhfG8IbEnaHBvcdFI7TBcaD1CwD4l1f1WIfggT5iTAxl8FzcPdghZHUZcSF47PZ/b/iH4UHmMMZLefzJRPGfpVHDLunn9Q4T6sgIbwYyd4VMmE+YQNQjMl551YWKuzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jpWLRdkqxEup8pvZVCLInMLs+8avjXBNMuSlaH9B3QU=;
 b=aN5bnDHunXdqelD1N8MK4GIl7+W6YcpL28REOJ66kidRRW1y8t+CWmuyuEZoX8r0I/R2wD/TrLknJpUYITN/2/ype/Hl3CLw3zC8AwiBrb5ILFVjFKObIn/9wvPPdqUA935J/kOImkWWnrTmrnV1rmKVi3M6vv5PtAGI7sXBnD4=
Date: Tue, 20 Apr 2021 12:26:45 +0200
To: Igor Druzhinin <igor.druzhinin@citrix.com>
CC: <qemu-devel@nongnu.org>, <xen-devel@lists.xenproject.org>,
 <sstabellini@kernel.org>, <anthony.perard@citrix.com>, <paul@xen.org>,
 <mst@redhat.com>, <marcel.apfelbaum@gmail.com>, <pbonzini@redhat.com>,
 <richard.henderson@linaro.org>, <ehabkost@redhat.com>
Subject: Re: [PATCH] xen-mapcache: avoid a race on memory map while using
 MAP_FIXED
Message-ID: <YH6sZZUH/zD74dB9@Air-de-Roger>
References: <1618889702-13104-1-git-send-email-igor.druzhinin@citrix.com>
 <YH6WfgdFpFaMYtvC@Air-de-Roger>
 <8cd5ae50-dff8-2ccd-0036-f27b82242f74@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8cd5ae50-dff8-2ccd-0036-f27b82242f74@citrix.com>
X-ClientProxiedBy: AM7PR04CA0016.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::26) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aadac849-5ea2-4766-a05e-08d903e6cf90
X-MS-TrafficTypeDiagnostic: DM6PR03MB3738:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB373871FFF5D99B6C5BFA66428F489@DM6PR03MB3738.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:608;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d3Z4FXcwHq3tHKvSUJjTWdnQ8SJN/jTM0lLVvVxfp3321IzPZ697Eo4Usl+KDfuDQ1ZOaEhFUElJR07skelYZOxEfqogCdhUtd33cmQm5ub3pDHWgRQ592ove7eAzLTDeBj4Td0S4rpXj5ZaXvf9Dkpqvuj9i8cNM85cL0K5qH7pHpbG03O2k8g/8xXJofYQvcxbRolm2gJ3yYXHABJgRFmYW6EV68eaNZxSOyxCpvYkpitu9tC8THNLKfPUQrGUJfZtx0CwRu5KycRXinmnpUSuVyV/g05TWN3ViQw2o9rM/VrR9LYUN05VljQ5d5ueFnMms7MrM2zji3DuebYIJiG6TkHXYW88ufe+x7H3ls4foHlwy8YEKoZfJNGJlWDo8XGdNiyJNGUilO1R4ip+At8KPutONzuoamxQVRvMbrF/kIwXSWJ9+z9roZWZrYNC0GGv+TxVFxvZXOpcn60wZUnwz3m0+e+F5w1tulG+XvjsJB4zYEfVzNdYTnbb0mA95wAQv7Mylt89S+Yftf6y9uRPDkEqQ+pi1MH/eYbJMVpe2TKliO+IDst+K38KlWR2aHhh9gdusUpWsAX35J674jiDEWuBF8j8NjGfI6ZbaTw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR03MB5608.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(7916004)(366004)(396003)(136003)(376002)(346002)(39860400002)(316002)(6862004)(86362001)(956004)(2906002)(478600001)(16526019)(5660300002)(26005)(8936002)(33716001)(186003)(53546011)(83380400001)(9686003)(6636002)(6496006)(38100700002)(6666004)(85182001)(6486002)(66556008)(66946007)(66476007)(8676002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OEFQZ3N5SXp4VUFBYTQwMm8yYnNFSm1oWS9CWVFQNDRqdzhNcGRQSEVtNE1h?=
 =?utf-8?B?L0lSWW5iVmpjVVpKODZGd000OXA2NVJtay9LTEVlZzNBWEUvRkhHSWZnZGp1?=
 =?utf-8?B?UzFCejFXQjhSVFRPTGE2N1F0S1duSzNwajlxc1NCbzArTVg2TDRJS1NkTlRV?=
 =?utf-8?B?a1QrMFB0a2l6NVpjNUJNNXV6MXJhQ3ZGa3ZhcmpMVVFCTWNaUDRuaHF6ZHhT?=
 =?utf-8?B?SVdCb2Z3T0s3Uzg0T3RHRzQrTm9XbXJrMjhXS05qMlJtOXAzaG9FMTdNU3Ri?=
 =?utf-8?B?SFRXRi9POUhBWmxaSWFzZ2h1UldPcUZMS0FMT0FiYWZsczlDdS9jbnhjbGRJ?=
 =?utf-8?B?WkpQMVlscWpmU3g0cXBsUXJYYmhucFNidEN2SEI4c0IycEZqZzQweWtGTzNW?=
 =?utf-8?B?ZkZLaWk1b25leVhFMnhsQm1NcTRGTnk1UHIvbjgxck5EaWN6TCthN2JnSm43?=
 =?utf-8?B?OWZCaU43NFljYTNaK2ZoZ0pvNkNBT0xjQkhmaEloTzd3Y3l4QnhuQWVhNFhV?=
 =?utf-8?B?YU5KZzNVOEpRVHNLYS8yUDhuamRaQi9ZQndLaEpxOUNxem9SRmYvN0t6a21O?=
 =?utf-8?B?SE02K1o0bXRtaTBuaUI5MGNuT3FSTnFMcHpORG5BbnpBN2JacGVIdkNSSlht?=
 =?utf-8?B?QTZBTkVhcHY5M3VkZTlYMnErZ3lmaUpJOTZDc3p5bnlZbmhSeWlnL2JVUnBk?=
 =?utf-8?B?WFd6NzVQR3M0SlE4SkQ4MHNNODRCOWo0T2Q5MnJlR0RJQmp3UHZsVFJQUlV3?=
 =?utf-8?B?UjlkMW5ISHNBamhqUm9pZ0JqdXpCMlZQbTE0RlAycVl1ekF1TkpCMUhZS0JW?=
 =?utf-8?B?Q2RHMnBIaFZmWHdJUHV0dElPMlVxZ3I1MVkwbEhGY0N0MUdzWm5abjBnODcv?=
 =?utf-8?B?eEpOcVlsMzh2ZlE2VyttNkVibzhGRlVLQUx0U2dVelRsZU9SM0d6QnNOUTF5?=
 =?utf-8?B?RXhyZU0wUTdsemRLdlRHVmQxM2R0V21HM0Zib1NadkpacTZiaVdkMFV6VUN3?=
 =?utf-8?B?L3kzUUQxNmx4ZHpsUFJQNmRuMmE4eFpPZmVGVm5zWi9kMzRQVDVLdU1DRE8r?=
 =?utf-8?B?aWx1b0JHTnNnVytZdTV0S1lLQUorYjdvdlhRdmg2eWZpYlFINVE1NFE1Zmxw?=
 =?utf-8?B?TDNIcDc3eTM1US9VMlNFM0FqSFVjcTF6MHJzbkxMU1VJdUh2bVlwVUZ1YytV?=
 =?utf-8?B?MmhuMFZ4U0t3VzJ2cFFURlJUVExsUjNJSnB5bmp1b1BMRzRRQkIxTkM3RDVx?=
 =?utf-8?B?cDlIVmQ0Rm5na0NrTnprZ2tyRjl5Y1VvOExjWnVPa0UzUCtKR0ExbTFJUFRa?=
 =?utf-8?B?THdwSURRRFNwaXpkZHNxZlpBcENaNXl6aUhiU1NFTC9jbTRLcVRXNkJtWWV2?=
 =?utf-8?B?cTNJTlYveDNZdzV6SkNqdXdLVmlkKzRyL0FGNUFvVkpDTThlcmtXek4yQVlL?=
 =?utf-8?B?ZUdOYS9reWsyRUxPRnJ2dGdrQ2U4RElhenRoYWhhbCtqdmwxOVhHZm4ydmxY?=
 =?utf-8?B?T25Wa3BYVnE0Sk12cVNETTBIclJiS2pVMU5ZTGt5QjlqTlY0ejl6MFMySDNJ?=
 =?utf-8?B?NE95SnRWVzV6UUR2ejhocWRDYUVOV082ckFpTGJpazBTUGZDNnJrUWxZdUJM?=
 =?utf-8?B?N2JIR3UvbWpUa1NiVDVSdWo5ZmxQSy8wc3hYMFN3b3IyTEpIK2p1WFV0OUZC?=
 =?utf-8?B?NzNTR0NncDhVd0Q4bjlLWU5tdkZJbFM5bnp4QmFsRkpPYXYrUHlrRFdtc3Qx?=
 =?utf-8?Q?u9JQ8d3DQzezTKFxF0qmxeBSodAsMUXy9Ai7WVQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aadac849-5ea2-4766-a05e-08d903e6cf90
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 10:26:51.1669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Ywsx9h3/TWA3VCG+Tte19vaNvBFKvE0DMWv2UiZYkcCOLVY23ypLKPyCgL/sZDQGr+DLXoXxT6FXCFw8KBuYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3738
X-OriginatorOrg: citrix.com
Received-SPF: pass client-ip=216.71.155.144; envelope-from=roger.pau@citrix.com;
 helo=esa4.hc3370-68.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Reply-to:  Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
From:  Roger Pau =?utf-8?B?TW9ubsOp?= via <qemu-devel@nongnu.org>

On Tue, Apr 20, 2021 at 10:45:03AM +0100, Igor Druzhinin wrote:
> On 20/04/2021 09:53, Roger Pau Monné wrote:
> > On Tue, Apr 20, 2021 at 04:35:02AM +0100, Igor Druzhinin wrote:
> > > When we're replacing the existing mapping there is possibility of a race
> > > on memory map with other threads doing mmap operations - the address being
> > > unmapped/re-mapped could be occupied by another thread in between.
> > > 
> > > Linux mmap man page recommends keeping the existing mappings in place to
> > > reserve the place and instead utilize the fact that the next mmap operation
> > > with MAP_FIXED flag passed will implicitly destroy the existing mappings
> > > behind the chosen address. This behavior is guaranteed by POSIX / BSD and
> > > therefore is portable.
> > > 
> > > Note that it wouldn't make the replacement atomic for parallel accesses to
> > > the replaced region - those might still fail with SIGBUS due to
> > > xenforeignmemory_map not being atomic. So we're still not expecting those.
> > > 
> > > Tested-by: Anthony PERARD <anthony.perard@citrix.com>
> > > Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
> > 
> > Should we add a 'Fixes: 759235653de ...' or similar tag here?
> 
> I was thinking about it and decided - no. There wasn't a bug here until QEMU
> introduced usage of iothreads at the state loading phase. Originally this
> process was totally single-threaded. And it's hard to pinpoint the exact
> moment when it happened which is also not directly related to the change
> here.

Right, might be worth mentioning in the commit message then, that the
code was designed to be used without any parallelism, and that the
addition of iothreads is what actually triggered the bug here.

Thanks, Roger.

