Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4006E64F1E5
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 20:43:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Gbm-0007c3-Ug; Fri, 16 Dec 2022 14:43:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chaosdefinition@hotmail.com>)
 id 1p6Gbl-0007ba-6N; Fri, 16 Dec 2022 14:43:01 -0500
Received: from mail-dm3nam02olkn2032.outbound.protection.outlook.com
 ([40.92.43.32] helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chaosdefinition@hotmail.com>)
 id 1p6Gbi-0006mf-Uo; Fri, 16 Dec 2022 14:43:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kJ4zLBBxEHzYBTsgsvDqPYOsq9YZKP9L2CvTeSTfoD9yXwbruHN2qILaftNjitMs/65i3u242b451NZsPT47medd2a7wkc8ob7wIDeuTejGsMjduTYXgtN/OwOFxzr7F285oZ4DoYUgIdJ/hyaliyK+LNy0/69hBrnGFalqK033Gl+jrmtrbtFnynIwy/PN2VTqrno+x561MmjttdkmnOWvW9Mz8KAkTSa2d8ThZs74vn/hGm2g2GDsKPRv0jUNWbn/oWUGrI2o0gKhHQEwSC7nLA2Y7F13qL05IWnfC/2NTRJwYuAogXzGnjWxLsKobK/TYWMxbbFTN2yCDPfel+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SNqw1SKwu9HLDw3DRwQet7G+a4HTXvAD1Jdh2nKrXU0=;
 b=AyZ771o+69VtNpLtVq+1OYMY3dlhVX8iB03iYg8rX0QxqWMWff3r8W4jX0Peo9K7s098CEzvqCGs3ZsjORTgXmADzvKezA5d3OIp6zA4aJtt3Gw0iiJIri2AG3KKf93YdC+MrRPu5FQdZE+7UaDjngzIONkQLSEPp8OOCz/Q6cE15kFPkaSHYC05aC/dagsRarjEE9tnKPueA/17ZG8QvhzUWtgCnf+DipXfexl4xk36buahE+KamBZGkY3UdWmWQTIVsA8ri0HhNfdzPjnHWUb2rJIgiicoHCdjVPCCTHMzDKnc0wIvVr7Elqk8N03gl0F8ycNM9pSz1d4Q+LFAkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SNqw1SKwu9HLDw3DRwQet7G+a4HTXvAD1Jdh2nKrXU0=;
 b=vTq3J1Cmas5M9ycTFeSS1qhqRiKvL5sCCSAKlk/XZMMW1K15Xgg+/KWAJ6SzMdUfvggC2tLuZKMWYoRQDq1wKK0om9N+wbBKT0v2do4ukOzlOSIE4jtyXKcLYEAI6Zff50DXlRLpc8ndUhe1MJEdrZqVG9+bs8EDc6cG9FonhuQVJ1x8izDOdcY6U5eOfxnjpRVBWW8LvfSapm6IkyObLVhr74Tw65aHBkJmWScGbNaZKEJZTVKigRNmzOvD0QkfmdwR/ct3u7eJxrEWndQqkeXkh+xjswflKt0mJt/aX2hI4lx2TJj9Um0jxFzhKM6DINRS/p2CF16tIB1r1aLPOA==
Received: from DS7PR12MB6309.namprd12.prod.outlook.com (2603:10b6:8:96::19) by
 LV2PR12MB5775.namprd12.prod.outlook.com (2603:10b6:408:179::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12; Fri, 16 Dec
 2022 19:42:54 +0000
Received: from DS7PR12MB6309.namprd12.prod.outlook.com
 ([fe80::6481:82ef:ffb1:4d0a]) by DS7PR12MB6309.namprd12.prod.outlook.com
 ([fe80::6481:82ef:ffb1:4d0a%8]) with mapi id 15.20.5924.011; Fri, 16 Dec 2022
 19:42:54 +0000
Date: Fri, 16 Dec 2022 11:42:49 -0800
From: Zhuojia Shen <chaosdefinition@hotmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v2] target/arm: align exposed ID registers with Linux
Message-ID: <DS7PR12MB630908ADD6C72B35321673DFACE69@DS7PR12MB6309.namprd12.prod.outlook.com>
References: <DS7PR12MB6309BC9133877BCC6FC419FEAC0D9@DS7PR12MB6309.namprd12.prod.outlook.com>
 <CAFEAcA_A45cj8RA03U0jOfawZihSp6WgSoaQ7XbGzxs0hAtkOg@mail.gmail.com>
 <CAFEAcA-dJA7NSR2jN2wy9JM+znoqigZAsV0w=KpSJ_MPEk1LfQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA-dJA7NSR2jN2wy9JM+znoqigZAsV0w=KpSJ_MPEk1LfQ@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-TMN: [Nyx/N3QOkRwRILSpYTTzjufM+4nunHYR]
