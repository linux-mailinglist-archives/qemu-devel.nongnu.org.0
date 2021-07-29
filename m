Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9833DA108
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 12:28:10 +0200 (CEST)
Received: from localhost ([::1]:56480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m93Gq-0001SV-UQ
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 06:28:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1m93FJ-0007t4-Ou; Thu, 29 Jul 2021 06:26:33 -0400
Received: from esa16.fujitsucc.c3s2.iphmx.com ([216.71.158.33]:48740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1m93FH-0007gs-3C; Thu, 29 Jul 2021 06:26:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1627554392; x=1659090392;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VVLIUUhEmy71ut3EHzsZ30LnEiNEQAZ8Ht8dUgJxpI8=;
 b=jtPqo06y0fwGqzwtANYezunVcHilbW+uA+HbFz+p7Z+36pUnVJyNs5lo
 kzG2ZGIvCYMtehq9HwuuS+f3xxFErp74t9tFFBs792dWcZqUPX3Z4cyXM
 AIFp0WJf9F+QYhA9znh4fdMzwsTZ5/yDeN/prkliPH1I/S3i7n/J4ouA3
 zaUBw0+BUPaoJ3CyVotPpvC9L9Oi3OlkLd9u3rjwo2L45QqnBlJhcDmoz
 u2EOs1e6ceqX+ElVDP91eQh9RXd2/lmg7LbLbETVLvfHx7WGcUM6w5Dcv
 MrOYtxuWLwwS6nyAZ8z3bPqQJq3ratZjXocP+Tr0lHZ8+CbN5a7KdqF8j A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10059"; a="35789436"
X-IronPort-AV: E=Sophos;i="5.84,278,1620658800"; d="scan'208";a="35789436"
Received: from mail-ty1jpn01lp2058.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.58])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2021 19:26:25 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZZ+8yheWiMETvjXGdUitAD8FwOYnIKin9JXau2HCg/aldi6/5qNcicHG1voICsvxXwbuekSquAS+0mX/bJXYMkEZJu7wTcCFgmlEXAX3M4amT+IqRVNigvBZOxCGuDybmHJD/VeEL+Epc9piYs39z371HfJd859BStM8Q0tnSZlEVZwuTcXiBbzhqce3UQXT61hRjLrHWT4Z+3i81BO+j2uiJZuFi2BpAVOjfJ/NbnchgzRK1xoanG8SDCexf+WcrFV1oW6I9Jobm2/ricQvobHDRVUyiZhh44P/TLD+X+v5joVBxdaM7xmnEBvmGx71HXSxzxXvrZVc4XrlE7a63Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VVLIUUhEmy71ut3EHzsZ30LnEiNEQAZ8Ht8dUgJxpI8=;
 b=kDQvOFqJMCj6B+6WDIL9wXbWlO6b9Ko6f4095rLFM3+QWNHccTYF6F9ucuy5tepbQ7XrP/My3ebL490aTac6gCscTO9WUfc1eBb5zf0Nn90QT4gF5GuI2zK7g4aNc5CbAdQgGiVwTOw/rk/cjcPMubWDg3Yv+41+KVaCZCNPlalE37xe/9yVyLroVLSpV/DNzlA9Z9dbDCMDvHcOXHyDhfljx+C9e4fPQJ3C6z6rTVlaQQ/ZALQJ6zgn2GZMePDkoXPWqJG0cYHhIAvXvl2ngvPkrSbpJehHDGKpINtU+8hYC7AuxQJD4q+D7hlmJHHs2ZTcquYCJpW2m1fhV80lTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VVLIUUhEmy71ut3EHzsZ30LnEiNEQAZ8Ht8dUgJxpI8=;
 b=kyv48wWKmziEtELIz0O+fJBMOQUDLNOxPNyWn0oqiD2mBnlUkAbs5UbH1Poei2eGaz2MtFmSiwc9XzENy9WJ4FEI53L68l8jTTmQskhn7nfdEY83k2HWCi3RTLlRIMfvMZwvU3k8vsSJrHeIhYB/7Nu2S0k6jzmQT3tKABCzXlA=
