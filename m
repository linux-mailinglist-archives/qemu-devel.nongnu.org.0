Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 831B963440A
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 19:54:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxYOR-0000Rm-Rp; Tue, 22 Nov 2022 13:53:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chaosdefinition@hotmail.com>)
 id 1oxYOO-0000RF-A4; Tue, 22 Nov 2022 13:53:12 -0500
Received: from mail-dm6nam12olkn2081f.outbound.protection.outlook.com
 ([2a01:111:f400:fe59::81f]
 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chaosdefinition@hotmail.com>)
 id 1oxYOM-0002j0-NP; Tue, 22 Nov 2022 13:53:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W4StK6tWU+jKc2r5omg/MdjCuUC4UtcUqJL7XGTCQ+bAraK75LrxTpNitS4Hw7PCkgH3MDLTuWkBRGNUCnTua7eBeP/CySGBVJj/uoD+SRINxNyavPNEWwYLUylyozIWuK3ooLVdejL42s31e/ebYFfEmZZFUgJCx684LrbJcIV2L+s+KvCJPB+F63kLBvNBvyv8nPgHLr0j6ypQMpWnNw2SRBcSOGBflPjgbmmVIPIq321paT88Y/mpHpiyX3lBUB6rJPyeQl9qydd8/AZhhKiZqWnKJgZtQvJj8EoX6iLNiOWltt4o1O7flqh3x4kytxNdwDwA2ugf+VGI7ivkMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZzRMJup/j8Hfj5UmyUR+LXAD+iNg9eruv/s0AC4T9jM=;
 b=OWa1L1geFs+Id6580sgL+1V3GXcOCwrRNpxfcn6IU+43M31ztky27YmX08krcNscIhOQi6vvv1BulufcDOrRreFmi/NGLelH0W4cfFLl0QDBgrpe9gsNOu/jidgocdSatUZs5qeSCxJBPjqsYuq7jGMzV5RwJEh8Hnj0+h2RlW0VNcXz/p3vWWmTXILz1j03GkSJsWsIp35ThLfgqVpOwHbFo9gw4RBfgPLYMsZn48n6YuNb90FDV2OVs3cVzkjmYuVd1nDHya8wqqBjzMYVjGtJCk1uYQGyh51i8YDxsU0xqDJ0mi9ReY6FttT7Vhtr89X7xYz8X74FYHDpJZvOvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZzRMJup/j8Hfj5UmyUR+LXAD+iNg9eruv/s0AC4T9jM=;
 b=NYCRWf37zhKP3CGGeWpfdKByQMLO4NqlxVv6iwNuD8rWD0xsFGPse33gr9Guv7hDEg0Y/ZtofkaxQcv0Eio3G6Sw8tKAA0XtNNYHskl0pjeHuvmeQKvjHprirS0isqQmzRRubLaoajiVyEiPeSa4XEa9bR3yZo/0GRXq+45ZvRRbh0rzrlKgr0IvXBoLnt8jGaiM2HWy+oYofZRZ4sskENrDKKpj81ryS/6Ub/bP5cUdvxRwO5nmTNbzIwX+SYrL7Gww3Uz2iMPUIaMG7CW2MmEQWeGERSA1hhSDvOxtoGBMfyIagYgvsiS/ic38gKeF5ji6rTQmSOtYIeUIhc8bfg==
Received: from DS7PR12MB6309.namprd12.prod.outlook.com (2603:10b6:8:96::19) by
 MN0PR12MB5882.namprd12.prod.outlook.com (2603:10b6:208:37a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Tue, 22 Nov
 2022 18:53:08 +0000
Received: from DS7PR12MB6309.namprd12.prod.outlook.com
 ([fe80::6481:82ef:ffb1:4d0a]) by DS7PR12MB6309.namprd12.prod.outlook.com
 ([fe80::6481:82ef:ffb1:4d0a%7]) with mapi id 15.20.5834.015; Tue, 22 Nov 2022
 18:53:08 +0000
Date: Tue, 22 Nov 2022 10:53:05 -0800
From: Zhuojia Shen <chaosdefinition@hotmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
Subject: Re: [PATCH] target/arm: align exposed ID registers with Linux
Message-ID: <DS7PR12MB63092A974D5659DD292F5766AC0D9@DS7PR12MB6309.namprd12.prod.outlook.com>
References: <DS7PR12MB6309CF26249A273C1E2A6AAAAC0D9@DS7PR12MB6309.namprd12.prod.outlook.com>
 <713de12d-e13f-a061-0019-93e6758fdaa5@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <713de12d-e13f-a061-0019-93e6758fdaa5@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-TMN: [f1FTnZOK5kzrn+x1BPNAlQMptPfOqMFN]
X-ClientProxiedBy: BY3PR03CA0010.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::15) To DS7PR12MB6309.namprd12.prod.outlook.com
 (2603:10b6:8:96::19)
