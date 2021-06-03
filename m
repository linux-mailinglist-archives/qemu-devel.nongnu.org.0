Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7398E39A1B7
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 14:59:27 +0200 (CEST)
Received: from localhost ([::1]:45812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lomwY-0000iq-FH
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 08:59:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1lomui-0007df-0S
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 08:57:32 -0400
Received: from esa9.fujitsucc.c3s2.iphmx.com ([68.232.159.90]:21522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1lomud-00066o-3y
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 08:57:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1622725047; x=1654261047;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=gGsvXvlOaaLNM8uk6RcCQ+/trr0aDiDnnjh7Cj9zAl0=;
 b=WKjlHK6GtH6gfDt9vogv8GwxDQZPlBDdDoXEe8KkDNTwf/kvy+/ilFsg
 hzL4LS5u6PVixmoKdixr1KTbVlVycV65beVLp5VPxBuQpOFYc0HHJQBZS
 rtgfY5k4OR7DlJ+rrQv4agZKkb7LDQLiMdcLNJn8yKTzFq5IsZp6PXGHg
 tDL3eUEI14mHEVEEcG3IXQbZsgUFmgVfrMpy7M0NwG+b+tSr96y+g2z3i
 wDCA5Jc2chu2+yfnkZ1NSug6pR47pKCPm7qABireGyqTaTFin+xtBl34V
 b8Ds08gacZezjSELVG96eKFFiT8ZBI+Uejs2jSPfXlYW+/G/AJIxwWHKc A==;
IronPort-SDR: 7Da6Vd3aHXHfjI1AiRXbjqF3tqdzJ5AnJK/AQJUKyd5fwpnVDcUT1Lezaf4mriwVfkUgHtTBJW
 oI3RzfXVsqjCIhask+NER9YDy4sCOo2/jNZuL8B83ncXob++7+2VrwB6LTX0FwyLaZlVFo42YX
 SKnT1b0G9OLpFvN5sFEEJ/uT2BNnFQfXGXm5JUaowBZC0a9pSMIeryeqZBAWrYs3fwlxZelUDs
 terppuzc8EQqCYBQvCU5ltZZpxziBsHPgX1Mfj60ei5dbD0ufxIEpbeopB0MN2Xnvsw5XtWg0Z
 pm0=
X-IronPort-AV: E=McAfee;i="6200,9189,10003"; a="32505939"
X-IronPort-AV: E=Sophos;i="5.83,245,1616425200"; d="scan'208";a="32505939"
Received: from mail-ty1jpn01lp2051.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.51])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 21:57:23 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h9/w8YF+lvs8vgc6vwge+B4GJ4J1ySWZxIkSag4jm81Hu8oMzBPFDGVC/EoV7eMSBB/8PW3A2IQTYl0gFCHXhgHquj7ganF+Fj4iLe2SYid6uczBlVrz6KWPjADXpCNaiFzYDeKVxlWCKykFTltsHocHKQsa5mc2nS2JqDVEUYDi9tVA5srF82E22+jKo5l96zEQlwhxgJgbll3ZoJxWT4Ugwpfl2dULkKBxyLL6P9zqwQQ38UvjApy4hZ+TZYPW6TplixEco+HW2lHzR/0b/MN6SS3mh6i0Fy7MpnIU7OAhvL2Y3HS9ych8MNVdm+UwK8IY7S8oeHcVbSTa6DboLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gGsvXvlOaaLNM8uk6RcCQ+/trr0aDiDnnjh7Cj9zAl0=;
 b=CNaeF0qIgfo//L1lxy1KpX0gY00HUSgdNeDsQmM8j717xMvAXMdSs/jTtpUpmYhBZjOJcvCh2Bry8ADTHD7Te5DwaF3LhyK6zh9OBuotk5v3VS7wYvms1huuW84iBBrV37/TWDzPR+K/J3elor9pDmacr90j4pqLeUFsf8qC9fuQTLC+iN4DPx5D7dTpOu/T4K2XFkpIbg/bnyx9qT0/u8sFOpF5r9WHtYQB8kPQHgX2YfPm8BcRDdPFntn6RY7LE9uZ5vYBu20RY854GN6fvsjyQBznxzen5fIZ50F2482Wpb7Q99sEDSdEvwkl5oBdwCqkTAD4y2Lte8uq0KLmgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gGsvXvlOaaLNM8uk6RcCQ+/trr0aDiDnnjh7Cj9zAl0=;
 b=i2n7u+FNT2MjTEmRRfqh0TWOCrvpW9ZMCV0lyTQVXZX54RRe5EebJRdfuDGQfCV/Ss27mUVqrD5I/rGOVFMJhCSnJUi0tRTzZw1nHNi9/toZf5VVOkbmbKOc/fd0ots0OnERIrXP6ciIXaek4nylcp1NVlff6cipBcwzWZWYGiY=
