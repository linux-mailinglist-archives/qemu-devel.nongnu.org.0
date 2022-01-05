Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E7D4853AC
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 14:39:20 +0100 (CET)
Received: from localhost ([::1]:53962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n56Va-0003nW-IB
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 08:39:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad.schwarz@siemens.com>)
 id 1n56Ij-000174-4o
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 08:26:02 -0500
Received: from mail-eopbgr60077.outbound.protection.outlook.com
 ([40.107.6.77]:7798 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad.schwarz@siemens.com>)
 id 1n56If-0000g8-IG
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 08:26:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jaBR5mwl834zAZPcSBeqjJozsQALHijOZuSQz3rw9jR2919idvMf6XhVNMjEbHseu3+5HastLXlto08YN4Ssjb6kOMHddegWdGOXtPHBdkRSDydi6U2ObCS1KBvPkr4sIMbQ4M6Sd3UW5Qrsr3TnwCzsH0nuLBcewsOkIFy6mDA5G5Gr6LLcMHwdVvTCUxo2rFfeFNRcVTkbkXTZPWw+7KYc9//5oxDWPTPWxpM9SRy/GhM4rScADBUgodoNEvZA96TMvoHynYRtCx6tR68yYy8Sty95QVVSjZohbO4Hcoa6lbPwICrrLIcD3VnGRR/S9B02AE+BJjEPutcoqtvZ4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8NN7aEliQDVOn3veyS4wLOyRi95/RHFmQw9ZK+HJsSs=;
 b=Kmq4gfHRao/WDQzBxGgN/I3UPnjZdUYtMdd+Ehg8zSgpjNVxTdSsC02sYmfGMPsCDyxfv4qnW98baBhT55oHJ22NdFRyebjts1pis/q0F/wM0Ge1SM1cwb0mY5hnYOy6dknbw/q1o5hmotTn7uhYdxY03lR2udGM6JELUO4agEQUqpjWPsskHlLULbV/IrxEiDbgcXIFiqN25t2WnXO/Ln2uRaqwqRGNh866JIOFfv93jwNGGwOh+qZmeBJWDIXB1qC2rK3XUzpbt0E02Ilsr1yvqcOrNlK3+6Yfg6mWyGbb8cUsvDzDu92quN/K/swPEjPLHa2n0C1N6yd7wdmplg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.73) smtp.rcpttodomain=gmail.com smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8NN7aEliQDVOn3veyS4wLOyRi95/RHFmQw9ZK+HJsSs=;
 b=uxGzUqbFtrrHW2zJSnAsXpncYS6+BnNvOkE3UeYYni74xv7KNXxhMXtssyg4o63F1L0AriVstP2MTOCP/JMexA96pXkafV9oOnIQB4m8Y0tecwBLLGduXsoLXqYEgzaV7+aivyvYIk2I8LTdslnBT/4EyYsfwRmYAeA25V/OANezdHpxzV+e/O+pUMa4ulb1v2Qu4IC7pifrrTxKCYxvsDyEkYyg1T+/HE+NE+bRNgjcGOdOHEqXgCHcBbCdSH2Cwq2iTOF8YWypjHdcg0TbrVJp/sORuN2K49x2ikujpV/vW9IvhouCYFtVQ/36SvnRqsDdLEYOjI+F8MIGNx8FvQ==
Received: from SV0P279CA0063.NORP279.PROD.OUTLOOK.COM (2603:10a6:f10:14::14)
 by HE1PR10MB1547.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:7:58::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Wed, 5 Jan
 2022 13:25:52 +0000
Received: from HE1EUR01FT033.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:f10:14:cafe::c9) by SV0P279CA0063.outlook.office365.com
 (2603:10a6:f10:14::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7 via Frontend
 Transport; Wed, 5 Jan 2022 13:25:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.73)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.73 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.73; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.73) by
 HE1EUR01FT033.mail.protection.outlook.com (10.152.0.178) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4867.9 via Frontend Transport; Wed, 5 Jan 2022 13:25:52 +0000
