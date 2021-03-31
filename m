Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B3034F83C
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 07:20:44 +0200 (CEST)
Received: from localhost ([::1]:38636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRTHT-0006O9-An
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 01:20:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tina.zhang@intel.com>)
 id 1lRTFW-0005PC-Sh
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 01:18:38 -0400
Received: from mga05.intel.com ([192.55.52.43]:58555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tina.zhang@intel.com>)
 id 1lRTFT-0002ON-I2
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 01:18:38 -0400
IronPort-SDR: awdvS9zMVQA1it6iJeuiLzqVZjJp6gl3l4xMPYWB6QTsXO4WAApRj8Y/+0hPB0fLCTTAmdeakM
 Zat8MNQSaRpQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9939"; a="277098642"
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; d="scan'208";a="277098642"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2021 22:18:27 -0700
IronPort-SDR: fkxkTF7pHSEXdAmYPjuOQ24z63gJp/bzSIaWcUn9jHsbENteRk34DFiQRVMCobbXhgTwVArUj+
 /4sDuQVzF2fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; d="scan'208";a="610354022"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 30 Mar 2021 22:18:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 30 Mar 2021 22:18:27 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 30 Mar 2021 22:18:27 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Tue, 30 Mar 2021 22:18:26 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Tue, 30 Mar 2021 22:18:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=biAuS42MTT6OFh/W5rq06CVY1iBqPcbe7dPQrjbvjnNxbU9F9y+Az4/atGvSSvGflEmXX9FzOuf6F9rk8CpcAcHCVNQNB979kBbbVoVqpaX6NnHj3DEhbOlfu7Usd5Zz+8RYWV2N4H9qqzCvgWeZ4JPV2baxGq69uuQmRxtIalbryg1HXauP1Dq6yiRCT1WzXFkRxV6K8ZykamIa+wYbEUH0Fkl4Jt5VUkgyA9dN9YjZAnua9N86buQtpR/5LxLtA4HXJUaspewnL0I5oUN81nt9xJCjCItceoXYGfGHhU64ZPU0B8xMjRMEsik3phT5ohN2e85/I4RcpZQkjHz1eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u1XgTJJjOw726PeQ+8Si+eEDzwa5MA6p9GYFDN7yST4=;
 b=i3xrFUl0v6vlippHdEHmaRbFwyVDEsx60pW6tPZlZzWh3h0cNC4YzbsetYePfIge5DU7pSPHUcipHQJwUIOzW1oKBDTgxbIQMZeij514r9kydozn/9Mn+zaO32FwEJnIlMX7GS4/7INN/zKtXli5856u8b6VeF9DJYLCNMQU16Y+T2dizI4K5oiCPrCgrSOD5Pawj+OwBjPPcQ0l1oGdiW3C73PB1766y9ecA2O86zoFMIKKzG48YO0T2jcs/UOfDymIW+8keOyyjvnBTixmufFx0ZoBHtk1IdhfBSHikBvNlLCRlN6I1RTK8+e2mTEuddO4viiN+tZsCgXCJyIXLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u1XgTJJjOw726PeQ+8Si+eEDzwa5MA6p9GYFDN7yST4=;
 b=Zx4nsgKS6V0nzQEHhbkXl93Y1EhsdrIywXpist3gy9B9ejfLchWwFAFORpxVbHvaMrz6GdAfjMsfeW0HNuEiV1g9/VBzzbe8yoPgEbARVZwnUq3E3rdBD34CF82p2W07g8CzY6vSupjs80LrhB4/+9FowUJXxYoUZE8RZ/p3dBY=
