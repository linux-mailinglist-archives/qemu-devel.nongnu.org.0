Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D4133A9BD
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 04:08:14 +0100 (CET)
Received: from localhost ([::1]:48048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLdaX-00040h-H3
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 23:08:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lLdYy-0003Zp-1k
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 23:06:36 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:48493)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lLdYw-0003nq-9z
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 23:06:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1615777594; x=1647313594;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7BUa9viFN81ypUdNJOfQadNqTgdYqbmEaV87zbq7ySA=;
 b=S04cLrdn9gMrXiv6PizHQHNKRhqQ/TSe3kDB6LYgv/+8z3PK6D7s9VlZ
 Te0uy4/DfyJe0NZjVmxTYAZmO6IOQmrOpo7dY9Y/M9dtyaxznLTPLEG4J
 KJJMB+EOWkPg/Dk2gKD3BPEUEUCEzPBtytMS4T9vNnqt2j3AijSphcdB8 M=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 14 Mar 2021 20:06:32 -0700
X-QCInternal: smtphost
Received: from nasanexm03g.na.qualcomm.com ([10.85.0.49])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 14 Mar 2021 20:06:32 -0700
Received: from nasanexm03d.na.qualcomm.com (10.85.0.91) by
 nasanexm03g.na.qualcomm.com (10.85.0.49) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 14 Mar 2021 20:06:32 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03d.na.qualcomm.com (10.85.0.91) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Sun, 14 Mar 2021 20:06:31 -0700
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BYAPR02MB4229.namprd02.prod.outlook.com (2603:10b6:a02:fd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 03:06:24 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::7980:b3e8:c439:fad6]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::7980:b3e8:c439:fad6%4]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 03:06:24 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v8 29/35] Hexagon (target/hexagon) translation
Thread-Topic: [PATCH v8 29/35] Hexagon (target/hexagon) translation
Thread-Index: AQHW/d3GDdLGZmOd1UesCq0DZKzEA6pYcSAAgCbAjECAA7mcgIABp3tA
Date: Mon, 15 Mar 2021 03:06:23 +0000
Message-ID: <BYAPR02MB4886A6D9B6D4D88253B5FC2BDE6C9@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <1612763186-18161-30-git-send-email-tsimpson@quicinc.com>
 <152e99c9-675a-1fc8-c44c-e80d5af8ce70@linaro.org>
 <BYAPR02MB4886C193F014511DDCCDC7EADE6D9@BYAPR02MB4886.namprd02.prod.outlook.com>
 <889ed981-29e6-357d-48ae-6d3bb8f63ff3@linaro.org>
