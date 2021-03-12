Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D88A2338A32
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 11:34:37 +0100 (CET)
Received: from localhost ([::1]:41112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKf7s-0003eU-Un
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 05:34:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1lKf25-0004vf-Ts
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:28:37 -0500
Received: from esa3.fujitsucc.c3s2.iphmx.com ([68.232.151.212]:49547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1lKf23-0001gI-NN
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:28:37 -0500
IronPort-SDR: 88q1wyioJyBAH7k9DxPQmasadncaHRnnYIQHrWYO9pTRmri2fCOV2oy0aSsUQCtkyhhH78ILyP
 dl0HnRgLSxwvc1O+aTpNcNlRgFnsNqeTxWKdQFSZbjtUhEbIEiJd/jIXs0iVGQFLZ8ZNio+tXr
 qtqiJEhIzNhxr73J1vgHr2CfOcESVyIJ5DHiKzAgirAFTp5MXU9xf7/DwKiCbJGxbJdeWkmmrX
 A37EOLvII1HzUhNF0Y4eiFlP3KiJAhQ3gykh+nbJ33AwBEvW4/scqcs0bE1A55RukWHF+/Gioo
 5aE=
X-IronPort-AV: E=McAfee;i="6000,8403,9920"; a="35827370"
X-IronPort-AV: E=Sophos;i="5.81,243,1610377200"; d="scan'208";a="35827370"
Received: from mail-ty1jpn01lp2058.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.58])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 19:28:31 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C22mJ7jl7PopbkfhKIaxQVcC00V2yY3H1PezBr6KTpIUKYo7g1uD2N9WQ09DjcVPg4JSXdnjqFyayHtfXXJ1v9fYPOSrZWwxTkYpnNQPqHtTMACatZWfiMmgyFV5JrkBOolNZqs+NQnELc7FpeXMR7THMI+Zr/3aOYPJjD50cE9hzstD7ZDnr6XycfedFR9SB130PkxPdj/2DEf1ZJDGLgwYfkDSjEbZ82pfUXL6EJZLAPiMwk+tfbURQymBqfQtskwnHxt+lm25jqhtnhv3qWSunD+1O2+oYzpOv142eNwa6nYBJHT1DG8X66bdg9TAH27kLvRpnu0evRWEpx/1VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CkvSCFsXTH7+xd3dTQgNOqUDYYf0CX+i6Fls14ZBUvE=;
 b=cYcSGMAkLx0knA9dhkp5zhftKP/fVZL5TZEoqjEyaIGpCvYT22QfZngmSUZu+4Nc4PycZX2j/EC4BO6I9VH3KbA8/N+HQjo2u21N3dgWwFhdrl2Qg2YCgVF0uNEU1TK+szCCEaFuRDDmMFO6vh8oonY0GepCIOkR9aYRPx7KXu7CttPZ6A3UGRuNiRkAv9KVtldDFZsSXJJdrY0qPgYScl1TLGFbVhDJnVTt3/sKkS8Alp+MonKU4F2PBsgOW4m7lc3tPwxnsQQZo5a6+aeoKl0HErHIcjMlc1TjE0GAvLlT5bliccw3EbkTkoyMInHnRMQRtrQybjC0XerolTinAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CkvSCFsXTH7+xd3dTQgNOqUDYYf0CX+i6Fls14ZBUvE=;
 b=nkaMpyQ2Mm6We3FyRY2meFDIYtuhcG6Jee7dQ7iuZAd18PrMiuKAmsLmjMm2uuatLRObLDM8h5Ufji2+UbHl7Ql1zDAZ4rI/GgDpxPy+ExGW15f8rrMTB5UiZynQSLMMO84RkGviPLg7FUXkky5/SFv77Ve7K5k+s6wfFmqZF2c=
