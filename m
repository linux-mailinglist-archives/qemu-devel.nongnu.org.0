Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B271A36C6A8
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 15:04:05 +0200 (CEST)
Received: from localhost ([::1]:53192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbNNk-0006wz-Qn
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 09:04:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vilanova@imperial.ac.uk>)
 id 1lbNKW-0005nw-BD
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 09:00:44 -0400
Received: from smtphub2.cc.ic.ac.uk ([2a0c:5bc0:88:101::47]:52230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vilanova@imperial.ac.uk>)
 id 1lbNKP-00023R-QS
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 09:00:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=imperial.ac.uk; s=main01; h=MIME-Version:Content-Transfer-Encoding:
 Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:
 From:Sender:Reply-To:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vEd6ECZhg57QLSk7IGEeLQtlHwTiYPqF+2IzTKWOjEs=; b=wus3Vl1cuC8hwOZaXaB1vGHgnM
 hsdjI1z0rgtq0gpkhsS1uAC/N1oRgMkOu/14r+arnpe5oAdS7ErfIwle3c4CG8gqRKpt4wA8FB972
 pd6Z3/mFh+3F0QkVqJqta8d95FnK8XlJLztSUYMzHSYjqGUyLQQFr7BGHn/dxyhkeZBg=;
Received: from mail-am5eur03lp0206.outbound.protection.outlook.com
 ([2a01:111:f400:7e08::206]
 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by smtphub2.cc.ic.ac.uk with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <vilanova@imperial.ac.uk>)
 id 1lbNKB-0007ST-IC; Tue, 27 Apr 2021 14:00:23 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z31xhLPTS/Rd8bh+00eLhef72NmR0T0w/3swDRVIP0+4PR5yrQYoquc7zCUk9XndR710std7PYIKMl8u9GpaJFvyXitkzrBbzP0cxVYBoF2t0Jfyb1D6W6Qo7DDest3FCi6uBdnSGI63cM/N1j/REPSPY+Rh+oFu+PYYDG3gFr4bVbA0L6Il5RF6u7WwWrqcG7iKXzPXTzIIqt/JmUREDSL/4RW1ibl2xt2gHoF6lsI9hMcDx2IplR438+QlGtMiZusIcGLAgcogbDMn54/IUfdkoxWp4d95BD3d49orItO6o9p1x6zkxgi0mWnUAcU6OaexpxlzLf046wJ+aubbMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vEd6ECZhg57QLSk7IGEeLQtlHwTiYPqF+2IzTKWOjEs=;
 b=RpVM0nmC++eG8eLL9Zppxg1JEOsukdccQYlQlfqPYOYxn1IIP+9lOWC9Iyb7wvSSqWGkJQMHNrobPRxOBfd9wEAh71CEwJD8TLvDI88LpWlqrkTg1vbvDH0Xqu4Hf3ODqjoM/P6+rDq7ynGD84vzql78LpgN8f7MKUEpnbkY/4aaUAcLmwR5N3x6uy8g+Mv8ubACnE8cImBlvPpGDOrk8ENYK0KAil/fT04tt85bAbaK7AvoGbvasC6p8tcShU1tAMfYsM3OXI+Q23Soiwq2xn8rDCuJw+gxLbLM459VOj7xTwXv0YVhi9CVlj7P7OqgD2e/EcbbBbvs8yRHAihgpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imperial.ac.uk; dmarc=pass action=none
 header.from=imperial.ac.uk; dkim=pass header.d=imperial.ac.uk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ImperialLondon.onmicrosoft.com; s=selector2-ImperialLondon-onmicrosoft-com; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vEd6ECZhg57QLSk7IGEeLQtlHwTiYPqF+2IzTKWOjEs=;
 b=fTuoYcbf+TYS312v1Js3yWPjBns80KAVcRDdkEKCqi6L/aN9RcROpA+0BLPjAvFKbUH2aAt5qaG5+W1yoABC3NoALKIHCdhYh3MTp0mZohgwTHxChbNSWi6QnMexXi4JfHXVL2mD238jTqb8Qj7PNteAlB482FdmcemxBuZBa4E=