Received: from OS3PR01MB6151.jpnprd01.prod.outlook.com (2603:1096:604:d7::14)
 by OSBPR01MB4760.jpnprd01.prod.outlook.com (2603:1096:604:7a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Thu, 29 Jul
 2021 10:26:21 +0000
Received: from OS3PR01MB6151.jpnprd01.prod.outlook.com
 ([fe80::e07f:8552:80ea:cabe]) by OS3PR01MB6151.jpnprd01.prod.outlook.com
 ([fe80::e07f:8552:80ea:cabe%6]) with mapi id 15.20.4373.021; Thu, 29 Jul 2021
 10:26:21 +0000
From: "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
To: 'Peter Maydell' <peter.maydell@linaro.org>
Subject: RE: [PATCH 4/4] docs/system: Add a64fx(Fujitsu A64FX processor) to
 supported guest CPU type
Thread-Topic: [PATCH 4/4] docs/system: Add a64fx(Fujitsu A64FX processor) to
 supported guest CPU type
Thread-Index: AQHXegM8Q48iqYUTB0aCW5oa19FiD6tKRuoAgA9XqOCAACm6gIAAAiKQ
Date: Thu, 29 Jul 2021 10:26:21 +0000
Message-ID: <OS3PR01MB615199C11F52120ABFB6D243E9EB9@OS3PR01MB6151.jpnprd01.prod.outlook.com>
References: <1626413223-32264-1-git-send-email-ishii.shuuichir@fujitsu.com>
 <1626413223-32264-5-git-send-email-ishii.shuuichir@fujitsu.com>
 <CAFEAcA-Dd0eh35CUo7_-_adye+DrTuFK471-A3JfBbegxoU9Jg@mail.gmail.com>
 <TYCPR01MB616010C1BAD136B9156C6B86E9EB9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
 <CAFEAcA-_Q2D3WjfabyNXFnHsGsi2i1f=JmYVDGg47=EJamerCg@mail.gmail.com>
In-Reply-To: <CAFEAcA-_Q2D3WjfabyNXFnHsGsi2i1f=JmYVDGg47=EJamerCg@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9NjE4YjJkOWQtYmYyMy00MDgwLWJmNTgtOTFkYTU1ZWRm?=
 =?utf-8?B?NTZmO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFRO+/ou++gA==?=
 =?utf-8?B?776LO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX1NldERhdGU9MjAyMS0wNy0yOVQwOTo1MDo1N1o7TVNJUF9MYWJl?=
 =?utf-8?B?bF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfU2l0ZUlk?=
 =?utf-8?Q?=3Da19f121d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ee249ba4-7f52-4809-5bc5-08d9527b4f76
x-ms-traffictypediagnostic: OSBPR01MB4760:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB47600EF7973AAEC0C6D82639E9EB9@OSBPR01MB4760.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: I5CVvosWyh8gKr2H8jexZkQesrhy2EvBsJmZxwadMHHmKCvrIDCqNLVaOSJ9l0F3dZ57v80fV7f/o7HOJCTvWgvfKcfHjoSHEg0TBpNhflrvOyeyCQa6OEqpgNpwd+J+uIK7EZW/6vW6MljC/XxlBL1fwtJZIUByc+SksFjeNTI+JqvtQIeUbo/2+jG/q1eq9U55x3E8s4rMIEAcDRupgnA66wf3zg9+Swk+rjVnQr8lhB7ZxFZzwMPWHla6b/BWW6HZhh75CJKZ3l2MPS8vsBoRDAHWQEA42Ka7gmj0msbRGGURF23mjLkp8LSI2ymQmbgpFRrODvy7Kt3UHW8+yfw88fMw0CHri5fYJ8csA1OxVCmXCksOdPcDjKvL92gEpewv5/Bdy0IbHeFYLrskYwrkx2MyFFt8iqiEIdFAPJSasU1bsIRNDFPcAR5kEh7hVE6HniVyaNSok+akXAi9s/XqXDq5nX8tXdyXWxte8qu5yCM9pQ55C/qNOfwI2hfWq53eM6tNwFmCC8v5eKfK8Eh/FiCk9jqo6yN16Gh+Yn07mScc+qy+kzAjU5CUblmxSyl1Bkz+esax04dlxwgnWJu2TmNIAUky7gJyPMZIihchxhUW7MdrqtzAAuls2HhfBP9hCci8UOBpaZvNNZPfG1pcmDk+xjK7oiNwAMZ1Ub1gOtoe2tEks6ftBbgyhne+vVOzhWWGG1ZEApbcv32bkw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB6151.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(366004)(39860400002)(376002)(346002)(26005)(478600001)(6916009)(186003)(8936002)(5660300002)(83380400001)(8676002)(86362001)(33656002)(55016002)(85182001)(107886003)(9686003)(52536014)(4326008)(2906002)(54906003)(316002)(71200400001)(66946007)(76116006)(66476007)(66556008)(64756008)(38070700005)(7696005)(122000001)(38100700002)(6506007)(53546011)(66446008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Qk5OV2luTDViL3BUYXNPUUY1YXJVZlJkdDQ0aGVNdyt2L1BNWTVrcXJBUy91?=
 =?utf-8?B?UmFXTi85MnBGSDVmRWZ1Q0hDQXZ1RTVrQXBGdnpFbkp5N1pnMUY0WU4rR0ZZ?=
 =?utf-8?B?SnN0Uys1S3REc1ZvcE5VUlZGOHZtTUEyV0JucWxUcFhYMWlpdmNNejNabkJn?=
 =?utf-8?B?Y29ManhBNnpKd2hYQ2JSUHBsU2lHbEtMdXNNNjB2NTNDWlV0RVZ2ZjV6L1lk?=
 =?utf-8?B?WDNCTWp0OWNiK25FMGo2d0xxZC92ZjFjOE5BOHRWYllISmVrdkVERnREcXcv?=
 =?utf-8?B?SzU2eFQrQU80MS9oODVEUWNkU2VwbTU4dkRsVE9JV3hORERJZ2tWL1loZGtJ?=
 =?utf-8?B?cExDOEdLbk5aZEpWQTczeTNWeURJdkpUaUpRWDNOMEl5RUJTYXJ4aUJzQ3hF?=
 =?utf-8?B?NFJzMWpMNS9uZDZ0QmVKenVKT091bkpWaGFYclZHTXVpcDJXWERlc2Q4c3k5?=
 =?utf-8?B?cU5WRGRJNkN2N3N2OWF5YjdyQnA1L2RiR0IyU0JsWXErQW1Ec2VRU04xQWcx?=
 =?utf-8?B?dGN1eThqckRaamIzMlUyVHVOUDZqMTIrOWlJeWdWSkNzcnhtZVY5YmJCQmhq?=
 =?utf-8?B?QXN6U2dlU1c2V1pZcFh3UTIwRDVIMVdGcHVQS1Zob1lTVEhDUTJzMGRYbzAz?=
 =?utf-8?B?NmVscFc1dmpKaEcycVpocWtUb2QxazJNdWtsbi93Z3pVclFMNlR6Z3Q4cWVV?=
 =?utf-8?B?d2drZlQwT2tOYm11RFVqU0U0SE0vQkFuLzg4YTNFbm81d1N5VVBvSXFXK3Iw?=
 =?utf-8?B?bHRqRGlRRmN5TzBYRWFockJ3c2ExMXkyOWlidVh2V0w1WFNFS0VvbHk5VEN2?=
 =?utf-8?B?dlRQbWxTYi9HYldKVlJBbCthS2o2RVhJcUZEeit0cFFhWnVQNFV6Ym1FS29E?=
 =?utf-8?B?QnBqTGcwRk9tdjBRR2doNjE5dlpwVGF1dmlxZkh6RFRJNEVWQllpNzJ0dVIr?=
 =?utf-8?B?ME0wYm5VWTZ1bkxzbVJ5c05mMkh0eVRqcnF2NXFjaWFuMGVXZ2NHdXB0aUN5?=
 =?utf-8?B?YWZLNE1idm40aGN4RnJ5cGZQM1g3TmY1Vmd5K1lXb0h2VENPMzBOdXlkYXVv?=
 =?utf-8?B?WklVd3NycU03T283UHB0U1IrdmdDcW9tNVRRUjNxTjI4Z1o1VzZXWG1qdDFG?=
 =?utf-8?B?T2tDMDh3c0c2djV4RXpEdnVRT3hCMWRIZ0xMY3NLazQwdE9hMWFwMVgrWm5F?=
 =?utf-8?B?cnJKaUlEVzNVRTlnWmNEQ25BYjQ5L0JWcnl2bzNtU3VJcXFDSG9Vbzc0YzdS?=
 =?utf-8?B?clFINFRaakF2SUNoS3pPdldjTDJTMElPQXkzZE5QdkdnOVovYlVMUnpPY2Z1?=
 =?utf-8?B?SThnS3Z0WmN3elV0SklKaDRsblpLUUlSOUk5R2kyVW9LbjhnT2xLVXhvSVd4?=
 =?utf-8?B?WWloTXZEemFXQndKbkE3VjJDYnRrdk1IVmRZUVJ1b0d6dUY4NHFnMWgydFZZ?=
 =?utf-8?B?b0NzSlBCcGl2bnIwUDNVNUJnWU5xdTdtUkhyTjFmTHE2SGx5ZWpyaWlQTHg2?=
 =?utf-8?B?djQ4Z0hkTVdKK09jS25Lc29JSklneVgreDhLNDB1bWtDTE1WaGZDMTZGd0NC?=
 =?utf-8?B?c1pxWjNPYnFRUnZoVUNWVC95MS8reS96ZU82dUxoTE9aR1U3U240WDNQTTNs?=
 =?utf-8?B?anRCNExnSUYrMGV1NTFYaEdOSC8zN2w4RVBXNUZ3akMvanozbFREQVNJdFMy?=
 =?utf-8?B?SnY1U3h3c2NjZE1jOXE2QkxLY0VOU1BTWlQ1aHFYR3IwVnRjZGhMbGR1SVpi?=
 =?utf-8?Q?ilE7l6E8XPp1fvFK4K1QKUVvwR3lrmyJyrtPpRC?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB6151.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee249ba4-7f52-4809-5bc5-08d9527b4f76
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2021 10:26:21.6451 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7ElriYzg6uxmE7Nr46t5uQVC4YVqXWIURnmcffUnflRJb6fRS9o/YjCeXOJIaqzEqMGsE1wWRMjRUUQjwSyAGWOkG75tTtSL8REDgy+txqU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4760
Received-SPF: pass client-ip=216.71.158.33;
 envelope-from=ishii.shuuichir@fujitsu.com; helo=esa16.fujitsucc.c3s2.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQo+IElmIHlvdSB3YW50IHRoaXMgQ1BVIHRvIHdvcmsgd2l0aCB0aGUgdmlydCBib2FyZCwgdGhl
biB5ZXMuDQo+IFlvdSBzaG91bGQgcHV0IGl0IGFib3ZlICdob3N0JyBhbmQgJ21heCcgKGJlY2F1
c2UgdGhvc2UgYXJlDQo+IG5vdC1yZWFsLWNwdSBzcGVjaWFsIGNhc2VzLCBzbyBpdCBtYWtlcyBt
b3JlIHNlbnNlIGZvciB0aGVtIHRvIGJlIGxhc3QNCj4gaW4gdGhlIGxpc3QpLg0KPiANCj4gTW9y
ZSBnZW5lcmFsbHk6IGhvdyBhcmUgeW91IHRlc3RpbmcgdGhpcyBwYXRjaHNldD8gVG8gdGVzdCBp
dA0KPiB5b3Ugc2hvdWxkIGhhdmUgYXQgbGVhc3Qgb25lIGJvYXJkIHRoYXQgbGV0cyB5b3UgdXNl
IHRoZSBuZXcNCj4gQ1BVIHR5cGUgc28geW91IGNhbiBib290IHNvbWUgZ3Vlc3Qgd2l0aCBpdC4g
U28gaWYgdGhhdCdzIG5vdA0KPiAidmlydCIgdGhlbiB3aGF0IGlzIGl0Pw0KDQpXZSBhcmUgdGVz
dGluZyBpdCBvbiB0aGUgdmlydCBib2FyZC4NClRoZXJlZm9yZSwgd2Ugd2lsbCBmaXggaXQgYXMg
eW91IHN1Z2dlc3RlZC4NCg0KQmVzdCByZWdhcmRzLg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+IEZyb206IFBldGVyIE1heWRlbGwgPHBldGVyLm1heWRlbGxAbGluYXJvLm9yZz4N
Cj4gU2VudDogVGh1cnNkYXksIEp1bHkgMjksIDIwMjEgNjo0MyBQTQ0KPiBUbzogSXNoaWksIFNo
dXVpY2hpcm91L+efs+S6lSDlkajkuIDpg44gPGlzaGlpLnNodXVpY2hpckBmdWppdHN1LmNvbT4N
Cj4gQ2M6IFRob21hcyBIdXRoIDx0aHV0aEByZWRoYXQuY29tPjsgTGF1cmVudCBWaXZpZXIgPGx2
aXZpZXJAcmVkaGF0LmNvbT47DQo+IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5jb20+
OyBxZW11LWFybSA8cWVtdS1hcm1Abm9uZ251Lm9yZz47DQo+IFFFTVUgRGV2ZWxvcGVycyA8cWVt
dS1kZXZlbEBub25nbnUub3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDQvNF0gZG9jcy9zeXN0
ZW06IEFkZCBhNjRmeChGdWppdHN1IEE2NEZYIHByb2Nlc3NvcikgdG8NCj4gc3VwcG9ydGVkIGd1
ZXN0IENQVSB0eXBlDQo+IA0KPiBPbiBUaHUsIDI5IEp1bCAyMDIxIGF0IDA4OjMxLCBpc2hpaS5z
aHV1aWNoaXJAZnVqaXRzdS5jb20NCj4gPGlzaGlpLnNodXVpY2hpckBmdWppdHN1LmNvbT4gd3Jv
dGU6DQo+ID4NCj4gPiBIaSwgUGV0ZXIuDQo+ID4NCj4gPiA+IFRoaXMgYWRkcyBhNjRmeCB0byB0
aGUgbGlzdCBvZiBDUFVzIHdlIHN1cHBvcnQgaW4gdGhlICd2aXJ0JyBib2FyZCwgYnV0IGl0IGhh
c24ndA0KPiA+ID4gY2hhbmdlZCB0aGUgdmFsaWRfY3B1c1tdIGFycmF5IGluIGh3L2FybS92aXJ0
LmMsIHNvIHRyeWluZyB0byBhY3R1YWxseSB1c2UgLWNwdQ0KPiA+ID4gYTY0Znggd2l0aCAtbWFj
aGluZSB2aXJ0IHdpbGwgZmFpbC4NCj4gPg0KPiA+IEknbSBzb3JyeSwgYnV0IGp1c3QgdG8gYmUg
c3VyZSwgbGV0IG1lIGNoZWNrLg0KPiA+DQo+ID4gSXMgaXQgY29ycmVjdCB0byB1bmRlcnN0YW5k
IHRoYXQgdGhlIGFib3ZlIGNvbW1lbnQgbWVhbnMgdGhhdCB3ZSBuZWVkIHRvIGFkZA0KPiA+IHRo
ZSBmb2xsb3dpbmcgZml4ZXMgaW5jbHVkZWQgaW4gIltQQVRDSCAyLzRdIHRhcmdldC1hcm06IGNw
dTY0OiBBZGQgc3VwcG9ydCBmb3INCj4gRnVqaXRzdSBBNjRGWCIgcGF0Y2gNCj4gPiB3aXRoaW4g
dGhpcyBwYXRjaCB0byBtYWtlIGl0IGEgbWVhbmluZ2Z1bCBmaXggd2l0aGluIG9uZSBwYXRjaD8N
Cj4gPg0KPiA+ID4gZGlmZiAtLWdpdCBhL2h3L2FybS92aXJ0LmMgYi9ody9hcm0vdmlydC5jDQo+
ID4gPiBpbmRleCA5M2FiOWQyLi4yZTkxOTkxIDEwMDY0NA0KPiA+ID4gLS0tIGEvaHcvYXJtL3Zp
cnQuYw0KPiA+ID4gKysrIGIvaHcvYXJtL3ZpcnQuYw0KPiA+ID4gQEAgLTIwMiw2ICsyMDIsNyBA
QCBzdGF0aWMgY29uc3QgY2hhciAqdmFsaWRfY3B1c1tdID0gew0KPiA+ID4gQVJNX0NQVV9UWVBF
X05BTUUoImNvcnRleC1hNzIiKSwNCj4gPiA+IEFSTV9DUFVfVFlQRV9OQU1FKCJob3N0IiksDQo+
ID4gPiBBUk1fQ1BVX1RZUEVfTkFNRSgibWF4IiksDQo+ID4gPiArIEFSTV9DUFVfVFlQRV9OQU1F
KCJhNjRmeCIpLA0KPiA+ID4gfTsNCj4gDQo+IElmIHlvdSB3YW50IHRoaXMgQ1BVIHRvIHdvcmsg
d2l0aCB0aGUgdmlydCBib2FyZCwgdGhlbiB5ZXMuDQo+IFlvdSBzaG91bGQgcHV0IGl0IGFib3Zl
ICdob3N0JyBhbmQgJ21heCcgKGJlY2F1c2UgdGhvc2UgYXJlDQo+IG5vdC1yZWFsLWNwdSBzcGVj
aWFsIGNhc2VzLCBzbyBpdCBtYWtlcyBtb3JlIHNlbnNlIGZvciB0aGVtIHRvIGJlIGxhc3QNCj4g
aW4gdGhlIGxpc3QpLg0KPiANCj4gTW9yZSBnZW5lcmFsbHk6IGhvdyBhcmUgeW91IHRlc3Rpbmcg
dGhpcyBwYXRjaHNldD8gVG8gdGVzdCBpdA0KPiB5b3Ugc2hvdWxkIGhhdmUgYXQgbGVhc3Qgb25l
IGJvYXJkIHRoYXQgbGV0cyB5b3UgdXNlIHRoZSBuZXcNCj4gQ1BVIHR5cGUgc28geW91IGNhbiBi
b290IHNvbWUgZ3Vlc3Qgd2l0aCBpdC4gU28gaWYgdGhhdCdzIG5vdA0KPiAidmlydCIgdGhlbiB3
aGF0IGlzIGl0Pw0KPiANCj4gLS0gUE1NDQo=

