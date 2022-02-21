Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 454D24BDB10
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 18:04:09 +0100 (CET)
Received: from localhost ([::1]:58982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMC6a-0001lx-6A
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 12:04:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haiyue.wang@intel.com>)
 id 1nMC2D-0007Ub-Ui; Mon, 21 Feb 2022 11:59:37 -0500
Received: from mga17.intel.com ([192.55.52.151]:15506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haiyue.wang@intel.com>)
 id 1nMC2B-0003np-AN; Mon, 21 Feb 2022 11:59:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645462775; x=1676998775;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=M6A2pSxwX2qoF4yG8nWyoX8Ch5GRZsPLyESZpWbmKpc=;
 b=NK9FBmFwNkkAMIbWJBfSQ/sDMbL4xwmNx0QCycNC0OKm46+q/geQ+0DV
 PyatMberfQSJaTl1OMNJaoqCicgqQLi2wI9zG+OPlpJNxrIYdNtcA0B50
 puCOYvrdJ34p+TbZ/BA6+OrH5AxBxN55ziKXUmvRoL4s4FwmU4Rz3w8MT
 fHZD3o4/+4Emt6Se0Q88pEZD8GtBCG+LdkVeNrkpSdlTRC8ZvAEWl+XnK
 7iv5wvERFqCQmBItN3Ro4HfcbOZpsCPk1W9doyIb6h6VX3y8Daq98CVA6
 Bk7cJC0XJzJht3Xt8wjeb97HpYeKml0T+8KMsOJ4sVyZ5Qa27aF+eCf28 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="232162619"
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; d="scan'208";a="232162619"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2022 08:59:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; d="scan'208";a="638609420"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga004.jf.intel.com with ESMTP; 21 Feb 2022 08:59:32 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 21 Feb 2022 08:59:32 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Mon, 21 Feb 2022 08:59:32 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 21 Feb 2022 08:59:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UlGI71O8C91asRXHUl+mG/5/YKEe2tUny5wlaOXXZalGzfPMtejUwhlzGSLnnFzp+gw1kRmc9l68QXEYRhBfwkysjXJ3vfZDb53aJmQemJtkNheKLlqAOZ9JZTG3HjrNdhfnps+4kC5hXpPp7xOJDe6TpgwFe5TihH127AE9m82FK+pQFCzapcxFm2KJ2+DabGy3HhwXpRj60LwFUN0wFd74f9xcoG2JDtd0jGV+2x1GAtzHOq/wRjOPYwVIh1JiQ5h3vIQHlwAo5UA9nQt8R0YsBXWtC9XbvXsHcacpDLKloaROdh4apCgfFF38sRK7Gj/Gk/w54mOJnWY8XFDyNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M6A2pSxwX2qoF4yG8nWyoX8Ch5GRZsPLyESZpWbmKpc=;
 b=j9vmB1Znl1sTa2nVL9FCHFh7nSxaZSm9L6cJEsH8miYpEEGzxevWJtsQKER8WA1lJLIl0buDiNxiJmbDsZ6E8+zxLnJYEjd74daWV0EJY01kbmtOQsyDX/pqd7rggVIse4+2O0vuMBPSYpe9gFDrSzWctIoWRaYEzV/BFgnoI5W0nBLvg7Y8GwLPEYdiZUAg1N90/9LS8XdWpq+ai+TxFouti4GLob5QY5eT4Q8k3ukHxUqYINRacJCKGeDa3VvFL7huA0hslimejOBYR92WMMqv+t1i5c2XZXsVEVIx8kbLaP/aI3xJm8YuFzeKPzo+rzhAZQyCOT5TXRe5kE2opQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB3495.namprd11.prod.outlook.com (2603:10b6:a03:8a::14)
 by CY4PR11MB0008.namprd11.prod.outlook.com (2603:10b6:910:76::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.24; Mon, 21 Feb
 2022 16:59:30 +0000
Received: from BYAPR11MB3495.namprd11.prod.outlook.com
 ([fe80::714b:35f9:5767:b39b]) by BYAPR11MB3495.namprd11.prod.outlook.com
 ([fe80::714b:35f9:5767:b39b%6]) with mapi id 15.20.4995.027; Mon, 21 Feb 2022
 16:59:30 +0000
From: "Wang, Haiyue" <haiyue.wang@intel.com>
To: Peter Maydell <peter.maydell@linaro.org>, Stefan Hajnoczi
 <stefanha@redhat.com>
Subject: RE: [PATCH v1] aio-posix: fix build failure io_uring 2.2
Thread-Topic: [PATCH v1] aio-posix: fix build failure io_uring 2.2
Thread-Index: AQHYJB6CvXKHf4tnkEeqnoJ9ZM38qKyeHY4AgAAQ9ICAABHSgA==
Date: Mon, 21 Feb 2022 16:59:30 +0000
Message-ID: <BYAPR11MB3495D6DF871E8D5DAA70192CF73A9@BYAPR11MB3495.namprd11.prod.outlook.com>
References: <20220217161627.45351-1-haiyue.wang@intel.com>
 <YhOnmC5EDOK0D5/D@stefanha-x1.localdomain>
 <CAFEAcA_JXxiX-k_bu+uk9SpewxzU4qOPmTE-eVVZ6-gDTN9P-Q@mail.gmail.com>
In-Reply-To: <CAFEAcA_JXxiX-k_bu+uk9SpewxzU4qOPmTE-eVVZ6-gDTN9P-Q@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.200.16
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c8864245-aea7-4c52-5544-08d9f55b86c4
x-ms-traffictypediagnostic: CY4PR11MB0008:EE_
x-microsoft-antispam-prvs: <CY4PR11MB000839D61D116FAC3387B8D2F73A9@CY4PR11MB0008.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: F2LNX8OTuM9FwBRAU1GdLpHunqe41YZzw4L5AcAjbm9axFKDUvn4dAqAlwZd+D74kk40K8srSWsVWn32zTDLTzh+xcm8T1yWUQjUosOUCuPwwx6pf1yLxg7JZXlYGoe4D8kBKX1DoKicbiiUHv+KhMnfXXe4QY13O9OKUK3zwhbdsujRiUgxWQBMNFon7PjKzAlQXl4AsdYP04nB1OYA3m1sOrH4PpSZabVDCTYWh0I+ebPJEuQI+EbNi99ReDiN8PHYLy0+1IO3CskQy1ZzqkmkyH6fhFCKXBJV6SkrIIKp1WunbGZOcuzj/0QdoaDl31cW6xmoPgQRyxxOkEBzOsWibyCe4fQujAz6zNwhKmT2nDZs4NHIXVZCh7unZA/1xpFpSb5S+8RAKs92DkgynAjo9esOU1AmIdYsV09uQKVO0R8HtL+HWzvo1xNb9uyHQQOVH0pp6TPtEiNeRfH3q4By5q53bU18mS2+6Lq+heBxlGvC1CIA2mOJQjOYBqvIrSGmdqkUukcXccoP7QakpOgQW6FcFh+QTTdF/KwYntfufOn+rmrsY482dRywGSDrokmKnxV1/7MtoFWvy90W1T56FzKoazpq2Y7uabmSxzR+0qYmDJhowA2u+34D7V/LnWT6jqFwUzc2K5p9K05DTOqknRxO/IqqZKjq1acSEbeRHdXG5mI1tuTAcdJpS4BpCtP9POevdcHFdTJQzWk1qg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3495.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(4326008)(38070700005)(38100700002)(83380400001)(4744005)(52536014)(5660300002)(55016003)(2906002)(8936002)(33656002)(71200400001)(6506007)(26005)(110136005)(53546011)(186003)(76116006)(9686003)(66556008)(66946007)(7696005)(54906003)(122000001)(82960400001)(86362001)(66446008)(8676002)(508600001)(316002)(64756008)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V0s4V2Q4ckk0dVVkbTNnRDl4ZG1tUCtJM1FQUDJYc0pYRjdsN3pRNm0zZG1B?=
 =?utf-8?B?VkxvWkk5SG5pQjlkT1UwUkhXMExMbUFWMi90KzRYV3dvZFJZR0lSWG1iMXZH?=
 =?utf-8?B?eGpua08vSERneGlTZEwyR0MrWGFjaWJEVTVScnl1VDFPQWFScGNkR0xQQUFR?=
 =?utf-8?B?VmdFRGZkOXN3Tm9Ndk5hOWh1WmtaVVZrME93SVRhaTFTSVNuV3kwWUlpRXo0?=
 =?utf-8?B?Q2NPNVJnaXlyMlpzMzFaTWF4VkxiM3NMRjJybCt6NysrR1UwZmdZZktOS3B6?=
 =?utf-8?B?cXlmT2NWWGp1UExyQ2p4RmJxZjdHWHhENjdaajZQcTJNeWNvMm9OeTFNVTBI?=
 =?utf-8?B?SFcyTXVrN21NYU9tcXNscXc3MFh0VjJwQVV5TjBVc0liR3FYSGM4TTFRdFNa?=
 =?utf-8?B?d24zVU8xRkdWbFkvTDJxVStKc25ycGhaUHBjcURjWHdhN1NtWStrZmR3OGhM?=
 =?utf-8?B?RkxnZEo4RzJHelNiWitUTXo3dE1UcEllOEUyTTZSL0VUaGRXdHhuRTNTcGdN?=
 =?utf-8?B?VnJFR1VNbUlyZHBPMHJVSnI5dWFOMktUaGhDOE11aEV1QVhBUERTUVdiSEV6?=
 =?utf-8?B?N0ZiQXkzRUY0cnNwRmdac1FCckc5R2h4bDdMSHlmSFM4aTFaczFtcmEzZFJC?=
 =?utf-8?B?TWJ3WXQzVlZhVWM5SGxzdjMyUkR1K2xuQzFITTc5dW1rZlZzcDV3WDZTNS9m?=
 =?utf-8?B?cW9jZm9EMDQrM3VCQkVWNUlkS0pGQzUzN1diUTNYaXpKZWpaV2h1RGVwbjgv?=
 =?utf-8?B?akxsUDhLdXd4OU9SaXlUd3Rub1J4UkJ2NDZsaExBdGtHd1NxTGlTWnBFNmhw?=
 =?utf-8?B?cWQ1eWE2UlJ6eEhaeHhZNjB2N3RBc0I2WHA5cGNtalpGOG1XaDg1WkVvOXdx?=
 =?utf-8?B?QWxabDRvZzBJYWNSUFRyZFB1Y2xzeTVBa2c3SmJ1R3pCTitVVS9PakVnZkZy?=
 =?utf-8?B?QnVyaWptby9yZS9EN2txV3l1eUVHakdBOGpBM3pxcGZTSVRYQXNJRXRvUHBW?=
 =?utf-8?B?a0tQYU56QkRtVDN3SnFoWmVUbGhkY0c0Q2h1MzRMNmM4Vjd6cHVNVWY5RGVN?=
 =?utf-8?B?OVowOFBGQmg5ZjM4Z3BnTmFNZzY2VllFNUMxUVdLTWVtZ1BFR0hmaVZUckIr?=
 =?utf-8?B?eEUzdktmU3BkUUpRTHVtWTNDSlNHUlBFN3prN2JUZFkrVTN2Ri9yRDRyT0o4?=
 =?utf-8?B?d3UzOGJjTGxQYjFVQUpzWThHNnRlQzJ3WTBmcGhKZUUzaS9FWWFjeDVZMmYz?=
 =?utf-8?B?VXVVV0FQdDdGUmdSajFZRjBZTm9BdHVzNGhsbHZxYWdFekJrbkNvT0RJdENo?=
 =?utf-8?B?RkJZQy9IT1dEWUZLWWU0Qk5TN3Z6aGZPVmFiNU94bWh3ajNqL2MzUnl4b3dB?=
 =?utf-8?B?Ukc4NG5kdUluazE4ZmV1ZnlFWGVZZXlESmpZRW11T1hVWVM0S3lCQ1daakJx?=
 =?utf-8?B?M3ZtNEJlQ0dJWis1RldwNzFmTXo3cGE2L3gxSTR3Q2xaTVJWK3BLVjdyd0JW?=
 =?utf-8?B?VXAvNkY2dzlwbGpaYTRyWC9ac0hGREk0a2FyYnhtS1JCNEZEUlhKVWhJdFdx?=
 =?utf-8?B?ak5aOU42enFiaVpYZXdyVytmNE9RS2hwMk56SE0wdTlOcGZzUDJlRzlQZUE5?=
 =?utf-8?B?SVVrdEVZVDBxbTA4Q055akxiM0E1cFFwNHQ0QXRPeXl0N2VRTk53QmdtM21j?=
 =?utf-8?B?a25TS3dMZW83L0w0VTR2SFRDZ2lhQ2pxemxNRytXb05jNm9yaGVvUUE3NC9j?=
 =?utf-8?B?ZmlLNWFoMlk3aXpzWVpTSE1nS0RNYUhUVk5seGV4UFpBbzloV2NWazVtdU9Y?=
 =?utf-8?B?NzZaV3RvUDRsQVZjbSs3MFhVMmFpNHczbXRDVDVjc0JVaHJST21wVHBtd2Jh?=
 =?utf-8?B?Ym0vZ3kxclVGcjNibGNLaVFmUjlsd1cwMTJzMW5kUDBIdzhXYS9rTDQwU1RV?=
 =?utf-8?B?dllhd2JQTXZ1OUU3blVJVUtlSVpuTUJLYVlyaEhJbEw1NmgrMjhuU0JrQzhq?=
 =?utf-8?B?bDNDcUNoZHQ3Wmh0STR2WnlPZFdLdHNKZXpkcXQ5WGJMOXVqQ3FLQUNNTHQr?=
 =?utf-8?B?RHFBRTNtYjJvd2MvbnJUTUxranJ3YTJyTUdmdVJkQlIwVktWNldObVM1aFdJ?=
 =?utf-8?B?S01tZ0VKQ1ltM3ZsSVJlY29YQU5sU1FiZzZmTkFHWm8xVWJJN2dmdkFwODl3?=
 =?utf-8?B?VHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3495.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8864245-aea7-4c52-5544-08d9f55b86c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2022 16:59:30.0228 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E0eBiIHbw58ZmKyo43+xYpV0ijSdmc1RhtczC5+CHSsoHbf4R4zHz9+5tPcFe0JUB2tn1M2XTPF7fkreBcIogg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB0008
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.151; envelope-from=haiyue.wang@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "open list:Block I/O path" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQZXRlciBNYXlkZWxsIDxwZXRl
ci5tYXlkZWxsQGxpbmFyby5vcmc+DQo+IFNlbnQ6IE1vbmRheSwgRmVicnVhcnkgMjEsIDIwMjIg
MjM6NTUNCj4gVG86IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4NCj4gQ2M6
IFdhbmcsIEhhaXl1ZSA8aGFpeXVlLndhbmdAaW50ZWwuY29tPjsgRmFtIFpoZW5nIDxmYW1AZXVw
aG9uLm5ldD47IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsgb3Blbg0KPiBsaXN0OkJsb2NrIEkvTyBw
YXRoIDxxZW11LWJsb2NrQG5vbmdudS5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjFdIGFp
by1wb3NpeDogZml4IGJ1aWxkIGZhaWx1cmUgaW9fdXJpbmcgMi4yDQo+IA0KPiBPbiBNb24sIDIx
IEZlYiAyMDIyIGF0IDE1OjAyLCBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+
IHdyb3RlOg0KPiA+IFNvIHRoZSBRRU1VIGFkZF9wb2xsX3JlbW92ZV9zcWUoKSBmdW5jdGlvbiB3
b3VsZCBkbzoNCj4gPg0KPiA+ICAgaW9fdXJpbmdfcHJlcF9wb2xsX3JlbW92ZShzcWUsIChfX3U2
NCkodWludHB0cl90KW5vZGUpOw0KPiANCj4gX191NjQgaXMgYSBsaW51eC1rZXJuZWwtaXNtIC0t
IHdlIHNob3VsZCB1c2UgdWludDY0X3QsIEkgdGhpbmsuDQoNClVzZSAnKF9fdTY0KSh1aW50cHRy
X3QpJyB0byBmb2xsb3cgdGhlIGxpYnVyaW5nIGNvZGUgc3R5bGUgPw0KDQo+IA0KPiB0aGFua3MN
Cj4gLS0gUE1NDQo=

