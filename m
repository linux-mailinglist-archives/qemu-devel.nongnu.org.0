Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC17633FDF3
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 05:00:46 +0100 (CET)
Received: from localhost ([::1]:33910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMjq1-0006ss-Cf
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 00:00:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lMjnA-0004wy-7C
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 23:57:49 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:56199)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lMjn7-0000gG-LY
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 23:57:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1616039865; x=1647575865;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ExLtn8geKWJ5/FSKzb3W30TABJj7fO3yLqTWG57ih1E=;
 b=BmAT2LJw3Ak6VO1L9RQ/V+X3/zogZuTE1pCfYTqgm5gBOHLIR9WaLf08
 3QudML6jzSCUON2Ai0vp/eUgJAcQkOX2n6QQg4ftz1CWOpcmHbmXKDssh
 FZ2I0bXZWqyllIAel9GD0OVXofFT2xoWTHaiGFSXHVC9yqJlZRXrCgm4Q w=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 17 Mar 2021 20:57:43 -0700
X-QCInternal: smtphost
Received: from nasanexm03f.na.qualcomm.com ([10.85.0.47])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 17 Mar 2021 20:57:43 -0700
Received: from nasanexm03a.na.qualcomm.com (10.85.0.103) by
 nasanexm03f.na.qualcomm.com (10.85.0.47) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 17 Mar 2021 20:57:42 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03a.na.qualcomm.com (10.85.0.103) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Wed, 17 Mar 2021 20:57:42 -0700
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BYAPR02MB4454.namprd02.prod.outlook.com (2603:10b6:a03:5f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 18 Mar
 2021 03:57:36 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::7980:b3e8:c439:fad6]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::7980:b3e8:c439:fad6%4]) with mapi id 15.20.3933.032; Thu, 18 Mar 2021
 03:57:36 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v8 15/35] Hexagon (target/hexagon/arch.[ch]) utility
 functions
Thread-Topic: [PATCH v8 15/35] Hexagon (target/hexagon/arch.[ch]) utility
 functions
Thread-Index: AQHW/d3QWKFfhMBue0mTVssCKmuwG6pYH+wAgDEzOoA=
Date: Thu, 18 Mar 2021 03:57:36 +0000
Message-ID: <BYAPR02MB488692C36CEA74131FEAFE60DE699@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <1612763186-18161-16-git-send-email-tsimpson@quicinc.com>
 <3c036fc7-444f-6ea3-7b1c-2a42837fb5ac@linaro.org>
