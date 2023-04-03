Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 114C16D3BC5
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 04:18:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pj9ky-00080z-Au; Sun, 02 Apr 2023 22:17:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1pj9kw-00080r-Ds
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 22:17:14 -0400
Received: from mga17.intel.com ([192.55.52.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1pj9ku-0001fW-30
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 22:17:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680488232; x=1712024232;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=URrcV8fcdyJSmoCzEHFSSh6mQ1EW6EaUbAFnBxUHkW8=;
 b=D98AUBClLXNUl6IlO1+Si52yPxTxVLgkACPMD7/FOTmyGB5z26aOpc37
 ZI+OgFKQJtyTA/io784zFoe848ZoiW6g/pmDSvgnGe1jCCE7SZHK/1Htb
 PYdBf/qStOPP2zbif5T5zj8UCcFjeRnwBj60gDJsa77r8oBZUogG6+3Yc
 5tvJLru6bCTjFrJG/gT4CBZLgvmq33cJIFVwZBXRyOa8osNUwwHwfm7jT
 CSkiYELjUQ75t4Ya9Yzu7ab8rPBlO+GwA16Jx8KEWE1KRuYfUTiQdpqs3
 k7NvuNvacNxA3ONJgw5URo2WdPv+fp2lk+W0GbaNbADI41Gt2gAwDLUSQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="322185729"
X-IronPort-AV: E=Sophos;i="5.98,313,1673942400"; d="scan'208";a="322185729"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2023 19:17:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="663032214"
X-IronPort-AV: E=Sophos;i="5.98,313,1673942400"; d="scan'208";a="663032214"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 02 Apr 2023 19:16:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Sun, 2 Apr 2023 19:16:58 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Sun, 2 Apr 2023 19:16:57 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Sun, 2 Apr 2023 19:16:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XwkOliwXkx7vuDcoB6hOpZX3M9URpyCuagZjJKeNN87ES8ouuvuiuwOMw4ICI3VYkHRYtYcN9ih+dYdyEMlp7rT6cVj3EJlhnpPxchY/DroDdGMMkc3oMmn72P3Vl057SogFEMaj4r1w7WElDiDAHtXeQF4eZXZEtfs8vbbkhZ7OW90reHTu/przwTR3FOFh2pr7T21GDnMglyFDwRX+1E6c/n3AK3C/WU9M8b1KZblFVy/vNYX02jOOH6M6la12ZcBeeOT+bjPlsvNMirHH+LAlvHaXz0U+dZb1Cx+je5VwpCnPv4zfPusRfn7nTOCgwBy4yPaIVuxbUb+dOSnxcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/1La42JaXRaIUzVxDlfkK1JHiaqUF/0NH4qbOuyGd8M=;
 b=lcL4Zc1Nbp/qevOyBzRKOPeJeJQjV0D1AMK+xSL1Y5IabHzp/uePvn1peK3Favjh8lJhllX0qtfhxK0aCZQ65FWvRUrDAV/90iL87C8smrBMS7LhzG8pMvsGGPI9T2Ns7DlsEd2nQBlkNRAqGeymkPbuuKRS47zq2MjTlDmNVWmzFEugTYhM2dQv8tPnD8P4HTpHepcoCoTFDf5KtnbR4F+SXdSlbqt0rQcGtE+OJ7+L8vKWU6YlCVaMDXl4mVXdQHQ03a5B4MsHkRngy89CcL5dWqkT7Uhwey4dKBx1L3f32bz9uSUcSOX7uUPsoJTpNm1xpskEy2g7vsbFhDFx7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by BL1PR11MB5526.namprd11.prod.outlook.com (2603:10b6:208:31d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 02:16:55 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::e4cd:5e80:f8dd:13c3]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::e4cd:5e80:f8dd:13c3%6]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 02:16:54 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Lukas Straub <lukasstraub2@web.de>, qemu-devel <qemu-devel@nongnu.org>
CC: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Juan Quintela
 <quintela@redhat.com>, Peter Xu <peterx@redhat.com>
Subject: RE: [PATCH 00/14] migration/ram.c: Refactor compress code
Thread-Topic: [PATCH 00/14] migration/ram.c: Refactor compress code
Thread-Index: AQHZZYyjcRO9F6jxl0q7Uj1qMaBwJa8Y1L8g
Date: Mon, 3 Apr 2023 02:16:54 +0000
Message-ID: <MWHPR11MB003148B20FD87F72AF73DFB29B929@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <cover.1680457764.git.lukasstraub2@web.de>
In-Reply-To: <cover.1680457764.git.lukasstraub2@web.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MWHPR11MB0031:EE_|BL1PR11MB5526:EE_
x-ms-office365-filtering-correlation-id: 852daf64-9707-4a86-9019-08db33e97e38
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wVOzR0j04+5Nq2f7SnLoALmJrhRPIrcyLUszKtcBHJX0qGuxOTJmgGtLNbcP5pAwlt9jgsQzjtUA+gkIzXjJp7IkT1x6ssvdIAtpME0/Z2agyxML4RDhc2qR5NmXrcB+mIzBgmrXOq1usiQe3zey9dFhzMaus8Imz/n4iRgnNK0ojZxtAwoJBSVrzg5ltVhM6BDajGOOldGN1CJkomwH7e8/UVtvlyIT8XBPSxShZlPUnvhdYpWUe9bX2yGAM7FEXyuOPWeTt9L1AbsRLGLmUN3oLlZ7ntvV1SjPwNXMo238rIDefognWDzV6PmuC10/yJUs/5R6wT7FWXOc0EKsH4KcF5gnyJKt8MZXa++L3dBPsfe64ltO4NaBE3YWh8JyUEVWrosCvByM9wnNhZRr+sjh/dY1F8qz4vplwlbKtN10WN2sepSQDBPAUtNxQSFKv5AqDWYYb7eyoBZyTOoWtM/y9WKkv9ap4eiXZMph9BnlEGAW6jFgPuvjo5zN+DRjC0180KIamtigllKmDHYTowmaQvC+L4XvBXBSWj6qu9xj5j4e772SUcE9VO5oYXnpiWJUmavWPewEE6ATFr5lPmxWA70UDxsWoH+fRVdar50=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(136003)(346002)(366004)(376002)(451199021)(55016003)(4326008)(76116006)(8676002)(66946007)(66476007)(64756008)(66556008)(66446008)(110136005)(316002)(54906003)(478600001)(52536014)(8936002)(5660300002)(41300700001)(122000001)(82960400001)(38100700002)(53546011)(186003)(83380400001)(7696005)(71200400001)(966005)(9686003)(6506007)(26005)(86362001)(2906002)(33656002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?g6sxdxcgAbrBNxPEld+U7oBJix3nNzE04dco3YjRMqGqNmouXcAK7XLIMskP?=
 =?us-ascii?Q?kS1yHXOJvqFpnlLN2zkGjyJkGeDAWyjPsL9qHi76ZX9FxZ2XsXu22UPVGqrC?=
 =?us-ascii?Q?TJ6xMGVwtbPp/5omCxYPkDPzpcCrRjZSvZ7xORonZi6nTWLLf/1713Wg7uBf?=
 =?us-ascii?Q?v/GpsaXThz4NnHl9+RgzUX3GZxf3Y4vq3iSoRZFyYecb58dr/Oli/qQ3lq1N?=
 =?us-ascii?Q?wz25bZqwrCnCOEAu0ppbAo8+araqTY2cj6ABlGltcgCPivMKlRLfWDKw3hKz?=
 =?us-ascii?Q?4r9UYrg7omYYGH52xma1YsbKgaLupRmJvMD2vzxpdgw8EO99QCkjzQ3LMXux?=
 =?us-ascii?Q?4RC+ef3iw3bbsaucHPyScuiJ5vBoIcJlrcs+yJ+603TF9uYs8WJoRrUH0C+I?=
 =?us-ascii?Q?oiXrGvmEoS/QnRQG43+jZHkVBYwVx3l6sq/8KS8fLEdG6PaVRzAa9xM1dSC5?=
 =?us-ascii?Q?nvEDMJ1fWHDvqETfUDoE3Pu01QjDnGyEcV3nJlPr58bvuaLeWsaQA+X4H8pn?=
 =?us-ascii?Q?ENXrYraLE6Pj6DW4vGfnb0tvLyDw7trSmlPKWAuXj+rUMXRJe9Q83zwr5cAd?=
 =?us-ascii?Q?46rgJlyRH30bkAzsj6Ii+LVEvI8SO0kni+1bJ1PBV5dzxugWnoW85JSCkPkr?=
 =?us-ascii?Q?U7AbV2PnvC4qBacfCL9NGSrKFkQJL/dnbCCxmBF/Y/T+Iyg2rLaZaJd5pg0f?=
 =?us-ascii?Q?Gef90itaBbyphxRq+A2vgai6Jhvd5yZd8a30j0TjjXT1BtwJFr8wXiXUsWze?=
 =?us-ascii?Q?G9g8si8GBRchg44IZ31OcTKicpJ0XqQN57HWxSq/x5v31k7xBMlfQ4+fZOhz?=
 =?us-ascii?Q?RAmzvfRKuzDj++ahbhGTZYXcgC07fmsJVgsuc0m3uoXHOqF7lInDWvSJMum3?=
 =?us-ascii?Q?I/VoHHDl3FiUx0I7B8ayAnwFXqSh6GYaonwfGhu5+n0UyRwDkVNa/bO5VPMp?=
 =?us-ascii?Q?eok1mS4O1lLyQ49iyf4LyMDFNjJjzLZkvgUb9EO7ETgzSbF1NXacI+PwrCGB?=
 =?us-ascii?Q?q9nU3O/HAsKI2nJWpXhuei2JZPWMMduxMkiDHjVmY0wxK35w8xll+z+WMm8j?=
 =?us-ascii?Q?QmSxOXp5uFWD/ZZaDf15tcGmMPBnlWb52whlWIQfcm9HwnsT4NdkWCRiwGbz?=
 =?us-ascii?Q?el3kPbU2QSNoAgAkcB6rD2z9P5DQVWZMmkypoNH3MQCOKCL2QAjrWyD5A9L2?=
 =?us-ascii?Q?P7oxb6i2SrA9ovBH2UrtYmTxv32dKSskIqoMD5vfB2ZG+6L7vJX4T88xiK74?=
 =?us-ascii?Q?hmmRWQ50dXFxRlr7tn1W+6GjVgPdDfjngm4NHsOqLoHlH6IE03dr7DPwWCDd?=
 =?us-ascii?Q?gzo26WSF7Ku6mWiLCgBbOiCsdMVBiW8a3HqJvz75ZeX6EVLPje1GQnsQ7of5?=
 =?us-ascii?Q?FS/TjA5RLcSt7VQgA7kDxE1nZu1Uu4vWUCHUlxarEORRODL/4RmD4f2vIOgw?=
 =?us-ascii?Q?qHO9qWvrT9C9ZdQSn9J7mDYNKH3jJg8TFGpYhpppk/KP8cgDEE4RHnbvEuNJ?=
 =?us-ascii?Q?jca334hUdlJoC0VV7u5SBiGjZ22YRdKrJR7WojUp20HtlAUjShRPrWvTHUbk?=
 =?us-ascii?Q?XXEHCAwhuXP6MePw3WI3o25kgIdm9NsKbKoBCdPi?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 852daf64-9707-4a86-9019-08db33e97e38
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2023 02:16:54.0904 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OxBMQ7T+2855ncFUDQx6yIYvXoqn+Dj3zf1/orNICfx0NOQROzYv7QllW8FGbDhf0Vuo+ZdXoG/KJOvFlW09LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5526
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.151; envelope-from=chen.zhang@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



> -----Original Message-----
> From: qemu-devel-bounces+chen.zhang=3Dintel.com@nongnu.org <qemu-
> devel-bounces+chen.zhang=3Dintel.com@nongnu.org> On Behalf Of Lukas
> Straub
> Sent: Monday, April 3, 2023 1:56 AM
> To: qemu-devel <qemu-devel@nongnu.org>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>; Juan Quintela
> <quintela@redhat.com>; Peter Xu <peterx@redhat.com>
> Subject: [PATCH 00/14] migration/ram.c: Refactor compress code
>=20
> This series refactors the ram compress code.
>=20
> It first removes ram.c dependencies from the core compress code, then
> moves it out to its own file. Finally, on the migration destination side =
the
> initialisation and cleanup of compress threads is moved out of ram.c to
> migration.c. This allows using COLO with compress enabled.
>=20

Nice to see this optimization~
Support the ram compress feature will reduce COLO checkpoint network bandwi=
dth requirements
And may improve COLO protected VM's performance.

Thanks
Chen

> This series is based on the following series:
> https://lore.kernel.org/qemu-
> devel/af76761aa6978071c5b8e9b872b697db465a5520.1680457631.git.lukasstr
> aub2@web.de/T/#t
>=20
> Lukas Straub (14):
>   ram.c: Let the compress threads return a CompressResult enum
>   ram.c: Dont change param->block in the compress thread
>   ram.c: Reset result after sending queued data
>   ram.c: Do not call save_page_header() from compress threads
>   ram.c: Call update_compress_thread_counts from
>     compress_send_queued_data
>   ram.c: Remove last ram.c dependency from the core compress code
>   ram.c: Introduce whitespace (squash with next patch)
>   ram.c: Move core compression code into its own file
>   ram.c: Remove whitespace (squash with previous patch)
>   ram.c: Move core decompression code into its own file
>   ram compress: Assert that the file buffer matches the result
>   ram.c: Remove unused include after moving out code
>   ram-compress.c: Make target independent
>   migration: Initialize and cleanup decompression in migration.c
>=20
>  migration/meson.build    |   5 +-
>  migration/migration.c    |   9 +
>  migration/qemu-file.c    |  11 +
>  migration/qemu-file.h    |   1 +
>  migration/ram-compress.c | 483
> ++++++++++++++++++++++++++++++++++++++
>  migration/ram-compress.h |  70 ++++++
>  migration/ram.c          | 490 +++------------------------------------
>  7 files changed, 615 insertions(+), 454 deletions(-)  create mode 100644
> migration/ram-compress.c  create mode 100644 migration/ram-compress.h
>=20
> --
> 2.30.2

