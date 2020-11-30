Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E80CD2C84E5
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 14:17:53 +0100 (CET)
Received: from localhost ([::1]:46488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjj3x-000060-0B
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 08:17:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wentong.wu@intel.com>)
 id 1kjizG-0005xY-6h
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 08:13:03 -0500
Received: from mga11.intel.com ([192.55.52.93]:15122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wentong.wu@intel.com>)
 id 1kjizC-0008Br-1o
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 08:13:00 -0500
IronPort-SDR: WrRs8IG+sRDEd7gbAEkkGg4Ch2ens8t7LbZU8VrLN9VC45CeT1rZ9dfpam9fnIzPDH9dMGgfma
 xaoPt19egKSA==
X-IronPort-AV: E=McAfee;i="6000,8403,9820"; a="169132382"
X-IronPort-AV: E=Sophos;i="5.78,381,1599548400"; d="scan'208";a="169132382"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 05:12:53 -0800
IronPort-SDR: tf1kQIyQruZ9SPR/AX7jhWQbRFT5w4FN+BcyuDYtjcRQNwZcDQJT1j1nasgG78bMNX0icQgDE4
 UlVcAwBB0jYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,381,1599548400"; d="scan'208";a="334652761"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga006.jf.intel.com with ESMTP; 30 Nov 2020 05:12:52 -0800
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 30 Nov 2020 05:12:52 -0800
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 30 Nov 2020 05:12:51 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 30 Nov 2020 05:12:51 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 30 Nov 2020 05:12:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lo9hp0ScFay2k/6g+JBTUHuk5HE8W61TCtVoFEC/eqn1HkkZi+qMWUaUY+HQgqYXj7sA6KqPTHHTrA6IoiASWNO13ujncHoz1RDlYJXCR+ebrGtKlAh91M8yKtkOpBXx5fdHH6h/x6YOWnsHQdIjZd5pAT+kmFWDf48mZ207hrQhIXNJfEbrWfSZ2gFTFEYGjIFyrINQy/5Vi7yq6ViQk/8vRmUqoeHfVtaxI4TpAqLjQmSaJ5R6RMxi2UcyKEpmPKSQYX51cR1x/sV91rz+FaIQICRvJAoSohi/WoTFCQgBw8v1Xa819P/drhuMizPKV1uZqtD3q0dcYXLQrL2dzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7YTC6p86axECU4gVCj+7oFgc1jPgtpj7X+gohG5SY9E=;
 b=PWBZ8tnbthDosB3g9rEtTv1KMFNDScWOCM1mjX/B60UCSw8FNg9CRcT+pAi726kQ+AzQtxVbfwK2YTp1H0FzXHlDlbr/VriOxaqXsHl35qGu7iZjW/J4ABNgVsSwLucPkjhBSddBTp/JRjp4eGAEZiiYGPl1qjucs8QTvFV1wZpsxK+LeLz9a3h8ZMRDtcc/oJDI18VvvdzanJfaKccbcH85qMAB6r5l8Ih0PMEDsu/EsDAYO1g15MBKKwGyEVgpAv8nDEbHxaTLwHWUtyHr1okBT3YSWXrRDTBAh7yvnPFfs9Rr4QosAmP9+nvVVVZgKwOqfKVqdYZWVhI0wFUxHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7YTC6p86axECU4gVCj+7oFgc1jPgtpj7X+gohG5SY9E=;
 b=akhQB8LEDIQlGXbrEivyj8V/dism9ai4AN7sQumO1KtBihLo0eV1oP2QAkW6DZPVdHMNe3R0l6X4O15g3NIrnkcgmr8i+2Vdhe70pB3kKqXh1aDL32kC/rvHdUR6GBAwUhA+6IiXoKQGDrUBx7odzSP0cXjbRL9ET/KgtY5E9KU=
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by DM6PR11MB3097.namprd11.prod.outlook.com (2603:10b6:5:6b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Mon, 30 Nov
 2020 13:12:49 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::74e4:9b56:e013:149]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::74e4:9b56:e013:149%6]) with mapi id 15.20.3611.023; Mon, 30 Nov 2020
 13:12:49 +0000