In-Reply-To: <3c036fc7-444f-6ea3-7b1c-2a42837fb5ac@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [70.115.140.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c9470130-534b-404b-e827-08d8e9c1f76c
x-ms-traffictypediagnostic: BYAPR02MB4454:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB44541A8E9611A46A0CC34F53DE699@BYAPR02MB4454.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IkYBr24JYW4SCqZuq/t8AXSH5G29lDYMhjUrsl3ugH5U4eXxw5DvxFzv2t02LQDHa18v6LI/XnfEjGs+5dQL8x9sCOgzv3NGLYxRGJPTJ+I8/GWThy4MhYGZHyXGc49nAWjE4uqFRTp4UkY3hfbijHDPVPXGNwx4L2BgHYe9IKJMbmA0UTLQEK9ITigeoVQ8IWR1DJcMHambthPUDMqNf/iKvqh0E71rsqN0u4bvzbzXW8T2bNuOJlKt5bOB1KtW6otzFe8wPmLl/a1c0ZAZ/ZLUhDBGqdRHfOWo09NSGjDJ1NESvnmvqm81KaeiE7qpSi8u30eoOvKDvnw88aL8UBy0mTd/z3jTdJIr6vdm7yn/+0/c6ilNSVV3GAoc35GYItfOjB6GfGUMdMMyrslh1zPFMsLxFhQhO4Gvuc7pf+MYoUa3BuuY3L+/JADbxiwIXiwOlA5AZw1D2h09be2gd/cr9vPGk4pTeG0L6ZVj5FL1QOszqlvnIRUslUPuFV+maoSdPvDCyinH9ZUw7iSVCRVXKhYkL5sJIfuDFFy0xwwDgs10L3TyPcA5bX/SWLlZNVir1GKYl1HNhE1F2mvK7ShE92xiU0fHkwxz7rCkj/usfUpC3spfLwDWB2HQNkXA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(396003)(366004)(346002)(136003)(4326008)(107886003)(33656002)(71200400001)(8676002)(26005)(8936002)(186003)(9686003)(5660300002)(66446008)(66556008)(66946007)(55016002)(52536014)(7696005)(2906002)(76116006)(6506007)(66476007)(478600001)(316002)(38100700001)(86362001)(54906003)(110136005)(83380400001)(53546011)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?Rk1mM3phMnArT0dobWplZnZzVG5CcHBqa3NwQ01LTE9YSndlV05MQXFpK0NN?=
 =?utf-8?B?eXB1WWxFeklXYnBWVDdNOHpZbVMxS2JGRWlMRHpxVmdVQlhnQURrZEVwbnBa?=
 =?utf-8?B?VU4rSVlmZkk5Vnd1KzJPMGN3VFZIVGpqbmVkUmRPdElpVVlsa09Edzl3anV3?=
 =?utf-8?B?NEsvd1ZjZnJpMStOanRiMTcvRjg5UzJld0pDejl6bDhNZXQ0eldHSG9KY1Bw?=
 =?utf-8?B?MVZmanlyYkxYdE1zeEtjVXlzc1FhRkpxSmowbHJOd3RqaWdtYmRWa3F2MW9W?=
 =?utf-8?B?VHBhcnFTSFN0RTlEa2lhZUdHTUFsVnVqaHcxN0sxT25OcDRVMVdkUTgvWm81?=
 =?utf-8?B?RTFwRnJKTFh4cjlqcjhoSGM1ZGpGZkdmSGNZc3FWdVZZWCtyekp3UGJqN1pC?=
 =?utf-8?B?MTBTclNQTEtTL2JhL2EzZDlUYlgyR0tPazZqOU1LSEhJa29TSWI4S3hwbHB5?=
 =?utf-8?B?R3k2dllOeWU2Y1BvYVBRRnRtakI4UW50U1VodWo2aUwyRUxBK0VKaXBGS0N4?=
 =?utf-8?B?U3ExTVpRdGNjRmFtZ1FiM3pnNHZBVkV4Y2oydVFJRWorZk5yK1J3KzY5cWNy?=
 =?utf-8?B?OXJTNkp0andKaUJvanZuVExOc0lGMzFjTTVVLzI5VlpaVjRoWG5IcmV6aEY0?=
 =?utf-8?B?YW9HRWh2VEpUM2gwaXlmS1U1aEhFR3lFMGRVWCt3U2h0cmF6bkQ0aDJsK2cx?=
 =?utf-8?B?RENwWi9QQlRZQWdwL2hNLzcvZ0pmYUVka0VxTkptL0M1dElzbGZMUkdMWERE?=
 =?utf-8?B?bURvU0hBU0VXWGhQUFljZkxpc2VldFNqeW5DbTNKcmdWWkkwQU9pM2RyWWlX?=
 =?utf-8?B?YzNiam96VzZvK0psR1NLeG1LSDhSdGtFYWV1aHNzMm9MUDRva2J6SGF5MFlx?=
 =?utf-8?B?WnRLdFJqaVV1VGQzK1Y3SmdsWVVoNTRwTUpCN1hGS2JrWGNDbGJGMnV0a2N1?=
 =?utf-8?B?Q3djWEk0UjRqUEJndVRHSXdCVTJnd0ZnV3ZNc2ZhZENsK05yUGdabmlhcU12?=
 =?utf-8?B?RnV6N2ZyU0lObzZTZC81Uzd5UmlsS3hiaWVHejNIRXR5V3VpQU1FNEdRL2p2?=
 =?utf-8?B?RkNjeXBvTDFMWnJiellQU1g3eitXTXoyK3VTZTJtYi8zT1RsODYyK3RUczRC?=
 =?utf-8?B?bVlvN1ViSkN3bnE1RUE1QWcvNlVBdEpkQ083TldpanhHY0sxcy83MVNiUkMy?=
 =?utf-8?B?TUd4SnZiR280RWZ3TlhOUDUxQVN2M2M3VVR5L21PVXdVS0F1eXRzYURQVi9i?=
 =?utf-8?B?T0FFbEF3R29HTCs0a3d0OVYvcElnNzlFQ0ZVdkVFL0tLYzRtbEFYdkdYalZD?=
 =?utf-8?B?QTN4eE96RU0zS0VObTh5RkpIR3pUT2luckc4MjVzNUtlbXhVY2ZEM0hBZ25R?=
 =?utf-8?B?dXUvQk5MRUJUZzgzQ1Q5TEV5L1hzWTZLei9QVTYwOU5KRXVLejVKanJja0t0?=
 =?utf-8?B?VkdENDluVTRHbXdGd3hKOGtnd29JTHl5YTU4eEpoV0wrNFRmeHVkMTl3U3V6?=
 =?utf-8?B?V0R2U1AySHFJWUtVL1JOYkMycXRWMVhibWIvV1hiUDVyWkduQXdNNExOTVA2?=
 =?utf-8?B?SndLNXR2eUpjSlR5WGlEa29JL200RnhwdUNBQ2F6OG51RFNoSzA1RzR1Z0FK?=
 =?utf-8?B?dFFKbU5LbTArd2tRMzZaL2VhT2h3YlZBQTMzM0FMaVM3RTF6WmFrMlM3R3gy?=
 =?utf-8?B?dVZQOWowQ1FIRy9wWHdxUDh4c0FmeEtwSVlHKzV0Qyt4UlNoV3JjUURMc1pq?=
 =?utf-8?Q?8OVdvBWt90X5I1T3onYmIe+czZ9vhurCJq4dMEX?=
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bLJtp+RWhxGIIHXbO/+51Wyw77/TpAKWvlkCWr4IDGbRK5wd56FwKoC2BMUvPcg5v/PsGB3+RVzEyGZAyq4RfTUOAieUB6L2LgkE1GTumyhWRrUlIEdlUqCdr75cZ4KuwqDTK4rZ7uKehDD22vvesLtpsGb8GOfrflKuN9h9v/WD9CsauTjFYIaopJYuL30oLFxecrxsTtk+0NOHTN2IuEQiLDmQ742CajQvvx4Jw3mMGwke4ApjD+xhrgC0hEnob/YE/xmzjMDrKkj+63Ta+di+J/8VxcWE1TKmoeBDifh9n/tygBX7A+Io7bkHF3mXWWY+5fgxsm2c0S63bSI/DA==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MmmsmEJaNj7/TORNe4K/O3fVu4vojCZdvR71ApfRdAc=;
 b=KoVIoIdtJd7+M3asbf6czSIVrHz8hjjW/7/mOp4b7yC1rp4pWgqRSC8E/47mcZTDOBusJdGQgUhmQpayKK4VfpRGIRflzAMX/Wy/dIELq0fj/HXl26NyXwwKUHkyrAWy1H4NMIgpooGjDiNsBCeELLkjX3UsJakpB5hhqsbz5iX+8mWRdb7Ra9BVmdcR5Bv8K8OQrpLncpZeZwcmUFOemorG1Z9rD4CXuHi3F9ZsGmEMaOg0yblU+dP6SXicZWN+EOJD23rAPFphr1+r+vj43d5EYsq3nxpRur+u8l56IUz+8FmWVQgWPWSxyfs3T6U2D4oUPJzrTzC0jtG6fUZuFA==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BYAPR02MB4886.namprd02.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: c9470130-534b-404b-e827-08d8e9c1f76c
x-ms-exchange-crosstenant-originalarrivaltime: 18 Mar 2021 03:57:36.0485 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: mT6Ifl6xlPyf6DlQALgq8RETSdzmQJM5+pmrEZ2B9J1GrfxanVQacWTXELmjA33Qq7sWryxY29Mu05md5Qpopg==
x-ms-exchange-transport-crosstenantheadersstamped: BYAPR02MB4454
x-originatororg: quicinc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=199.106.114.38; envelope-from=tsimpson@quicinc.com;
 helo=alexa-out-sd-01.qualcomm.com
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
cnkgMTQsIDIwMjEgMjoxMyBQTQ0KPiBUbzogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNp
bmMuY29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnDQo+IENjOiBwaGlsbWRAcmVkaGF0LmNvbTsg
YWxleC5iZW5uZWVAbGluYXJvLm9yZzsgbGF1cmVudEB2aXZpZXIuZXU7DQo+IGFsZUByZXYubmc7
IEJyaWFuIENhaW4gPGJjYWluQHF1aWNpbmMuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY4
IDE1LzM1XSBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbi9hcmNoLltjaF0pIHV0aWxpdHkNCj4gZnVu
Y3Rpb25zDQo+DQo+IE9uIDIvNy8yMSA5OjQ2IFBNLCBUYXlsb3IgU2ltcHNvbiB3cm90ZToNCj4g
PiArdWludDMyX3QgY2FycnlfZnJvbV9hZGQ2NCh1aW50NjRfdCBhLCB1aW50NjRfdCBiLCB1aW50
MzJfdCBjKQ0KPiA+ICt7DQo+ID4gKyAgICB1aW50NjRfdCB0bXBhLCB0bXBiLCB0bXBjOw0KPiA+
ICsgICAgdG1wYSA9IGZHRVRVV09SRCgwLCBhKTsNCj4gPiArICAgIHRtcGIgPSBmR0VUVVdPUkQo
MCwgYik7DQo+ID4gKyAgICB0bXBjID0gdG1wYSArIHRtcGIgKyBjOw0KPiA+ICsgICAgdG1wYSA9
IGZHRVRVV09SRCgxLCBhKTsNCj4gPiArICAgIHRtcGIgPSBmR0VUVVdPUkQoMSwgYik7DQo+ID4g
KyAgICB0bXBjID0gdG1wYSArIHRtcGIgKyBmR0VUVVdPUkQoMSwgdG1wYyk7DQo+ID4gKyAgICB0
bXBjID0gZkdFVFVXT1JEKDEsIHRtcGMpOw0KPiA+ICsgICAgcmV0dXJuIHRtcGM7DQo+ID4gK30N
Cj4NCj4gSSBwcmVzdW1lIHRoaXMgaXMgaW50ZW5kZWQgdG8gY29tcHV0ZSBjYXJyeS1vdXQgZnJv
bSA2NC1iaXQgYWRkaXRpb24gd2l0aA0KPiBjYXJyeS1pbj8NCj4NCj4gICAgIHVpbnQ2NF90IHIg
PSBhICsgYjsNCj4gICAgIHJldHVybiBjID8gciA8PSBhIDogciA8IGE7DQoNCkFjdHVhbGx5LCBJ
IGNhbiByZW1vdmUgdGhpcyBiZWNhdXNlIHRoZSBpbnN0cnVjdGlvbnMgdGhhdCB1c2UgaXQgaGF2
ZSBUQ0cgb3ZlcnJpZGVzIChpLmUuLCB0aGVyZSBpc24ndCBhIGhlbHBlciB0aGF0IHJlZmVyZW5j
ZXMgaXQpLg0KDQoNCj4NCj4gPiArc3RhdGljIGNvbnN0IGludCBzb2Z0ZmxvYXRfcm91bmRpbmdt
b2Rlc1tdID0gew0KPg0KPiBGbG9hdFJvdW5kTW9kZQ0KDQpPSw0KDQo+ID4gK3N0YXRpYyBmbG9h
dDMyIGZsb2F0MzJfbXVsX3BvdzIoZmxvYXQzMiBhLCB1aW50MzJfdCBwLCBmbG9hdF9zdGF0dXMN
Cj4gKmZwX3N0YXR1cykNCj4gPiArew0KPiA+ICsgICAgZmxvYXQzMiBiID0gbWFrZV9mbG9hdDMy
KChTRl9CSUFTICsgcCkgPDwgU0ZfTUFOVEJJVFMpOw0KPiA+ICsgICAgcmV0dXJuIGZsb2F0MzJf
bXVsKGEsIGIsIGZwX3N0YXR1cyk7DQo+ID4gK30NCj4NCj4gVGhpcyBpcyBmbG9hdDMyX3NjYWxi
bi4NCg0KT0sNCg0KDQpUaGFua3MsDQpUYXlsb3INCg==

