Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7022C2BC5
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 16:50:20 +0100 (CET)
Received: from localhost ([::1]:59752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khaaB-0004eb-4D
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 10:50:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cristian.ancuta@intel.com>)
 id 1khaY1-0003m9-Dt
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 10:48:05 -0500
Received: from mga02.intel.com ([134.134.136.20]:47203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cristian.ancuta@intel.com>)
 id 1khaXp-0004Yu-8R
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 10:47:59 -0500
IronPort-SDR: F85QeIIqFA/+AI6xSBgtM1TbeLe5YhnrW52D/fwgobPUTB7acKq+vqAy3Mt5zO708s6eWAPHwj
 ruLnfqjc9ezQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9815"; a="159008518"
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; d="scan'208";a="159008518"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 07:47:47 -0800
IronPort-SDR: kqf6uAK52NqKu1gJJWgNOc/+t7q1DoQBSkn7BRw7BVNsf2nOBXzmnOe3XuzDyiVSltqTeK/gNN
 Oa0yWSAgksgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; d="scan'208";a="312612882"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 24 Nov 2020 07:47:47 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 24 Nov 2020 07:47:46 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 24 Nov 2020 07:47:46 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 24 Nov 2020 07:47:46 -0800
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (104.47.45.59) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 24 Nov 2020 07:47:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RcdSwJclSwld94mrzF5PA50AL1rAcco7lmixaqb13ZINalr2bejeV4fueJdbgtwdXXK1L9aBcGEYHCL43otgJK9EtdEMsmoWjFNemNhvO8EUSjRg7iaJXIcqhIseoUgeuBObAXvUKlV/SFgbBJz7GdAQY9yzs3Jbj8o6pwM4qJD4wnhVh+keoe1Ns4A88Bk37NQBUUTjYoyjqrcl4ZNx3433RNvP94+s8vWrC5jGfU+98x4A97jMDTM3Xixbbj11Es501ECn+WdIyw5MBpQrlLHVwmGbQuRKYeLmN2U3xrD1EtcV4XWex1OcmVyOtZZa9+Wc58pmC6eWAJm6D5KpDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g7PQAPDt70t8bM6YFh83mEBk4iRpu0J3e1RN9FYOQo0=;
 b=mRnktaU3tvJvMVIStqfziTmzpQG/rM8uow6YlnOk45ZB+vWOxO6GU2otqU3eWknwV/+sbuqv/CDMitFp7hxk/2I7vVZi/XYtu4pyabWcwVPGFhU0VJNioEfwf40B0SLkhtxrjH/x91dNx2eL5U1X6e9I0KHNisuiWtm/H+uLGLrMe3cF5r84D6/XGyUOZaygIRk5Tat3SGXDVTGxPVWqyZwRYEg7eNxQvV3oZwzIhu8vks026FBS8KucFLXAzxQ7HTsELXGijWgXO1HOyx8KI5RHt2Evi00G8yI+z/5CJQXB4zMf1P9GKq3Gol/xdjShz+Z6TT5Z/QE6DK/BGIq/UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g7PQAPDt70t8bM6YFh83mEBk4iRpu0J3e1RN9FYOQo0=;
 b=f+buKapkVkPWipPlzjySAVQk/VI0ESakja/Zk9PfnhsLsQzaOzj3yeIBDY7VeVcd43TJg9gp6h7/83W2Wuq0Qyr0+21KMJnsAs6227wiUdiDcoqeyZS25upVfMpuu1K+lwDznNrfKS/6GqPVytam94K15xDDYgqoSeW2DC8ZH5A=
