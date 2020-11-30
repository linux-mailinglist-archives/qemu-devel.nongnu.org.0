Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C58B32C7DE9
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 06:44:20 +0100 (CET)
Received: from localhost ([::1]:55620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjbz1-0001g3-TQ
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 00:44:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wentong.wu@intel.com>)
 id 1kjbxv-0000ln-Jh
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 00:43:12 -0500
Received: from mga01.intel.com ([192.55.52.88]:52628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wentong.wu@intel.com>)
 id 1kjbxs-0000u2-Vp
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 00:43:11 -0500
IronPort-SDR: exLPYPus+kyBXzmHqY0d33wzRsGIF0cZLYcwDrXydSUOW1hzBLCeMqn0GRqUzZnyDRq2eR5rjB
 EuqaoxpZ8e5Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9820"; a="190763471"
X-IronPort-AV: E=Sophos;i="5.78,379,1599548400"; d="scan'208";a="190763471"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2020 21:43:07 -0800
IronPort-SDR: 2hv+J56tWs1sgJPCYosG4MwkZJRwrfKCTbjtgOaxy47fV7dwSA3ClyJOLM3dBhcEecQ1rFfo6+
 iaCowrm+9Bjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,379,1599548400"; d="scan'208";a="536870483"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga006.fm.intel.com with ESMTP; 29 Nov 2020 21:43:07 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 29 Nov 2020 21:43:06 -0800
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 29 Nov 2020 21:43:06 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 29 Nov 2020 21:43:06 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Sun, 29 Nov 2020 21:43:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hEHaOvlCcmGvIOHVKoDfLtInyvF2Ho6fZ3CPGF4JybST/7kYe9E77ooF2JGQlwFSoNXY76CXdMPydXs3oiSlENYeDxoxtpeoy406qwlKjUErWddpK54dbrSGjhCiPZVP+2x3bP1zLxZGis52o4VVbvOFJBwPPMZKuAf/7UnnlSsC/oQ4e0lpCZLy4DtNkHRBMIHn+xS9tbk6r7NurbnFGnFsRWheq3dUvh5tX/70b5TTp/jnS/7btK4/i+zpT6IChoVvioyU9mv78YLEqpMdSckUKkFJYlDSEQGQWYzjHook29PkhKosNYrfEpxibk+b96Cay1+8jhW2ZhHzyO7xJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wz0GsuyKWgFvR2T1DyMxmADyc3KNEGzsDxnLAGA3x9A=;
 b=QcFUOnVg2piuwn1f6ttTI5nrWo8NENbBhohBjL1lcMqkGCR1ZmDG1NP3qLJyfuQHTrp9UQfyi+fKbBJJgIZnTxkTXpGPlcA3Wrj6Dqjz+VlLsxq7nxaPnOLj8H6q4JI7w6w4FSQIcNiCwhyfoRMD7pDsESLWndN3jfzygEVEPffcoyAAeVPoG9VM5VGiY7lVjO5+wsya3H2fLf/M93dS0zn7Qk2+sZt9k7kAtbjnVb0DqI/6TEsTOl8pvrAIy4l9NTDx/DWoML2vi7K+yNh6MOcA25Kcp5BWq5L2fnoCJnpqqa5ygoH/p5BwNW25aLn7gp/Q/4P0+5I1KGMFsIpkDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wz0GsuyKWgFvR2T1DyMxmADyc3KNEGzsDxnLAGA3x9A=;
 b=NZhkTJqIJDbM2IGVyF5Opye1dj3HLPIpqzPwvYzyXuk/ulX4FWu0eaDkZBgp5Hzga6CJnuv5VWZ+8WYkq6He2r2Yhier8BfiTqxSsD6ragzevHaemzAjbBbM+QZagyIqxhBfgzLnLDYHBaY+hKPgFyESR1ilz624U+01rWZbw4c=
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by DM5PR11MB2026.namprd11.prod.outlook.com (2603:10b6:3:10::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Mon, 30 Nov
 2020 05:43:00 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::74e4:9b56:e013:149]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::74e4:9b56:e013:149%6]) with mapi id 15.20.3611.023; Mon, 30 Nov 2020
 05:43:00 +0000
From: "Wu, Wentong" <wentong.wu@intel.com>
To: Peter Maydell <peter.maydell@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v2 2/3] target/nios2: Move nios2_check_interrupts() into
 target/nios2
Thread-Topic: [PATCH v2 2/3] target/nios2: Move nios2_check_interrupts() into
 target/nios2
