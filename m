Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A76D7434E9E
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 17:07:43 +0200 (CEST)
Received: from localhost ([::1]:36986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdDBu-0005sj-Q0
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 11:07:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christophe.leroy@csgroup.eu>)
 id 1mdD8M-00014j-QF; Wed, 20 Oct 2021 11:04:02 -0400
Received: from mail-eopbgr90082.outbound.protection.outlook.com
 ([40.107.9.82]:31215 helo=FRA01-MR2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christophe.leroy@csgroup.eu>)
 id 1mdD8K-00052L-Ud; Wed, 20 Oct 2021 11:04:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GgjdJJFfmyP/Y2fLDCs55HECMCTxN1e1GeTESxhthi9/M1kpSnPR7hH5uZsKl2yU4dqbcO7U/fjWj2iO9lFx4+E6qvBOIEwF72+WOxZE4wqSCWgWXDaefhxJP/s0c+lWiBKYIPctM4YTppZHFGH7jpWSKiM5Ol/4R5xOvK7oguH1dOdS8XZSmojWYRMmBa8aRgKQeFRXvfwquTfg0y+4G5vCXxwfLOR5WpdOlCBrC7O4ch9/21pWa0zDYhgNT3heaoo6Bmhn9p5xaUaNo+GiJWfgJJSF9Evbuzh8bDmUMJ/yCxNwbGQFarUijJKanaNoKcBPkoVmJ0y8ME53yb0tZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fW6vosDSOaI/2ACJQcddHaZyn9m5zPsLA7GwuHLdmr8=;
 b=e0jW6ELZn6B93vi5g/of6ReTcuiibg2fWZUMBRzvSyKXrThefNY20b2hU6qHXVCQIcXjNlWivJG1Vfu4GXwRn95i4uBXSqB4WpUrDsNgNW9RrIRseil2Y1v8Qg982MxyALTx+7VNeVkdUPLCffdfz0+FMPFd6AN8evJGXv1AHecTaw1fOO8OJWzb1RBRUNQJw4wD1twfxrHuZKR8wRaCzXqS9S3TPGrsN5I5if0DJXQAGzwpUOQDjygTorJG01dKBIl78VTTnxQBbBK+vBK0ZI8rzM8njgjZb7niGIaB25Ifbd4+SE2mgdVlHNR7aOWVLaFFiehrf3m7VY2X7JTL1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR2P264MB0802.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15; Wed, 20 Oct
 2021 15:03:55 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4628.016; Wed, 20 Oct 2021
 15:03:54 +0000
From: LEROY Christophe <christophe.leroy@csgroup.eu>
To: =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>, Thomas Huth
 <thuth@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: Deprecate the ppc405 boards in QEMU?
Thread-Topic: Deprecate the ppc405 boards in QEMU?
Thread-Index: AQHXucZF2mvlN0sthUetBB/8OV47qqvEUmkAgAAFE4CAAJvQAIAAn+CAgAfoOACAABN7AIAAREAAgAxRZYCAAAJLgIAAB8TCgAASBwCAABgs+4AAJtCugABt5+KAANSDEoAANuAAgAAR0oCAAADYAIAAAiIAgAAGLQA=
Date: Wed, 20 Oct 2021 15:03:54 +0000
Message-ID: <10376e75-eb89-bfc0-0a80-67e2c303b6a9@csgroup.eu>
References: <f0871969-190a-d15e-50d8-e6c1b1043652@ozlabs.ru>
 <be84c7bf-47d3-1ba8-20ca-084a487db29d@csgroup.eu>
 <8c382ce4-f706-376c-289a-b8c64393decb@redhat.com>
 <880f4bde-19fc-1267-3a04-3d9efd660897@csgroup.eu>
 <c09d92d9-a5a3-328f-824c-07653f8e649@eik.bme.hu>
 <be7a734a-b88b-3130-fee8-398387fb65b4@redhat.com>
 <262b6af0-b5c5-1d28-2f48-7a021c5cd0b9@csgroup.eu>
 <a3d28088-2012-9450-5491-1de77d962da7@eik.bme.hu>
 <d8c9661e-4439-b3f8-48d8-b6f659e862c8@csgroup.eu>
 <5491ed41-7328-3949-12ad-1a94f0f525d1@csgroup.eu>
 <6be2745-2eb7-7b85-31c3-def20eb21f@eik.bme.hu>
 <17b48b89-ef2a-f38d-b081-a3e2ffc1ca67@csgroup.eu>
 <51c1e658-a8ec-a41b-ef8f-a1677ea94f4a@kaod.org>
 <a9b483e2-9176-2349-2478-faa15592c28b@csgroup.eu>
 <38de2462-17ea-0264-5606-6e07b129920d@kaod.org>
 <e63df215-aacc-b57b-6ed2-d63927060eb7@csgroup.eu>
 <19612059-3e61-f920-339c-63162a94dd22@eik.bme.hu>
 <a4d1571d-0419-054d-b127-8c0b57425f6b@redhat.com>
 <b713a091-848d-8164-2ff8-7953ac605ad2@kaod.org>
