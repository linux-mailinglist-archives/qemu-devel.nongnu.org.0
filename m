Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C647300F8C
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 23:03:43 +0100 (CET)
Received: from localhost ([::1]:58700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l34Ws-0000Ox-KU
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 17:03:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1l34VD-0007uA-MK
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 17:01:59 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:6799)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1l34VA-0002Fz-Ru
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 17:01:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1611352916; x=1642888916;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=B/zA1Uif7/rxsQFWGWe2/cdb9UMXOvEMp/RG1pEQItw=;
 b=MTlJJNTZlwtVNZ4ZFQEoJuQRfTlktPdRpH+W1nFfsLlb0HqemEqeQoxc
 kRqFdRqarGK9AdoVuW6R8sNqAWCpg/5dUjAAZva5FvxL3YsuOn2RnFe5w
 lhC6ydWu0LiTmgKQnW8Jedu+FEHlpFcHumgx9m90PLGtDOk/b1/jVf2Kc E=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 22 Jan 2021 14:01:52 -0800
X-QCInternal: smtphost
Received: from nasanexm03f.na.qualcomm.com ([10.85.0.47])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 22 Jan 2021 14:01:52 -0800
Received: from nasanexm03g.na.qualcomm.com (10.85.0.49) by
 nasanexm03f.na.qualcomm.com (10.85.0.47) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Jan 2021 14:01:51 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03g.na.qualcomm.com (10.85.0.49) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Fri, 22 Jan 2021 14:01:51 -0800
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BYAPR02MB5816.namprd02.prod.outlook.com (2603:10b6:a03:126::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Fri, 22 Jan
 2021 22:01:50 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::41f5:1c20:959e:559e]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::41f5:1c20:959e:559e%7]) with mapi id 15.20.3784.015; Fri, 22 Jan 2021
 22:01:50 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH v7 12/35] Hexagon (target/hexagon) instruction attributes
Thread-Topic: [PATCH v7 12/35] Hexagon (target/hexagon) instruction attributes
Thread-Index: AQHW7tyA+U6HHthK+EKmM2bq3g+Mxaoz8UUAgABE/UA=
Date: Fri, 22 Jan 2021 22:01:50 +0000
Message-ID: <BYAPR02MB48867F2DC90D2A81897C387FDEA09@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <1611113349-24906-1-git-send-email-tsimpson@quicinc.com>
 <1611113349-24906-13-git-send-email-tsimpson@quicinc.com>
 <11960eff-406b-158c-7fae-61b2e0550268@amsat.org>
In-Reply-To: <11960eff-406b-158c-7fae-61b2e0550268@amsat.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: amsat.org; dkim=none (message not signed)
 header.d=none;amsat.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [76.120.51.212]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 27b1ccb1-b02b-4a40-cc3c-08d8bf215221
