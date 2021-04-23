Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A83CC3693D3
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 15:39:03 +0200 (CEST)
Received: from localhost ([::1]:57030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZw1O-0000a3-MP
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 09:39:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vilanova@imperial.ac.uk>)
 id 1lZtVy-0001Nk-O4
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 06:58:26 -0400
Received: from smtphub1.cc.ic.ac.uk ([2a0c:5bc0:80:117::79]:44166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vilanova@imperial.ac.uk>)
 id 1lZtVw-0002wW-A5
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 06:58:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=imperial.ac.uk; s=main01; h=MIME-Version:Content-Transfer-Encoding:
 Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:
 From:Sender:Reply-To:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3K443+kWAK9fTwjawyqNB7srU4C5YwOC/5DioEdGyOY=; b=vfzPqJ/mfhFOSjOTHZZ+bPoTFv
 xuD/660CDJNSbrDHXVSQhzg7AUhOLno3FSo88srPIVLcTHfdZB5Y4UXPBp4PL9ibK9nfmJ6nSIP7K
 mVSLthuyH6U4inVmkgDVWFykrTXvgfToqPhou2Zcv1Sd5lllzqg67VUsK/IIkM77OZ3o=;
Received: from mail-db5eur03lp0203.outbound.protection.outlook.com
 ([2a01:111:f400:7e0a::203]
 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by smtphub1.cc.ic.ac.uk with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <vilanova@imperial.ac.uk>)
 id 1lZtVk-0002o8-AX; Fri, 23 Apr 2021 11:58:12 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z/a8ETQGa0nFCkT19zhOfVvn05KEBqncS6QCkoqwZ/Ik1ArLXxOm+8SAuNYEkzk16gWGbE6J+nbbIrw9dRZhXN8zvLa0eibCP0eug1PjA3NYhP1wsnbx832Ci0LDDafWMSj0GupUQOZWym2EEu2MCP6s9y6Bc9XwYwMuoK+xoKYp7uC799iKs9nX/D4TD68b3D5GIbAowRD3U+nPczAJVLQ2s6plMRFqRa9aa5MZ8868I37Qak14RrjTZttCQsfgokByrv2Ybw15kHMJ1qhCltPBrlbF3y3Gd7I52otn674tVNO5H1vWJvzxaOmI4ifh/6EjD5U3WL5ooCLeJQF96g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3K443+kWAK9fTwjawyqNB7srU4C5YwOC/5DioEdGyOY=;
 b=B9bj7ZCdAlhPCp96bqYMQn97ekqQjvq8wAF1ILRGqUEiacS2Dj0TLCOTV+TTuTKsuBpRiTujbfPnMBde7gxIxvuyiKchvBR9RwdF+w9WBoJ84Qs4Ei2OTpJOAHbRfGqb3/S40LyYXiR0xH0I5tgadFlPKFF+x/R3FymSs/LL0ENpeZq7o6grsLTMFSeiXABptXdneZxAMA8/iJR+mvGgvr1Yz1d6GCKotoBvHorP6HV1vAOPqFUpMGh8aIII4FgyyxbrdUu1X/nqqMrjY+cGlekvu/mkg9NsEqv6uRGKEYpfw17bkaBks5rIw3CSKuLwwiE/bso19US2aHuJX0D30w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imperial.ac.uk; dmarc=pass action=none
 header.from=imperial.ac.uk; dkim=pass header.d=imperial.ac.uk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ImperialLondon.onmicrosoft.com; s=selector2-ImperialLondon-onmicrosoft-com; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3K443+kWAK9fTwjawyqNB7srU4C5YwOC/5DioEdGyOY=;
 b=MGPKJjG0ZwIjm8qWNUDzrRtXkVDWtYCRsFIkppkJunR+M2haknAtar4cskHDZsz6+Wv5FTnzlNOEP5QeVEkbC1dYe9i2lCx1+FOv6FJr0j1Kytsb/yM/RSo8N8pA+Gurl9bX9azPpdW8eOf2S5fOVn3X9jH4F9KMGlgXfrjBFhI=
