Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F7E33889C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 10:26:26 +0100 (CET)
Received: from localhost ([::1]:39464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKe3t-0006Wh-TL
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 04:26:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1lKbMM-0004sW-11
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 01:33:18 -0500
Received: from esa17.fujitsucc.c3s2.iphmx.com ([216.71.158.34]:18702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1lKbMF-0007hw-Ft
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 01:33:17 -0500
IronPort-SDR: MMoWMKm+P9rhxVoN/E+vmDuvJFjwvtF1/SHrxH86UAJAnnifSp5Iu3/J871EUeCV7PBl0dOXM6
 A37FJQq9FCRNAa+MAAekM3USP+Y2VIEgIevmGXB7aJufJZqr45jGYdBCCBPK4AFawaphW6zPll
 aHwiMLdnptAb7vfw+ldMkCt8cj8916ceNp3ubsyM6fVvi32wJNYu6uiyTe4AJkecmpA8yFpiIH
 VrGFDnRsaAVC4kV3PNw6Hxw/8dKwu7ylUNKsI19tmNUtqh93LWXfikb9KRLwZGzT1n+le6krC0
 awE=
X-IronPort-AV: E=McAfee;i="6000,8403,9920"; a="27595157"
X-IronPort-AV: E=Sophos;i="5.81,242,1610377200"; d="scan'208";a="27595157"
Received: from mail-ty1jpn01lp2058.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.58])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 15:32:56 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A5L3Q82jI7LycWaBWwujOeIUwo+IN9nNmiqjJeJXbU7q6kwrgAKLwsBzgSYswMamUuZ/UKXa/rtpPNI1AAn5MkwsJr0tiu+hnGnH6hkk3uQHxErT0PSc3UGcBKFbBG/wQCMEZ4dXk+Mj/ausgHL7FGXt8HxNWEuuKREnH325hf8X3ceJmH/RzNeIjEykO9yccLpJKxj/OxiY0dqk/Sh88CGAKao+t9TvzQOwKmH4lF/THctDLXHqVQp9lUPxENa7nN6UXxBRSKSwRn6nPvR7OpkvT9uaP/itV4gNFJ+Ajfa9W67tHxbec0hHtcz/2a0mEPaKXiEoyuGama+LZE5ABQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DKWp3RewHuH8FxjSBlvJXYKPN2j08jSv/iibCIcblK8=;
 b=nH1LOZxtlWT2GhPackvL+M7h/SxKLXKfUgZ93/qkiToA5FLVT0BHGoVH2aK9nUe97f83ZuWUvg9n5kwZPYvkV3CSLEPqsKKuabPJ4MT3ynqExyG80KVG5+j/3i264KAVcn435Al+TiEnx8JItEXORBp7/yv1f5IIF3IzEC6u4+VMVN0FETQ7Ns2T1xoKRX9agt4pDf43dT8howi8x/iHyiMLV2IKyO8Q7tk1Hc7lTVnWvpQYLepRW130Wj9HOOY8/OF2QHNUffFG3R35D8CbLTVIpcQCvbPCMEkfDuOJBOUmc0YCA4dLl38OfCy8X/qnZE7XiaypZLZ1jQygbkOgXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DKWp3RewHuH8FxjSBlvJXYKPN2j08jSv/iibCIcblK8=;
 b=AYjvvRFDQVv9iZVgJIo70enTBHHfPzGCsnyiXVtLsP7CiO95KBssIomDxr6Axz4ptstMRcelVgp0CmUJp9dA0oO9EbbC1IUkYLHeh4ACSbxv7C/TZPMuSi4BOBLjn/Fh6PFPhZc4ny1EUXOB1HEGVDgmzPlbh4oBuPB5bXiU7M8=
