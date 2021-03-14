Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB25E33A217
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 01:42:45 +0100 (CET)
Received: from localhost ([::1]:38042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLEqC-0007g1-7D
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 19:42:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lLEn1-0006VW-PE
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 19:39:28 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:42665)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lLEmy-00048E-8f
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 19:39:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1615682364; x=1647218364;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vftMBVJKBTLW33xnBjAPN84JcIPvfH/W+0MvOySrES8=;
 b=kE08AgnZStXT5UhEI7wgFI4WnnzY7u6cLnQMCXZY6FHQz2KFKIocH1oy
 Fty4CjyIcijr9xjkOnEWO0ELKQSqqHQuesp5+DPf3Ag8ctxc8ykyPJ0aI
 /AUiEAaRdjwrwAxDKqWKrAsmDHGmO1XUh2aBXgoigxlMTMKl7/GIO9n3X o=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 13 Mar 2021 16:39:19 -0800
X-QCInternal: smtphost
Received: from nasanexm03e.na.qualcomm.com ([10.85.0.48])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 13 Mar 2021 16:39:18 -0800
Received: from nasanexm03b.na.qualcomm.com (10.85.0.98) by
 nasanexm03e.na.qualcomm.com (10.85.0.48) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 13 Mar 2021 16:39:18 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03b.na.qualcomm.com (10.85.0.98) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Sat, 13 Mar 2021 16:39:18 -0800
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BYAPR02MB4263.namprd02.prod.outlook.com (2603:10b6:a03:5b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Sun, 14 Mar
 2021 00:39:17 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::7980:b3e8:c439:fad6]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::7980:b3e8:c439:fad6%4]) with mapi id 15.20.3933.032; Sun, 14 Mar 2021
 00:39:17 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v8 25/35] Hexagon (target/hexagon) instruction classes
Thread-Topic: [PATCH v8 25/35] Hexagon (target/hexagon) instruction classes
Thread-Index: AQHW/d3WX1yMllwbm0W++Tprz6sxWqpYWfsAgCdA4fA=
Date: Sun, 14 Mar 2021 00:39:17 +0000
Message-ID: <BYAPR02MB4886E308311823CCCF170772DE6D9@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <1612763186-18161-26-git-send-email-tsimpson@quicinc.com>
 <3d366d6a-b278-cda0-f822-5c8aa7ba67dc@linaro.org>
