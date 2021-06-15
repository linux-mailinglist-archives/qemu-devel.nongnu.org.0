Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8869E3A8642
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 18:19:32 +0200 (CEST)
Received: from localhost ([::1]:52028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltBml-0004IH-KF
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 12:19:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jose.ziviani@suse.com>)
 id 1ltBJP-0004ai-L9
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:49:11 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:20276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jose.ziviani@suse.com>)
 id 1ltBJI-0003Al-NE
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:49:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1623772140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UQOYTU9ISzLTkBUvjq7StOHylpc4phAPoLdTxjW3+OA=;
 b=FzQnBTgm+Y/Y3Tscu4MGIKl2SVM3p7ddblHSizuR7414IiG0ZZM+3HfeiCRIttmN3ylDW4
 qDThL4fM5Qzc7RPUeEOmBr4RHnnwowaKOuCt8bTngXJYkhUUGjEIzNh0uiIKUEl7TlVxD2
 OSbtkNRpgFSO8NDOIfQC1m3qtyV5Odw=
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-28-9dvwMV_OOyyN5qcXoZ7klg-1; Tue, 15 Jun 2021 17:48:59 +0200
X-MC-Unique: 9dvwMV_OOyyN5qcXoZ7klg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QUS2aS2P27zwNNmf3avcOK5NnkH2ppOsRbi7GNainTij9ResH/7tSXR4lSUVXq285YpyfxKt6zUMCJI2qEDX7VSNXD48i0oXK1JY+QKomMFA60aTMxS0UZrwdk2BIJDfArz8vHyLzyGK3mSZCWMpmYgVd1YJnSBhd2tRUwt6Q/+W7CuTDeZ6POtFSWoGdzywd06XHJUQqAURzERRwLyuyQ6w8fsUcv6TQiJezJchYjAADvpnIUF22TRLmHW3Z4ur3BJe5OYEHVqcG3Dj3WE3KbCOOZUeVEGJREh2DdH16vEhQ6Y6jBuyGZcpm/9H6S6O/er8A2Dq429+jhQpiQuVgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UQOYTU9ISzLTkBUvjq7StOHylpc4phAPoLdTxjW3+OA=;
 b=GwIH+vezAqRVhbJ8cCQG9NyoHiT7A1+niZfiExt4mHiItNT3YqkPDyqanEfNsxB6zgByB5P1Tynhxt7mGgY3Ou/Ai4qZF1eHXvfyi/Wvwcd/t/O01xneRzCXnAs6aYQsxSjolIF/BG9O6p3KOETfqND4C8ZwYGn901hw9MOC98ycZnNfpwEYT3kDbGURLI6Q/edP6jdZDPR9Eh4vX0l5fWJP/RmNddiKu0rsli3l+V3JNsD8HdTJZ5CesNjeFf/wGXA8mys8fAlSjyFSmQkxn0n1RC/2jkC2T6VzcfwtQGymYVr5CdHk1uQCVDDJk4+/J3Cb2tNUdAjtw9ck1MQWUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from AM8PR04MB7427.eurprd04.prod.outlook.com (2603:10a6:20b:1d4::8)
 by AM0PR04MB6417.eurprd04.prod.outlook.com (2603:10a6:208:174::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Tue, 15 Jun
 2021 15:48:57 +0000
Received: from AM8PR04MB7427.eurprd04.prod.outlook.com
 ([fe80::c1ad:50a9:d174:e21f]) by AM8PR04MB7427.eurprd04.prod.outlook.com
 ([fe80::c1ad:50a9:d174:e21f%4]) with mapi id 15.20.4219.025; Tue, 15 Jun 2021
 15:48:57 +0000
From: =?iso-8859-1?Q?Jos=E9_Ricardo_Ziviani?= <jose.ziviani@suse.com>
To: Gerd Hoffmann <kraxel@redhat.com>
CC: Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 Claudio Fontana <cfontana@suse.de>, =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?=
 <f4bug@amsat.org>
Subject: Re: [PATCH 0/4] modules: add support for target-specific modules.
Thread-Topic: [PATCH 0/4] modules: add support for target-specific modules.
Thread-Index: AQHXXeGn89H1mgIER06yMUSx0ZLpCKsNDI0AgAAeaYCAAA27gIABNE8AgAAPAoCAAEyJgIAFUlMAgABynACAALKigA==
Date: Tue, 15 Jun 2021 15:48:57 +0000
Message-ID: <2963309.4TrVdrBa0x@pizza>
References: <20210610101553.943689-1-kraxel@redhat.com>
 <5953598.eXybCX72BP@pizza>
 <20210615050930.bmgup2axfr7sqvoa@sirius.home.kraxel.org>
In-Reply-To: <20210615050930.bmgup2axfr7sqvoa@sirius.home.kraxel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=suse.com;
x-originating-ip: [2804:431:c7cb:4e79:8602:9cd2:43a4:4ef]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9158327f-2024-49e4-fd4b-08d930151626
x-ms-traffictypediagnostic: AM0PR04MB6417:
x-microsoft-antispam-prvs: <AM0PR04MB6417768B5585D15EC5EFF079F2309@AM0PR04MB6417.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mVjPplyB9EOX55aCnL3x0cBdMqbgdfO2fXz+mRJStBfTwmkKvkqWe20Y+exAvwKx60HbEx3nrBDXU44qLSvIN09qbfQ00nJJpo9mQyxVhQAPXi+VYDx/0+pZe454hhLVi1IAHXT9/1LX5f7WiRG72nUfUC2mAVJ+RP8NutLlsTcJ0mIULO5zEmkKXoR0wbcSj7M5ZAYOKkKrOSiTGbAUI7n3Fj5KpY/iYumiA+zkHMtcOHk2NXSkbTfckImHePmEWfG9c+3EBgtTdPXsi74vSTfZMJHC2WjPaJqM2ur7NCVkZOMeXYpMR0Ra/BIWS8uP+OkLgcTcu6GXOWgWe3JINxstxd1Ok18U2LTuXW+rvonzYvcGWqsfn9NjtPAf6faa5fzkZhQSGUarQs9ES3EvhbDg9nOU+UvNFSMca94xggLSKe7V8ERzZh6qyJ+0pJnwmqMco+sLXA0WQjCtBa0MNYDB9K01UnuFZmiPC2nuPloEd92yHUCPKVKmOztzUQUshZ9QSQrHMH2LS/K01V/MNZv+w3aRsMVJ1IdOVSYogFgQwTI/9ywRfeUiyg+wN/rh5HW7ygY+hajH+NIliGdyAi0dgOhOzrIgz0VcQYI479suXuKgRi/8SKQnt2IlLQTwlH3UTyY75TA32LF1p5rCrdH++9UgdSdsdvrX8/b2sJ3gstAJSfYl/Pd0Dc9oVg4XDl8sM2qwHw23+wziYpw5TgPJ541GVfGrbui/07JKfhVTp+JTFfEJ2D9Gi3HThQNFuWO6frB3FeufxJR6cfhFvA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM8PR04MB7427.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(39850400004)(376002)(396003)(346002)(136003)(366004)(83380400001)(38100700002)(186003)(6506007)(122000001)(6486002)(33716001)(316002)(54906003)(478600001)(6916009)(8676002)(86362001)(99936003)(6512007)(5660300002)(66446008)(4326008)(76116006)(66946007)(66476007)(66556008)(66616009)(64756008)(8936002)(71200400001)(966005)(2906002)(66574015)(9686003)(39026012);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?SiCx6ZRDajy49cyUHnKgvnt6Z3DZRxutFnDhbnxrJvXiGerjYzOpzUTJ1S?=
 =?iso-8859-1?Q?ZQ6lpss/oUKl8Pl6hB3/NZkVi8+LlcW74zgcCgoxRuZt96gowouwLUIaJi?=
 =?iso-8859-1?Q?EvYOk/Nb5oEhxl4sz1o2oUtxxys0Tmd9TxwnvacVO1Paq56b+T8GYXsUCG?=
 =?iso-8859-1?Q?lPFLcT0rq9lIbvGX4brRg/BdN4Dl3UY5CHVGX6oxbTy3z86PqKQmjbZiAM?=
 =?iso-8859-1?Q?w0o4BXh5xmDiFuSUWpGtpJbM0qXi8VmHG26BM1yF+opwR8YE9wzHWED/sJ?=
 =?iso-8859-1?Q?xl7Ux6JVsr3Y6hwMExJCzwf63z0R2KWYml8b8DcFjc5lPZEEDzadUWsb12?=
 =?iso-8859-1?Q?DNrrRFJD1xRIL6Qh26/Q+B72HOut5b4B4CnWc1TFJOtD9ZICG2CD9rccmJ?=
 =?iso-8859-1?Q?UzIsOUsSieZMLDSNbk2J2H3lFwSHa35RFaCO0g2HnBDBUOp53E1v6/9Ur8?=
 =?iso-8859-1?Q?MBd8ZZL9Mw1Uq8oqTS8SL/qJU1mJw3Fd+OErUUv5MT9EmE9+saj7VzPnmy?=
 =?iso-8859-1?Q?wKCYmaoeH2x12R53+l/VXKZPH6XiwiV/I7bzpkDtrYkMADuYd5pk7j1Vjx?=
 =?iso-8859-1?Q?k0bVCe9eqtQEJrFw6N29cijtMY9ObJRg95/weYjUH2f9Rl5pSfGY5AcIU1?=
 =?iso-8859-1?Q?W1CXd6PBaDuEpJRh8Pul/p7hwN9SLfvJvSNkesaHBytKwvEupMHLf1tVDJ?=
 =?iso-8859-1?Q?xW/RH/jcTW7/M5IMtO1X34Aymat2kRmdUPi94ZFnoO6ifdit40hei19sSM?=
 =?iso-8859-1?Q?v3jin9NlO2Zyvt8n6W82Pgt7EakxIiokph5VQ4YI6k0UmoZMSsun5Or631?=
 =?iso-8859-1?Q?ATzLmWcjEBjmEFktk4hjRBxe8eU+XYhTsq1nth2gLB/u7UTPu2KWhiQzwk?=
 =?iso-8859-1?Q?eGwTpTi3EH0Ia/YOIBUM18wC7cYgDgeCEOpb22HUimMKMj8ex0jeBtaJli?=
 =?iso-8859-1?Q?vAh032QK4NAzLcN/NNatcvZXDe/xNcz7r7NyktwYcmzLWMjTQiDI4auPTm?=
 =?iso-8859-1?Q?nVzKMedkP6tBb7fuKhdSdvUNxi61qfP4RQM1sx+RH+yufQ55y/d+l0vQ29?=
 =?iso-8859-1?Q?s2O5Dxl1/CXJ+9LPq9aUqLKEXI+2ehZBQz9hSvDaeG/+4Y+XbKl0j41KRc?=
 =?iso-8859-1?Q?r8JPbcPvszNNWyViVvoa2+tD/xrEVp9AA+ZVH87j042uLXDMKFITfLXJrq?=
 =?iso-8859-1?Q?m2HxongJ+KuDDXdWZPoW7RCloLLVOSfywXc6HbN7VuzKhxTn9WxcfGILBW?=
 =?iso-8859-1?Q?dlDN7rOKViWtVEF7JUFmqCtXKPySAe6yx8AkudMOLGJAaGJgGOonQEawqQ?=
 =?iso-8859-1?Q?fqs9A5juvmxzrPjD5rf1VgZKBdBOcNa0ugH/7bTtOLYpm+gYQ/hSANJK7z?=
 =?iso-8859-1?Q?kKcm1unqz/BqjFZ/D3jLZVas6/vOb5LwLZyx76EuZEalWHGG/3yF99uxIj?=
 =?iso-8859-1?Q?fhjYzrdFMfuXEdK9?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/signed; boundary="nextPart10223400.mzLFoIyACK";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7427.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9158327f-2024-49e4-fd4b-08d930151626
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2021 15:48:57.2262 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H5b4XK1Bo+kjP46VOluvvUnd9fdET8IGfbkoUqRRTdPY5Xfvn/Zqb813rv0WAEBN97LRsQMYfhdQXtYf/PAcUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6417
Received-SPF: pass client-ip=194.104.111.102;
 envelope-from=jose.ziviani@suse.com; helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--nextPart10223400.mzLFoIyACK
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Jose Ricardo Ziviani <jose.ziviani@suse.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Christian Schoenebeck <qemu_oss@crudebyte.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>, Claudio Fontana <cfontana@suse.de>, Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 0/4] modules: add support for target-specific modules.
Date: Tue, 15 Jun 2021 12:48:51 -0300
Message-ID: <2963309.4TrVdrBa0x@pizza>
Organization: SUSE
In-Reply-To: <20210615050930.bmgup2axfr7sqvoa@sirius.home.kraxel.org>
References: <20210610101553.943689-1-kraxel@redhat.com> <5953598.eXybCX72BP@pizza> <20210615050930.bmgup2axfr7sqvoa@sirius.home.kraxel.org>

