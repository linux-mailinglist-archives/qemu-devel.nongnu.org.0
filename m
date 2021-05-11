Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCC037A7E1
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 15:40:28 +0200 (CEST)
Received: from localhost ([::1]:50330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgSce-0004iT-0W
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 09:40:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebastien.boeuf@intel.com>)
 id 1lgSW6-00027w-H7
 for qemu-devel@nongnu.org; Tue, 11 May 2021 09:33:42 -0400
Received: from mga01.intel.com ([192.55.52.88]:60877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebastien.boeuf@intel.com>)
 id 1lgSW3-0003xy-Fd
 for qemu-devel@nongnu.org; Tue, 11 May 2021 09:33:41 -0400
IronPort-SDR: xCm5QqoxaOgzd8l61keV/DFGFr8Ac/g/9daIvnp4Zh9ExRFd2CzGICQicJ78XTL+d9NsphiYQa
 42QIglu9K6Sw==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="220402076"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="220402076"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 06:33:32 -0700
IronPort-SDR: k3N9/tPGWXzR7Uv8PeTENttjCpikdd7lI2isR6WOnuRNpyimhTy5WzsoQm8fJXPtHDbTnURiBx
 QmTs1C6E8eOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="434448176"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP; 11 May 2021 06:33:32 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 11 May 2021 06:33:32 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 11 May 2021 06:33:31 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Tue, 11 May 2021 06:33:31 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (104.47.37.54) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Tue, 11 May 2021 06:33:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j9jbp0wOqOd+oe7w8sghpopiBWPEh+TLG65BBUNYB7/V+MKjx9EZriWat7main7RnR7gpEaa6YLxl4DYhAvILMRBdR9wVSp3an0gWbSXoLUCrXUnBGUyUARQUfnkzdHei05tnrvjsHq7y5Fe+IR87Nrb8GZsya3IBSkiHpwtJTDjWWFzhpxg/PWYy73pFMOp0v91FRAY8kxWAMemAuamM7KC/p/dfrJwEIuP3Y2h2P1Phv1dWg0Avx5HdDsNttzSYccS1s3rqafGasXHErxxBFwKP/oviN8XHIWnpEiDhFacdGWrM81pG4yzyj6SBqwhfAxbH/0OLfPUHpMsFawy/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6VHnorbc/5XxltGcxPwWgPq4I4m2tFGhpdICn12npfk=;
 b=R7EE7YVajBYTpw9PGRSBADxJnd9Iu7El3a297L/+dO48lv2sgI22jrW5i1mBCCJ1+VHWNUJ1H6ncvMtnHjR3a1TJyqt+azHykZT2l38eCGCq9Cv3rN4QsXrNdRnZQprWAnaCtEoyXUqUkX1M4LWguz60tBDPD5sxrMPuzOR8d5SrGAmVSWj1WO6LndPZXb9CX+2decwl6R1Zah6/Wjm7DOxo8V06tBzQ0Pth6lZqaiYFkbKPVXiHbo5MYIRvarYumMse/qT/4tk48VLiqRnG/bvBRTJeog9mbqfR01ryNRjUKKrfXWz+0ifPqVlrWPEwkrEoSVI/cgh1bBFpQ5xXJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6VHnorbc/5XxltGcxPwWgPq4I4m2tFGhpdICn12npfk=;
 b=zeTXmLAKVzirmaNqW+wx6U5EiUI+Fpcr7zjUaiCgjUnIDnHI5rcW+ZDDvpSOGbhV/YY8Y1J85ln4E22tbhvKMN5O4cc8ZQ5GKN05cShl+ZVQiqjGDralLtLDRuOR7rgJRqQbQSh2ZMcYpZw3h2o3amZZNB7RPKPVLn0RENoXfT4=