x-ms-traffictypediagnostic: BYAPR02MB5816:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB5816829698CE3CEA3D11B3BBDEA00@BYAPR02MB5816.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:454;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gEmQgEUKch70LVmnmCxCwSb4J6L7/CO/K2L08B3Es54K67rMsYKspk9j4aSPkif59tC32jhlzMmb1VqaG5aaYOveNWi9OKsRlak+vH9yqL1MlNAzJET7SOnftvyH+5w13bvNScee2LEE0cl/+u6hZkN+Iw0RCWV6JhfbJ2MUy03Pw96EH5Au4OjIiyMiVpN36V8QtGimCsVRy0Gm58kUEkgzg+rv21ISg031yMTYf/Ps8ipH39FPnE2cp6RTYtFOMzQkqBGwyTSuRoSBtwgob+8HuHcDX4Wl8tGKMyeTTDYvOYK7SJSTBT59ixDN4Fp36JkjmZ50sG/1ZFXtVFp2hikwA5JPXoNLZASOe4m/PfV99H5qdVGsrmo/qME5Ck0bjzBh/tU+Wn7IykaT7l4UkQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(396003)(346002)(376002)(39860400002)(64756008)(107886003)(66446008)(86362001)(76116006)(2906002)(71200400001)(186003)(66556008)(5660300002)(53546011)(6506007)(52536014)(66946007)(66476007)(33656002)(26005)(55016002)(9686003)(54906003)(83380400001)(110136005)(478600001)(316002)(4326008)(8936002)(8676002)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?MzdFRzczZjRSdURPMlRpZHVyNzBiMFJLK1BIak9qMm10VWdqSURDV0dRdXRT?=
 =?utf-8?B?Mmxyc0c4UlREdDI2d3BUdm5DRkhYcWtzY2pkVXRYVW5zcHFCUFBtd2E1QlYy?=
 =?utf-8?B?Z1pzcHhRZFIzdFVPNTJRTUlxd0JteHA4WDdyd040VUxTbTNBZEprZUZPckJj?=
 =?utf-8?B?NGxzZHB1dXBiZlpEclZIMy80Zk5aU2ZpWDJIb0ZxYWNhUEpKZ3RRM3RCb00v?=
 =?utf-8?B?V1U3U3JsT2xLNjYyejJocEVXWXVMZ3BtSkxtYS96RWhPWW9YTk9sQ1RrMnhU?=
 =?utf-8?B?dmFXNFRkWFlSUkhRSkJLSkNvQ3NhZjRMbnhWOXFyZlV1WmMzTk1nWkd6NWdw?=
 =?utf-8?B?WmMyaEg3SFdubU1tQm5JWXhySmpRL0tKODJuSk1tZVM1Z2ZNdFgwaU1aa1Mw?=
 =?utf-8?B?WnErVUhnSmM2VWFQbWpPQm5CZXhoN0FNYmUwYmVUeXlacmlScmNzZmFFR1dW?=
 =?utf-8?B?dVRvTnNvMlFtSkZ6OEpqNGVIM0FlZmt4c1ZMRGhqdTNkM3FLV0dncWxsbWFL?=
 =?utf-8?B?YVR6cWowZ1pSemJHU1U1WUZidThwbTJEbmZsRUpTVUs3VkNRUXZSWnlDblhI?=
 =?utf-8?B?L3U3eS9qY1A3bUJhQzNSSFVxKzNQTHExQ0Q1ZDBtTGVsK3ZuRTlRaE13ZFJt?=
 =?utf-8?B?enFrMHdtMmZHYWN2UHhGVmRJeS9kUFJ5a29WeUg1cTFzNFNrYkdHc1hya0kv?=
 =?utf-8?B?c3l1UjNPWDNFM2VPKzZSNUIrUDFGN3BWbmdXMGxTaHdYOVRsREIyY0ZUcEZO?=
 =?utf-8?B?bHpwT3hYUU9uanhXYTlhekt4c0t2d1BoNDlRTXFDTXBjNXk5cWV6Rlh4Y2Rt?=
 =?utf-8?B?VWZad3NZNk9yVS96VWNsQ1plWEYvS1JOaDMyVlZuVmJXRDdDclhxK3NHZkxw?=
 =?utf-8?B?Ly9rWEF4L1k0RTFuNzZIRVo3UnFOWm0wZlRQR0tFTHFyU3VjeC9nSlYvcWdn?=
 =?utf-8?B?M1E5VVBPZlg5QUozM3dFWi9lSUgwY0wyZ2lEZ2tyWFhBUlV2NEFyOEs0a1Vw?=
 =?utf-8?B?eEZCQmhkSVBPejFXT3d2bFZXVERpbkx2VTVxS3RnTFVDZDNnQmpiU01ERHVo?=
 =?utf-8?B?VFVmRzhkSkRMUGcvSUdCeFpubmVMYjd4SmYzVVJKYk5CTDFCM0pEQXI5ZFVl?=
 =?utf-8?B?U08rdnBJU0g4MHZCckMzWUg5c0JHS1Y3cHdhYmpVN2wvSXBINUJRV3B3RUNl?=
 =?utf-8?B?Wnd5a3JFNkdHSnhYV1B3RWhSWDJ3YVNoY0JZVTZ0S3lCZVM2Vk9VK1g1bHRD?=
 =?utf-8?B?T2ZYZy9aYmlyNDQxZ0xwd1hNL2FiKzdoK29UMUxtMEcrVTdKbDNDcTEzWTBj?=
 =?utf-8?Q?kKgOsT2ju7cIM=3D?=
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qm2JoUN+9CE4efvAGrd2NZsCsABanxsJ3f0qkuf/V+3yHqsN8AOxtH3xmQFmOPggjnMRThioCRNxg3OAT8QlKP2vL1sxiHBeXWOB87gwwr8p5TBt7AFrMdIv4f0kb0FlsThdYSDN2IXIBjfJFfDhBslhlYicIVwrrrIWAItYKyBMl0I8asD+eczclw3uW8P/QAw/Kj1bQ0hAOag3NWsfXiPH09eUnfRGRoFkIHJuL2IdaiBpduhozObqXi+Wgm6kySz7OOivJ/W/tKRP3Uf3e5wOTnq2T09DpkTCHp29TFV3u1rVDCAKflOjk/wRwFLvndsI6nzY81t0pRoZFlZVIw==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QKB0OhtG86slqCmD+10YHG/W0F1XmMhM91x3ErbZQR4=;
 b=RrICj2K+MWyvEedPZ6AxstgVtgmMDLbTIyKv+hbHF30zZsk7QN8uxmeJhxcp8CDbiVEtCQjG4ZWCEWgsE8EpZnD53teKZR0vYtBNZTrUOo6KeQB6CoZAprH8gYLGZ3braao74EkawvCNZDT+txlZk29B6ambbT6ndh3DOv/zkW1A4rGYlGTWrfvjF8SOGRzrolzW5NIve39/iaj4jEaVhHnja+nxP+vFvQTmM7roM2S3pNVJisZEpWIrF5YXZRmvU0hlz6lyvYDVTL5OKRYfKD53h6dxgysqkc4MF2CCzjbPT/dmPnSy3dZCREb2w/1M9uKtpX10DfXpjYKUQkZhJQ==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
