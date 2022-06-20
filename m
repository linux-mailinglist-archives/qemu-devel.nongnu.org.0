Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF6A55100A
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 08:04:28 +0200 (CEST)
Received: from localhost ([::1]:48592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3AWR-0004zo-25
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 02:04:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1o3ART-0003Sx-6J
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 01:59:19 -0400
Received: from mga03.intel.com ([134.134.136.65]:26382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1o3ARP-0004Zl-MH
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 01:59:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655704755; x=1687240755;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Alg28TM45QeC/aiN0e6ssE5FDq+iPLSKQiaoaTUl05o=;
 b=mG4QMSM32m6AyT3VRGJeTxZiLKajgnfpGa/AFntiAaPdtwgis6/18DHu
 kkOJCRPBsh67moDnWNG7v3L3exsAFcBRr/BSD2fKx5ogkVNT31xdAkoRT
 Cl3qHb3nHB2dcMSMs6VcSYUvb4SsGQUH4MU/96dbBvscXQO9Dejz7dq6g
 NratTjcaApJkXKYb7LOjKcUBix61gZP4iJcgnsPo0FPibw4DCFKJgRNgZ
 L64kalCE8y1vwkYz5S6tAGgdupWvFKQaEUrjhTE1HyjT8Q35PrIi+cBSo
 4h9+uHjmOIf2nIerpDcFtYSgXsJ93Im/xQwB+IRLf1FTI3CuySk6oW3Ta A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="280866810"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="280866810"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2022 22:59:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="689286656"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP; 19 Jun 2022 22:59:08 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sun, 19 Jun 2022 22:59:08 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Sun, 19 Jun 2022 22:59:08 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Sun, 19 Jun 2022 22:59:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dx67WdhjCKwoA7Go5FTfvUI9L4xsVAMRhTCxQa6czdZrG5rMYby1nPAci4mQTpjLMt0X0lXmsnnKwAe8ziO5zXSXh1n0+S4n8okwBoWBWoQeskPdFrRvHC6Ht+iM6WnQ5zVNxFHLGjQPBPK1M8ja0YKARRhIqp6kYGVXd30MLvNihC21J7mFw06Po/LeIDP5JqSZ1ODUVISNnzeugM/zVaznvIhykJLBNabhjb0krm06sibEmLoUCKqURehErsA7BYmxo+EtyG5NCgQVPOiar9mLrO3oDBvvvKA6Xl7vXaYgefAOZlSZcWEx8X+q1O+4oi+mNF5zNSeDtBS28yujjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Alg28TM45QeC/aiN0e6ssE5FDq+iPLSKQiaoaTUl05o=;
 b=ROMniayygeREdRMrNKLuJfDYA7FTkvYUmDn6oAAL15rwy8CosMpsJuVzrQOJDfXBCwBFPqFoVDOufxVwWINDC6Vf+SYH4z6hbsA9t3gPgIxKvT3eXYhl7JuQDwMEdwUzZM6/P3298mYs/Bug0p23sJ6Wv1/0H6RJXldWbPuV/GhGBlkky4CXxM2PgGylQHu08TyibwJL/kG1fqO0Us7KCaiVK/9Td6rMSIusqwgJ9M8vJcajB+uUe9D51afTAFELiyPgpaGrFp5ZRZZL7QPMTYTBnxNN27fsBXrAt71IBWIz4eZfC3eMfhhFv/gNuaxZCOPylGeZKZk+tgm000S1ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by DM6PR11MB4395.namprd11.prod.outlook.com (2603:10b6:5:1de::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.18; Mon, 20 Jun
 2022 05:59:07 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::5908:5bb0:c7c0:85d]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::5908:5bb0:c7c0:85d%7]) with mapi id 15.20.5332.023; Mon, 20 Jun 2022
 05:59:06 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>
CC: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>, "Paolo
 Bonzini" <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 "Eric
 Blake" <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, "Peter
 Maydell" <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, "Laurent
 Vivier" <lvivier@redhat.com>, Yuri Benditovich <yuri.benditovich@daynix.com>, 
 Andrew Melnychenko <andrew@daynix.com>