Received: from TY2PR01MB2571.jpnprd01.prod.outlook.com (2603:1096:404:6b::12)
 by TYCPR01MB5918.jpnprd01.prod.outlook.com (2603:1096:400:40::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Fri, 12 Mar
 2021 06:32:52 +0000
Received: from TY2PR01MB2571.jpnprd01.prod.outlook.com
 ([fe80::d9a8:f990:73a0:c21a]) by TY2PR01MB2571.jpnprd01.prod.outlook.com
 ([fe80::d9a8:f990:73a0:c21a%3]) with mapi id 15.20.3933.031; Fri, 12 Mar 2021
 06:32:52 +0000
From: "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>
To: leirao <lei.rao@intel.com>, "chen.zhang@intel.com" <chen.zhang@intel.com>, 
 "jasowang@redhat.com" <jasowang@redhat.com>, "quintela@redhat.com"
 <quintela@redhat.com>, "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "lukasstraub2@web.de"
 <lukasstraub2@web.de>
Subject: Re: [PATCH v2 01/10] Remove some duplicate trace code.
Thread-Topic: [PATCH v2 01/10] Remove some duplicate trace code.
Thread-Index: AQHXFwAxkYF6rAdRukCv+YRnZFe67Kp/5QYA
Date: Fri, 12 Mar 2021 06:32:52 +0000
Message-ID: <5130eb60-8b81-6d4b-bd60-c48508fa3ba5@fujitsu.com>
References: <1615525383-59071-1-git-send-email-lei.rao@intel.com>
 <1615525383-59071-2-git-send-email-lei.rao@intel.com>
In-Reply-To: <1615525383-59071-2-git-send-email-lei.rao@intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [180.96.28.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 89c8484b-84a3-4f4f-a666-08d8e520aa06
x-ms-traffictypediagnostic: TYCPR01MB5918:
x-microsoft-antispam-prvs: <TYCPR01MB59189B88903BD6D6632A2E92A56F9@TYCPR01MB5918.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aVDZ/MmEirMZHSSJYGSqUPtZGTuAYdHZEKeBScMgyFY82R9QbaIu4R9tAMuZp7/uwtMcjWh97JN4aTpDdUh2zB3TNctFb7Sj6o22SpoVsfuAoA0rb2HIR9z03VB7r22FNXOSFRkAgalxPJNIL7MxQNsnc3rxdgBJmMLz4hP4zfYJZmKvHvCuCx0yA2fzJJrLQ8lBKmd+zKO1TbfHIR9In3JGLmuhKmAfS7vbidS4rYU0BH+L7Q5UkCI2Uq/N4TRE7ejHYJTzbUd3uaor/OQE6Y9bt06rXWMwO2eWz0BRoiRQ44nrbn5HXtwl4ZnAcrvG4j8S6leM3CH5FMsHHXVp2/awd7DC/fDPwEOrWoFI9HvGmENi5Z6YGJk2tZsJOATxGbVMsyK1Y1w90ATl49zGaZoEzsKML3et7cbu3IiCHcWEfhVhwvk2oMszHwbLfGMHzIcPU2jL4Dsg2uRJq3+fKrDWaVmOAdfIsLNcp9SevAs+1N4qfg4J0RBviB1/ORyWQKFS2V2tJwqM3SzNjGMG1+NL9hOlzcYS9imon8nX2rG7Trmp3AyMAAZVLyXLmjDx
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR01MB2571.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(396003)(346002)(376002)(366004)(6486002)(71200400001)(6506007)(31696002)(86362001)(66446008)(91956017)(110136005)(5660300002)(2906002)(64756008)(66556008)(66476007)(76116006)(85182001)(83380400001)(8936002)(478600001)(31686004)(66946007)(316002)(53546011)(8676002)(2616005)(36756003)(4326008)(26005)(6512007)(186003)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?gb2312?B?bFE2UFA1NVY2djAwRTdiQjZBd1o2RGxKclhncGMwb1VQSDBnS2YvSFVwUVZu?=
 =?gb2312?B?cTdPM2l2dmZKd3g5cFJOOVJjUWRrSU5XMklJWHJXbmtVb08zOEd1cUIxTmpQ?=
 =?gb2312?B?N1BiM1M4TGVSL3YxZkMyV0oyU0FYakNGd3Zpd3RMcWNzM3FERGVhWXJ4a0g2?=
 =?gb2312?B?VWdEb3dqc25FVjNxbVozY0gwdXJ3TUFHbW96NlcvUWFjWHBjYm1pRXVoTC85?=
 =?gb2312?B?TjNSMWhTeS9jYUIxNnlNcU9NenBTYVEyQ1h3bjVSTmVXTVlja3lTeGFXR3VG?=
 =?gb2312?B?RG0rZHk5d0pvcklIMVl5NGprLzU2NGZQdE5qQXA0RWlKbnNNcUZuZXZGRFA4?=
 =?gb2312?B?U25aS09LdGZoOXJQL2l0Wjg2OG5FMUNoVk52UWV5YVg5TXNxMGlYRWN4YXBC?=
 =?gb2312?B?SHVKME84NUU4V2lwTzgxdVZ2aGJybFJLbWorQkVaUVAxaFhSSHg2U3FCck1l?=
 =?gb2312?B?a2I2M01PSHNXNDFwQ3pUOWZObnJyZk1GRUo1Qjk3b1FXYU1zZGRGRlc3SzlR?=
 =?gb2312?B?MWFCTXdsbGtPWVkrbDdPOFIvT3BGakcyaGpXYjdZWjVtWk9PKy9sMU81U2tq?=
 =?gb2312?B?Mkp3ZUJnakpFbU0vakcxMkF3aCtCc3MydUVHNStabmtCTHQ3dVYzbHFkWGlF?=
 =?gb2312?B?WmJ3UmFVMGlDQ2I1eGVQc1luRSs0WXZoVnJ2UFBpK0lQQmFMdy9yTG11YzRP?=
 =?gb2312?B?UFRjMVZXVGNqSzg1N2ZYOVZwK1FESkFPOTJmc0tYbXFvM0lRQjk3S3k1YVd5?=
 =?gb2312?B?WmlmZUFjVmhHRTFWWUQxM3BiajU3ZkVhMXIwT3JGYkk2V0xCUTRXaWNHVkVP?=
 =?gb2312?B?S1VQWUNOQ01aQnZTMzJwc3F0Z1d0amZ0OE1RZ2VJRUpCY3Q1M2hSa3J2akZU?=
 =?gb2312?B?V2dJZkVNbHhpWkpzM2JkOFVUdkxXUVlYdE1ZaDlMbGZ0V2tjTUZiaDJyak1p?=
 =?gb2312?B?SVpFd2h5V2dpdnd1WGR2NDJNRWtqRnFRUGx6SHZvaGs5MHQxYk9mdUx0NUlp?=
 =?gb2312?B?QmFWRTY3a3MvVE1MQndvRjZZc0dMUEtxRzVaSWNNSmpYaStYb3BGN2w4MTNQ?=
 =?gb2312?B?Qm5kNWgyMTI1OGhJSVZobkJDQ3dtVUlCU0N3cnFNUjF0dkdHSnhNTW96czZE?=
 =?gb2312?B?cytHNWcveG9XaGRPMFBqRkQ4VXpLWEc0UGpPNmNMeW1CN3hWOGpCVFZTT0Np?=
 =?gb2312?B?T2VpbmROWkRwdWRWcURDK3A2UkJKUEdUaHRCZXZjTUNMZy9NbmI2SWNsUm94?=
 =?gb2312?B?d25ZOUp1N0F5Z0I0bFQ0cXhuQVFqV3o4SW1DWmZnWWViN1BKb05VRUk5UWlK?=
 =?gb2312?B?dDFWWTZLS1lqSHpTVVkrd29MWVBya3JSV01yaDluTnBvcGNHY3l6dUlvbnY0?=
 =?gb2312?B?YlFPQUNNV3pKeTJpTjZoRVFHbDZ0OWJtVDNJRDBhdEpkSVZ3VG4xN0Z0STh1?=
 =?gb2312?B?R0ZUR3d1WWtsNTJEdXpwQ0EyTXh3MmdKT2FiejRxZzRVKzFWNVpuR0w4dFBm?=
 =?gb2312?B?OTdoUDZyMnJEMlpJelhrVjBWMFZBQ2Z1OG5nQlVUckVrOFo5YU5Zc080eGZp?=
 =?gb2312?B?ajdKY1RuMVlSbnBqRXVRWkhkYXBLZGREM0VTNnpNNDh1SmFBcWNZTXBOL3Rr?=
 =?gb2312?B?MzRTVkppTktxKzJNbElKblgrNFBXcklWbUlwekxmOFhaRXMxQ3BmcTRhU0R4?=
 =?gb2312?B?d2ppRUd2OTRMZXFzNEVCdFFGSVFlNnVKLzZZL09aV3orbWM0aERXYmNqZkcr?=
 =?gb2312?Q?mOws6/Md0HK+1Ikypz6qh8Y50+3TvDnfnHfAwxf?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="gb2312"
Content-ID: <939A8EC24507A24F8DB2B7C182D91362@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB2571.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89c8484b-84a3-4f4f-a666-08d8e520aa06
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2021 06:32:52.5982 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R5V0kb/4TFMIreJwwfaxozPshraQDheOlXhzZhlbtY/9dTe2lCLbiPXHpWCfltn3mVpkkgCeoqZ/trKEpdpe9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5918
Received-SPF: pass client-ip=216.71.158.34; envelope-from=lizhijian@fujitsu.com;
 helo=esa17.fujitsucc.c3s2.iphmx.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 12 Mar 2021 04:24:40 -0500
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

DQoNCk9uIDMvMTIvMjEgMTowMiBQTSwgbGVpcmFvIHdyb3RlOg0KPiBGcm9tOiAiUmFvLCBMZWki
IDxsZWkucmFvQGludGVsLmNvbT4NCj4NCj4gVGhlcmUgaXMgdGhlIHNhbWUgdHJhY2UgY29kZSBp
biB0aGUgY29sb19jb21wYXJlX3BhY2tldF9wYXlsb2FkLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBM
ZWkgUmFvIDxsZWkucmFvQGludGVsLmNvbT4NClJldmlld2VkLWJ5OiBMaSBaaGlqaWFuIDxsaXpo
aWppYW5AZnVqaXRzdS5jb20+DQoNCj4gLS0tDQo+ICAgbmV0L2NvbG8tY29tcGFyZS5jIHwgMTMg
LS0tLS0tLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMyBkZWxldGlvbnMoLSkNCj4NCj4g
ZGlmZiAtLWdpdCBhL25ldC9jb2xvLWNvbXBhcmUuYyBiL25ldC9jb2xvLWNvbXBhcmUuYw0KPiBp
bmRleCA4NGRiNDk3Li45ZTE4YmFhIDEwMDY0NA0KPiAtLS0gYS9uZXQvY29sby1jb21wYXJlLmMN
Cj4gKysrIGIvbmV0L2NvbG8tY29tcGFyZS5jDQo+IEBAIC01OTAsMTkgKzU5MCw2IEBAIHN0YXRp
YyBpbnQgY29sb19wYWNrZXRfY29tcGFyZV9vdGhlcihQYWNrZXQgKnNwa3QsIFBhY2tldCAqcHBr
dCkNCj4gICAgICAgdWludDE2X3Qgb2Zmc2V0ID0gcHBrdC0+dm5ldF9oZHJfbGVuOw0KPiAgIA0K
PiAgICAgICB0cmFjZV9jb2xvX2NvbXBhcmVfbWFpbigiY29tcGFyZSBvdGhlciIpOw0KPiAtICAg
IGlmICh0cmFjZV9ldmVudF9nZXRfc3RhdGVfYmFja2VuZHMoVFJBQ0VfQ09MT19DT01QQVJFX0lQ
X0lORk8pKSB7DQo+IC0gICAgICAgIGNoYXIgcHJpX2lwX3NyY1syMF0sIHByaV9pcF9kc3RbMjBd
LCBzZWNfaXBfc3JjWzIwXSwgc2VjX2lwX2RzdFsyMF07DQo+IC0NCj4gLSAgICAgICAgc3RyY3B5
KHByaV9pcF9zcmMsIGluZXRfbnRvYShwcGt0LT5pcC0+aXBfc3JjKSk7DQo+IC0gICAgICAgIHN0
cmNweShwcmlfaXBfZHN0LCBpbmV0X250b2EocHBrdC0+aXAtPmlwX2RzdCkpOw0KPiAtICAgICAg
ICBzdHJjcHkoc2VjX2lwX3NyYywgaW5ldF9udG9hKHNwa3QtPmlwLT5pcF9zcmMpKTsNCj4gLSAg
ICAgICAgc3RyY3B5KHNlY19pcF9kc3QsIGluZXRfbnRvYShzcGt0LT5pcC0+aXBfZHN0KSk7DQo+
IC0NCj4gLSAgICAgICAgdHJhY2VfY29sb19jb21wYXJlX2lwX2luZm8ocHBrdC0+c2l6ZSwgcHJp
X2lwX3NyYywNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcHJpX2lwX2Rz
dCwgc3BrdC0+c2l6ZSwNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2Vj
X2lwX3NyYywgc2VjX2lwX2RzdCk7DQo+IC0gICAgfQ0KPiAtDQo+ICAgICAgIGlmIChwcGt0LT5z
aXplICE9IHNwa3QtPnNpemUpIHsNCj4gICAgICAgICAgIHRyYWNlX2NvbG9fY29tcGFyZV9tYWlu
KCJPdGhlcjogcGF5bG9hZCBzaXplIG9mIHBhY2tldHMgYXJlIGRpZmZlcmVudCIpOw0KPiAgICAg
ICAgICAgcmV0dXJuIC0xOw0K