In-Reply-To: <889ed981-29e6-357d-48ae-6d3bb8f63ff3@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [70.115.140.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5d173bfc-c8ad-4423-baee-08d8e75f5113
x-ms-traffictypediagnostic: BYAPR02MB4229:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB42294B391D6A5A6DF9B6CACBDE6C9@BYAPR02MB4229.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: I6HwaxGnd4tzf1RKEB6tGDgXfvY03rOkkuLHBG1D1VDDKBnsM1vuNUmyUNpq9gWp7wT6p+eY18DOvBydQszIDDzEgXmPFZIZpwYGFFpTUGUu2FDrqJd0fh008j4gtr16TiltToNrWooS4O1jluKdCPaFN6P/Seygqk9aa+/Tkl1waGHjAgEuigj2E8leD9j0t+wo7xmo3yQlw3cdRJKtguUnnT6wDl/x4oroYY5YQyH27I4L1Ud6ZAWN3KcdMcrl2JCAGavwwWg881mARbFWw8qA2zOP0U7zEcOy7OrLAEYWcDlcFWyj2YBsL+PL3n/HLZBMLl5Iwz6oL5am8wfx/9XjPAtMuUhWzs/dTpwbd9pOe67o0yHav9fQJTP3D4/5ATv/24efP5gnJtdmBZ8kXcgkCmyMRHsuGc5ABiXR7l9jUpmxTiL99mBE3nHd9zFLqeg0/zdjAyLzLXi0Ut5hauswolpL1UHc4h5tb1ZB3aERgRS2Dr1NOgOK6Te7fUcpKEU6UH8Y36iylgKoLilC8+luiKIlem3Ql14TdqZD36qrrXcW5LN07kMg92FoRZsY
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39860400002)(396003)(376002)(366004)(4326008)(186003)(9686003)(26005)(86362001)(55016002)(66556008)(107886003)(66446008)(76116006)(6506007)(53546011)(66946007)(66476007)(71200400001)(316002)(5660300002)(52536014)(110136005)(2906002)(54906003)(478600001)(8676002)(8936002)(7696005)(33656002)(83380400001)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?aGplQ2g5Vy90QWVSV1NxU0NjbUJyRFVjRS85bUVtMytLdDlkYUN5eWVmYnhP?=
 =?utf-8?B?L1BSaWVMOTRWVXBEalI4OHR3aDhiTmlEWHQ4bldYei8rZ3hyRzRhcWRtYndm?=
 =?utf-8?B?aURoZHBPNGw5enR1dkJ5SklLcTZCQ0pIcE9xMFVBTzFRaHJNRzhWMTltcjFM?=
 =?utf-8?B?YmtsKzZtbEdLZUs4MldvRm9kVHYzVzNXcjhnOGFNbFIyWGp1azZDQWJXa1U3?=
 =?utf-8?B?K1M2SjlzN3NYSHU1dWR2cGN2eU9WMFVsSGZpNmdPcW1xRnQybEVVRnF5eHJZ?=
 =?utf-8?B?aktQNWxJTWlYeDkzZGFub1dYcWtEVktOZjN4bnlRMDh2R29WM25wZlcweXA5?=
 =?utf-8?B?dVFHZ1FjVHpXVWYySWRXZklOamlmVkgvS2NGNHc4RDIxd09OVkdvNGZIamtU?=
 =?utf-8?B?WVZqVktwQWJnOGRTeVloZnhMVTVXcW5aM3E4OXlObittZDAxaTlWVmlFamxQ?=
 =?utf-8?B?SkE2WG0zYkhHRFpKQ2JkV3ZCQWtNWDg3OTdsWURGNU40Sll6S2IvOVdLdlps?=
 =?utf-8?B?clJRbUtUa1MyT3hRbXBrTTRkeGZNWWxJMzRSYTNoSVJYcHM5RHU4dFlCczRj?=
 =?utf-8?B?Rnd4Zk9ITlYwaGh5NEhTK2FicUdBQjFPQlgydUQ1YVkvbitWZXB0RWExOTVw?=
 =?utf-8?B?eldpRFhDNWhZSUxwaWdoWGw0LzRoRnY1YlRSRmZrQjdWNS9lVjFuWk1NZ2U2?=
 =?utf-8?B?QytNeFlKZXUyMDNCY1NrTlBMb2xpdmJzRHBma0U3K1RhYnFzd2t5Rlcrb0dT?=
 =?utf-8?B?VHZpTnN5ZjI2NDVsb2JJdjRZdmhnbXp1NVBpNGNBRnVwSkRQYjQycWtnRzd3?=
 =?utf-8?B?OHdGdUN6ZjdXczBYUXpxcHZqUTR4WSsybzAzRnphKzloL1pCL3cvVmhMT281?=
 =?utf-8?B?MitEbmpSZlN1V0tYUlZZbnZNaFdwa3FXZHdmcHFxcGtCbmxSZzRtWi9zV0Zj?=
 =?utf-8?B?OGxZOUplNWJpbDJZK1NORlZ1LzhURWJ1WUhoek5oc1dyQWNRbGNiSHFTTEtU?=
 =?utf-8?B?aFpnWVFiTzBNazNFTUxBK2w3dXRKakE0ajR3YWZhVkppU0FBN0JiNzhRWFZ3?=
 =?utf-8?B?dlhVajUvVmhKcXpmdTJNK1Jha0pRZjR5WFJWaTFBZktNaDcwSkFZekVDVUZC?=
 =?utf-8?B?a1JCNzgzSlh0bGE4dXkzWG9LU3RCcHByc2ZMOWViMmZtTXlSazVkeW96WjVi?=
 =?utf-8?B?NEt4NEVyaWVtTkdTdHIrc3lrc3ZhZHFLL1hoZVk0SnV3TmphaUxBOTQ3KzIw?=
 =?utf-8?B?YmN0dUdydlBzbEp4RWgrQVkxcFc5am9NUGM0Q2hhaUVGYmJEVXBCUDVvdWo3?=
 =?utf-8?B?MGFZd2hXRnA4MitXUGM5RlcyZXBZMDk2YTVKRktCenNSemErUXVRVTJaeTEv?=
 =?utf-8?B?Y051QWNuNlZIU0FlUStueUI4WFhwbGhiWE9aakRSOFYzWkQvQWJsMnlIZ1hk?=
 =?utf-8?B?UGsrdVgrTjhNbHU5U0I0UmtuSDJoNndJbGwxeXdIdC9DWHkvWmhkY2tFaDJO?=
 =?utf-8?B?L1QrQmROektCNEt5QWdwamdDRWU3emVFMlpZMVVabEozbzFEV25vME16SEw3?=
 =?utf-8?B?cHNPRDU0MHo1b3c5R0Z5dUdseUVrVjkrMlArVmtROWtoRGJHckQxaVRCeDFk?=
 =?utf-8?B?SVVLRkxIVHFHZkN0akh3ZTlTZkcwR0VmRVNLWW1oMkhHaTYvVUJTSjBoNGxh?=
 =?utf-8?B?L2J1WmwvcHNxMFNHdG82S0dHZ2UvQ3laZ0VZcFQwd2dJRDJibksxTGUvQzFO?=
 =?utf-8?Q?85K6fHnXFnWGy72tZbSsGyk6+CWg5v5uwwf+kC1?=
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KGT/zyB3yHtpcgCZYAC8LOFIAO1IfQGVVnlYu6OyoAjsaGCQyJD5+LaF4aVURNQBYrrI3go5WAPk2x4yx/ZK8ouLTedFsytHuzRcdM2rzSrd28ZJOkoORWm2NkO1M98zx6tfPiJslM7jfcPnce0DIOXf/e4x+LnBjWX4J0fmFIjhLFuPk3xDBho/ZMLuEFLs3zBzSjB6b0b5Z24tBxWYQhPiUXX9qfRFfh7OOt2CJhsQ1lZXRhLd9xmlGWhoTb6C3UwcVtR2cu4y7pb8rwA+UtpRIsrMfEbMaeSd0Bd71kdp6MjQCjunT9yEV9zs0S9swz9EtvGKeZc0SXoS9n4BaQ==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JJrcy4f3ZloB6xdMGpdSB1HO1cU1jf3v11eXhukQaeo=;
 b=FlavgpFDyubkemF0yFPOpsJ3wv7ToD7SO2QxVH9t88QaEBzF0+wmuS4hJ142yvij4eqWmrUejQsaDoDib6kIRBCqIc7vCumQYwwNrllrOQHkVwa493RfJaIKvpMJEYuDV1LAHOVt3gOg5NS1ow9WGpN8vxQT3AVPMFfSGM/KOXKb2EoowcoQY/1g/ZSYajqoikfBgazByFz7CHKPSRz3/Us2SSwLVddTknVwYcTsddqFPLmTfVO6HygoffGsYEoY+o797xRt2qu0oXiaITj23uNUnMzImhGIyz2bLn6jgT0KPdJTxwwtx94CDYOrZHihqwVIcchkyCbjsFtnQ+qWXg==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BYAPR02MB4886.namprd02.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: 5d173bfc-c8ad-4423-baee-08d8e75f5113
