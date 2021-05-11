Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C25737A9F5
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 16:54:43 +0200 (CEST)
Received: from localhost ([::1]:34772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgTmU-0001tH-BL
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 10:54:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1lgTlC-0000b3-K4
 for qemu-devel@nongnu.org; Tue, 11 May 2021 10:53:22 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:24773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1lgTlA-0002Vp-87
 for qemu-devel@nongnu.org; Tue, 11 May 2021 10:53:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1620744800; x=1621349600;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version:subject;
 bh=VAK+rR968iKddhcjQNtRlbRjlpJiTEabo5VrzKukmKU=;
 b=QFg3+mkqYos8sYWbRCpWSFXVQdT4goEPcJ7ndDIzAhCAm9KQQgbjaZDz
 ldfLSUkSKtTbTmXv+eE7/UQAvcmf/OfqbIJd8JmzAO0wdB8qonaxZ+wY9
 NVwFJNONDHvZcnhopxr7pNxlWB7dbkxHRfu28hR48PTmvNL4q4LSOn5C0 A=;
IronPort-SDR: MDKrA2Rur2qMnP5JnQaqR8Hw9jrtkaOrnChCe8ievV9aQiTKS99goFvA9oQArlqvA9GVwrGpVz
 WokuC2QGw7ct6tbssgBIxZeWCHly1QULFAy9t3CWrL13+3QFPaNxf/2d21NlwHGOpiFwr12ZwH
 3taaX9QmhxOWskkb6aXjSu/bqM6sCJzwxwXSb3lPqyEoN+maFrNiyNv9+wUFVpFwPtpDQBXDNe
 Fwwkmo9oEPviuAgzD8tTzXAwm2YzrvMZvwt1FVyyZE2REiRHncSW2laGg1QRbPa4WwsaBzk0K3
 sn8=
X-IronPort-RemoteIP: 104.47.55.177
X-IronPort-MID: 78696
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
Subject: RE: [PATCH  v1 08/25] gitlab: add build-user-hexagon test
Thread-Topic: Re: [PATCH  v1 08/25] gitlab: add build-user-hexagon test
Received: from mail-bn8nam12lp2177.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.177])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 14:53:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GGzmAMYir7yxokzzWoAlEi45SCJ69cNZeZstMRk1amziShAPhVnK6Dr09DGNwysvtcfIXc388JMe61J9xVX+ri79f8cpbLOX3ACmUZFHPrfNj9Fv491Jrd4Xywdh2c6stbrS/3p284GGBVv2/8D74Q2bGnRLT1R7Ep4S/GH3Tt8PQvaXtFyfVIjWk4qjW4+fYzZp9OjFp1Wu83IKeKy9nbttU9oEOwrDTpwg/9zds34I0qKoY/wg1IO2bo5fGJvXWiBo45R6U59gJJ6NlngJtAAWBrpTclGT55p3WyUAAUnXaYtUHpu3uYwiyYRAX5Hf/BlEgc8tuf315VZtSU57BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VAK+rR968iKddhcjQNtRlbRjlpJiTEabo5VrzKukmKU=;
 b=YBmyj6PUK2Qj46n11YkK4N/09vGMxpyfAWRFaVRdHhcg3p19yhBmSwEw+jjUY7K+AocyCQjINMRS1DgzmiaQ7ofJ9iIQPWzcPcdDvZGblNAvFyA3Z7oJ8THBoh6CGDlqm+osh6+2UkS+JcSV8IZ9I7q98tRr5RTD/xFRtOB32QQ/7NErCHaGnAuOeoDK0xZXGQC9ipjzcecirUe6xn1Qg+vXWnIprgkoLCcSrOC/AO4IecjgAvYCp6lwaZm+cSx/xKdqjEmvcAl7XwtRK/O9ruwZJ09wy1sKjjMr/53ieRBazPREhbibcmyNxB9cj2NbMHniYV/w6BJJyw9zSokBWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN6PR02MB4205.namprd02.prod.outlook.com (2603:10b6:805:35::17)
 by SA2PR02MB7596.namprd02.prod.outlook.com (2603:10b6:806:147::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Tue, 11 May
 2021 14:53:11 +0000
Received: from SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::5cc7:850c:8b7e:565a]) by SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::5cc7:850c:8b7e:565a%6]) with mapi id 15.20.4129.025; Tue, 11 May 2021
 14:53:11 +0000
