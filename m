Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F02F833E676
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 02:52:40 +0100 (CET)
Received: from localhost ([::1]:34848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMLMW-0004xt-1c
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 21:52:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1lMLLd-0004Yq-7G
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 21:51:45 -0400
Received: from mga07.intel.com ([134.134.136.100]:42509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.tian@intel.com>)
 id 1lMLLb-0002x5-0B
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 21:51:44 -0400
IronPort-SDR: JKLk+9hwmkDO4FtXh4MGvMI0rbgcBouJWFnq2gG1qYKxFRNrYcvZyHG3UA6JDrX7zJH5TZLkIQ
 6ifjfdmxB3Ig==
X-IronPort-AV: E=McAfee;i="6000,8403,9925"; a="253381819"
X-IronPort-AV: E=Sophos;i="5.81,254,1610438400"; d="scan'208";a="253381819"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2021 18:51:39 -0700
IronPort-SDR: /ZBw+MwBMfnyb1LGzTI7YlFG86BjO0Goav9e4s/1hMEGS9JxeDvKqzllLu5GnAQDpaQPpRSa29
 m8k1at8p65rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,254,1610438400"; d="scan'208";a="605499309"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga005.fm.intel.com with ESMTP; 16 Mar 2021 18:51:39 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 16 Mar 2021 18:51:39 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Tue, 16 Mar 2021 18:51:39 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Tue, 16 Mar 2021 18:51:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N5pg3ao2N8YACkjcm6YUQK0UEvTxfUytGxhWL+eFZpaT7fVMFPN8EZvOBKxqGZI+k7/1MTt2CTPOlFyQjCrlquDYx1nZ83GbxByU1k3alfiqvX2RYsIWbNogAlFD+tOK2hYW6ZTqJaONnvE44hj1kTvaLZd11wKdF2mnj97vYUxd07OgzfhQ1yr+Gfb8Skl+q/4nf+G+urFunDOJBjtnwx9j0EJRbYTTaatvYXvQt2qS+RCYM3hbRoVN2KSOWnWkGXfK33gyPRbf56KBMWQqhdfC65Xd7jVGNsNkEfAvl6UThfbD6UPervNRGkXvPCn8NHWQMQQzUVMMHZ6xmp5eLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jWFs/h9c5Exukq60NyDibmUvroMJYhjYvi2qHlOrQDw=;
 b=RT1gWI0IcQPS9MkVH4OR7vRbBCGjKnGpnZ3pHX8X3MFEeNtCTXnMjIGwAA/1tnbjwEfsOBbqjCxsvDt44GBzF8faIWxLHXNFHY6cvBL38O2YIhkTnaagP7YWsH1dENVlcgzCq1c85coJeVtBFilVM2CfbKDAz2+VpQgJK+5IxCV9yDGwgM/aHlVQKsn/g9AP/cfGP6coFYmut0AnRP6UvNaO/1ovH2OgLXe2Dg1xfjkxXia0ogIMBmKMOFWWP7NjugWazxsNlmMTY5xktnNngqv6JCM/fc3oehQMlS3/NBkWUBczs5tnn4nRO82D7Bu5DCYW0raCLhIM+JdpJCTeVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jWFs/h9c5Exukq60NyDibmUvroMJYhjYvi2qHlOrQDw=;
 b=M3oo6aLZS51zfw0BP7ZqRbr3BAnEKvXPsQAvVz+r10aAfiLXN87KviEnH38BgA55BpdDG/OMppjkpgkA+l+pWrcYfxopwtlYy0AFITXhTJ5byYo5dSjM+1w/XEZQOXDCrfiEgR5ZhjurYPfxNjhBp2C0IQeTKI9S5U3/TYYdNYo=
Received: from MWHPR11MB1886.namprd11.prod.outlook.com (2603:10b6:300:110::9)
 by MWHPR11MB1407.namprd11.prod.outlook.com (2603:10b6:300:26::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 01:51:34 +0000
Received: from MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::75b0:a8e9:60cb:7a29]) by MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::75b0:a8e9:60cb:7a29%9]) with mapi id 15.20.3933.033; Wed, 17 Mar 2021
 01:51:34 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Tarun Gupta (SW-GPU)" <targupta@nvidia.com>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "cohuck@redhat.com" <cohuck@redhat.com>
Subject: RE: [PATCH v2 1/1] docs/devel: Add VFIO device migration documentation
Thread-Topic: [PATCH v2 1/1] docs/devel: Add VFIO device migration
 documentation