x-ms-exchange-crosstenant-originalarrivaltime: 15 Mar 2021 03:06:23.8753 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: yWngRCY/g9W5EEUBbBRf0doF24rvzRZQ8IvPukGr01Ulom9ML4XzUvrHtIrwjIdPdF5v8B0KbqtX4OeuFgMTlw==
x-ms-exchange-transport-crosstenantheadersstamped: BYAPR02MB4229
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

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFJpY2hhcmQgSGVuZGVyc29u
IDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPg0KPiBTZW50OiBTYXR1cmRheSwgTWFyY2gg
MTMsIDIwMjEgNzo0NCBQTQ0KPiBUbzogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMu
Y29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnDQo+IENjOiBwaGlsbWRAcmVkaGF0LmNvbTsgYWxl
eC5iZW5uZWVAbGluYXJvLm9yZzsgbGF1cmVudEB2aXZpZXIuZXU7DQo+IGFsZUByZXYubmc7IEJy
aWFuIENhaW4gPGJjYWluQHF1aWNpbmMuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY4IDI5
LzM1XSBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgdHJhbnNsYXRpb24NCj4NCj4gPj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hh
cmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+ID4+IFNlbnQ6IFN1bmRheSwgRmVicnVhcnkgMTQs
IDIwMjEgNzowNCBQTQ0KPiA+PiBUbzogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMu
Y29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnDQo+ID4+IENjOiBwaGlsbWRAcmVkaGF0LmNvbTsg
YWxleC5iZW5uZWVAbGluYXJvLm9yZzsgbGF1cmVudEB2aXZpZXIuZXU7DQo+ID4+IGFsZUByZXYu
bmc7IEJyaWFuIENhaW4gPGJjYWluQHF1aWNpbmMuY29tPg0KPiA+PiBTdWJqZWN0OiBSZTogW1BB
VENIIHY4IDI5LzM1XSBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgdHJhbnNsYXRpb24NCj4gPj4N
Cj4gPj4gT24gMi83LzIxIDk6NDYgUE0sIFRheWxvciBTaW1wc29uIHdyb3RlOg0KPiA+Pj4gKyAg
ICBjYXNlIERJU0FTX05PUkVUVVJOOg0KPiA+Pj4gKyAgICAgICAgZ2VuX2V4ZWNfY291bnRlcnMo
Y3R4KTsNCj4gPj4+ICsgICAgICAgIHRjZ19nZW5fbW92X3RsKGhleF9ncHJbSEVYX1JFR19QQ10s
IGhleF9uZXh0X1BDKTsNCj4gPj4+ICsgICAgICAgIGlmIChjdHgtPmJhc2Uuc2luZ2xlc3RlcF9l
bmFibGVkKSB7DQo+ID4+PiArICAgICAgICAgICAgZ2VuX2V4Y2VwdGlvbl9kZWJ1ZygpOw0KPiA+
Pj4gKyAgICAgICAgfSBlbHNlIHsNCj4gPj4+ICsgICAgICAgICAgICB0Y2dfZ2VuX2V4aXRfdGIo
TlVMTCwgMCk7DQo+ID4+PiArICAgICAgICB9DQo+ID4+DQo+ID4+IERJU0FTX05PUkVUVVJOIHNh
eXMgdGhhdCB3ZSBoYXZlICphbHJlYWR5KiBleGl0ZWQgdGhlIFRCLiAgTm9uZSBvZiB0aGUgY29k
ZSB5b3UgZW1pdCBoZXJlIHdpbGwgYmUgcmVhY2hhYmxlLg0KPiA+DQo+ID4gSXNuJ3QgdGhpcyBj
YWxsZWQgYmVmb3JlIHRoZSBUQiBlbmRzPw0KPg0KPiBZZXMsIGJ1dCBESVNBU19OT1JFVFVSTiBz
dGlsbCBtZWFucyB3ZSd2ZSBhbHJlYWR5IGV4aXRlZC4NCj4NCj4gSnVzdCBsaWtlIGNhbGxpbmcg
YWJvcnQoKSBpbiBDIG1lYW5zIHRoYXQgd2Ugd29uJ3QgcmVhY2ggYW55IGZvbGxvd2luZyByZXR1
cm4gc3RhdGVtZW50Lg0KDQpUaGVuIEknbSBtaXNzaW5nIHNvbWV0aGluZyBiZWNhdXNlIHRoZSBj
b2RlIGVtaXR0ZWQgaGVyZSBkb2VzIGdldCBleGVjdXRlZC4gIEkgdGhvdWdodCB0aGUgdGJfc3Rv
cCBmdW5jdGlvbiBpcyBhIHBsYWNlIGZvciB0aGUgdGFyZ2V0IHRvIGFkZCBjb2RlLiAgU2hvdWxk
IEkgcHVzaCB0aGlzIHVwIHRvIGFsbCB0aGUgcGxhY2VzIHdoZXJlIHdlIHNldCBjdHgtPmJhc2Uu
aXNfam1wIHRvIERJU0FTX05PUkVUVVJOPw0KDQoNClRheWxvcg0KDQo=