From: Brian Cain <bcain@quicinc.com>
To: =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Thread-Index: AQHXRnRw1ypMX1wl/UCjmk+HoBXf2areXQNg
Date: Tue, 11 May 2021 14:53:11 +0000
Message-ID: <SN6PR02MB42050836329B89FA1A4C21B1B8539@SN6PR02MB4205.namprd02.prod.outlook.com>
References: <20210419145435.14083-1-alex.bennee@linaro.org>
 <20210419145435.14083-9-alex.bennee@linaro.org> <871radgwgg.fsf@linaro.org>
In-Reply-To: <871radgwgg.fsf@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [104.54.226.75]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ece47a29-472d-459d-685e-08d9148c7f61
x-ms-traffictypediagnostic: SA2PR02MB7596:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA2PR02MB75961FF6D1F878A0FC34E216B8539@SA2PR02MB7596.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aH9eS/6bwQfncwUrDoCm/NhgP03tlbUKphBo6mg2r6kDe//yoD6uAcoMLWfFxam2fJpCbNaLTM1R/mZ/rAfVdJCqQ3OtvyfBKoZtQmkWmZWw99/6rLaIOPWcRySGjK/hsmE7h2dp7lPsQFccro927d1r3XCVE88P/Q2ER/hIqpQQuAxGhde2EUJRrnZDR1cOO7MRjeuBEUlHPpzIuu1zOLjT/vxzSVHRG5K/ohZw0h52yXzXWYKjgZY2xz8zw/0zHVdoQ+XmhqtUvvHjtycZh/+TJ6udsOJ4N2mGxLbW0bvYflcYXj3YtWeA3N+LDoRdS9qBSAfpQLnmq7IgWr1mUoRrwBjZNbWTAOPPl7Bfum5JQlsb5+BQ+qJwkqpuVNDxXghI/X2LyCQCxfCjD4H0vgmaxWgOYx9nt6nN0tX5XVxIEut3+2RiCLHlgnEu1u0ENnfbwPt6xzmnEY3C9oDXa369mOiG5x5ZrMlqeM8p6VYSmr17JUWz9iaZ12igT9vE7YAAwUhAkGAQyOco9nNFVGOISwzqSRc0XCHBqKk8AvedqXFCx2tHgG2hkkjOjo56hK5Csln6d+/CTucuSMfStFb0e91jQtx98Pnm3GPKB44=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4205.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(396003)(39860400002)(366004)(5660300002)(478600001)(66574015)(8676002)(83380400001)(66446008)(7416002)(122000001)(66556008)(186003)(66476007)(38100700002)(86362001)(64756008)(66946007)(76116006)(4326008)(54906003)(8936002)(52536014)(7696005)(6506007)(9686003)(71200400001)(107886003)(110136005)(33656002)(2906002)(55016002)(26005)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZDV5eFBXazVSZ3gzQm1XSXFscFg5Q1RRY2F0LzQ0ZnoxMXJRYVQ0WGZWRXJl?=
 =?utf-8?B?Z2pDQ0dqSUUwS2hWQmswVUZVdis0NUp5dHpiajJhNUFUdktRRlB3NzA4eE1C?=
 =?utf-8?B?UWl1TktDc2kyUXF1U1FaVjNRVExwRG1ndjhYZFQ5ZTY3OStZeWVUZkxFa1Vj?=
 =?utf-8?B?WEdkck9iTVhlRVNGT3dySlVJOXNpSHNuRVNjd2cwZFFXZ29zMDFyWXRLejJk?=
 =?utf-8?B?OXBXOVRIb290aks4bk92TU1JLzNuRDl5N0lSMTZPWEc1SFM3b05aSWhKZjVW?=
 =?utf-8?B?eHQ1b2J6amtKNTJoQkNZekJ5MjB4NW8yT0swM1NCVDJHRlU0Z2xlY1BDYUQ3?=
 =?utf-8?B?RUNYY244TzQ2VGplaDhYVitjd3ZSMnNhUHh1RmNUKzRkNkxsVjVTcjdmQ3RW?=
 =?utf-8?B?TnRtajR1SHF3L0E5TnVsYTFMZDZoa2prN3BTUnZqU0dxL3pBZXJ4d3FSM0Jh?=
 =?utf-8?B?SDdGYnJMRDBOU01wcWtRaklha1pBS0VSQWdvQzBJTjVMVEVPNExoaHdvRUww?=
 =?utf-8?B?M2k5cWozaFVxVDAzQm1WbzBPSC9RK1VWVHVmSEQ0Qi92UUE3YVdRMDhHNzVo?=
 =?utf-8?B?NUdvUnVaL1V5bkFVQk9CQVc2RzlsQmVQNTVoSzFsYk5ueDlhZWhoTTBpdllP?=
 =?utf-8?B?MEJWQ1JnUTVRR1FIWkRnZUxsYklzZmFKTFd2WmtaTHFCSytCWlZmdm9iYUdt?=
 =?utf-8?B?Rk9peG5GQVJaVWhocmlWL2JxNXF2NGVIVjdhbFA5WHFOSjg2eW9qRW9Vc2lx?=
 =?utf-8?B?L1EwOERlRkxjVzJWT0VheFhxajFpallyR3VDNGZMaVNxMXpwcXBhOGs1NTBI?=
 =?utf-8?B?bEhBOThBR25McGtiWFVBV1lpcVpzem5vNmwyZVJEZDNubEd4T1VXWERzWWlU?=
 =?utf-8?B?bXZpYThBY0pLU01PL2loRDh2Ynl6cXErVk9Gb2JTSjR3bUxmY1FDK21NaGVk?=
 =?utf-8?B?UVNLSTdCRVhkNG9YcVcvSVlLUnZUMUtNcXRhNWJUenRPWTJ2ZUNxSXY5RjND?=
 =?utf-8?B?ODd0WEdFREd6YVJMMmpjUEl2bWdrakVBSUVpdS9lZGgyM3U1bWZ4UldVbFc0?=
 =?utf-8?B?MGZwcms3QW5IeWlSWEY3SHdUUTJ0U2JvYktURDE5aE9JRDFMWWM0NFhzOFNn?=
 =?utf-8?B?S29PMjU4QzhsWHJzc2JvV3ZpQWxValhzZVlUN0JSSFhCQlZKZFRrRjVGQjg1?=
 =?utf-8?B?R2NOeWs5czA1VmlSTGY4OGpNVDd3WWxBM3B2ZGl1S3YrcTFTemRDeUM2Mzk4?=
 =?utf-8?B?YkpEVWVzcmU1a3hVa25JVDRtMmVYc0pQQ0x3QytrQ3BqMUl3NVI3akhWTmtz?=
 =?utf-8?B?YUJEOWUzakgrWVM3WnR3MDNNaVRrYVZjeHhaNU1vSHhlcjJUTkZ4SXJiMlJQ?=
 =?utf-8?B?czhlcGhhYkY5S2lIWGt2bzl4emtQNjE3M1ZwaDFTY2x2R2RMa0FKa3pHaTFK?=
 =?utf-8?B?MGRhZ2VDQStuRE1rc09XUjBEOW9sc1graXNtNENyMExUelJHSVFWcWMybysy?=
 =?utf-8?B?VTd2dk56TVlOUlZEdm1MUS9DUVhvSXduRXZhT3I3OXNHUTR1K2p0Nm9rOEMy?=
 =?utf-8?B?REFsZHNWdVZNM2xleUdRYUpuSDNFcDNjRXlhOWE0azVKOTBubmd5RU9LTjYw?=
 =?utf-8?B?ZUxLWXJuTkNGeWhxYjYrUk9QNjhXd1dVMG5VOHhKSkQ3alc0ZjVLRFpMZ1Vj?=
 =?utf-8?B?azZNMnVzQmtCTEJYSkpvc0tTQWV5Sm1Ea0ozMnVudytrVE0wazdkQkx1dVhO?=
 =?utf-8?Q?Uzdfx+bygltbVUIY0ZxrJK3trnzThjwcZH2m5wD?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4205.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ece47a29-472d-459d-685e-08d9148c7f61
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2021 14:53:11.3073 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ijEoGObR5uUtX/+OIUWCQz15IHoICev5DCY89maRG2GJ0sJbNIAmZUu38ist9kuTf8uYbhv9kTxsU3Y4q4r/0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7596
Received-SPF: pass client-ip=216.71.140.77; envelope-from=bcain@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Cc: "fam@euphon.net" <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "f4bug@amsat.org" <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Taylor Simpson <tsimpson@quicinc.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "crosa@redhat.com" <crosa@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "aurelien@aurel32.net" <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbGV4IEJlbm7DqWUgPGFsZXgu
YmVubmVlQGxpbmFyby5vcmc+DQouLi4NCj4gV2hpY2ggbGVhZHMgdG8gdGhlIGNvbXBpbGVyIGNv
bXBsYWluaW5nOg0KPiANCj4gICBoZXhhZ29uLXVua25vd24tbGludXgtbXVzbC1jbGFuZyAgLVdu
by1pbmNvbXBhdGlibGUtcG9pbnRlci10eXBlcyAtDQo+IFduby11bmRlZmluZWQtaW50ZXJuYWwg
LWZuby11bnJvbGwtbG9vcHMgLVdhbGwgLVdlcnJvciAtTzAgLWcgLWZuby1zdHJpY3QtDQo+IGFs
aWFzaW5nIC1tdjY3IC1PMiAtc3RhdGljIC9ob21lDQo+ICAgL2FsZXguYmVubmVlL2xzcmMvcWVt
dS5naXQvdGVzdHMvdGNnL2hleGFnb24vY2lyYy5jIC1vIGNpcmMgIC1zdGF0aWMNCj4gICAvaG9t
ZS9hbGV4LmJlbm5lZS9sc3JjL3FlbXUuZ2l0L3Rlc3RzL3RjZy9oZXhhZ29uL2NpcmMuYzoyNTc6
MTogZXJyb3I6DQo+IHVua25vd24gcmVnaXN0ZXIgbmFtZSAnY3MwJyBpbiBhc20NCj4gICBURVNU
X0xPQURfSU1NKGIsICBjaGFyLCAgICAgICAgICAgYmJ1ZiwgTkJZVEVTLCAxLCBkKQ0KPiAgIF4N
Cj4gICAvaG9tZS9hbGV4LmJlbm5lZS9sc3JjL3FlbXUuZ2l0L3Rlc3RzL3RjZy9oZXhhZ29uL2Np
cmMuYzoyNDI6OTogbm90ZToNCj4gZXhwYW5kZWQgZnJvbSBtYWNybyAnVEVTVF9MT0FEX0lNTScN
Cj4gICAgICAgICAgIENJUkNfTE9BRF9JTU1fIyNTWihlbGVtZW50LCBwLCBCVUYsIHNpemUgKiBz
aXplb2YoVFlQRSksIChJTkMpKTsgXA0KPiAgICAgICAgICAgXg0KPiAgIDxzY3JhdGNoIHNwYWNl
Pjo5OjE6IG5vdGU6IGV4cGFuZGVkIGZyb20gaGVyZQ0KPiAgIENJUkNfTE9BRF9JTU1fYg0KPiAg
IF4NCj4gICAvaG9tZS9hbGV4LmJlbm5lZS9sc3JjL3FlbXUuZ2l0L3Rlc3RzL3RjZy9oZXhhZ29u
L2NpcmMuYzo3NTo1OiBub3RlOg0KPiBleHBhbmRlZCBmcm9tIG1hY3JvICdDSVJDX0xPQURfSU1N
X2InDQo+ICAgICAgIENJUkNfTE9BRF9JTU0oYiwgUkVTLCBBRERSLCBTVEFSVCwgTEVOLCBJTkMp
DQo+ICAgICAgIF4NCj4gICAvaG9tZS9hbGV4LmJlbm5lZS9sc3JjL3FlbXUuZ2l0L3Rlc3RzL3Rj
Zy9oZXhhZ29uL2NpcmMuYzo3MzoyMzogbm90ZToNCj4gZXhwYW5kZWQgZnJvbSBtYWNybyAnQ0lS
Q19MT0FEX0lNTScNCj4gICAgICAgICAgIDogInI0IiwgIm0wIiwgImNzMCIpDQo+IA0KPiBJIHN1
c3BlY3QgdGhlIGVhc2llc3QgdGhpbmcgdG8gZG8gaXMgdG8gZHJvcCB0aGUgcGF0Y2hlcyBhZ2Fp
biBzbyBJIGRvbid0IGhvbGQgdXANCj4gdGhlIHJlc3Qgb2YgdGVzdGluZy9uZXh0LiBJIGNhbiBp
bmNsdWRlIHRoZSBpbml0aWFsIGRvY2tlciBpbWFnZSBwYXRjaCBidXQgSQ0KPiB3b24ndCBlbmFi
bGUgaXQgaW4gY29uZmlndXJlLnNoL2dpdGxhYi4NCg0KU29ycnkgLS0gSSBzZW50IGFsb25nIGEg
cGF0Y2ggdG8gdXBkYXRlIHRoZSBMTFZNX1NSQ19VUkwgc28gdGhhdCB3ZSB3b3VsZCBoYXZlIHRo
ZSBzdXBwb3J0IHdlIG5lZWQgZm9yIHRoaXMgdGVzdCBjYXNlLg0KDQo+IFdvdWxkIG9uZSBvZiB0
aGUgaGV4YWdvbiBndXlzIGJlIGFibGUgdG8gc2VuZCBhIG5ldyBpbWFnZSBhbmQgdmVyaWZ5IGl0
DQo+IHdvcmtzIHdpdGggdGhlIGN1cnJlbnQgdGVzdHMgaW4gbWFzdGVyPw0KDQpTdXJlLCBjYW4g
ZG8uICBEbyBJIG5lZWQgdG8gdXBkYXRlIHRoZSBjb250YWluZXIgcmVnaXN0cnkgaW4gZ2l0bGFi
IHNvbWVob3c/ICBPciBqdXN0IHNoYXJlIHRoZSBwYXRjaCB0byB1cGRhdGUgdGhlIERvY2tlcmZp
bGU/DQoNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVA
bGluYXJvLm9yZz4NCj4gPiBSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0
YnVnQGFtc2F0Lm9yZz4NCj4gPiBSZXZpZXdlZC1ieTogV2FpbmVyIGRvcyBTYW50b3MgTW9zY2hl
dHRhIDx3YWluZXJzbUByZWRoYXQuY29tPg0KPiA+IE1lc3NhZ2UtSWQ6IDwyMDIxMDMwNTA5MjMy
OC4zMTc5Mi03LWFsZXguYmVubmVlQGxpbmFyby5vcmc+DQo+ID4gLS0tDQo+ID4gIC5naXRsYWIt
Y2kueW1sIHwgMTEgKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlv
bnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS8uZ2l0bGFiLWNpLnltbCBiLy5naXRsYWItY2ku
eW1sIGluZGV4DQo+ID4gNTJkNjVkNmMwNC4uODdkMTE3MmIwMyAxMDA2NDQNCj4gPiAtLS0gYS8u
Z2l0bGFiLWNpLnltbA0KPiA+ICsrKyBiLy5naXRsYWItY2kueW1sDQo+ID4gQEAgLTQxMyw2ICs0
MTMsMTcgQEAgYnVpbGQtdXNlci1zdGF0aWM6DQo+ID4gICAgICBDT05GSUdVUkVfQVJHUzogLS1k
aXNhYmxlLXRvb2xzIC0tZGlzYWJsZS1zeXN0ZW0gLS1zdGF0aWMNCj4gPiAgICAgIE1BS0VfQ0hF
Q0tfQVJHUzogY2hlY2stdGNnDQo+ID4NCj4gPiArIyBCZWNhdXNlIHRoZSBoZXhhZ29uIGNyb3Nz
LWNvbXBpbGVyIHRha2VzIHNvIGxvbmcgdG8gYnVpbGQgd2UgZG9uJ3QNCj4gPiArcmVseSAjIG9u
IHRoZSBDSSBzeXN0ZW0gdG8gYnVpbGQgaXQgYW5kIGhlbmNlIHRoaXMgam9iIGhhcyBubw0KPiA+
ICtkZXBlbmRlbmN5ICMgZGVjbGFyZWQuIFRoZSBpbWFnZSBpcyBtYW51YWxseSB1cGxvYWRlZC4N
Cj4gPiArYnVpbGQtdXNlci1oZXhhZ29uOg0KPiA+ICsgIDw8OiAqbmF0aXZlX2J1aWxkX2pvYl9k
ZWZpbml0aW9uDQo+ID4gKyAgdmFyaWFibGVzOg0KPiA+ICsgICAgSU1BR0U6IGRlYmlhbi1oZXhh
Z29uLWNyb3NzDQo+ID4gKyAgICBUQVJHRVRTOiBoZXhhZ29uLWxpbnV4LXVzZXINCj4gPiArICAg
IENPTkZJR1VSRV9BUkdTOiAtLWRpc2FibGUtdG9vbHMgLS1kaXNhYmxlLWRvY3MgLS1lbmFibGUt
ZGVidWctdGNnDQo+ID4gKyAgICBNQUtFX0NIRUNLX0FSR1M6IGNoZWNrLXRjZw0KPiA+ICsNCj4g
PiAgIyBPbmx5IGJ1aWxkIHRoZSBzb2Z0bW11IHRhcmdldHMgd2UgaGF2ZSBjaGVjay10Y2cgdGVz
dHMgZm9yDQo+ID4gIGJ1aWxkLXNvbWUtc29mdG1tdToNCj4gPiAgICA8PDogKm5hdGl2ZV9idWls
ZF9qb2JfZGVmaW5pdGlvbg0KPiANCj4gDQo+IC0tDQo+IEFsZXggQmVubsOpZQ0K