Thread-Index: AQHWxnbD83hvJQYYWEC8huflZVKVyqngKfyA
Date: Mon, 30 Nov 2020 05:43:00 +0000
Message-ID: <DM6PR11MB43167E26A78E5AB04CF507CF8DF50@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <20201129174022.26530-1-peter.maydell@linaro.org>
 <20201129174022.26530-3-peter.maydell@linaro.org>
In-Reply-To: <20201129174022.26530-3-peter.maydell@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.102.204.37]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bd2e005c-8991-40d7-c902-08d894f2cca4
x-ms-traffictypediagnostic: DM5PR11MB2026:
x-microsoft-antispam-prvs: <DM5PR11MB20267C55591A54F48FB151A18DF50@DM5PR11MB2026.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bhwTP6dEpX/acO5cwYoXbu6SlNuip2ARTraa+rsNJ+DkaHFCbpzPLxfqu4gsbIY4JZYm/ntdhipG6CWgoDRucyOihEpb9PsrmInoo8hrwfgQmCQjWPMOc3mRNw2v9uif23PTA0zC2FAXdhhtYKsQo0a9A+SHkKpAs4UQtXRcfYOnIDZp0Gu6d7eScifm8nz2iAU3HnJlb25Y+/+nyxTHRg/R0QlDwGsxYSAciwuftl2nfzoOThnQuUfUFgZLoU55EmS5kEmUxQmS70vOGbDn5Oz7I2YD1OLWZ+X8qNWCZaCk/mygtMoLWdT4m2vnJqu1Sb6AL3MeVJAg0E+hbHPSbw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4316.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39860400002)(396003)(346002)(376002)(8676002)(55016002)(5660300002)(316002)(186003)(9686003)(26005)(4326008)(478600001)(53546011)(6506007)(4744005)(83380400001)(8936002)(71200400001)(64756008)(66446008)(86362001)(66946007)(33656002)(54906003)(7696005)(52536014)(76116006)(66476007)(66556008)(2906002)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?UE9QTDJzdjRueGNCSU9EdU1HMkhwQ283ajFhNVA2RWowNk9QaGpYUUxtQzYr?=
 =?utf-8?B?T0Eyb3pLMExJWmM3c0hhZDh0NGtyeU5Vc3dVT2xxaDZySEhtSFBTWmszNmdX?=
 =?utf-8?B?MmN1Z1lSdllISFFRdlBpMmpsK1JqNXcyRGhXejZmQ2xEcGo1TXprWVNvMk5q?=
 =?utf-8?B?UzJtbUhaRUtLWDlpWUkwdkhaMHg4dFBlSWp6ZktYdld1L1hvcnF4MEIyUUJp?=
 =?utf-8?B?LzhIUHdka3BheEhRbmsxK2VJT09GMDViUUZSNDR2Y1M1NG0rczhyeUE0Qisr?=
 =?utf-8?B?SXQyMWRVZlJvNllQeHk2dEhkNWQ0UTZMOHB1bU1idGpBWW5Idk9SZGJ3ZHhm?=
 =?utf-8?B?eEFYTjArUzlTVVgxdTRvbDVObDRweEMrWEdRS1N6RXBUOWlBdVhlYkN3ckV5?=
 =?utf-8?B?MFFDZ3M3djFCTzgzUmE3SUppQkJiZnB3NXovYXV0eGlMbVdxMVZJYTdKVnlX?=
 =?utf-8?B?Q0svSzNhMXd4alRhUlJta3JCZGtxVXFMUXptWGo3aGFxcDJ4Y0pIdkxYaThT?=
 =?utf-8?B?cVVyQmpVZ1AxcFRYVmZ0d0krMTRsUHpQUUVseDArRSs3a20wV3phOUpBRzZG?=
 =?utf-8?B?WDBMSUEzQzN6ZEMwQlQ4eE5aS2o4ZkVXUEhlVWNtT3ZieGxiV2VGTWFuc3hr?=
 =?utf-8?B?U3d2aHhrcXlKN24rWUhWblVlVnRoZjJtSExNU3p0dG9tQW9YWHpYcGNFMXlM?=
 =?utf-8?B?REROVjl1ei9RTWlFK1ZVSU8yRjFLemdzMjRGbU9iKzdpdkJ5VklSZUZwUFdh?=
 =?utf-8?B?MjZGK2ZWQnQ0YlMxTzNqbnZyTGdlZzlGemVyUlZRZzBPNU83WTU1T3Fwdzlt?=
 =?utf-8?B?a21OSy9yM0hZTTY4aUxnbklJWWlPL2o3eEJQcWRNNElIT2VQZkh1RjZkc0tu?=
 =?utf-8?B?cnF6d2M0dUNxN2QrVTA0eDZYOHkyOGpXREluenZyZ3ZjSUh4aVlxcmQ0UWtF?=
 =?utf-8?B?anlORkt2Snl0OVVhWHUyd2VZYmZvbUd0dzdsemdXRHB3VzJxcEdwbXMyOXdR?=
 =?utf-8?B?YWI3MEt5UmFMRWkxMmRXNWQxcWNQWUlzeHUyMmRIUjVJZVNzTTFoUmw2Tk5R?=
 =?utf-8?B?UW53Qk90NDRwRmJEMG5YNTQ0U3Btb3d2VlZWNG9VdTRveU00NjVRWDljaDlW?=
 =?utf-8?B?a0Ywc1dKeWhYbkhQeklzTEorRC9IVXB4Q0k4OW9LTmRnbE5ndVZxVlBHQW00?=
 =?utf-8?B?K0Q1Z1lnaGdYNWxKRmFlSXFOTUhNNlZtZHJSMWUxVy9zeFpkWURQRjAzZHRn?=
 =?utf-8?B?Qmdyd2RzcHFieG92NmUzalA4cFpxWWdzZzBxa3VmYzVib3pzWE9mVHdNQVlZ?=
 =?utf-8?Q?QYDojo8rqzMdY=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd2e005c-8991-40d7-c902-08d894f2cca4
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2020 05:43:00.8823 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B38psOMs9GM1yF2YtwUI3VGOngXQglmKTju2LYkwIQMaszpRwAumwXHpoeuqwHepKNmsLrnSXlsIuxpx51Ny0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB2026
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.88; envelope-from=wentong.wu@intel.com;
 helo=mga01.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Marek Vasut <marex@denx.de>, Sandra
 Loosemore <sandra@codesourcery.com>, Chris Wulff <crwulff@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gTW9uZGF5LCBOb3ZlbWJlciAzMCwgMjAyMCAxOjQwIEFNLCBQZXRlciBNYXlkZWxsIHdyb3Rl
