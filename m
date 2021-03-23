Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBCF346222
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 15:59:15 +0100 (CET)
Received: from localhost ([::1]:47946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOiV0-0002al-P4
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 10:59:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lOiTj-0000s4-WB
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 10:57:56 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:6539)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lOiTh-0006q6-Aw
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 10:57:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1616511473; x=1648047473;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+TClo83w20JqSoT+bC+/Bgxxp5Zn4jkeoHH+iqAFjdI=;
 b=N1dRYc5pm7gtDZu2dJX9cxIcYhGaXDU60hFMHcucB8BboDd9q4Vx0P19
 yqfMLcjmNaWHYPq+ZxLlyi1SDqALs6QIBaObEC0OwfFEWKEaaUg8c1Zmg
 +bGTJNLHIJyWXBM/O+8im7fen82f0Mmvj4/7iAVJAk/ohXVirOhdqj1Px E=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 23 Mar 2021 07:57:49 -0700
X-QCInternal: smtphost
Received: from nasanexm03f.na.qualcomm.com ([10.85.0.47])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 23 Mar 2021 07:57:49 -0700
Received: from nasanexm03a.na.qualcomm.com (10.85.0.103) by
 nasanexm03f.na.qualcomm.com (10.85.0.47) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 23 Mar 2021 07:57:49 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03a.na.qualcomm.com (10.85.0.103) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Tue, 23 Mar 2021 07:57:49 -0700
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by SJ0PR02MB7679.namprd02.prod.outlook.com (2603:10b6:a03:31a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 14:57:48 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::859:d735:9964:608]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::859:d735:9964:608%6]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 14:57:48 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Yuri Gribov <tetra2005@gmail.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH] [NFC] Mark locally used symbols as static.
Thread-Topic: [PATCH] [NFC] Mark locally used symbols as static.
Thread-Index: AQHXH1VlLunjUoSMcEGNtvCszxFXUqqRqBiA
Date: Tue, 23 Mar 2021 14:57:47 +0000
Message-ID: <BYAPR02MB4886B31AB72D41C5B7344DBFDE649@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <CAJOtW+5DDMsr8QJQxaa1OHT79rpMJCrwkYbuaRTynR_ngUxgHA@mail.gmail.com>
In-Reply-To: <CAJOtW+5DDMsr8QJQxaa1OHT79rpMJCrwkYbuaRTynR_ngUxgHA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [70.115.140.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 65b96fbc-a184-4557-ac64-08d8ee0c0606
x-ms-traffictypediagnostic: SJ0PR02MB7679:
x-microsoft-antispam-prvs: <SJ0PR02MB76795E1C7EEB33327C3503EBDE649@SJ0PR02MB7679.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: D10I4bWGkRTfV2DpiViRwiKkbuKnoLgCD7ltvKCxiaR0xeCxcE++PoUP6Y/dbKcjiekcCmad2RjFwJTfE/ZUG3/r8qp0mGJIqOr6RPX20S9m2SWUMz7XI4SrOVK5Sue4TXHKPIxiYjpIpbHWlC/+Jbeb86wSmVEK0MO5poOtjDhMLZpRvoE69zcGVcScNhzORRKLSoRMcYmyo30igL1DA8ZikKdAsM2TauDMzyDAMYNWKH/E5w9AliErGH4s3deMpHSs1rXWJLP6wvpMdu3k8L+QtLLB7NaMJ2tIsJAeTzJf3C0k9Z5YbB/KYkyUolOOeTrSnJuQmbTS699NoDXarYUDuYBRGVYVxnkmWs3g20D2mEhaoV35R9PrF86s2dvIh5NPaVxvtKNhy234Du1ZzA+FsCtMqQOQLnn+Ch8By8GwbnTn+M96t1goXTTVX4mHw+HKDq0bmjxAWEkt+DQWgkXirbNRAjZnHegGnoSCfYc7d6oawexBRNHDpCpNWcX6BapE1sv8YFrc1cgR3VXZBwyILR3Zpy/2rm4DWe02G+csInTSl+lpMeJD09Wl8AVZ9sOOKe8NWNVcn1KgtaQAZ8AOc0EnLbXYmHi1NAEBT5reJg1b0+aNcXBc45U8QneQqBMJbXsC7Y1XD/B80oxeHoddzN/vesQ5asXi+F+YNYI4ialL4pU2kF1gH7pOjWHRfrRDIxIIkxWeUwNr2el+UdAkrJbirgvPa7zX72tL7mx2TuXqwrpctxvDaVyg+pel
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(39860400002)(366004)(136003)(4326008)(478600001)(83380400001)(5660300002)(8676002)(8936002)(55016002)(66556008)(7696005)(71200400001)(53546011)(66476007)(86362001)(66446008)(64756008)(7416002)(66946007)(76116006)(38100700001)(6506007)(9686003)(52536014)(966005)(54906003)(33656002)(110136005)(2906002)(316002)(186003)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?dkY4TVFPMEJnOGJKMTVXMTdiNkZEeUQwWmtSaEt2blVaRXhiemlmMVVmZXNF?=
 =?utf-8?B?R2Z0K21HU21XTlhaL0N0VDBoZkp5aDQvV2lpZWhiRGRFVWtla0tRZ3psVmcw?=
 =?utf-8?B?TlRnZG5jUFZMcG9LMmhRZlY0dFBkTDRjcVFCT2NQU1ZvY0VwZWtwZGRWVERU?=
 =?utf-8?B?WFI1Smo4QS9UWk04emg4QUoyS3RrTk5NK2o1a0Z2L3NiYm1mSFk1RnBZVUFa?=
 =?utf-8?B?NkNmMHBhYkNzcm83S1dpQlM1MTRiM3dYcG1wekhvbjlUU0R3dWVOVkgwdi82?=
 =?utf-8?B?d2JwOU52Qk05R1BQS0EwNHF4aHVZaFZncE4zRlhranFSNXhDL3UvL1ROakdl?=
 =?utf-8?B?MU80N29rTVhsNzVPLzd3S1JnWGs2VU1ZeitRbmtYRTBhYmdrZVFVZGtnRW8r?=
 =?utf-8?B?LzdTMFp6Q2w0eU5ZSkd3MGwyRlMvRTZCQ2FncjZkNi9ZVVUyWHpvVk9FWnhz?=
 =?utf-8?B?OE45Vmw2elNpZEIzaG5EVlZxbkExMk11UU9ZOEY4U1JKZHRlZnhwSWxEUVBI?=
 =?utf-8?B?RWszaDY5US9rZk91dVh1cUR3ekxDUWFRR2pjbnF6NWU2NmhXQVgyeTVlRTNa?=
 =?utf-8?B?VERpSmlDV2RmWmdoenJjT3BBM28zTTVDdmRLVXBrSjVzMUFIMEhPamNjWk92?=
 =?utf-8?B?ZWY4QXRFVWtJRzMxdUp6VmxkZUhuYTdmNXhCZWErTVFWd1B6UjZTdVFGbldj?=
 =?utf-8?B?YzZPN3pBY0cvSGZla29ZZy95dTBDK1dud2tWVlN3REY3cktaeWVLSmx3NmJx?=
 =?utf-8?B?TCs5OWt2Q0s3bm1MUVRkS05hU000eXhCcTc2c05EOE8yYkJna3F6R3JTSkpP?=
 =?utf-8?B?OWo0Wko3MVZYaEJ2K0dSWEdFdTFRUjRxM2RiMWhIUlRnc01GNVpUbStKeGtv?=
 =?utf-8?B?d1RUSXZDYVdwSmZkMmpkTm5pY3c5Undpdy9vaHcxUjRWWXBzWm1oZkRzRTUw?=
 =?utf-8?B?NXYvMzFJRXFwYmtOSVlDdlVEU3V5RU96U0FxU24xUytyeVhGcU9VSDdTSEU5?=
 =?utf-8?B?QzVHWkRSNkFRMlRNZjgrQ0JwdmFhMW56Y01pOStVbjh2TFo2WUJOK1pSYTQ1?=
 =?utf-8?B?Zm9EY3VjMVlVN0hTVjkwek95eWszQ3NJdGZIbm9pQUpwZGlicG8yM1M1Sk5i?=
 =?utf-8?B?SHQwa003eEJzeG41Zk8zcjBFZ2RhK3ByVmJ6OHQ2SFNkVGQvZjFnU1VLaWZn?=
 =?utf-8?B?RWphYTVpMFpJVzVUeFFhTEhDTUwwRzVDbEVmcDFlYTRMRFNuSzl1ZjZOVVh6?=
 =?utf-8?B?QjE4Qy9nVHB2emx1ck5NVW9VS1RMTEt4S1BmMGdKdFBuT2lzYUVWT1NxUEZw?=
 =?utf-8?B?c2JFWC9KTHoxVWEzTHhKVUtJU1BnZFV1QmY4c1pWU2lrb1dUYXB5b2V3YzVO?=
 =?utf-8?B?Z29BMXE5aXZwcDU4Y05FYmVZRlhVSmpvZ3E4bkRGVUdJZHU4V0M1Q2FXakV2?=
 =?utf-8?B?MzdqVWc3YXVXVFNPbEtjbitWRDQrcWN5aVVYcEZsdmh6K0Z0aWRXYjRaS0RO?=
 =?utf-8?B?cmd1eU5ISHhTbnY4OW9hbjg0OFR1UFdSbnM1WlBtdTlSTzl0YXJOZlV0cE4z?=
 =?utf-8?B?U0VMd2l3N042OElYclNRbTM3MEE0b2xtMHcyNm10Wm40MmtaNGE2RlV2ODlF?=
 =?utf-8?B?ck5UZEdnZmRuK2tpNUI1N25heUpzOS9oeDVXMnRERjdQTWREa0ZNR1Ztajk2?=
 =?utf-8?B?K0RiOG9vano5ZnN3eW9WalNrbXdZMk1xdncyQXFJTCtXaTN0WXBTZnV5VHhB?=
 =?utf-8?Q?HTNs1YnNS5XbG5kEtZxNo3zwAPbDfs8DaOMR7YX?=
x-ms-exchange-transport-forked: True
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UriQUeJnG8UaZSoPWHbJz6A/eBifYFQb2iYFyeF9YRvnDi9d/MPmX8goSoXifpL9blCxP8N5/+/XdjEx/0Il/Ep9c9rdSQURWW3nVsSVWzjKAN1zZDWPg8fe8ZxMAlkGoXhf25G97JI1o8IrTBU5JaFuBrTR0S6faklzP0GkANBQxtsIJyclhYUxRil5zTzRqvL+pmw+i7mKrKy2zHTPq6BARi5ARefRPb6QcZw9aq3M4Ikm+Dbye2VwVro9/2IFeXint0yB4tJtEjKlNiEWg9uSKvxgtuHMHf9bivn+PDsSb4suYxMrcM/glBBq0SpciPp3SdsMKxDDNqKZgCaNZw==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TIKfZjvn3OfPY1VK5KbsUPhasfL0YZpBZL4x7/b/gHY=;
 b=SVhsGTxhE0wyeqVxkDH9DKPW5doQIMWzzxE2rfyKuOHI38U3yihVcxsuVVQM9TDCc3SVIzLhT+t1HZ8aAPoIaL36e4ls368nCVOf3DV/kngvenoG6Gy0AWO0qqhuf9pEDkFQNh1aRlSESvlQR2LEB4F8wZFbf9rkSBbNoy1Bq/Jzy7b3cP+mKqGahXxdyGwPoK5TmFy2SwH+33qAbtcyn/ijnnY4qpMsgFBvWvF+EZKvbLEhPBdY/TGampn3/gsZGbOfP5dhofm5L3t+romOd2AyKiKrxyFUSrOLCTK18pDd+VYMZ+mQBCiGhftnnnS5SzxOYvTmQsQ8PLTCSiL1ZQ==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BYAPR02MB4886.namprd02.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: 65b96fbc-a184-4557-ac64-08d8ee0c0606
x-ms-exchange-crosstenant-originalarrivaltime: 23 Mar 2021 14:57:47.9494 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: J1pi9nQJVLZ20B7RgFp630mfCVvbDr2Wm2d0K5AiF7Ed2HexOYsyWvuaDB4VSvz/IX8Rdp9dbPaWLqbCI6Yb/w==
x-ms-exchange-transport-crosstenantheadersstamped: SJ0PR02MB7679
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
Cc: Cornelia Huck <cohuck@redhat.com>, Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>, Max
 Filippov <jcmvbkbc@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWXVyaSBHcmlib3YgPHRl
dHJhMjAwNUBnbWFpbC5jb20+DQo+IFNlbnQ6IE1vbmRheSwgTWFyY2ggMjIsIDIwMjEgMjo1NiBQ
TQ0KPiBUbzogcWVtdS1kZXZlbEBub25nbnUub3JnDQo+IENjOiBSaWNoYXJkIEhlbmRlcnNvbiA8
cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz47IExhdXJlbnQgVml2aWVyDQo+IDxsYXVyZW50
QHZpdmllci5ldT47IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxmNGJ1Z0BhbXNhdC5vcmc+OyBD
aHJpcw0KPiBXdWxmZiA8Y3J3dWxmZkBnbWFpbC5jb20+OyBEYXZpZCBHaWJzb24gPGRhdmlkQGdp
YnNvbi5kcm9wYmVhci5pZC5hdT47DQo+IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5j
b20+OyBUYXlsb3IgU2ltcHNvbg0KPiA8dHNpbXBzb25AcXVpY2luYy5jb20+OyBQYW9sbyBCb256
aW5pIDxwYm9uemluaUByZWRoYXQuY29tPjsgQ29ybmVsaWENCj4gSHVjayA8Y29odWNrQHJlZGhh
dC5jb20+OyBNYXggRmlsaXBwb3YgPGpjbXZia2JjQGdtYWlsLmNvbT47IFN0ZWZhbg0KPiBIYWpu
b2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4NCj4gU3ViamVjdDogW1BBVENIXSBbTkZDXSBNYXJr
IGxvY2FsbHkgdXNlZCBzeW1ib2xzIGFzIHN0YXRpYy4NCj4NCj4gSGkgYWxsLA0KPg0KPiBUaGlz
IHBhdGNoIG1ha2VzIGxvY2FsbHkgdXNlZCBzeW1ib2xzIHN0YXRpYyB0byBlbmFibGUgbW9yZSBj
b21waWxlcg0KPiBvcHRpbWl6YXRpb25zIG9uIHRoZW0uIFNvbWUgb2YgdGhlIHN5bWJvbHMgdHVy
bmVkIG91dCB0byBub3QgYmUgdXNlZA0KPiBhdCBhbGwgc28gSSBtYXJrZWQgdGhlbSB3aXRoIEFU
VFJJQlVURV9VTlVTRUQgKGFzIEkgd2Fzbid0IHN1cmUgaWYNCj4gdGhleSB3ZXJlIG9rIHRvIGRl
bGV0ZSkuDQo+DQo+IFRoZSBzeW1ib2xzIGhhdmUgYmVlbiBpZGVudGlmaWVkIHdpdGggYSBwZXQg
cHJvamVjdCBvZiBtaW5lOg0KPiBodHRwczovL2dpdGh1Yi5jb20veXVnci9Mb2NhbGl6ZXINCj4N
Cj4gZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29uL2dlbl9kZWN0cmVlX2ltcG9ydC5jDQo+IGIv
dGFyZ2V0L2hleGFnb24vZ2VuX2RlY3RyZWVfaW1wb3J0LmMNCj4gaW5kZXggNWI3ZWNmYy4uMjBj
YWVlNSAxMDA2NDQNCj4gLS0tIGEvdGFyZ2V0L2hleGFnb24vZ2VuX2RlY3RyZWVfaW1wb3J0LmMN
Cj4gKysrIGIvdGFyZ2V0L2hleGFnb24vZ2VuX2RlY3RyZWVfaW1wb3J0LmMNCj4gQEAgLTQxLDcg
KzQxLDcgQEAgY29uc3QgY2hhciAqIGNvbnN0IG9wY29kZV9uYW1lc1tdID0gew0KPiAgICogICAg
ICAgICAiQWRkIDMyLWJpdCByZWdpc3RlcnMiLA0KPiAgICogICAgICAgICB7IFJkVj1Sc1YrUnRW
O30pDQo+ICAgKi8NCj4gLWNvbnN0IGNoYXIgKiBjb25zdCBvcGNvZGVfc3ludGF4W1hYX0xBU1Rf
T1BDT0RFXSA9IHsNCj4gK3N0YXRpYyBjb25zdCBjaGFyICogY29uc3Qgb3Bjb2RlX3N5bnRheFtY
WF9MQVNUX09QQ09ERV0gPSB7DQo+ICAjZGVmaW5lIFE2SU5TTihUQUcsIEJFSCwgQVRUUklCUywg
REVTQ1IsIFNFTSkgXA0KPiAgICAgW1RBR10gPSBCRUgsDQo+ICAjZGVmaW5lIEVYVElOU04oVEFH
LCBCRUgsIEFUVFJJQlMsIERFU0NSLCBTRU0pIFwNCj4gZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhh
Z29uL29wY29kZXMuYyBiL3RhcmdldC9oZXhhZ29uL29wY29kZXMuYw0KPiBpbmRleCAzNWQ3OTBj
Li41ODZlNzBkIDEwMDY0NA0KPiAtLS0gYS90YXJnZXQvaGV4YWdvbi9vcGNvZGVzLmMNCj4gKysr
IGIvdGFyZ2V0L2hleGFnb24vb3Bjb2Rlcy5jDQo+IEBAIC02NSw3ICs2NSw3IEBAIGNvbnN0IGNo
YXIgKiBjb25zdCBvcGNvZGVfd3JlZ3NbXSA9IHsNCj4gICN1bmRlZiBJTU1JTkZPDQo+ICB9Ow0K
Pg0KPiAtY29uc3QgY2hhciAqIGNvbnN0IG9wY29kZV9zaG9ydF9zZW1hbnRpY3NbXSA9IHsNCj4g
K3N0YXRpYyBjb25zdCBjaGFyICogY29uc3Qgb3Bjb2RlX3Nob3J0X3NlbWFudGljc1tdID0gew0K
PiAgI2RlZmluZSBERUZfU0hPUlRDT0RFKFRBRywgU0hPUlRDT0RFKSAgICAgICAgICAgICAgW1RB
R10gPSAjU0hPUlRDT0RFLA0KPiAgI2luY2x1ZGUgInNob3J0Y29kZV9nZW5lcmF0ZWQuaC5pbmMi
DQo+ICAjdW5kZWYgREVGX1NIT1JUQ09ERQ0KDQpIZXhhZ29uIGNoYW5nZXMNClJldmlld2VkLWJ5
OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+DQoNCg0K