Received: from BN7PR11MB2786.namprd11.prod.outlook.com (2603:10b6:406:b3::27)
 by BN8PR11MB3588.namprd11.prod.outlook.com (2603:10b6:408:83::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.31; Wed, 31 Mar
 2021 05:18:23 +0000
Received: from BN7PR11MB2786.namprd11.prod.outlook.com
 ([fe80::167:12a:8fe3:6c10]) by BN7PR11MB2786.namprd11.prod.outlook.com
 ([fe80::167:12a:8fe3:6c10%2]) with mapi id 15.20.3977.033; Wed, 31 Mar 2021
 05:18:23 +0000
From: "Zhang, Tina" <tina.zhang@intel.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Subject: RE: [PATCH 00/11] Add support for Blob resources feature
Thread-Topic: [PATCH 00/11] Add support for Blob resources feature
Thread-Index: AQHXJdz4hfgbCAUhNk6pdP0e9c2wgaqdjEjw
Date: Wed, 31 Mar 2021 05:18:22 +0000
Message-ID: <BN7PR11MB2786AC3829F7AF4207350D45897C9@BN7PR11MB2786.namprd11.prod.outlook.com>
References: <20210331031001.1564125-1-vivek.kasireddy@intel.com>
In-Reply-To: <20210331031001.1564125-1-vivek.kasireddy@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.192]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 25b34a0b-e69c-44c1-8e93-08d8f40467ba
x-ms-traffictypediagnostic: BN8PR11MB3588:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR11MB3588A6859A06ABB42C13E973897C9@BN8PR11MB3588.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1247;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vuZLwsrn8jADva0lcHrvFAZZjZrbpKoVvEXD1hYIAlhFom8r5qznpbWjosa35/G/NM1Va75cM09DWpIk9j1Z43B5XvrbbeGkRRHfHS7B5YAO9HE6oaxPGI2Z4t7Cj338eOU+UBADPu6LE/Z257N3tSOujIlV06XNT7MlrGaYR7YuSyIxf2bYIKKJmgQn9erSvlRGph5SsygcuyVAK4cyFF0JFkCgddi2RcrWnfHMY6f0ytBSddTdJUHJ2e2LRjsl9UGFXei6EUx3+PMSQdtuG5gRoELpQI65SL8G6/r+pvofxTic596rCZMNElqEDTo3gzUenPWatEnGUI0DnM2EWDD8o7X+Vo2hXRvz5XXViwRP9zxRH70uUgc/Etcr6mBFVXHzLgW1R4/9YxgbZmhigzQOr0I32MUv52IzI+XwDoQE9c9R1YUb0s6wI4IqTCnASUjh5eDvsSsRdYV70H57rAnJ0DRxwy0vqTcqcSj4FnmWB1nZAlJ+CcssZb386Pcm02DnPzaGlYTSGSwDqHsUHrEZrtI/ux5tcFyC44eXi73fQ585F3zCh1gbwev7siIG4LM0p4Q1qCLl+/L+jDarmydReoBYKczJl4ruhLADKx3NjWyOePf+D1UdLUMZwtxYdscsuNbPGGaOv6sD7m5mfom48BAcuXuYxq3uJ3+1TGILrGe5BCGdqKALuRxddLjTGAUQIbIlz9XwbypytrzmcQ7dClXiQrJLn7aVRA0dYI4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR11MB2786.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39860400002)(396003)(136003)(376002)(346002)(478600001)(186003)(5660300002)(86362001)(2906002)(71200400001)(8676002)(316002)(55016002)(66946007)(52536014)(66446008)(66556008)(76116006)(26005)(9686003)(64756008)(83380400001)(66476007)(8936002)(7696005)(33656002)(110136005)(107886003)(53546011)(4326008)(38100700001)(54906003)(966005)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?MXF5MGFPUERNSzF2L0huNnJsTlFRVnpjK091NGpKdGE0dW1yRXFxMXV2ZnNY?=
 =?utf-8?B?bEdaaVdkK2ZqZEt4VjhEWWNBVFJmcTBhbWtlNkZkeU5XRWVaZzhnamFVeGJq?=
 =?utf-8?B?OU11R0NKWjlrNmVrTm1hQi8xa2E2UXpxMDBqU1N6d3lsZDZRZmlhOUg4Z0FJ?=
 =?utf-8?B?aUVKZHVFMXU2N0RmOGNFOVdUc0RrRnlzTzVLVnYyVU43RkR1b3pFTE5EcjNW?=
 =?utf-8?B?cTdxT3JjeWFHVUJIVmlValA2emlKdjE3V3RaZ3REREdXRjdNWk8rSGxqTEFK?=
 =?utf-8?B?QXFUYktuUXlzQ3RzMFBGRUlsWmh6am93TXRod3haR2lzampEeTZIUDRlQWxZ?=
 =?utf-8?B?eHBvYk01aEEycWYzYmhITDdwbmN5L29hUHE5TnI5OUZsU2d6Z1Q4Rm0wemdT?=
 =?utf-8?B?NnVac2FqemxDSitPVnBZSlpYR0hmbUcwWDBNdjNmSWdCeFNDUmNzRko2ZXV1?=
 =?utf-8?B?NnI2YUxhV1k4UWxtTjB6cVZqdjlqWlRBS3NRLzdrRXI2UFBvWWdhNWZ3ekIz?=
 =?utf-8?B?YjhVYWZLd2h3bG1uWm91ejhyT1k4OXppVkw2MVpUUlhjL1A2VkkzQnA2MFFF?=
 =?utf-8?B?QzhRUGZ5dHkxMUNhMm1abXY1TllReDJ1ODJqQ1g3N3pPcmt2Y0I2WmZmRHI1?=
 =?utf-8?B?Q25FMy9YMFZHU1JTOVdrQ1VuUXI2SXhTdlVNbFpvS3BOL05wUjRsRDg5b3VP?=
 =?utf-8?B?ODQxS01zSHFFOWtyVWc0alBCRzJ6bHZGYWQ3YVpLeHdOaElJeU9pcWVSeDQ0?=
 =?utf-8?B?bHF4eDlEU1lkQWpYbUppcDVXRzZKbS9lTEgvUmxlWFUwNnNHblhFemkxS095?=
 =?utf-8?B?QzM5ZStNUld2QTFSZ1FHRUNaSTIxblhOamllS2dGaE52NjVUQSsvUDJWSTNF?=
 =?utf-8?B?dDNwNzhpNXFRNGNGYmFST1A3MjhSUFcrZnNWaXVWUjRDNDlaUzZrL3ROSzNV?=
 =?utf-8?B?Rld6TzdMbXhWU0oxYnRvL3U5U2w2M3lVNnZRZ09Rb3RyTGxXaUxxN1RnMjV4?=
 =?utf-8?B?Y25JMjhWOVVjUUJ1S3k0SzAzd2JyR0s1L0ZKYS94YkJxdDMzREEwdFhIeTFT?=
 =?utf-8?B?a0duS1FxK3IzUnFxYnQ1MFFPZmhyZEJiQjkwT1J6VVZCTXdxVkYzOXkrNUxa?=
 =?utf-8?B?Ui9pcGd2R2NLMk92RCtmNk1aOE12VHBMLysrZ3FpVEVHZzByWUUwNzRsT0dZ?=
 =?utf-8?B?Y2hBTkYzMEJHeWtoeHFaeTFBNm9LWkUxREtFMThleXpHdktCSjZ6TUlVaGs0?=
 =?utf-8?B?dDU4b2lQR1hJNmtsSEZ6Z3U0Z1Rlc2JldlYvYmd2VjVLNDNGcEZ1M3R1c0Qx?=
 =?utf-8?B?VXVaTyt0bEl4UzlqRnNVT0lrbklrNHdZQ0ZkOE5qT0VjMnEyT1JMbkdwTkE4?=
 =?utf-8?B?TERxeHZNQWVGR1owRFJqam1pZDZCdmdJZkRkSnNzTDRRWThvdVk0eHlYYnUz?=
 =?utf-8?B?V2FtQW90Y0lKOUYyL0JaalhxTmd0cFhPUDAzTjg3QjA5SHUzZEpOWHRpYXBw?=
 =?utf-8?B?aENjOTIyQ1lqamljR2JZVk5QZGlnTEp1ckdWbXZ4SXowVmlxMzJuNTlzWGdZ?=
 =?utf-8?B?LzVvSmV3MjdsTjlJYWRKSWRTR1RmU1lHVlBJYjI1NURyZEQzMGJUSkVnNnZi?=
 =?utf-8?B?aUZueGJUWlZyNUd6dStGRWQzcVRLaXgrQ1dvNUJvZERXSlFCNkRlek9pMkh3?=
 =?utf-8?B?MEhvclYzUXl2WlJ4bzJGanZxS0tzZWVNVzMxTlV3bXptWHFsUnM1aWduNVpj?=
 =?utf-8?Q?P6wo2E8vJ7cP1yy3BvcgYq1RgEkkAmCrpDLJmU5?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR11MB2786.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25b34a0b-e69c-44c1-8e93-08d8f40467ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2021 05:18:22.8262 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gcPb5nqNdQdHupeIS+q5MlH32GaC8S8wm58ISXdczxMbClTXXYh19CEGlWf87+t4DMz1cZq1LKiDcsJ3uaMSdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3588
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.43; envelope-from=tina.zhang@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, "Kim, 
 Dongwon" <dongwon.kim@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGkgR2VyZCwNCg0KU2luY2UgdGhlIHVkbWFidWYgYW5kIGJsb2Igc3VwcG9ydHMgYXJlIG9uIHRo