From: "Wu, Wentong" <wentong.wu@intel.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: RE: [PATCH v2 1/3] target/nios2: Move IIC code into CPU object proper
Thread-Topic: [PATCH v2 1/3] target/nios2: Move IIC code into CPU object proper
Thread-Index: AQHWxnbBmTrkztkwLUad1WT77MGBTqngKMUQgABHtoCAADa8QA==
Date: Mon, 30 Nov 2020 13:12:49 +0000
Message-ID: <DM6PR11MB431648984CCFB479C76D5C3A8DF50@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <20201129174022.26530-1-peter.maydell@linaro.org>
 <20201129174022.26530-2-peter.maydell@linaro.org>
 <DM6PR11MB4316328210E97BA3BB8B9F9C8DF50@DM6PR11MB4316.namprd11.prod.outlook.com>
 <CAFEAcA8R5UqdHh6PijxH5_KOEomLo2KPY1Mm4a3kZkoArFZeZg@mail.gmail.com>
In-Reply-To: <CAFEAcA8R5UqdHh6PijxH5_KOEomLo2KPY1Mm4a3kZkoArFZeZg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.204]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 634a6be9-aab6-4da0-c80c-08d89531a310
x-ms-traffictypediagnostic: DM6PR11MB3097:
x-microsoft-antispam-prvs: <DM6PR11MB309745D4D685C27ABE9D58838DF50@DM6PR11MB3097.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qajlsZNyCVt+Rw6wnz4gTAw4jwtP4KkVwfzbCETMnBnhsGdpDaOFi7eM4N6K3kF0exeqlcnHf6Gi34buQH06ahYzcdtFsjPD3diXzvWzozKWP/NAorj2m5yd76c+KojxycGuERNo7p5TRrnOHc6FH4Z7UAQv6Z7AduP1IL7Lgx1gFFdfcB9HbrnmER5zWYKS7R2Nr6Hq3ekfZAH3JcFKpRK/4sauc4cbDq9WMdfCljFMkasbiBhVyXyo5513qNvdbXB+WYz39BF1nljEEFWV+LWsrXT2ArrOcxVJhytmRgxLOgYm7QlgYrxo8g4zpO4o
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4316.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(136003)(396003)(376002)(346002)(86362001)(9686003)(66556008)(8676002)(7696005)(71200400001)(478600001)(26005)(76116006)(558084003)(64756008)(66446008)(66476007)(66946007)(6506007)(186003)(53546011)(54906003)(316002)(52536014)(5660300002)(33656002)(8936002)(2906002)(55016002)(4326008)(6916009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?VE5XVzJIazdQOFVGVVNwUjJZWFNzOHY4SjY3ZmRoRzByWFQ3NEZuSFB1Q1Nz?=
 =?utf-8?B?VG9VaVZCREY4QXVvZUxUYjJiYWVJdTZIRmtVbFBob1NSMDU2UlRhMjJudGNL?=
 =?utf-8?B?eHFYaTU2THlzYkZWRmxPOVUxdUpHY1ZvZDlqQjBmUm56MXN3cGk1Wk9YTzlK?=
 =?utf-8?B?amM2SDJyM3RPeXVmclQvRUc3b2licUZxTzRFUFJUandhTDhEdjYxYWJYSXo0?=
 =?utf-8?B?VG1SZTM2bFFEcHU4TGxhN2t5M3RuSDlVYmpGNDR3QUlhbWZTbUpxU0w5UDBq?=
 =?utf-8?B?Q2NBRWZOcm01ZVVBZjQydE41R2VaaDBNVkVKcm5mRTI1SHQ2OVpOcm04UFFp?=
 =?utf-8?B?ZWdhRjlCRThQd3I3NWpKTGxRRUFqajNVRGQ2MkR0bFRyQXlBNG96NVppTzA2?=
 =?utf-8?B?c3FxQ1F0VjBzWS9yVmdzbEF3bXVJNU1zK0Y4THQrS0NxSE5PTXhzRUlFblJr?=
 =?utf-8?B?aHRQUXVCY1JmMmxpaXRNYUV1YUhUM24yM3NJRWM0dW92SVhSSVhISWFNbXZV?=
 =?utf-8?B?cGFiVEtYUTJVcWsyakxiVm9oMDdpUVliWjVubXpyR3lmZWYxUnhiY3NmRnQ0?=
 =?utf-8?B?TFdERjNUaENaTGlLWk5NME02ZU83OFhsMmkzeTJwU2F0NmlnR1Z5Z2NIcFFa?=
 =?utf-8?B?MWNpVGt5Smh3Q3hEVmpkVlIyRThOU3Q4b0swVnBhSEIvNHVZNlZETk0yK2J2?=
 =?utf-8?B?NE9zSjR1eC9SWXdFY042a0wvWmVCeGFSeGthZ29Ua2dlQlpkWlVLTFhLVkcv?=
 =?utf-8?B?VHkzYm9pK2k5OEdQcGZ5YUJabmxLeUxZNTV4YnZHbkdpcXNJSXhDK2xEZEFV?=
 =?utf-8?B?K2QwS01hRlU5Ymd1K1dTVkJ4dW8yemFYQkxwaEFyaGtoYnJTUitySFE1ZXlk?=
 =?utf-8?B?ZWVFSUxoWTdzQ2dwUWFPUTJtTExCckxnckJOT0hCeHVOR3BFNmMwM1piQnoy?=
 =?utf-8?B?cWhBYzBtazFJaTB1cFVxTFZuTGJ5SERmMDcxMUQ0VmdySEtkdGNCSmJRRnps?=
 =?utf-8?B?cGxTdFYvV2Nnek1IcVRRK2UzdXRwbCsxVXRYNlN0bml0MTY2Q29MbWNMR3Q5?=
 =?utf-8?B?YnNwcFJwdjNCMU5SQTJacEVyOEtTSDk1b2kzMnJuYnhpZ2VpS0hBWmhxMk1v?=
 =?utf-8?B?S2EvK01SZ0M4SzYxSWF0TW4xN2JMVkRLNGwvdEtDeTVmNGlGVi9BZGpIaWN2?=
 =?utf-8?B?eGhjSkNUS0Z6R2VSdDl1ZncxY1JmWDlsRlpYZGlZM2NMWVlhYjJwbXM3eHhX?=
 =?utf-8?B?T1dlVXU4b0VTZkR1cnZlTUJBOUlwc1VUNzUyYm1OYi9CUjlyNXV2aGV0aFo5?=
 =?utf-8?Q?2WG6HkoEzJfnk=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 634a6be9-aab6-4da0-c80c-08d89531a310
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2020 13:12:49.3318 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ql15jKWiy2owm3usEtipjDVt3hW5bQfogk+G6Bs5KgT8BnNBG+5QZSA+upmb7QTCO4awxqIE8fupWqSua/Jt3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3097
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.93; envelope-from=wentong.wu@intel.com;
 helo=mga11.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: Marek Vasut <marex@denx.de>, Sandra Loosemore <sandra@codesourcery.com>,
 Chris Wulff <crwulff@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gTW9uZGF5LCBOb3ZlbWJlciAzMCwgMjAyMCA1OjU0IFBNLCBQZXRlciBNYXlkZWxsIHdyb3Rl
Og0KPiBPbiBNb24sIDMwIE5vdiAyMDIwIGF0IDA1OjQxLCBXdSwgV2VudG9uZyA8d2VudG9uZy53
dUBpbnRlbC5jb20+IHdyb3RlOg0KPiA+IFJldmlld2VkIGFuZCB0ZXN0ZWQuDQo+IA0KPiBUaGFu
a3MhIENhbiBJIHB1dCB0aGF0IGluIGFzIFJldmlld2VkLWJ5L1Rlc3RlZC1ieSBsaW5lcz8NCg0K
U3VyZSBhbmQgbXkgcGxlYXN1cmUsIHRoYW5rcyBQZXRlciENCg0KPiANCj4gLS0gUE1NDQo=