X-ClientProxiedBy: BY5PR16CA0035.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::48) To DS7PR12MB6309.namprd12.prod.outlook.com
 (2603:10b6:8:96::19)
X-Microsoft-Original-Message-ID: <Y5zKOchBntU85Ahj@manjaro-vmryzen>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB6309:EE_|LV2PR12MB5775:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cfb7e56-d9bd-4583-2efb-08dadf9db7df
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YByJRil7yJdq5oH2n9I+1DXzLt3PEGQZAse9Lz1I6zpZ467p0J2X1GrCmnBUr8aLmVp3zNlSD/2X+10nexOqamFW6zgRbzx/HjIK7FA8i3NMnSp8Ro17W0NS56i2kGiO3nwAtrhGXLah0bIbzomHTEp+5woCKxtrDCSA+JLOuzgotx672OCfjCPvvSvm59YiD5MOmSqdV5X/7iiNKwSI2y7JoS2AK5XKOtcVstScsYtDx08E1mkSHEp1qm4ksZ/JwnZ6O2wndsRDPfvinY9k4mrKOn+MyQofnnw2ex9s0xJzkJl3+E/7uers+jpynjQXrVmiNC4V3kcDe9g1ixoVKGviUzPgZT0BQzQn6f/xbtv2wYPHnLmY0iOefiflJIgtPGoUxbuuUd45J3niwkieTOSXBJR16TXuyoDH6/Gtw/UK+6HuU017OHwczEwTZR3xkrcz+QRm+UHs8LQQ47wcSUQzyTx9tzst0W0YP0C65HiqwHtMgngZbFCx81g12RGsJQq4gX63nUE7Ris5Q/de+zc+eu4eDcW8XJHmXLgCCamA7v8VbrRQTQ6dtOv3uoMFzV6SNcH2vXPqqm5ndUpD86+wQcoSQqlxRwSV8daQIyz+RLTIfEA1EMzgw4laiD87dIYDXIaRrEKFUwysmRqALA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWJvQlQvTWhhMTRHQUpoMXN5SzExRENaY1lPckFxLytBNjQrVTNjWnZQeS9G?=
 =?utf-8?B?YWZpOFJGQzZxUnFPS0crd0JTLzNiTU1veG5hMUxJaDQ1MjAxVG9jZ1ZMK2xz?=
 =?utf-8?B?NGhLN25ETnJRTEpMK3R4UjBYUldlUE42dUdta2E3QStYeUNPeGw3Q05uZEox?=
 =?utf-8?B?dVJxMlE2bXBSN3JFRzNsYTBTTmc0c3MrZVAvNjdrZ2VHN3dDVldBUjR2M1l0?=
 =?utf-8?B?RkNLQ3lTaVVkOUFGTm9ITW9YcFhjUXo1VkU0MWJjUEYzbWl5cThZdFBHZGo5?=
 =?utf-8?B?eFA5RElrN0tYWDRXR1c0WGVlc1BET2xzSnE2d3F0SzJpREp0NEV5M3N3Mk16?=
 =?utf-8?B?QitxWStTcitjd2tGVEVVdUNLckkvNDYrbnUwU2hDbWdzWVM5OXJiVm5Wc2Zq?=
 =?utf-8?B?eFhzVWFya2VQTzE2RnppOEl2OHdqeWxBdGxOM1NvbnZhR1pjdk1nb2wvNVZK?=
 =?utf-8?B?TE4xT3U2SEFaeGRob0FzL29lWHFMTHJYemgyZWFFck1XOXQvaGlqQUVtRlR0?=
 =?utf-8?B?RHptRG1TZENxRXlFeXNVeU1mbU5xdVVwWkZadWN3ZkZtRFZQM3l2MmQxWVRm?=
 =?utf-8?B?OGZ2OUtwZlN3SzZyakwrMTREWkpTTjFzTjUwK0RnQTBpVktOcUVta3ZtM3Nr?=
 =?utf-8?B?czJBRFc2aWFvbi84R0R0VExiVnFMMndOcE1waENKa0M3dU55TFNLbDhLTlo1?=
 =?utf-8?B?NWxVN3NnelRlclRENXNaaFI0ZHVZbkxaYmRUdEhvOElpVVVnUGRETTB3RE1i?=
 =?utf-8?B?TWl3dmdTZE9FQjhNSG1NdTZsMmxHSy9uOWxkVjRCYWl2ZmNjWTNSVXVhbFll?=
 =?utf-8?B?eDlDL1phWCs0RmhWZHVXZU9FZ2poWno2VlNOK25kb2s0bmoyeTFGWlp0S2Rl?=
 =?utf-8?B?bDFNREFreEpxWFltb3NKMlpQaFhYTlREMWVDRlZnZnh2OHQrempFdC9selVV?=
 =?utf-8?B?YzZ3Uyt4SEVuOGJVdi80cDRsbjgzbjVXM242eG1QdTlTc1gzZ1ZMMUkvOFhz?=
 =?utf-8?B?WitRK0lyQ2thVWdrTDk5U2FrcGh3QnZ0ZVg2OTZ1bHJXSFRRamV0cEUzYUto?=
 =?utf-8?B?YTJKNkJoUkJjY1IyQ29IVnpSM3E5UktOcXdJZkFPWTV0cjNlMWVyMk43QXZs?=
 =?utf-8?B?UDZhVmlJUmU5bm5zNThmNlRuZ2EwUHRMWkV1U2xJSFhIVndrVUUxU3FxWU9w?=
 =?utf-8?B?ZVExVzAwdEEwTk9ZOG1Bc25aY0daYjBFRlVuOHl4Zzg4YTVVZTJ2eDVFbHJH?=
 =?utf-8?B?SThjUkhxWkJVUUVnL3g0SnNNWGhFUEpoSlJNSnQ4b3AwUE5qRzg0dmp2UHl1?=
 =?utf-8?B?dTdhU2lYWlFnNFdhWHBoQ290Q0I2QWwzemFvYlhQYkF1ZmUyNmEyaDh2dFpF?=
 =?utf-8?B?bVp4S0JHUDNVVGIwN3dKSDROSVFMZkNYUXJHcXlHMGZMT3QzT2xtUHJEa2hs?=
 =?utf-8?B?dkRlUkNlNWRzN2ZiZDdyU21NYjNhcVVObW9Ca2tNU3dTNlVZQXNhNXNBL3dO?=
 =?utf-8?B?ZlNZdzYrc2JETEpkMDhTdFpudVFCeE5oUmR5dlhBaXIxczNrTGk0V0diSXpj?=
 =?utf-8?B?NzFLMVFkMW1ib1ZiMDZsZXVMWDdmV1lGdStJSVo5NW9PTkZnUGFSUkdiWTAy?=
 =?utf-8?B?NmJYekZxTWVBY0V0ak5TeVpDWEYvOEhYOStTeEpMOWloZVpXNElkbTBMQno0?=
 =?utf-8?B?WHpVdk91bHc0M3g1akpia1o3VlIyYzd2REt1SWNLVkRPa3R5N2ZRWHVPWnJE?=
 =?utf-8?Q?Uk+/WkFI42PG1FTods=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-71ea3.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cfb7e56-d9bd-4583-2efb-08dadf9db7df
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6309.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2022 19:42:54.4844 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5775
Received-SPF: pass client-ip=40.92.43.32;
 envelope-from=chaosdefinition@hotmail.com;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 12/16/2022 03:41 PM +0000, Peter Maydell wrote:
> On Thu, 1 Dec 2022 at 16:46, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Tue, 22 Nov 2022 at 23:25, Zhuojia Shen <chaosdefinition@hotmail.com> wrote:
> > >
> > > In CPUID registers exposed to userspace, some registers were missing
> > > and some fields were not exposed.  This patch aligns exposed ID
> > > registers and their fields with what the upstream kernel currently
> > > exposes.
> >
> > Thanks; I've applied this to the target-arm-for-8.0 branch that
> > will become target-arm.next when 7.2 is out.
> 
> Hi; unfortunately I had to drop this patch because it causes the
> 'sysregs' test case in 'make check-tcg' to fail.
> 
> Once you've built the test cases once, you can run the single
> test with something like:
>  $ ./build/arm-clang/qemu-aarch64
> build/arm-clang/tests/tcg/aarch64-linux-user/sysregs
> which then will give you the output.
> 
> It looks like the test is hard-coded to check that an expected
> set of fields is exposed, so it should be straightforward to
> update to match what we now intend to provide to the guest.
> Would you mind respinning this patch to include the update to
> the test case tests/tcg/aarch64/sysregs.c ?

Thanks for letting me know.  I'll update the test.

Best,
Zhuojia