T24gdGVy52EtZmVpcmEsIDE1IGRlIGp1bmhvIGRlIDIwMjEgMDI6MDk6MzAgLTAzIEdlcmQgSG9m
Zm1hbm4gd3JvdGU6Cj4gT24gTW9uLCBKdW4gMTQsIDIwMjEgYXQgMTA6MTk6MjdQTSArMDAwMCwg
Sm9z6SBSaWNhcmRvIFppdmlhbmkgd3JvdGU6Cj4gPiBIZWxsbyBHZXJkLAo+ID4gCj4gPiBPbiBz
ZXh0YS1mZWlyYSwgMTEgZGUganVuaG8gZGUgMjAyMSAxMDowMzoyMSAtMDMgR2VyZCBIb2ZmbWFu
biB3cm90ZToKPiA+ID4gICBIaSwKPiA+ID4gICAKPiA+ID4gPiBBcmUgdGhlcmUgYW55IHBlbmRp
bmcgcGF0Y2hlcyB0byBoYW5kbGUgdGhlIHJlbWFpbmluZyB0Y2cgZGVwZW5kZW5jaWVzCj4gPiA+
ID4gaW4gcWVtdT8gIFdoZW4gdHJ5aW5nIHRvIGJ1aWxkIHRjZyBtb2R1bGFyIChtb3JlIHRoYW4g
b25seQo+ID4gPiA+IHRjZy1hY2NlbC1vcHMqKSBJIGdldCBsb3RzIG9mIHVucmVzb2x2ZWQgc3lt
Ym9scyB0byB0Y2cgYml0cyB3aGljaCBhcmUKPiA+ID4gPiByZWZlcmVuY2VkIGRpcmVjdGx5IChp
biBjcHUuYywgZ2Ric3R1Yi5jLCBtb25pdG9yLCAuLi4pLgo+ID4gPiA+IAo+ID4gPiA+IFRoZSBD
T05GSUdfVENHPW4gY2FzZSBpcyBoYW5kbGVkIGVpdGhlciB3aXRoIHN0dWJzIG9yIHdpdGggI2lm
ZGVmCj4gPiA+ID4gQ09ORklHX1RDRywgd2hpY2ggZG9lc24ndCBmbHkgZm9yIG1vZHVsYXIgdGNn
IC4uLgo+ID4gPiAKPiA+ID4gU28sIGVub3VnaCBmb3IgdG9kYXksIHRvIGJlIGNvbnRpbnVlZCBu
ZXh0IHdlZWsuCj4gPiA+IFdvcmsgYnJhbmNoIHB1c2hlZCB0bwo+ID4gPiAKPiA+ID4gICAgIGh0
dHBzOi8vZ2l0LmtyYXhlbC5vcmcvY2dpdC9xZW11L2xvZy8/aD1zaXJpdXMvbW9kaW5mby1wbGF5
Z3JvdW5kCj4gPiA+IAo+ID4gPiBUb3Btb3N0IHBhdGNoIGRvZXNuJ3QgY29tcGlsZSBidXQgc2hv
d3MgdGhlIGJ1aWxkIGNoYW5nZXMuCj4gPiAKPiA+IEkgY2xvbmVkIHlvdXIgJ3Npcml1cy9tb2Rp
bmZvLXBsYXlncm91bmQtZ29vZCcgYW5kIHN0YXJ0ZWQgcGxheWluZyB3aXRoCj4gPiB0aGUKPiA+
IGNvbW1hbmQgbGluZSBvcHRpb25zIHRvIGJ1aWxkIHRoZXNlIG1vZHVsZXMuIEkgd291bGQgbGlr
ZSB0byBzdWdnZXN0IHRvCj4gPiBjaGFuZ2UgdGhlIGN1cnJlbnQgIi0tZW5hYmxlLVgiIHdpdGgg
Ii0tWD1bZW5hYmxlZCxkaXNhYmxlZCxtb2R1bGVdIiwKPiA+IHRoYXQgc2VlbXMgdG8KPiA+IG1h
a2UgbW9yZSBzZW5zZSBmb3IgdGhlc2UgbW9kdWxlcy4gRm9yIGluc3RhbmNlOgo+IEhtbSwgd2hh
dCB3b3VsZCBiZSB0aGUgdXNlIGNhc2U/ICBSaWdodCBub3cgcWVtdSBoYXMgdGhlIGFsbC1vci1u
b3RoaW5nCj4gYXBwcm9hY2ggZm9yIG1vZHVsZXMsIGkuZS4gaWYgbW9kdWxlcyBhcmUgZW5hYmxl
ZCBldmVyeXRoaW5nIHdlIGNhbgo+IGJ1aWxkIGFzIG1vZHVsZSB3aWxsIGJlIGJ1aWx0IGFzIG1v
ZHVsZSwgYW5kIEkgaGF2bid0IHNlZW4gYW55IGRyYXdiYWNrcwo+IHNvIGZhci4gIFNvLCB3aHkg
d291bGQgb25lIGNvbXBpbGUgcGFydHMgb2YgcWVtdSBhcyBtb2R1bGUgYW5kIG90aGVyCj4gcGFy
dHMgbm90PwoKRnJvbSBteSBwb2ludCBvZiB2aWV3LCBhcyBhIFFFTVUgcGFja2FnZSBtYWludGFp
bmVyLCB0aGUgYWxsLW9yLW5vdGhpbmcgbW9kdWxlIAphcHByb2FjaCBpcyBncmVhdCAtIHNwZWNp
YWxseSBmb3IgYWNjZWxlcmF0b3JzIC0gYmVjYXVzZSB3ZSBjYW4gY3JlYXRlIGEgc2V0IApvZiBv
ZmZpY2lhbGx5IHN1cHBvcnRlZCBwYWNrYWdlcyBhbmQgYW5vdGhlciBzZXQgb2Ygb3B0aW9uYWwg
bW9kdWxlcywgdGhhdCAKdXNlcnMgbWF5IGdldCB0aGVtIGlmIHRoZXkgd2FudCB0by4KCkhvd2V2
ZXIsIHBsZWFzZSBjb3JyZWN0IG1lIGlmIEknbSB3cm9uZywgSSB1bmRlcnN0YW5kIHRoYXQgYW4g
YWNjZWxlcmF0b3IgYXMgYSAKbW9kdWxlIHdpbGwgYWRkIGFuIG92ZXJoZWFkIHRoYXQgc29tZSB1
c2VyIHdvbid0IGJlIHdpbGxpbmcgdG8gcGF5LiBTbywgZ2l2ZSAKdGhlbSB0aGUgb3B0aW9uIHRv
IGhhdmUgYnVpbHQtaW4gYWNjZWxlcmF0b3JzIHNlZW1zIGEgZ29vZCBpZGVhLiBPZiBjb3Vyc2Us
IEkgCmhhdmVuJ3QgbWVhc3VyZWQgYW55dGhpbmcgeWV0IHNvIG15IG9waW5pb24gYWJvdXQgaXQg
bWF5IGJlIG1pc2xlYWRpbmcuCgo+IAo+IEFsc286IHdoZW4gY2hhbmdpbmcgdGhpcyBJIHRoaW5r
IGl0IHdvdWxkIGJlIGdvb2QgdG8gbWFpbnRhaW4gYmFja3dhcmQKPiBjb21wYXRpYmlsaXR5IGFu
ZCB1c2Ugc29tZXRoaW5nIGxpa2UgdGhpczoKPiAKPiAgIC0tZW5hYmxlLXRjZz1idWlsdGluCj4g
ICAtLWVuYWJsZS10Y2c9bW9kdWxlCj4gICAtLWVuYWJsZS10Y2cgKHVzZSBkZWZhdWx0LCBwcm9i
YWJseSAibW9kdWxlIiB3aGVuIG1vZHVsZXMKPiAgICAgICAgICAgICAgICAgYXJlIGVuYWJsZWQg
YW5kICJidWlsdGluIiBvdGhlcndpc2UpCj4gICAtLWRpc2FibGUtdGNnCj4gCgpUaGlzIGlzIGEg
YmV0dGVyIGlkZWEuCgpUaGFuayB5b3UhIQoKPiB0YWtlIGNhcmUsCj4gICBHZXJkCgo=