Received: from DEMCHDC8A1A.ad011.siemens.net (139.25.226.107) by
 DEMCHDC9SNA.ad011.siemens.net (194.138.21.73) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 5 Jan 2022 14:25:51 +0100
Received: from DEMCHDC8A1A.ad011.siemens.net (139.25.226.107) by
 DEMCHDC8A1A.ad011.siemens.net (139.25.226.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 5 Jan 2022 14:25:51 +0100
Received: from DEMCHDC8A1A.ad011.siemens.net ([139.25.226.107]) by
 DEMCHDC8A1A.ad011.siemens.net ([139.25.226.107]) with mapi id 15.01.2375.017; 
 Wed, 5 Jan 2022 14:25:51 +0100
From: "Schwarz, Konrad" <konrad.schwarz@siemens.com>
To: Alistair Francis <alistair23@gmail.com>
Subject: RE: [PATCH v2 4/5] RISC-V: Typed CSRs in gdbserver
Thread-Topic: [PATCH v2 4/5] RISC-V: Typed CSRs in gdbserver
Thread-Index: AQHYAYMLR0Cx5EhjlkWmNt5NhqkcMqxTXGOAgAEL27A=
Date: Wed, 5 Jan 2022 13:25:51 +0000
Message-ID: <6251524999b443f6b91914ff59cdbfa1@siemens.com>
References: <00a79b65-288f-f17c-abe4-fcfd3f7971fd@oth-regensburg.de>
 <cover.1641309725.git.konrad.schwarz@siemens.com>
 <79194a3cf9e3bd1df41401eeee901055b8702c7b.1641309725.git.konrad.schwarz@siemens.com>
 <CAKmqyKNjPRt2kgyELPQF_c0eGwXajapYgcMYsLja7H3EuvVq+A@mail.gmail.com>
In-Reply-To: <CAKmqyKNjPRt2kgyELPQF_c0eGwXajapYgcMYsLja7H3EuvVq+A@mail.gmail.com>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Enabled=true;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SetDate=2022-01-05T13:25:50Z; 
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Method=Standard;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Name=restricted-default;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ActionId=5ac02edf-8ffe-40f6-bb97-dc90ada6431a;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ContentBits=0
document_confidentiality: Restricted
x-originating-ip: [139.21.146.198]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71b02049-63b2-40fd-9d9a-08d9d04ee565
X-MS-TrafficTypeDiagnostic: HE1PR10MB1547:EE_
X-Microsoft-Antispam-PRVS: <HE1PR10MB154708FED324B59FB8E637278A4B9@HE1PR10MB1547.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TRsE3lVc/qqvnsRnGg3odrH+LJy8b44YKAlXzPbjAjk9mwhpKqaEg2/5q7RvPiS3cCeQGkBnwiSjjYNO6nvkMeB/l+UxaqUPCOYtHLv3dZgkxRZ9hb0SQStf++yLOfsOsO4jnThUWEvmRAMA1Rc+Pmn6Q1+M80ElbV4U4pKEL0pCS17znIrWR5QcyCxT3AhlQ5CemKEyAy8qQOhOML/2lj8RXPIp5rWNejxxzQDbvxvbsJpIXK4yT6e7awnvitB2GK+MaOIwV63olaBciOSV+K34FDOM3LB+o8ayHgLw5/fSf3lXTJ8m7zfV6dmwCDtdliyWgA1Z2sW0ZxfxeB7OS4HchH4KDhly9gFPxCO8ZcZ7fuhvoBeHH0/lZnxD6Hd8P7G/yG15k5XuQ74NmMR8BLy43W00f/Lc3iUMDBknLZHz5DWDBqbB1QIhVYw53immbkeyfzH3IYjuG3AqFYxKaz8OnAK3vSLe8dnT2+TXsMuQC3NMkFKjH185o3CIOt30seVwVIGOKNhcl+lCd5abOKf+MyGyVd9+otvAGB5d+my/LdQZSYneKYOoV1qzChiXpb1qTGM+GKnIbNIJjiScyH+1lY7xmgA+MMUCJwWi3aaMqxWAFpSyCExIK7u0WKblXRiPb+uYZmFXFmYLsz2ZfA+MUg67pE8EqGW3+P8aOj237tbDPXtJ0Kd+S1g01c7pDvTxhVN15BOTSiIL6XH3dvSYDa2M/szn1eUo41evjLhoaXIcnEl4N8geqKuUjLlQUhCWbajiU8XHsz/8cmSZ6A7uYVJGLTuU+C5DJQbQ0Wg=
X-Forefront-Antispam-Report: CIP:194.138.21.73; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:hybrid.siemens.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700002)(36840700001)(46966006)(26005)(82960400001)(2906002)(186003)(6916009)(24736004)(54906003)(336012)(40460700001)(508600001)(108616005)(81166007)(36860700001)(86362001)(2616005)(36756003)(5660300002)(82310400004)(356005)(956004)(70206006)(8676002)(47076005)(83380400001)(4326008)(316002)(70586007)(53546011)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 13:25:52.3523 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71b02049-63b2-40fd-9d9a-08d9d04ee565
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a; Ip=[194.138.21.73];
 Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR01FT033.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR10MB1547