X-Microsoft-Original-Message-ID: <Y30akajubDHw7Sar@manjaro-vmryzen>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB6309:EE_|MN0PR12MB5882:EE_
X-MS-Office365-Filtering-Correlation-Id: e11def1b-9a74-48f7-8d71-08daccbacbb5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RTHx4hCLtf3FqsNWZJL0emiUqxuVUeeYmqPoMjAA4Q1xxx2tbFiyqk+1Z5ebJQaq65775czdWMyx3Ma0hIQB/HsVz+cV95w+m9u60pj2yHsvjrpZ59nhVzPD9nywCZdHUcLi6f50lMWhjKbtbSgTnXLrb5MJjGxINqJliAD0IBWJpihWyVq/wjx+jpFQqobn5WhwditkvU+bVafbusbg3L80vXICJWnLhKTzuf6J95qj+xIkmvGvQpck0kG1hZQmOubAGO1qrDYtx7dYel6h5w8UHJxWJOPB5LnFr8TJ2+fJi+Y/1mStfpiB9rWbQbJgB+UDSZ6VrCYbOFx+OaP0cnj6fG9RQdCqsmMUG593GzbRuupvkYAUInnSXwuvXYpnxjyH7MB6ytewXUEmWZbmDb4C3gPzwC7b/GNobPdmE4gUDmYxhwss8VVBYi++aPJxt+1Zmybz0F3jf9e507gDLjhPji4rkUWMU24QttYvnPc1vkAfnXFsPFCifFx739d/6u0rbMFtjEEPbmIfi/WMb73YIL2nc9An9XJWLlobuX30i/Cn/BbF2/Q55Ut+ujCw5AVZfqgnKSTEVJCALoM1cnolLePOsKA1KBe4QPWP27i178kNdvUmoLs0ueJWjDvQoKqRr875VsuXF3hg/jyWAQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVppNnlwbjl4T3lsYnQyU1pScW1RL0hGZUs5VHN2NTNJeUY0TkpQbEhuRENX?=
 =?utf-8?B?SU5zU0ZQTGN4NDRFRXVZbFFHY1lONm1TZnJhRkQxbHJVWGE2ankvZ25Pc1RL?=
 =?utf-8?B?Mlo0blZ1VGtMWmNwUDdtbks2aEQ2c0J0VHNIRGgwK0Jmb01XL29ITFRrSDM3?=
 =?utf-8?B?R0N0VXk2UjFSK0w4UVdRblhkQUx0cnpwbmNva2RaVUZwTE5PdmRueXdoa2pQ?=
 =?utf-8?B?Z05OdmorQmcwUlFSVnlmNDJidGVNUTl3dWlPL0VjOTdiVjRNNTdXQ2hSc0Q1?=
 =?utf-8?B?eGF4aW54U3Y2N29jTjdVaFVSVmI1NVUrbEN5SkJEYWJDa2pJM3E0UStMZTBO?=
 =?utf-8?B?ODQ5YkovUkJCOUw3em5xd0FxcCtVSXdFQldxVEI4eEpKbmJya3p6R3pkNzl1?=
 =?utf-8?B?MzZ1emFkblFYVm5kd2k4MDhGaDFlQW95Z3F3Nk5PSW15QXhaYkZtQzJ2UHIw?=
 =?utf-8?B?SGRNZmZEbHg2NGFmUS93UitoRGpkdjdTRmNEVXZrRXp4aTQya3dpdERoRFhm?=
 =?utf-8?B?ZXZrSkdQNHZGK3pCQTRoTEFYUjc2cE10TENmczdXSVRXSWs3VUlHcmpqMGlK?=
 =?utf-8?B?K1FIOXhXYWhjVDZ0L1FtQlFxWFhyV1o5NDRVOG1vRUluWWU4R1RQVm43YTNl?=
 =?utf-8?B?eUJDZmk1WVkrZlR1SnhaVFp1T3NBT2tVYWdqa00yUmF5WDNsQnQwd3k5THdX?=
 =?utf-8?B?bThIV0pMY3hpSmdlOEt1MTlGdmVXSE1VNzAyZ3dVTVJvT3NFWis2cDBWQ3J2?=
 =?utf-8?B?Y3FFNWJhQnAxWWs3aW5pcE9IN0g4a0UzWFZvaWtHL3lobklTWWsvRWN4TjBp?=
 =?utf-8?B?UzR1anlYU0pvSi9MYkJXVmF5VTJzbHQ2c0JRY2hDQ3ZnVmtodDU4L2xEejNC?=
 =?utf-8?B?RnN5bjhPTEVmTGtwWFlKYjUyNUxEdU50K3dUeXMrdEhpbjhSeVI4eCt4OWtZ?=
 =?utf-8?B?cGZ4a2ZlVHlFenZWOFY4ejRqN1AreWxnMXNQUWs2MEJSL3V6NkVMK213NVVO?=
 =?utf-8?B?NTQrVm5GMk13TE1WbmI1TmZiNG1IWXoxUm9sTnlmS3cxQWpETzNCRXRCYStz?=
 =?utf-8?B?L29iMDVyTmFTZ0ZieCtIeWljRzVpM3BkZEhjWmJlU1F1b0NJWUtmN0h5SzNt?=
 =?utf-8?B?aVVoY1ppeUwyTWdOTE5zWWpYMTdBci9hNnlsT2V2T2hXSFQ4TVp4Slk3ODVx?=
 =?utf-8?B?ZjN4L0NQdElYejExdHA5OXhvZU11R3haYkM2bGE3ck01TTYyeHgyWEEyYXNa?=
 =?utf-8?B?cEdIdXIxbGhOS1JCMVF4Wi8wVFk3dmN4NW9Pa0ljcGpZdVh0K0hlbE1ibXRZ?=
 =?utf-8?B?elpOYkV0MGtUT3ZWVTJBazBFRVdINGFPek45a2VxckNZTHRyMkMwM3JsYkxy?=
 =?utf-8?B?L1l3dloyeG5lRFRMcldrdmJRTkJob0kzUU1Ib2h5VkpqSVgxZysrdUUyV1FC?=
 =?utf-8?B?a3lPSFV0Ykh1M2doNTkyeXZ4NVVhTUlrMkZyd3lld0x3YWt4cnFoVW9iUkds?=
 =?utf-8?B?WEhrNCtCTUpVNlBGVDVScEtHTFhWNC8xV3NOUjFMcUNQaGxYVktiK0lVTDJD?=
 =?utf-8?B?T1NudnRFZWdaL3dSOFlLZnRZRVBKUTBsdVB6azRsYzhqdnNGZC9wS1JpTUhE?=
 =?utf-8?B?SVBrampxR2JPMmFFV2FTTnBDMWJPcWpwSzB3NklCbGtXbVZTQWVicGYrcVZB?=
 =?utf-8?B?ckEwSEN4TEVhWWFDY3NEeDh5QnBQZWpSd3VJUTdPdUU1OXNGWmVUWGJPMmE4?=
 =?utf-8?Q?dEIX+2OqKy8S92DqAY=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-71ea3.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: e11def1b-9a74-48f7-8d71-08daccbacbb5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6309.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 18:53:08.1721 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5882