Received: from DM6PR11MB3963.namprd11.prod.outlook.com (2603:10b6:5:19b::16)
 by DM6PR11MB2619.namprd11.prod.outlook.com (2603:10b6:5:c6::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Tue, 24 Nov
 2020 15:47:44 +0000
Received: from DM6PR11MB3963.namprd11.prod.outlook.com
 ([fe80::7561:baba:68f0:74fe]) by DM6PR11MB3963.namprd11.prod.outlook.com
 ([fe80::7561:baba:68f0:74fe%7]) with mapi id 15.20.3589.025; Tue, 24 Nov 2020
 15:47:44 +0000
From: "Ancuta, Cristian" <cristian.ancuta@intel.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: RE: QEMU build dependencies for new board
Thread-Topic: QEMU build dependencies for new board
Thread-Index: AdbBtL1I0SVUWHapTDmy3nFFMPEtqwAFKekAACvEi4A=
Date: Tue, 24 Nov 2020 15:47:44 +0000
Message-ID: <DM6PR11MB396369EA01CEFEDF6801AA28F4FB0@DM6PR11MB3963.namprd11.prod.outlook.com>
References: <DM6PR11MB3963BA87438B343A71230675F4FC0@DM6PR11MB3963.namprd11.prod.outlook.com>
 <CAFEAcA-_ZM7DKk0a0Lkp1boZwUHi-OxD62w1-=NqnYzGKJc9ZA@mail.gmail.com>
In-Reply-To: <CAFEAcA-_ZM7DKk0a0Lkp1boZwUHi-OxD62w1-=NqnYzGKJc9ZA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [94.52.169.46]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e5ccc775-0c92-4f90-0b35-08d890904912
x-ms-traffictypediagnostic: DM6PR11MB2619:
x-microsoft-antispam-prvs: <DM6PR11MB261990CC3E7C487FC0C2697EF4FB0@DM6PR11MB2619.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DsPQq2KckE9gWOkMhjPDRtGK/OIceu/go2omuX0RKekf51UfXyL60zbTaksbc71K42M3JjT84mx+3YEdRMaOPOIzo6NhBgwPa4zHWvAN2eFDe7P+VA2HGTbvO4sdaIKF4o9lfSEetw3zQR6bkJs2kI+qgbl7Sannt/n+teG3hIpRC/XAxjCwfFxfFUr2uOoimZXzmbDeykbR+i6ajhc1e5ta0pVNbZEjJ48tQZKn66U1TGJR50j7cE9eL9TKh+trxrodkaC0be2iKMYClqIX+0svJg1RFXcYOX7fjF9BjNs29xRFj66S7oGFbLVo9UVe
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3963.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(39860400002)(366004)(136003)(346002)(33656002)(26005)(76116006)(66946007)(66476007)(66556008)(66446008)(64756008)(6506007)(8936002)(2906002)(53546011)(52536014)(86362001)(6916009)(478600001)(186003)(71200400001)(316002)(5660300002)(7696005)(4326008)(9686003)(83380400001)(55016002)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: faPSFFrNoG+BTc79d/D+BjJo/fj9H+AW+59ST+6cAGU3aBuW7NMxVv/QV9dAvdOphg0vSquqbbOD3zBdsi5zafmmJOioydbwBZNMScDVABvTn5gzaXxD3L2uSzmi8tHDkwlNxTSkawu6nzrmh1qCavcu8PJAqcqcdJtmCwlybZbGrkiQ/u/eaEjWSR/VaqbpesAkjnAJjoUbsz1uvwKttflvShhOEDwqf8AVnen2ObITvViXkT3lxGyxsed0xwIPGWgdVCA20LJ7U9UAijXJsSXGbnjV5CWKIY4eQ0K3MorQN0WBFXktSaPYIwPF2ePE8OzEH39UVFz2LAOmzYWndOEpkFWnTyU3C5VyZOeLT3dkTl5LGtNlsx1wiwqTiHnknQQZ/fCV4+93OQm7L4el5fID6DzYYnsN8ueYD9SGrblEfDoDptUeP9khM8fWvDCAf9/I9U2V/+hbK5l/MpdIQoViIGskI8Iut5/NEHtTwMLTtJDybtTk081DVYn+AAE+z1R2yLR0nBbrycq7sgbJKBp8kxBnxoUL88WWkQMuxtiyY7AieUJzcdGS83PpcaRlKROW1upE7k2Ru+kd9SDMqpRT5kQmbtQhwv662YofIcXraXbvendujxMTljdWDiwItjnC94vXmISjhod8FfzEvLbgQ8H8rCxbTa8uB0FcgQ4EvncZ5DVq1adfHleH0q2BtP91kzQ9MLpMJzQiRIsumfTGXJYGiJVLGXniDmvtzogvvEnmoF7augjkZDw6w8PdQSjbSzLcg1fH27aP1lyzL+AG1XMRRiYkrDaLD3CK3cWbuaQgSFp574fmxWuathxPmFL6erKe3Hoo7bihqq3TSveQDwjtrQq9oDDQ0S5t74/AFPG1ZgmEvznelKAJ1KAefEawLiD8UnwereYLzWt3nQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5ccc775-0c92-4f90-0b35-08d890904912
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2020 15:47:44.7435 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2QHUo6XgqW/siiPz/BTkjI+e5j/2F/lu+GgE7DBCehCCY8xPTAaYknJrQjyqr6busAnJf8b9OWi+tzFSFstXvwDn5bkRKp5CoZp77+LGwJc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2619
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.20;
 envelope-from=cristian.ancuta@intel.com; helo=mga02.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

SGkgUGV0ZXIsDQoNClRoYW5rcyBmb3IgeW91ciBpbnB1dC4gDQoNCkkgd2FzIGluZGVlZCBxdWl0
ZSBhIGZldyBjb21taXRzIGJlaGluZCBtYXN0ZXIsIEknbGwgZ2l2ZSBpdCBhIHRyeSBub3cgd2l0
aCB0aGUgbGF0ZXN0Lg0KDQpTaW5jZSBJIHNlZSB0aGUgUklTQ1Ygc3R1ZmYgaXMgcXVpdGUgbmV3
LCB3b3VsZCB0aGUgYXNzb2NpYXRlZCAgYm9hcmRzIGJlIGEgZ29vZCBzdGFydGluZyBwb2ludD8N
Cg0KQmVzdCByZWdhcmRzLA0KQ3Jpc3RpYW4NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
CkZyb206IFBldGVyIE1heWRlbGwgPHBldGVyLm1heWRlbGxAbGluYXJvLm9yZz4gDQpTZW50OiBN
b25kYXksIE5vdmVtYmVyIDIzLCAyMDIwIDg6NTAgUE0NClRvOiBBbmN1dGEsIENyaXN0aWFuIDxj
cmlzdGlhbi5hbmN1dGFAaW50ZWwuY29tPg0KQ2M6IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KU3Vi
amVjdDogUmU6IFFFTVUgYnVpbGQgZGVwZW5kZW5jaWVzIGZvciBuZXcgYm9hcmQNCg0KT24gTW9u
LCAyMyBOb3YgMjAyMCBhdCAxNzozMSwgQW5jdXRhLCBDcmlzdGlhbiA8Y3Jpc3RpYW4uYW5jdXRh
QGludGVsLmNvbT4gd3JvdGU6DQo+IEnigJl2ZSBpbXBsZW1lbnRlZCBhIG5ldyBDUFUgdGFyZ2V0
IGluIC4vdGFyZ2V0L2FyY2hfbmFtZSBhbmQgSeKAmW0gYWxzbyB0cnlpbmcgdG8gYWRkIGEgbmV3
IGJvYXJkIHRvIGVtdWxhdGUgdGhhdCB0YXJnZXQgb24gaW4gc3lzdGVtIG1vZGUgaW4gLi9ody9h
cmNoX25hbWUuIFRoZSBib2FyZCBpcyBiYXNlZCBvbiB0aGUgdmVyc2F0aWxlcGIsIGJ1dCBJ4oCZ
bGwgZ3JhZHVhbGx5IGJlIHJlbW92aW5nIGFsbCB0aGUgYXJtIGltcGxlbWVudGF0aW9uIGZyb20g
aXQsIGFpbWluZyBmb3IgYSBtaW5pbWFsIGltcGxlbWVudGF0aW9uIHdpdGgganVzdCBteSBjdXN0
b20gY3B1IGFyY2hpdGVjdHVyZSwgc3lzdGVtIGJ1cywgbWFpbiBtZW1vcnkgYW5kIGFuIFVBUlQu
DQoNCkluY2lkZW50YWxseSwgdmVyc2F0aWxlcGIgaXMgYSByZWFsbHkgYmFkIGJvYXJkIHRvIHN0
YXJ0IHdpdGggYXMgYSB0ZW1wbGF0ZSwgYmVjYXVzZSBpdCdzIG9uZSBvZiB0aGUgb2xkZXN0IHdl
IGhhdmUsIGFuZCBpdCBkb2VzIGEgbG90IG9mIHRoaW5ncyBpbiB3YXlzIHRoYXQgd29yayBidXQg
d2hpY2ggYXJlbid0IGhvdyB3ZSdkIHJlY29tbWVuZCB3cml0aW5nIGEgbmV3IGJvYXJkIG1vZGVs
IHRvZGF5LiBZb3UgbWlnaHQgYmUgYmV0dGVyIG9mZiBsb29raW5nIGF0IHNvbWV0aGluZyBhZGRl
ZCBtb3JlIHJlY2VudGx5Lg0KDQo+IEnigJl2ZSBhbHNvIGFkZGVkIGFsbCB0aGUgbmVjZXNzYXJ5
IHN0dWZmIHJlcXVpcmVkIGJ5IG1pbmlrY29uZi5weSBpbiANCj4gLi9kZWZhdWx0LWNvbmZpZ3Mv
PHRhcmdldD4tc29mdG1tdS5tYWssDQoNClRoaXMgc3VnZ2VzdHMgeW91J3JlIG5vdCBiYXNpbmcg
dGhpcyBvbiBjdXJyZW50IGhlYWQtb2YtZ2l0LCBiZWNhdXNlIHRoaXMgaXMgZGVmYXVsdC1jb25m
aWdzL3RhcmdldHMvPHRhcmdldD4tc29mdG1tdS5tYWsNCmFuZCBkZWZhdWx0LWNvbmZpZ3MvZGV2
aWNlcy88dGFyZ2V0Pi1zb2Z0bW11Lm1hayBub3cuDQoNCj4gLi9ody88YXJjaD4vS2NvbmZpZyBh
bmQgYSBzb3VyY2UgZW50cnkgaW4gLi9ody9LY29uZmlnLg0KDQo+IFRoZSBwcm9ibGVtIGlzIHRo
YXQgdGhlIGJ1aWxkIHN5c3RlbSBpcyBicmluZ2luZyBpbiBvdGhlciBmaWxlcyB0aGF0IEkgDQo+
IGRpZG7igJl0IHNwZWNpZnkgKENPTkZJR19BMTVNUENPUkUsIENPTkZJR19BMTVNUENPUkUsIENP
TkZJR185TVBDT1JFLCANCj4gZXRjLiApLCBhbmQgSeKAmW0gbm90IHN1cmUgaG93IHRoZXnigJly
ZSBlbmRpbmcgdXAgaW4gDQo+IC4vYnVpbGQvPHRhcmdldD4tc29mdG1tdS9jb25maWdfZGV2aWNl
Lm1hazoNCg0KVGhpcyBzaG91bGRuJ3QgaGFwcGVuLCBidXQgaXQncyBub3QgcmVhbGx5IHBvc3Np
YmxlIHRvIGlkZW50aWZ5IHRoZSBleGFjdCBwcm9ibGVtIHNpbmNlIHlvdSBkb24ndCBwcm92aWRl
IHlvdXIgY29kZS4gSSB3b3VsZCB0cnkgZmlyc3QgZG9pbmcgYSBjb21wbGV0ZSBidWlsZCBmcm9t
IHNjcmF0Y2ggKGllIGRlbGV0ZSB0aGUgYnVpbGQgZGlyZWN0b3J5KSBpbiBjYXNlIHRoZSBwcm9i
bGVtIGlzIHRoYXQgdGhlcmUgYXJlIHN0YWxlIGZpbGVzIGluIHRoZSBidWlsZCB0cmVlIHRoYXQg
YXJlIGdldHRpbmcgcGlja2VkIHVwLg0KT3RoZXJ3aXNlIHJlLWRvdWJsZS1jaGVjayB5b3VyIGRl
ZmF1bHQtY29uZmlnIGZpbGVzIHRvIG1ha2Ugc3VyZSB0aGV5IHJlYWxseSBkb24ndCBoYXZlIGFu
eSBDT05GSUdfd2hhdGV2ZXIgb3IgIlNFTEVDVCB3aGF0ZXZlciINCmluIHRoYXQgdGhleSBzaG91
bGRuJ3QuIChMb29raW5nIGF0IHRoZSBsaXN0IG9mIGRldmljZXMsIGFuIGFjY2lkZW50YWwgInNl
bGVjdCBSRUFMVklFVyIgd291bGQgaGF2ZSB0aGF0IGVmZmVjdC4pDQoNCnRoYW5rcw0KLS0gUE1N
DQo=

