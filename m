Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E423388B7
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 10:31:55 +0100 (CET)
Received: from localhost ([::1]:58462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKe9C-0006Rt-4S
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 04:31:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1lKciv-0004hV-PD
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 03:00:43 -0500
Received: from esa14.fujitsucc.c3s2.iphmx.com ([68.232.156.101]:29605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1lKcir-0004Ad-GD
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 03:00:41 -0500
IronPort-SDR: Atnx/STp1xoawF5bIXlo05osH11hIP4ykpieiRlNxuRqMH541Kb7ZRwMyn0Q9ndmxK+3usq2eu
 +BX1TnIEFUsu4M2KYgmEAOpzVYFDw1B/eYTtHB0E1vsuKn/7/o8UW83z6aNk+tcBs+jSZwXGZ0
 fEaQDAe+YV90Nr93VxFQGclFdOWRQT2vgsD7SZCbITs2fnhj8K6X68NRJve8JdH7uxRS60owem
 DbTlaqDd4672Mpx3PDL6oPgxBq3t3vQOVguUBEImN7AmSqnu/MsUR/2lWsPfJSpjun//WMSgV5
 fjI=
X-IronPort-AV: E=McAfee;i="6000,8403,9920"; a="27648389"
X-IronPort-AV: E=Sophos;i="5.81,242,1610377200"; d="scan'208";a="27648389"
Received: from mail-ty1jpn01lp2051.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.51])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 17:00:30 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L5BzM+4L7rV2KJ5xBTkqRm3Vnj6yuUP+tKRMVjUMTmStk0QYWM3FIrIpxl9l+8l7Rcwbc5MmbsFB05hshE8aqh3p/jMqePA0m2j8tLYaoLaJePMkF14TgV2DAUzEbdPHSROoxEEuU5PHItp6t+IH6RQ96MBY+RNZoYsDFY3HJPfjJ2wYxcg/5mp9rDQEyFZOuEHHVIQBYYxOqtfEi9XyTyq9GLhuLjBjh4AsKqsWb3E+qZk0smHCyTYfccS7pZGpfzQndd4io/5WTvhP1pJhvps7ZzRtpUOOnUdIjdzE/k9SIbD5KbMsDP0PpbPTm/uZAu5T+1D/Ez64r1S6BWNFTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pBfAsFfrZUNMm7qBoTpuVGFt1uFuW5v6NFFuMvOgYeE=;
 b=LCDJKMp/t2es5phWpDJEa/4eEDNFKfk/IwfXiLQUMq3ZZ2F8gGgy8VoFRNcYNDp9QjfbpeqYJ8MfClzy89tQonodGFNsLT2R3hE6zc5HkWdA3FgW8C1BEkIxmJKns7LknI3YZ0ZZXw2uAMAp1OmXU6yCYkHHCh/CTNOuqQonZQlc8TkTuML1Oea7x3ERdIYIoCXtq12oHj9roZ22QI9WApoJt66g08XbbDz3ctPbXqWdZ1Xgwf0weoJJOkx1fTnHIBpQ7lMHQwENeF/idL9FVsBO9Qj+yrdR2uixQNYmo6NLk4PqNq8XVwVzLwYtcZkhFViSsfxeD6IVVBZJ11CfMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pBfAsFfrZUNMm7qBoTpuVGFt1uFuW5v6NFFuMvOgYeE=;
 b=DCxgxZTehDNyPGqQjDaIW2vysQOeaqlT0a8DIgeAA0Bx1ZzAtg+5WdTxH/M+l9BmC5YAM0BO+LQMOFT91bg618T6EHBhD4lfqInih1gDZEftTmS0O6F+8Ek82tjlK+69ZJxAZe9JT20Z3LS3+gh32n7noUTtPumlU9AelEs27qM=
