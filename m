Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD663C5DC3
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 15:51:31 +0200 (CEST)
Received: from localhost ([::1]:58490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2wLK-0000Sc-D9
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 09:51:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1m2wCu-0006Xg-Pb
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 09:42:48 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:9244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1m2wCs-0002Kd-9Z
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 09:42:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1626097366; x=1626702166;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version:subject;
 bh=H7HtTkC5lp42ckLcbSuAH6EIuWlXxuWE/GJvvTtN478=;
 b=Rf2DNfh3WOf2V61icfCR1N9sSxH2bc0Ke6xvxawcBMrV07Et3FKBO/W9
 uUeZRwfFVOQCwj4X0wCvXiPDxJWDwzQwvXXLtUFeUA3OZCBoHH6edF+Rl
 U72T8B/5H9vkpBla13XRlGnC5DFDkYu/YtYLMPJndR+LLf9AXTij9IGqh E=;
IronPort-SDR: Rz/r+darMuFJHXmdVYUaMOkA9ryfA4r8sMNF9t1Um5w+K9JMUSevy1oLM8134jkYCaUtBCbTYc
 SzsWiPPYjt3U+6/EGsi0hV47U6Fa2JQnGZT72Mw/yaJS26pIwHtc5XppsGqQtfzWZcuYK3ujG6
 GxXyy+2nQhkmoXf5maSZX0hI2yVBImTn3/uhmK1CljJIK/ZfBEylaqS+4IcNwPb48kyW5j1Bhr
 w7/+CDpBAQWzYOf9WQimsYJCffxSNSbqoHwnGSlvoZncOKdUVOVE69Iqd0kqgXVbbAGKrO4VCL
 kc4=
Subject: RE: [PATCH 01/20] Hexagon HVX (target/hexagon) README
Thread-Topic: Re: [PATCH 01/20] Hexagon HVX (target/hexagon) README
Received: from mail-dm3nam07lp2041.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.41])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 13:42:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xwlj3Zat1W2abxnKkj8+Gk+c+YGIrbiORdyIRnl9dMLkMfVxII10dAUak4FzAZuehZlVZu20wd8sGf95irQwZ6FJwse52DoI7WLwWRh0K/6MDdRQ9+na6hBaWRsT42cXrXVH0EK+Y++zNj4Vmq7EuEkFWmbboaovznrsWuKWrap0SNT7PRkArPng7DcNEojI6Olrk9praH3RKi/7L3KGBd5IsbI3++V+meWZ09pDt9GmDyELDF7D3c+gR7q7jIVAEOtpGyQYRwcZDIXHrtyKTQ286tIMQ8Ni88KJNPBRwla0GrENEcyZr9o8lFlZ8MkLfZU8bRgw4zSDp7BZ1xksIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H7HtTkC5lp42ckLcbSuAH6EIuWlXxuWE/GJvvTtN478=;
 b=UOahv69mwF3sgbnvHzXqGM7IQ4RMxu3gY6JgFsNWQlPohYT3xyl+QEVIDNTRAU9ZrDxCOeCTALlKDxtjOQR1+agBjOGY7C+sBdfB6NjoG9mpV75OOXzkcQGXWv3qCzS0RQyV2h1yTOGb38FqvhR3+gN1f+nhc5tVn9a+v2a3or+BAbgpsVfIwv4Qg1oUyFgVyGE/0gBsz8XLff22lPVNosv1nw/6+ykaEyvJ88pQ8Ap/y2267zvv3NHAGpRGd4hrGlA4i/MsytuTR4oo2yISvsiQlB0oxoOOCim9Fbwc9M+LFIeklHkTdc6us/tW0dsyNzPrG+E6N6Arw+5x4EDNaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN6PR02MB4205.namprd02.prod.outlook.com (2603:10b6:805:35::17)
 by SN6PR02MB5456.namprd02.prod.outlook.com (2603:10b6:805:e7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19; Mon, 12 Jul
 2021 13:42:40 +0000
Received: from SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::1d9e:c48b:294b:4975]) by SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::1d9e:c48b:294b:4975%7]) with mapi id 15.20.4308.026; Mon, 12 Jul 2021
 13:42:40 +0000
From: Brian Cain <bcain@quicinc.com>
To: Rob Landley <rob@landley.net>, Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Thread-Index: AQHXcfZVkb0B/5pb+Eqj5OkTVloPfqs/CH+AgABZW3A=
Date: Mon, 12 Jul 2021 13:42:40 +0000
Message-ID: <SN6PR02MB42054B50C60ABA378256492DB8159@SN6PR02MB4205.namprd02.prod.outlook.com>
References: <1625528074-19440-1-git-send-email-tsimpson@quicinc.com>
 <1625528074-19440-2-git-send-email-tsimpson@quicinc.com>
 <1b632e88-43d4-3034-cf7b-d42be056d842@landley.net>
