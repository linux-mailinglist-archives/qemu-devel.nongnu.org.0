Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 386EA3388C5
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 10:35:43 +0100 (CET)
Received: from localhost ([::1]:37278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKeCs-0001Br-93
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 04:35:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1lKcci-0002lk-Mw
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 02:54:16 -0500
Received: from esa4.fujitsucc.c3s2.iphmx.com ([68.232.151.214]:61623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1lKccg-000054-19
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 02:54:16 -0500
IronPort-SDR: lrh/l77IVASWeeMMN2IMQEXon4hEVHSOLP8P+vjeDF+VYXQo8NAKfl5woN6JC/8mOGUl9g8BmM
 jlWlUnuKFGaHijTiNfBDk6bvk6zzJqDTiZCljnYfMBWgoDcCxdOiLJXq3aPd67AJTf3E7zNB+O
 YBv2vIoXFhTjOi5xeHf/xX4+bWvzo8JdGIWl0E0pRCyMovde+NSu9YBhGUpwDz/X4CK03JsCV8
 Ooz4/yVn7HIEN9KGTCWZTRTqw5IxAr7nA+Wy1/6inSxuLRhDuU84Fs5wINpRsZOTGzWL0poULK
 mb4=
X-IronPort-AV: E=McAfee;i="6000,8403,9920"; a="35658737"
X-IronPort-AV: E=Sophos;i="5.81,242,1610377200"; d="scan'208";a="35658737"
Received: from mail-ty1jpn01lp2051.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.51])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 16:54:10 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EU7P+WViZywF5zfVhIiee0bVxl16H2bpAyfnb1/tXS8Jps7rLpvihWQruoxWEmaJEvoKcxlnRnb4KZdOwYTNrZswGrEgOeIeD9PEHzG8t98U+OLYPlWCber2zEXnd5+3GwU8uk4I7kpNbk9hmgfkHOvspDOCH1d3XhS6YVctFMLqFTCH+ILHq3DDsDUr0SrZL5BKMauBGiB7XjNFe20ArF+zK9mMpjwj+UL/THgsTN0SEeJKzyhhGf7mKJv9HFep9PzlKGsiIeC6askvo5FshYbiAwMrhoTnVxj2XRjRjNeahdxDEplbtgkvTLVXhQDRYHVTkDKJ97z/H4F44FsUiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kkue2HTYwrAnzHOuoz8YKK2Y+mCfanA+Qs4lkG2OaKs=;
 b=ZnAl1zmLa7d5x/G2NAJPeeKyxw7//lpWDc4/8bkifuZg/po/DVnHfh0T+TSFyr7peefmTw+dp6Qc528FCcglFjDCePRNUAKFLYf0BAahJdFShKOVfsiaqNdlGGruNw659pNJwlH/4traZwoi3C5zhnDE3loInv9nHOK17NUgpdrfzilgfjYMCreQlCEFMepwFxYQw7T2vKlURTBewIRX6Gb4qk9puIB077iLVFD3ZCEs96b7WXRmCMsKpRc2vMvsAaVaJ6bQ03Ak9zlMYRzT60xnbYZT63QZAg5VMq9JvWHDwHdCaOWuUz3sLCrVQ6YC1zDsn+fNWiQNE3nBW6EABA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kkue2HTYwrAnzHOuoz8YKK2Y+mCfanA+Qs4lkG2OaKs=;
 b=mxVRyNbNIrKCsV2MCMQPDkQpgL4/sFUNEkakUpz7ZjRA66IAV84h0XIQI7JuQgpiOh/YI5pUpfCyR6n5FvC9px21yQrUnJ3YVEaOVNY99x97Kfzgm5o9OXLiUMPm+/yZhUzcyaRythZTqVJps2nsO+GpCSkHdpHmqZp6pr5h0lc=
