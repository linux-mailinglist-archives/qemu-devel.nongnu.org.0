Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C23C3D9E7A
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 09:33:08 +0200 (CEST)
Received: from localhost ([::1]:59278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m90XT-0000nJ-0q
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 03:33:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1m90W3-0008JR-0v; Thu, 29 Jul 2021 03:31:39 -0400
Received: from esa19.fujitsucc.c3s2.iphmx.com ([216.71.158.62]:34420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1m90W0-00067w-J4; Thu, 29 Jul 2021 03:31:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1627543897; x=1659079897;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pjNRS0WoSrJ6O7MdSxVRmQr+B6dDM2IghqSJ1WfBMIY=;
 b=IkKPVYSdnw8UlAg3eJHsso9UdArFM0IK08l1C6aRj+UqBdexNeuApOYM
 rQxoHBVTfg+cDLZIanf9jH28znE4OLDaqQjT1peRY7wnQ+l4STJCqHDyq
 cr39MjTzBDARLA1x+i72eIt5HYOO9tspOioR67+b5hCsvQuCMXItMyz/E
 hTiefVZzfaA54Xv+bzRs0Y0Bb9tF+siL0z/HcoT/SVly/LSwaj3DBC+Wv
 eydCYvQ2Kd9m9UlrKPtWRiTSZwLfgdv/sMCbY6nzPI5ISnf7np7y4OqVE
 RxKZuJnR+77iVr1H6egzmj+Gtz5iwSiTDk3of6E5tWms6UBRD2ZWe0gAn Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10059"; a="35539707"
X-IronPort-AV: E=Sophos;i="5.84,278,1620658800"; d="scan'208";a="35539707"
Received: from mail-sg2apc01lp2056.outbound.protection.outlook.com (HELO
 APC01-SG2-obe.outbound.protection.outlook.com) ([104.47.125.56])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2021 16:31:32 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N+rC18g6FpZtl2NleS1QldfUXQgFBydW+i2aUswoMjsLV5yuHNea+iFybJHOXofHZHG8IUIcy0rPXWvbN7fTp8Qw3fPDHbTKU7MEdUipaDGauvX101YAIqw/CnyFpsNc6ncVTn+sD0k1g7hYpnbB4aM+UbLZoptI5JhfMu2WK1R6B0/TUkTputmQaEFTlIYGYSZDo7lVcZomArDRxhucbx32Wtw/qPURUIOY2X8AgLPDLbEqC8fjlAUE6vrZ0ZWbp3BQYpqygmkZ9XGoqc4BvzTJ0xdMgauwD13/AfwT2bcRqx+r7vjPXyEFUx+DUPPx9cIe/krqa1MnIygu2HhSAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pjNRS0WoSrJ6O7MdSxVRmQr+B6dDM2IghqSJ1WfBMIY=;
 b=R+DyRF+6hiiKnVzrOV2tC5SiEBzC+R42wXFwLxl0F0w+6/CqGyObUsfdh2RGqTqON36IGZn1SwEwdfGzathX5TllPGQARkVh/cr8lLj9gK20KCzKQE9Ub5V3pncvYSlmh+od06xRX1MvdvmMrHA1M1Y+nv2ybZd/IqYQMLIr14yV4MNPSoDNiil8rxGDB8NbGmLaHZgLutyPICvvpz5P01vrm4EaYVdm56POqjn59bCcrXEUsj/VeYUbpK3AOLpvgZJHveKdOOTXLaH6lherDcbTNSE+2h6B50PmenMYRp8B4/Wbn11j5+OoxL0tYtFG2j6cPJiMCd5pdUHuptWHiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pjNRS0WoSrJ6O7MdSxVRmQr+B6dDM2IghqSJ1WfBMIY=;
 b=rGpl6NfqABupNEwtnxEgoK+DHxGwhtKB9yHnrH8Ia5OeELHUtpLg8yGzc2on+HKOneichw1CtmgSGdZdAez1rDh7dGkj8NIGlii+SE0ZDq5ONJRXDVH/wpBms12xhLLLj4MrfMUFz4eqxT20nlvlg+kZz19dKO5aYW9836s38PY=
Received: from TYCPR01MB6160.jpnprd01.prod.outlook.com (2603:1096:400:4f::8)
 by TY2PR01MB2010.jpnprd01.prod.outlook.com (2603:1096:404:10::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Thu, 29 Jul
 2021 07:31:29 +0000
Received: from TYCPR01MB6160.jpnprd01.prod.outlook.com
 ([fe80::154e:70ee:e0c5:f482]) by TYCPR01MB6160.jpnprd01.prod.outlook.com
 ([fe80::154e:70ee:e0c5:f482%8]) with mapi id 15.20.4373.021; Thu, 29 Jul 2021
 07:31:29 +0000
From: "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
To: 'Peter Maydell' <peter.maydell@linaro.org>
Subject: RE: [PATCH 4/4] docs/system: Add a64fx(Fujitsu A64FX processor) to
 supported guest CPU type
Thread-Topic: [PATCH 4/4] docs/system: Add a64fx(Fujitsu A64FX processor) to
 supported guest CPU type
Thread-Index: AQHXegM8Q48iqYUTB0aCW5oa19FiD6tKRuoAgA9XqOA=
Date: Thu, 29 Jul 2021 07:31:28 +0000
Message-ID: <TYCPR01MB616010C1BAD136B9156C6B86E9EB9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
References: <1626413223-32264-1-git-send-email-ishii.shuuichir@fujitsu.com>
 <1626413223-32264-5-git-send-email-ishii.shuuichir@fujitsu.com>
 <CAFEAcA-Dd0eh35CUo7_-_adye+DrTuFK471-A3JfBbegxoU9Jg@mail.gmail.com>
In-Reply-To: <CAFEAcA-Dd0eh35CUo7_-_adye+DrTuFK471-A3JfBbegxoU9Jg@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9ZDk3Mjk5YTAtMzBmNS00ZWFmLThjMTYtMTlmMWMwMjZj?=
 =?utf-8?B?MWUzO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFRO+/ou++gA==?=
 =?utf-8?B?776LO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX1NldERhdGU9MjAyMS0wNy0yOVQwNzoxMzo1OFo7TVNJUF9MYWJl?=
 =?utf-8?B?bF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfU2l0ZUlk?=
 =?utf-8?Q?=3Da19f121d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4f356759-5757-4fbd-7ae5-08d95262e152
x-ms-traffictypediagnostic: TY2PR01MB2010:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR01MB201090D3818B91311D655BBFE9EB9@TY2PR01MB2010.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rND3rnBkVin8sIubW9xo8dB4p9lS7/AQilSOdp/l8BU3NBi4r5clA02caiVY+/85RZ637lUofdQftfylBN4tfhirD7spYwiOQh7A0dBf4L01WH10Y/Q9QucsotGoaYSU6am8YrlPbP8OUmhoJzICnZJYfavKW+FxnGprG1m50X41Nmh30fi/0iCnmScii5DzZrP/yFdgj68NYrTUHmKnCROghXSSnbRS/xs30Loc/bSQHRbHYDkklgecUUpASR6/ozjeuu7mKC1ZCoyZ3Z7ZsqlaW6zqEEe78lU29Azmhb2qR79/CWtDmUtOQow78FW8q2neEgkRlch8vIDajY9Mb9rt+5AXNCS93OU30nxts+6FQJv7ZMv+fFH7nmacjCqiNnKVWCO7OFBPlrQ8xX2GB17O2rZ2RaV9ITbkM8GLhZ6uegRP1G7B9pNMbmClp921KItp1/q1bjn2m/60GP+QsCUKYkwpyPna5ZnBG5VTY9SC4pUyPhDd56UjFrzu/pq1gOO45vQZaVdY1VqQsx/1Nv5BDBXTU9MLngcmj5CQCEOjouVW+e6H8xm+KwGR54J50xs4N1LvT81jRxm6frnel1z6R7g/a/VMlIK3SkaUPY6ZBwRKMdyHiIAyB2prbo+T1HwTJih4IMPqHg+5vtHVsZxST5QHSUnb393d7CLfIJQ7i8A8KSjcrUL8c7WCoJOfoH2s84Ao0aD4+w1BKnb9ug==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6160.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(366004)(376002)(346002)(9686003)(478600001)(8936002)(55016002)(83380400001)(66946007)(76116006)(7696005)(186003)(6506007)(53546011)(66446008)(66476007)(66556008)(64756008)(85182001)(122000001)(316002)(38100700002)(52536014)(54906003)(71200400001)(5660300002)(26005)(38070700005)(8676002)(2906002)(107886003)(6916009)(33656002)(86362001)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cFptWGlxODUzN00wVDh0U2Z5VDc5SVk3cHUyRzl0R1hyUVBvUG5xaHFmbDhV?=
 =?utf-8?B?RTBqWG9VR090NFR6VkVHZE14ZnZUeWxNZFF4ck9xRGpsNktLVW1EOFlPc1V0?=
 =?utf-8?B?ZVNaUFppdFZpSjVCR1B6VThvVmZ4WWRiUmIrSVZxUmFKcTA0WGpQVkMzYXlH?=
 =?utf-8?B?V3IyWFlweXRXYjVQOUZhbDl5dXdGNzdJaHkvMWNnYUpWWXNIaCsrbW1QZ24y?=
 =?utf-8?B?ekNraXpCOGZRUjRDWmllQ252MVo1bEVyTGJHVCtvL2pDdk42WXhWdWpHMzBI?=
 =?utf-8?B?elk3aHJzQi9OZmxIb0JYYmhqREQ3V1A0cGRQQ3JwM2F6cVlyc1Y3M3FUbmh6?=
 =?utf-8?B?Y2R1R1RFYzA0NDU1TmRuQnV0ME1MNFcyT3RhZzg4S3c2Mm93Y3pjT0dtNmVi?=
 =?utf-8?B?bHJJQ0dZT3FkTElUNUNZelFiS0dUd1VOZGMreHZhR09QUGFxK1podzR6UTFP?=
 =?utf-8?B?VzdHODlZYUpadEVwVUtXei9pNmxGQXhaMjFkK2VEM2krSkxseWRwajJtRVVz?=
 =?utf-8?B?V2lTU01JcWJ4TnFHR01OME5SMHM1L3VrK1lzSFI4d1hRRUNQdXNPaDZqZ1Jq?=
 =?utf-8?B?bWxYS3c1aUtYdlI3WFUyRlhVSitQMy9rQ1pGQ3B4VVlNckwveU1qZzNIN0wv?=
 =?utf-8?B?cGNJQlZObE8zd3Qya2YzR0FjVFpEaVlrMlJrcE50V0o4c0VUQVNLTEM0dVRF?=
 =?utf-8?B?OVJwZjBNbXQ1QlhRUXU5OTVMZG95alFCbTJpblR5RGt1WHBxT3FMV09ROHE0?=
 =?utf-8?B?VUd5MUVoazdHTXdaTXp6Z3JDUWxiTzBVcVgxVGtNOUZ4QytTaWxEN1cxUTVM?=
 =?utf-8?B?ZDF0cFl6eHZKZ1lmZ3JXSFA3ZllhQTBCR1JOa24zNjkrczQwcWtWMXFGYzl2?=
 =?utf-8?B?cmZYb2NFL254QUx3R3RER2NDUkk3bldHc21wVDB3bkpKRlZEcXBUelNaRjRW?=
 =?utf-8?B?TTgzWUxnWmZvTXRMU1FQQzNKZW9nMVZZb1B5d0NGVDJzQmlRS3BEbUVKSCtw?=
 =?utf-8?B?aWZsUlVvcmpNalRnTHA4bGh0WGR5RTVheWZ6MjdZTDhINHRDVEczSUh1MGNW?=
 =?utf-8?B?VnlZNHphbDF5dGFMWVhHcGxCMDkwNmcwTUJBNUZBcC9SalpUZDYwcVBQOU5N?=
 =?utf-8?B?bnJOWS9kY2pHbytlM2syRFhTbzRYdENhc3pkcjUwa0pEWC81amx2ZEZuZ0Jz?=
 =?utf-8?B?NTNDdU9yV0tWZlBpSys2Q3h2VmlUZGpJZE1PaWpMblRLQTBuclBFVlk1bld0?=
 =?utf-8?B?cXVOcEM4NjhjSDNBbFp2Mys2S00wc3RvUU5zT3l5aHVBVHh2R01hellDQ0N1?=
 =?utf-8?B?eEE0WVdWclQ3Z2JITU0yUkhtVEhteWVlTTBraVhVcTEyVXo3bHd3K3lPcm9n?=
 =?utf-8?B?ek5lY2NLRXprVElZV04vMm5KMVFac2JkaURyUXJWWmtKR1lSenF4cWEwVTVh?=
 =?utf-8?B?WE9HTGVpMzlueWxmUXE1TkRCa0ZOb2NQZjNlV1M3WnA1OGYrc1JIKzdXd3dO?=
 =?utf-8?B?WnNhZUNndWJTTlRqNDNnRmlYM3NRcVh0Q3IrdTJVUXgramJsdUYxSmFGcEhL?=
 =?utf-8?B?TW5ueTdSZWgzYlB3Szk0c1FQd3pkcWdIQU1VMnErd0FMRVhvSGViUU81RmlI?=
 =?utf-8?B?c25Xc095Q1ZhUGNPUWZ3Z0lXT0cxclZGL0c0Y2kvUDEzZm45c3gwR2czVUd6?=
 =?utf-8?B?QkpPS0hUS3lXRVp4V2lDWXFtLzF3RjRiUEttbEFMQ1p2ZXdocjhuSkVnUzZp?=
 =?utf-8?Q?T1GW56rZtp+1GFuGjVWoN1o0o/yY9HPthRDVz7l?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6160.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f356759-5757-4fbd-7ae5-08d95262e152
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2021 07:31:28.8982 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: db6K2BmKEoGnTo0m4CqZGynzlcG/h+LtX2BgN7YFuS7Umz/F28nAhceS7wP2YqqoqQJOfBCZmmGBtZCR8Eb6BwYJ1njbx1rpiq9aKqVHgbo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2010
Received-SPF: pass client-ip=216.71.158.62;
 envelope-from=ishii.shuuichir@fujitsu.com; helo=esa19.fujitsucc.c3s2.iphmx.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGksIFBldGVyLg0KDQo+IFRoaXMgYWRkcyBhNjRmeCB0byB0aGUgbGlzdCBvZiBDUFVzIHdlIHN1
cHBvcnQgaW4gdGhlICd2aXJ0JyBib2FyZCwgYnV0IGl0IGhhc24ndA0KPiBjaGFuZ2VkIHRoZSB2
YWxpZF9jcHVzW10gYXJyYXkgaW4gaHcvYXJtL3ZpcnQuYywgc28gdHJ5aW5nIHRvIGFjdHVhbGx5
IHVzZSAtY3B1DQo+IGE2NGZ4IHdpdGggLW1hY2hpbmUgdmlydCB3aWxsIGZhaWwuDQoNCkknbSBz
b3JyeSwgYnV0IGp1c3QgdG8gYmUgc3VyZSwgbGV0IG1lIGNoZWNrLg0KDQpJcyBpdCBjb3JyZWN0
IHRvIHVuZGVyc3RhbmQgdGhhdCB0aGUgYWJvdmUgY29tbWVudCBtZWFucyB0aGF0IHdlIG5lZWQg
dG8gYWRkDQp0aGUgZm9sbG93aW5nIGZpeGVzIGluY2x1ZGVkIGluICJbUEFUQ0ggMi80XSB0YXJn
ZXQtYXJtOiBjcHU2NDogQWRkIHN1cHBvcnQgZm9yIEZ1aml0c3UgQTY0RlgiIHBhdGNoDQp3aXRo
aW4gdGhpcyBwYXRjaCB0byBtYWtlIGl0IGEgbWVhbmluZ2Z1bCBmaXggd2l0aGluIG9uZSBwYXRj
aD8NCg0KPiBkaWZmIC0tZ2l0IGEvaHcvYXJtL3ZpcnQuYyBiL2h3L2FybS92aXJ0LmMNCj4gaW5k
ZXggOTNhYjlkMi4uMmU5MTk5MSAxMDA2NDQNCj4gLS0tIGEvaHcvYXJtL3ZpcnQuYw0KPiArKysg
Yi9ody9hcm0vdmlydC5jDQo+IEBAIC0yMDIsNiArMjAyLDcgQEAgc3RhdGljIGNvbnN0IGNoYXIg
KnZhbGlkX2NwdXNbXSA9IHsNCj4gQVJNX0NQVV9UWVBFX05BTUUoImNvcnRleC1hNzIiKSwNCj4g
QVJNX0NQVV9UWVBFX05BTUUoImhvc3QiKSwNCj4gQVJNX0NQVV9UWVBFX05BTUUoIm1heCIpLA0K
PiArIEFSTV9DUFVfVFlQRV9OQU1FKCJhNjRmeCIpLA0KPiB9Ow0KDQpCZXN0IHJlZ2FyZHMuDQoN
Cj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGV0ZXIgTWF5ZGVsbCA8cGV0
ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPg0KPiBTZW50OiBNb25kYXksIEp1bHkgMTksIDIwMjEgOTo1
NiBQTQ0KPiBUbzogaXNoaWkuc2h1dWljaGlyQGZ1aml0c3UuY29tDQo+IENjOiBUaG9tYXMgSHV0
aCA8dGh1dGhAcmVkaGF0LmNvbT47IExhdXJlbnQgVml2aWVyIDxsdml2aWVyQHJlZGhhdC5jb20+
Ow0KPiBQYW9sbyBCb256aW5pIDxwYm9uemluaUByZWRoYXQuY29tPjsgcWVtdS1hcm0gPHFlbXUt
YXJtQG5vbmdudS5vcmc+Ow0KPiBRRU1VIERldmVsb3BlcnMgPHFlbXUtZGV2ZWxAbm9uZ251Lm9y
Zz4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCA0LzRdIGRvY3Mvc3lzdGVtOiBBZGQgYTY0ZngoRnVq
aXRzdSBBNjRGWCBwcm9jZXNzb3IpIHRvDQo+IHN1cHBvcnRlZCBndWVzdCBDUFUgdHlwZQ0KPiAN
Cj4gT24gRnJpLCAxNiBKdWwgMjAyMSBhdCAwNjoyNywgU2h1dWljaGlyb3UgSXNoaWkgPGlzaGlp
LnNodXVpY2hpckBmdWppdHN1LmNvbT4NCj4gd3JvdGU6DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBTaHV1aWNoaXJvdSBJc2hpaSA8aXNoaWkuc2h1dWljaGlyQGZ1aml0c3UuY29tPg0KPiA+IC0t
LQ0KPiA+ICBkb2NzL3N5c3RlbS9hcm0vdmlydC5yc3QgfCAxICsNCj4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZG9jcy9zeXN0ZW0vYXJt
L3ZpcnQucnN0IGIvZG9jcy9zeXN0ZW0vYXJtL3ZpcnQucnN0IGluZGV4DQo+ID4gMjc2NTJhZC4u
NTMyOWU5NSAxMDA2NDQNCj4gPiAtLS0gYS9kb2NzL3N5c3RlbS9hcm0vdmlydC5yc3QNCj4gPiAr
KysgYi9kb2NzL3N5c3RlbS9hcm0vdmlydC5yc3QNCj4gPiBAQCAtNTUsNiArNTUsNyBAQCBTdXBw
b3J0ZWQgZ3Vlc3QgQ1BVIHR5cGVzOg0KPiA+ICAtIGBgY29ydGV4LWE1M2BgICg2NC1iaXQpDQo+
ID4gIC0gYGBjb3J0ZXgtYTU3YGAgKDY0LWJpdCkNCj4gPiAgLSBgYGNvcnRleC1hNzJgYCAoNjQt
Yml0KQ0KPiA+ICstIGBgYTY0ZnhgYCAoNjQtYml0KQ0KPiA+ICAtIGBgaG9zdGBgICh3aXRoIEtW
TSBvbmx5KQ0KPiA+ICAtIGBgbWF4YGAgKHNhbWUgYXMgYGBob3N0YGAgZm9yIEtWTTsgYmVzdCBw
b3NzaWJsZSBlbXVsYXRpb24gd2l0aA0KPiA+IFRDRykNCj4gDQo+IFRoaXMgYWRkcyBhNjRmeCB0
byB0aGUgbGlzdCBvZiBDUFVzIHdlIHN1cHBvcnQgaW4gdGhlICd2aXJ0JyBib2FyZCwgYnV0IGl0
IGhhc24ndA0KPiBjaGFuZ2VkIHRoZSB2YWxpZF9jcHVzW10gYXJyYXkgaW4gaHcvYXJtL3ZpcnQu
Yywgc28gdHJ5aW5nIHRvIGFjdHVhbGx5IHVzZSAtY3B1DQo+IGE2NGZ4IHdpdGggLW1hY2hpbmUg
dmlydCB3aWxsIGZhaWwuDQo+IA0KPiB0aGFua3MNCj4gLS0gUE1NDQo=