Received-SPF: pass client-ip=2a01:111:f400:fe59::81f;
 envelope-from=chaosdefinition@hotmail.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/22/2022 10:12 AM -0800, Richard Henderson wrote:
> On 11/21/22 18:48, Zhuojia Shen wrote:
> > In CPUID registers exposed to userspace, some registers were missing
> > and some fields were not exposed.  This patch aligns exposed ID
> > registers and their fields with what Linux exposes currently.
> > 
> > Specifically, the following new ID registers/fields are exposed to
> > userspace:
> > 
> > ID_AA64PFR1_EL1.BT:       bits 3-0
> > ID_AA64PFR1_EL1.MTE:      bits 11-8
> > ID_AA64PFR1_EL1.SME:      bits 27-24
> > 
> > ID_AA64ZFR0_EL1.SVEver:   bits 3-0
> > ID_AA64ZFR0_EL1.AES:      bits 7-4
> > ID_AA64ZFR0_EL1.BitPerm:  bits 19-16
> > ID_AA64ZFR0_EL1.BF16:     bits 23-20
> > ID_AA64ZFR0_EL1.SHA3:     bits 35-32
> > ID_AA64ZFR0_EL1.SM4:      bits 43-40
> > ID_AA64ZFR0_EL1.I8MM:     bits 47-44
> > ID_AA64ZFR0_EL1.F32MM:    bits 55-52
> > ID_AA64ZFR0_EL1.F64MM:    bits 59-56
> > 
> > ID_AA64SMFR0_EL1.F32F32:  bit 32
> > ID_AA64SMFR0_EL1.B16F32:  bit 34
> > ID_AA64SMFR0_EL1.F16F32:  bit 35
> > ID_AA64SMFR0_EL1.I8I32:   bits 39-36
> > ID_AA64SMFR0_EL1.F64F64:  bit 48
> > ID_AA64SMFR0_EL1.I16I64:  bits 55-52
> > ID_AA64SMFR0_EL1.FA64:    bit 63
> > 
> > ID_AA64MMFR0_EL1.ECV:     bits 63-60
> > 
> > ID_AA64MMFR1_EL1.AFP:     bits 47-44
> > 
> > ID_AA64MMFR2_EL1.AT:      bits 35-32
> > 
> > ID_AA64ISAR0_EL1.RNDR:    bits 63-60
> > 
> > ID_AA64ISAR1_EL1.FRINTTS: bits 35-32
> > ID_AA64ISAR1_EL1.BF16:    bits 47-44
> > ID_AA64ISAR1_EL1.DGH:     bits 51-48
> > ID_AA64ISAR1_EL1.I8MM:    bits 55-52
> > 
> > ID_AA64ISAR2_EL1.WFxT:    bits 3-0
> > ID_AA64ISAR2_EL1.RPRES:   bits 7-4
> > ID_AA64ISAR2_EL1.GPA3:    bits 11-8
> > ID_AA64ISAR2_EL1.APA3:    bits 15-12
> > 
> > Signed-off-by: Zhuojia Shen <chaosdefinition@hotmail.com>
> > ---
> >   target/arm/helper.c | 19 ++++++++++++++-----
> >   1 file changed, 14 insertions(+), 5 deletions(-)
> > 
> > diff --git a/target/arm/helper.c b/target/arm/helper.c
> > index d8c8223ec3..ce6fd7a96d 100644
> > --- a/target/arm/helper.c
> > +++ b/target/arm/helper.c
> > @@ -7826,13 +7826,20 @@ void register_cp_regs_for_features(ARMCPU *cpu)
> >                 .exported_bits = 0x000f000f00ff0000,
> >                 .fixed_bits    = 0x0000000000000011 },
> >               { .name = "ID_AA64PFR1_EL1",
> > -              .exported_bits = 0x00000000000000f0 },
> > +              .exported_bits = 0x000000000f000fff },
> 
> Existing, but I think it would be nicer to do this symbolically.  e.g.
> 
>    .exported_bits = R_ID_AA64PFR1_BT_MASK |
>                     R_ID_AA64PFR1_SBSS_MASK |
>                     R_ID_AA64PFR1_MTE_MASK |
>                     R_ID_AA64PFR1_SME_MASK,
> 
> etc.

It would be more readable but longer.  I can try to refactor this way.

> 
> 
> r~