Subject: RE: [RFC PATCH 01/12] configure: Add iovisor/ubpf project as a
 submodule for QEMU
Thread-Topic: [RFC PATCH 01/12] configure: Add iovisor/ubpf project as a
 submodule for QEMU
Thread-Index: AQHYgh8EJk95aDHPrke2v71SXRLplK1TPbyAgASPuXA=
Date: Mon, 20 Jun 2022 05:59:06 +0000
Message-ID: <MWHPR11MB0031A589B82138F6E541B8BF9BB09@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20220617073630.535914-1-chen.zhang@intel.com>
 <20220617073630.535914-2-chen.zhang@intel.com> <Yqw1wf+QjaBQ3I6M@redhat.com>
In-Reply-To: <Yqw1wf+QjaBQ3I6M@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ceb2de76-3458-47ab-076b-08da5281fc98
x-ms-traffictypediagnostic: DM6PR11MB4395:EE_
x-microsoft-antispam-prvs: <DM6PR11MB4395DC4DBB10B7FC5DEBF36C9BB09@DM6PR11MB4395.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JVRMmWdZ8DreMuqDDzrMJc/xWUOYTme9jTU+cA7hisbNWzuratdCTOWulxdbHAs2tYhIoIn4SootGRynGv7ZnO8mT+Optwrfvc6u69+ZGECRllqFIcZ/EacFH/s8Id2pNREjuS5J/yEoLuiPhzs7LxBXXmR+Gj1PSudfOKJ7izRl8Yd/r6Zc4FAMVwxnIit3a0naCUcnmN+qmcPkhW2FhLIAY1Yt0f03J7wDRjItER/wC+CyEye2KX9gj9hWakqmEU2uhwPF1zytP0WOBvgWBRH1EMdKxvK9EwTRZwlBqX9SdtorOQdRF/oVjTitwk5ArFgruk4EJ1i0jme9AFP3ot+kjA3Wo0jdN5Jfc3NkjbgGBFKKOVHGHrEcibPkh93Kdr9XanV7GHepcNXf47q+HXlePoI2RX9zwrY5KMAYMwejIJ8ydEMrS20DsF78C4e4Ds91UTQBdAmwngV2JgHJ0ZpEyNnin6T7DkgM4sOwErwIcEpvQkRyMB9qu8qUnMh+nxLGmACOEwIvA8xAVDBSjRXkoD1Zmh0ZsiJwLTBhtTEzH8rsuFhu4PGlKFJaOcsITQ+5MEWD5k1JTyJMLSIWukxSk3v7FZPDj0JKwLvVnItbmbkYLxXA63XZHtp4Z+StcixYUSmP6kaUhR12g86vRixRtqcFdE00+BRhwvPvKugw6KgFig2IEt3BOZalHqS/0z9E0CcTQo3wSYKfwuA+QqYk/a4ihQjWbQqCPU++SKUYug8hvl/aBaloeegkWzA80qynGX4a0Qq9pAdZ9rv52GnCe9a/orprdzHOvbSEaFbdWk2ewnXoShT0fkXsdtns
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(186003)(498600001)(7416002)(8936002)(52536014)(5660300002)(38100700002)(316002)(55016003)(122000001)(83380400001)(33656002)(7696005)(86362001)(6506007)(71200400001)(53546011)(4326008)(8676002)(6916009)(54906003)(76116006)(966005)(66946007)(66476007)(82960400001)(26005)(38070700005)(9686003)(66556008)(64756008)(66446008)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OGF2dUl3RU43d09KU1dMTUZnOHlkTEs1S3NrUzRlaXdUQTY1TUFuWWlmN1p2?=
 =?utf-8?B?elk5RCtIMFFoMHd6Ym40UGxuKzdYZGZBVDAxZmUzRVhBUitIbm8wMktFbmQx?=
 =?utf-8?B?QXFEejhiWTBPTU5yYmkwUmdrS3hRSm1xQWMxb3AvNzdkUW5RSnFNdTQyNzVw?=
 =?utf-8?B?bE1pa0c0b3NMSDYzaWZvaDhTQThlc2g3Nld4VlhMTXlqaGNLTXJGNXR3NENq?=
 =?utf-8?B?dVhqampNWlgzcjF3OGIyV1JCNkRDSllQMnUwN2EvZkVlK2xjazJXMHJjZ09i?=
 =?utf-8?B?bHIvM1p5b1F2QmppV1M1VklNQkY4OVFKRTlzbUl2UmhFT1IwOVIyTG83TTho?=
 =?utf-8?B?djJ5d2hOZG1NbjF1aXE4ZDhrejFlRk1wRmNYUWhuT20zeFhVTGVmUHRUNmFz?=
 =?utf-8?B?Mlk5K3VVdUdEYXRXcS9RVkpiMm9xWi90azBsM2x0Y3R1MkhrcHVSbmZIeXlu?=
 =?utf-8?B?TldORkpBcWVLSXoza3dqWkVtUUYra3h4U1YwOWxWWmV4ZHViL1J1dHNKbU5x?=
 =?utf-8?B?UFY3RzJiRDRIYTVZNHlJSjlKMDQ2ZlFoYVNSRTZCU1QzRFRKbEVEYmU5Z056?=
 =?utf-8?B?UTlyWFlKU3dCUytjVGUrUHZvNUpva1RSYVJMTGdReFRXN2tsY3d0UGtpR3lR?=
 =?utf-8?B?aFE3NlNWNVhNZEdQcWx5UFZNaFc2ZTFUUm5RMU8rb2Y4MG9yYnpQNmoxbisv?=
 =?utf-8?B?MUt6eXV3VzFhNUt5REVaWFozbWVJUnBCM3ZSNlltaVZzM25jeUZZQ21hbzNZ?=
 =?utf-8?B?eWFJVFp1djFLclEwUG1hU2ZZUi9RbWhlcU5EZmE4L1ZsRE1DWXh2NW1nL2dL?=
 =?utf-8?B?TCtMN1N5bFduMEdJWEJ6cm9kUTliNUdkczE5MHdFL3B3bHZ6WTJtc3psQU11?=
 =?utf-8?B?ckxsT1AvaWQ2OWd0T3gzYVcyb0N1ZHp5aTh4bThqQmFyRklzTVd6eUtWcUlT?=
 =?utf-8?B?MU1pVmhjczE5dHFxaFdYNEUzK2lPcmhnMTBJMzRUcnRvTjRsME9PZ3FSazNm?=
 =?utf-8?B?M0gvaEtYUFFOYS9pSGtFRWh0S254SkErK0Z0VWlBVlMwd01RWkZiSUE5T2lS?=
 =?utf-8?B?TnZ1V1N0UDg5cXRKSWtMZGhDcmNCTG5JVXY3WWVzUERtNzVUUGp0L2Q2ejcz?=
 =?utf-8?B?VkdlSWcwdXZHZWRsZEVvVHBzaUZ0NXljdUh0aUptVElmV0hlK01hYlQwcVRF?=
 =?utf-8?B?U0gyZ01JOWd6UDBuTG1YeWFYKy9sVzQ2MmhjdERTQmRFWTdHalZTK0JPaStS?=
 =?utf-8?B?UW00N0hLeXdoeXRXRGZmOXI5dGUvU2VqWVZwVDRuQi9ycHFWNEVXSnV0dHB1?=
 =?utf-8?B?OEo5Tkwrb09ZeWQzWnh3NVBZWTJwVDZSVFFrNkpIUkh3QkErTTRCZGRTNHpw?=
 =?utf-8?B?NFFqQ2xVVCtXUmkyNkNlYkxDLzk0TmhIcmhEME1YK0wwOG9BcmxZb2ZxeEJE?=
 =?utf-8?B?Vm84Mm01dzkyeitOSjJ1WWZQSGVkdWVTSmhVRm9FMWRNWEcrODhWeHVWTEth?=
 =?utf-8?B?SkhmZ3pLTEhDeEh4OEVhWE9MNGVMR1RuUyt4T3JtZkZ6dm5SWHE3cmhmM2lj?=
 =?utf-8?B?Q3dON2hoRXNLTk5rTmhua0sxTTAzdzVITnpWc0hqeVdWOFVYNWlEWmIxdUxW?=
 =?utf-8?B?NmE4SDl1cTJVdDBWeUtZQldOK3FtT25HcEp0MU85MWpzaU40b0ZIT0lvSmc2?=
 =?utf-8?B?bzFUM0pkUmtuWlFjclBFRFpMRUpEYVgyV3oyREx6K3lCQ0ZNZERWK1JxclVj?=
 =?utf-8?B?aVpMWjc5eTl0LzlnWmxuOTBpN2JudDNuOGJSWGZPVHM3bFVaQXYwcC9CTy9B?=
 =?utf-8?B?dG5vNzkvT0ZLbjcvcDlvT1dQSWszQldVcFJEaEFIU1BLL1ZOdGJscGtmS3Fl?=
 =?utf-8?B?ZnV0MkIzcEpKV004eTkrb3NXcUpEMlAySnRQbUNVdm9YZ1F2eVdhbDNzRks3?=
 =?utf-8?B?ZHlhaS9rR210YTdmQ2JLOWd6YThrbDY4YzIraGZPRU5IUjRJWkxDUGNPb3Yz?=
 =?utf-8?B?a3JBTitJM0tiM2hiL3ErWk40VVBmUUVrRWVvVkg5Y2tCSlVnMktLbmhrd01B?=
 =?utf-8?B?TGNKV0hPUnQ3S2xpU1U4YUREaHFKWVJSZDRaOUFsUDVjRzFuNEZ4Z1JuUjRk?=
 =?utf-8?B?NzRiQWVOM1FTYkYvSzVTVkcrdkcrS0N4Y3pzM29oLzg3akRuMjN4UHVTc2Ji?=
 =?utf-8?B?R3pqd3I2OTZzazBlc2c5U1c5d1pTSllOMUNwdERhR3hIbGxTVmNKeXVJRmtI?=
 =?utf-8?B?K0dHN2wwUkpPTjJ6V0NlV09rZGExUVprd3pVVjFWVU9UL1IrV3ZNUzFXYmVa?=
 =?utf-8?Q?M30MGUjSB/MLoJAM7h?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ceb2de76-3458-47ab-076b-08da5281fc98
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2022 05:59:06.8114 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lEtq6zOZHtBZR2G5F9g31FRCXLGEH2+6QvrnjlYX6cDK/g2nF6HOLIo/Z8faGmnRwQIvj8tHgpHhIYRtPaDeHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4395
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.65; envelope-from=chen.zhang@intel.com;
 helo=mga03.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRGFuaWVsIFAuIEJlcnJh
bmfDqSA8YmVycmFuZ2VAcmVkaGF0LmNvbT4NCj4gU2VudDogRnJpZGF5LCBKdW5lIDE3LCAyMDIy
IDQ6MDUgUE0NCj4gVG86IFpoYW5nLCBDaGVuIDxjaGVuLnpoYW5nQGludGVsLmNvbT4NCj4gQ2M6
IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+OyBxZW11LWRldiA8cWVtdS0NCj4gZGV2
ZWxAbm9uZ251Lm9yZz47IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5jb20+OyBFZHVh
cmRvDQo+IEhhYmtvc3QgPGVkdWFyZG9AaGFia29zdC5uZXQ+OyBFcmljIEJsYWtlIDxlYmxha2VA
cmVkaGF0LmNvbT47IE1hcmt1cw0KPiBBcm1icnVzdGVyIDxhcm1icnVAcmVkaGF0LmNvbT47IFBl
dGVyIE1heWRlbGwNCj4gPHBldGVyLm1heWRlbGxAbGluYXJvLm9yZz47IFRob21hcyBIdXRoIDx0
aHV0aEByZWRoYXQuY29tPjsgTGF1cmVudA0KPiBWaXZpZXIgPGx2aXZpZXJAcmVkaGF0LmNvbT47
IFl1cmkgQmVuZGl0b3ZpY2gNCj4gPHl1cmkuYmVuZGl0b3ZpY2hAZGF5bml4LmNvbT47IEFuZHJl
dyBNZWxueWNoZW5rbw0KPiA8YW5kcmV3QGRheW5peC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUkZD
IFBBVENIIDAxLzEyXSBjb25maWd1cmU6IEFkZCBpb3Zpc29yL3VicGYgcHJvamVjdCBhcyBhDQo+
IHN1Ym1vZHVsZSBmb3IgUUVNVQ0KPiANCj4gT24gRnJpLCBKdW4gMTcsIDIwMjIgYXQgMDM6MzY6
MTlQTSArMDgwMCwgWmhhbmcgQ2hlbiB3cm90ZToNCj4gPiBNYWtlIGlvdmlzb3IvdWJwZiBwcm9q
ZWN0IGJlIGEgZ2l0IHN1Ym1vZHVsZSBmb3IgUUVNVS4NCj4gPiBJdCB3aWxsIGF1dG8gY2xvbmUg
dWJwZiBwcm9qZWN0IHdoZW4gY29uZmlndXJlIFFFTVUuDQo+IA0KPiBJIGRvbid0IHRoaW5rIHdl
IG5lZWQgdG9kbyB0aGlzLiBBcyBpdCBpcyBicmFuZCBuZXcgZnVuY3Rpb25hbGl0eSB3ZSBkb24n
dCBoYXZlDQo+IGFueSBiYWNrIGNvbXBhdCBpc3N1ZXMuIFdlIHNob3VsZCBqdXN0IGV4cGVjdCB0
aGUgZGlzdHJvcyB0byBzaGlwIHVicGYgaWYNCj4gdGhleSB3YW50IHRoZWlyIFFFTVUgYnVpbGRz
IHRvIHRha2UgYWR2YW50YWdlIG9mIGl0Lg0KPiANCg0KWWVzLCBhZ3JlZS4gSXQncyB0aGUgYmVz
dCB3YXkgdG8gdXNlIHRoZSB1QlBGIHByb2plY3QuIA0KQnV0IGN1cnJlbnQgc3RhdHVzIGlzIGRp
c3Ryb3ModWJ1bnR1LCBSSEVMLi4uKSBkb2VzIG5vdCBzaGlwDQp0aGUgaW92aXNvci91YnBmIGxp
a2UgdGhlIGlvdmlzb3IvYmNjLiBTbyBJIGhhdmUgdG8gZG8gaXQuDQpPciBkbyB5b3UgaGF2ZSBh
bnkgYmV0dGVyIHN1Z2dlc3Rpb25zPyANCg0KVGhhbmtzDQpDaGVuDQoNCj4gDQo+IFdpdGggcmVn
YXJkcywNCj4gRGFuaWVsDQo+IC0tDQo+IHw6IGh0dHBzOi8vYmVycmFuZ2UuY29tICAgICAgLW8t
DQo+IGh0dHBzOi8vd3d3LmZsaWNrci5jb20vcGhvdG9zL2RiZXJyYW5nZSA6fA0KPiB8OiBodHRw
czovL2xpYnZpcnQub3JnICAgICAgICAgLW8tICAgICAgICAgICAgaHR0cHM6Ly9mc3RvcDEzOC5i
ZXJyYW5nZS5jb20gOnwNCj4gfDogaHR0cHM6Ly9lbnRhbmdsZS1waG90by5vcmcgICAgLW8tDQo+
IGh0dHBzOi8vd3d3Lmluc3RhZ3JhbS5jb20vZGJlcnJhbmdlIDp8DQoNCg==

