Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 101B02B1372
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 01:45:50 +0100 (CET)
Received: from localhost ([::1]:34416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdNDo-0002IX-NJ
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 19:45:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1kdNCZ-0001VT-PL; Thu, 12 Nov 2020 19:44:31 -0500
Received: from mail-dm6nam11on2059.outbound.protection.outlook.com
 ([40.107.223.59]:12577 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <komlodi@xilinx.com>)
 id 1kdNCW-00083G-PF; Thu, 12 Nov 2020 19:44:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rn3KPiGnihCVp6BfwmMpapvhQJ3seYNijeHaG0MzEyLBsSw1W5XNkFYmz0R9htoUll86jT8uS7em6WGRhXmlHKghZ7NVZIswo9+r/C2UK/mdVF2fpqz0gVDkiFMMDXu0O+zYF6Iee2aYTVUwndVaqKSRilb2VKO+I+hL/1gQFok5/EnetkAILbexdd6kI/Eg22f6p3cvcyAu0VVzpCBZiN7TpoyKqpYCrrQZTcv68mHpHmYAdwoHBxYP3uX/lnzuKr+UhmD4Y3rHJyz4yAq4RvNtBTYra3MaSlXL9Mm87a4tRtgDWO1EVaz7E09Lp6mxzfr2cqD5EloiwoKRQNN5wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hRj3ULtXYHo8jMomSe7sj8Oqboypg9yfwyMu0vBhCJU=;
 b=MS7ypVFwEBIq36o8bbwNGWNNXAb5HVion6+vzmrfe+XgNvKiFg5irEn++SQr9KVgZgjFgbW+aFglS0P06/BI5armp9kuj1IUIYn5jIlJmyJhRJlVuLpidPyilKKpP2rAllz8HT6O+AOX0Itnf1Rer6XUobIrpB4IgKbIfK71CAJWol2G+NDpTTOXRR401gESg2eQzjZ2D0AgLClHInvmKHM8g5+YP2k3ogcapCYtUgvw9pa+Xrf6H9sZolJhIJxo3OIS9sgo5Y9n1gyXk51SOn3p+6PctS3y0qhZSIOybVNWs097u84QhqMbUY4sjjYExIkPFTcbhrw8wztPuqRrmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hRj3ULtXYHo8jMomSe7sj8Oqboypg9yfwyMu0vBhCJU=;
 b=rjfKXXvBJ1BWwrjbAwJs/OF5OblclAuH3/arwOc+HzQBCXu0V9yJBW7j92NLkAiUVvXKpmM49cndNKDDOLoyIinTF879FAB917d4bev1VpuxufVEMY3hbYELkCdyZAFq9yjxTc1KNYql0eX8qqQoZrGoNtWEvj054M1gUnIwdRY=
Received: from BY5PR02MB6033.namprd02.prod.outlook.com (2603:10b6:a03:1ff::10)
 by BY5PR02MB6865.namprd02.prod.outlook.com (2603:10b6:a03:238::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 13 Nov
 2020 00:44:25 +0000
Received: from BY5PR02MB6033.namprd02.prod.outlook.com
 ([fe80::f5f3:83c4:cc49:d415]) by BY5PR02MB6033.namprd02.prod.outlook.com
 ([fe80::f5f3:83c4:cc49:d415%6]) with mapi id 15.20.3541.022; Fri, 13 Nov 2020
 00:44:25 +0000
From: Joe Komlodi <komlodi@xilinx.com>
To: Francisco Eduardo Iglesias <figlesia@xilinx.com>
Subject: RE: [PATCH v3 1/3] hw/block/m25p80: Fix Numonyx NVCFG DIO and QIO bit
 polarity
Thread-Topic: [PATCH v3 1/3] hw/block/m25p80: Fix Numonyx NVCFG DIO and QIO
 bit polarity
Thread-Index: AQHWs90oDQkYXPhdcEam1mW+Sp8T3qnDB3AAgAI78YA=
Date: Fri, 13 Nov 2020 00:44:25 +0000
Message-ID: <BY5PR02MB60333DF17070620B53C104AAD0E60@BY5PR02MB6033.namprd02.prod.outlook.com>
References: <1604626378-152352-1-git-send-email-komlodi@xilinx.com>
 <1604626378-152352-2-git-send-email-komlodi@xilinx.com>
 <20201111143310.6gmhyz4zk75k526j@debian>
In-Reply-To: <20201111143310.6gmhyz4zk75k526j@debian>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: xilinx.com; dkim=none (message not signed)
 header.d=none;xilinx.com; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [76.217.55.39]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f6d38919-9259-43be-b1df-08d8876d4520
x-ms-traffictypediagnostic: BY5PR02MB6865:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR02MB68658917C6D738DF59314CA8D0E60@BY5PR02MB6865.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:989;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PH2uq+TzVocgJDnZqmKNgauMgZLwd4o8BvLMmti/jY9hHXft6xlul6C0ZgEDHQIkKAhujI00cp7LRK1pcai5GCnLN5TGh0b3kn/Ux+eklr7vF/CruZqyDu6/VQexhaSEay/6oAnqe6O4Par3EkUBTL9DeLtNQd26kFfm+EB5OpoPBX9w+HQyePfWj2FCCt0wtStPfODZCNlJQzb1fGxVipCytNHsvg6SwjEimI/KhxGKYsOkBx1/h7LFhS7Zowj/aC/KvUGM1HP+dqIrm7/+WlSVvj9a3URt8R4cmi3vsVJMk2qpck9AEp18hybh5l73BBqnd+XVJaHWTj7+dgkNbA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR02MB6033.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(54906003)(8936002)(9686003)(71200400001)(478600001)(2906002)(53546011)(26005)(8676002)(4326008)(66446008)(66476007)(5660300002)(83380400001)(6506007)(6636002)(66556008)(64756008)(66946007)(76116006)(55016002)(186003)(6862004)(7696005)(33656002)(316002)(86362001)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: +O6Qlosr3nczO3aAEqADFqIwcMAYh3iVDQ2Il9OFPcfsjLTOa8xaJOXPo1+NQ9Y16yfinZgVkHJDhTSUMdjnXTIRX1G1XJZEXhhFZNAAQ6iOPvgQBoCo/+Qwp4l2Ol8Z9OY1IRcdsqVAJSUb1RblJG5bgg2JBnWE6A5SgiDvhp2ecVSdiSrzEXg+SKMikQ9CWEWwDyzmUlUhvA6B0co1SjWG0x5SgVKpiiN1On35SQqZ1hjyvYzS7WZSHy7eG85nxxeWKHR3sGHDXgdTceeGOTGD8o9YFkeRPHbVkXr1k1TJVcGKCFHu8m9swbVkOVNn3BAlcF/HsvDUTLgK7SiFm4ZxwsQXHWmz7P2BE1TkyuA71puJ54x0jm4nI8d4A/w1ECQodTydG+7p5pczxPu2jen9TjUZ+RrlqSeMikgWJiNCAapCsHfqfEuR9q2BIWmq/VkiZjFzAkXtM8kcQHLcRhcmova4vT7zX3Jku3rzxv7mgUissQfC9VRXcjP4hA0Ir/o8ExEjdLGwzLw9uLMWVu6Y1C4gWZstDbxGzFgvPCSpnLLR1L/W6WmZkL3zKWhJITju+Jv1FnaNsxa7jHD9+li7mfZHk4fpQAdcIIjjaBSrbWyy3/T8jUF5OzeB1IFgpXGjtKoiTRCitnvr/rBvKJqGz4sK4CxT+l0v5kniJYZkaABFfmd2DDzF/rmf3Zf4i/EyzCV6NA2EgPw3XyfueMEACnFGSijSMhFcT8e7mqEGShKevHP5w0zfSVVLi2SdtkyIqh4CD3wSOPXwJ/8p3ZtM9g7dg/WyPG4fTom5QvQ60ERPI4Gwa+wl6+Km1xYYm4DeGDRXy+5ilZlaxknoKbeM2bugRIYxniuQ34+Mf6V6Slz8zqKj9ynb9aWCu8h+TDBn6kwdxmCqdN8Pr/Wx8g==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB6033.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6d38919-9259-43be-b1df-08d8876d4520
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2020 00:44:25.2991 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KaGd5FSgzjVQpfGi1XFW2WVKsoH5oiwwhZ0UUoSuxjmbttx2Fcf6sFYRZkidHaj/W/Y+T8XgsDdGvFvPQPJ4cQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6865
Received-SPF: pass client-ip=40.107.223.59; envelope-from=komlodi@xilinx.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 19:44:26
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Francisco Eduardo Iglesias <figlesia@xilinx.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "alistair@alistair23.me" <alistair@alistair23.me>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mreitz@redhat.com" <mreitz@redhat.com>,
 "philippe.mathieu.daude@gmail.com" <philippe.mathieu.daude@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGkgRnJhbmNpc2NvLA0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogRnJhbmNp
c2NvIElnbGVzaWFzIDxmcmFuY2lzY28uaWdsZXNpYXNAeGlsaW54LmNvbT4gDQpTZW50OiBXZWRu
ZXNkYXksIE5vdmVtYmVyIDExLCAyMDIwIDY6MzMgQU0NClRvOiBKb2UgS29tbG9kaSA8a29tbG9k
aUB4aWxpbnguY29tPg0KQ2M6IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsgcGhpbGlwcGUubWF0aGll
dS5kYXVkZUBnbWFpbC5jb207IEZyYW5jaXNjbyBFZHVhcmRvIElnbGVzaWFzIDxmaWdsZXNpYUB4
aWxpbnguY29tPjsgYWxpc3RhaXJAYWxpc3RhaXIyMy5tZTsgcWVtdS1ibG9ja0Bub25nbnUub3Jn
OyBtcmVpdHpAcmVkaGF0LmNvbQ0KU3ViamVjdDogUmU6IFtQQVRDSCB2MyAxLzNdIGh3L2Jsb2Nr
L20yNXA4MDogRml4IE51bW9ueXggTlZDRkcgRElPIGFuZCBRSU8gYml0IHBvbGFyaXR5DQoNCkhp
IEpvZSwNCg0KT24gVGh1LCBOb3YgMDUsIDIwMjAgYXQgMDU6MzI6NTZQTSAtMDgwMCwgSm9lIEtv
bWxvZGkgd3JvdGU6DQo+IFFJTyBhbmQgRElPIG1vZGVzIHNob3VsZCBiZSBlbmFibGVkIHdoZW4g
dGhlIGJpdHMgaW4gTlZDRkcgYXJlIHNldCB0byAwLg0KPiBUaGlzIG1hdGNoZXMgdGhlIGJlaGF2
aW9yIG9mIHRoZSBvdGhlciBiaXRzIGluIHRoZSBOVkNGRyByZWdpc3Rlci4NCg0KVGhlIGVuaGFu
Y2VkIHJlZ2lzdGVyIGhhcyB0aGUgYml0cyB3aXRoIHRoZSBzYW1lIHBvbGFyaXRpZXMsIG1lYW5p
bmcgdGhhdCB0aGUgdmFsdWUgc2hvdWxkIGJlIHByb3BhZ2F0ZWQgYXMgaXQgd2FzIGJlZm9yZSAo
MCAtIGVuYWJsZWQgYW5kIDEgLSBkaXNhYmxlZCkuIEkgZG8gc2VlIHRob3VnaCB0aGF0IHRoZSBk
ZWZpbmUgbmFtaW5nIGlzIG5vdCBwZXJmZWN0IGFuZCBjYW4gbWFrZSB5b3UgYmVsaWV2ZSBvdGhl
cndpc2UuDQoNCltKb2VdIEFoLCB5b3UncmUgcmlnaHQuICBJJ2xsIGZpeCB0aGF0IGFuZCBjaGFu
Z2UgdGhlIGJpdCBjaGVja3MgaW4gdGhlIG90aGVyIHBhdGNoZXMgYWNjb3JkaW5nbHkuDQpJJ2xs
IHByb2JhYmx5IGFsc28gYWRkIGEgcGF0Y2ggdG8gdGhpcyBzZXJpZXMgdG8gY2hhbmdlIHRoZSBk
ZWZpbmUgbmFtZXMgdG8gbWFrZSB0aGVtIG1vcmUgYWNjdXJhdGUuDQoNClRoYW5rcyENCkpvZQ0K
DQpCZXN0IHJlZ2FyZHMsDQpGcmFuY2lzY28gSWdsZXNpYXMNCg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogSm9lIEtvbWxvZGkgPGtvbWxvZGlAeGlsaW54LmNvbT4NCj4gLS0tDQo+ICBody9ibG9jay9t
MjVwODAuYyB8IDQgKystLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9ody9ibG9jay9tMjVwODAuYyBiL2h3L2Js
b2NrL20yNXA4MC5jIGluZGV4IA0KPiA0ODM5MjVmLi40MjU1YTZhIDEwMDY0NA0KPiAtLS0gYS9o
dy9ibG9jay9tMjVwODAuYw0KPiArKysgYi9ody9ibG9jay9tMjVwODAuYw0KPiBAQCAtNzgzLDEw
ICs3ODMsMTAgQEAgc3RhdGljIHZvaWQgcmVzZXRfbWVtb3J5KEZsYXNoICpzKQ0KPiAgICAgICAg
ICBzLT5lbmhfdm9sYXRpbGVfY2ZnIHw9IEVWQ0ZHX09VVF9EUklWRVJfU1RSRU5HVEhfREVGOw0K
PiAgICAgICAgICBzLT5lbmhfdm9sYXRpbGVfY2ZnIHw9IEVWQ0ZHX1ZQUF9BQ0NFTEVSQVRPUjsN
Cj4gICAgICAgICAgcy0+ZW5oX3ZvbGF0aWxlX2NmZyB8PSBFVkNGR19SRVNFVF9IT0xEX0VOQUJM
RUQ7DQo+IC0gICAgICAgIGlmIChzLT5ub252b2xhdGlsZV9jZmcgJiBOVkNGR19EVUFMX0lPX01B
U0spIHsNCj4gKyAgICAgICAgaWYgKCEocy0+bm9udm9sYXRpbGVfY2ZnICYgTlZDRkdfRFVBTF9J
T19NQVNLKSkgew0KPiAgICAgICAgICAgICAgcy0+ZW5oX3ZvbGF0aWxlX2NmZyB8PSBFVkNGR19E
VUFMX0lPX0VOQUJMRUQ7DQo+ICAgICAgICAgIH0NCj4gLSAgICAgICAgaWYgKHMtPm5vbnZvbGF0
aWxlX2NmZyAmIE5WQ0ZHX1FVQURfSU9fTUFTSykgew0KPiArICAgICAgICBpZiAoIShzLT5ub252
b2xhdGlsZV9jZmcgJiBOVkNGR19RVUFEX0lPX01BU0spKSB7DQo+ICAgICAgICAgICAgICBzLT5l
bmhfdm9sYXRpbGVfY2ZnIHw9IEVWQ0ZHX1FVQURfSU9fRU5BQkxFRDsNCj4gICAgICAgICAgfQ0K
PiAgICAgICAgICBpZiAoIShzLT5ub252b2xhdGlsZV9jZmcgJiBOVkNGR180QllURV9BRERSX01B
U0spKSB7DQo+IC0tDQo+IDIuNy40DQo+IA0K