Received: from BY5PR11MB4401.namprd11.prod.outlook.com (2603:10b6:a03:1be::13)
 by BY5PR11MB4306.namprd11.prod.outlook.com (2603:10b6:a03:1bb::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.29; Tue, 11 May
 2021 13:33:30 +0000
Received: from BY5PR11MB4401.namprd11.prod.outlook.com
 ([fe80::d85a:10d3:e094:f94a]) by BY5PR11MB4401.namprd11.prod.outlook.com
 ([fe80::d85a:10d3:e094:f94a%7]) with mapi id 15.20.4108.031; Tue, 11 May 2021
 13:33:30 +0000
From: "Boeuf, Sebastien" <sebastien.boeuf@intel.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: [vhost-user] Expectations around reconnection
Thread-Topic: [vhost-user] Expectations around reconnection
Thread-Index: AQHXRmnpHHvwNtq/EkSSw54CT6eCFg==
Date: Tue, 11 May 2021 13:33:30 +0000
Message-ID: <BY5PR11MB44014FC44FFAC6976FC89BC1EA539@BY5PR11MB4401.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [2a01:cb1c:8ee:f300:890a:51e3:36e3:b308]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 60c0210d-214e-4b60-0869-08d914815dc8
x-ms-traffictypediagnostic: BY5PR11MB4306:
x-microsoft-antispam-prvs: <BY5PR11MB43065B2B0DE4415D3CFFBB43EA539@BY5PR11MB4306.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FCbbXmV7VURXhLEBHYmvGe1BE9eRLScerBzwEW2a2ScfQiBCDPsuO3fFr/hrPkrdDr0RhF25n5n0J3IMfBaefM690uPrc3HfAmuH6Nm9mOIOUO22wHm28Gj1eYoOHehRLb6v4Osi9cI5w64Om8Qbe52Vb1F20BHDkxl3VNr313AZy8zJFi4n4AZYeQ7n0FSIGdut2eikTntLoM4JhjyHFAuZMo4f/5cR8mse8zLYgshAVv9ZyWae3U+YqNM1h7/YaohMGfZWJMNj9ccjwytVTmDravmezbnbO3v7gRUtI2MtjiXVEyhw0CphpXaiZ0XtazHj0F7LfvkqA6MsHDf1I/7VT5R35SyUoTACeYl07OE3FDYk3yg939RyoyIxErm4MAAXkz5GHON5ACnHKhnvYV+NIOkCdRE3E9CV/o/dF5c1cUGvOdakXTcBXMpsS0aQg66rwyy4MrIjk0pmATLWugBZNBuRuktodW+tg/VINOfQXUs3CTgTLxHFcetlWUMYAYXPF056kS+ThFMYRPz6JvkAyqLaaT9fvBwHO4EckazUcPwioax2hUKx6VVIphycoINH+BeebxlTFZBWqjs9UMyGH5zUWA5XRUiarpI0sjE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4401.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(346002)(366004)(136003)(396003)(39860400002)(66476007)(2906002)(91956017)(64756008)(52536014)(76116006)(66446008)(478600001)(316002)(66556008)(66946007)(6916009)(122000001)(186003)(8936002)(71200400001)(8676002)(33656002)(7696005)(55016002)(4744005)(5660300002)(9686003)(86362001)(38100700002)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?31nxYJyRB7Gs33NvuBPKzQF8wVWGkXVv738chC+70EJ2vs4LLj2i0lqNvT?=
 =?iso-8859-1?Q?P96jdsYqO1M4SmEPiQVG4C0DLsCvtHZaMmihUa9zbyPrPE+VcVgWCnlLLl?=
 =?iso-8859-1?Q?oeHXLr80p7XEkZflmH5Moxt+p04m0B3cjUBtB+0LrpHcVHLTSfGzzqcX+H?=
 =?iso-8859-1?Q?UpKTJ+Gbe8XRS89wenvAtz5kaeZGLHGtSNeLAabkXbOiOOlgCHE+QF4CBp?=
 =?iso-8859-1?Q?HP2AHVdQh8c9ao0LUj8uHVpUKRlzaBB8pN6HwpF9ceuz+r+zSk19bTkIJg?=
 =?iso-8859-1?Q?w2DWVqaigXLlCB2wVge8He/hrI0auhzBEAdbm6C9jlrV9V2wQM6EFy+V+j?=
 =?iso-8859-1?Q?jgh9avxSpbUNDuM6ncsEFE/ZLT0h4/T/9fd8OOhVXGuMPH0JpJznOohplF?=
 =?iso-8859-1?Q?w07XEia+WbZWZjiuIJiMGVOl1bcgkM8YoqfKTqGSp87/GFaIBkUstd27xb?=
 =?iso-8859-1?Q?32tHEv0/RHOU164JS5cSUBYROMlXjhy/4AlZkolF2btKnSEWqT1CEzOm0d?=
 =?iso-8859-1?Q?0dJ/yD3shcnrh6Ydlv5vHmDY/pXja8ObPMdfogXpLlKhevccfaGyTAehbj?=
 =?iso-8859-1?Q?k9EPt8SoCgjdBojAwoX7uQnP6KxhG0sjbbe5bp7xGQRgjjN+f3e0JzSAT1?=
 =?iso-8859-1?Q?7T43gMCbJXF64WyVRqBN6G35e1cW+qiKogWDRGomiYPRRC7K2bQp83UBGC?=
 =?iso-8859-1?Q?3QyRPFniUkHprM03deGWzUbKwvGXf+EyLMvbPwleASdED8tlSLIi6HPm48?=
 =?iso-8859-1?Q?0ZNAWYW9AO8llbN8pOyMSyNw1ymU4CHE6yQG+iP4BKtQlB3nPlbRw8zXUi?=
 =?iso-8859-1?Q?V2+M7+Kx6Y4PjtJKqr9ytL2ICD1nb2LlFFVHfr9gbxIk2wXqMeRVjILxAP?=
 =?iso-8859-1?Q?i8nVveCiPMhzMuy1eu3prWaCjuQzw1CqlHYErrmaRYkdoUbOH4SgcAnp80?=
 =?iso-8859-1?Q?MKr3bYnRIBIgHZIDQ4Klf6ln+rnyW3E9ilKNw/WIv+qgPWA2FSdR2MDihP?=
 =?iso-8859-1?Q?wdepyoMfVUns9fo8ACAyorZK1/Dv9APUAScoLXadMyCEmmyBx3oKlZEyKT?=
 =?iso-8859-1?Q?NadEpYZIe+FWJ6jBPC3Iu7KLrGR3EJctE4qItqVxDlLgNrP6TgHpfM1vmv?=
 =?iso-8859-1?Q?430H5sryUAFqpuFjmW0npH79McTuJJrUpg94vdbxDuN1I7Po5oiHTZY6/R?=
 =?iso-8859-1?Q?cogOydGc+efjbY3l9x3wgaqeV1PkNLUlV651X+fLk2IIc2OXUJyFqU+siG?=
 =?iso-8859-1?Q?OtTxohCCjkN1rWcBE/SRQ7qxdpd2xhzqhxo56m6S6nNq0yak3H/T/GJDVd?=
 =?iso-8859-1?Q?lBZyaKPuXT1ztuwXXjBg8OkUaej3yTGU+2L6hgeYVzyL9KdzPhAwSQUXcD?=
 =?iso-8859-1?Q?ysykueBZpvBor85O2F33IMIBCFQeSCGbaB8EpUZE3E++SQoxfdvG6pN651?=
 =?iso-8859-1?Q?3ePowhzO9lPVLQ1m?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4401.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60c0210d-214e-4b60-0869-08d914815dc8
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2021 13:33:30.5293 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HSAO/gsa9WFOSQ3sJBpRrJrfFz081T2+OiQb8GuLCtpeEUD/EZPMZtf7KygaiNxxFpqUSq+IzOZnjMS+CA8NzgcBIjB96ScDFg8AaKIiPxQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4306
X-OriginatorOrg: intel.com
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=192.55.52.88;
 envelope-from=sebastien.boeuf@intel.com; helo=mga01.intel.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, LOTS_OF_MONEY=0.001, MONEY_NOHTML=1.634, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi All,

In the context of vhost-user, I was wondering how a reconnection should
be handled from the VMM perspective?

In particular, I'm looking at the OVS-DPDK use case using the client =

mode (meaning QEMU acts as the server), and I'd like to understand what =

QEMU does to handle this. Upon disconnection from the backend, does QEMU
 reset the virtio device (meaning the guest
is notified about it)? And upon the new connection from the backend, =

does QEMU go through the whole vhost-user initialization once again =

(feature acknowledgement, setup of vrings, etc...), or does it simply =

assume the backend will have saved all these information?

Thanks for your time,
Sebastien
---------------------------------------------------------------------
Intel Corporation SAS (French simplified joint stock company)
Registered headquarters: "Les Montalets"- 2, rue de Paris, =

92196 Meudon Cedex, France
Registration Number:  302 456 199 R.C.S. NANTERRE
Capital: 4,572,000 Euros

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