Thread-Index: AQHXFeKChCZAPNERSkWYs2XEwwoMcKp/qFIQgAb+MgCAAMvI4A==
Date: Wed, 17 Mar 2021 01:51:34 +0000
Message-ID: <MWHPR11MB188632EFE1DD1CE9FF81BB438C6A9@MWHPR11MB1886.namprd11.prod.outlook.com>
References: <20210310192009.53848-1-targupta@nvidia.com>
 <BN6PR11MB1875F23CA1AE08034F96DC898C6F9@BN6PR11MB1875.namprd11.prod.outlook.com>
 <9f16901d-30e8-3e65-cca2-c0f1becc562f@nvidia.com>
In-Reply-To: <9f16901d-30e8-3e65-cca2-c0f1becc562f@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [101.88.226.48]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 71aea30e-8c8c-473b-e8ac-08d8e8e731fa
x-ms-traffictypediagnostic: MWHPR11MB1407:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB14072632248E39207DBE9DD28C6A9@MWHPR11MB1407.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vWLEWMeO3dsozim8koebwP0onebpArpHoGPbjdrYyLNinjBb9MLoFltVC9EWIsYKLNgqA8i0bZQHrS27UORQtrxaki02a/A1Wl76wSCbVqjF+HCtLQVhUSMeQpvmld22AFdriZ8uEjqzk83QoFmT6M9gI2n0GIGL8dIcigAcVFYvRFkEUZp4otYHv1p2SGunbbIA4VYc/NNFqtk+kIG72sdVa4dTL/4ZzLptZ5XKO+uZgjKCpcHzrfPKjcqXxLZ9nAalN4dgP1Y50RcnhFc0kqMZEfTfS1UYZh8/ZTpFAHkHeI9Gh1/ku10Ij+6CfHot4SDPELEFpOKlWIPkrvFBLDeKTBfIOZx2eyIVAR7+L/nIbaCFR7pGeY8lLz/kWExao08AMXooQTB+tbmOEuZMqZD+3oMgshtgl5zejEdj+InFiBaN7G1znRzG3cNm//8yA/NdQRKdtDKLTU8e+kOd0CJsUU5PyFgQz1SJUDSpiTNNt+VeybL0Y48iQRHcb9s1aK4RU8dY3vXdu9Yx/zAeoSo08ZnTuEokhdsa6/pg0poN7nQ9pdGZYmabpJiNC/6M
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1886.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(136003)(396003)(346002)(39860400002)(366004)(54906003)(110136005)(316002)(478600001)(186003)(52536014)(6506007)(76116006)(86362001)(66446008)(55016002)(66946007)(33656002)(9686003)(4326008)(26005)(7416002)(64756008)(5660300002)(7696005)(2906002)(83380400001)(8676002)(66476007)(71200400001)(66556008)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?RnNxcUZpb0pBUkhSVVZ6Rmdud3dEYkNZZldDdEc5RVFaaVFDZTVvalRxZ3JD?=
 =?utf-8?B?UGdxNzNQVXBRSDBKRTY1TjJ4ZmpSckFoQ2NnTjZKNksxZE8yUjZ6NGFNSDdy?=
 =?utf-8?B?cDJyNUJnSGp5OEZubDNGZWNmaWJpeEJiSkFDc1l3L21YRVAzTjZVWEs3bENz?=
 =?utf-8?B?Vnh0OW5HZm1JYUFwbXZTM0loWGNMRlFXMzlIS1JzOHpFeG11SnVFcGtDbE4z?=
 =?utf-8?B?SnZBNkpCOTY4eTAvWlNXZDI1WGVkcGcrMFBZTXlzRXAvaEVMOVk5aE5WNmlW?=
 =?utf-8?B?ZkFDYkdGLy90UHRibnVleVZSNzNLcEhqeURUak9vSFV4UXBwSFl1bnc2YW53?=
 =?utf-8?B?NGxhaUk3bUJnUjJaTUMwWkNzN3ExK2tHNG4ybUNjU0tmcU11OEpTMEltWW1T?=
 =?utf-8?B?b3JxdzFhWHJaYUtkbVJQdFFMNG16WTJoQ2pqQ2xMVkxJdkpTaW5hd3JxU1JK?=
 =?utf-8?B?dDQzTmVkTXMwc0tMRmtLREdOZjJZVTg4ckY5ZUFtRndBc1V2ZC9aaUtLVDZo?=
 =?utf-8?B?MGdXQVNyam1ET0loTkk1OHNzcHRBRVpBUUlYdWdRZ2dZa2RsMXYxc2JiME1T?=
 =?utf-8?B?UUlJYUZMN2Vna3c0NkxWN1VHN0NQWlRWYzNOb1JUc3psckhORTVWQjlOZzBm?=
 =?utf-8?B?SzBYNzB1eFc2WVNXMHJMV25wWS9qc3psck50bmlSVC9iSCsxQkVXU1pFS2cz?=
 =?utf-8?B?NVBHZVl6QUUrWUNSMGZ2alkvemZjVHh4ZDFFeHg0VytPQnhYNWhIQm1kTWgy?=
 =?utf-8?B?ZGY4cldKYWx5ZlBqYlNzQ1VuRlVkclBhb2VFSzFmK2gra0EveS8zYlNvaS9y?=
 =?utf-8?B?eEIwZm95b0UweHZTQmJNYVdkZzd0ZWJ2MGxYaW9veE56RVMxbk42aDFKajZz?=
 =?utf-8?B?YzlDaFByN0dqYkRsN1B3VUd2ZFJNMEUvR1lycHpqaURvM0k5ZDdxb3dCYWxq?=
 =?utf-8?B?N0dwVm9EWmxWaDlrTVlKU0lpZE43RC95ZzBlNDUvTDZ6RXFIQXBVWE5nRTRr?=
 =?utf-8?B?MDVKNm5FRDYxaTZuRkRaMzh1UEZHVllmZDc0RjhHVGdxTm92dEd1QlJmVUJi?=
 =?utf-8?B?R2RnbFdpVGVmRndMT1NtbmdmZ1hQQ0hJN2JkVWRoSWRJcXVPOXYrRW9vTUxu?=
 =?utf-8?B?Rm92aWVzM2lQeHg1ZERZTGhadis4eVNpNE1OcVVDWUlVaE5UUEtTTUgwM2pK?=
 =?utf-8?B?NXd1RWtFcUIrL0dYeVJ6WTBIYkxZYkhGeERVYWN3UWpENHRkckREZk9jWWI5?=
 =?utf-8?B?bDVtbGFWRlVKWGxDY08yVy8zSFJBUHFPZVc0YURXS1c5cWlyUllyeHM4TXZq?=
 =?utf-8?B?Q0VLN1pVVkNsUWJEaDNUbzhrMS9OZWUzS0JYVTBRWXB4ZXNqTHI0cWlmc1h5?=
 =?utf-8?B?K0NSWTBzbzlXdEwvcUl5NmNYT1lxYlBRdU9UYW1XSHdaWXhNelVXamJuYkl2?=
 =?utf-8?B?VHd2RDl3ZkNBTHhQbm1HLzl3V1VIOG1IeG9ubktpTnZQaVc3VUZRdy9OaVUx?=
 =?utf-8?B?QVNTejZMZGZZQ1ZhT0VHMWVZamwyWXljS2dhWGxzZXc3VGtPcTZJbi91eVdk?=
 =?utf-8?B?QnZPNmp1cWRWQkN3V3JwczVRWFlwY0tPQkVzNmE0djZBOThEWVVDcXBOZkpN?=
 =?utf-8?B?eGtKcXYvblpTc1ZjRnV3cFpZek1ndUdsNkh3MnFObDVKU1N1VG1COGZMZWYx?=
 =?utf-8?B?L3VEZkdIRy83bWRKQUFwZnVjUENXTHpSVE1xK1V5RUloV0twcWdsYlRiNGFZ?=
 =?utf-8?Q?PXVez/GwPfCu0JGOM3uqDFZ0QukdmAoY3YuN4ST?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1886.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71aea30e-8c8c-473b-e8ac-08d8e8e731fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2021 01:51:34.5722 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8IDYw1Mjbp+8ceC+yZQQ+Zl1uVR9SIoePqr6xvD1GiBSeMswI+L9EkK8FUMlBPH1yL+tY1QHudvqr8cGYuNL2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1407
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=kevin.tian@intel.com; helo=mga07.intel.com
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
Cc: "berrange@redhat.com" <berrange@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>, "Zhao,
 Yan Y" <yan.y.zhao@intel.com>, "lushenming@huawei.com" <lushenming@huawei.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, "dnigam@nvidia.com" <dnigam@nvidia.com>,
 "cjia@nvidia.com" <cjia@nvidia.com>, "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiBGcm9tOiBUYXJ1biBHdXB0YSAoU1ctR1BVKSA8dGFyZ3VwdGFAbnZpZGlhLmNvbT4NCj4gU2Vu