In-Reply-To: <3d366d6a-b278-cda0-f822-5c8aa7ba67dc@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [70.115.140.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 050323c1-b930-4e00-30be-08d8e6819973
x-ms-traffictypediagnostic: BYAPR02MB4263:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB42636FE1B1B1CDD3DAD6667DDE6D9@BYAPR02MB4263.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kNE2r1MK3lc9nftu7Fbl8ZsFAFVC1F115Elof9P7VKiBbCgsCvv+O72NYeoyHtqwmga1my3SAhRrGU0iYvoPELs6cGI358L4m8I3FTdChXZI2HmUQnyJnwJu1MXnwUc3cqOcC2JUncwqKmf+K/a8XCNl3SE67lA7QB0YHGP4V5ScNrCTy+fcuQH1IwvblWEfNDSEtfX3SgiU5ebZY9dX8Jsw57tqQ2PbDDWqf+feS95hvR0nkuVzqjO1bExhi45IamZVNJqZiAdo2CGJtdDBbPktHei1xI7HF9OAm3PWLJM7ZHvuo7t7i2nSatoxWAOQMH0FZYJcBPyGGgjqTVdR0lVSk5R0+GaJjX0HH486tOrAQnJHGen0y0i4FHo4lHru/Te/1XEq/MSfWP9V2h64nmlj3PnjcAEFg/GXfD9d6Lw87mIyYW4i84zG8TNEW6d76oCQcnP7KUqrseTav5TFhqiuiUAZXVKomkas2YdcTYB8caN4zgYGWjLPNThLTQQ5KUvS3M9vhucVvReNb/hEG0AnrpY9hCXeYOggXIHPWOmJa6UJgsiidOaF5QZat7Q1
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(39850400004)(396003)(376002)(136003)(76116006)(52536014)(55016002)(4326008)(64756008)(66476007)(478600001)(9686003)(66946007)(66446008)(8676002)(316002)(4744005)(8936002)(66556008)(54906003)(26005)(83380400001)(71200400001)(5660300002)(86362001)(6506007)(53546011)(7696005)(33656002)(186003)(110136005)(2906002)(107886003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?akwrWGpCSDBMalNUYzNaT0NmL2xGejRpVGkraEF1dTVFMlpkMW40YnF1dXNB?=
 =?utf-8?B?aVYwb1ZDdFNEczJsS1VwQ3BzeEZGcXZoNG9UUVJKTmQrTGg5WXBkYVZVZ1pI?=
 =?utf-8?B?aHdBeGlmSlI1ZWNoSzFnWXM2dWVuWnZRdU1UQ1Zvd01qam5oMHpqZVNNMkxD?=
 =?utf-8?B?Qkk3K1B1dzFpNzcvMU1ialp3VG9XNzFDQlpsdFp4enNaY2srT2VrcjNseDFU?=
 =?utf-8?B?a29lU3hqcEczeE5VK0FxMGFmdCsxNVlUWmlnT1VzMXFzcjVrODBraTFYQWh1?=
 =?utf-8?B?TXQ1SkdKUG1qL0VjSTZqVzVDdEthcGQxWjZQRDJqVGRLdHhXNFVncGZrVVJH?=
 =?utf-8?B?eG5Xdi9wd3dFR3hsMGRXN0w1cWdMNXpwN29vZW9wY0dIcjRDUEZ1YVZUUjlI?=
 =?utf-8?B?eVBaa0plZGhpSmgrYnMvUFM5TzBkNDBCWEhHcHByZVYrengvU2oxTVFwNDlU?=
 =?utf-8?B?eDB4RUcwZGNaTGFWQUVqNE5TUDNlUVcvQkhLRUE1d1RnM3Awc1ZLT09lazgv?=
 =?utf-8?B?WThJKzJZdGcxMFVCUk9RNU81QXRSN2NhL1BrbTFuWGVVMVhkb1hQK0ZSM3o4?=
 =?utf-8?B?S2Rob2V6c2lKT0xiK2hrbUxlN2U0R2pPM3pOVnlLMXdjdkJ3dldvaGFLblVJ?=
 =?utf-8?B?dnlhTFczMjlWRUNBZkJhT1lwaDRZT3I2dGdBZll1RVBReDFxRzJWWUt3OE1a?=
 =?utf-8?B?bUlRUXBKVDRCcGV2RUpTNDQxeVdEK1NRY21jaUorak01WVFiWUlUMEJXd2Iv?=
 =?utf-8?B?UnhTejQvSnZOZnpqeUFrTFJzcGlTVVlUNVlPMzZrbitPckVOdUswUzFYTmZR?=
 =?utf-8?B?ZDhlOTh6elpCa3NMdjVkT1BXN1VESXZMTjNuaXp4V1ZXVXQ1YnkwQzJMWEd3?=
 =?utf-8?B?VlJPU3lzdVZnNWNpc0tPT2lxa2M0TXNhRzk1YzJvLzEyS0pBWi9SbjQ1R0h6?=
 =?utf-8?B?ajdSWGVGR29nSEF2cTlXMjlVM08yaUdNajlqNXNKUzJTWGN6SlhxczUrSExK?=
 =?utf-8?B?N3AwOEdJZFpsaUFEYmZOekIydTJHZ1AxL1dxN2lhWWJNK3FSbGtvRERKRDJR?=
 =?utf-8?B?KzRkV3F3RFBPazk2Rkh5OEhBSG15Q1ZmN1RNOFhuQUkvMk0wQjNzc0Zsam1l?=
 =?utf-8?B?Tk5CZ3hZM0F6N0FvTXc1VUQ0UmVYcjAvbWxORWllRDFuQWlwb2huVXFLTFlM?=
 =?utf-8?B?TmowRVRiTG9PT292YURhM1dkNTAxcStPT2Y0bFRralpKbmJZTVhuZlZ6bG11?=
 =?utf-8?B?K1VaSmxqVFhYeUNFOFRQVVNkVFJmTjRNc1ZLZy9NK3d5MHdYZklWM0dpd3N5?=
 =?utf-8?B?bS9CRWVQdnhJdC9mb0JoeTRNcGo5WGhxdmRLMzZDQXNIdXYxUTYwNGpIckFr?=
 =?utf-8?B?VGhSeHRocWh6TGdySTA1YUNvejJFTTNMUVZvZnFUdUdBNUF4RUowK3hhN2NK?=
 =?utf-8?B?UThHaDNJSVlTVmJQSGorUW5UU1QvZGlZVGh1R21wcThxLy9wM3JxNGlLaFdz?=
 =?utf-8?B?ZUZTcjFwUU0wR25IbVprbEIwOHMrVmtxRzc5ZkhqOHhjVHh5MU50ZVI3aTA3?=
 =?utf-8?B?cms2UXJIVkI1SE9MZGdYcURzUUZpV0NqN0FPazMyb0UzY3Y1NFkxQVcyQml1?=
 =?utf-8?B?Ymo1czdUWk1IS2lleFlJNU40c2U3OGlJa2dpemJzWXZlV2JpK0xOTEdBZnpp?=
 =?utf-8?B?N1hFYU1DanM4enRMS2xIVTBaQUx0VkE3Z1YyZkJZWjNxb2VIVkxBZ3g4U3lV?=
 =?utf-8?Q?19bkfY034JgeJQz7Assx+lfImCRJNoblZUL1rDZ?=
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gqMj5luGF/AcLVDVgs9Z/i6Tqwb0HyU9MZ7S0Ft2T24YA3c/qaCD7s4AjSb5kV788hlt+rloZTF14BpQShci7Is+V7jOHPvGOsIXQM7Uq72A58io6xh1kpuRbyGxgKgwOlBXFCoE0jp8tZJWiLfzBw56r40ub7gQRphYyxzVIdEQHFnrzZpBBa1/hOCWo8RUW0vcKXG7+28lT2DwRUmSG/fzrJFh/768MbHYkpBc6w0Ya94jyIkacn3j1RTSUtYcJN4w3BUg6JfYfzFZfmmC13oDEDCqMBs/QyOdXwPpDmG/Nx2cc5eJurFrQFrvhejWvLhASysoI6fPBlZa4p2erQ==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mJa2IeGXR1S1ckxDuXQekrrIONDhYef/Kdqk9QShQsI=;
 b=Vn6dRDuURZlmnvVoqdR81kWc8RODxNRya6hAkkZksjE4zfHMZZTNWfCj6gKPlEinhQzidjcGU1VGrWYujkHS2pZjN6klKO9n1NSJoxx/xyZJdx6vu693m49FL7LG1p44fsbsTNeR2JiNLTTj4lGdyK4T+U1rf/bxsxz+O/B13NFbwHUieesbUPoj2UxGhPlHNR3nafM0QmlGyeTVtsPAn+4HQypVXo/YhIAZgiQZ92jS8fnkhXFj0JR2TywX5xYvsbWhdJkZmNDmONuLl5VcNdQOghdROrEsvZolBlGWD5AT5ax0LTL8/3cNlBZercnjddYT7o4mQ3tVfBjFEw0umg==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BYAPR02MB4886.namprd02.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: 050323c1-b930-4e00-30be-08d8e6819973
x-ms-exchange-crosstenant-originalarrivaltime: 14 Mar 2021 00:39:17.0349 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: 356Uap/sBmNOl+atFc1+nFC0T1ssApTwPVF+SXpk5WxmUdCtk6/4GAj0wcc36CwRvkcCZt4XSF6y1ugR6yHveQ==
x-ms-exchange-transport-crosstenantheadersstamped: BYAPR02MB4263
x-originatororg: quicinc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=199.106.114.39; envelope-from=tsimpson@quicinc.com;
 helo=alexa-out-sd-02.qualcomm.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "philmd@redhat.com" <philmd@redhat.com>,
 "laurent@vivier.eu" <laurent@vivier.eu>, Brian Cain <bcain@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBIZW5kZXJz
b24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFN1bmRheSwgRmVicnVh
cnkgMTQsIDIwMjEgNTo0MSBQTQ0KPiBUbzogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNp
bmMuY29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnDQo+IENjOiBwaGlsbWRAcmVkaGF0LmNvbTsg
YWxleC5iZW5uZWVAbGluYXJvLm9yZzsgbGF1cmVudEB2aXZpZXIuZXU7DQo+IGFsZUByZXYubmc7
IEJyaWFuIENhaW4gPGJjYWluQHF1aWNpbmMuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY4
IDI1LzM1XSBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgaW5zdHJ1Y3Rpb24gY2xhc3Nlcw0KPg0K
PiBPbiAyLzcvMjEgOTo0NiBQTSwgVGF5bG9yIFNpbXBzb24gd3JvdGU6DQo+ID4gKyAgICB9IGVs
c2UgaWYgKChpdHlwZSA9PSBJQ0xBU1NfVjJMRFNUKSAmJiAoR0VUX0FUVFJJQihvcGNvZGUsDQo+
IEFfU1RPUkUpKSkgew0KPiA+ICsgICAgICAgIHJldHVybiBTTE9UU18wMTsNCj4gPiArICAgIH0g
ZWxzZSBpZiAoKGl0eXBlID09IElDTEFTU19WMkxEU1QpICYmICghR0VUX0FUVFJJQihvcGNvZGUs
DQo+IEFfU1RPUkUpKSkgew0KPiA+ICsgICAgICAgIHJldHVybiBTTE9UU18wMTsNCj4NCj4gV2hh
dCdzIHRoZSBwb2ludCBvZiB0aGlzPyAgQmV0d2VlbiB0aGUgdHdvIGFsbCBJQ0xBU1NfVjJMRFNU
IHVzZSBTTE9UU18wMS4NCj4gV2h5DQo+IGNhbid0IGl0IGJlIGRvbmUgaW4NCj4NCj4gPiArICAg
ICAgICByZXR1cm4gaWNsYXNzX2luZm9baXR5cGVdOw0KDQpHb29kIGNhdGNoIC0gSSdsbCBlbGlt
aW5hdGUgdGhlIHVubmVjZXNzYXJ5IGNoZWNrcy4NCg==