Received: from VI1PR06MB5935.eurprd06.prod.outlook.com (2603:10a6:803:d3::29)
 by VE1PR06MB6973.eurprd06.prod.outlook.com (2603:10a6:800:1b3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20; Tue, 27 Apr
 2021 13:00:21 +0000
Received: from VI1PR06MB5935.eurprd06.prod.outlook.com
 ([fe80::9d3c:7146:9f30:dfc1]) by VI1PR06MB5935.eurprd06.prod.outlook.com
 ([fe80::9d3c:7146:9f30:dfc1%7]) with mapi id 15.20.4065.027; Tue, 27 Apr 2021
 13:00:21 +0000
From: "Vilanova, Lluis" <vilanova@imperial.ac.uk>
To: "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Subject: Re: trace_FOO_tcg bit-rotted?
Thread-Topic: trace_FOO_tcg bit-rotted?
Thread-Index: AQHXMEelsfANEBa11UKwL5G7dX5s1KrB/ocAgABHw4CABiO0AA==
Date: Tue, 27 Apr 2021 13:00:21 +0000
Message-ID: <c0d3a416513d151b2b599f56aeb324069dd76af6.camel@imperial.ac.uk>
References: <87eefnwd0l.fsf@linaro.org>
 <032cba5b-1b8a-ef47-dd3d-6e4caef1223b@vivier.eu>
 <87czv3s9i3.fsf@linaro.org> <YHRgkuNwPhiRz6vn@stefanha-x1.localdomain>
 <87r1jfmhnr.fsf@linaro.org> <YHVXSJs6JpCnSvqw@stefanha-x1.localdomain>
 <87o8eimszx.fsf@linaro.org>
 <30c46fec5a5e5cf3d3f31c84da0e7f1efb0e8fcd.camel@imperial.ac.uk>
 <87czul6n95.fsf@linaro.org>
In-Reply-To: <87czul6n95.fsf@linaro.org>
Accept-Language: ca-ES, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.3-1 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=imperial.ac.uk;
x-originating-ip: [2a01:4b00:80cf:e00:8cf:fbaa:1c9e:850a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 26a37eb9-968d-4e33-a42a-08d9097c6a37
x-ms-traffictypediagnostic: VE1PR06MB6973:
x-microsoft-antispam-prvs: <VE1PR06MB6973BF5084F8D3C840109490E5419@VE1PR06MB6973.eurprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c5lnMZOes4Z09x4rrA7R9DZ0NOtjigt58BYlXTz2udPwKfjMdlyqivFKI+zdOPGucRqlb9mwP7DjLtXdmwxYNes6lTcvup4McdSE+RmyL+6BmAPE6fAAhn+nxOcxxo2gFUezYeo/EbLQdSSnrudFKeNwE6LhftDHMaq0iLBRt6cvbJUYX9BmkGjxz1w7MrK/vT5bR6TahhPClS17v3AT2S9ZszFexmKf6zs0h9lcdxzDP8VhgFHt8gEifOgm4WH35ignrbiI1AA9n4dOGyOy2IoZSsj3rhn6visA68AlDH/HAwM6NKhwfd7McPpmqFkWwInpuWbi3Q2hLDh6cwy42NoHAa4vlQdTllrQNHPXYnzfMYDrqqMrPc/8TEmVosV6iZ/4pA6cDyyh6OlL6NRx5Fxh+QgspAP0Lfe9NpKqvvRM4UYZQ/Qr3rromAT2EJno7+HIdW0za6q2EREIwQAUnEyRnOaC69myfN3AcXS1pLrYQjVY48n7TzPNBvkeOHeH7BusnGWTOguRCfOm8eejg/sR6BeDM2hgnrxA/NXJtxlqGb7bNGNk57iMShA93pU85n4QqZiEI45AQrvuZmo0mTxjvu6y+OKm1RYZbF2dSxg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR06MB5935.eurprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(346002)(376002)(366004)(6506007)(83380400001)(6916009)(478600001)(5660300002)(71200400001)(2616005)(66556008)(6486002)(66476007)(91956017)(76116006)(8936002)(66446008)(54906003)(64756008)(786003)(2906002)(316002)(8676002)(6512007)(122000001)(38100700002)(36756003)(66946007)(86362001)(186003)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?NHpuOWRlMUJySmVUdFRCcjZUcTdKTlYrUFp6eXNvQUJZdERMcWVkUy9vUGha?=
 =?utf-8?B?ZUptSDFEaGoxeUFIK2dmTWwwWlhkb1lLRGZISFNDQVB0T3NUOVBNa1pSODNh?=
 =?utf-8?B?N1dqKzZFd010L3VOOThWU3dQenJoWXBsMjBjTEs0QUFHZ1ZpQWlkcTFwYUUr?=
 =?utf-8?B?UDFNLzBoRFZCeXJUUm9Va2FTbGptY2FodzBYbzdpUWY5c3RvSDQya05pUWgw?=
 =?utf-8?B?Nk9WZXNoOGVXeVloY1ZYcFBGTjFmV1RqL1VoRFNzLzc3ZjllS3Erdi84TXl1?=
 =?utf-8?B?cWhRREFweTFWSGdNaE82ZGxNR1JDYnNwM1QvSGdUWkhVRjFpQWJMVlB6SWZO?=
 =?utf-8?B?Nk9rb3loeFJYQ2kwTUpDSjI0R0tydUxlY0VZNlgwU2lEQUFiYThLM1ljU05J?=
 =?utf-8?B?LzZFQW5yWHhhTXcveDQ1MXBKOUxLR3E5Y0srS1h5bUIrWG9Ranl5V0N5TnVN?=
 =?utf-8?B?RzVvdFpNMzFxMnhmd2F1bDZHYi9sUEhJSU1KanFwemtHTDNZby91RUpoN3Ju?=
 =?utf-8?B?ekFmcWtDQ1ZlUGN6Rm4yVGNlMnVHNG5HM3RtQVRQWEV5RTZsdnZ6RitxbkNw?=
 =?utf-8?B?MGFOTDBDOERHSXlYZHh0T1plcDNHWjh1RCtkZ3RvZlF0SXB4UEdIMjlWQldF?=
 =?utf-8?B?OCt0VjVienkzTDRxcUFPTVgrUVg5bllPejd0T2lYNE5OMzRPemkxekVFYzF4?=
 =?utf-8?B?T0ZmZnV6dUJBREZGOVZPbzdpem5wckJVbTlsUjNwQzB1cmcxQXJXY0o3MGVE?=
 =?utf-8?B?em1SdXFqSDRrdEtudXROczNkYTl5Z3Vpc2hmancrd05hSjFzLy9ndGJMcTBL?=
 =?utf-8?B?czZyOHhUL1djY0xNOE5BeEVwckJCRWhaZDIyNTVOWTdCTklmOGh1eXBOZjFR?=
 =?utf-8?B?dGd6SHZhSUtpQ0VCYysxNlJZTkFSVVFMTnEyeitONWx2WHNIWThIMDRnS05L?=
 =?utf-8?B?ZDZNbDVyNUYyNXJ1RFkzS2hteXhLUzRBM0k5RFUvTDJIMWlNV2lSeEUyQjJh?=
 =?utf-8?B?TzE2eWFMallyR2VlZFdMTVhpbEwzc0NCMVRtOC90b3JuMU52d2pxdjUwL0RO?=
 =?utf-8?B?VElnKytsbzdwYWVXTFVqMUtneHhMWXZUblBhTjFWTlZtMjN3LzF5SU1MNWVm?=
 =?utf-8?B?MXZmaTVZRjBJOXBKU3hkVUVsVE5hRk5UWldvTFRFaldIb1FMQlB5aGRCcnJK?=
 =?utf-8?B?UFUvYU5paktFNHEwb1RkWG8zSlVmcnBDcWRNNEQ4Z3I2ZDNRcnJac0ZxY0FD?=
 =?utf-8?B?dUdjVGtRSXBWMUJzVXJEcUFJdGFwSjE5dVRJamNkY2trcnJSNDZsWUwyM0pp?=
 =?utf-8?B?Yjh4dTh0cVNFa2VRZEVTdVErekFrTDh0L1VqdTdNV1JqV2RQSXlRL1RHaVgz?=
 =?utf-8?B?cjRqY0kzc0lhNy9FeFpSclUvd0pSNk1ld3NCN2FXZFFodWUzTXpJSWRtNkZm?=
 =?utf-8?B?dlhQdjZyaFo5cGk3ak9YZTJWZVVTOUFGZU5JS0JzWSs1QU03QnF1SlRHekZK?=
 =?utf-8?B?ODgxZ0Q4aU16eWtqQUdOOEdCS2VqQ2RVbmNlRnFhamdmSy92T24vRmtKdk1r?=
 =?utf-8?B?MnBMekMyZG45SmxhbDFWRlVDQmR6TGVXVTFZR1oybmZhdEpkb1Exekd4M3lX?=
 =?utf-8?B?UFdPdy9qM2hyT1pSdWJFbjhxUG94NS8vZUsvc2Q4U2pUSzhZR0ZhU2ROcDhN?=
 =?utf-8?B?R3pTNnR5elJ1L2NqVk5qTzNvNFFub25zZkJVNmdjb0tXRVJKK2FKTTlzU0Fp?=
 =?utf-8?B?aVZDSVRGOGUyTTZaU0pQQnlSYndZWTg5Vkd0ZnNIaG9BSVFtMmQ2SG8vdFVw?=
 =?utf-8?B?SE5tSUZ3ZWorQUV0d1phdWRGMzhxZUY3RnRhUm9ENTFHZkdybjM4eDQwcTJH?=
 =?utf-8?Q?BkfXbgbMjaU8n?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <9A9825D80BA65947B5BD101A51DBD890@eurprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: imperial.ac.uk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR06MB5935.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26a37eb9-968d-4e33-a42a-08d9097c6a37
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2021 13:00:21.1192 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2b897507-ee8c-4575-830b-4f8267c3d307
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2Y+Ym96ouq6x8+q3z/+Jwk3ubDUphmOVQvilwXifqX24zBe+PsKt+1Jtipy/57toldgL+BFPjBUFFtZyWPsViA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR06MB6973
X-IC-MsgID: 1lbNKB-0007ST-IC
Received-SPF: pass client-ip=2a0c:5bc0:88:101::47;
 envelope-from=vilanova@imperial.ac.uk; helo=smtphub2.cc.ic.ac.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: "matheus.ferst@eldorado.org.br" <matheus.ferst@eldorado.org.br>,
 "laurent@vivier.eu" <laurent@vivier.eu>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RWwgZHYuIDIzIGRlIDA0IGRlIDIwMjEgYSBsZXMgMTY6MTQgKzAxMDAsIGVuL25hIEFsZXggQmVu
bsOpZSB2YQ0KZXNjcml1cmU6DQo+ID4gPiA+ID4gPiA+ID4gDQo+ID4gQXMgU3RlZmFuIHBvaW50
ZWQgb3V0LCB0aGlzIG1lYW5zIHBsdWdpbiB3cml0ZXJzIHdpbGwgaGF2ZSB0byB3cml0ZQ0KPiA+
IHRoZWlyIG93biBUQ0cgdHJhY2luZyBjb2RlLiBIb3BlZnVsbHksIHRoZSBwbHVnaW4gQVBJIGNh
biBiZQ0KPiA+IGV4dGVuZGVkDQo+ID4gdG8gaW50ZWdyYXRlIHdpdGggcWVtdSdzIGxvZ2dpbmcg
YmFja2VuZCAoaXQgc2VlbXMgcWVtdV9wbHVnaW5fb3V0cw0KPiA+IGdvZXMgc29tZXdoZXJlIGVs
c2UpLA0KPiANCj4gcWVtdV9wbHVnaW5fb3V0cyBnb2VzIG91dCB2aWEgdGhlIGxvZ2dpbmcgYmFj
a2VuZCAtIGJ1dCBub3QgdGhlDQo+IHRyYWNpbmcNCj4gc3Vic3lzdGVtLiBEbyB5b3UgdGhpbmsg
YmVpbmcgYWJsZSB0byBlbWl0IHRyYWNlcG9pbnRzIHRvIHNpbXBsZXRyYWNlDQo+IG9yDQo+IHRo
ZSBkdHJhY2UvZnRyYWNlIHdvdWxkIGJlIGEgdXNlZnVsIGV4dGVuc2lvbiB0byB0aGUgQVBJLg0K
DQpJdCBzZWVtcyBkdHJhY2Ugd291bGQgYmUgaGFyZCB0byAiYXV0b21hdGljYWxseSIgc3VwcG9y
dCB1bmxlc3MgYWxsDQpwbHVnaW4gY2FsbGJhY2tzIGFyZSBrZXB0IGluIHRyYWNldG9vbCAoc2lu
Y2UgdGhlcmUgaXMgYWxsIHRoZSBjb21waWxlLQ0KdGltZSBnZW5lcmF0aW9uKS4gU28gbWF5YmUg
aXQncyBiZXR0ZXIgdG8ga2VlcCBpdCBzaW1wbGUgYW5kIGxldCBwbHVnaW4NCndyaXRlcnMgZGVj
aWRlIGlmIHRoZXkgd2FudCB0byBzdXBwb3J0IGEgc3BlY2lmaWMgYmFja2VuZCBieSBkZWZpbmlu
Zw0Kd2hhdGV2ZXIgbmVjZXNzYXJ5IG9uIHRoZWlyIG93biBwbHVnaW5zLg0KDQpXb3VsZCBwbHVn
aW5zIGJlIGFibGUgdG8gaG9vayBpbnRvIFFFTVUncyBiYWNrZW5kIHRvIGluZm9ybSBpdCBvZiB0
aGUNCnBsdWdpbi1kZWZpbmVkIGV2ZW50cyB3aGVuIHRoZSBwbHVnaW4gaXMgbG9hZGVkPyAoZS5n
LiwgbGV0IGR0cmFjZSBrbm93DQphYm91dCBkdHJhY2UgZXZlbnRzIGluIHRoZSBwbHVnaW4pLiBJ
J20gbm90IHN1cmUgaG93IHRoZSBleHRlcm5hbA0KZGVwZW5kZW5jaWVzIHdvcmsgZm9yIGFsbCB0
aGUgdmFyaW91cyBiYWNrZW5kcy4NCg0KDQo+IA0KPiBEbyB5b3UgaGF2ZSBhbnkgZG9jdW1lbnRl
ZCB1c2VzIG9mIHRoZSB0cmFjZSBzdWJzeXN0ZW0gdGhhdCBJIGNvdWxkDQo+IHJlLWltcGxlbWVu
dCBpbiBUQ0cgcGx1Z2lucyBieSB3YXkgb2YgZXhhbXBsZT8gSSBoYXZlIHRoZSBmZWVsaW5nIGl0
DQo+IGhhcw0KPiBiZWVuIHVzZWQgZm9yIGFjYWRlbWljIHBhcGVycyBidXQgSSBoYXZlbid0IHNl
ZW4gdXNhZ2UgImluIHRoZSB3aWxkIi4NCg0KSSBoYXZlIG5vdCBrZXB0IHVwIHdpdGggdGhlIHBs
dWdpbiBkZXZlbG9wbWVudHMgc2luY2UgSSBwYXJ0aWNpcGF0ZWQgaW4NCnRoZSBkaXNjdXNzaW9u
IG9mIHRoaXMgeWVhcnMgYWdvLiBTbyB1bmZvcnR1bmF0ZWx5IEkgY2Fubm90IHByb3ZpZGUgYW55
DQptZWFuaW5nZnVsIGFuc3dlcnMvaGVscCBoZXJlLg0KDQoNCkNoZWVycywNCkxsdWlzDQo=