In-Reply-To: <1b632e88-43d4-3034-cf7b-d42be056d842@landley.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: landley.net; dkim=none (message not signed)
 header.d=none;landley.net; dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 225eb14d-57d1-4f72-0a78-08d9453aeb0a
x-ms-traffictypediagnostic: SN6PR02MB5456:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR02MB545699EFF85118687EF2E47DB8159@SN6PR02MB5456.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4Em1v0BEgdtpsPSUranZ5isrrIp/ITiHDWdkWsmnKW7ifFBv3Bx0V5d3hxG8o6lYDSjddm96N7IFBCSYl7dtfqyrCD/1PUarK9F5vzSyTtrIwf9O+H/O6J206VAQttzNWN7dNcwV+PftC74v3Dc3hliQMAh6ZIOL4uIUfDYsAPnJrQ2Unlsoaw2b7gj2ezP2cWpPCpmACgLaAYOFXhaJG2rIveSmeCxtC5fESU2Ps2lggcsrQwx1U/L+PJoUV1ximb5DlGuQtLcQeVQjAvEtGoi2T3uPgXgwWefLD/vMq991TNEZoVOtyxjegn03Nqc2p42rS37rXNhle/CibVg8d84sZGaBiEiH2NqHvQI+ZEp+RMw2Hf5mq4CvCiVXcFM00X2D8j4RuInXGgQF9kd4VJMjuJuX2dsjZeH+0ItMAIdj+Ev90I2PIOhPzoWPgAxzNHe0B4JZ9VNURlLjhaA02TEboJiRGHFojIhL1de21KQF+SWyoL3TcBa0BxlqyPn72IMTUcKdojfuaQM81Javh6t/N+0m+wNn2fT9scLeSCv/RiwuCGHQ6vkdO1YJcU/pJUbM7Tbyl2k+EY+fgAP0cVp+ZVrEzZEC0c1Q48QDz4tlOG0UZz3aIr6c2kHZTsXkzlMtjjVXA28N3Mf6umlezWlMiO62ZFlz88WLd6i/7+uIHDDgEU2PxtvcHNe7DxEEmE7bJXKMlOAr/IPb8J8Q6QwrL6MbnSMovEKq2YnbwBI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4205.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(39860400002)(396003)(346002)(366004)(55016002)(122000001)(38100700002)(8936002)(52536014)(7696005)(71200400001)(316002)(110136005)(54906003)(5660300002)(66946007)(2906002)(66446008)(66476007)(64756008)(66556008)(76116006)(4326008)(8676002)(966005)(83380400001)(9686003)(478600001)(6506007)(186003)(86362001)(33656002)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Wkp2T2lWWFc0RXFtVEJHbnR3cGJjSXVmOEhkY2UzU3UwZjNtWmFJTmJ2bnhS?=
 =?utf-8?B?cVVKUEpPZlBwWTZFc2t6L1pSU3FLN0tJRjA2TTIycG1RMm5kWVMxdXRscmUw?=
 =?utf-8?B?MklkY0Vua0tTUTcwWTA4WXlSVDRibHpIV2tMVzFQNWNJMTY1bGhZck5vbWxE?=
 =?utf-8?B?ZmNBTm9OaEdKenhPdkhDby9sRC9mdWVLYUlVZVltUkhiY292S0RjVWtpSWov?=
 =?utf-8?B?REZUUXNTbGVRVUhibFBRdDM4ak55bFlTUGYveVZGdTJmRVZtSnRwcHc4QlNu?=
 =?utf-8?B?cE90K1hpVlNCRFR5c0VtWlFIL1ZTUys1Qll0Ry9SeG90WHJjdE1FQTFxbGFq?=
 =?utf-8?B?ZDFRQkpOaFJWaUNaWFd3SnhnMEdRKzVLVms4bjByUmlrSExuWWtna3U5UFls?=
 =?utf-8?B?Q3VBbjlrdW5tOXczYlBxWVJLY09kMzFDQVNGMFFTUk5hUUdWbkFFcDRGME95?=
 =?utf-8?B?MHQyb3djcitYaXhBMVNiUkFZOU9CL0ozTjlpN2ZocjczM1g0K1VYaW5UQTJk?=
 =?utf-8?B?R0J5R2V1c1lXeU00aklyU1h0QkdmeW4vaGdORDNIR2txRTUyR1lUM3N2Rms3?=
 =?utf-8?B?RkJqb1dFcTR6ZktpQytZdjBOd1ZFNi9nc28yQXY5NE1iOCtGSUVFK0hkRzBY?=
 =?utf-8?B?ZmwzTUJlYmZQdExEMXR6UTZTbnJrMyt6anNkcHliOGpRQmt6a3B1Q2REZmJD?=
 =?utf-8?B?VjVReVo5bDJwRy9LTE1nWjJHc2wwc09PYWJIcTlmNDVFWE1va3pUaEQwTklk?=
 =?utf-8?B?SW04Ri9sbXNMMVk0VFN6eURIb0NxWlB5SC9KSGJYOHBNTm5ZL1dyNUZVeFlp?=
 =?utf-8?B?ZURlL2dickpWSVZwczNIeWJXRFZNbytCNUpKc2UrYVkvYnJDMCtKUnl2WWV1?=
 =?utf-8?B?eU83RHcxK2pJMzZDNGpNZkZFaXJRc1ZrQzN5TlVNMHUwLzdiVEtsMml5YWpR?=
 =?utf-8?B?NExJNEVoUDRyUGp0WlJOK3c3QjMzNjlIOUFRTGRlY1ZvcSszVHNFeHBRYitV?=
 =?utf-8?B?bU0zWTRjTWNySkV3YWFkQUVsc25PMHZGbnVqOEdPaGtyVWZZSEk0a0VmRUN0?=
 =?utf-8?B?NHZtckNpV254dGlJeERlMWczaHd6Vmo0OTZWRUpYV3ZkeDhOVitQMnMyaTF2?=
 =?utf-8?B?U1h6bE90N0NvNkZTUGwyY2hFckRUMEZUMElmRklOc1J0TUNoQm1NaWx6R2dY?=
 =?utf-8?B?NGZpUXVIbjhIU1pvT2pqdUozR3RPNHdlVHdEN01CTUhXTS9DTDBybE1Wa210?=
 =?utf-8?B?YzJoRldkUGhxUDJLSXdsS0VMc09IK3RERDlPdHByYmEyS1hHdTU3NU03Nk9u?=
 =?utf-8?B?ZzdpcGRyVTR6akZxQXd4Um1yUnh5eFVFV01RNVZiUk1MS3g4Kzdrazl4dk1M?=
 =?utf-8?B?Vm1Kb1RWdERZd3A4TURNTG9UVDFaMVBZRlNYcEt5WTluOWVOd2hGaW4yU205?=
 =?utf-8?B?UTJYZlZxKy9KbjJ2NWhKQ0x1aVVUZkhWR1BNVG45Rjc5bTZMRmZsTnFuYjI2?=
 =?utf-8?B?bWRkQVF5RVd3YVZlVmZhL2paOW1COTFsNU5LdTltZEtrTWZQQWd3SHdjQzNs?=
 =?utf-8?B?RTJWWjE0MEhjVmFTMzJJQWRHSXFKSmRNSDNXNExETzlZYlhMc1N6TzZ1d1pM?=
 =?utf-8?B?UVJZampWQnpVa1VXRVFJQnd1Y1h6VlNtNXNMS2hTdmRXdCtoNWhXODhqajQy?=
 =?utf-8?B?YVh3QkN4aFdHa0dIVGlZdWpFS29ndFFuQWtWQkZGN3A2TGcyUDR3V2N2Lzl6?=
 =?utf-8?Q?TpkU1yRmMzQ2CtU8Y6SzAcqhB9BhpSrrqAPIP6w?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4205.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 225eb14d-57d1-4f72-0a78-08d9453aeb0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2021 13:42:40.2100 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 65Unt2OmmlL2baYWv3QVpdOiTTxlsQkQUasExCPPwIEm0zVOP4ew3yDZXyDWlqgwvLVYhuAqyr2DZ43aPWjz2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5456
