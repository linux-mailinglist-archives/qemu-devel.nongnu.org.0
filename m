Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9451836E21C
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 01:22:38 +0200 (CEST)
Received: from localhost ([::1]:46826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbtVt-0006M2-8B
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 19:22:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lbtTr-0005RA-DC
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 19:20:31 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:26717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lbtTm-0001i8-7e
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 19:20:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1619652026; x=1620256826;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=W/pBqgjdcnhi2uhw0yiiS299s/GcnxJGRT9DrxQmayQ=;
 b=HnOWy4Vpsmmu6fnepcZqVGO+nOlhbv5V4hK+cK9H5LORpfCJb/uFB2L4
 W9Zox5bduXpvtHzoJGhyJPfDCBdGWpa7StOUuQo6gYzzNJ2sRePRqjmNe
 utkWoyv5Jx1Xi8Iv5gCR4ryeB5H2YEAdI2WwFpNdVVLxvDfQJoFfguSRi 4=;
IronPort-SDR: T74ZaPHpffOFZIXRBzU2DKkx4VL2v6fT3G2vS/Y3/07d/rUaXSpfIybzm2dyjMd++nVNNxnqsy
 vEE6LB1rJWf0yDmDbQIWvWzF5qw/9fabM0AgaVW/jRB2raUSLlZ9x3aXEU/dDZnZGpp8sVkibm
 3Xi+ndLSRiq4Qm2SjAU4Ab4uI4CN/PYOjwvXIRse8vmyKV9xTFSJ62u16PeUu8NlrGciyEIU3D
 dx0h77Xz6Qe0rzihipckBszjVakrC6HVE+WnsV7OrXAazBDMA19MeFRKrvwDYKjynivsepqK9J
 hZw=
X-IronPort-RemoteIP: 104.47.56.175
X-IronPort-MID: 31333
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
Received: from mail-co1nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.175])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2021 23:20:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H4n4aFngM2JcHr9t/n49CWa/Yf5fQKZM1ux4csCGbH7rWfL98WlGEMoRPebhfIBtZhr+w1+9WTHknGIIWWA0qb3UpWZJn3I0zgAnnT329HkoophykOSKmDk9/1j5Fy1y69hs+pComjPVSyy5AX0QZ9J5teqydHx+IPBwSjYMb5Sb1D1JpfasLIwZZpq/Um7vZIpI71/CyOxl0DhlZIN0XuzZgQ8/5y+09Wl80PFqZz0hdqAf+92yMGhEhBkaWxPbF2hvHPayunWq45g1CY1zVJ9tZikhqK1YMvB+6I0czHOrLgCsNbygOvv+lYCMrd5Hc8FdKouHhaqCU0w7o4eNhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W/pBqgjdcnhi2uhw0yiiS299s/GcnxJGRT9DrxQmayQ=;
 b=TGAz0JKPLA8phqtEIs+0YNBCYn1iAS/ZbRpYPFhXr470ylw5sExWb8YRzcY011BHeEU9wqZw/C8pWCzFnLeqKMKgvXU+v5U0Lcd796SCO1Rw1AZkkrIvHKD2HEQCnRk0eG4WUqWYF/j9ZG4ZKlcrQUL+XUcWofxjh9Zhh+cztbhwXgRVXNnWtGJmlF+iLKa4icwydzLIddDqTwtLl8avpu46HT+XAB2spolOJMQfSL97jJ3dzmR5nmIabZVIV+IFwp0h4wVp+I9q//JzIAJcDQfe6tyDdMM43H1SiNmlHbmAonhhfjcnbK/01XNepnvRemL9/4tcM68UtbaYVZBhVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BYAPR02MB5320.namprd02.prod.outlook.com (2603:10b6:a03:61::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.24; Wed, 28 Apr
 2021 23:20:21 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::859:d735:9964:608]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::859:d735:9964:608%6]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 23:20:21 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v4 00/26] Hexagon (target/hexagon) update
Thread-Topic: [PATCH v4 00/26] Hexagon (target/hexagon) update
Thread-Index: AQHXLNzKP+TWkRO39UOZa0UHMqpnQKrKjM6AgAAFrCA=
Date: Wed, 28 Apr 2021 23:20:21 +0000
Message-ID: <BYAPR02MB48867209D1BF82760A925ECADE409@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <1617930474-31979-1-git-send-email-tsimpson@quicinc.com>
 <c28f4f95-fdfc-c67e-d9fb-dea67b56e337@linaro.org>
