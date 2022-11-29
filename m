Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8C363BA4A
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 08:09:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozuga-0004es-Fg; Tue, 29 Nov 2022 02:05:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=325583d4e=wilfred.mallawa@wdc.com>)
 id 1ozufF-0004P6-P3
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 02:04:54 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=325583d4e=wilfred.mallawa@wdc.com>)
 id 1ozuez-0004Ru-QS
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 02:04:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1669705445; x=1701241445;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=/GX6Hmsjjcmw3MeBymHnBsGZEMDer3iTRV+jpd+wiK8=;
 b=Hz0atZTKGeZhlBkfbw8KcAjLjhfuHdHbofDzexFNAc/bhCHh5Xs+flll
 pXsniSVNx6/9orKTXt5g43749LEC7AYx9pkRw6y+ZM8wwRNk4cmt8myQR
 WwUTJ9VXS5LjE4hq7GVV24pk8iNSXTJCoTCeh28Hebv4C28/DCWeZ5XJw
 0pAADH0/qKI2/0HYLNhRREQk1Fr7o0sHTZV+Eadb6GkDvIAxjzP8xIqUz
 kARSgDkm3QJVRz7TG0Mp7RhYe3dfVCYLEnz6ZDMeVMLa1AvVOGmN7AvHX
 rgymymSgiu0GSzFhc93LBdcitcfw+nCrF78Gd/Yqbj+8fjXwkrYRdxE/m A==;
X-IronPort-AV: E=Sophos;i="5.96,202,1665417600"; d="scan'208";a="217716576"
Received: from mail-bn8nam04lp2043.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.43])
 by ob1.hgst.iphmx.com with ESMTP; 29 Nov 2022 15:04:00 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bRO8K/QKcFw8KUvFE7vW8bZPpuatWWNzUPe4IbE6h+jflo4hKiw52FK67vhrOv0ykuuV8mkOZwAHPtYxWIXBKAdqfyPK8kb7zYGkQ/A7fuCiDM9i4hNZCx5NhlMig0onRwT20YZtCfAMo9ThbGA7TlEykbNOE9u4FqZ5kaRU55MK6gYbj5Cm0oRmPi1N+s21T8oatwWlrCzyhmNyWfUUlQdJqkqX9xIxlxjwmnHE0jX88GuafdZGtREeInojX3SzhtiqikT8LjkWcoo2vecDN5hCeNaeZ31ZNdEgsq233PXASohd8SONARFo8mvCjwzpStL2BjPDUVyvlvpmfhF0nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/GX6Hmsjjcmw3MeBymHnBsGZEMDer3iTRV+jpd+wiK8=;
 b=Vyhr8JdngOJoaskQ25KCKairBrpKEjrPO2XNPF4ooMgM/drB0D2XZ6exYZ1qHp0d5BSEBnc+qCScFrKRPsA8imjc1HAOSYRbBCtft2wH1oKRvixeP3AtDcH9wf7GaOzQMH++f6wqK6/pawCImQevMTL1gLjtfKPbWSvTDuS1ZWjxY1B9al6FKHeaHypVG5a/0/g8AuNrPDZwgx4IXdQfKrJQFWEXzZaTJwBIMQozh6wL5NfYokw7PQgZaT4NpE8ao0Siqr8NxMl/c/1xcHmzrNteoxGa8h2IpEw0Oqve2/H22mdIm2VsICqZuumqr+e7O8H3XshFNs5Mif42TaTXlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/GX6Hmsjjcmw3MeBymHnBsGZEMDer3iTRV+jpd+wiK8=;
 b=mXK/ctQbVY3rxB1xZl8m/RgUGOkAhfVRas4pW6PqUNxyss6zjQrUjh2zWAjE3KhJCWaZsFdUqtimfkR9fgP6IR4JR5AWjwIFGnIIjLBOIpAdjNtyt4dQ3kSTT+LggyOxA/YieTz8yqQwZp1GRBz85UjjKktAb0xPsdjNkAItQ0c=