Received: from TY2PR01MB2571.jpnprd01.prod.outlook.com (2603:1096:404:6b::12)
 by TYCPR01MB6302.jpnprd01.prod.outlook.com (2603:1096:400:7c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22; Thu, 3 Jun
 2021 12:57:20 +0000
Received: from TY2PR01MB2571.jpnprd01.prod.outlook.com
 ([fe80::c81b:26d8:726b:4239]) by TY2PR01MB2571.jpnprd01.prod.outlook.com
 ([fe80::c81b:26d8:726b:4239%5]) with mapi id 15.20.4173.030; Thu, 3 Jun 2021
 12:57:20 +0000
From: "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [RFC PATCH 2/2] migration/rdma: Enable use of g_autoptr with
 struct rdma_cm_event
Thread-Topic: [RFC PATCH 2/2] migration/rdma: Enable use of g_autoptr with
 struct rdma_cm_event
Thread-Index: AQHXV9gERHxL2yqzS0uTfGKgsLxj3asBgXeAgACFE4CAADmoAA==
Date: Thu, 3 Jun 2021 12:57:19 +0000
Message-ID: <36af458d-2b53-4996-6ce6-efcd9ddfe631@fujitsu.com>
References: <20210602175105.2522032-1-philmd@redhat.com>
 <20210602175105.2522032-3-philmd@redhat.com>
 <0d008a0e-62ed-c788-1303-eecca04f3c4a@fujitsu.com>
 <de004f25-615a-ebe5-2bdd-b3af44bab459@redhat.com>
In-Reply-To: <de004f25-615a-ebe5-2bdd-b3af44bab459@redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [223.111.68.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 43191314-9406-47dc-5f9c-08d9268f1f91
x-ms-traffictypediagnostic: TYCPR01MB6302:
x-microsoft-antispam-prvs: <TYCPR01MB6302F3086C7AB9F67803DF64A53C9@TYCPR01MB6302.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xySizJPXydF2ggJOh/XA+Lc8m+X83kgGWbYlZba/kQRDBGu4DRP5FZi0QDzrKkRhaNWl59SzrGRD7Iyf+HxWKbFtvp8fjxSFRpwqtfAVURTiNuadk2yz0Bo5nHbthjf3qBgQr3/n4rrzorRWF7MBF6Kdu+7NRs2c4vkw3Jz9dQb1HuC3BsJMdAoTulcxz9/NOsAEv7fdpiyPo5tCdfhOKy4SHX4xBYO+jSAPH5kaqlxXOs9k939TwDOjR+H+N/VWZeGjdANSMn4e+HPZbAw5VKXZDAV91jeIF5Xau1fIGdXHyQ5vRxBKTjnYHvazPikh2hMLwW8P6adu3dTy23RLpO/PfuJ5XEAoJZnqsaNZe9k/wheZLy/gj2NnAs5q4MzVmC9e3O5zaxa0t5wX52XLl6qVbOzST1mP9E3tpK7T516nZBcorOLgV8h1IzAoDnPhLkPGa3DLQmR+xd8EFs2EGrrkJU0gJeNZwDOowj56TOlPi66Cxndau6nJVMnOccqAysHxJ4FIfMPjy5rmnX7+aXkWDd3fyOeCmDifxzN32pa+I1lEjeH1dIaqHxJd3FK1oUG047z7g3jcsqAnIq0twd1O5Tl7yXqJXdbCt7EoxNhBGLjdhABd3lnNw5qjrGeX6gWq+REefz3bqRhEvXy1g4gpf/BrzroHBlQCRBPZ+6g4sep9y0Oklp8TNrlJ7xE+9ct8JXTqH0VwLZ0A6wvqVY5hKGysBRa6CrPaozpLqlZYljT5d6AdjdcDUZ0R2UCiYJoLafy6eteqUwSm7MBsnQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR01MB2571.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(376002)(346002)(366004)(31696002)(122000001)(38100700002)(86362001)(85182001)(71200400001)(6512007)(83380400001)(6486002)(66476007)(8936002)(8676002)(91956017)(76116006)(66946007)(66556008)(66446008)(4326008)(64756008)(5660300002)(966005)(478600001)(2906002)(26005)(110136005)(316002)(53546011)(6506007)(31686004)(36756003)(2616005)(54906003)(186003)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?bnBKVGtqMU1zVUFxUmxlNnd5aWZMSXNXdFNFRWRCdUNYZ25JcUl2UlhGdTVX?=
 =?utf-8?B?YWppTVNrVmRiMGNvMTRMTUV0aWo5N2RXUHFkM3MxbWcrZUFrUnpjMzluZ1dL?=
 =?utf-8?B?Kzg0Q2w2a1IrdWFoMERmN1QvMWtoRXFnUmN0LzZEYThGUDNPbVc2MHJYeDVs?=
 =?utf-8?B?N2pWSUlqRmVud0dEMWkvaC8yWFVqaFczN0w0c2VYeEhFekZuMG9xbTBtQmFI?=
 =?utf-8?B?QkVYL2c0QjNES2YrZGx3ZlVvRXBBZUxsb1M5R1lSWjloZFJoY0Q5REpjNWVO?=
 =?utf-8?B?d1hFN2tXVndldjhHNmh3TVdIRUg5cWt2Und3L3JlbmYybjVMUWt6dTVGQ0lV?=
 =?utf-8?B?RWdaeXhPZk5nWGlKUWp0L1ljWUUyalhTa0VIZDROeERka2ZMRElBcDAzZkNz?=
 =?utf-8?B?SXVuUmhpaE1qdmRkSWxTcXdLT3A5M2ljbDYySG0zbFYvbjRnTU5VSkdYUkxQ?=
 =?utf-8?B?M1VxdVJLamhnSlNaay9LRjZUcWxJT2F1QmlJWXFEeStPTytTeWdFdmVlanRs?=
 =?utf-8?B?c1p4bFNGVnFFK2NocEVWZnFGMmhEWUtlS0E4K0YxUHBqZVF6NWgvQmpDR291?=
 =?utf-8?B?U0FBRVYwUGRtcTRrMithYWJ6YUYwZDRrd1VUV05LZjRlaWVpb0tRS05nQ2ZS?=
 =?utf-8?B?RDVMUFdTSko5cTJpeDAxY0VQaTJKWTI5YVl4RWlpbEtjam1CV0E2OEVYUTdh?=
 =?utf-8?B?bWx5aGdxS2Ftd1pvQWFnS0R3NTlLMWlGSDdYY2dzVW1iYUxXTDZIZEQrMElm?=
 =?utf-8?B?N2Z1YlJhMUxjQnJ2c2JhK3VuMHhybFEwWVI1UThkdzRSYzd6UTcrVVFKU1JS?=
 =?utf-8?B?VGp3ejlYbUw3cmNsZkpMWVIyeFdhdVd5bGszS214SFFQaXRmb3lNL2Q1SjNX?=
 =?utf-8?B?REIwTnpldUJzM2paR0tjVm4rM1d4OTJOWXF3RW93YzJCM0ZmdlpTWitiK2Z4?=
 =?utf-8?B?ditRZjFpOVpkdUVubVFaMkZCSDZzcndnWDJyYUU1TkxpS3c5cWxvb3krTUgy?=
 =?utf-8?B?QkpPOUJJWUhkTzFiVmpObnFjaGZiNGpoaEdzUHRXRE9LTUJYMXlUQ0NZRlk4?=
 =?utf-8?B?SUVsL0FhZXNlVVY0dkRVRnNWVEFKSUZiMlFyZmFNUENxYWxsRXNIdHlvYVNU?=
 =?utf-8?B?N3VWL0VyYk1GbUVOdzV3UERZMEFJN2JlZmplUHRvWnFkSnRUcUZBTU9KdFV2?=
 =?utf-8?B?Um9MbWRoQlhCdW8yeElxVVJ4Z0EwRkRXOHZER09KMnhCNCtBcXZWbGZjcEFh?=
 =?utf-8?B?YUtBSVAzZE1sUXdzeVBYcjFIVm52bkNZOXp6NlFOV2tram9nQjdEK1dCamIr?=
 =?utf-8?B?UlFsbE9mQXhMaWhacmdnWHg2YUgra255NHJBQmhDZjJGcUpueGJxc1N1SHB6?=
 =?utf-8?B?YnlzQ3ZBYkRlYkxnSFhQMy9aTzJxSXI1TWhqZS9UOUJoL2tvdHJ3cUwvK2VY?=
 =?utf-8?B?b2FsT3RvdENzSkJkbWIwY04vVnh4VVZYS3Bzb2lDV1UyQVpSUDJxeUd1ZmlB?=
 =?utf-8?B?elJ2VThpNHdQMjZPYTVqUzNacVdjMFBuTEEra2gyYXFQQmpaeWlvNGFKTnJB?=
 =?utf-8?B?cnVMOEE5TDlzZW13YUhXditscGVBWEdhbjZDSVlrYnI4KytGVmN3Z0lvbDk4?=
 =?utf-8?B?a0RkeDJnMHZjbTVIWjV0SDk2a01ITTRjcGI5Zm5GZ3ZXMGFkN0cydnhGTzQw?=
 =?utf-8?B?M0xVRTVGbVVEM2E5cWJYY3VHTFZ0amNEWTVkZWxVUXJJU3IyVGsrRVJncnpU?=
 =?utf-8?Q?2cUq0Rux/B91ogcG2495E1m3gzGyOs+kASyDQly?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <39FB82841069534197A486C6CB9BE190@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB2571.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43191314-9406-47dc-5f9c-08d9268f1f91
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2021 12:57:20.0286 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /bYFe5abNZzWI90nHb3cuL2FDz9UIlHhFxeehkUz7AecRr5574YG5uHjSbqdkk0kep4MLhZ+ywLwSp1lVAUWGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6302
Received-SPF: pass client-ip=68.232.159.90; envelope-from=lizhijian@fujitsu.com;
 helo=esa9.fujitsucc.c3s2.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCk9uIDAzLzA2LzIwMjEgMTcuMzAsIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIHdyb3RlOg0K
PiBPbiA2LzMvMjEgMzozNCBBTSwgbGl6aGlqaWFuQGZ1aml0c3UuY29tIHdyb3RlOg0KPj4NCj4+
IE9uIDAzLzA2LzIwMjEgMDEuNTEsIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIHdyb3RlOg0KPj4+
IFNpbmNlIDAwZjJjZmJiZWM2ICgiZ2xpYjogYnVtcCBtaW4gcmVxdWlyZWQgZ2xpYiBsaWJyYXJ5
IHZlcnNpb24gdG8NCj4+PiAyLjQ4Iikgd2UgY2FuIHVzZSBnX2F1dG8vZ19hdXRvcHRyIHRvIGhh
dmUgdGhlIGNvbXBpbGVyIGF1dG9tYXRpY2FsbHkNCj4+PiBmcmVlIGFuIGFsbG9jYXRlZCB2YXJp
YWJsZSB3aGVuIGl0IGdvZXMgb3V0IG9mIHNjb3BlLA0KPj4gR2xhZCB0byBrbm93IHRoaXMgZmVh
dHVyZS4NCj4+DQo+PiBIb3dldmVyIHBlciBpdHMgY29kZSwgYcKgICdhY2snIGRvZXMgbXVjaCBt
b3JlIHRoYW4ganVzdCBmcmVlIHRoZSBtZW1vcnkuDQo+PiBub3Qgc3VyZSBnX2F1dG9wdHIgaGF2
ZSB0aGUgYWJpbGl0eSB0byBkbyB0aGUgc2FtZS4NCj4gU2VlDQo+IGh0dHBzOi8vZGV2ZWxvcGVy
Lmdub21lLm9yZy9nbGliL3N0YWJsZS9nbGliLU1pc2NlbGxhbmVvdXMtTWFjcm9zLmh0bWwjRy1E
RUZJTkUtQVVUT1BUUi1DTEVBTlVQLUZVTkM6Q0FQUw0KPg0KPiAgICBEZWZpbmVzIHRoZSBhcHBy
b3ByaWF0ZSBjbGVhbnVwIGZ1bmN0aW9uIGZvciBhIHBvaW50ZXIgdHlwZS4NCj4NCj4gICAgVGhl
IGZ1bmN0aW9uIHdpbGwgbm90IGJlIGNhbGxlZCBpZiB0aGUgdmFyaWFibGUgdG8gYmUgY2xlYW5l
ZA0KPiAgICB1cCBjb250YWlucyBOVUxMLg0KPg0KPiAgICBUaGlzIHdpbGwgdHlwaWNhbGx5IGJl
IHRoZSBfZnJlZSgpIG9yIF91bnJlZigpIGZ1bmN0aW9uIGZvcg0KPiAgICB0aGUgZ2l2ZW4gdHlw
ZS4NCj4NCj4gVGhpcyBkb2VzIG5vdCBjaGFuZ2UgdGhlIGNvZGUgdG8gY2FsbCBmcmVlKHB0ciks
IGJ1dCB0byBjYWxsIHRoZQ0KPiByZWdpc3RlcmVkIGNsZWFudXAgZnVuY3Rpb24sIHdoaWNoIGlz
IHJkbWFfYWNrX2NtX2V2ZW50KCkuDQoqDQoNClRoYW5rcyBmb3IgeW91ciBleHBsYW5hdGlvbi4N
Cg0KVGVzdGVkLWJ5OiBMaSBaaGlqaWFuIDxsaXpoaWppYW5AY24uZnVqaXRzdS5jb20+DQoNCioN
Cg0KDQo+DQo+PiAyMjEyIHN0YXRpYyB2b2lkIHVjbWFfY29tcGxldGVfZXZlbnQoc3RydWN0IGNt
YV9pZF9wcml2YXRlICppZF9wcml2KQ0KPj4gMjIxMyB7DQo+PiAyMjE0IHB0aHJlYWRfbXV0ZXhf
bG9jaygmaWRfcHJpdi0+bXV0KTsNCj4+IDIyMTUgaWRfcHJpdi0+ZXZlbnRzX2NvbXBsZXRlZCsr
Ow0KPj4gMjIxNiBwdGhyZWFkX2NvbmRfc2lnbmFsKCZpZF9wcml2LT5jb25kKTsNCj4+IDIyMTcg
cHRocmVhZF9tdXRleF91bmxvY2soJmlkX3ByaXYtPm11dCk7DQo+PiAyMjE4IH0NCj4+IDIyMTkN
Cj4+IDIyMjAgc3RhdGljIHZvaWQgdWNtYV9jb21wbGV0ZV9tY19ldmVudChzdHJ1Y3QgY21hX211
bHRpY2FzdCAqbWMpDQo+PiAyMjIxIHsNCj4+IDIyMjIgcHRocmVhZF9tdXRleF9sb2NrKCZtYy0+
aWRfcHJpdi0+bXV0KTsNCj4+IDIyMjMgbWMtPmV2ZW50c19jb21wbGV0ZWQrKzsNCj4+IDIyMjQg
cHRocmVhZF9jb25kX3NpZ25hbCgmbWMtPmNvbmQpOw0KPj4gMjIyNSBtYy0+aWRfcHJpdi0+ZXZl
bnRzX2NvbXBsZXRlZCsrOw0KPj4gMjIyNiBwdGhyZWFkX2NvbmRfc2lnbmFsKCZtYy0+aWRfcHJp
di0+Y29uZCk7DQo+PiAyMjI3IHB0aHJlYWRfbXV0ZXhfdW5sb2NrKCZtYy0+aWRfcHJpdi0+bXV0
KTsNCj4+IDIyMjggfQ0KPj4gMjIyOQ0KPj4gMjIzMCBpbnQgcmRtYV9hY2tfY21fZXZlbnQoc3Ry
dWN0IHJkbWFfY21fZXZlbnQgKmV2ZW50KQ0KPj4gMjIzMSB7DQo+PiAyMjMywqDCoMKgwqAgc3Ry
dWN0IGNtYV9ldmVudCAqZXZ0Ow0KPj4gMjIzMw0KPj4gMjIzNMKgwqDCoMKgIGlmICghZXZlbnQp
DQo+PiAyMjM1wqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gRVJSKEVJTlZBTCk7DQo+PiAyMjM2DQo+
PiAyMjM3wqDCoMKgwqAgZXZ0ID0gY29udGFpbmVyX29mKGV2ZW50LCBzdHJ1Y3QgY21hX2V2ZW50
LCBldmVudCk7DQo+PiAyMjM4DQo+PiAyMjM5wqDCoMKgwqAgaWYgKGV2dC0+bWMpDQo+PiAyMjQw
IHVjbWFfY29tcGxldGVfbWNfZXZlbnQoZXZ0LT5tYyk7DQo+PiAyMjQxIGVsc2UNCj4+IDIyNDIg
dWNtYV9jb21wbGV0ZV9ldmVudChldnQtPmlkX3ByaXYpOw0KPj4gMjI0MyBmcmVlKGV2dCk7DQo+
PiAyMjQ0wqDCoMKgwqAgcmV0dXJuIDA7DQo+PiAyMjQ1IH0NCj4+DQo+PiBUaGFua3MNCj4+IFpo
aWppYW4NCj4+DQo+Pj4gcmVtb3ZpbmcgdGhpcw0KPj4+IGJ1cmRlbiBvbiB0aGUgZGV2ZWxvcGVy
cy4NCj4+Pg0KPj4+IFBlciByZG1hX2NtKDcpIGFuZCByZG1hX2Fja19jbV9ldmVudCgzKSBtYW4g
cGFnZXM6DQo+Pj4NCj4+PiAgICAgInJkbWFfYWNrX2NtX2V2ZW50KCkgLSBGcmVlIGEgY29tbXVu
aWNhdGlvbiBldmVudC4NCj4+Pg0KPj4+ICAgICAgQWxsIGV2ZW50cyB3aGljaCBhcmUgYWxsb2Nh
dGVkIGJ5IHJkbWFfZ2V0X2NtX2V2ZW50KCkgbXVzdCBiZQ0KPj4+ICAgICAgcmVsZWFzZWQsIHRo
ZXJlIHNob3VsZCBiZSBhIG9uZS10by1vbmUgY29ycmVzcG9uZGVuY2UgYmV0d2Vlbg0KPj4+ICAg
ICAgc3VjY2Vzc2Z1bCBnZXRzIGFuZCBhY2tzLiBUaGlzIGNhbGwgZnJlZXMgdGhlIGV2ZW50IHN0
cnVjdHVyZQ0KPj4+ICAgICAgYW5kIGFueSBtZW1vcnkgdGhhdCBpdCByZWZlcmVuY2VzLiINCj4+
Pg0KPj4+IFNpbmNlIHRoZSAnYWNrJyBkZXNjcmlwdGlvbiBkb2Vzbid0IGV4cGxpY2l0IHRoZSBl
dmVudCBpcyBhbHNvDQo+Pj4gcmVsZWFzZWQgKGZyZWUnZCksIGl0IGlzIHNhZmVyIHRvIHVzZSB0
aGUgR0xpYiBnX2F1dG9wdHIgZmVhdHVyZS4NCj4+PiBUaGUgR19ERUZJTkVfQVVUT1BUUl9DTEVB
TlVQX0ZVTkMoKSBtYWNybyBleHBlY3RzIGEgc2luZ2xlIHdvcmQNCj4+PiBmb3IgdGhlIHR5cGUg
bmFtZSwgc28gYWRkIGEgdHlwZSBkZWZpbml0aW9uIHRvIGFjaGlldmUgdGhpcy4NCj4+PiBDb252
ZXJ0IHRvIHVzZSBnX2F1dG9wdHIgYW5kIHJlbW92ZSB0aGUgcmRtYV9hY2tfY21fZXZlbnQoKSBj
YWxscy4NCj4+Pg0KPj4+IEluc3BpcmVkLWJ5OiBMaSBaaGlqaWFuIDxsaXpoaWppYW5AY24uZnVq
aXRzdS5jb20+DQo+Pj4gU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBo
aWxtZEByZWRoYXQuY29tPg0KPj4+IC0tLQ0KPj4+IFJGQzogYnVpbGQtdGVzdGVkIG9ubHkNCj4+
PiAtLS0NCj4+PiAgICBtaWdyYXRpb24vcmRtYS5jIHwgMjcgKysrKysrKysrKy0tLS0tLS0tLS0t
LS0tLS0tDQo+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDE3IGRlbGV0
aW9ucygtKQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL21pZ3JhdGlvbi9yZG1hLmMgYi9taWdyYXRp
b24vcmRtYS5jDQo+Pj4gaW5kZXggYjUwZWJiOTE4M2EuLmI3MDNiZjFiOTE4IDEwMDY0NA0KPj4+
IC0tLSBhL21pZ3JhdGlvbi9yZG1hLmMNCj4+PiArKysgYi9taWdyYXRpb24vcmRtYS5jDQo+Pj4g
QEAgLTM4LDYgKzM4LDkgQEANCj4+PiAgICAjaW5jbHVkZSAicW9tL29iamVjdC5oIg0KPj4+ICAg
ICNpbmNsdWRlIDxwb2xsLmg+DQo+Pj4gICAgDQo+Pj4gK3R5cGVkZWYgc3RydWN0IHJkbWFfY21f
ZXZlbnQgcmRtYV9jbV9ldmVudDsNCj4+PiArR19ERUZJTkVfQVVUT1BUUl9DTEVBTlVQX0ZVTkMo
cmRtYV9jbV9ldmVudCwgcmRtYV9hY2tfY21fZXZlbnQpDQo+Pj4gKw0KPj4+ICAgIC8qDQo+Pj4g
ICAgICogUHJpbnQgYW5kIGVycm9yIG9uIGJvdGggdGhlIE1vbml0b3IgYW5kIHRoZSBMb2cgZmls
ZS4NCj4+PiAgICAgKi8NCj4+PiBAQCAtOTM5LDcgKzk0Miw3IEBAIHN0YXRpYyBpbnQgcWVtdV9y
ZG1hX3Jlc29sdmVfaG9zdChSRE1BQ29udGV4dCAqcmRtYSwgRXJyb3IgKiplcnJwKQ0KPj4+ICAg
ICAgICBpbnQgcmV0Ow0KPj4+ICAgICAgICBzdHJ1Y3QgcmRtYV9hZGRyaW5mbyAqcmVzOw0KPj4+
ICAgICAgICBjaGFyIHBvcnRfc3RyWzE2XTsNCj4+PiAtICAgIHN0cnVjdCByZG1hX2NtX2V2ZW50
ICpjbV9ldmVudDsNCj4+PiArICAgIGdfYXV0b3B0cihyZG1hX2NtX2V2ZW50KSBjbV9ldmVudCA9
IE5VTEw7DQo+Pj4gICAgICAgIGNoYXIgaXBbNDBdID0gInVua25vd24iOw0KPj4+ICAgICAgICBz
dHJ1Y3QgcmRtYV9hZGRyaW5mbyAqZTsNCj4+PiAgICANCj4+PiBAQCAtMTAwNywxMSArMTAxMCwx
MSBAQCByb3V0ZToNCj4+PiAgICAgICAgICAgIEVSUk9SKGVycnAsICJyZXN1bHQgbm90IGVxdWFs
IHRvIGV2ZW50X2FkZHJfcmVzb2x2ZWQgJXMiLA0KPj4+ICAgICAgICAgICAgICAgICAgICByZG1h
X2V2ZW50X3N0cihjbV9ldmVudC0+ZXZlbnQpKTsNCj4+PiAgICAgICAgICAgIHBlcnJvcigicmRt
YV9yZXNvbHZlX2FkZHIiKTsNCj4+PiAtICAgICAgICByZG1hX2Fja19jbV9ldmVudChjbV9ldmVu
dCk7DQo+Pj4gICAgICAgICAgICByZXQgPSAtRUlOVkFMOw0KPj4+ICAgICAgICAgICAgZ290byBl
cnJfcmVzb2x2ZV9nZXRfYWRkcjsNCj4+PiAgICAgICAgfQ0K