In-Reply-To: <c28f4f95-fdfc-c67e-d9fb-dea67b56e337@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [70.115.140.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d38f8e1e-f483-46cc-aac2-08d90a9c31df
x-ms-traffictypediagnostic: BYAPR02MB5320:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB53207020D4DA1BD5FAC4161EDE409@BYAPR02MB5320.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sq8qyEqemWjac6FcyRSMy8at3nisT12Yfz8ePYmHItJDrAmVCM6YCKQHQuHc8JJhuqjmvWGWm6KBtYB0Fl64gOSAyWlTw//sHofGmuQFEBSYPV2/N3BDUMqltgMF2GX51aMW9Vrx+8mkbsnn1P9+Ceee79jWbWk0XzJbRj5ZEEdr4BG008uBQeR+KVjluerdzJChZvTyyWqZICR9ENb1pt/GBz0pIyyj37bIk71/vETJGzJd6SeYy2J54fEJ5GoU87didOevn1EEII7j2m8NxfOtWzNEQHoBN1vRinsY1EdLXoESmDaqcO28H/ZWO6SRXaMlgdLy8He6+gNy8RvXD1lJqD4BrBTHrkFr6Ns3HR/DP0vpGVhvB2GazAaT/y5CyeG96mNumyH/1eeTflvZG15KkB4ES3pTw/x6vOc6lExw3xB5fCmTBMQA8lZK6JUfZSaFrrUxVH7P4A2S7e3FKOeGw03ceipEHJzdZJe6PSHExB8Xq84zmM47uCuyvIFBmzZB30ldpa5lliJh2z07o0TZ0Eoq2kpwfMPh3wF7mht9g+lVCh/9mrVHaLMBp6tMIgGdu4P6RAS0AUsaCE8mdb2iIWbn3zaJOZ4r5o0XnwFbMu4IKnjA4jfj3CEvCpmrVYU17ap0ZSqp1DCCS+gx14u4CCZjpVzfw2nDvgoLheIKXmqK+I3nYnt4B9O+cWCH
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(39850400004)(346002)(366004)(136003)(83380400001)(9686003)(478600001)(53546011)(26005)(110136005)(7696005)(71200400001)(76116006)(66446008)(38100700002)(64756008)(66476007)(55016002)(66556008)(6506007)(8936002)(66946007)(966005)(15650500001)(8676002)(2906002)(86362001)(33656002)(186003)(52536014)(54906003)(316002)(122000001)(4326008)(5660300002)(107886003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?Ym40b0FXNWhLSzZOclEyT0svUXlRNVg1N2NTeTlzdXY0NmNHbnBvSWxkK1o5?=
 =?utf-8?B?cGhtYjk2dUJhL0ZCS0NiV0FhWTNRcFhZbWIrekwwbS9rcndQWjc2djdiOXhk?=
 =?utf-8?B?eEtIRUFqRnlqcEtKRjZFeHp6M3pDUGVDOFRwUWxQRTdBWWRJcVN4SWkvLzBs?=
 =?utf-8?B?S0JZalNXWUpPMjFFUFpVL1lmaHVXZkVvWEFpSWtIRnBqL0hXQVRKa05MbUhK?=
 =?utf-8?B?Ry9RdldEa0cvNGVZbWN4TmpHZEY2Sm1rZnpuVWcwK3FLbE1CK1JLdDJKYjNP?=
 =?utf-8?B?UXNaV0VQWUNicldxVThNcmxpSkVJeFkzbzFySUNZdUcyaThVQUxFdlo3d0NR?=
 =?utf-8?B?TDhEdW9HNERUN0piMENmYVFUMm5oRmlJTlBsTE5zUHZwT3l6THJyVkdQOFJy?=
 =?utf-8?B?Ym9GTStIbTcxcUdWL1l3bHJqWVByYWpzZC9qZmZoZkdJcWptQm9GbXlNUXlD?=
 =?utf-8?B?Mkp2SmFKRTdIRk5OKytGRVRjd1RDY015UE83Y3U0T3h0eTJJQm4yRUF0NTEx?=
 =?utf-8?B?VkFwZGFYanZndFFMdExBd1I0UENPeDA3SHZBUGFNSHQzK2FpQk1Fek1mTE04?=
 =?utf-8?B?Y2tUSDM3RFlSYVZFUWdkTHowTEZpeVNaU0NFTWgrbmE3Wm11THNUMjRsTml6?=
 =?utf-8?B?RGZxekpiaE1tK21BaU5ieWFpMEk4SHBHQmtxV2ZKVkozNGZvaW8ybkdsbWVD?=
 =?utf-8?B?dldUUFhIdWVFNWJxU1ZYOW5ySUJHK3FLVEtNSTRwS04vUTdNTzVwbTFEZmY1?=
 =?utf-8?B?cU92MStCSVdjNkFyeHNkOXlIMldOdzBXU2hNL1RJNFJYdG81RzZHU2xCQUVx?=
 =?utf-8?B?WlVYdzdGTEkwemhwQ0RyaXYxbGhGc0hlNlJ5UG1wYnptYW9nS3N6Sm1YZEZo?=
 =?utf-8?B?dlR2MEh2NTZEanVZaFdGRDB2NmwxOWNheEZCSkNVYjFObzlxMllrc3ZkVmhG?=
 =?utf-8?B?OGV5a01FS0RMQkFoa2M0ZUg3YmRPd0t0clk3TDNJNWY0Yk8vTEx1RlFrQXA0?=
 =?utf-8?B?RmRZektqbnVyUzBoT09ERVY4Rkg2UUh4cnlmS0xvQ21JMnNlUE9RdTZ1QTBU?=
 =?utf-8?B?cHRWczZ5ZVV4eXAySkQ0Zng2N0FMZmYzQnhhcDdWTkEzN3hPdEJRTWpWTFp5?=
 =?utf-8?B?S0EwT0s3N0VST3JqTURYY1VmeXU5TEFIWTN5TTY3cWlHdVhxMFY0REhUc3hL?=
 =?utf-8?B?SWhQck9jZmVuVnF0amNKcHdxNmVZVmlqK3NWVWdHdUEvY0hrYlBDMTZFK1Vq?=
 =?utf-8?B?ZlkwWVpoVTVwQzVpM013bXd4dnNrQ1BzcDR1VUprSm0yQ3R5MXFScFY4dHdm?=
 =?utf-8?B?aWxESUV1b0lXSmdPQnU4U0krYTZEUlJoS1kycjVSNTVFWHA2Mm5LamxXMHRV?=
 =?utf-8?B?M3J2djhJcWxhaWtuTmcvWldBQldTYWxpQ3lFNmtDOGU2MzdUKzVDVXdBQXlX?=
 =?utf-8?B?QlI1MGFsWFFoOC81MHlnejNIQm96T042T3VKYnB2N2ZxMGw1QnJ6TnVpcUc0?=
 =?utf-8?B?QnBrYzlWTjR3bENiSkJwTGJqVjNiRzNIUExXTVJEd0VUSm9RREFjRyt2R3d1?=
 =?utf-8?B?N3lDRm1iMDVoSUR2YkMxYUhjaUFDeEl3UHQxcVRVU2szeldvVWpRKzdtUW1s?=
 =?utf-8?B?dGNMUWZ5ZDJ1bWtseWZac2VnaWFud2dhekRnSmZSZG5ucGxIdWR0Y0IzSkxw?=
 =?utf-8?B?N2l0ZWpiM3YyVXBESEZaR3hjbmU4Q1JMNnE4TFJLdEtqL1ByL3FYVysraUNy?=
 =?utf-8?Q?hArfinP3hRU3koD3VsSDIQjdcwsgNx4eCn/5hGs?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4886.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d38f8e1e-f483-46cc-aac2-08d90a9c31df
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2021 23:20:21.5584 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tBFXkAfU1LdLCAr4XxTZ1Jojpl/RorvcY9A8O2auZF/mBHdStGApFG6IjVQB2KTYT7wbKk61TlRklcEbqiTaWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5320
Received-SPF: pass client-ip=216.71.140.77; envelope-from=tsimpson@quicinc.com;
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
Cc: "ale@rev.ng" <ale@rev.ng>, Brian Cain <bcain@quicinc.com>,
 "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBIZW5kZXJz
b24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFdlZG5lc2RheSwgQXBy
aWwgMjgsIDIwMjEgNDoxMyBQTQ0KPiBUbzogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNp
bmMuY29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnDQo+IENjOiBwaGlsbWRAcmVkaGF0LmNvbTsg
YWxlQHJldi5uZzsgQnJpYW4gQ2FpbiA8YmNhaW5AcXVpY2luYy5jb20+DQo+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggdjQgMDAvMjZdIEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSB1cGRhdGUNCj4gDQo+
IE9uIDQvOC8yMSA2OjA3IFBNLCBUYXlsb3IgU2ltcHNvbiB3cm90ZToNCj4gPiBUaGlzIHBhdGNo
IHNlcmllcyBpcyBhIHNpZ25pZmljYW50IHVwZGF0ZSBmb3IgdGhlIEhleGFnb24gdGFyZ2V0DQo+
ID4gICAgICBUaGUgZmlyc3QgMTYgcGF0Y2hlcyBhZGRyZXNzIGZlZWRiYWNrIGZyb20gUmljaGFy
ZCBIZW5kZXJzb24NCj4gPiAgICAgIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPiAgYW5k
IFBoaWxpcHBlIE1hdGhpZXUtDQo+IERhdWTvv708ZjRidWdAYW1zYXQub3JnPg0KPiA+ICAgICAg
VGhlIG5leHQgMTAgcGF0Y2hlcyBhZGQgdGhlIHJlbWFpbmluZyBpbnN0cnVjdGlvbnMgZm9yIHRo
ZSBIZXhhZ29uDQo+ID4gICAgICBzY2FsYXIgY29yZQ0KPiA+DQo+ID4gVGhlIHBhdGNoZXMgYXJl
IGxvZ2ljYWxseSBpbmRlcGVuZGVudCBidXQgYXJlIG9yZ2FuaXplZCBhcyBhIHNlcmllcyB0bw0K
PiA+IGF2b2lkIHBvdGVudGlhbCBjb25mbGljdHMgaWYgdGhleSBhcmUgbWVyZ2VkIG91dCBvZiBv
cmRlci4NCj4gPg0KPiA+IE5vdGUgdGhhdCB0aGUgbmV3IHRlc3QgY2FzZXMgcmVxdWlyZSBhbiB1
cGRhdGVkIHRvb2xjaGFpbi9jb250YWluZXIuDQo+IA0KPiBodHRwczovL2dpdGxhYi5jb20vcnRo
NzY4MC9xZW11Ly0vam9icy8xMjE2MjQ4MjI3DQo+IA0KPiBUaGUgY2xhbmctdXNlciBqb2IgZXJy
b3JzIG91dCB3aXRoDQo+IA0KPiANCj4gPiAuLi90YXJnZXQvaGV4YWdvbi9nZW5wdHIuYzozMToy
MDogZXJyb3I6IHVudXNlZCBmdW5jdGlvbiAnZ2VuX3JlYWRfcmVnJyBbLQ0KPiBXZXJyb3IsLVd1
bnVzZWQtZnVuY3Rpb25dDQo+ID4gc3RhdGljIGlubGluZSBUQ0d2IGdlbl9yZWFkX3JlZyhUQ0d2
IHJlc3VsdCwgaW50IG51bSkNCj4gPiAgICAgICAgICAgICAgICAgICAgXg0KPiA+IC4uL3Rhcmdl
dC9oZXhhZ29uL2dlbnB0ci5jOjMyMjoyMDogZXJyb3I6IHVudXNlZCBmdW5jdGlvbiAnZ2VuX3Nl
dF9ieXRlJw0KPiBbLVdlcnJvciwtV3VudXNlZC1mdW5jdGlvbl0NCj4gPiBzdGF0aWMgaW5saW5l
IHZvaWQgZ2VuX3NldF9ieXRlKGludCBOLCBUQ0d2IHJlc3VsdCwgVENHdiBzcmMpDQo+ID4gICAg
ICAgICAgICAgICAgICAgIF4NCg0KDQpNeSBhcG9sb2dpZXMhDQoNCldoYXQncyB0aGUgdmFsdWUg
b2YgJENPTkZJR19BUkdTIHRoYXQgaXMgcmVmZXJlbmNlZCBoZXJlDQogICAgJCBpZiB0ZXN0IC1u
ICIkVEFSR0VUUyI7IHRoZW4gLi4vY29uZmlndXJlIC0tZW5hYmxlLXdlcnJvciAtLWRpc2FibGUt
ZG9jcyAkQ09ORklHVVJFX0FSR1MgLS10YXJnZXQtbGlzdD0iJFRBUkdFVFMiIDsgZWxzZSAuLi9j
b25maWd1cmUgLS1lbmFibGUtd2Vycm9yIC0tZGlzYWJsZS1kb2NzICRDT05GSUdVUkVfQVJHUyA7
IGZpIHx8IHsgY2F0IGNvbmZpZy5sb2cgbWVzb24tbG9ncy9tZXNvbi1sb2cudHh0ICYmIGV4aXQg
MTsgfQ0KDQpXaGVuIEkgY29uZmlndXJlIHdpdGgNCiAgICAuLi9jb25maWd1cmUgLS1lbmFibGUt
d2Vycm9yIC0tY2M9Y2xhbmcgLS1kaXNhYmxlLWRvY3MgLS10YXJnZXQtbGlzdD1oZXhhZ29uLWxp
bnV4LXVzZXINCkkgZ2V0IC1Xbm8tdW51c2VkLWZ1bmN0aW9uIGFkZGVkIHRvIHRoZSBjb21waWxl
ciBjb21tYW5kIGxpbmUsIHNvIEkgZG9uJ3Qgc2VlIHRoZSBlcnJvci4NCg0KDQpCb3RoIHdlcmUg
aW50cm9kdWNlZCBpbiBwYXRjaCAyMi8yNi4gIFNob3VsZCBJIGZpeCB0aGlzIGJ5IHJlc3Bpbm5p
bmcgdGhlIHNlcmllcyBvciBzZW5kaW5nIGEgc2luZ2xlIHBhdGNoPw0KDQoNClRheWxvcg0KDQo=

