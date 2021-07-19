Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 796633CD5B2
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 15:30:10 +0200 (CEST)
Received: from localhost ([::1]:42894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5TLV-0007DL-2Z
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 09:30:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1m5TKM-0006Y9-SZ
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 09:28:58 -0400
Received: from mga18.intel.com ([134.134.136.126]:52496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1m5TKJ-0002f4-SH
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 09:28:58 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10049"; a="198326460"
X-IronPort-AV: E=Sophos;i="5.84,252,1620716400"; d="scan'208";a="198326460"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 06:28:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,252,1620716400"; d="scan'208";a="495801921"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 19 Jul 2021 06:28:45 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 19 Jul 2021 06:28:45 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Mon, 19 Jul 2021 06:28:45 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Mon, 19 Jul 2021 06:28:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f9bjLi/Cf/dNzNc3cmIPNKKqN59M4UyfjzWSdQpqlu1XxM3nkZHrS2q1IPS7cEVkgI28EwsXoj6H6AawV1PoKKBcUTxWE7/ykZ0LE7MfCJ3VBhTxEhwBvSpM75U/fEmVBSYEw6Zxts54XDUh+XXFbZUkxb7ttOp/yVSdKCvNINTwVtgaZEJ0g1RCc+d4k7oCGi5h40lLtWxUj+M6kdjx1RxORiA4889yR7JtElkuZVgvEhvep66k4Vjvvm3wXJyWYRPL4jdOuqCvKWVmXN4NerRuTZbZkNLaMrpPAjoN8iuBI45upZQpVO2TAo3Yol5jkv53sq4JsCLTEbbXhz55qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u625crfMF3m/BaijbPTv61qCXZCGAISrjq/78AF/UBE=;
 b=afNy8pW+XgWBcABv5oVgA4tPZuQC7fXAWDWMWsuZCeuZWb5HOZV4oU8SdnTQ11Ug8GRlsST9KzdGR8dmkhgTI7ruRpYyBgjEYecO1FbEX9LOKGxR9Zmzy3kTSwLR7F88o8A81jVkdeoaSgF8a4DLhb2G4wBC7PUun/ENGKA3SB9pYMg6/Wqh7OlaTMrxXXh9LgjehWt8+2xQXhOWjRXUCQf2EhV/+x8BOwCE8Jh5hEWF5vVrDLH+Slqf8s7QuyRULmOYa4oUhN5HgwPOA1uUY9noSITdKBmxtMXNZ22FgKxr6qKe3KOH+TC67W4D9ePSmf3nXzZKQXSaYmSv7NkvOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u625crfMF3m/BaijbPTv61qCXZCGAISrjq/78AF/UBE=;
 b=V8YhOhaCb3Kgq+NH3K92Y3GHHmlN0w23CmICmem2+Onn19dL1LsSjYZVD6A9ZKi9fF+GzMBHAAmxGEVt59AArJi+eMOi0kwHeTFEGCFJwUviI8NO/RW0FMclmq2nAR9CfMvIdMSGEBwPaO7Vh0k0UD6we5+AU9zR3KLDSFbHfT4=
Received: from BN0PR11MB5757.namprd11.prod.outlook.com (2603:10b6:408:165::23)
 by BN0PR11MB5757.namprd11.prod.outlook.com (2603:10b6:408:165::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22; Mon, 19 Jul
 2021 13:28:38 +0000
Received: from BN0PR11MB5757.namprd11.prod.outlook.com
 ([fe80::d4a2:4607:7235:c6f6]) by BN0PR11MB5757.namprd11.prod.outlook.com
 ([fe80::d4a2:4607:7235:c6f6%9]) with mapi id 15.20.4331.033; Mon, 19 Jul 2021
 13:28:38 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: RE: [PULL V3 for 6.2 0/6] COLO-Proxy patches for 2021-06-25
Thread-Topic: [PULL V3 for 6.2 0/6] COLO-Proxy patches for 2021-06-25
Thread-Index: AQHXfH2tmH2o5+Zx+UCOw7dt03KBBKtKBVsAgABFFIA=
Date: Mon, 19 Jul 2021 13:28:38 +0000
Message-ID: <BN0PR11MB5757C87D6320D7C26CC2C13D9BE19@BN0PR11MB5757.namprd11.prod.outlook.com>
References: <20210719090051.3824672-1-chen.zhang@intel.com>
 <CAFEAcA8Z6Nm6DABFOyv1pVEK=CbXdnhpYp6jE7i8ztw5mi+8gw@mail.gmail.com>
In-Reply-To: <CAFEAcA8Z6Nm6DABFOyv1pVEK=CbXdnhpYp6jE7i8ztw5mi+8gw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 429e6c33-22ba-47f9-c0f1-08d94ab91e0f
x-ms-traffictypediagnostic: BN0PR11MB5757:
x-microsoft-antispam-prvs: <BN0PR11MB575731B7B087BAC8AB175E459BE19@BN0PR11MB5757.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dOFknrxv6cKFDn4fceHCdlsCa9cm2+QKvZpmW+OCKOM046RdA6Km6kkPVGw7DCIRfKmtVqoeu6y7ziwAp5gltZUNZwaR8Y0JNU48liul0EG5ksHa7ObzEvRcSd2jhvbgCq224RwFDHghkn6uoMV8plVqQJ27su0XbNH2ZvVRn4IRoeE2qJqkroDOEvDMCHViE425PqBpi78wvUwLfWaHEHKDaV5A1JRiAZCMWCdTjZHgghqdTzGjpgvD5p+iN4lJ8BrS41WHsKqZvtDUZ01S3Fs4xEX98T9ms4Qtnji23CSWhBEvt726bBbL/lZb07xZYXL9gtMYGJ0MIHLg8NkU4CBJmLVT5RDmQld42f4MuaFZ5KDG0FJlcPbayOfrOzVuLVWyMdj7CWaV41Ac7+oAK5iQeLdbVoIEcmWAlb2J2AWQ4toxUkON4x9rvb7kYhC70vr25BbStMQ7yd5MQDrPUuM+sDddOVtIjAn4+rVePL7VHLm7v2F1zVZsX1TVJv/CkXpX8WcX/2rm+h4wmAKmwArbBd8NV0Pz1v+3aCRdaXJw0VrTAUlB89WdeiIkbxzXKUQXY/1YobzpLN+1ddUgcP7tMBOhSHYAjVgfy/OFcuWxUDBc4PYKUkv5FZUds41J7G4qg6KygboxYNPEcCFl9hnzeBedpatEwDMQnVtvog65LmVnAsG2ejGhAb+7K154snMtTdHNzDPI26UjT1c6I83ApVzIdMbtrpadrWiF3amjFVmivCa0dVY5XGsSYrJtvmw7ZboCYxkbOv+bjgZTKwFWd0ZIdc3afF0G7a+NO6c=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(33656002)(316002)(86362001)(966005)(186003)(6506007)(7416002)(83380400001)(53546011)(5660300002)(52536014)(54906003)(6916009)(8676002)(2906002)(508600001)(9686003)(122000001)(66946007)(26005)(7696005)(8936002)(55016002)(4326008)(76116006)(38100700002)(71200400001)(66476007)(64756008)(66446008)(66556008)(38070700004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ay91bDltQTliYnpyWm5pZVZLdUtFSWVKZ3FvL1ZnU2F5U0RDR21RWlJDK2Fq?=
 =?utf-8?B?cm12QTZDZklxektyK3ZZWjQ3WUFReU9FTjR6ZlpSTXh3STNBZEhvY0hFQ1B5?=
 =?utf-8?B?ckZQMlJGRGxHUUxWcTN6WTJ3a0FqK01ubWh3ZUpvVXlUaWMrMm5hRXo0RVg4?=
 =?utf-8?B?VFRXSC9hd25lcGxSSXpTTnhHUURuS1VaNFV5dTRTMG5SMW9LNkxmTUxMaXUy?=
 =?utf-8?B?d2dMVXRVR01jcVNuc2ZuQUw4ZnVHbzdrR1hqTzREdGhBSVFwcEJsN1VMTUlZ?=
 =?utf-8?B?RnlnMHlSS0tlbEcwMlh4bmY4cmxQQmNteDZaNkRibjcyU3JYREtYNnFVUDh2?=
 =?utf-8?B?YUFVNlFNWEJNR0dObWduczkzd29xR0JOZUI4TnFKajQyZXVYT1lHcURkUExR?=
 =?utf-8?B?ZEtBVDFYZ0NlYjE2cVRZR012NlR5SlgvY2lGcnRtWVhJQlFZeW9YUXI2cUdP?=
 =?utf-8?B?UkZCTFZLdUNRV1RQUmwzTVlUaTNwcGhzcDFvYU5UM0xsaUxxRFJ5RXJadFJM?=
 =?utf-8?B?V1NIM1hrRG4vRUIyYUJERGJyUWF0cC9Oeno1eDhyNEFyMis0UHBmWW5CK09F?=
 =?utf-8?B?cFI4VTNsL054L252aklwclNJUHBaVEU1QVJUS25IeHU0SHZNY2U4Q3RYRDZO?=
 =?utf-8?B?VEt2eWJHdEU5NGhIdi8zMFVIY08yVTZwUEZ5TU01L1prcjFiK0ZoK0ZVWVJo?=
 =?utf-8?B?aE43UnYxUFpsWGN6Z2ZtamRLenZGMlRmY0N6TjlJdVN1RVZJV0VkRWRwK3JU?=
 =?utf-8?B?ODN6SFpDT0JmMDEwZHptZ3NWR2pFQm5OYm5uaGRrK3hodWYwbnRRRjFRK1hu?=
 =?utf-8?B?WXRkOENBSElKYzRSaHhqTkhta3cyay9WSmxPOW9OWmpydnpEUnVsUHROd0t3?=
 =?utf-8?B?YlJtaGNNTUFmRWJaOUcwMHNEN05xY2FlMG9RSkh6V1I3U3hIeWpmbjZBY2Fa?=
 =?utf-8?B?NDVsai9TOXdaUWwwN05MUFlpQTFaNTRKY1ZOWXlqd0grNmdLenppVXUzN1Ex?=
 =?utf-8?B?U2FxdHVUVWpoajRVQkdNMkxsaHM1UXJyZUlOQTJaZlA4ZkUzRzJCWm02cDRT?=
 =?utf-8?B?V3ozbnJweTdGbXdobFNiRml6NnJFcmtOY2phSnFPVnZXYzFPbEFFNmU1V2JP?=
 =?utf-8?B?azdxUmpaUU9NampTVERvOG95NjdPcWFkVHVhZlBUK0lXcDNzb2dhZnRBeUF2?=
 =?utf-8?B?eEJKcVp3WUxpR0dRR2VqUW1pR3ZEV05YQU9HSDBHc3R3WUtJZ1ZtbVlEUXZu?=
 =?utf-8?B?alpkb1A1UUVlcGl2Q0hFZlBPVHBycFVEcHhYSVUxcmtSTlg5c3owcnBIdE5X?=
 =?utf-8?B?S2xDUFh3V1hSTnRwQ1VEYmFHS3QwZDdpWGxROEx2bEhCWklNQkRCb3BLbjhG?=
 =?utf-8?B?L0l2VTl1K2ZqY05sb1UxUHRzMW1jNW9lY0FTMndnZUdYaDdxQjQ0VjNOZzlU?=
 =?utf-8?B?REpiSnFoT1VDTTVwVndOb2twTzZiNGdteXlxNGdsUXlGTkRHQjlSNmtham16?=
 =?utf-8?B?bEpqRHpBMy9vMGN1aGNHOUVqSGJHSTlFbWxJUVZudmJkVTdBK3ZvZG9BZ0xx?=
 =?utf-8?B?V2JaNHp2K2tkeTJ5Y1Vkanc2djIrdmV1SXRvY3RsNVNIdEVoUnZoZXRaQ1Zi?=
 =?utf-8?B?czBmTEhVaEhVZkxCb0FXZXJZck83WEpLWjdJbVVMSUEvS0Ztc09ROWtPbWRV?=
 =?utf-8?B?bTdoRjNBNkk5alhjdWErNlVCVEFDVG5yOGF1YTRSajhMRlVlYU1JVFA2bTFj?=
 =?utf-8?Q?Ti14xNMwcOlvRQlEzdbYsM8eFMH3h2ywh2LpzBY?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 429e6c33-22ba-47f9-c0f1-08d94ab91e0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2021 13:28:38.2543 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /FV9olKCsAH6dQE4BFqeW/bEYLZIrZoRCpvo4lfd/7/Sqd6ydcg78PJQEcfYqPlCX99TEIE1wqKU+14h8AcRdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR11MB5757
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=chen.zhang@intel.com; helo=mga18.intel.com
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
Cc: Lukas Straub <lukasstraub2@web.de>,
 =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, qemu-dev <qemu-devel@nongnu.org>,
 Jason Wang <jasowang@redhat.com>, "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGV0ZXIgTWF5ZGVsbCA8
cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPg0KPiBTZW50OiBNb25kYXksIEp1bHkgMTksIDIwMjEg
NToxOSBQTQ0KPiBUbzogWmhhbmcsIENoZW4gPGNoZW4uemhhbmdAaW50ZWwuY29tPg0KPiBDYzog
SmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT47IEVyaWMgQmxha2UgPGVibGFrZUByZWRo
YXQuY29tPjsNCj4gRHIuIERhdmlkIEFsYW4gR2lsYmVydCA8ZGdpbGJlcnRAcmVkaGF0LmNvbT47
IE1hcmt1cyBBcm1icnVzdGVyDQo+IDxhcm1icnVAcmVkaGF0LmNvbT47IEx1a2FzIFN0cmF1YiA8
bHVrYXNzdHJhdWIyQHdlYi5kZT47IERhbmllbCBQLg0KPiBCZXJyYW5nw6kgPGJlcnJhbmdlQHJl
ZGhhdC5jb20+OyBMaSBaaGlqaWFuIDxsaXpoaWppYW5AY24uZnVqaXRzdS5jb20+Ow0KPiBxZW11
LWRldiA8cWVtdS1kZXZlbEBub25nbnUub3JnPjsgR2VyZCBIb2ZmbWFubg0KPiA8a3JheGVsQHJl
ZGhhdC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUFVMTCBWMyBmb3IgNi4yIDAvNl0gQ09MTy1Qcm94
eSBwYXRjaGVzIGZvciAyMDIxLTA2LTI1DQo+IA0KPiBPbiBNb24sIDE5IEp1bCAyMDIxIGF0IDEw
OjEwLCBaaGFuZyBDaGVuIDxjaGVuLnpoYW5nQGludGVsLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBI
aSBKYXNvbiwNCj4gPg0KPiA+IFBsZWFzZSBoZWxwIHRvIHF1ZXVlIENPTE8tcHJveHkgcGF0Y2hl
cyB0byBuZXQgYnJhbmNoLg0KPiANCj4gSGkgQ2hlbjsgZm9yIHRoaXMga2luZCBvZiBwdWxsIHJl
cXVlc3QgdGhhdCBpc24ndCBpbnRlbmRlZCB0byBnbyBkaXJlY3RseSBpbnRvDQo+IG1hc3Rlciwg
Y291bGQgSSBhc2sgeW91IHRvIGZvbGxvdyB0aGUgbm90ZXMgaW4NCj4gaHR0cHM6Ly93aWtpLnFl
bXUub3JnL0NvbnRyaWJ1dGUvU3VibWl0QVB1bGxSZXF1ZXN0DQo+IGZvciBub3QtZm9yLW1hc3Rl
ciBwdWxscmVxdWVzdHMsIHBsZWFzZT8NCj4gDQo+ICMgUHVsbCByZXF1ZXN0cyBub3QgZm9yIG1h
c3RlciBzaG91bGQgc2F5ICJub3QgZm9yIG1hc3RlciIgYW5kIGhhdmUgIyAiUFVMTA0KPiBTVUJT
WVNURU0gd2hhdGV2ZXIiIGluIHRoZSBzdWJqZWN0IHRhZy4gSWYgeW91ciBwdWxsIHJlcXVlc3Qg
IyBpcyB0YXJnZXRpbmcgYQ0KPiBzdGFibGUgYnJhbmNoIG9yIHNvbWUgc3VibWFpbnRhaW5lciB0
cmVlLCBwbGVhc2UgIyBpbmNsdWRlIHRoZSBzdHJpbmcgIm5vdA0KPiBmb3IgbWFzdGVyIiBpbiB0
aGUgY292ZXIgbGV0dGVyIGVtYWlsLCBhbmQgIyBtYWtlIHN1cmUgdGhlIHN1YmplY3QgdGFnIGlz
DQo+ICJQVUxMIFNVQlNZU1RFTSBzMzkwL2Jsb2NrL3doYXRldmVyIg0KPiAjIHJhdGhlciB0aGFu
IGp1c3QgIlBVTEwiLiBUaGlzIGFsbG93cyBpdCB0byBiZSBhdXRvbWF0aWNhbGx5IGZpbHRlcmVk
ICMgb3V0IG9mDQo+IHRoZSBzZXQgb2YgcHVsbCByZXF1ZXN0cyB0aGF0IHNob3VsZCBiZSBhcHBs
aWVkIHRvIG1hc3Rlci4NCj4gDQo+IEl0J3Mgbm90IGEgYmlnIGRlYWwsIGJ1dCBpZiB5b3UgcHV0
IHRoZSByaWdodCB0YWdzIGluIHlvdXIgZW1haWwgdGhlbiBteSBmaWx0ZXJpbmcNCj4gd2lsbCBh
dXRvbWF0aWNhbGx5IGlnbm9yZSBpdCBmb3IgbWUgOi0pDQoNClRoYW5rcyBmb3IgcmVtaW5kaW5n
LCBJIHdpbGwgYWRkIHRoZSAibm90IGZvciBtYXN0ZXIiIHRhZyBpZiBoYXZlIG5leHQgdmVyc2lv
bi4NCg0KVGhhbmtzDQpDaGVuDQoNCj4gDQo+IHRoYW5rcw0KPiAtLSBQTU0NCg==