Received: from TY2PR01MB2571.jpnprd01.prod.outlook.com (2603:1096:404:6b::12)
 by TYAPR01MB6425.jpnprd01.prod.outlook.com (2603:1096:400:a0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Fri, 12 Mar
 2021 10:28:29 +0000
Received: from TY2PR01MB2571.jpnprd01.prod.outlook.com
 ([fe80::d9a8:f990:73a0:c21a]) by TY2PR01MB2571.jpnprd01.prod.outlook.com
 ([fe80::d9a8:f990:73a0:c21a%3]) with mapi id 15.20.3933.031; Fri, 12 Mar 2021
 10:28:29 +0000
From: "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>
To: leirao <lei.rao@intel.com>, "chen.zhang@intel.com" <chen.zhang@intel.com>, 
 "jasowang@redhat.com" <jasowang@redhat.com>, "quintela@redhat.com"
 <quintela@redhat.com>, "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "lukasstraub2@web.de"
 <lukasstraub2@web.de>
Subject: Re: [PATCH v2 09/10] Add the function of colo_bitmap_clear_diry
Thread-Topic: [PATCH v2 09/10] Add the function of colo_bitmap_clear_diry
Thread-Index: AQHXFwA5H3vYB4UEIkK/NUqQFyeoWKqAJtuA
Date: Fri, 12 Mar 2021 10:28:28 +0000
Message-ID: <8920b744-8e77-41a8-379c-e94c7e732ece@fujitsu.com>
References: <1615525383-59071-1-git-send-email-lei.rao@intel.com>
 <1615525383-59071-10-git-send-email-lei.rao@intel.com>
In-Reply-To: <1615525383-59071-10-git-send-email-lei.rao@intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [180.96.28.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 915e0205-9c0a-4d22-ec68-08d8e54193f3
x-ms-traffictypediagnostic: TYAPR01MB6425:
x-microsoft-antispam-prvs: <TYAPR01MB642542D781F616F9E4B80BE7A56F9@TYAPR01MB6425.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: D5+1KCcNIaFDJ+p7d4E+7nb1AfSKabhc9FmiGWXYObgeVrl52LwYI6qMKMBVv5FWFnNmK4BwK0NfTHXwg+6tghZmQuuPt+Kxa1VTkygWfeQlRyWoNtKSCx+c+LPibo1Cpi/M8HhnBqCvb9jqmw+SXF8bsTrLHZXFq2EWI70sSKfRquofxxagJdsOWISSW8l2tnHTbC7ZiVKibsoEJiMDbB9jeCjv2/KCvnsBcoPucRapD7xiqCJHKQ/RB3vcqvreyzZ8cjTE5GzLnvpwUrykU91NGOjIA0GfJP7AiH5BR2s3uwrw2nAY1YlViZjWoT/NG/0/pktpHNsoyX/80esHLjYu0beXb2q3twyTvH5s/0a6OF5wZ1nn78QdKmLraSVqgTuTDZNzcmObaitTLEmlOfFWDf6zKq3PWpb7oNnU8z93n7fLjGSCuymlUUzU60AgefcSjapFGUPFgFWdtesT6ZdMTnRXGU9f4kaKw47MIKoajIrDmD+rGGgC/3e1CgUiGW4TNIkAHGNtUPwEtzFfVFTGpHTlEa5m4648i7zM1AvqF1nfaVxwRG1dabZfx2iVGJeJiLZSSTRTgDBlhQVR+ChCEydLF4TnYe4ur53W6v1k0RM2Jh1F31g+iwr4LO9U
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR01MB2571.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(376002)(346002)(136003)(396003)(2906002)(6486002)(5660300002)(6506007)(6512007)(91956017)(76116006)(66946007)(66446008)(64756008)(66556008)(66476007)(53546011)(4326008)(83380400001)(2616005)(478600001)(8936002)(8676002)(71200400001)(110136005)(31686004)(316002)(85182001)(86362001)(26005)(186003)(31696002)(36756003)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?gb2312?B?eFpiOVR1K3FRZGx3QjRML3NJSGNBT2tUTUVONXV0aENXMUZJNVdhWk1ZcGR1?=
 =?gb2312?B?MlI5cDBMTjgrOHlEYjRYVlR4RWJrYkYzNmtmZXNOTXgwS1kweGtNSUpwV0Vm?=
 =?gb2312?B?TmM4RUxsUnU2T0ZyZ0tYaS9IM0JQMWF3SnRJNFJzeVJYMWZFaGtJYlZkYVM0?=
 =?gb2312?B?cDFldzdMY1dIT3JXWm9EODBPYnJXWXBEWlR1NStobVlnTGhWclprSVBHQW5u?=
 =?gb2312?B?QnJNYmk3M2NucmxNWWVhd0J3czc3cVlyVUo5OFVXdWZTdmdpWkp5M09kSFFi?=
 =?gb2312?B?VnZtSkJxcG1CUFgxc3ZFcDZac0JjNkt5cVhCODN5aStrZit0UWZJbFczVSs5?=
 =?gb2312?B?aG1XVzgzUmZ3aUh0WW9CVEcyZFBrdzE1T0FYUEc0Y3FiNnB6YWQwN3BwT0F2?=
 =?gb2312?B?NzBrbHVzM3haZVZvN1Y1clA0cktZdVo3SFFCVEhCZFl6N1hpMTVaTGNqcmsw?=
 =?gb2312?B?b2hTSS9weHYwV0lDSDBIalRwcjFMdjdkeDV0T1Y2UE91S0kwUDZCNUppa3Qz?=
 =?gb2312?B?S2JEQm5PMjBEbFRqRjNPQjZidjZ1WVVBeEhMTStKc09iYlJMRzBEZXpZNzgz?=
 =?gb2312?B?V25JRWdZNFdVNUk0MkpJcCsyVnVYYTdLNFI5SEtmSEdiR25CcFFPTnh6enhx?=
 =?gb2312?B?c25MMmxQdllZdVh0dmRxR0pHL2drUWpaaDZVSVVPVEhTajA5ZXFMUXJodDZm?=
 =?gb2312?B?MWpyM2NjU1VCSzBWdlExUFFZeWVqMkQ0MHU0cjkzVGxJNWgyYjJ3OUVsenpx?=
 =?gb2312?B?ZGpDSkhjaG9OMFkzU3E3OFFacFhXcjEwRmxndUhITUVkRGFjVkl4R2NYZkE5?=
 =?gb2312?B?UWNVaFpQb3p6aUtKY2lWdHNOczdBSm9GRlFVb0NvdFYwMDZtMGpDYk92eG5o?=
 =?gb2312?B?MEEycmkyZWQyRkM5cE9WNmJzRmtDeEwyMmRURTNsMmVFT1ZWaG1wVUxNSW05?=
 =?gb2312?B?bTB4eHllY0xXcEpyYlB1ZjdHV1hUMzVHMnA0Z21YSHArbnJPZHArakhaeklE?=
 =?gb2312?B?THIyUU5pS1NZalA4TmIxMktMWVhkN0wvUHRWWi9LQ1hnNXEzNDlDeXpLeDZM?=
 =?gb2312?B?aDdTZlNCelJUbURyYmNMaHpxUTFXRDh2bzYyb3c3aU1qS2w4UjMxbUZBZ0d2?=
 =?gb2312?B?aFZwT1lFSVlJTTFma3dtSkdJNm5uM1p0VEpVc29iK29sNlVvQUlHb2xLWkI0?=
 =?gb2312?B?ZjNFSmlrdzRUZ0pNUWdCZkNOMnlKYmdxdk8yR0JFeDZvQ25HWWFhb1lYS1k5?=
 =?gb2312?B?Z3pWR1l5Y1NoY0l6WnJwZnZwVHJDelkzVXMvODJhUG5mOXp5eDJ2YmdlU1Zy?=
 =?gb2312?B?OTR1aVYwMGx0RU1jNFZKS1YySkppM1dJRG5WeDFoSVpwWUYydkMwUVB3Nmsr?=
 =?gb2312?B?S3grbTRWZ2pkNFVjQ0NoYkIxNUozR09DMk1Yd0ZIVkhScW96TkNxVmVYdUdU?=
 =?gb2312?B?TlRjWGVpeGp0NVlad1BOdUtjUi85TnE2RDlBbStvTXNSVEptRks4VURxbXhp?=
 =?gb2312?B?VEpaNGRKM2wydUxiaGdrUkI4N3lVNUZQbmRsanlRanlDLzBCL0ZCTnU0dVBW?=
 =?gb2312?B?S0paYkhUQ1UvQUxnRnlmZ3JNdXRiS3dhcDhMZ0V0ZDI2eUhlWWljNXlxVnZl?=
 =?gb2312?B?Z2FWL0NVdExtNmp1cEljTDJpWiszQ3A1bitxSndWRGVYU3paRU10UVV6VmZS?=
 =?gb2312?B?OXRSeXE3b1ZKU3UzVXNVVFRCVU5PcnBzTmFNQVpmMHVnVHoxUExYZ0hQQ0w2?=
 =?gb2312?Q?PFUETAV/nU5gij2KZNq67Y+hvcZifDjqEJU1cJo?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="gb2312"
Content-ID: <1A3DD19A2BC3FE45BECA32F9F0EACBDC@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB2571.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 915e0205-9c0a-4d22-ec68-08d8e54193f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2021 10:28:28.9767 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: djVVPVKSXt3gBkjCbMEN2zMXCxE5PWbFfpFozRcGA74oWFQeRowZDO2GuQ9bbZ/jxroHhT0YKEtlEYXrwzZyIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6425
Received-SPF: pass client-ip=68.232.151.212;
 envelope-from=lizhijian@fujitsu.com; helo=esa3.fujitsucc.c3s2.iphmx.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCk9uIDMvMTIvMjEgMTowMyBQTSwgbGVpcmFvIHdyb3RlOg0KPiBGcm9tOiAiUmFvLCBMZWki
IDxsZWkucmFvQGludGVsLmNvbT4NCj4NCj4gV2hlbiB3ZSB1c2UgY29udGludW91cyBkaXJ0eSBt
ZW1vcnkgY29weSBmb3IgZmx1c2hpbmcgcmFtIGNhY2hlIG9uDQo+IHNlY29uZGFyeSBWTSwgd2Ug
Y2FuIGFsc28gY2xlYW4gdXAgdGhlIGJpdG1hcCBvZiBjb250aWd1b3VzIGRpcnR5DQo+IHBhZ2Ug
bWVtb3J5LiBUaGlzIGFsc28gY2FuIHJlZHVjZSB0aGUgVk0gc3RvcCB0aW1lIGR1cmluZyBjaGVj
a3BvaW50Lg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBMZWkgUmFvIDxsZWkucmFvQGludGVsLmNvbT4N
Cj4gLS0tDQo+ICAgbWlncmF0aW9uL3JhbS5jIHwgMjkgKysrKysrKysrKysrKysrKysrKysrKysr
Ky0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkNCj4NCj4gZGlmZiAtLWdpdCBhL21pZ3JhdGlvbi9yYW0uYyBiL21pZ3JhdGlvbi9yYW0uYw0K
PiBpbmRleCBiMjY5NjM3Li4wMDhhMjZlIDEwMDY0NA0KPiAtLS0gYS9taWdyYXRpb24vcmFtLmMN
Cj4gKysrIGIvbWlncmF0aW9uL3JhbS5jDQo+IEBAIC04NTYsNiArODU2LDMwIEBAIHVuc2lnbmVk
IGxvbmcgY29sb19iaXRtYXBfZmluZF9kaXJ0eShSQU1TdGF0ZSAqcnMsIFJBTUJsb2NrICpyYiwN
Cj4gICAgICAgcmV0dXJuIGZpcnN0Ow0KPiAgIH0NCj4gICANCj4gKy8qKg0KPiArICogY29sb19i
aXRtYXBfY2xlYXJfZGlydHk6d2hlbiB3ZSBmbHVzaCByYW0gY2FjaGUgdG8gcmFtLCB3ZSB3aWxs
IHVzZQ0KPiArICogY29udGludW91cyBtZW1vcnkgY29weSwgc28gd2UgY2FuIGFsc28gY2xlYW4g
dXAgdGhlIGJpdG1hcCBvZiBjb250aWd1b3VzDQo+ICsgKiBkaXJ0eSBtZW1vcnkuDQo+ICsgKi8N
Cj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBjb2xvX2JpdG1hcF9jbGVhcl9kaXJ0eShSQU1TdGF0ZSAq
cnMsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUkFNQmxv
Y2sgKnJiLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVu
c2lnbmVkIGxvbmcgc3RhcnQsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgdW5zaWduZWQgbG9uZyBudW0pDQo+ICt7DQo+ICsgICAgYm9vbCByZXQ7DQo+ICsg
ICAgdW5zaWduZWQgbG9uZyBpID0gMDsNCj4gKw0KPiArICAgIHFlbXVfbXV0ZXhfbG9jaygmcnMt
PmJpdG1hcF9tdXRleCk7DQo+ICsgICAgZm9yIChpID0gMDsgaSA8IG51bTsgaSsrKSB7DQo+ICsg
ICAgICAgIHJldCA9IHRlc3RfYW5kX2NsZWFyX2JpdChzdGFydCArIGksIHJiLT5ibWFwKTsNCj4g
KyAgICAgICAgaWYgKHJldCkgew0KPiArICAgICAgICAgICAgcnMtPm1pZ3JhdGlvbl9kaXJ0eV9w
YWdlcy0tOw0KPiArICAgICAgICB9DQo+ICsgICAgfQ0KPiArICAgIHFlbXVfbXV0ZXhfdW5sb2Nr
KCZycy0+Yml0bWFwX211dGV4KTsNCj4gKyAgICByZXR1cm4gcmV0Ow0KPiArfQ0KDQppJ20gbm90
IHN1cmUgd2hldGhlciB3ZSBzaG91bGQgY2xlYXIgdGhlIGRpcnR5X2xvZyBpbiBrdm0gc2lkZSBs
aWtlIG1lbW9yeV9yZWdpb25fY2xlYXJfZGlydHlfYml0bWFwKCkgZG9lcyA/DQpzb3JyeSBhYm91
dCB0aGF0LCBpIGhhdmUgbWlzc2VkIHFlbXUgZm9yIGEgbG9uZyB0aW1lLi4uDQoNClRoYW5rcw0K
Wmhpamlhbg0K