dDogVHVlc2RheSwgTWFyY2ggMTYsIDIwMjEgOTozNSBQTQ0KPiANCj4gDQo+ID4+ICsNCj4gPj4g
KyogQSBgYHNhdmVfbGl2ZV9pdGVyYXRlYGAgZnVuY3Rpb24gdGhhdCByZWFkcyB0aGUgVkZJTyBk
ZXZpY2UncyBkYXRhIGZyb20NCj4gdGhlDQo+ID4+ICsgIHZlbmRvciBkcml2ZXIgdGhyb3VnaCB0
aGUgbWlncmF0aW9uIHJlZ2lvbiBkdXJpbmcgaXRlcmF0aXZlIHBoYXNlLg0KPiA+PiArDQo+ID4+
ICsqIEEgYGBzYXZlX2xpdmVfY29tcGxldGVfcHJlY29weWBgIGZ1bmN0aW9uIHRoYXQgcmVzZXRz
IF9SVU5OSU5HIGZsYWcNCj4gPj4gZnJvbSB0aGUNCj4gPj4gKyAgVkZJTyBkZXZpY2Ugc3RhdGUs
IHNhdmVzIHRoZSBkZXZpY2UgY29uZmlnIHNwYWNlLCBpZiBhbnksIGFuZCBpdGVyYXRpdmVseQ0K
PiA+DQo+ID4gYW5kIGlmIGFueSwNCj4gDQo+IEkgZGlkbid0IGdldCB0aGlzLiBJIGludGVuZGVk
IHRvIHNheSB0aGF0IGl0IHdpbGwgc2F2ZSB0aGUgZGV2aWNlIGNvbmZpZw0KPiBzcGFjZSBvbmx5
IGlmIGl0IGlzIHByZXNlbnQuDQo+IFNvLCB1c2VkICJzYXZlcyBkZXZpY2UgY29uZmlnIHNwYWNl
LCBpZiBhbnkiLg0KDQpJIG1pc3JlYWQgaXQsIHdpdGggdGhlIGltcHJlc3Npb24gdGhhdCAnaWYg
YW55JyBpcyBmb3IgJ2l0ZXJhdGl2ZWx5IGNvcHknLg0KDQo+ID4+ICsNCj4gPj4gK1N5c3RlbSBt
ZW1vcnkgZGlydHkgcGFnZXMgdHJhY2tpbmcNCj4gPj4gKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0NCj4gPj4gKw0KPiA+PiArQSBgYGxvZ19zeW5jYGAgbWVtb3J5IGxpc3RlbmVy
IGNhbGxiYWNrIG1hcmtzIHRob3NlIHN5c3RlbSBtZW1vcnkNCj4gcGFnZXMNCj4gPj4gK2FzIGRp
cnR5IHdoaWNoIGFyZSB1c2VkIGZvciBETUEgYnkgdGhlIFZGSU8gZGV2aWNlLiBUaGUgZGlydHkg
cGFnZXMNCj4gYml0bWFwDQo+ID4+IGlzDQo+ID4+ICtxdWVyaWVkIHBlciBjb250YWluZXIuIEFs
bCBwYWdlcyBwaW5uZWQgYnkgdGhlIHZlbmRvciBkcml2ZXIgdGhyb3VnaA0KPiA+PiArdmZpb19w
aW5fcGFnZXMoKSBleHRlcm5hbCBBUEkgaGF2ZSB0byBiZSBtYXJrZWQgYXMgZGlydHkgZHVyaW5n
DQo+IG1pZ3JhdGlvbi4NCj4gPg0KPiA+IHdoeSBtZW50aW9uIGtlcm5lbCBpbnRlcm5hbCBmdW5j
dGlvbnMgaW4gYW4gdXNlcnNwYWNlIGRvYz8NCj4gDQo+IEknbGwgcmVtb3ZlIHRoZSBtZW50aW9u
IG9mIHZmaW9fcGluX3BhZ2VzKCkgYW5kIGp1c3QgbWVudGlvbiAiZXh0ZXJuYWwgQVBJIi4NCj4g
DQo+ID4NCj4gPj4gK1doZW4gdGhlcmUgYXJlIENQVSB3cml0ZXMsIENQVSBkaXJ0eSBwYWdlIHRy
YWNraW5nIGNhbiBpZGVudGlmeSBkaXJ0aWVkDQo+ID4+IHBhZ2VzLA0KPiA+PiArYnV0IGFueSBw
YWdlIHBpbm5lZCBieSB0aGUgdmVuZG9yIGRyaXZlciBjYW4gYWxzbyBiZSB3cml0dGVuIGJ5IGRl
dmljZS4NCj4gPj4gVGhlcmUNCj4gPj4gK2lzIGN1cnJlbnRseSBubyBkZXZpY2Ugd2hpY2ggaGFz
IGhhcmR3YXJlIHN1cHBvcnQgZm9yIGRpcnR5IHBhZ2UgdHJhY2tpbmcuDQo+ID4NCj4gPiBubyBk
ZXZpY2Ugb3IgSU9NTVUgc3VwcG9ydA0KPiANCj4gUmlnaHQsIHdpbGwgdXBkYXRlIGl0Lg0KPiAN
Cj4gPg0KPiA+PiBTbw0KPiA+PiArYWxsIHBhZ2VzIHdoaWNoIGFyZSBwaW5uZWQgYnkgdmVuZG9y
IGRyaXZlciBhcmUgY29uc2lkZXJlZCBhcyBkaXJ0eS4NCj4gPg0KPiA+IFNpbWlsYXJseSwgd2h5
IGRvIHdlIGNhcmUgYWJvdXQgaG93IHRoZSBrZXJuZWwgaWRlbnRpZmllcyB3aGV0aGVyIGEgcGFn
ZSBpcw0KPiA+IGRpcnR5LiBJdCBjb3VsZCBiZSBkaXJ0aWVkIGR1ZSB0byBwaW5uaW5nLCBvciBk
dWUgdG8gSU9NTVUgZGlydHkgYml0LCBvciBkdWUNCj4gPiB0byBJT01NVSBwYWdlIGZhdWx0LiBI
ZXJlIHdlJ2QgYmV0dGVyIGp1c3QgZm9jdXMgb24gdXNlci10YW5naWJsZSBlZmZlY3QsDQo+ID4g
ZS5nLiBhIGxhcmdlL25vbi1jb252ZXJnaW5nIGRpcnR5IG1hcCBtaWdodCBiZSByZXR1cm5lZCB0
aGVuIGhvdyB0bw0KPiBoYW5kbGUNCj4gPiBzdWNoIHNpdHVhdGlvbi4uLg0KPiANCj4gU2luY2Ug
VkZJTyBtaWdyYXRpb24gZmVhdHVyZSBpcyBub3QganVzdCBpbXBsZW1lbnRlZCBpbiB1c2Vyc3Bh
Y2UgYnV0DQo+IGFsc28gaW52b2x2ZXMgaW1wbGVtZW50YXRpb24gaW4ga2VybmVsIHNwYWNlIGFz
IHdlbGwsIGhhdmUgZG9jdW1lbnRlZA0KPiBoZXJlIHdoYXQgaXMgaW1wbGVtZW50ZWQgYXMgb2Yg
bm93Lg0KDQpidXQgdXNlcnBhY2Ugb25seSBuZWVkcyB0byBjYXJlIGFib3V0IHRoZSBpbXBsaWNh
dGlvbnMgb2YgdGhlIHVBUEksIGluc3RlYWQNCm9mIHRoZSBpbnRlcm5hbCBkZXRhaWwgaW4gdGhl
IGtlcm5lbC4gWW91IG1pZ2h0IHRha2UgYWJvdmUgcGlubmluZyBkZXRhaWwgYXMNCm9uZSBleGFt
cGxlIHRvIGV4cGxhaW4gdGhhdCB0aGUgc2l6ZSBvZiB0aGUgZGlydHkgcGFnZSBzZXQgbWlnaHQg
YmUgYmlnIGFuZA0Kc3RhdGljLCBhbmQgdGhlbiBleHBsYWluIGhvdyB1c2Vyc3BhY2Ugc2hvdWxk
IGNvcGUgd2l0aCB0aGlzIHNpdHVhdGlvbi4gYnV0IA0KZG9uJ3QgZGVzY3JpYmUgaXQgYXMgdGhl
IGFzc3VtZWQgZmFjdC4NCg0KVGhhbmtzDQpLZXZpbg0K