Received: from VI1PR06MB5935.eurprd06.prod.outlook.com (2603:10a6:803:d3::29)
 by VI1PR0601MB2143.eurprd06.prod.outlook.com (2603:10a6:800:2f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Fri, 23 Apr
 2021 10:58:10 +0000
Received: from VI1PR06MB5935.eurprd06.prod.outlook.com
 ([fe80::9d3c:7146:9f30:dfc1]) by VI1PR06MB5935.eurprd06.prod.outlook.com
 ([fe80::9d3c:7146:9f30:dfc1%7]) with mapi id 15.20.4065.024; Fri, 23 Apr 2021
 10:58:09 +0000
From: "Vilanova, Lluis" <vilanova@imperial.ac.uk>
To: "stefanha@redhat.com" <stefanha@redhat.com>, "alex.bennee@linaro.org"
 <alex.bennee@linaro.org>
Subject: Re: trace_FOO_tcg bit-rotted?
Thread-Topic: trace_FOO_tcg bit-rotted?
Thread-Index: AQHXMEelsfANEBa11UKwL5G7dX5s1KrB/ocA
Date: Fri, 23 Apr 2021 10:58:09 +0000
Message-ID: <30c46fec5a5e5cf3d3f31c84da0e7f1efb0e8fcd.camel@imperial.ac.uk>
References: <87eefnwd0l.fsf@linaro.org>
 <032cba5b-1b8a-ef47-dd3d-6e4caef1223b@vivier.eu>
 <87czv3s9i3.fsf@linaro.org> <YHRgkuNwPhiRz6vn@stefanha-x1.localdomain>
 <87r1jfmhnr.fsf@linaro.org> <YHVXSJs6JpCnSvqw@stefanha-x1.localdomain>
 <87o8eimszx.fsf@linaro.org>
In-Reply-To: <87o8eimszx.fsf@linaro.org>
Accept-Language: ca-ES, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.3-1 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=imperial.ac.uk;
x-originating-ip: [129.31.225.65]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4e95c230-850b-49f5-6f8d-08d90646aecf
x-ms-traffictypediagnostic: VI1PR0601MB2143:
x-microsoft-antispam-prvs: <VI1PR0601MB21439012A8313277BB49E064E5459@VI1PR0601MB2143.eurprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sJTR2rbALDTM82EGjmfvXtCYZbgEry3r+2TV9tD24ivJ3pC88KzuDDaBuZJdfUxGS6/Tm5cuu1ifszH/+utOQOB3cAVJzGuN5SUDCRslPk1CM1Kax/CXzdvvWotiRSGoY2WR0VVNC5G0p3rWRxESHnMEx7ZyIy+fzrJANNZb+ejXC5hDvmFe5NH8LMKIgw9f/RlKREDK2HRxIJiz7QV8Tka9pgA9YfJaP9LvQP2Ud9lRTuiqGCPdBfGrJe3Bn0nvDwWHL3ArCGZQm3+tCWJ6DC/O/6XUlOGqaJSPp1+Cdw/zXrNq0ooFgs1r7CMUDFcu8gwZE9YX1Sg8J7p/wEijp8DItU76VC/LX5/gSiY3nedrd+H9QtmSOfO10TNA/fbqLd2sDfzChfSBZgVthsWVp3ROIs3/HlFhs+J2GbFdGol8iDWbxojbR/hEDbqgKv1sjJ301y3LSN0tkkanQIj7jcz8+NVkqzyGMKHOQII/phAH19CMGvI3MjkP6vHwVQQ++l352G8clYdtK5awuBsAuqxks7/cQ63xnY7sDTsEa+pRev9ukU4I8+cACl+qVxMCw1Moh8IP/Euqra/NNDdEflNOZ6DsuU8EpIqzFH5wDFA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR06MB5935.eurprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(136003)(396003)(346002)(376002)(316002)(71200400001)(786003)(6512007)(83380400001)(478600001)(110136005)(8936002)(2906002)(66446008)(6486002)(54906003)(8676002)(91956017)(2616005)(186003)(66556008)(122000001)(64756008)(86362001)(6506007)(38100700002)(76116006)(66946007)(36756003)(66476007)(26005)(5660300002)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?OXc3cUpZdGlBL2F2TEx5VTZBUFd0RnNOTFNtVXo4Wk5ibklMUWczQjNmSHRm?=
 =?utf-8?B?Ny9LTFlCTkprdmNhUkxaemFraStiNVpocFJLdStKQXlSaHVwQVhrWkhnQ2w5?=
 =?utf-8?B?S1RjeHFIbExRaCtkQ1JyVTRGOXd4R1R2R1p0ZFZjYWlWTDN6N1VtdmIwZkpZ?=
 =?utf-8?B?cVlra1MxUEtjbmdwcVA5SWw1eG1Yd3ZxeGRXZkx3M3MyY1BWaFcxakRYSXBa?=
 =?utf-8?B?dnVyQzJibzJmUU8rUDBvaVJ2ZERsSEM3L0tkWTd3anVmekVlS0ZLT2tuSlpR?=
 =?utf-8?B?ZG1vOHd6UmZmdU5jaGtBMGVFOU9WYWFWcDdNaGtud2NORmZoSzR2dnJwTHE0?=
 =?utf-8?B?eWxQakgyelN4eFRFYmNXNk05NjV4bEFuRWRyeGlwemNuQkk0RXFqNWROeXgy?=
 =?utf-8?B?aGwwTDZXWWg2OVprTUE0RHBuTXYyUksxamNLcGx1cUlyZ1lVUVNtK0M5Qk9Y?=
 =?utf-8?B?Yzl6WXpFMVNXNVVPYXJmb3ZhSUhQNXIvblpjcTlzc0NJVXNTNysvdzN2bTdX?=
 =?utf-8?B?ZVRsRUVobitDbkU4VkwyTHN3Q2huOFA1N0V0S2k1VmdFSDlKZis4ZUI1cDVZ?=
 =?utf-8?B?VFhTYnZHOS95R1dFM3o1MGhSN0Z4VU9jdlZ0U0t4RVJSMndYbVIxNGNmbVBD?=
 =?utf-8?B?amtHVXFEUVZzNVM3dHk2bUJlTkZGRW9xSFVlQkFzaFUrSWRKQ1Q4ektqYmtI?=
 =?utf-8?B?S3ZYd1RMbUFtT25vNmFZYlRNbGQ5NGsvSjgxRDZPczV2NVNiNmFINmRpemZL?=
 =?utf-8?B?Q1liZVJraGJPN3FJbStLMDhQcVhYTGtibzNNRUFpK09zZ2ZaeEdFR1ZoejRU?=
 =?utf-8?B?Vm5QMmVNQ1pFR1EzTnhibyszZnQ2eVBjUlVsMGt2OCtSRFJpTEdxb2xMVUxC?=
 =?utf-8?B?L2JCSFlheDdJU3hlT3ZhWkJMeFhKOUx2cEJUanZTdG1rR1YwS1ZjcVFZMms5?=
 =?utf-8?B?R1JZdk1XVEMyL2JiVTJ0MWU3S1I5ekhLVmNiQ1FoR3NMZ2JhaVJHMStZaTVX?=
 =?utf-8?B?RTVVdW1hU2dVRFc1RXN5Yld6YlRuOXFqLzlmRUxLV2czc3I1NUlXeksrTGNq?=
 =?utf-8?B?YkZkWU9aR0xIYThPNGRub0pHS1VzL2VrY1NyRStqZGovZmxrTHplWk56MWpY?=
 =?utf-8?B?VE1PNTlkVytITEh5Rm5zRHMxZVpXT0tRLytmNnVPbktraDRwaEFza2s2UDcz?=
 =?utf-8?B?cGN1T2o1a1BYRlZ2ZGVDQ2Q5ZnpLdTBTQ0xUVWNkbGlhdUpjMDg2S3BNMGt1?=
 =?utf-8?B?V0R6SzhrTFNrNDUrR0h1T1J3VFJCVjFzNmYrRGYzT2dhQlRxckdPQk1YL3Vs?=
 =?utf-8?B?R2I1cktSZEhORnA5bXJaMzc4VGk0SE1lU09nazhYSml1M0V5N3VtNzNoTUM2?=
 =?utf-8?B?azI4TmxyMlE3Wjhpdi9tZE83S1F1dkFLL2dYb09pU3IzcUw4bm9Fb0lLSEI5?=
 =?utf-8?B?eldZTE1uR2FUa3hlRnpsRzlib0F0c3QrbnA1SHRSWHFIWU5Fa1hhNGJxRXRJ?=
 =?utf-8?B?WE1pR1lWVDhHSHArVll6R1kvM0E1WkRxejh1WnkwVFREREN0OVdQM1V5TmVX?=
 =?utf-8?B?cVZWVVVEZCtYSVd3cGNaSEFEemNDL05EU2M5ZlBFTnJSbzJWSFNSVWtac0hP?=
 =?utf-8?B?VUdFNUFzSDljQWVBRmtvSWdFTFltZHBwY0hPTkRDNmNESUUxWU40UVl3NTdG?=
 =?utf-8?B?aDVxQ1hHYUhsYlA4RmZwQ1UreCt0aE5jRnNsdzlyaWhVUlVzeGNGbnJSOW1v?=
 =?utf-8?Q?PRVgC99MX/NsOwP3/DvDT6rdWY+QreqCMdLzbMJ?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <4E06A2617653E048BE1E46321BEB95FE@eurprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: imperial.ac.uk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR06MB5935.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e95c230-850b-49f5-6f8d-08d90646aecf
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2021 10:58:09.8734 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2b897507-ee8c-4575-830b-4f8267c3d307
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 26Gal9LZJImSkU3Z/v5+CebR//n/eUwBGaMWdCG5pFp2Yz8rweFBfrHOpaJ8/7Zy54DVCMi9l38UCC6ch4KVjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0601MB2143
X-IC-MsgID: 1lZtVk-0002o8-AX
Received-SPF: pass client-ip=2a0c:5bc0:80:117::79;
 envelope-from=vilanova@imperial.ac.uk; helo=smtphub1.cc.ic.ac.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 23 Apr 2021 09:34:55 -0400
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
Cc: "matheus.ferst@eldorado.org.br" <matheus.ferst@eldorado.org.br>,
 "laurent@vivier.eu" <laurent@vivier.eu>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RWwgZHQuIDEzIGRlIDA0IGRlIDIwMjEgYSBsZXMgMTA6MjUgKzAxMDAsIGVuL25hIEFsZXggQmVu
bsOpZSB2YQ0KZXNjcml1cmU6DQo+IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNv
bT4gd3JpdGVzOg0KPiANCj4gPiBPbiBNb24sIEFwciAxMiwgMjAyMSBhdCAwODowNjo1N1BNICsw
MTAwLCBBbGV4IEJlbm7DqWUgd3JvdGU6DQo+ID4gPiANCj4gPiA+IFN0ZWZhbiBIYWpub2N6aSA8
c3RlZmFuaGFAcmVkaGF0LmNvbT4gd3JpdGVzOg0KPiA+ID4gDQo+ID4gPiA+IE9uIEZyaSwgQXBy
IDA5LCAyMDIxIGF0IDA1OjI5OjA4UE0gKzAxMDAsIEFsZXggQmVubsOpZSB3cm90ZToNCj4gPiA+
ID4gPiANCj4gPiA+ID4gPiBMYXVyZW50IFZpdmllciA8bGF1cmVudEB2aXZpZXIuZXU+IHdyaXRl
czoNCj4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IExlIDA2LzA0LzIwMjEgw6AgMTg6MDAsIEFsZXgg
QmVubsOpZSBhIMOpY3JpdMKgOg0KPiA+ID4gPiA+ID4gPiBIaSwNCj4gPiA+ID4gPiA+ID4gDQo+
ID4gPiA+ID4gPiA+IEl0J3MgYmVlbiBhd2hpbGUgc2luY2UgSSBsYXN0IHBsYXllZCB3aXRoIHRo
aXMgYnV0IEkNCj4gPiA+ID4gPiA+ID4gdGhpbmsgd2UgYXJlDQo+ID4gPiA+ID4gPiA+IHN1ZmZl
cmluZyBmcm9tIG5vdCBoYXZpbmcgc29tZSB0ZXN0IGNhc2VzIGZvciB0cmFjaW5nDQo+ID4gPiA+
ID4gPiA+IGNvZGUNCj4gPiA+ID4gPiA+ID4gZ2VuZXJhdGlvbi9leGVjdXRpb24gaW4gdGhlIHRy
ZWUuIEkgdHJpZWQgYWRkaW5nIGEgc2ltcGxlDQo+ID4gPiA+ID4gPiA+IHRyYWNlIHBvaW50IHRv
DQo+ID4gPiA+ID4gPiA+IHNlZSBpZiBJIGNvdWxkIHRyYWNrIEVSRVQgY2FsbHM6DQo+IDxzbmlw
Pg0KPiA+ID4gPiANCj4gPiA+ID4gTGx1w61zOiBhcmUgeW91IGhhcHB5IHRvIGRlcHJlY2F0ZSB0
Y2cgdHJhY2UgZXZlbnRzIGluIGZhdm9yIG9mDQo+ID4gPiA+IFRDRw0KPiA+ID4gPiBwbHVnaW5z
Pw0KPiA8c25pcD4NCj4gPiANCj4gPiBUaGF0IHNhaWQsIEkgaGF2ZW4ndCB1c2VkIHRoZSBUQ0cg
dHJhY2UgZXZlbnQgZnVuY3Rpb25hbGl0eSBhbmQNCj4gPiBtYXliZQ0KPiA+IEknbSBtaXNzaW5n
IHNvbWV0aGluZyBvYnZpb3VzIHRoYXQgTGx1w61zIHdpbGwgcG9pbnQgb3V0IDopLg0KPiANCj4g
SSd2ZSB1cGRhdGVkIHRoZSBDYyB0byB3aGF0IEkgdGhpbmsgaXMgTGx1w61zIGN1cnJlbnQgZW1h
aWwgYXMgSSB3YXMNCj4gZ2V0dGluZyBib3VuY2VzIGZyb20gdGhlIG9sZCBhY2FkZW1pYyBhZGRy
ZXNzLg0KDQpIaSBmb2xrcywgbG9uZyB0aW1lIG5vIHdyaXRlOyB0aGFua3MgZm9yIHRyYWNraW5n
IG1lIGRvd24gOikNCg0KSSB0aGluayBpdCdkIGJlIGdyZWF0IHRvIGRlcHJlY2F0ZSBUQ0cgdHJh
Y2luZyBpbiBmYXZvdXIgb2YgdGhlIHBsdWdpbg0KaW50ZXJmYWNlLCBwdXNoaW5nIHNvbWUgb2Yg
dGhlIGJ1cmRlbiBvdXQgb2YgcWVtdS4NCg0KSSBoYXZlbid0IG1lYXN1cmVkIHRoZSBwZXJmb3Jt
YW5jZSBvZiB0aGUgcGx1Z2luIGludGVyZmFjZSwgYnV0IEFGQUlSDQpUQ0cgdHJhY2UgcHJpbnRz
IGFsc28gdXNlIFRDRyBoZWxwZXJzLCBzbyB0aGVyZSBzaG91bGQgbm90IGJlIGEgbG90IG9mDQpk
aWZmZXJlbmNlLg0KDQpBcyBTdGVmYW4gcG9pbnRlZCBvdXQsIHRoaXMgbWVhbnMgcGx1Z2luIHdy
aXRlcnMgd2lsbCBoYXZlIHRvIHdyaXRlDQp0aGVpciBvd24gVENHIHRyYWNpbmcgY29kZS4gSG9w
ZWZ1bGx5LCB0aGUgcGx1Z2luIEFQSSBjYW4gYmUgZXh0ZW5kZWQNCnRvIGludGVncmF0ZSB3aXRo
IHFlbXUncyBsb2dnaW5nIGJhY2tlbmQgKGl0IHNlZW1zIHFlbXVfcGx1Z2luX291dHMNCmdvZXMg
c29tZXdoZXJlIGVsc2UpLCBhbmQgY29tbW9uIHBsdWdpbnMgY2FuIGJlIGtlcHQgb24gYSBzZXBh
cmF0ZSByZXBvDQp1bmRlciB0aGUgcWVtdSB1bWJyZWxsYSBmb3IgZWFzaWVyIHJldXNlIChlLmcu
LCB0byBwcm92aWRlIHRoZSBzYW1lDQpmdW5jdGlvbmFsaXR5IGFzIFRDRyB0cmFjaW5nKS4NCg0K
DQpDaGVlcnMsDQpMbHVpcw0K