In-Reply-To: <b713a091-848d-8164-2ff8-7953ac605ad2@kaod.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kaod.org; dkim=none (message not signed)
 header.d=none;kaod.org; dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e2d13e1f-6e3f-4cac-34c4-08d993dad5da
x-ms-traffictypediagnostic: MR2P264MB0802:
x-microsoft-antispam-prvs: <MR2P264MB08025A3BE718A273467C26A4EDBE9@MR2P264MB0802.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:129;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: De4OmMWJXQb9XTYrem88Y6CWUUvaAVWMvfxCP3yJUCFYTxA+yJ11FNVtqkBnmclUYzziSAAPe+DFr5ietBxUP5jYfOP6Wg8Qy5qVcz+qkrtGcZumvlidK/tgfwnl3YFHccq95lFYj4OkQGay2Bd+bOxaJSxvUwpmN74a583y5IpmIfkdS43UvYgPWV/yc/7W2y0hcwijIDmrpMYaLqBioL+P91FkQYFmQTcqO+5PPtRMIU+EjX41rkEoXq7S+N2W/jGhjewMynlg1Z1lmZzli81FGJOzKhuc61214fIThD48Qw1syC9/Ex75nw1c9UarvFN8TH6cPpGhzX/redV2X5GaIeiOzQIfk97z5lDbPOFG/aeuESatbpTj8huyu5muf84Dxjbp2uD3tWSRhwy7Gnrn7daz9G7MjkzE1XqkI5rO20d2fZZOlssehtwO5AVULKCE5Ekhl68dtU4YHzhwNhzbx66L8p+o+Q9Mj0PHg6VEeCC+Y1j9jkF0uz42CQCfZk/8SlRzA3DxHWFRJToCoAs4YuOmS1y4JaZv1m83JRdnV3pa4GtVGiqTB1wBMOLkHnNne3rwywPuy5XJLGSxro8BJw3jSjpj6N+Aviuux7pFaS6kFhEQRVmvnH+uw7bDJHHoPkD5w3JNh6OFdeXyMezKb02MDPPjldTwBdL8/n8PuzEb9/rHb3TwYInsC4nRQJenDB5GlHHbnZALR8HrTpPCoWQxScl+JMhdlbyuldgyM1qwJxqMVyyRb7XohVvS
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(366004)(8936002)(6486002)(76116006)(316002)(6512007)(36756003)(4326008)(122000001)(66556008)(5660300002)(64756008)(66946007)(66446008)(6506007)(66476007)(186003)(2906002)(91956017)(31686004)(86362001)(508600001)(26005)(38070700005)(110136005)(8676002)(38100700002)(71200400001)(7416002)(31696002)(2616005)(54906003)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SUpJaVdvajN0aFh6VzJreXRXc2FicDUyNjkrbGplajI5cFc3SURSOTRSTkxy?=
 =?utf-8?B?R252QXcyRmNBZFIzclJaVmNmeEZYNTBXL0poQmhuMmxidC9DSGRNbVVUMDls?=
 =?utf-8?B?LzljeXFmaThRREZvUmlVZDh1RHpVY2crQ3lEaEU3L3dtYWtxcGJMSlVteEJT?=
 =?utf-8?B?Wmt2Y2I2L2hQdThvR2hVVXRhb3ZCNTB2ck9JeUJOdXhHT2YvTDV4WTIvQWdV?=
 =?utf-8?B?blVPdnlUbStScXo0MzQrQWcyYnBWTk40aFQyQmpiUTZXa2kxVnlja1BJMGt2?=
 =?utf-8?B?VGdFNFRQY3pyOEczeTRSelBFVkVIRGxQNTBpbHhTTUFUUTF2VEdkYzhYa2xZ?=
 =?utf-8?B?REF1WmtLZGRJbFhpNGQyNEh6dTNXUEtxQXNjTUM0MURTajZLTm1SVE1UWFI4?=
 =?utf-8?B?SFcxcFBqSHRNZ28wZnZDekNUZ2ZzY0ZGYjVIdGEwcUdZZEtWNlF1aW1uUWJB?=
 =?utf-8?B?SmNDMk9RZ3B1NUJOQW83Nm9hNUNvbXV5ZGNjNEtrL3RVU2NhMmRnLzEwSXNt?=
 =?utf-8?B?N2VaWlZReW5waHBpOFk5S0c3ZnMzUG5vR1pLN2hqVWM0RWdpYmhWZjV3ZEha?=
 =?utf-8?B?a1NuY0Qzcmg1d1hwY1ZKaHl6ZTY2UU1ad1lCZkIyaXV0Wm85RTZsWHRSN3Ev?=
 =?utf-8?B?amtZVWZQVm9wVHozZ2kxMnZ0Z0tFQjNheVFMRjZJUVdoY1RiZU9QSy9sdXR3?=
 =?utf-8?B?YjVnaTAwUjJRZVRvWDlQVmJzNjFoa1g4ai9yRUlmT3U2WTIveUtxZmp1Sm80?=
 =?utf-8?B?UUJCZmJLMEFIN0dtVmlrQWVZYzhRYkVWTi9aejJTa2hvcnl1YTMrSGZyeTlP?=
 =?utf-8?B?RndwMEV3cHYwb3V0SHRRR0s2bk1XMW1wSXFzT1VzSzNPV1VhWjlHUDdZMzRL?=
 =?utf-8?B?TVNNaFB1aWw1d3lBa3EzRThQUlIyUUFuZ3U0UkVkTlFhRUM1NHAvSUxSOW5x?=
 =?utf-8?B?YTgxVURhYzV4UDJIeGEwTDJUK09TV1IweXNKWXZSMmwzZHNiYmJUZUU3amU2?=
 =?utf-8?B?elRXSStCM1l6MnowV25QRnoyeVROOExvakZiMEtsV0FORkxjYXl2VkRJcGV6?=
 =?utf-8?B?TUtZajF0WXNHTGo4OUU0cDVoNWM5YUNKU1ZqTGtMb0NaQ296a3lKeU1nd3F4?=
 =?utf-8?B?VjJHZU0xbFhaSzlRemtCcklzSVhyQ1BLUGJzN2dIM1ZXdnE0NFFBTXhkTFB5?=
 =?utf-8?B?dFpHQlJEbyt2ZDZiclZGZzJzWXhLTEpzY3dob3lTNUVsK3FadjNaUnVIUGFp?=
 =?utf-8?B?RlN2ejhGR09LcGJBSHNEQlNYU2VxR2gzaUsxUEw5c0YwQ1RXaUpqZ1ZMQUVK?=
 =?utf-8?B?bFc5V1VMMFdrUGdsMXg0RkdrWllqWDhxd1NWNStlYmViOWM2MlVOT0tkeVZj?=
 =?utf-8?B?aXlIbnRnTzMzVVcvUm1RdGRqNXBEVG9ia0I4Y3RmYUd5V0c2SFNjdXhDNHN3?=
 =?utf-8?B?U2tTN0JvN2FKMGZvZFRJdjI1Mzl4TUlvQ3NXUFJvMXd2OWl1cnlyMUlVTXF2?=
 =?utf-8?B?RWVoeWc2R2lUUE1Ic0NWRHl3dVNVdWYrREdlOXNEMU9NdjMyZndkWktwTnRD?=
 =?utf-8?B?SG9mU0JKR0FMc3JNRmRkL2tXbDlZUHJCRnhQdmNzR0V4RnZvUmVlMkNzN2R3?=
 =?utf-8?B?UHhLTU0zaytVdzBsb2FoSFcyd0pVQU5na0wwc2RnK01EaWloZUt2YXc0S2dL?=
 =?utf-8?B?dS9vVXorY0dLejJPOSs5c2hleWFQMFJ1RWFlTFVBTERncy9PV1VndnBNTloy?=
 =?utf-8?B?OGI0eFA3WjF4ZEZ3RmJPNXE2OWRXdVA1UWtyYzJvWEhxNkh5UlZSM1l2em9o?=
 =?utf-8?B?TkpVZ0YyRFErdG92WjhRc2xDMDFTUE0waElpdTNrRWlJdmpsWGRtYWphRUZW?=
 =?utf-8?B?cnZKWTFHT1JwV2pTejlLMUhiSU4xQUMydHRNQzBuL041Nnd0UGZXYllUTTEx?=
 =?utf-8?B?M0I1UlpLM3dFNGcxbEJZMXFzalZzTDh4MThEMUM1bmNxcWVYTE0xbDBETDFy?=
 =?utf-8?B?ZXg1T0MzaWtBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D99CEF4C596975439DB154DE113E623A@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e2d13e1f-6e3f-4cac-34c4-08d993dad5da
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2021 15:03:54.8312 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: christophe.leroy@csgroup.eu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR2P264MB0802
Received-SPF: pass client-ip=40.107.9.82;
 envelope-from=christophe.leroy@csgroup.eu;
 helo=FRA01-MR2-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "dbarboza@redhat.com" <dbarboza@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Greg Kurz <groug@kaod.org>,
 Alexander Graf <agraf@csgraf.de>, qemu-ppc <qemu-ppc@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?utf-8?B?SGVydsOpIFBvdXNzaW5lYXU=?= <hpoussin@reactos.org>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCkxlIDIwLzEwLzIwMjEgw6AgMTY6NDEsIEPDqWRyaWMgTGUgR29hdGVyIGEgw6ljcml0wqA6