Received: from CY4PR04MB0359.namprd04.prod.outlook.com (2603:10b6:903:b3::19)
 by CO6PR04MB7506.namprd04.prod.outlook.com (2603:10b6:303:a8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 07:03:56 +0000
Received: from CY4PR04MB0359.namprd04.prod.outlook.com
 ([fe80::6068:b90:7b94:c255]) by CY4PR04MB0359.namprd04.prod.outlook.com
 ([fe80::6068:b90:7b94:c255%5]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 07:03:56 +0000
From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
To: "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "stefanha@gmail.com" <stefanha@gmail.com>, "pavel.dovgaluk@ispras.ru"
 <pavel.dovgaluk@ispras.ru>
Subject: Re: [PATCH for-7.2] replay: Fix declaration of replay_read_next_clock
Thread-Topic: [PATCH for-7.2] replay: Fix declaration of replay_read_next_clock
Thread-Index: AQHZA47umYVyM5iK+UGSc+JTNqWsZ65Vel+A
Date: Tue, 29 Nov 2022 07:03:56 +0000
Message-ID: <504aa97b99bd9d7d471bbef002974b4ee4c3c947.camel@wdc.com>
References: <20221129010547.284051-1-richard.henderson@linaro.org>
In-Reply-To: <20221129010547.284051-1-richard.henderson@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY4PR04MB0359:EE_|CO6PR04MB7506:EE_
x-ms-office365-filtering-correlation-id: ac042f8b-6c48-41bf-122a-08dad1d7e1df
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IsSELvEFVOqTr2xXkVg5JUoIs4yVlgkgbgfJWeAAhg8XS8XCEbR/U+nd1uFX5M42G1F3tcHaEt3fz1AbT3shMCQMDSaNWANKheCs4ljK5C8IJ20Fv31lbJOr+jzL/uVQ/JFdhXtVthJwK0/7aA+YnjLP4Afr1tn0nxI00GmeTgZxVtYUVsZMB29DK041x2sy3Am/yqcy2HLidLbF2rSJL0TWdcbQt/TNbZKdInnBho5AFZ1AZtEKB0plhw78kOdcrjM7ISLbjox0FWP/cmurYymjzzMDuxNdaQAIr/IoDXyNLbTfgyt/xWrF37RHaBssc4I2yBZ85fdM+nAH3fvQ5DgMPs6+8P/OGbvc08IWk+67ttLkFP2Xa9r7oz8+0CY5pt0u4WXMz7jWmyajo9a9Rsec7vof5/Ij1WKKmeNQFheQaSWbdhgh6eyOIMLYVlVhFUiwSq07wsAMuamgfgiHMXeln9xcsNrSKC6HfSSOhgeADKVT3OinB0O51gKd9t4DCQ/hrWE69qN5HI5FmcnfKSjb+KYV/RmOUJHA0QwQHGBzXv5nPaGrAXQ8Fjh9fvz1YWf17xJb7noamWcQ5RMdWbd7+/yaOrZaHn3QHvZFFxK2MB2aWhvVpgyGaJ/5NlsiSY2GyMSj7WQYIDH2IhcW69ZQ+R9x0SiWR2oXgZp2QSAHqUM8T1/TN1R0K0QvA1fTr8vCGWkPkSkXBH/DU4O5UQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR04MB0359.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(366004)(396003)(136003)(376002)(346002)(451199015)(110136005)(8936002)(71200400001)(5660300002)(91956017)(76116006)(66556008)(64756008)(66946007)(8676002)(36756003)(4326008)(66446008)(66476007)(54906003)(41300700001)(186003)(316002)(38100700002)(83380400001)(82960400001)(122000001)(38070700005)(478600001)(6486002)(2616005)(86362001)(26005)(6512007)(6506007)(2906002)(4001150100001)(44832011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NFBRd213cHZFWmpmVXNqaEZWdm5xYjAvUW1SOXBJZTZramMrejFtVHlwRmd1?=
 =?utf-8?B?ZjFPWnJIaDBsTFBlbXVLWkl3QVhRam1Ub3hKcUNWTXg2QjFUdm52TTZva1cr?=
 =?utf-8?B?SHlWTyt6TEtRdnMxYXZPNVVJZ1dSL0ZpbmNhenRCMGRTTmQvWWxQaWYxNVli?=
 =?utf-8?B?MWZaczh0ZkROL3VReG02R1NZY2xUMmczU082WkljT3M4WXZrUG1IMnhhUHNM?=
 =?utf-8?B?VmFTeFRPRHVIcmVGdk1xKzY0dS83NThHa1FpL2RUcm5WcjA5RWhwWVB2RWZI?=
 =?utf-8?B?MnRDMTRlRnpBb2trWDU0MDBjVFZwZ3hhRG1nU3RnOUhEOG9FTFBuTDhBcDVV?=
 =?utf-8?B?NjRrQVAyNjQwMXdhSkxyOU0zOEJVUHROeHZaQ21aWVRiNDEzTnZvYStKU2NB?=
 =?utf-8?B?RTJaZjNwTys0ZHVxelJuZW5ZWE9WUzgrTHBQSnBCdzEvRE9SbVlHR25OZmNE?=
 =?utf-8?B?YjFxbHBMNzVsVDJ6UWZhUjEreDZvMlB0RTlkb1prL3pVRlo3RGIzODkvVzRm?=
 =?utf-8?B?RjhmcEZkYVFycUNCN3ZzSmU5M0I3MG9TejZQazFkMEhlOFZtQzVldnNWOHNR?=
 =?utf-8?B?VU9zelZnN2wwNU9UV3A2ZlhYUFFNTkVtbmdUUGxOMzRDMEwxcThLMFlJREtq?=
 =?utf-8?B?Mk9EbnkwRzlBTmJqWjZUOGx1anpBM2R6YlFIYXVZaXdscHVzcTBBcFordWd1?=
 =?utf-8?B?ZVF4bUR5Yy9JRGZqOUU5WDZIV3lDRURpSGwwZVFsa3JnT1ZQTXFCQXc2bW1Z?=
 =?utf-8?B?c3RWT2IzN3NyaUJTVWVqbkt0ekpLK2JpRlpsdDVlSU95aWoveEZrcUx0Ky9n?=
 =?utf-8?B?LzRKd2FvQ3RKS0xKZk1CS1JXTEtqZEtDd3lJUDB4dHFzUFdCSVFNOWd0ZzlV?=
 =?utf-8?B?c24yMlhjTVhWY1FiOUFSY0hjYS9DZTNlVGVRYkpSSU5EZm5TV3NpUlhxamt2?=
 =?utf-8?B?NXZPcjgxdEJHNDZiQWZjTWNMdWIvSlRvWHE5RVNWSHorN2NKOUNPTVJudmJp?=
 =?utf-8?B?VlBhYkdtS1ZSblp5bmN1a2t2d2dRcmNUalNKU250TkZEeHF0dTh5VW5GZ0xk?=
 =?utf-8?B?MUYrU2lUNVFDS0JtbjRCc1ZMdDBoRXovYUErWWNUa0FleG53RVI1ME9zWUVK?=
 =?utf-8?B?NVdUVDJ0TzNuZHNQVzhSTE5FRTdyaVlpQVRZcHdWc1AwMjJNeXVidksrSy9h?=
 =?utf-8?B?b1VjdXNJMEdrTmY1YTdiZ3ZxakIvMk44d1FtbkJFWEtBeGJKZGFaUTBDTUMr?=
 =?utf-8?B?akNXZjVPamRYMUZDTU1TUDJmTExMRlJqUkJ6YTRqeGs3MDhmTmdQNmRwQU81?=
 =?utf-8?B?YXFXQ2tPd3cyUGhCRCtHUnNiV2RuUFF6eDM4TFF0UWZSNGJWRkNCbGlESkVR?=
 =?utf-8?B?ZTFFbDZuRzkrVy9YcXFWejhWODMyTDQvZzlkUmxCTlZmS1ZOZnBIN1Q4NE4w?=
 =?utf-8?B?bU9wRmxEQVNZMTMvbHV2YW91MC9aZXlCcllXcWFqWTg1NjUrNGphdjZBclRN?=
 =?utf-8?B?Q2hVQ3hmYVRiWDJsNGYvOHR3V2RiTnhJYlk1ajJlMjVaZWYwYU5rZTVyaWc4?=
 =?utf-8?B?VGQrekoxWlhSbkprZnE1bFgzSEcrRkxNN25WV1Q5amJQSGJWTnJrMm9tYjVU?=
 =?utf-8?B?STVsbmhZZnFDMmZzR0tYU0FWM2dsSTRuNjNwbGZuVy9IYjRuUUhwK2VxTnF1?=
 =?utf-8?B?T2JVRkI5YXNLRWp4MmlWUEpYWGJ0UUJySG5sN1lwbDErUTZ3MFlmcWM4YVFk?=
 =?utf-8?B?RXgrdFNrMjFIbVNKeHdFSU5SMWVYMU5iMkQ2V0ZWZzNEa0J4R2J3dHNOOFJF?=
 =?utf-8?B?QVk5OHRUQndNWEx5OW81a0VnV01BTVJuNHQzRTVibjJDd2h6ZThwNGh2YkMx?=
 =?utf-8?B?UGROeFR6YWZEd2tJRU9ZWFZZV0pHTTNaQ2FIK2dSYS9QMkNDTDBOTGRNK0FE?=
 =?utf-8?B?RmpDTVFxbWdFU1FiMDhqYkdBalBEZEloQ2lWRzZ0anZnWlBBMnVXY0JySmlZ?=
 =?utf-8?B?dHdSdkdBSndsdk1mbkUxTkN1VlNsaUMvVDVDci90d0JqUVltQ3pxL3pWa3F3?=
 =?utf-8?B?NW1KN0lIQThDbFRMTVhDY3JIT1JRKzhQTjc0S1Z3eTU5VlVxR2MyN2YvSG0x?=
 =?utf-8?B?VzdYR3RLS0xqT2FwTVhKRGg4OUpMV2xnNnN2SHZzaTJ3Z0N0cUlCNGRPcUhB?=
 =?utf-8?B?K0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <78A66F2293B57C4EB35FA9AD29DA3139@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: vRBMCs1coKZrn70CvNZ5dWg/FB3unWhlKE/fWoz9++5X/TC3zIQ+uh7opVaeZ5JmIoM5raZqtAiqxpfcNE0rOgjrE8jfCnlGisOK/TiuJsd04IwHmMQuK3hpHyWGgIaP5RG/QJwIX+f6KsK34pJ3L58QLDUZpjMr8P1vH019lw2OwPeq2zaVey1e488a0MmK6lKI3/oEfwozStm6kd6Thl00ZC/xgHPSEFEsdTtFYq9mMQRowzQDDT2uEe2OOvCo3ffCCA6wR3xKY8UxxacgzGSIIrfHIx/AbSaMQXYcXh47LNWpme8tkuN2cA92dC7BDwG1D9+tlp/ZZd5tGloIb2hW0U5h4b3WvjB7iTwb4G6vFukoxShd2eP6OL2zdBukTJ9ARkvBmJSwLFTtL/BsutD5dZuizDVEgr05r2MgH1GZi3Cs93qcXxxQgDyl6+uMk/OZrhg4GV0PXaFTsVXu1c1riI0gohy/VGVjBys4bH05N8KOJut1E2LIiF9IFakLzfttIe8ji/gzUcLGb1hl6Du4CvUtcQMdEmNhc2xS7tKblH0PSakqxzDNM4zy9DEeWtQ/xL9BPjahYHncgPKc14dGoT5ou1reHC0ONTHRQe5pV24BAbCCE8QlG0JQavuOi0UQs9K4kiPz5fOCVNJRvlaPsvghzzwGeXMMHLaC9UOm6/k1gB+siQZpd8fRlSq10P4O8HHSTomeBYZ0Zb7ReKiWlYwfq+5225/S9FYD/xZte8dmaiCFNboqKW/tnVQ53sK+W3JDXN4C4WYG6gr7wa6WzneCroK0xdwd99eOWbhwm0hSgOzJ6sClYek1L4Qv5EShpZxvFPOy1n1K5RLEuAlsTSPdD/abd5L4BUnCjPM=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB0359.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac042f8b-6c48-41bf-122a-08dad1d7e1df
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2022 07:03:56.3700 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mSz0uXnbFJ69vTWcSGZnIdOe1OwDuxCr8nSOTFwvU8jojomtJT7I6vJ9hbYmwd9pydvzqpaq3vhliRRyfmYTzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7506
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=325583d4e=wilfred.mallawa@wdc.com; helo=esa6.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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

T24gTW9uLCAyMDIyLTExLTI4IGF0IDE3OjA1IC0wODAwLCBSaWNoYXJkIEhlbmRlcnNvbiB3cm90
ZToNCj4gRml4ZXMgdGhlIGJ1aWxkIHdpdGggZ2NjIDEzOg0KPiANCj4gcmVwbGF5L3JlcGxheS10
aW1lLmM6MzQ6NjogZXJyb3I6IGNvbmZsaWN0aW5nIHR5cGVzIGZvcsKgIFwNCj4gwqAgJ3JlcGxh
eV9yZWFkX25leHRfY2xvY2snIGR1ZSB0byBlbnVtL2ludGVnZXIgbWlzbWF0Y2g7IFwNCj4gwqAg
aGF2ZSAndm9pZChSZXBsYXlDbG9ja0tpbmQpJyBbLVdlcnJvcj1lbnVtLWludC1taXNtYXRjaF0N
Cj4gwqDCoCAzNCB8IHZvaWQgcmVwbGF5X3JlYWRfbmV4dF9jbG9jayhSZXBsYXlDbG9ja0tpbmQg
a2luZCkNCj4gwqDCoMKgwqDCoCB8wqDCoMKgwqDCoCBefn5+fn5+fn5+fn5+fn5+fn5+fn5+DQo+
IEluIGZpbGUgaW5jbHVkZWQgZnJvbSAuLi9xZW11L3JlcGxheS9yZXBsYXktdGltZS5jOjE0Og0K
PiByZXBsYXkvcmVwbGF5LWludGVybmFsLmg6MTM5OjY6IG5vdGU6IHByZXZpb3VzIGRlY2xhcmF0
aW9uIG9mIFwNCj4gwqAgJ3JlcGxheV9yZWFkX25leHRfY2xvY2snIHdpdGggdHlwZSAndm9pZCh1
bnNpZ25lZCBpbnQpJw0KPiDCoCAxMzkgfCB2b2lkIHJlcGxheV9yZWFkX25leHRfY2xvY2sodW5z
aWduZWQgaW50IGtpbmQpOw0KPiDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgIF5+fn5+fn5+fn5+fn5+
fn5+fn5+fn4NCj4gDQo+IEZpeGVzOiA4ZWRhMjA2ZTA5MCAoInJlcGxheTogcmVjb3JkaW5nIGFu
ZCByZXBsYXlpbmcgY2xvY2sgdGlja3MiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIEhlbmRl
cnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz4NCj4gLS0tDQo+IMKgcmVwbGF5L3Jl
cGxheS1pbnRlcm5hbC5oIHwgMiArLQ0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQ0KPiANClJldmlld2VkLWJ5OiBXaWxmcmVkIE1hbGxhd2EgPHdpbGZy
ZWQubWFsbGF3YUB3ZGMuY29tPg0KPiBkaWZmIC0tZ2l0IGEvcmVwbGF5L3JlcGxheS1pbnRlcm5h
bC5oIGIvcmVwbGF5L3JlcGxheS1pbnRlcm5hbC5oDQo+IGluZGV4IDg5ZTM3N2JlOTAuLmI2ODM2
MzU0YWMgMTAwNjQ0DQo+IC0tLSBhL3JlcGxheS9yZXBsYXktaW50ZXJuYWwuaA0KPiArKysgYi9y
ZXBsYXkvcmVwbGF5LWludGVybmFsLmgNCj4gQEAgLTEzNiw3ICsxMzYsNyBAQCBib29sIHJlcGxh
eV9uZXh0X2V2ZW50X2lzKGludCBldmVudCk7DQo+IMKgLyohIFJlYWRzIG5leHQgY2xvY2sgdmFs
dWUgZnJvbSB0aGUgZmlsZS4NCj4gwqDCoMKgwqAgSWYgY2xvY2sga2luZCByZWFkIGZyb20gdGhl
IGZpbGUgaXMgZGlmZmVyZW50IGZyb20gdGhlDQo+IHBhcmFtZXRlciwNCj4gwqDCoMKgwqAgdGhl
IHZhbHVlIGlzIG5vdCB1c2VkLiAqLw0KPiAtdm9pZCByZXBsYXlfcmVhZF9uZXh0X2Nsb2NrKHVu
c2lnbmVkIGludCBraW5kKTsNCj4gK3ZvaWQgcmVwbGF5X3JlYWRfbmV4dF9jbG9jayhSZXBsYXlD
bG9ja0tpbmQga2luZCk7DQo+IMKgDQo+IMKgLyogQXN5bmNocm9ub3VzIGV2ZW50cyBxdWV1ZSAq
Lw0KPiDCoA0KDQo=

