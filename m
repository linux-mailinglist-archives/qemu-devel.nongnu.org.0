Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8252338986
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 10:59:37 +0100 (CET)
Received: from localhost ([::1]:41710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKea0-00047u-T7
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 04:59:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lKeWv-00035I-PR
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:56:25 -0500
Received: from mga12.intel.com ([192.55.52.136]:42036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lKeWs-0008FH-TL
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:56:25 -0500
IronPort-SDR: HFeFsoP5SlaUAP6/xgwmG25HiwZYdpbb0YFX9D/qDTlzbPRRcZ0AYXJgUFpCNJRdrZDWSweQ++
 ByT9F0vP9mEA==
X-IronPort-AV: E=McAfee;i="6000,8403,9920"; a="168084504"
X-IronPort-AV: E=Sophos;i="5.81,243,1610438400"; d="scan'208";a="168084504"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 01:56:18 -0800
IronPort-SDR: zTcb7toIH+eNwOHo4wRbatziNaYAOFvcEu6ggjw9XuAAPyZ0bdyCRRpPORXGkmrziTeZ5DMhJH
 aUMx1Fyfhgsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,243,1610438400"; d="scan'208";a="603880063"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga005.fm.intel.com with ESMTP; 12 Mar 2021 01:56:18 -0800
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 12 Mar 2021 01:56:18 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Fri, 12 Mar 2021 01:56:18 -0800
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (104.47.46.59) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Fri, 12 Mar 2021 01:56:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CGR3w7oWWhxHWOP9d3ERA5yZWefIiqhyNP8XDUVLnw4JIN2M5nNTC3ucsFxILzCoBBxX9GxO9AObHIG9TCdC0ocwDIprQScW+28yFqZj9ow6qmyxHi5j2vsENuwWBTEjFDP4LjiSsOrNyAFi5iipeNMnwgcxjH4O9afclfWhBNY6TjCmArpNxjlNc6B+F/0N4zzo+35CR/ZsT/dwESNtoKeeY+nUqLBSUM3KRksqTL54CWgVQTUGDhttM1SnbRydadYVoh4LGdYqPD+0ZJnwWCa+U3HdMyyAlsXOZg3C3MYQIGmjE57uHLmOvISs1RNGmbt/srtUI5IPx8UhJeKovw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WhdYrXOlQRTyflyAOS0hJaezhYZoAnuqd4F0RYLAH+Y=;
 b=TbHBnXwuwXT6T8jQJGhygX+CO+TjRi/fZRlTzupsMeqnLv52+WlxrQ3eKAGNBbSEeS94v7XsDS/N/0P313e+5fAFNnC26lwdKip/YJOJPWgfEM4cB2FynqH8pZCfXwASpJsHQtBYccJgFpTh+jpk5AypCI57sfWRohQO6i/OJxc57jrSfowUBV6dezgvIEPf/fDpxLPUbJxy/kywfmEb3aOSKB0di5hp6Qsu10htP0jVJI6DXoFhxquTqSAVsQ4eS8HdoeYQONaAzdQ2WNSgTnxsUxaxggETUnO8iwzk66oNwZK42svcSexDhBMWWeo9guBcbPY0UilHiO949e3dsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WhdYrXOlQRTyflyAOS0hJaezhYZoAnuqd4F0RYLAH+Y=;
 b=wE1Y5PPkCTESpSqHz5UQ6U9CxLDBqCvGqd4bIZ9U/3hX6Nzw646ZBEQhKW2U/cO1T1qJ9ToctFCTWrxo4ODRK0JGNR3qnplsCI4iaOcAnGmgInm00VeDZG/7fvlJTOPAovMlzY+w26bqqWZibdD5wOOzbbhCD4aLU5apbIFpEuU=
Received: from SN6PR11MB3103.namprd11.prod.outlook.com (2603:10b6:805:d7::13)
 by SA2PR11MB5131.namprd11.prod.outlook.com (2603:10b6:806:116::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Fri, 12 Mar
 2021 09:56:15 +0000
Received: from SN6PR11MB3103.namprd11.prod.outlook.com
 ([fe80::c9c2:8157:5bef:9b2]) by SN6PR11MB3103.namprd11.prod.outlook.com
 ([fe80::c9c2:8157:5bef:9b2%6]) with mapi id 15.20.3912.030; Fri, 12 Mar 2021
 09:56:15 +0000
From: "Rao, Lei" <lei.rao@intel.com>
To: "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>, "Zhang, Chen"
 <chen.zhang@intel.com>, "jasowang@redhat.com" <jasowang@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>, "dgilbert@redhat.com"
 <dgilbert@redhat.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "lukasstraub2@web.de" <lukasstraub2@web.de>
Subject: RE: [PATCH v2 05/10] Optimize the function of packet_new
Thread-Topic: [PATCH v2 05/10] Optimize the function of packet_new
Thread-Index: AQHXFwAfZGOfsue6xEKjW/ZC7yr6YKp/6rSAgAAwGjA=
Date: Fri, 12 Mar 2021 09:56:14 +0000
Message-ID: <SN6PR11MB31033DC95CB2E555414AA186FD6F9@SN6PR11MB3103.namprd11.prod.outlook.com>
References: <1615525383-59071-1-git-send-email-lei.rao@intel.com>
 <1615525383-59071-6-git-send-email-lei.rao@intel.com>
 <e5247376-5319-64d0-850c-5a28415c1c41@fujitsu.com>
In-Reply-To: <e5247376-5319-64d0-850c-5a28415c1c41@fujitsu.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: fujitsu.com; dkim=none (message not signed)
 header.d=none;fujitsu.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.102.204.38]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2e1ce23f-587b-4eb1-43cd-08d8e53d1330
x-ms-traffictypediagnostic: SA2PR11MB5131:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA2PR11MB5131664DC1054AF13AC065E0FD6F9@SA2PR11MB5131.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:91;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MukBqxwwdkfN4+nCz0xCz0eK6JrqXn6bV/DcHPIsraGQT6BJrl5+tZHfwwoIvsJSQf5a6zhdFtsfdgUmrbErvNtARUGjpY0On/O2HYjDX16/yoFmaJ3EaKgoAkhx5Qj+X4z83DlW/y8q54uVlSimyymO0hfw+T+QOmECtKdWuT7dn0wmx6mQJv0mAUuTsem6HSFYDAW/a8QB0Qi4f6mr1WbiGNID6y0Nykhmv63uakfXdEWlxJiY2SJVpie1QRQ++xyo0Ezpx/buY0R3O7/TOEMa8f3YXGhovH38cOJU9ZYkuJkQOQ1IuzxBP1k499itO3ELQStf5LyXJG73q3DhPFHmDgItzq74tLy/PkCAGEqWOIU2DNU6Scav9HApNagT8UVyoV0j4JUyysWbHrL59q0XP+iFEHsU9SoTtVucGXWZFHI6JzOKFdbUYPcRBRBW42HvKw7RtxTm8y6fWZ8L/kNB0MxRVZthh4eyFTzL4Gozo0aXg4YkLYfApVaoXPc1jgW2xgSuA15GsC7xxIyWjw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB3103.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(376002)(39860400002)(346002)(396003)(5660300002)(316002)(7696005)(66946007)(55016002)(8936002)(64756008)(66476007)(66556008)(478600001)(66446008)(53546011)(8676002)(76116006)(52536014)(9686003)(6506007)(83380400001)(33656002)(2906002)(71200400001)(4326008)(186003)(110136005)(26005)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?SXpSQ3FFM1I1U00zc3F5cDJPQVQzNDFJMW5OV2ViajdZemV0T2JIRVJSNnMr?=
 =?utf-8?B?emVvaW5mZktKcXdPSVhDMnBnK2wrbGxocGhzUW1jRDlzVzlUZlhYaG9rZHg0?=
 =?utf-8?B?T2VmbGtqaklCL0VmSG5ObVRtYTdTd2xZcWpaZmFGdllxWjNyUHU0TjNxSjYx?=
 =?utf-8?B?V0VVNG9KQlFKMW5Lem9ZL0hLWHVUWWlIbWJ3TUQ0OUFsOERGUHJPR3RNdE9Y?=
 =?utf-8?B?alRGTzJlWUs1SURJSFB5dEF0TnN6elZiaG1mNGhiY1pzZEZIUDR1eUVkN09U?=
 =?utf-8?B?b2k2cWxHenEyRmU5OFBkZVJJSnhneE9WSlBVNDBnQmNVS2JlV3lhNGFXd2JL?=
 =?utf-8?B?MFlVNlUrdktXQXdZYUdOVjRnaEVVK3Z2MkFlRHJkd1hod0pRcUZ0NHJQRTZs?=
 =?utf-8?B?eTVkU280Y1Z4L0VqOENmR3JtUnhDSVpVVDFETEx0TjQzNVdZeUdXVUp2M2dq?=
 =?utf-8?B?bkJIRGUxR2JKWTBjL2ZQR1hoTUJUNTJGekdKeHpUZVpGckYyeVE0eGJ5b2pt?=
 =?utf-8?B?cnY4ajBwNmhYOWhIOXlPc0RhU0R4MnB6N3BGSmwvblZEbzhyR1BrS0hOMzcz?=
 =?utf-8?B?WCsxS29XL0hnUUgxenNtS29YaER0YjhITFJiMmkxSVM4MzRBSkxxTlRHejNa?=
 =?utf-8?B?MjBHc3drTnA3QXh2VXJaZ0JBbFQ1K1o2YTdzN09TcTdpZUt6WFVFUk5ZTXUx?=
 =?utf-8?B?MXZRZFBYRGFpSzViWFBKQVg3MElBNWZ6R2lZUUdvZkRVcXQxdldTdnphMm9z?=
 =?utf-8?B?N1FVclplRFRwTjA3V0UrVDJmbVdBaXkyUVJIb203RkRzZ1o2MEg5R3hWOThs?=
 =?utf-8?B?eUhtTm9jNnJNM0pzUXpYUEJVaGYrUUtzOFY0NmxjOUt0ZTFNaXpDQ2ZDaHFJ?=
 =?utf-8?B?djVpWm1xVytGcWtpcXlrQkh4U1hCMTVWOW0wS09jU3hRRGR6Ni9vOUhPSFVN?=
 =?utf-8?B?YlZYcXVzR2U4dUZLcy96ak9jTkRkajRSZkhWMVNibXk3NTJMM2NjbkVzVHRU?=
 =?utf-8?B?bW4rZTZ1U3daRmZuQ0Jjb2E0Y0owazNuM3ZjZ3RKNmtNTWc5Ry9UcVROZURT?=
 =?utf-8?B?TlJOcDRCbDRqcW56Q0NDTGI5bm1FbmxwS3ZReEZqTEZaMWJKVGFPUlVERUJ1?=
 =?utf-8?B?QUE4bXdsem9zbkFUbWhWYlpCNGdRekREcTh4ZjZZU0ZuQkdOZHlISmJmdld5?=
 =?utf-8?B?ajZMKzl2Sy9Bdm9Qc3hBNUsxeW1QMXZDMWczTXZWeEpFS1YxL2dxN1ZJYnU2?=
 =?utf-8?B?ZjZjR2hlK0I2TzBzV1hreE5tUkd6RjhuVzNzNm56U0Y2YXVzYy9RMWVFeTFh?=
 =?utf-8?B?d2xqbWtCNXBCWnVwVmZ3SWRRbjZlbkh6WExQQ1dsT1pLYmN2Wm9GbjBKcVkw?=
 =?utf-8?B?SEh0VXNpbGcvRmVrU0JSNFpTNTNEQUpGYm9MckhwYVNCTW9vU0ptdktRbGdJ?=
 =?utf-8?B?emVJKzdEcE5WY2NkMmZFNDdwVnZqR0FJektNZm9DY2p6ajFJdUUwZ0pDMFlM?=
 =?utf-8?B?ZEROQzlOcDBqblE4OU12aVVFeUJ3UG1pTGR5ZUJuZTFOYk4xQW1XV0J4QjFC?=
 =?utf-8?B?cWk5YTRCNUdaZlVZZm9uSzNSeUlnTlpuaWJjUlpXOEEwVVV5dlUvSFd0UTdV?=
 =?utf-8?B?SkhxbGR1SVY1aVBTa1AvU09MYUxUQldwcTNSdkhnejY0Z0pVWFFac3g5dy9S?=
 =?utf-8?B?cW4vUS82L0pYOHR2Ri9rMHFuekd5K0RYRTh0SDk2MTVZTFFuOWlvVkpSVFRt?=
 =?utf-8?Q?DRKdgM+KgFzozYqWQ8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3103.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e1ce23f-587b-4eb1-43cd-08d8e53d1330
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2021 09:56:14.9771 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ISaFjMH3riC2KAwxrssx6mrJ07NA36Wwutw309p6UU3V/rpTKuB2FR1ybfZZvJbDJSOvbCwT3MfkfOGLgVn1cQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5131
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.136; envelope-from=lei.rao@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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

SG93IGFib3V0IHJlZGVmaW5lIGEgZnVuY3Rpb24gbmFtZWQgcGFja2V0X25ld19ub2NvcHk/IA0K
SW4gY29tbWVudHMsIHdlIGNhbiB0ZWxsIHRoZSBjYWxsZXIgZG9uJ3QgcmVsZWFzZSB0aGUgYnVm
ZmVyIGFuZCB0aGUgcGFja2V0X2Rlc3Ryb3kgd2lsbCByZWxlYXNlIGl0Lg0KDQpUaGFua3MsDQpM
ZWkuDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogbGl6aGlqaWFuQGZ1aml0c3Uu
Y29tIDxsaXpoaWppYW5AZnVqaXRzdS5jb20+IA0KU2VudDogRnJpZGF5LCBNYXJjaCAxMiwgMjAy
MSAyOjUzIFBNDQpUbzogUmFvLCBMZWkgPGxlaS5yYW9AaW50ZWwuY29tPjsgWmhhbmcsIENoZW4g
PGNoZW4uemhhbmdAaW50ZWwuY29tPjsgamFzb3dhbmdAcmVkaGF0LmNvbTsgcXVpbnRlbGFAcmVk
aGF0LmNvbTsgZGdpbGJlcnRAcmVkaGF0LmNvbTsgcGJvbnppbmlAcmVkaGF0LmNvbTsgbHVrYXNz
dHJhdWIyQHdlYi5kZQ0KQ2M6IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KU3ViamVjdDogUmU6IFtQ
QVRDSCB2MiAwNS8xMF0gT3B0aW1pemUgdGhlIGZ1bmN0aW9uIG9mIHBhY2tldF9uZXcNCg0KDQoN
Ck9uIDMvMTIvMjEgMTowMiBQTSwgbGVpcmFvIHdyb3RlOg0KPiBGcm9tOiAiUmFvLCBMZWkiIDxs
ZWkucmFvQGludGVsLmNvbT4NCj4NCj4gaWYgd2UgcHV0IHRoZSBkYXRhIGNvcHkgb3V0c2lkZSB0
aGUgcGFja2V0X25ldygpLCB0aGVuIGZvciB0aGUgDQo+IGZpbHRlci1yZXdyaXRlIG1vZHVsZSwg
dGhlcmUgd2lsbCBiZSBvbmUgbGVzcyBtZW1vcnkgY29weSBpbiB0aGUgDQo+IHByb2Nlc3Npbmcg
b2YgZWFjaCBuZXR3b3JrIHBhY2tldC4NCj4NCj4gU2lnbmVkLW9mZi1ieTogTGVpIFJhbyA8bGVp
LnJhb0BpbnRlbC5jb20+DQo+IC0tLQ0KPiAgIG5ldC9jb2xvLWNvbXBhcmUuYyAgICB8IDcgKysr
KystLQ0KPiAgIG5ldC9jb2xvLmMgICAgICAgICAgICB8IDQgKystLQ0KPiAgIG5ldC9jb2xvLmgg
ICAgICAgICAgICB8IDIgKy0NCj4gICBuZXQvZmlsdGVyLXJld3JpdGVyLmMgfCAxIC0NCj4gICA0
IGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4NCj4gZGlm
ZiAtLWdpdCBhL25ldC9jb2xvLWNvbXBhcmUuYyBiL25ldC9jb2xvLWNvbXBhcmUuYyBpbmRleCAN
Cj4gOWUxOGJhYS4uOGJkZjVhOCAxMDA2NDQNCj4gLS0tIGEvbmV0L2NvbG8tY29tcGFyZS5jDQo+
ICsrKyBiL25ldC9jb2xvLWNvbXBhcmUuYw0KPiBAQCAtMjQ3LDE0ICsyNDcsMTcgQEAgc3RhdGlj
IGludCBwYWNrZXRfZW5xdWV1ZShDb21wYXJlU3RhdGUgKnMsIGludCBtb2RlLCBDb25uZWN0aW9u
ICoqY29uKQ0KPiAgICAgICBDb25uZWN0aW9uS2V5IGtleTsNCj4gICAgICAgUGFja2V0ICpwa3Qg
PSBOVUxMOw0KPiAgICAgICBDb25uZWN0aW9uICpjb25uOw0KPiArICAgIGNoYXIgKmRhdGEgPSBO
VUxMOw0KPiAgICAgICBpbnQgcmV0Ow0KPiAgIA0KPiAgICAgICBpZiAobW9kZSA9PSBQUklNQVJZ
X0lOKSB7DQo+IC0gICAgICAgIHBrdCA9IHBhY2tldF9uZXcocy0+cHJpX3JzLmJ1ZiwNCj4gKyAg
ICAgICAgZGF0YSA9IGdfbWVtZHVwKHMtPnByaV9ycy5idWYsIHMtPnByaV9ycy5wYWNrZXRfbGVu
KTsNCj4gKyAgICAgICAgcGt0ID0gcGFja2V0X25ldyhkYXRhLA0KPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzLT5wcmlfcnMucGFja2V0X2xlbiwNCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcy0+cHJpX3JzLnZuZXRfaGRyX2xlbik7DQo+ICAgICAgIH0gZWxzZSB7DQo+IC0gICAg
ICAgIHBrdCA9IHBhY2tldF9uZXcocy0+c2VjX3JzLmJ1ZiwNCj4gKyAgICAgICAgZGF0YSA9IGdf
bWVtZHVwKHMtPnNlY19ycy5idWYsIHMtPnNlY19ycy5wYWNrZXRfbGVuKTsNCj4gKyAgICAgICAg
cGt0ID0gcGFja2V0X25ldyhkYXRhLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICBzLT5z
ZWNfcnMucGFja2V0X2xlbiwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgcy0+c2VjX3Jz
LnZuZXRfaGRyX2xlbik7DQo+ICAgICAgIH0NCj4gZGlmZiAtLWdpdCBhL25ldC9jb2xvLmMgYi9u
ZXQvY29sby5jDQo+IGluZGV4IGVmMDA2MDkuLjA4ZmIzN2UgMTAwNjQ0DQo+IC0tLSBhL25ldC9j
b2xvLmMNCj4gKysrIGIvbmV0L2NvbG8uYw0KPiBAQCAtMTU1LDExICsxNTUsMTEgQEAgdm9pZCBj
b25uZWN0aW9uX2Rlc3Ryb3kodm9pZCAqb3BhcXVlKQ0KPiAgICAgICBnX3NsaWNlX2ZyZWUoQ29u
bmVjdGlvbiwgY29ubik7DQo+ICAgfQ0KPiAgIA0KPiAtUGFja2V0ICpwYWNrZXRfbmV3KGNvbnN0
IHZvaWQgKmRhdGEsIGludCBzaXplLCBpbnQgdm5ldF9oZHJfbGVuKQ0KPiArUGFja2V0ICpwYWNr
ZXRfbmV3KHZvaWQgKmRhdGEsIGludCBzaXplLCBpbnQgdm5ldF9oZHJfbGVuKQ0KPiAgIHsNCj4g
ICAgICAgUGFja2V0ICpwa3QgPSBnX3NsaWNlX25ldyhQYWNrZXQpOw0KPiAgIA0KPiAtICAgIHBr
dC0+ZGF0YSA9IGdfbWVtZHVwKGRhdGEsIHNpemUpOw0KPiArICAgIHBrdC0+ZGF0YSA9IGRhdGE7
DQoNCmlmIHNvLMKgIHNob3VsZCBwYWNrZXRfZGVzdHJveSgpwqAgZnJlZSgpIGRhdGEgd2hpY2gg
bWF5IGJlIG5vdCBhbGxvYyBieSBpdHNlbGYNCg0KVGhhbmtzDQpaaGlqaWFuDQo=