Og0KPiBUaGUgZnVuY3Rpb24gbmlvczJfY2hlY2tfaW50ZXJydXB0cykoKSBsb29rcyBvbmx5IGF0
IENQVS1pbnRlcm5hbCBzdGF0ZTsgaXQNCj4gYmVsb25ncyBpbiB0YXJnZXQvbmlvczIsIG5vdCBo
dy9uaW9zMi4gIE1vdmUgaXQgaW50byB0aGUgc2FtZSBmaWxlIGFzIGl0cyBvbmx5DQo+IGNhbGxl
ciwgc28gaXQgY2FuIGp1c3QgYmUgbG9jYWwgdG8gdGhhdCBmaWxlLg0KPiANCj4gVGhpcyByZW1v
dmVzIHRoZSBvbmx5IHJlbWFpbmluZyBjb2RlIGZyb20gY3B1X3BpYy5jLCBzbyB3ZSBjYW4gZGVs
ZXRlIHRoYXQgZmlsZQ0KPiBlbnRpcmVseS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFBldGVyIE1h
eWRlbGwgPHBldGVyLm1heWRlbGxAbGluYXJvLm9yZz4NCj4gUmV2aWV3ZWQtYnk6IFBoaWxpcHBl
IE1hdGhpZXUtRGF1ZMOpIDxmNGJ1Z0BhbXNhdC5vcmc+DQo+IC0tLQ0KPiAgdGFyZ2V0L25pb3My
L2NwdS5oICAgICAgIHwgIDIgLS0NCj4gIGh3L25pb3MyL2NwdV9waWMuYyAgICAgICB8IDM2IC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgdGFyZ2V0L25pb3MyL29wX2hl
bHBlci5jIHwgIDkgKysrKysrKysrDQo+ICBody9uaW9zMi9tZXNvbi5idWlsZCAgICAgfCAgMiAr
LQ0KPiAgNCBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAzOSBkZWxldGlvbnMoLSkg
IGRlbGV0ZSBtb2RlIDEwMDY0NA0KPiBody9uaW9zMi9jcHVfcGljLmMNCg0KUmV2aWV3ZWQgYW5k
IHRlc3RlZC4NCg==