ZWlyIHdheSwgY2FuIHdlIHJlY29uc2lkZXIgdGhlIGRpc3BsYXktZHJtIHVpIHN1cHBvcnQgd2hp
Y2ggd2FzIGxpc3QgaW4gaHR0cHM6Ly9naXQua3JheGVsLm9yZy9jZ2l0L3FlbXUvcmVmcy9oZWFk
cyBhcyBhIGJyYW5jaCBiZWZvcmUuDQoNCkkgZGlkIHNvbWUgcmViYXNpbmcgd29yayBhbmQgY2Fu
IGhlbHAgdG8gc2VuZCB0aGVtIG91dCBmb3IgcmV2aWV3IGlmIHBvc3NpYmxlLg0KDQpCUiwNClRp
bmENCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLYXNpcmVkZHksIFZp
dmVrIDx2aXZlay5rYXNpcmVkZHlAaW50ZWwuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIE1hcmNo
IDMxLCAyMDIxIDExOjEwIEFNDQo+IFRvOiBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4gQ2M6IEth
c2lyZWRkeSwgVml2ZWsgPHZpdmVrLmthc2lyZWRkeUBpbnRlbC5jb20+OyBHZXJkIEhvZmZtYW5u
DQo+IDxrcmF4ZWxAcmVkaGF0LmNvbT47IE1hcmMtQW5kcsOpIEx1cmVhdQ0KPiA8bWFyY2FuZHJl
Lmx1cmVhdUByZWRoYXQuY29tPjsgS2ltLCBEb25nd29uDQo+IDxkb25nd29uLmtpbUBpbnRlbC5j
b20+OyBaaGFuZywgVGluYSA8dGluYS56aGFuZ0BpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRD
SCAwMC8xMV0gQWRkIHN1cHBvcnQgZm9yIEJsb2IgcmVzb3VyY2VzIGZlYXR1cmUNCj4gDQo+IEVu
YWJsaW5nIHRoaXMgZmVhdHVyZSB3b3VsZCBlbGltaW5hdGUgZGF0YSBjb3BpZXMgZnJvbSB0aGUg
cmVzb3VyY2Ugb2JqZWN0IGluDQo+IHRoZSBHdWVzdCB0byB0aGUgc2hhZG93IHJlc291cmNlIGlu
IFFlbXUuIFRoaXMgcGF0Y2ggc2VyaWVzIGhvd2V2ZXIgYWRkcw0KPiBzdXBwb3J0IG9ubHkgZm9y
IEJsb2JzIG9mIHR5cGUgVklSVElPX0dQVV9CTE9CX01FTV9HVUVTVCB3aXRoDQo+IHByb3BlcnR5
IFZJUlRJT19HUFVfQkxPQl9GTEFHX1VTRV9TSEFSRUFCTEUuDQo+IA0KPiBNb3N0IG9mIHRoZSBw
YXRjaGVzIGluIHRoaXMgc2VyaWVzIGFyZSBhIHJlYmFzZWQsIHJlZmFjdG9yZWQgYW5kIGJ1Z2Zp
eGVkDQo+IHZlcnNpb25zIG9mIEdlcmQgSG9mZm1hbm4ncyBwYXRjaGVzIGxvY2F0ZWQgaGVyZToN
Cj4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3ZpcmdsL3FlbXUvLS9jb21taXRzL3Zp
cnRpby1ncHUtbmV4dA0KPiANCj4gVE9ETzoNCj4gLSBFbmFibGUgdGhlIGNvbWJpbmF0aW9uIHZp
cmdsICsgYmxvYiByZXNvdXJjZXMNCj4gLSBBZGQgc3VwcG9ydCBmb3IgVklSVEdQVV9CTE9CX01F
TV9IT1NUM0QgYmxvYnMNCj4gDQo+IENjOiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNv
bT4NCj4gQ2M6IE1hcmMtQW5kcsOpIEx1cmVhdSA8bWFyY2FuZHJlLmx1cmVhdUByZWRoYXQuY29t
Pg0KPiBDYzogRG9uZ3dvbiBLaW0gPGRvbmd3b24ua2ltQGludGVsLmNvbT4NCj4gQ2M6IFRpbmEg
WmhhbmcgPHRpbmEuemhhbmdAaW50ZWwuY29tPg0KPiANCj4gVml2ZWsgS2FzaXJlZGR5ICgxMSk6
DQo+ICAgdWk6IEdldCB0aGUgZmQgYXNzb2NpYXRlZCB3aXRoIHVkbWFidWYgZHJpdmVyDQo+ICAg
dWkvcGl4bWFuOiBBZGQgcWVtdV9waXhtYW5fdG9fZHJtX2Zvcm1hdCgpDQo+ICAgdmlydGlvLWdw
dTogQWRkIHVkbWFidWYgaGVscGVycw0KPiAgIHZpcnRpby1ncHU6IEFkZCB2aXJ0aW9fZ3B1X2Zp
bmRfY2hlY2tfcmVzb3VyY2UNCj4gICB2aXJ0aW8tZ3B1OiBSZWZhY3RvciB2aXJ0aW9fZ3B1X3Nl
dF9zY2Fub3V0DQo+ICAgdmlydGlvLWdwdTogUmVmYWN0b3IgdmlydGlvX2dwdV9jcmVhdGVfbWFw
cGluZ19pb3YNCj4gICB2aXJ0aW8tZ3B1OiBBZGQgaW5pdGlhbCBkZWZpbml0aW9ucyBmb3IgYmxv
YiByZXNvdXJjZXMNCj4gICB2aXJ0aW8tZ3B1OiBBZGQgdmlydGlvX2dwdV9yZXNvdXJjZV9jcmVh
dGVfYmxvYg0KPiAgIHZpcnRpby1ncHU6IEFkZCBoZWxwZXJzIHRvIGNyZWF0ZSBhbmQgZGVzdHJv
eSBkbWFidWYgb2JqZWN0cw0KPiAgIHZpcnRpby1ncHU6IEFkZCB2aXJ0aW9fZ3B1X3NldF9zY2Fu
b3V0X2Jsb2INCj4gICB2aXJ0aW8tZ3B1OiBVcGRhdGUgY3Vyc29yIGRhdGEgdXNpbmcgYmxvYg0K
PiANCj4gIGh3L2Rpc3BsYXkvbWVzb24uYnVpbGQgICAgICAgICAgICAgICAgICAgICAgfCAgIDIg
Ky0NCj4gIGh3L2Rpc3BsYXkvdHJhY2UtZXZlbnRzICAgICAgICAgICAgICAgICAgICAgfCAgIDIg
Kw0KPiAgaHcvZGlzcGxheS92aXJ0aW8tZ3B1LTNkLmMgICAgICAgICAgICAgICAgICB8ICAgMyAr
LQ0KPiAgaHcvZGlzcGxheS92aXJ0aW8tZ3B1LWJhc2UuYyAgICAgICAgICAgICAgICB8ICAgMyAr
DQo+ICBody9kaXNwbGF5L3ZpcnRpby1ncHUtdWRtYWJ1Zi5jICAgICAgICAgICAgIHwgMjc2ICsr
KysrKysrKysrKysNCj4gIGh3L2Rpc3BsYXkvdmlydGlvLWdwdS5jICAgICAgICAgICAgICAgICAg
ICAgfCA0MjMgKysrKysrKysrKysrKysrLS0tLS0NCj4gIGluY2x1ZGUvaHcvdmlydGlvL3ZpcnRp
by1ncHUtYnN3YXAuaCAgICAgICAgfCAgMTYgKw0KPiAgaW5jbHVkZS9ody92aXJ0aW8vdmlydGlv
LWdwdS5oICAgICAgICAgICAgICB8ICA0MSArLQ0KPiAgaW5jbHVkZS9zdGFuZGFyZC1oZWFkZXJz
L2xpbnV4L3VkbWFidWYuaCAgICB8ICAzMiArKw0KPiAgaW5jbHVkZS9zdGFuZGFyZC1oZWFkZXJz
L2xpbnV4L3ZpcnRpb19ncHUuaCB8ICAgMSArDQo+ICBpbmNsdWRlL3VpL2NvbnNvbGUuaCAgICAg
ICAgICAgICAgICAgICAgICAgIHwgICAzICsNCj4gIGluY2x1ZGUvdWkvcWVtdS1waXhtYW4uaCAg
ICAgICAgICAgICAgICAgICAgfCAgIDEgKw0KPiAgc2NyaXB0cy91cGRhdGUtbGludXgtaGVhZGVy
cy5zaCAgICAgICAgICAgICB8ICAgMyArDQo+ICB1aS9tZXNvbi5idWlsZCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgICAxICsNCj4gIHVpL3FlbXUtcGl4bWFuLmMgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgMzUgKy0NCj4gIHVpL3VkbWFidWYuYyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgNDAgKysNCj4gIDE2IGZpbGVzIGNoYW5nZWQsIDc3MiBpbnNlcnRp
b25zKCspLCAxMTAgZGVsZXRpb25zKC0pICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gaHcvZGlzcGxh
eS92aXJ0aW8tZ3B1LXVkbWFidWYuYyAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvc3RhbmRh
cmQtDQo+IGhlYWRlcnMvbGludXgvdWRtYWJ1Zi5oDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgdWkv
dWRtYWJ1Zi5jDQo+IA0KPiAtLQ0KPiAyLjI2LjINCg0K