Received-SPF: pass client-ip=216.71.140.77; envelope-from=bcain@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
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
Cc: "ale@rev.ng" <ale@rev.ng>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUm9iIExhbmRsZXkgPHJv
YkBsYW5kbGV5Lm5ldD4NCj4gU2VudDogTW9uZGF5LCBKdWx5IDEyLCAyMDIxIDM6MTYgQU0NCi4u
Lg0KPiBFeGNlcHQgdGhlIExMVk1fRU5BQkxFX0xMRCBwYXJ0IGJyZWFrcyB3aXRoIGEgc3RhbmRh
cmQgZGViaWFuL2RldnVhbiB4ODYtDQo+IDY0IGhvc3QNCj4gdG9vbGNoYWluIGJlY2F1c2UgaXQg
T05MWSB3b3JrcyB3aXRoIGhvc3QgbGx2bSwgYW5kIGFwcGFyZW50bHkgb25seSBhIHByZXR0eQ0K
PiBjdXJyZW50IG9uZSBhdCB0aGF0Og0KPiANCj4gICBodHRwczovL2dpdGh1Yi5jb20vdGVuc29y
Zmxvdy9tbGlyLWhsby9pc3N1ZXMvNA0KPiANCj4gKERldnVhbiBCZW93dWxmIG9ubHkgcGFja2Fn
ZXMgbGxkLTcsIG5vdCBsbGQtMTAuKQ0KDQpTb3JyeSBhYm91dCB0aGF0LCB3ZSBkaWQgdGVzdCBv
bmx5IHdpdGggZmFpcmx5IGN1cnJlbnQvcmVjZW50IGxsZC4NCg0KPiBJJ20gY3VycmVudGx5IGJ1
aWxkaW5nOg0KPiANCj4gY21ha2UgLUcgTmluamEgLURDTUFLRV9CVUlMRF9UWVBFPVJlbGVhc2Ug
XA0KPiAgIC1EQ01BS0VfSU5TVEFMTF9QUkVGSVg9JChyZWFkbGluayAtZiAuLi9sbHZtKSAtDQo+
IERMTFZNX0VOQUJMRV9QUk9KRUNUUz0ibGxkIiBcDQo+ICAgJChyZWFkbGluayAtZiAuLi9sbHZt
LXByb2plY3QvbGx2bSkNCj4gbmluamEgYWxsIGluc3RhbGwNCj4gDQo+IE9uIHRoZSB0aGVvcnkg
dGhhdCBzaG91bGQgZ2l2ZSBtZSBhbiBsbGQtZ2l0IEkgY2FuIHBsYXkgJFBBVEggZ2FtZXMgYW5k
IHJlLXJ1bg0KPiB0aGUgb3RoZXIgYnVpbGQgd2l0aCwgYnV0IG15IFFVRVNUSU9OIGlzIHdoYXQg
ZG9lcyB0aGUNCj4gTExWTV9FTkFCTEVfTExEPXBvdGF0bw0KPiBhY3R1YWxseSBhY2NvbXBsaXNo
IGhlcmU/IElzIGl0IGEgc2FuaXRpemluZyBzdGVwIG9yIGlzIHRoZXJlIHNvbWV0aGluZyBhYm91
dA0KPiBidWlsZGluZyB3aXRoIGdjYydzIGxsZCB0aGF0J3Mga25vd24gdG8gYnJlYWsgdGhlIGhl
eGFnb24gdG9vbGNoYWluPyBJZiBJIGp1c3QNCj4gb21pdCBpdCAodG8gYXZvaWQgYnVpbGRpbmcg
bGxkIF90d2ljZV8pIHdpbGwgSSAocHJvYmFibHkpIGdldCBhIHdvcmtpbmcgaGV4YWdvbg0KPiB0
b29sY2hhaW4/IChBc3N1bWluZyBJIGRvIHRoZSBtdXNsIGFuZCBoZWFkZXJzLWluc3RhbGwgYnVp
bGRzIGFuZCBzbyBvbj8pDQo+IA0KPiBXaGF0J3MgdGhlIF9pc3N1ZV8gaGVyZSB0aGF0IHRoaXMg
Y29uZmlnIHN5bWJvbCBhZGRyZXNzZXM/DQoNCmxsZCBpcyBub3QgbmVjZXNzYXJ5IHRvIGJ1aWxk
IHRoZSBoZXhhZ29uIHRvb2xjaGFpbi4gIEl0IGp1c3QgaGFwcGVucyB0aGF0IHRoZSBidWlsZCBw
cm9jZXNzIHRha2VzIGFuIGVub3Jtb3VzIGFtb3VudCBvZiB0aW1lIChhbmQgbWVtb3J5KSB1c2lu
ZyB0aGUgZ251IEJGRCBsZC4gIEkgd291bGQgZXhwZWN0IGJ1aWxkaW5nIHdpdGggZWl0aGVyIGxk
L2dvbGQgIHdvdWxkIHdvcmsgZmluZS4NCg0KSWYgeW91IGRvbid0IG1pbmQgYmluYXJpZXMsIHRo
ZXJlIGFyZSB4ODZfNjQgbGludXggYmluYXJ5IHRvb2xjaGFpbnMgd2l0aCBsbGQgb24gcmVsZWFz
ZXMubGx2bS5vcmcgYW5kIHRoZXJlJ3MgYWxzbyBhIGJpbmFyeSBoZXhhZ29uLWxpbnV4IGNyb3Nz
IHRvb2xjaGFpbiB0aGF0IHdlIHNoYXJlZCBmb3IgdXNlIGJ5IGtlcm5lbCBkZXZlbG9wZXJzLiAg
VGhlIGhleGFnb24gbGludXggdG9vbGNoYWluIGlzIGJ1aWx0IG9uIFVidW50dSAxNi4wNC4NCg0K
QnV0IHdoZW4gYnVpbGRpbmcgeW91ciB0b29sY2hhaW4sIG9taXR0aW5nIExMVk1fRU5BQkxFX0xM
RCBzaG91bGQgd29yayBqdXN0IGZpbmUuDQoNCi1Ccmlhbg0K