--nextPart10223400.mzLFoIyACK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: base64

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRSXpCQUFCQ0FBZEZpRUVWUUIrRHdMR1Z5
djgxNXNCYUo0d2RDS0tGNVlGQW1ESXkrTUFDZ2tRYUo0d2RDS0sKRjVZQ2R4QUFsR3c1T3NSMVZL
YmpFOWtxRkJHcVkxbmhOQXVMb0RXNUxzSW1UOXdJYVNIYm13NzIvcFZYNUQ3QwpQSnJ5OWtRZnhz
Y0JmU0dlS1FaSGxCVjJ0dER1QTVPbEhzWTVZTTRobUhCMFdobFBFdnJMNU10S0RqYm5Bd2ljClVH
b3BsUUt3MHNDcHlMT3ZUa1AzRFNGTnVUVXNlRVFjU1B6Unk5bXlTNmpPQzgxeFllY1d4bS9Bc0hz
S3grSWwKUXdNUzYrZG1TMXZVZENWRmJ6cHNHaTNxeWxobDlnTzJHelhjMVFQVkFVc3lSdXViUzFI
R1l4cGRPQUt5UDRxdgpwVmMxSEJEOEEySU92TG9DTzFXbi9mMHNxM1B1UDJlRTlLR0VMV3hUTVd2
dlp5QW43ejVBQ3VKeGxpcHJKbTlaCmpyUE12ZWlDS3NSZUptY1hncERXbW1Gb0lOMUVjUXpuQXlh
TVIrUVJmK0UveEo2MFB5TW8vL2d0Wjcyb3l0WVcKZ0lMMUxZeEErODBINlVrQm96ZHFVYmJLUGtq
NDZyZFQwcDZGRGZaMmJ5N0cveTFGSS9pd01Va3BZOC9vaEkzLwpzYjRzNVo0L3JUNXFlOFc0NkJM
SCsrMXVBZXlWVHZ4S1RzWDgyWG1pSW56NU9ZVERlZEFXUHAwVG9lZmhMc2h4ClQxQWZEajN2WHVO
ZWZYOGoxUHJ6ZWx4TnF2UFRKRW1IRStGWlBzSkxYTWhrRStvOUt2Mm0xM2VYdWhMcmVLVWEKUjFa
TjJmeFJwY1lOdW9URE43K3V6R21xTExuZUJ4VDR4bWhnUTNFYXo3emdHQmJURGxsR0NxdlAyN1VY
dWdvaApaUmhYb2FiYzBESmphdHdkcHJlN0hrdjU1cFpIUkkzTVdMbmZyaWExTFgzVFpHKzBqZ1E9
Cj1HT2xGCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--nextPart10223400.mzLFoIyACK--


