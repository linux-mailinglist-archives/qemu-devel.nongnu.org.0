Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 672603DE3A2
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 02:39:05 +0200 (CEST)
Received: from localhost ([::1]:58646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAiSW-0003I0-10
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 20:39:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mAiQl-0002Mh-Ds; Mon, 02 Aug 2021 20:37:15 -0400
Received: from esa12.fujitsucc.c3s2.iphmx.com ([216.71.156.125]:47444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mAiQa-0007mO-LE; Mon, 02 Aug 2021 20:37:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1627951025; x=1659487025;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IiUUwfJWAMWJJSv07Shor4Br6aTnPcoLSzk2ksdfRSI=;
 b=UD5azZ9thCDYOmp8nWWFtI5faWkjMG7kXaPKY0G0UJqwuh4RP4mq87in
 nzn2o4qgJrGxNWKKhVwqvny5aCarQ6ADq8GOaNxdtPOVGAKuQ/fxy+1qt
 vpb9Nw5l6HflUoQUnrs3ugIjVPKkGhQ8dLmTEy92GvtiUql5S1PU7pSr1
 GOdiwupNXTaU96SLxsCY8EvIhpmsHC2eLyZSgc1//63dO24pGv8ptRduj
 FtkquRPJXYXEAM7W+/R7iPxCnplp1TQYyAOkG6DoFPWvCKZnGC0CXi1Ci
 MOy34FyxDa3Dd3SaNEmo/EI0wCFWRzgZ04RNhHBD7sM+Unv+eEMSmJMed Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10064"; a="36042535"
X-IronPort-AV: E=Sophos;i="5.84,290,1620658800"; d="scan'208";a="36042535"
Received: from mail-os2jpn01lp2054.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.54])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 09:37:00 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n7zWAVpGisdSRr0u/OYFdNl1OgXgJuekf9ByGbLwiO5VLvxzh7Od84aJKQzr/CzRFztlB2Xup/5Kwd83neUA5HXrJ11ZSA1mClV0aWcc6gVwT11R9VAsU2FrKm9x4ljdqAIUDauflDmR9wQJQFb2hzJ2I53BUUE6QZZuxw2mPcpT2kBgve4AbGAqljLDclhbSTWCOJQBrcOiqRnvX0yfNNC5pwmNgWF3qDU5dk6iJ3YtrcK0389DD5xtMqtfsPTJQgAJZFBH9ajMhePUCfUhP74WiOUMM8OvsSDst92OqqLado1ALSyutx+L+2yRIvAjUP48xF7ngzIXoJ18K6rO2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IiUUwfJWAMWJJSv07Shor4Br6aTnPcoLSzk2ksdfRSI=;
 b=ezFnMbx6dZKrdgGZJi3fV5CZOiwbrzZjpYxTVb1twRcImdXiGO2XDYYV7LgFDPl2A/T2EALcSuzV4wLQ23QOZJiw8VbT+RmwBHsmDc4IfB+Z+aoJg2LBomvgpoT7Z2ARGsE2bC5ZKnKSaBD+zz6OsIO/65ns3sip0Ol2LHeTCCXTGAlMWdB9XljYYcVfya5F7jyXXT6PuJAX1k67gD9Uqi3TcoS/myclxWFnXouSnO4iyojo2MY2OVQd+NDoZ+evMXzTrCVAa3bxkQig6h9ow4DLm6kz8PUcQlPPRonzyzIDJgzFFlSFCEJuFt56+FSf04vtpeVFJSg9MLxyJks8lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IiUUwfJWAMWJJSv07Shor4Br6aTnPcoLSzk2ksdfRSI=;
 b=fMZeYJhrnf1yWBUFDaSB6rfDgvZ6lqPonT3EFKIjeDc6JM6aLcxXAYLzmWe+24WolrcQLVo9lIz2Q7TA0aapCSslUzhjSLUZnlqY3naQufk6JrYrv8YBQ5TJZHNhfozjrG2Cp6x7/2lcQlt/7XaAVJV1uakBRxlp+yMYAwzPAjE=