dkim-signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qualcomm.onmicrosoft.com; s=selector1-qualcomm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QKB0OhtG86slqCmD+10YHG/W0F1XmMhM91x3ErbZQR4=;
 b=XzEFapmoy6TNG+oolRLet6tEzxBxb7HB3batpxLiC7CfgjSPjG43/OhFKCneTrVAcpkxxaTe2UybYTTh8dXGMfNdbQA/3zn+PkQY9WYKAi+ZJ11WTOjy+hL4pkvjk8eQiC9yL/9Akwx2m87jnRVbCV87YXRj27d75r5ptPlx918=
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BYAPR02MB4886.namprd02.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: 27b1ccb1-b02b-4a40-cc3c-08d8bf215221
x-ms-exchange-crosstenant-originalarrivaltime: 22 Jan 2021 22:01:50.4878 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: RX0XgYyyslBBb88lk4b2GLxzzmaULVkDVtiKqyw+962iNZVibPh/zIQj/ZCKSLvU33+Csiq8hvvKFTPYTIxmyQ==
x-ms-exchange-transport-crosstenantheadersstamped: BYAPR02MB5816
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
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "laurent@vivier.eu" <laurent@vivier.eu>, Brian Cain <bcain@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFBoaWxpcHBlIE1hdGhpZXUt
RGF1ZMOpIDxwaGlsaXBwZS5tYXRoaWV1LmRhdWRlQGdtYWlsLmNvbT4gT24NCj4gQmVoYWxmIE9m
IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpDQo+IFNlbnQ6IEZyaWRheSwgSmFudWFyeSAyMiwgMjAy
MSAxMTo1NCBBTQ0KPiBUbzogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPjsg
cWVtdS1kZXZlbEBub25nbnUub3JnDQo+IENjOiByaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3Jn
OyBhbGV4LmJlbm5lZUBsaW5hcm8ub3JnOw0KPiBsYXVyZW50QHZpdmllci5ldTsgYWxlQHJldi5u
ZzsgQnJpYW4gQ2FpbiA8YmNhaW5AcXVpY2luYy5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
djcgMTIvMzVdIEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBpbnN0cnVjdGlvbg0KPiBhdHRyaWJ1
dGVzDQo+DQo+IE9uIDEvMjAvMjEgNDoyOCBBTSwgVGF5bG9yIFNpbXBzb24gd3JvdGU6DQo+ID4g
U2lnbmVkLW9mZi1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPg0KPiA+
IC0tLQ0KPiA+ICB0YXJnZXQvaGV4YWdvbi9hdHRyaWJzLmggICAgIHwgMzAgKysrKysrKysrKysr
KysNCj4gPiAgdGFyZ2V0L2hleGFnb24vYXR0cmlic19kZWYuaCB8IDk1DQo+ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwg
MTI1IGluc2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRhcmdldC9oZXhhZ29u
L2F0dHJpYnMuaA0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgdGFyZ2V0L2hleGFnb24vYXR0cmli
c19kZWYuaA0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL2F0dHJpYnMuaCBi
L3RhcmdldC9oZXhhZ29uL2F0dHJpYnMuaA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4g
aW5kZXggMDAwMDAwMC4uZTg4ZTVlYg0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi90YXJn
ZXQvaGV4YWdvbi9hdHRyaWJzLmgNCj4gPiBAQCAtMCwwICsxLDMwIEBADQo+ID4gKw0KPiA+ICtl
bnVtIHsNCj4gPiArI2RlZmluZSBERUZfQVRUUklCKE5BTUUsIC4uLikgQV8jI05BTUUsDQo+ID4g
KyNpbmNsdWRlICJhdHRyaWJzX2RlZi5oIg0KPg0KPiBQZXIgUUVNVSBjb252ZW50aW9ucywgdGhp
cyBmaWxlIGhhcyB0byBiZSBuYW1lZCAiYXR0cmlic19kZWYuaC5pbmMiLg0KDQpEaWRuJ3Qga25v
dyB0aGF0LiAgV2hpY2ggZmlsZXMgc2hvdWxkIGVuZCBpbiAuaW5jPw0KDQo+DQo+IE90aGVyd2lz
ZToNCj4gUmV2aWV3ZWQtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxmNGJ1Z0BhbXNhdC5v
cmc+DQoNClRoYW5rcyEhDQoNCg0K