Received: from TY2PR01MB2571.jpnprd01.prod.outlook.com (2603:1096:404:6b::12)
 by TYAPR01MB2397.jpnprd01.prod.outlook.com (2603:1096:404:8f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Fri, 12 Mar
 2021 08:00:27 +0000
Received: from TY2PR01MB2571.jpnprd01.prod.outlook.com
 ([fe80::d9a8:f990:73a0:c21a]) by TY2PR01MB2571.jpnprd01.prod.outlook.com
 ([fe80::d9a8:f990:73a0:c21a%3]) with mapi id 15.20.3933.031; Fri, 12 Mar 2021
 08:00:27 +0000
From: "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>
To: leirao <lei.rao@intel.com>, "chen.zhang@intel.com" <chen.zhang@intel.com>, 
 "jasowang@redhat.com" <jasowang@redhat.com>, "quintela@redhat.com"
 <quintela@redhat.com>, "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "lukasstraub2@web.de"
 <lukasstraub2@web.de>
Subject: Re: [PATCH v2 10/10] Fixed calculation error of pkt->header_size in
 fill_pkt_tcp_info()
Thread-Topic: [PATCH v2 10/10] Fixed calculation error of pkt->header_size in
 fill_pkt_tcp_info()
Thread-Index: AQHXFwA9v4Ayzkl2dEC7IV+Hi8qoz6p//XQA
Date: Fri, 12 Mar 2021 08:00:27 +0000
Message-ID: <b7f14ed5-6d34-8958-8058-72c1ef345c33@fujitsu.com>
References: <1615525383-59071-1-git-send-email-lei.rao@intel.com>
 <1615525383-59071-11-git-send-email-lei.rao@intel.com>
In-Reply-To: <1615525383-59071-11-git-send-email-lei.rao@intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [180.96.28.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ddbb5f8-0a2b-45df-5d6a-08d8e52ce647
x-ms-traffictypediagnostic: TYAPR01MB2397:
x-microsoft-antispam-prvs: <TYAPR01MB2397F652D1D8142DD9DF2791A56F9@TYAPR01MB2397.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bpRmWmnLybx34ikhLuAk8Uw5QFtFUMnParWTCMVQgDBLyvtXJT2Z3MtabE56K0uLhdcNrdXpuRDschFM4mZGWTu1MqLOQbMxPLhatn8vHAXgIxA+1uUpXTh6ucPZfpdzgFpspGzCSk6Ws1nNFwTfHG3rpdLBBeTiV2+nGcNvDiVo1hJQo9w8fhrUSsfVlHSj7yNXttci4Ju+SnsecylGnpVMt6//mQx5GzA24P0aTwLQjjioOw9oKzk/Lm6k+Ht7SK7e1wviVAuIGYhl0sIHgvgV93Wb71FLqUK2j+rS8qfe22RE7iAC1tIH6R0lKrpplXo4kEJ3d5P1GvyDAUe6x4f3CNBfZCyThMPggHo8k2U4CxC+tjvPPFFtxM0gCpSjSBrd6pjnHYppVug3cqW7MUBzVrhM6Mh2+Y8eIi9bZMNDf1bVLX3mG2Wmb7/mlETDhuxv3KhmjNEH8r9861+YwlSsH7Y0IHhv/0GNAQC2LBqL+LfJgGh+N/OyvRd7pd/kPefslzbkEZm2KxcaZdzYcqZKXFXql0KGaoq6sZm6ZaFPxl1ytrskDZPjmBGY1fBwdxNoNY34fnZ2hCZZVr8z3g65eCp0mmh02hF0qq838vGDTH84RD88OF6JIqeYNMPY
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR01MB2571.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(376002)(366004)(346002)(396003)(66556008)(91956017)(66446008)(76116006)(478600001)(186003)(53546011)(66476007)(5660300002)(8936002)(8676002)(26005)(316002)(110136005)(64756008)(66946007)(6506007)(6512007)(85182001)(71200400001)(83380400001)(4326008)(2906002)(2616005)(31696002)(36756003)(6486002)(86362001)(31686004)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?gb2312?B?SDcxbUVRTW1CdGt5ZnovdkhDNUc2ZzlFT2E4eTkwOEUvOC84TkJncE9jcUNs?=
 =?gb2312?B?T2JTNVBNRUtvaHJyWGQvRzNHekxmNjBjeFVjK25Uc3RPRXNYaGVaWjVYQjhJ?=
 =?gb2312?B?UjdHU0s4SUxhVllrdFJ1WFNQbjU1VW4zZkkrVVZDSjljRUpsek1mMDlqSFVT?=
 =?gb2312?B?ODV2OGFPRi9uelpETFpXVEdZZWcxeDJVMEJDdlE1YmpRYVhYSWpJbmdtSjE0?=
 =?gb2312?B?OTJnOFhKQjM1U1lEbzkwT0dxQUtVUzROeENzUERsOVdlSDVvdmFCeUxTNEJ4?=
 =?gb2312?B?ZTNuWkdGKy9rS2pkQzRiZTRSUkpNTU1McHBPNnh3a0pKRE8yNVFvSTVsY1Yz?=
 =?gb2312?B?dmxucGtnYklwbXJTdy9RYUViOXNCOGJvTjI1V3YwcVBUOGJTWkF4N05QTFRH?=
 =?gb2312?B?R1d0dGpua29RVk9pajdub09HRkdMc3FpQnhnWHgrQTV5bFUyWmdvQlNHNnFy?=
 =?gb2312?B?QUtCWVRxWUhKeXp0TVBnYnNDcWlTY280VkdLcXVPWmdaSWNyVUpKdGNhaEVi?=
 =?gb2312?B?V3JDL21TaEtNWkdHMXdWWWhjS294STVXR2NvMTQwYUs5UGFmRVRnNmFuSWNR?=
 =?gb2312?B?MUQ1TDdHalRSc2d3Q0p2U1dGZ1IxdHBYaE5ndll6UFlDT1JheWlBV1hZTVpj?=
 =?gb2312?B?NlpnTWhVbEZnSHc0OFNWOTBxdWRWR05mK3J5dEZMZk9WN2ZmangyU2Qxb0NB?=
 =?gb2312?B?dzdNL3JVb0xSWnNleVFhZmpnSEl4T3haSjFXU05CQUhYZlJTL1JvQ3FOY29G?=
 =?gb2312?B?RXNYaWFXbjZQWjVDTnFzWjU5SVY2blhtb1k5SDBwTmx1bWh1YXRvNEF1djJY?=
 =?gb2312?B?RHpGQU5GMGR3bEJ0bkx4NnA4V2Z6Rkw2YklMK0VVOHUrTW9VbWx0SmJZdUYw?=
 =?gb2312?B?bzg4R0ZkYXlqZlRCcVhyUnJaYm0rWDdNT1oycHUzanUrRis3QzAxR2ZMQWZj?=
 =?gb2312?B?dXJNZnJ1dGdJaTVUUk5JdC9UREtVbFE2RlcwSXk2Vm5TQ1JJZENhRExuRk0w?=
 =?gb2312?B?elV2NXBCQWJJUVl1clhRN1ptdktqekgyYjVnMmNiU2lQVmQwZHpSYms1T2xE?=
 =?gb2312?B?dmhWZVZBMm1hdkYrcFBKREJoWHBCOWhsZllhNDBMa0p6dzIvQU5rY2Y5MHFt?=
 =?gb2312?B?WWcwMGZENFg1YUlXOEJTdmo0YUp3ZVNDV29DMlhGSjBBQ2IzL1VyUHRwVDIw?=
 =?gb2312?B?dUQ2NnN2Vmx2blNkb3M3TzRyTWVsaDkxVkVReGY3ai91SkZQRHE0Zk1ZVWg0?=
 =?gb2312?B?UnVvYVpoZjhkMFZ6MEpzN2d6S3lNa0Z5ZHhhNUZzWHJVUWFyLzRSTnl5MjJI?=
 =?gb2312?B?N2JvbUt5aHNVTFNlRlNOaXlsazJHQmo5TCtNeXltZ0JMZDNMYitNRzNWcXVi?=
 =?gb2312?B?em0vaHBsakszcS83dFAzVU5SQkhhclc1K24rMWZTcnFYMXEzVWpiZ0VoeU9N?=
 =?gb2312?B?eVpHLzRSdHFkZis0VFJlcjJ2UkxLZjU5NDBsWHRYU3NITmxRS2tPMzBTbmYr?=
 =?gb2312?B?aEZXTTBEVDk2UVNzUUxaVTU4ZmpVSS9OVi9zeWhtRG9qR0tYMHV6c295WVYy?=
 =?gb2312?B?QWoyNmR1bjl1OU5zRnZPUEdBMksyMWFwUjJVMko4K0VQNVA3SnNoUzlvKysw?=
 =?gb2312?B?MWtjeGdCN0RCVnlQMTRWSXp1WWt6NWRNMlR1Z0pBN1VqTW1YRFFYSGRxNzhs?=
 =?gb2312?B?Vm9taFgwWFg1OTh5MzFCWUFuckxFQ1ZudWE4ZnpOTzR0WHR2ZVppNS9qUy95?=
 =?gb2312?Q?jLw9XCUblWIZ1sUDMLsV1rk5zlhCJPx859hNWCm?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="gb2312"
Content-ID: <A69B45C5E612E34FBC4101683489D841@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB2571.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ddbb5f8-0a2b-45df-5d6a-08d8e52ce647
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2021 08:00:27.6454 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FDMzBUyW/BIU/DBwBnGOOOm3BxgVpP9AUw9hid3bkf94GLT49rvaKrBwNXwQQV4TlJTRpTa3PZ4vZM+KnNIe7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2397
Received-SPF: pass client-ip=68.232.156.101;
 envelope-from=lizhijian@fujitsu.com; helo=esa14.fujitsucc.c3s2.iphmx.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 12 Mar 2021 04:24:48 -0500
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCk9uIDMvMTIvMjEgMTowMyBQTSwgbGVpcmFvIHdyb3RlOg0KPiBGcm9tOiAiUmFvLCBMZWki
IDxsZWkucmFvQGludGVsLmNvbT4NCj4NCj4gVGhlIGRhdGEgcG9pbnRlciBoYXMgc2tpcHBlZCB2
bmV0X2hkcl9sZW4gaW4gdGhlIGZ1bmN0aW9uIG9mDQo+IHBhcnNlX3BhY2tldF9lYXJseSgpLlNv
LCB3ZSBjYW4gbm90IHN1YnRyYWN0IHZuZXRfaGRyX2xlbiBhZ2Fpbg0KPiB3aGVuIGNhbGN1bGF0
aW5nIHBrdC0+aGVhZGVyX3NpemUgaW4gZmlsbF9wa3RfdGNwX2luZm8oKS4gT3RoZXJ3aXNlLA0K
PiBpdCB3aWxsIGNhdXNlIG5ldHdvcmsgcGFja2V0IGNvbXBhcnNpb24gZXJyb3JzIGFuZCBncmVh
dGx5IGluY3JlYXNlDQo+IHRoZSBmcmVxdWVuY3kgb2YgY2hlY2twb2ludHMuDQo+DQo+IFNpZ25l
ZC1vZmYtYnk6IExlaSBSYW8gPGxlaS5yYW9AaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBa
aGFuZyBDaGVuIDxjaGVuLnpoYW5nQGludGVsLmNvbT4NClJldmlld2VkLWJ5OiBMaSBaaGlqaWFu
IDxsaXpoaWppYW5AZnVqaXRzdS5jb20+DQoNCg0KPiAtLS0NCj4gICBuZXQvY29sby1jb21wYXJl
LmMgfCAyICstDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pDQo+DQo+IGRpZmYgLS1naXQgYS9uZXQvY29sby1jb21wYXJlLmMgYi9uZXQvY29sby1jb21w
YXJlLmMNCj4gaW5kZXggMDZmMmMyOC4uYWYzMDQ5MCAxMDA2NDQNCj4gLS0tIGEvbmV0L2NvbG8t
Y29tcGFyZS5jDQo+ICsrKyBiL25ldC9jb2xvLWNvbXBhcmUuYw0KPiBAQCAtMjExLDcgKzIxMSw3
IEBAIHN0YXRpYyB2b2lkIGZpbGxfcGt0X3RjcF9pbmZvKHZvaWQgKmRhdGEsIHVpbnQzMl90ICpt
YXhfYWNrKQ0KPiAgICAgICBwa3QtPnRjcF9hY2sgPSBudG9obCh0Y3BoZC0+dGhfYWNrKTsNCj4g
ICAgICAgKm1heF9hY2sgPSAqbWF4X2FjayA+IHBrdC0+dGNwX2FjayA/ICptYXhfYWNrIDogcGt0
LT50Y3BfYWNrOw0KPiAgICAgICBwa3QtPmhlYWRlcl9zaXplID0gcGt0LT50cmFuc3BvcnRfaGVh
ZGVyIC0gKHVpbnQ4X3QgKilwa3QtPmRhdGENCj4gLSAgICAgICAgICAgICAgICAgICAgICAgKyAo
dGNwaGQtPnRoX29mZiA8PCAyKSAtIHBrdC0+dm5ldF9oZHJfbGVuOw0KPiArICAgICAgICAgICAg
ICAgICAgICAgICArICh0Y3BoZC0+dGhfb2ZmIDw8IDIpOw0KPiAgICAgICBwa3QtPnBheWxvYWRf
c2l6ZSA9IHBrdC0+c2l6ZSAtIHBrdC0+aGVhZGVyX3NpemU7DQo+ICAgICAgIHBrdC0+c2VxX2Vu
ZCA9IHBrdC0+dGNwX3NlcSArIHBrdC0+cGF5bG9hZF9zaXplOw0KPiAgICAgICBwa3QtPmZsYWdz
ID0gdGNwaGQtPnRoX2ZsYWdzOw0K