Received: from TYCPR01MB6160.jpnprd01.prod.outlook.com (2603:1096:400:4f::8)
 by TYAPR01MB5899.jpnprd01.prod.outlook.com (2603:1096:404:8059::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.22; Tue, 3 Aug
 2021 00:36:58 +0000
Received: from TYCPR01MB6160.jpnprd01.prod.outlook.com
 ([fe80::154e:70ee:e0c5:f482]) by TYCPR01MB6160.jpnprd01.prod.outlook.com
 ([fe80::154e:70ee:e0c5:f482%8]) with mapi id 15.20.4373.026; Tue, 3 Aug 2021
 00:36:57 +0000
From: "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
To: 'Peter Maydell' <peter.maydell@linaro.org>
Subject: RE: [PATCH v2 0/3] Add support for Fujitsu A64FX processor
Thread-Topic: [PATCH v2 0/3] Add support for Fujitsu A64FX processor
Thread-Index: AQHXhPAtgv8g2r/pX0+8GWEfCfHSiatbVDOAgAWf+mA=
Date: Tue, 3 Aug 2021 00:36:57 +0000
Message-ID: <TYCPR01MB616096BA80EBBA7FFA10A119E9F09@TYCPR01MB6160.jpnprd01.prod.outlook.com>
References: <20210730030821.231106-1-ishii.shuuichir@fujitsu.com>
 <CAFEAcA_=685EKqdsLh=rnXPXQNSRJ+PNuDYec5LTxr_rcAbeOQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_=685EKqdsLh=rnXPXQNSRJ+PNuDYec5LTxr_rcAbeOQ@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9MzY0MjhiZjAtN2E1Yi00ZWFiLTk1YTctMWMzOTg1NmFm?=
 =?utf-8?B?MmQ0O01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFRO+/ou++gA==?=
 =?utf-8?B?776LO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX1NldERhdGU9MjAyMS0wOC0wM1QwMDozMjoyM1o7TVNJUF9MYWJl?=
 =?utf-8?B?bF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfU2l0ZUlk?=
 =?utf-8?Q?=3Da19f121d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4829d7f0-8a2d-456a-ce78-08d95616cd14
x-ms-traffictypediagnostic: TYAPR01MB5899:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYAPR01MB5899E320385CA445F9851C13E9F09@TYAPR01MB5899.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wPt67IlSRnmjV9cI8Vmb66eGpeUFMTQiuVDZufO7zmNu6Ku0WDAA8wycT4qhDmxMRLy7ov0svxIqSx4BA4/HWnB6sRBdCt/ajl+yYaMd3Smx2Fv6JBq/Px5MjeIW2cwPeAw5fA4vpetZvvVuBrzAXkyt0pGHwlPAqsqEnn542qIqAQYrTkHtA3qumN5vhg7EujjSpaXmkMIjPczGjC4ttEMsySaQVuY3ExVa5X03WMWaocIOxwWmtuh/6RacNRmCS8WKa9SJOqVemGeHBakU+q9Rwd9Ml0JRuAxYOTSN+vdiKTmxcDDfFfRdToOLlz5u9lAGGBcPKXYehuoQbL9dcrmyrO2xnOanhVb7DKipelxn5UPa/QR4FCMcevFQrU4azq/867A94j23Qdhj3ZpsTGisUC/Q1Q+abcFVjDpXbuXXwxUupVu49vlJNhkNK3Ee8xglO0Y44y3drZsjNhMN7oPzCqtGHoK858PMWHyNwDERJCA6nSey/PO+ZnaFPq3cu6vTckAWC38xZYSYWUW9jMfuU1QFloVB6zmxrDRLdiCSiF666hIKqfa+hvVzl/n4jpQa6O6p94vt6avaAgWNG7kW1RIlW5nUXKT1+29M2FT+gmEP0ZNJNMgXOTL77rDJHvxO0iK3P4ShI2NECsfrP1J/Tm2LcyC9kvEM4zb3nlE9ZXG/Fazwd4thJc+LyyrWYQ9pAcsiVmyI+ZTI2Pa3wg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6160.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(396003)(39860400002)(346002)(376002)(7696005)(83380400001)(26005)(85182001)(6916009)(122000001)(38100700002)(33656002)(107886003)(66946007)(4326008)(76116006)(5660300002)(38070700005)(53546011)(71200400001)(86362001)(6506007)(54906003)(52536014)(8676002)(55016002)(186003)(316002)(66446008)(8936002)(9686003)(478600001)(2906002)(66476007)(64756008)(66556008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cER5a1lUcTZyWmF3bWZYSGZhSFprSWF0U2x1N09yMFFwb1B1UVphV0pWdjRa?=
 =?utf-8?B?MFE5akF1eFdJTUJpUHh4NWUwSStoZ1JCdXgyTDJLNWFuK21idkNvaGZvNmNW?=
 =?utf-8?B?QzZRcUpUSFBxMmNFVjZxS0FsOFZMR0FtUTRhZmNBNmxyK1BtZ0VaSWV2VHRt?=
 =?utf-8?B?OHh6bDZjM0x2MGFpY1djUExFWGFnQVphcjJ5azBza0l0VlQzbzd0dmhmSWZo?=
 =?utf-8?B?L01LOXB5T3V6R0N0YlZxYjZZdmZoeW41YUhsbHRPdlh6VDYzQjNuTE5CMG9z?=
 =?utf-8?B?SncwbnVHOFZyTkNlQllKOUI4RFo3eFdBN0cySnIweWphWDZPRVRieHNuWFBV?=
 =?utf-8?B?U0I3OTVHQm41RWluS2NVbU9SaFFteTZxbmd3QWFVMDFlc0JDNDJBSDV3K2to?=
 =?utf-8?B?TkcxL0Fxdy9EVVNYN1JPenA0Y3ZrbkFIaUNYL2tQV1lzZTFFcVZSd1pYZzY0?=
 =?utf-8?B?Mm1NeEZQT3dIdjlzYVF3QmtUZmZBb0oyZ1VBRzhtWTRsc0tjOUsvRGNubDAv?=
 =?utf-8?B?dXc2QkxEcFFZMVV1ZHlUMndLY2FzdDFYVEJOcUJUbjdLOFpQZHUzVnU2QTNB?=
 =?utf-8?B?bWNSbHJKQkFYSlVtVHBZMFZSSGhKanJkbHorR3lNcGp6UXZjNFhteWREOGIw?=
 =?utf-8?B?ZWl3RkZINHBzMDVmWlJYbUhnZDBWcWdEUWlzVXg5ZkMwb1dxUU5VaUNmZjNM?=
 =?utf-8?B?eldLbHJ5T3RqWVR6WTU2SEE3Vm5iZDdaeHFId1dKWW4yWXdkVUF1K1c5UXdj?=
 =?utf-8?B?bVdTRmsyYzROR25kVjZQNCtjdElKUktWWm9KcmlnTkhJdEE0V2ZHYzF3WWFN?=
 =?utf-8?B?NW1IdkYrVDVYaVN1ODVmVEhwL3kyekcvOGt5ZUl3NGlQem9EY2E1R1UzS3BW?=
 =?utf-8?B?Zm1ITGxLR3BvSjFCa1BOVnNBOEd3eHdLakdhSHhHUHBiT3dSVFk3N0lmTUNz?=
 =?utf-8?B?SEVlcUswSTJtMUxab0dTNDVUNGVWRUJQL2p4WWtFcG5QbUlxYkpZZWJENDFx?=
 =?utf-8?B?dTNTc3Z6VUdPdXVrYzVSMDlLeEtQZE5UcHdpYzBMbU1heEZxdE1zeFZSb0ZS?=
 =?utf-8?B?cERPbEFObFVpZFJzLzJJdGJpNHRYOUVtRmRZcStvYlUwbTVkcjd1K0swclAx?=
 =?utf-8?B?ZTU1dGp3Rng1OHVJNzZ0MVRvQmlGaXNQVit3SmJ5Q3E3QjFKVXZPOVdxbmo2?=
 =?utf-8?B?M2RDZXFjMG5nQk5wZE9vTXpIWmFRald6QTFzY1Mvd2Y1YzRtMVI0eDFTYXFp?=
 =?utf-8?B?UkRFdkV6RXJBSm5nT1BnVkM3WkxJejNvZGRrMHlqa2Y0MnN1djUrTFZyUDQr?=
 =?utf-8?B?U2d3MHd2YjVCdzZVOTRpQVZIaTdIZU81K3J2eUQ3WUpyeXdlTDBGcmxlRWNi?=
 =?utf-8?B?cEZIZXpzYWpSU043TElFcjBGM05mYTVpVmZtOVRFYWVibWUzWmVxeXhyVDFC?=
 =?utf-8?B?WHYvc2l6UzdnZGZNZk5ORUtJaThkcEZyZGpNeUNRRjdrdXN3SCtGaENEY3hj?=
 =?utf-8?B?TGVhQWJCY3Bza29tWTNLQTZ5ZUw5dURxUnhkTXlTbzdsbHZFK3lwWktpS1Z6?=
 =?utf-8?B?emw3WUhXNW1zNEVLcmVCaGZXRzNpQS9SbVpIaTdDYU40clBIVzhvMEt0Q2E4?=
 =?utf-8?B?b0tDSWhQVFhpSGdRaWR0a2dlcmltSFFINUNZN05ZdjE2TEdkbTUrWXNWc3Ir?=
 =?utf-8?B?SnhFMFdzTWdCQUFPS3NyMVYzM3ZEOGNGNnFjLzVKY00vTEdiYTlsMEM5STNV?=
 =?utf-8?Q?0pe7GYv+LoH1j/lQ0kOFsr2KJmqGwPbiroETRAT?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6160.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4829d7f0-8a2d-456a-ce78-08d95616cd14
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2021 00:36:57.8283 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: heGxgLGTrx09uav6fB4i26YVU0L6PvJOjPZrzs86ChfEnqFRoucDwOVrlIhbc+WmomMH1yB1EOvX8pXqiASrfcazCSW48HWUs4r8caynIa4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5899
Received-SPF: pass client-ip=216.71.156.125;
 envelope-from=ishii.shuuichir@fujitsu.com; helo=esa12.fujitsucc.c3s2.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiBJJ20gYWZyYWlkIHRoaXMgaXNuJ3QgdGhlIHdheSBhIHYyIHBhdGNoc2VyaWVzIHNob3VsZCBi
ZSBzdHJ1Y3R1cmVkLg0KPiBUaGUgaWRlYSBpcyB0aGF0IGEgdjIgc2VyaWVzIHNob3VsZCBiZSBj
b21wbGV0ZSBpbiBpdHNlbGYsIG5vdCBiYXNlZCBvbiB3aGF0ZXZlciB2MQ0KPiB3YXMuIFNvIHdo
ZW4geW91IG1ha2UgdGhlIGNoYW5nZXMgcmVxdWVzdGVkIGluIHJldmlldyBvZiB2MSwgeW91IHVw
ZGF0ZSB0aGUNCj4gY29tbWl0cyBpbiB5b3VyIGxvY2FsIGdpdCBicmFuY2gsIGFuZCB0aGVuIHlv
dSBzZW5kIG91dCB0aGUgcGF0Y2hlcyBhcyB0aGUgdjIuIHYyDQo+IHNob3VsZCBhcHBseSBjbGVh
bmx5IG9uIHRvIG1hc3RlciwgYW5kIGFsbCB0aGUgcGF0Y2hlcyBpbiBpdCBzaG91bGQgYmUgbG9n
aWNhbGx5DQo+IHNlcGFyYXRlZCBvdXQgY2hhbmdlcyAod2l0aCBubyAicGF0Y2ggMSBtYWtlcyBh
IGNoYW5nZSBhbmQgdGhlbiBwYXRjaCAyDQo+IGNoYW5nZXMgdGhlIGNvZGUgdGhhdCB3YXMgYWRk
ZWQgaW4gcGF0Y2ggMSIgZWZmZWN0cykuDQoNClRoYW5rIHlvdSBmb3IgY29tbWVudHMuDQpXZSBh
cG9sb2dpemUgZm9yIHRoZSBpbmNvbnZlbmllbmNlIGNhdXNlZCBieSBvdXIgbGFjayBvZiB1bmRl
cnN0YW5kaW5nLg0KSSB1bmRlcnN0b29kIHlvdXIgcG9pbnQuDQoNCkp1c3QgdG8gY29uZmlybSwg
DQpzaG91bGQgSSB1cGRhdGUgdG8gdjMgYW5kIHJlc3VibWl0IGl0IGFzIGEgcGF0Y2ggc2VyaWVz
IGJhc2VkIG9uIHRoZSBwb2ludHMgeW91IG1lbnRpb25lZD8NCg0KQmVzdCByZWdhcmRzLg0KDQo+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFBldGVyIE1heWRlbGwgPHBldGVy
Lm1heWRlbGxAbGluYXJvLm9yZz4NCj4gU2VudDogRnJpZGF5LCBKdWx5IDMwLCAyMDIxIDc6Mzkg
UE0NCj4gVG86IElzaGlpLCBTaHV1aWNoaXJvdS/nn7PkupUg5ZGo5LiA6YOOIDxpc2hpaS5zaHV1
aWNoaXJAZnVqaXRzdS5jb20+DQo+IENjOiBxZW11LWFybSA8cWVtdS1hcm1Abm9uZ251Lm9yZz47
IFFFTVUgRGV2ZWxvcGVycw0KPiA8cWVtdS1kZXZlbEBub25nbnUub3JnPg0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIIHYyIDAvM10gQWRkIHN1cHBvcnQgZm9yIEZ1aml0c3UgQTY0RlggcHJvY2Vzc29y
DQo+IA0KPiBPbiBGcmksIDMwIEp1bCAyMDIxIGF0IDA0OjA4LCBTaHV1aWNoaXJvdSBJc2hpaSA8
aXNoaWkuc2h1dWljaGlyQGZ1aml0c3UuY29tPg0KPiB3cm90ZToNCj4gPg0KPiA+IFRoaXMgaXMg
dGhlIHYyIHBhdGNoIHNlcmllcy4NCj4gPg0KPiA+IHYyOg0KPiA+IE5vIGZlYXR1cmVzIGhhdmUg
YmVlbiBhZGRlZCBvciByZW1vdmVkIGZyb20gdGhlIHYxIHBhdGNoIHNlcmllcy4NCj4gPiBSZW1v
dmFsIG9mIHVudXNlZCBkZWZpbml0aW9ucyB0aGF0IHdlcmUgYWRkZWQgaW4gZXhjZXNzLCBhbmQN
Cj4gPiBjb25zb2xpZGF0aW9uIG9mIHBhdGNoZXMgZm9yIHRoZSBwdXJwb3NlIG9mIGZ1bmN0aW9u
YWwgY29uc2lzdGVuY3kuDQo+ID4NCj4gPiBGb3IgcGF0Y2ggMSwgQVJNX0ZFQVRVUkVfQTY0Rlgg
aXMgbm90IHVzZWQgaW4gdGhlIHYxIHBhdGNoIHNlcmllcywgc28NCj4gPiBpdCB3YXMgZGVsZXRl
ZCB0aGlzIHRpbWUsIGFuZCB3aWxsIGJlIGFkZGVkIGFnYWluIHdoZW4gaXQgaXMgdXNlZC4NCj4g
Pg0KPiA+IEZvciBwYXRjaCAyLCBzaW5jZSB0aGUgYTY0ZnhfY3BfcmVnaW5mbyBzdHJ1Y3R1cmUg
aXMgbm90IHVzZWQgaW4gdGhlDQo+ID4gdjEgcGF0Y2ggc2VyaWVzLCBJIGRlbGV0ZWQgdGhlIGVt
cHR5IGRlZmluaXRpb24gYW5kIGFkZGVkIHRoZSBUT0RPIGluDQo+ID4gdGhlIGFhcmNoNjRfYTY0
ZnhfaW5pdGZuIGZ1bmN0aW9uLiBBbHNvIGZpeGVkIHRoZSBhcHBlYXJhbmNlLCBhbmQNCj4gPiBj
bGVhbmVkIHVwIGFuZCByZW1vdmVkIHNvbWUgdGhpbmdzIGZvciBwYXRjaCBjb25zaXN0ZW5jeS4N
Cj4gPg0KPiA+IEZvciBwYXRjaCAzLCBhNjRmeCB3YXMgYWRkZWQgdG8gZG9jcy9zeXN0ZW0vYXJt
L3ZpcnQucnN0IGFuZA0KPiA+IGh3L2FybS92aXJ0LmMgcmVzcGVjdGl2ZWx5LCBhcyBhIG1vZGlm
aWNhdGlvbiB0byB0aGUgcGF0Y2ggY29uc2lzdGVuY3kNCj4gPiBjbGVhbnVwIGRvbmUgaW4gcGF0
Y2ggMi4NCj4gDQo+IEknbSBhZnJhaWQgdGhpcyBpc24ndCB0aGUgd2F5IGEgdjIgcGF0Y2hzZXJp
ZXMgc2hvdWxkIGJlIHN0cnVjdHVyZWQuDQo+IFRoZSBpZGVhIGlzIHRoYXQgYSB2MiBzZXJpZXMg
c2hvdWxkIGJlIGNvbXBsZXRlIGluIGl0c2VsZiwgbm90IGJhc2VkIG9uIHdoYXRldmVyIHYxDQo+
IHdhcy4gU28gd2hlbiB5b3UgbWFrZSB0aGUgY2hhbmdlcyByZXF1ZXN0ZWQgaW4gcmV2aWV3IG9m
IHYxLCB5b3UgdXBkYXRlIHRoZQ0KPiBjb21taXRzIGluIHlvdXIgbG9jYWwgZ2l0IGJyYW5jaCwg
YW5kIHRoZW4geW91IHNlbmQgb3V0IHRoZSBwYXRjaGVzIGFzIHRoZSB2Mi4gdjINCj4gc2hvdWxk
IGFwcGx5IGNsZWFubHkgb24gdG8gbWFzdGVyLCBhbmQgYWxsIHRoZSBwYXRjaGVzIGluIGl0IHNo
b3VsZCBiZSBsb2dpY2FsbHkNCj4gc2VwYXJhdGVkIG91dCBjaGFuZ2VzICh3aXRoIG5vICJwYXRj
aCAxIG1ha2VzIGEgY2hhbmdlIGFuZCB0aGVuIHBhdGNoIDINCj4gY2hhbmdlcyB0aGUgY29kZSB0
aGF0IHdhcyBhZGRlZCBpbiBwYXRjaCAxIiBlZmZlY3RzKS4NCj4gDQo+IHRoYW5rcw0KPiAtLSBQ
TU0NCg==