Received: from TY2PR01MB2571.jpnprd01.prod.outlook.com (2603:1096:404:6b::12)
 by TYAPR01MB5500.jpnprd01.prod.outlook.com (2603:1096:404:8037::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Fri, 12 Mar
 2021 07:54:07 +0000
Received: from TY2PR01MB2571.jpnprd01.prod.outlook.com
 ([fe80::d9a8:f990:73a0:c21a]) by TY2PR01MB2571.jpnprd01.prod.outlook.com
 ([fe80::d9a8:f990:73a0:c21a%3]) with mapi id 15.20.3933.031; Fri, 12 Mar 2021
 07:54:06 +0000
From: "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>
To: leirao <lei.rao@intel.com>, "chen.zhang@intel.com" <chen.zhang@intel.com>, 
 "jasowang@redhat.com" <jasowang@redhat.com>, "quintela@redhat.com"
 <quintela@redhat.com>, "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "lukasstraub2@web.de"
 <lukasstraub2@web.de>
Subject: Re: [PATCH v2 08/10] Reduce the PVM stop time during Checkpoint
Thread-Topic: [PATCH v2 08/10] Reduce the PVM stop time during Checkpoint
Thread-Index: AQHXFwA9tzD0g3C2L0+Np22/jdzwqKp/+7qA
Date: Fri, 12 Mar 2021 07:54:06 +0000
Message-ID: <fdcd27dd-3a11-8584-e7da-5d703de0dceb@fujitsu.com>
References: <1615525383-59071-1-git-send-email-lei.rao@intel.com>
 <1615525383-59071-9-git-send-email-lei.rao@intel.com>
In-Reply-To: <1615525383-59071-9-git-send-email-lei.rao@intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [180.96.28.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2ee92ce7-1fcb-4d64-b724-08d8e52c0352
x-ms-traffictypediagnostic: TYAPR01MB5500:
x-microsoft-antispam-prvs: <TYAPR01MB5500EAC0D61424D7A6B42EFBA56F9@TYAPR01MB5500.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hppMCDsFx1/5sg0izFc6XNnfU+p75AN5UDCy+tpi4x4LLV0o6YfsaPs5PcUV+78Hw0zZS9rgb521PEmvathPaXPTPV7w11Pz1e5z49Hd+jnUQfZ0a5cRDo145rg/WrNm8ffhTaR9g5kMcvDyyKGLSqlbemx/ZL7jAPcvIvNjMgNnbYU5rIa9lS9ng6nuM/91AaDs0AJ0zQiYW+ZvPRmjvjJ46AVq6wHYQi2fh4eTzy6qCE9MHBrRjWjSOYWLXpgGrGG+qKBONHyjjBAad60/ntoTCmHzMT0xpS21uzOq9bi1QagslAX56UMJZ0f8MlhOakrn7Ey67ZIiZFmmoQ2Y0KzHpPVMQi6skQZXQvPNJhvCg3p4qxsnLl+8jAbzMW0neX6+hSQAABdms0GZpcDw7QjSKEmnIcKqmEs6azYZAzeA7sogqPReEtOJkvxytKYSMqjGTdzJY0q4i4H5i3sNYSFwjuMoj7IubhnlOFehi58dRIbmadOHyCJC5TDojpP9xRnb2JzLictpvQnjZQMuUdH6Oq/by3YKtcKy3cONU9k3eHB5q14/WZCYbCOqbsA0PcbXsr/tu9hMeCBCfUjWkAerZTPO0R7rLh3AFqhpzn2MaZFqUpwkmgIiOoFITyPU
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR01MB2571.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(136003)(346002)(39860400002)(396003)(53546011)(85182001)(4326008)(6506007)(31696002)(71200400001)(2616005)(31686004)(110136005)(66946007)(6512007)(76116006)(8936002)(2906002)(66446008)(6486002)(64756008)(66556008)(66476007)(91956017)(36756003)(5660300002)(478600001)(316002)(8676002)(83380400001)(186003)(26005)(86362001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?gb2312?B?M1VzRVBpRWdBS1ZxdUJocWFnNjNxeC9TcGdCUTRFRVBoYkdhRXZSM1FTZUsw?=
 =?gb2312?B?czljSjFMR3lTc0k4RXF4eDByVTBMRVNNUXhyWVBtcEw1QXZ6Mlo4U2lVZ0xm?=
 =?gb2312?B?T0lDaVovZFBtS2VZZkxFSnRvRlpDYUp1cEJtV2pDNWRMZ0ZHelRhd1BiKzI2?=
 =?gb2312?B?aXEzQmZnY04ya3BaY29icWx1WE14bXZWOTNDWTBKU1Y4YVVtaGZsZDFoTUdZ?=
 =?gb2312?B?V0h3bmZoZ01NK2NabjlRQm9WMTlGZitMbE51cDRSbW9yV3pGZ3ArSE5Cd2ww?=
 =?gb2312?B?TU9KdlUyNXBSczBBUTZ3NmQ4Wmxmd0svOHd2Zjl5cy95MWI3a1JlZ3BNZkN5?=
 =?gb2312?B?UUkrSjlPbzBxMVplS3U3aEE4RjVtakg1SitxNUtDYjk3RHFZK3VmeE4vMzJp?=
 =?gb2312?B?THlYT1dqVUttS25BSitJL1dUdTQzQnZ6OWZDcE80VEhQQXJVaW5lbVh0Zzlh?=
 =?gb2312?B?N3dNSWt1OEFWYTBLdytaVXVpVlhNMCtsVjlpNUJBWkc0WFBZdjlSSFRCM296?=
 =?gb2312?B?UDhibXlqdmNieE5QRjZXY0U0ekN2RWhNR2FaWEJWaTQ4d1lIZzg3VlUrcWk0?=
 =?gb2312?B?eW9TbGNGdjBkei94ZkhSRUM3c2ozaGhVbTFPbHllMUpsSklaczNsNlJMbzMx?=
 =?gb2312?B?bmdMR2p4cEx6ZFpNaFJqa2FZMS8vRy9XVFZieEJzWjY1UmF2VTNtekpKVlpY?=
 =?gb2312?B?S3FRSlJVRS9ueFhuOTJOajZmMnVxcGY4RXM2RXN3S0g4cDd1aGRiMEFjVHhC?=
 =?gb2312?B?dEdSb0oxL0c0NnpFd3pSMzYwaW1lU2JRK2lVa3J4U3orc2lzdmM1VDR0WnVX?=
 =?gb2312?B?alkvdTB0eUZvNitDVDZVQUU4TTVkTE1jRHU1RTUrREl1Rmp0ME9LWkhLV0RF?=
 =?gb2312?B?cDlYY2dGTHRndHZvS0txaFVrTlg3MXR2TVdvM3JvRVg0SWhUUmxrZ2VyTURw?=
 =?gb2312?B?OXUxR01BalpyRVBpNVpRRW55Q3YzTStUUHAwYVkxMFlIempCRlpNcFE2NGxq?=
 =?gb2312?B?d3Rqa2lSZytvRnk0cVEyeFUxTWlNL0RZVXJiWjJSQnVnaDNVQ1UyMm9TUXFQ?=
 =?gb2312?B?c09XMkpVSDVhUzNVYndPakVMYTNlajBtMW55TlA0ZXlZNUxuK0IvYkMvVkEw?=
 =?gb2312?B?bTFuQjB2QjNtdW42Nlo5czRpQ09GQ0RjV2cySC9hWGtteW9BS3Q5bUE5M09v?=
 =?gb2312?B?amszazRVMVBoUXdEeGZOaGdkRjJ6emI2SXQ5T3RzczdlSUZxcndDTDZKRlA5?=
 =?gb2312?B?aUxjRWY4YmF2MGVvTkxIdm1DRytiaGJaUUpWZnM3NDBVdTRUQ0Vmc0VoVHVD?=
 =?gb2312?B?cFlHUndiODZNeGFyc1BqWFp4d3R6YlV4Z1Z3YlBXaXFtUkMybGk2NHZidUF1?=
 =?gb2312?B?S1kzbmRtWk9EVjI5U2NOR3RkeG9mbjd4OFVFczlWK0h4dm50eEJhb0lqVWw2?=
 =?gb2312?B?Y1VmWkEvOStwTkV5dEQ2aU4rM2o0ZWQ0Uk5pK0VONXZsbHM3SjE1cE9aNXgw?=
 =?gb2312?B?cVNub0dTOFd1THgzYmVkL0EyVldZQ2ZTaTJOL3Z5cW5tdzNLb1cvNVdxaXJl?=
 =?gb2312?B?NDgwZXoxblJBc2toMGJ5L0FrU24wck5IdTBFdmk5UE9PNlZGSVExdTRiSENE?=
 =?gb2312?B?RDQ2WG5KWkNFSFZDTnhvM3EyMVpWc1VOeHpEeXpVTEkxM0ltMGtCelE4THNz?=
 =?gb2312?B?ZnI1OFdkUnFjaXJIWW81UjZTUlphejhIazZZN3pjcW81ZTROMENWOFk4eWJr?=
 =?gb2312?Q?6yIbApu+JwJ5Mw3qTRVkRl2SDi9CK5AeSvQmLxK?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="gb2312"
Content-ID: <0284C5B5FCA0F3459B56CCB2A255CE7C@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB2571.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ee92ce7-1fcb-4d64-b724-08d8e52c0352
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2021 07:54:06.9249 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8aNzn34i3JilZEOm0lMNu3T+otKLH6X/BrpefdNiB7GQz4FMk70UeEB3pmIaOxqjFEX5AkzAMZKH4kj3IQCS3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5500
Received-SPF: pass client-ip=68.232.151.214;
 envelope-from=lizhijian@fujitsu.com; helo=esa4.fujitsucc.c3s2.iphmx.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 12 Mar 2021 04:24:47 -0500
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCk9uIDMvMTIvMjEgMTowMyBQTSwgbGVpcmFvIHdyb3RlOg0KPiBGcm9tOiAiUmFvLCBMZWki
IDxsZWkucmFvQGludGVsLmNvbT4NCj4NCj4gV2hlbiBmbHVzaGluZyBtZW1vcnkgZnJvbSByYW0g
Y2FjaGUgdG8gcmFtIGR1cmluZyBldmVyeSBjaGVja3BvaW50DQo+IG9uIHNlY29uZGFyeSBWTSwg
d2UgY2FuIGNvcHkgY29udGludW91cyBjaHVua3Mgb2YgbWVtb3J5IGluc3RlYWQgb2YNCj4gNDA5
NiBieXRlcyBwZXIgdGltZSB0byByZWR1Y2UgdGhlIHRpbWUgb2YgVk0gc3RvcCBkdXJpbmcgY2hl
Y2twb2ludC4NCj4NCj4gU2lnbmVkLW9mZi1ieTogTGVpIFJhbyA8bGVpLnJhb0BpbnRlbC5jb20+
DQo+IC0tLQ0KPiAgIG1pZ3JhdGlvbi9yYW0uYyB8IDQ0ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDQxIGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9taWdyYXRpb24vcmFtLmMgYi9t
aWdyYXRpb24vcmFtLmMNCj4gaW5kZXggZTc5NWE4ZC4uYjI2OTYzNyAxMDA2NDQNCj4gLS0tIGEv
bWlncmF0aW9uL3JhbS5jDQo+ICsrKyBiL21pZ3JhdGlvbi9yYW0uYw0KPiBAQCAtODIzLDYgKzgy
MywzOSBAQCB1bnNpZ25lZCBsb25nIG1pZ3JhdGlvbl9iaXRtYXBfZmluZF9kaXJ0eShSQU1TdGF0
ZSAqcnMsIFJBTUJsb2NrICpyYiwNCj4gICAgICAgcmV0dXJuIG5leHQ7DQo+ICAgfQ0KPiAgIA0K
PiArLyoNCj4gKyAqIGNvbG9fYml0bWFwX2ZpbmRfZGlyeTpmaW5kIGNvbnRpZ3VvdXMgZGlydHkg
cGFnZXMgZnJvbSBzdGFydA0KPiArICoNCj4gKyAqIFJldHVybnMgdGhlIHBhZ2Ugb2Zmc2V0IHdp
dGhpbiBtZW1vcnkgcmVnaW9uIG9mIHRoZSBzdGFydCBvZiB0aGUgY29udGlndW91dA0KPiArICog
ZGlydHkgcGFnZQ0KPiArICoNCj4gKyAqIEByczogY3VycmVudCBSQU0gc3RhdGUNCj4gKyAqIEBy
YjogUkFNQmxvY2sgd2hlcmUgdG8gc2VhcmNoIGZvciBkaXJ0eSBwYWdlcw0KPiArICogQHN0YXJ0
OiBwYWdlIHdoZXJlIHdlIHN0YXJ0IHRoZSBzZWFyY2gNCj4gKyAqIEBudW06IHRoZSBudW1iZXIg
b2YgY29udGlndW91cyBkaXJ0eSBwYWdlcw0KPiArICovDQo+ICtzdGF0aWMgaW5saW5lDQo+ICt1
bnNpZ25lZCBsb25nIGNvbG9fYml0bWFwX2ZpbmRfZGlydHkoUkFNU3RhdGUgKnJzLCBSQU1CbG9j
ayAqcmIsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQg
bG9uZyBzdGFydCwgdW5zaWduZWQgbG9uZyAqbnVtKQ0KPiArew0KPiArICAgIHVuc2lnbmVkIGxv
bmcgc2l6ZSA9IHJiLT51c2VkX2xlbmd0aCA+PiBUQVJHRVRfUEFHRV9CSVRTOw0KPiArICAgIHVu
c2lnbmVkIGxvbmcgKmJpdG1hcCA9IHJiLT5ibWFwOw0KPiArICAgIHVuc2lnbmVkIGxvbmcgZmly
c3QsIG5leHQ7DQo+ICsNCj4gKyAgICBpZiAocmFtYmxvY2tfaXNfaWdub3JlZChyYikpIHsNCj4g
KyAgICAgICAgcmV0dXJuIHNpemU7DQo+ICsgICAgfQ0KPiArDQo+ICsgICAgZmlyc3QgPSBmaW5k
X25leHRfYml0KGJpdG1hcCwgc2l6ZSwgc3RhcnQpOw0KPiArICAgIGlmIChmaXJzdCA+PSBzaXpl
KSB7DQo+ICsgICAgICAgIHJldHVybiBmaXJzdDsNCj4gKyAgICB9DQo+ICsgICAgbmV4dCA9IGZp
bmRfbmV4dF96ZXJvX2JpdChiaXRtYXAsIHNpemUsIGZpcnN0ICsgMSk7DQo+ICsgICAgYXNzZXJ0
KG5leHQgPj0gZmlyc3QpOw0KPiArICAgICpudW0gPSBuZXh0IC0gZmlyc3Q7DQo+ICsgICAgcmV0
dXJuIGZpcnN0Ow0KDQpUaGUgaWRlYSBpcyBvdXRzdGFuZGluZw0KDQppIHdvbmRlciBpdCBzaG91
bGQgcmV0dXJuIChuZXh0IC0gMSkgPw0KDQpUaGFua3MNClpoaWppYW4NCg0KDQo+ICt9DQo+ICsN
Cj4gICBzdGF0aWMgaW5saW5lIGJvb2wgbWlncmF0aW9uX2JpdG1hcF9jbGVhcl9kaXJ0eShSQU1T
dGF0ZSAqcnMsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgUkFNQmxvY2sgKnJiLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgcGFnZSkNCj4gQEAgLTM2NjksNiArMzcwMiw4
IEBAIHZvaWQgY29sb19mbHVzaF9yYW1fY2FjaGUodm9pZCkNCj4gICAgICAgdm9pZCAqZHN0X2hv
c3Q7DQo+ICAgICAgIHZvaWQgKnNyY19ob3N0Ow0KPiAgICAgICB1bnNpZ25lZCBsb25nIG9mZnNl
dCA9IDA7DQo+ICsgICAgdW5zaWduZWQgbG9uZyBudW0gPSAwOw0KPiArICAgIHVuc2lnbmVkIGxv
bmcgaSA9IDA7DQo+ICAgDQo+ICAgICAgIG1lbW9yeV9nbG9iYWxfZGlydHlfbG9nX3N5bmMoKTsN
Cj4gICAgICAgV0lUSF9SQ1VfUkVBRF9MT0NLX0dVQVJEKCkgew0KPiBAQCAtMzY4MiwxOSArMzcx
NywyMiBAQCB2b2lkIGNvbG9fZmx1c2hfcmFtX2NhY2hlKHZvaWQpDQo+ICAgICAgICAgICBibG9j
ayA9IFFMSVNUX0ZJUlNUX1JDVSgmcmFtX2xpc3QuYmxvY2tzKTsNCj4gICANCj4gICAgICAgICAg
IHdoaWxlIChibG9jaykgew0KPiAtICAgICAgICAgICAgb2Zmc2V0ID0gbWlncmF0aW9uX2JpdG1h
cF9maW5kX2RpcnR5KHJhbV9zdGF0ZSwgYmxvY2ssIG9mZnNldCk7DQo+ICsgICAgICAgICAgICBv
ZmZzZXQgPSBjb2xvX2JpdG1hcF9maW5kX2RpcnR5KHJhbV9zdGF0ZSwgYmxvY2ssIG9mZnNldCwg
Jm51bSk7DQo+ICAgDQo+ICAgICAgICAgICAgICAgaWYgKCgocmFtX2FkZHJfdClvZmZzZXQpIDw8
IFRBUkdFVF9QQUdFX0JJVFMNCj4gICAgICAgICAgICAgICAgICAgPj0gYmxvY2stPnVzZWRfbGVu
Z3RoKSB7DQo+ICAgICAgICAgICAgICAgICAgIG9mZnNldCA9IDA7DQo+ICsgICAgICAgICAgICAg
ICAgbnVtID0gMDsNCj4gICAgICAgICAgICAgICAgICAgYmxvY2sgPSBRTElTVF9ORVhUX1JDVShi
bG9jaywgbmV4dCk7DQo+ICAgICAgICAgICAgICAgfSBlbHNlIHsNCj4gLSAgICAgICAgICAgICAg
ICBtaWdyYXRpb25fYml0bWFwX2NsZWFyX2RpcnR5KHJhbV9zdGF0ZSwgYmxvY2ssIG9mZnNldCk7
DQo+ICsgICAgICAgICAgICAgICAgZm9yIChpID0gMDsgaSA8IG51bTsgaSsrKSB7DQo+ICsgICAg
ICAgICAgICAgICAgICAgIG1pZ3JhdGlvbl9iaXRtYXBfY2xlYXJfZGlydHkocmFtX3N0YXRlLCBi
bG9jaywgb2Zmc2V0ICsgaSk7DQo+ICsgICAgICAgICAgICAgICAgfQ0KPiAgICAgICAgICAgICAg
ICAgICBkc3RfaG9zdCA9IGJsb2NrLT5ob3N0DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICsgKCgocmFtX2FkZHJfdClvZmZzZXQpIDw8IFRBUkdFVF9QQUdFX0JJVFMpOw0KPiAgICAgICAg
ICAgICAgICAgICBzcmNfaG9zdCA9IGJsb2NrLT5jb2xvX2NhY2hlDQo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICsgKCgocmFtX2FkZHJfdClvZmZzZXQpIDw8IFRBUkdFVF9QQUdFX0JJVFMp
Ow0KPiAtICAgICAgICAgICAgICAgIG1lbWNweShkc3RfaG9zdCwgc3JjX2hvc3QsIFRBUkdFVF9Q
QUdFX1NJWkUpOw0KPiArICAgICAgICAgICAgICAgIG1lbWNweShkc3RfaG9zdCwgc3JjX2hvc3Qs
IFRBUkdFVF9QQUdFX1NJWkUgKiBudW0pOw0KPiAgICAgICAgICAgICAgIH0NCj4gICAgICAgICAg
IH0NCj4gICAgICAgfQ0K

