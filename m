Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 612FE36BDAF
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 05:17:55 +0200 (CEST)
Received: from localhost ([::1]:54658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbEEU-0001Kh-G9
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 23:17:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1lbEDG-0000u8-Tf; Mon, 26 Apr 2021 23:16:40 -0400
Received: from mga03.intel.com ([134.134.136.65]:26062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1lbEDB-0008Nx-31; Mon, 26 Apr 2021 23:16:37 -0400
IronPort-SDR: wm545JcOmGF5R4Tfm+3R2QwCoaOyazl9p4kW0dNfDzPrCcwor3A0KU2K99g7gIUb9mQxCzgxM+
 sFAoSe8ehaeg==
X-IronPort-AV: E=McAfee;i="6200,9189,9966"; a="196500604"
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; d="scan'208";a="196500604"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2021 20:16:25 -0700
IronPort-SDR: lfvL2CbPaXk8A8qkvM8ui13XJ9eowW7QeJbISSU+4WCWw4kYavr9vcuNhRfpWiPPZi7fmpVjQL
 Cdn7W6gbKq2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; d="scan'208";a="525949258"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga001.fm.intel.com with ESMTP; 26 Apr 2021 20:16:25 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 26 Apr 2021 20:16:25 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Mon, 26 Apr 2021 20:16:25 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (104.47.37.54) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Mon, 26 Apr 2021 20:16:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j0ERZx+6mbVh81+VlkeAoGXygIr/jpANtWrd9IFpIoT4R6HSThgWgkqm5NrE5NtbGD8+osklHm4uqxgHPAS7/S0/kQZMIQFkRjMw/bsDKtTxwEox4UfmHRB60os9l7ri/Q4wkIJ+MU/RGBJpQa6PJOSqNIQul1iGOan/WG+k5gOEGThCWqgM/vIWwwpY1XEgEo4OAOepOibNby+AXKw0y0NzWamaMCHdKKfh1AUGRdZyo4Sj5aXkaKuuKmWHvwd99tIQGHxaz2o/PtgAtslAMw9oOa0SlBBLsifP1ZBzV7Xy9WLX5aD0Zn+JrmaFcXa/qVAP7QxiNUTHq+0CG052uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/bHNyrmglkqMKg3JjTLsG1riLLwFxxqrx31Z1ycTV2I=;
 b=KceHFnFpUHrRRYI7HniRncjozEdcv6cl/NJpiQm8GPptdNDfV+j2/hQ0hjq18lQgkwKzD9JrgFWGxthTYxeWIXjbGYqzxSuIGXIGChEkzTJn74Q9/+ZkwMG44RtuwzPseVTXqmj+b4ZpFPyDaDwzCHc/RWk14Z8YT1PeLzHYp7v3Wm1838VN7UYilq6fAIWskKU0VMyTMZ7+Q/SqaCdZ5D6mmgg6Rr2oQ0Z1DZ+Uu+UHz6EIo+F3FO2noaSZUUdYidbcYth5tjLNFOX2FUcMl5FEutuX1VGtluStU+WyLcZHAD+TyLKWySALrCUcACvh47hAqqVDBK7NkJksHxHHzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/bHNyrmglkqMKg3JjTLsG1riLLwFxxqrx31Z1ycTV2I=;
 b=Z69KJN5Qj63DbWXDyYXYf/PXx1H6sG26A5sQoFTD/6lVeusDSa3/4vJSNP+dfSpQxyQalijJLIyAeneTfn8F5/W0mQeeMxffU4X48aJJmpXxp8DelB/0715eX1O8d4ibZvXoRty2Z3WgOzFujJCNQfcOgPvBzoqNBaBIjWK/IJ0=
Received: from DM8PR11MB5670.namprd11.prod.outlook.com (2603:10b6:8:37::12) by
 DM8PR11MB5623.namprd11.prod.outlook.com (2603:10b6:8:25::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.20; Tue, 27 Apr 2021 03:16:24 +0000
Received: from DM8PR11MB5670.namprd11.prod.outlook.com
 ([fe80::3862:251c:82a4:b416]) by DM8PR11MB5670.namprd11.prod.outlook.com
 ([fe80::3862:251c:82a4:b416%6]) with mapi id 15.20.4065.027; Tue, 27 Apr 2021
 03:16:24 +0000
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH] cutils: Fix memleak in get_relocated_path()
Thread-Topic: [PATCH] cutils: Fix memleak in get_relocated_path()
Thread-Index: AQHXOmWhcqkgf0a/rEOnGVhFc9WDi6rG1dUAgADbspA=
Date: Tue, 27 Apr 2021 03:16:24 +0000
Message-ID: <DM8PR11MB5670211E15AB7194CE0EE4C992419@DM8PR11MB5670.namprd11.prod.outlook.com>
References: <20210426223042.119554-1-zhenzhong.duan@intel.com>
 <0cf13eb3-e28b-31d4-82d1-d99636cbcaf9@redhat.com>
In-Reply-To: <0cf13eb3-e28b-31d4-82d1-d99636cbcaf9@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [114.255.249.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d97d6346-d737-4aab-d44d-08d9092ad6b0
x-ms-traffictypediagnostic: DM8PR11MB5623:
x-microsoft-antispam-prvs: <DM8PR11MB5623E1D83A40761EAD70EBA492419@DM8PR11MB5623.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +vbdbqImBM1RDdNgwLB4E8HThkGRbJd/06XfDka4cCGDBuzb20pLLQ6Wh5dLScUtRMtPold4a1GxtNDa71+Onhs7c9/nmBi9UG06DnU/w4mhrNFg/5Mb1FSVHDK4wPgTTaTbH1pGtLbW8d9NWFFP0AzARnw9/zfKoR/g+fLGRXy/ueFIs3y/yzPsD/PKGlBBtU4GZiFWkhJ9n3+whq8pkB4NCa926PsVx71L+J1yQqbIEbI75jZv5qxFokm+I1UucufFgGrCnfbpl1NxtHcXbrxVbJirw+W7jn2ynGzY0l1QlVo8E8jTDpF5jYghmkiUOm7I7lLbENewfQ43L6SvcuscSgPSj3dQ60XyGxw0e06d3b8WfiESWLjP1ErGPoY46xnQcoqLDJc55EEHjKHepkC/oi/VkwhhwLA3o6CtrzdqB3Y4cKzom0b416mRaQBb44bX6tCmSogTD2SJkQPAKwfuRZQ4LXozMVVriQmTPIPnoRGePj4OhoeoLhkBGWE0oo4hz3ePvhGrKYpAqkX5+E+TqRJ0rDApQGySgFNIUOO+/MNGgBexQqVrm9oaYwZLT3mDHsWL0wQ6cmeh9qUwGVJmN03p2hScsBtXVchaQwT1wr3bxUV85Qh1TkzvJtR9YdHEGufLbmtPnB9nNqcrc7TP3awqhnvn2ZaOZ09Fl9klEdJGbA3SViRqHZ6jCDEl
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5670.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(136003)(346002)(366004)(376002)(6506007)(53546011)(71200400001)(83380400001)(5660300002)(478600001)(86362001)(64756008)(9686003)(8936002)(66556008)(76116006)(52536014)(7696005)(66946007)(66446008)(66476007)(966005)(4326008)(8676002)(2906002)(122000001)(38100700002)(55016002)(33656002)(186003)(26005)(316002)(110136005)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?Q1R6UGpZNnhMRTBmT0Nub2ttQitNblB6OUt4L1gwdTM1ckRzVVA0eERvdERX?=
 =?utf-8?B?NjRJdndCZkhDc1l6a1h4amJhUFBvMFp3VEFCblpFVXdiKzZkRXl2L0J3WjJZ?=
 =?utf-8?B?ay9sWXllbEtZZ055SEpEZkVxNFpETXZTMmhvVEtnVm5mNmcxNk1SdUN3cjZl?=
 =?utf-8?B?ajJpWkc4eXdXeTFaeWJSNUF6U01lYnh5ODIzWElpSzJuYUFlNDFNN0NnQXM0?=
 =?utf-8?B?T0VUdWpxaW9jSitqOVoxUTJsN2lXTUg0bUdGVFZhdWJlWWhlaUtEbmI1ZzZo?=
 =?utf-8?B?Ti9CcithQUlySTVRMUhmVHAra3Y1Nnk1VDM0Nzh2dE5DdFFhYVIzQ3BiNVZ0?=
 =?utf-8?B?YmtTV2pBQW5FMjBRQ0lJTW9EWVRhTXlqRklPeXZNOTNvcVQ3TkNBNnk5RGVo?=
 =?utf-8?B?OWx1bHlFc1k5R1RQVHFYTmt0Y1RuWk4zQVpDY0R2MHVWNmFwVmJSeVZlSUJY?=
 =?utf-8?B?NG5hdHg2WWNwMTB4eGtJNCsrSGxkeEdQNzZZWFFRNlF6b1ZXYW80SXRiUG4w?=
 =?utf-8?B?Ty9Db2RiTVB5VXVrdmhOTVJuNSs0aysxcmZGTTlWMUpscXVTekZoWjcwVVI0?=
 =?utf-8?B?YzBMNlNIUXYrZXVLdjNta0VMRTZGT1VhV2pBeGNvOURBMHR1dEo5MHJCd1hS?=
 =?utf-8?B?QVVPMlR2MkdJNkZhazd3dEdkMVIwOHdnNmxXSGhVNXZsTG5iaUYraWw3Yy83?=
 =?utf-8?B?ODVONk5TNHVwYSszVU15ZElVN3U4NWZBaTZjUll1ekxCS1VQQWZ3blJQUERK?=
 =?utf-8?B?RFVRR0NDd0E5Rmd3VjlIbHdIVUVDa0lXdCtqZG9kUGl4eXdTTmRhZm1Tb1dJ?=
 =?utf-8?B?QzBVcDBvUzd1K2h4aDB2NHN2QnFHUnk5R0VoclBOdHNpNlg1ZHhiRFFuZUxn?=
 =?utf-8?B?cHdSWXpFdEkxRDFnbXhhU0JZREQ2NkdjT2RYWjdsSm4wWlM4dTVrRnhRMHRJ?=
 =?utf-8?B?amdVdjZlRSt3R05xczdQN0RwUmRSUHVHc1hpbGR3TXNHbThNcXVyQVRDUHc4?=
 =?utf-8?B?UHFlc3dqOThYMGswYXhzWHVyYi9hQzM5VmJvNzAwbUd5U1YxbXlnUFY3eHFs?=
 =?utf-8?B?TFFXczdIVG9TRXRjS0prenh6S09HRVVtT3p1MHB0OU1hZTFrd3VaQURaM0tJ?=
 =?utf-8?B?ZHFjUlhVY1E1OXBSc29rSkFYN1kwZkNNYUY2b0I4Zm5TcWFSREdweFpIOWJu?=
 =?utf-8?B?TTRzcE9kS0ZhZjlWR3ZRVjVoNWZpMHZJT2s2S1VQZTdBWm5oMGR2amhJQ2lC?=
 =?utf-8?B?ZG4zc3ZqNWp2Vm16L2JEc0ZuRW1BNmhIUFBrTmtHUjJVK3hxWXpEeG1XNHA1?=
 =?utf-8?B?NDRNaHNCMHRRWEZ4cXFpc1YyaHoyYjh2V0Ezb1h2aG9OaS9oLzV4ZHgyUnZj?=
 =?utf-8?B?TG1nbjJ3TmpJSlVFT0lFZU40TkZVTnRwRW5oTkErYXVGNGV4QnVvcmNsTFJo?=
 =?utf-8?B?Z25ia3NFNDF2bnZsNWdFSHJOVnh6V0dRRjNVS1VjNzhaMS8ycVJ1TUJNMTZ1?=
 =?utf-8?B?Slhuc2lsZWNOWGRHS0Z5WS8zY1E4Z1hsbjVldWdoVkhSaHB0QkVkWkN4bGVH?=
 =?utf-8?B?Ny9hTXI1YnJmTE1iVzZEKzNKdW1VUjcyMWhmdm1NUWNqUWdHWTBYUXFJOFRx?=
 =?utf-8?B?a1pPbVB2ZDhGSzVxMnFqMks0Rk42UnVwTitwakVQaEJZQ09nYUtzVFdEditL?=
 =?utf-8?B?YXp3Q21KczRncUhRWXFxeTVzczc1RUNRc0xaZzIwQ1NObm1MczRFUTVDUk1z?=
 =?utf-8?Q?qhjLnlljwoOX2zPLzmqS4m4uzUhw0oGSIhUGlS3?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5670.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d97d6346-d737-4aab-d44d-08d9092ad6b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2021 03:16:24.3949 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WrxUIFYgu5WxgfF+OUoX1b+Y4YbGh+c6giZiqNBr/GNROYq02cY6w/3KmdZnJ2hqYgCQ8Gpy3xFGUPJof1oS6oCsYZdtitf47Wx6pXTvw6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5623
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.65;
 envelope-from=zhenzhong.duan@intel.com; helo=mga03.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFBoaWxpcHBlIE1hdGhpZXUt
RGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4NCj4gU2VudDogTW9uZGF5LCBBcHJpbCAyNiwgMjAy
MSAxMDowNiBQTQ0KPiBUbzogRHVhbiwgWmhlbnpob25nIDx6aGVuemhvbmcuZHVhbkBpbnRlbC5j
b20+OyBxZW11LQ0KPiBkZXZlbEBub25nbnUub3JnDQo+IENjOiBxZW11LXRyaXZpYWxAbm9uZ251
Lm9yZzsgcGJvbnppbmlAcmVkaGF0LmNvbTsgU3RlZmFubyBHYXJ6YXJlbGxhDQo+IDxzZ2FyemFy
ZUByZWRoYXQuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBjdXRpbHM6IEZpeCBtZW1sZWFr
IGluIGdldF9yZWxvY2F0ZWRfcGF0aCgpDQo+IA0KPiBIaSwNCj4gDQo+IE9uIDQvMjcvMjEgMTI6
MzAgQU0sIFpoZW56aG9uZyBEdWFuIHdyb3RlOg0KPiA+IFZhbGdyaW5kIGNvbXBsYWlucyBkZWZp
bml0ZWx5IGxvc3MgaW4gZ2V0X3JlbG9jYXRlZF9wYXRoKCksIGJlY2F1c2UNCj4gPiBHU3RyaW5n
IGlzIGxlYWtlZCBpbiBnZXRfcmVsb2NhdGVkX3BhdGgoKSB3aGVuIHJldHVybmluZyB3aXRoIGdj
aGFyICouDQo+ID4gVXNlIGdfc3RyaW5nX2ZyZWUoLCBmYWxzZSkgdG8gZnJlZSBHU3RyaW5nIHdo
aWxlIHByZXNlcnZpbmcgZ2NoYXIgKi4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFpoZW56aG9u
ZyBEdWFuIDx6aGVuemhvbmcuZHVhbkBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gIHV0aWwvY3V0
aWxzLmMgfCAyICstDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3V0aWwvY3V0aWxzLmMgYi91dGlsL2N1dGls
cy5jIGluZGV4DQo+ID4gZWU5MDg0ODZkYS4uZjU4YzIxNTdkMiAxMDA2NDQNCj4gPiAtLS0gYS91
dGlsL2N1dGlscy5jDQo+ID4gKysrIGIvdXRpbC9jdXRpbHMuYw0KPiA+IEBAIC0xMDU1LDUgKzEw
NTUsNSBAQCBjaGFyICpnZXRfcmVsb2NhdGVkX3BhdGgoY29uc3QgY2hhciAqZGlyKQ0KPiA+ICAg
ICAgICAgIGFzc2VydChHX0lTX0RJUl9TRVBBUkFUT1IoZGlyWy0xXSkpOw0KPiA+ICAgICAgICAg
IGdfc3RyaW5nX2FwcGVuZChyZXN1bHQsIGRpciAtIDEpOw0KPiA+ICAgICAgfQ0KPiA+IC0gICAg
cmV0dXJuIHJlc3VsdC0+c3RyOw0KPiA+ICsgICAgcmV0dXJuIGdfc3RyaW5nX2ZyZWUocmVzdWx0
LCBGQUxTRSk7DQo+ID4gIH0NCj4gPg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoLCBidXQg
U3RlZmFubyBzZW50IHRoZSBzYW1lIGZpeCAyIHdlZWtzIGFnbzoNCj4gaHR0cHM6Ly93d3cubWFp
bC1hcmNoaXZlLmNvbS9xZW11LWRldmVsQG5vbmdudS5vcmcvbXNnNzk4Mjc5Lmh0bWwNCj4gDQo+
IEl0IHNob3VsZCBiZSBtZXJnZWQgb25jZSB0aGUgZGV2ZWxvcG1lbnQgdHJlZSBvcGVucyBhZ2Fp
biAod2UgYXJlIG5vdw0KPiAnZnJlZXplZCcgYmVmb3JlIHRoZSB2Ni4wLjAgcmVsZWFzZSkuDQoN
Ckkgc2VlLCB0aGFua3MgZm9yIHlvdXIgcXVpY2sgcmVzcG9uc2UuDQoNClpoZW56aG9uZw0K