DQo+IGluaXRbMV06IGlsbGVnYWwgaW5zdHJ1Y3Rpb24gKDQpIGF0IDEwMDM4MzgwIG5pcCAxMDAz
ODM4MCBsciAxMDAzNGJlMCANCj4gY29kZSAxIGluIGJ1c3lib3hbMTAwMDAwMDArNjEwMDBdDQo+
IGluaXRbMV06IGNvZGU6IDYxMjljMDAwIDdmOTE0ODQwIDQxOWQwMzUwIDU2MmJlMTNlIDM4MGJm
ZmZmIDJiODAwMDIwIA0KPiA0MDlkMDMxNCAzZDIwNDMzMA0KPiBpbml0WzFdOiBjb2RlOiA2YzAw
ODAwMCA5MTIxMDAxOCAzZDIwMTAwNiA5MDAxMDAxYyA8YzFhOWI4MzQ+IGM4MDEwMDE4IA0KPiBm
YzAwNjgyOCBmYzAwMDAxOA0KDQpUaGF0J3MgYSBmbG9hdGluZyBwb2ludCBpbnN0cnVjdGlvbi4N
Cg0KWW91IG5lZWQgQ09ORklHX01BVEhfRU1VTEFUSU9OLg0KDQoNCj4gS2VybmVsIHBhbmljIC0g
bm90IHN5bmNpbmc6IEF0dGVtcHRlZCB0byBraWxsIGluaXQhIGV4aXRjb2RlPTB4MDAwMDAwMDQN
Cj4gQ1BVOiAwIFBJRDogMSBDb21tOiBpbml0IE5vdCB0YWludGVkIDUuMTUuMC1yYzYtZGlydHkg
IzQNCj4gQ2FsbCBUcmFjZToNCj4gW2MwODE1ZGEwXSBbYzAwMjQ0MDhdIHBhbmljKzB4MTFjLzB4
MmUwICh1bnJlbGlhYmxlKQ0KPiBbYzA4MTVlMDBdIFtjMDAyNjAzOF0gZG9fZXhpdCsweDhiMC8w
eDkwOA0KPiBbYzA4MTVlNTBdIFtjMDAyNzA0NF0gZG9fZ3JvdXBfZXhpdCsweDM0LzB4OWMNCj4g
W2MwODE1ZTcwXSBbYzAwMzNiZDBdIGdldF9zaWduYWwrMHgxNzQvMHg3MzQNCj4gW2MwODE1ZWMw
XSBbYzAwMDc3OTRdIGRvX25vdGlmeV9yZXN1bWUrMHg3MC8weDJiMA0KPiBbYzA4MTVmMjBdIFtj
MDAwY2E3Y10gaW50ZXJydXB0X2V4aXRfdXNlcl9wcmVwYXJlX21haW4rMHg2Yy8weGUwDQo+IFtj
MDgxNWY0MF0gW2MwMDBmMWUwXSBpbnRlcnJ1cHRfcmV0dXJuKzB4MTQvMHgxNDgNCj4gLS0tIGlu
dGVycnVwdDogNzAwIGF0IDB4MTAwMzgzODANCj4gTklQOsKgIDEwMDM4MzgwIExSOiAxMDAzNGJl
MCBDVFI6IDEwMDBkYjYwDQo+IFJFR1M6IGMwODE1ZjUwIFRSQVA6IDA3MDDCoMKgIE5vdCB0YWlu
dGVkwqAgKDUuMTUuMC1yYzYtZGlydHkpDQo+IE1TUjrCoCAwMDA4YzAzMCA8RUUsUFIsSVIsRFI+
wqAgQ1I6IDQwMDAwMDI0wqAgWEVSOiAwMDAwMDAwMA0KPiANCj4gR1BSMDA6IDgwMDAwMDVhIGJm
OWM3ZDkwIDEwMDc5MWY4IDAwMDAwNWE0IGJmOWM4MTQ0IDAwMDAwMDFmIDAwMDAwMDAxIA0KPiAx
MDAwMDI2Yw0KPiBHUFIwODogMDAwMGMwMzAgMTAwNjAwMDAgMDAwMDEwMDAgMDAwMDAwNWIgNzI2
NTY3NzMgMDAwMDAwMDAgMDAwMDAwMDAgDQo+IDAwMDAwMDAwDQo+IEdQUjE2OiAwMDAwMDAwMCAw
MDAwMDViMCAwMDAwMDAwMCAxMDA3MjZlYyAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCANCj4g
MDAwMDAwMDANCj4gR1BSMjQ6IDAwMDAwMDAwIDAwMDAwMDAyIDAwMDAwMDAyIGJmOWM4MTQ0IDEw
MDcwMDAwIDAwMDAwNWE0IGJmOWM4MTQ0IA0KPiAwMDAwMDVhNA0KPiBOSVAgWzEwMDM4MzgwXSAw
eDEwMDM4MzgwDQo+IExSIFsxMDAzNGJlMF0gMHgxMDAzNGJlMA0KPiAtLS0gaW50ZXJydXB0OiA3
MDANCj4gUmVib290aW5nIGluIDE4MCBzZWNvbmRzLi4NCj4gUUVNVSA2LjEuNTAgbW9uaXRvciAt
IHR5cGUgJ2hlbHAnIGZvciBtb3JlIGluZm9ybWF0aW9u