Received-SPF: pass client-ip=40.107.6.77;
 envelope-from=konrad.schwarz@siemens.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWxpc3RhaXIgRnJh
bmNpcyA8YWxpc3RhaXIyM0BnbWFpbC5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIEphbnVhcnkgNCwg
MjAyMiAyMzoxMg0KPiBUbzogU2Nod2FyeiwgS29ucmFkIChUIENFRCBTRVMtREUpIDxrb25yYWQu
c2Nod2FyekBzaWVtZW5zLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiA0LzVdIFJJU0Mt
VjogVHlwZWQgQ1NScyBpbiBnZGJzZXJ2ZXINCj4gDQo+IE9uIFdlZCwgSmFuIDUsIDIwMjIgYXQg
MTo1NiBBTSBLb25yYWQgU2Nod2Fyeg0KPiA8a29ucmFkLnNjaHdhcnpAc2llbWVucy5jb20+IHdy
b3RlOg0KPiA+IGRpZmYgLS1naXQgYS90YXJnZXQvcmlzY3YvY3NyLmMgYi90YXJnZXQvcmlzY3Yv
Y3NyLmMNCj4gPiBpbmRleCA5ZjQxOTU0ODk0Li41NTdiNGFmZTBlIDEwMDY0NA0KPiA+IC0tLSBh
L3RhcmdldC9yaXNjdi9jc3IuYw0KPiA+ICsrKyBiL3RhcmdldC9yaXNjdi9jc3IuYw0KPiA+IEBA
IC0zLDYgKzMsNyBAQA0KPiA+ICAgKg0KPiA+ICAgKiBDb3B5cmlnaHQgKGMpIDIwMTYtMjAxNyBT
YWdhciBLYXJhbmRpa2FyLCBzYWdhcmtAZWVjcy5iZXJrZWxleS5lZHUNCj4gPiAgICogQ29weXJp
Z2h0IChjKSAyMDE3LTIwMTggU2lGaXZlLCBJbmMuDQo+ID4gKyAqIENvcHlyaWdodCAoYykgMjAy
MSBTaWVtZW5zIEFHLCBrb25yYWQuc2Nod2FyekBzaWVtZW5zLmNvbQ0KPiANCj4gUGxlYXNlIGRv
bid0IGFkZCB0aGVzZSB0byBleGlzdGluZyBmaWxlcy4gSW4gdGhpcyBjYXNlIHlvdSBoYXZlIGp1
c3QNCj4gYWRkZWQgYSBuZXdsaW5lIHRvIHRoaXMgZmlsZQ0KDQpTb3JyeSwgSSBkb24ndCBrbm93
IGhvdyB0aGF0IHNsaXBwZWQgdGhyb3VnaC4NCkkgb3JpZ2luYWxseSBkaWRuJ3QgaGF2ZSBhbnkg
Y29weXJpZ2h0IG1lc3NhZ2VzLCB0byB3aGljaCBteSBjb21wYW55IG9iamVjdGVkLA0KYW5kIEkg
Z3Vlc3MgSSBvdmVyY29tcGVuc2F0ZWQuDQogDQo+IGRpZmYgLS1naXQgYS90YXJnZXQvcmlzY3Yv
Y3NyMzItb3AtZ2Ric2VydmVyLmggYi90YXJnZXQvcmlzY3YvY3NyMzItb3AtZ2Ric2VydmVyLmgN
Cj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAuLmU4ZWM1Mjdm
MjMNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvdGFyZ2V0L3Jpc2N2L2NzcjMyLW9wLWdk
YnNlcnZlci5oDQo+ID4gQEAgLTAsMCArMSwxMDkgQEANCj4gPiArLyogQ29weXJpZ2h0IChjKSAy
MDIxIFNpZW1lbnMgQUcsIGtvbnJhZC5zY2h3YXJ6QHNpZW1lbnMuY29tICovDQo+IA0KPiBBbGwg
b2YgdGhlc2UgZmlsZXMgc2hvdWxkIGhhdmUgdGhlIHVzdWFsIGZpbGUgYm9pbGVyIHBsYXRlDQoN
Ck9LLCBJJ2xsIHRyeSB0byBmaWd1cmUgb3V0IHNvbWV0aGluZy4NCg0KPiA+ICsjaWYgIWRlZmlu
ZWQoQ09ORklHX1VTRVJfT05MWSkNCj4gPiArIyAgaWZkZWYgVEFSR0VUX1JJU0NWNjQNCj4gPiAr
IyAgICBpbmNsdWRlICJjc3I2NC1vcC1nZGJzZXJ2ZXIuaCINCj4gPiArIyAgZWxpZiBkZWZpbmVk
IFRBUkdFVF9SSVNDVjY0DQo+ID4gKyMgICAgaW5jbHVkZSAiY3NyMzItb3AtZ2Ric2VydmVyLmgi
DQo+IA0KPiBUaGlzIGRvZXNuJ3QgbG9vayByaWdodC4gYGlmIGRlZmluZWQgVEFSR0VUX1JJU0NW
NjRgIC0+IGBpbmNsdWRlDQo+ICJjc3IzMi1vcC1nZGJzZXJ2ZXIuaCJgPw0KDQpZb3UgYXJlIHF1
aXRlIHJpZ2h0LiANCg0KPiBBbHNvIHRoaXMgc2hvdWxkIGJlIGR5bmFtaWMgaW5zdGVhZCBvZiBi
YXNlZCBvbiB0aGUgYnVpbGQgdGltZSBDUFUsIGFzDQo+IHRoZSB1c2VyIGNvdWxkIHVzZSBhIDMy
LWJpdCBDUFUgb24gYSA2NC1iaXQgdGFyZ2V0IGJ1aWxkLg0KDQpJJ20gbm90IHN1cmUuICBUaGUg
bWFjaGluZSBpdHNlbGYgaXMgc3RpbGwgYSA2NC1iaXQgbWFjaGluZTsgaXRzIENTUnMgYXJlIDY0
IGJpdHMgbG9uZy4NCmBjc3IuYycsIHdoaWNoIGltcGxlbWVudHMgdGhlIENTUnMgY29udGFpbnMg
YW4gaW5zdGFuY2Ugb2YgIyBpZmRlZiBUQVJHRVRfUklTQ1Y2NCwNCnNvIHRoYXQgcGFydCBvZiB0
aGUgaW1wbGVtZW50YXRpb24gaXMgbm90IGR5bmFtaWMgZWl0aGVyLg0KDQpBbHNvLCBzb21lb25l
IHdobyBpcyBkZXZlbG9waW5nIDMyLWJpdCBzeXN0ZW0gc29mdHdhcmUgY2FuIGVhc2lseQ0Kc2lk
ZXN0ZXAgdGhlIGlzc3VlIGJ5IHVzaW5nIHRoZSAzMi1iaXQgdGFyZ2V0Lg0KDQpSZWdhcmRzDQpL
b25yYWQNCg==

