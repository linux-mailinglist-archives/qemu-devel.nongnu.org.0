Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2201F36EEE9
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 19:31:15 +0200 (CEST)
Received: from localhost ([::1]:43468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcAVN-0005eh-SM
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 13:31:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <james.r.harris@intel.com>)
 id 1lc9tH-0008Mh-Js
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 12:51:52 -0400
Received: from mga04.intel.com ([192.55.52.120]:48186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <james.r.harris@intel.com>)
 id 1lc9t8-0008H7-P0
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 12:51:51 -0400
IronPort-SDR: ej8Q0EYczMXkTK2hSxVkBR6R8eZtAREh+8iS3z2iqQK5ec1b/vuxsAvBJp4/FGpfrzqlsjWzWs
 hWw1dH5WEQZw==
X-IronPort-AV: E=McAfee;i="6200,9189,9969"; a="194945046"
X-IronPort-AV: E=Sophos;i="5.82,259,1613462400"; 
 d="scan'208,217";a="194945046"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 09:51:32 -0700
IronPort-SDR: VNFu4Kd2op5gBGu1ffEOl+l7Kb176K4iHhS47TUIQVcySOGiiOkcBY7aZJI8DbwM2Gfrp2Kl27
 I9z4wvHONXLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,259,1613462400"; 
 d="scan'208,217";a="387013056"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 29 Apr 2021 09:51:31 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 29 Apr 2021 09:51:31 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Thu, 29 Apr 2021 09:51:31 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Thu, 29 Apr 2021 09:51:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NtVPXkU92rlW9AjwbTt5cFsfvS9s9sfsbOj+Z6aotmf4PmEHM8Dzg+2GNq06k2HhRn1CAjPHzOuKAdOU6HnJoVgu2lBDQIn0Jg05NGW40mJEoyAJqneYjq1R6N8mZhIPOAvi6rPu4eQxc03tQ7VZTi36FmO+7xax2JIgObxdI0Y0nOIhaqklneyB4LDtsZgjgXUG4rYC592MPii8sW3MJcHOEU6QRTwyRQX+FG+p7BBqGK1JNocwu/OkE0Egugxg9xY4GZIQ2qNS9UxW8sRmgJHnlcWbuBKcGFZHAbWZ6zsyfcydZ+hNypWs3nx5XbFrn0cRvdeqaaVnFsPylSVkFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9/kpdETD302PEG7itR61UjxJyMzlnQ+zry6BN+uJzc=;
 b=TuxRCgwqYnBzH2hiItDiQpEmzYOgb6nuFlaGdWakLfsFDdU4ebCx+m6p4Ej7TXspTwcRDz+KBz47ANCwvGxTPWnEabOdpg8U4DsRAiSMRWtg0n7z/HQPZpZHgewUOAqepCaa11X6Ta3PpnZziFYDwFz7v9UXCewY4JgRFW6p4XOQrVaAigrPlVPlkIo9qXUv943n1yqx1GcUDymUWXvTPpNu85O+fYcagJ5tyiv3GI119cHYWPyzJoXLQRTCmz7Q9WaMhmiHXgKM+wIQKnJmp5oSBW5seoL1XucxHS3PvD/uhG+IIIHzVlnQ8XRbIfVgETuTGOpa68MHCWzjFocKFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9/kpdETD302PEG7itR61UjxJyMzlnQ+zry6BN+uJzc=;
 b=fy7FKve95TugGEE25DcNUC7aSwwL0KQ0GAfQvEtdKHQDKnGiHSV1dzbh9IyuPh96pcOubFsKjg1BvW8iWhJhxA9vfPX5b8zDdxKW3oRkRVIt/2n9JHA7ybjTn9VW0pw7H1Cna2h4Yw9zvkaRIolFQ8fIOi5o0yQniUiA37E0bAo=
Received: from BYAPR11MB3303.namprd11.prod.outlook.com (2603:10b6:a03:18::15)
 by BYAPR11MB2920.namprd11.prod.outlook.com (2603:10b6:a03:82::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Thu, 29 Apr
 2021 16:51:29 +0000
Received: from BYAPR11MB3303.namprd11.prod.outlook.com
 ([fe80::40d0:4886:b425:de80]) by BYAPR11MB3303.namprd11.prod.outlook.com
 ([fe80::40d0:4886:b425:de80%4]) with mapi id 15.20.4042.018; Thu, 29 Apr 2021
 16:51:29 +0000
From: "Harris, James R" <james.r.harris@intel.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Klaus Jensen
 <k.jensen@samsung.com>
Subject: Incorrect NVMe DLFEAT?
Thread-Topic: Incorrect NVMe DLFEAT?
Thread-Index: AQHXPRfmMiwgBtVU9USLKoXiSKZQ2w==
Date: Thu, 29 Apr 2021 16:51:29 +0000
Message-ID: <F676026A-C861-410E-934F-1BBAC20CDCE2@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.48.21041102
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [70.163.214.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 89f6527a-845c-42a2-1cdc-08d90b2f0972
x-ms-traffictypediagnostic: BYAPR11MB2920:
x-microsoft-antispam-prvs: <BYAPR11MB2920A4C431A28A23170633ABDE5F9@BYAPR11MB2920.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1775;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kJcBOyWsgWn/nA8A2W2psFiQa2xHxk/V3OZvlrfO+7SiiCXb7cTvXKHoPPeiceCafcVr59Rh3SCgLHIsR91E05ZJs+SV/ZX0KRmL9ffaojtkSjQliyGc+H9TYPtCVtFbuGuRapmocc8CFnqOctExytVWvI19fkldi73UFsNeFeO0V6yaPPswBQFfaBjyerXaUqhIWpIeB5NtmGzvsEtv5wdAiqqocE+0SJUiZt2uOSk0JcFRXBRdL9g8zOdt7Bgf7+7ilUHV7plFfvzGmfziNb+BLk/1xVmKMn83ftRhJ8VQCd4F1LJybu+wRSuc0OWTgEhOId1/uqQaQA60y5pdoRIaC8OjbS1RuWsUhdBatjLeRafOsucNj9vtNx0R2z16ZK3QV1h6BUn0IhlhnwzvZkHxNvgl8cKY/81/RW6B9lQfVfDbmkWU+xZzgb9NODckPGHXQJfqL1DW0yxkgosRJuIBWeZ99SOeGDiNLNeLoGacw5ZnSFEDRa3pK65zMtOp6yCj0DAGy3qM638PpdzNsHgH05un0c57Ijs5anWfYseA3BTjL+7qkCgNnb7EHhj6zoSIO640G+TPnD1pRh3zMlhD9gUr3+vL9JkbMXDKPi1jnN2Ke7reMl063230pvZdghlbF+U/fqAgmH++jfeb4Ya8yoJ8DBDJ2h+7mRD7y5E=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3303.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39860400002)(346002)(396003)(376002)(136003)(2906002)(66946007)(33656002)(5660300002)(6506007)(64756008)(71200400001)(66476007)(66446008)(66556008)(478600001)(36756003)(110136005)(6486002)(2616005)(76116006)(91956017)(8936002)(38100700002)(3480700007)(316002)(83380400001)(8676002)(122000001)(6512007)(186003)(26005)(7116003)(86362001)(4744005)(9326002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?eXhWZDdFU1hEWGYxdG40UW9BVXdiRnR6WEMyQVhxSG5FMjZsRDdVZlpDb3FC?=
 =?utf-8?B?SzNEVERncXlzVUtvTVdpbXNpZXM3SDlLRXZSamo0UFREOXRJRmJ5ME5qbWEz?=
 =?utf-8?B?YkF5SUFOT3g5enBaMkxTTndDSjloaEhQYVdWYkZBTlg0SG04QytTM0phcnF0?=
 =?utf-8?B?NkNZUnhNKzlhb2hva1FQMHFoQXorT2p1TWRJMlhCREhOdTVzUks0bkNNSzhB?=
 =?utf-8?B?RSt5VExRdHYzdkNzd1diZ3JpZEN2eDVaa3U4UU5CRVUreUM2TnhUQS9oWmJ4?=
 =?utf-8?B?Z0FQMXJxSnBnK1BuT3hneXNHc3JqelpicGdPTWp4RWk1bkdoNit3V1ZaN1NF?=
 =?utf-8?B?N1UxSXdSSEtqS0g1ekNPRmdMMlJ5blc4d082NStrNVVkd2pPQ2wxeS9KUnVB?=
 =?utf-8?B?VUpNbmgxenNFbmdYTllhdGV2VzJHd01HWi9XSnpUSUlVVXBmbEtDenVPVEw5?=
 =?utf-8?B?dEdDT0czOVgxcERLYngzeWZCTld0MlVVSGQrMjNlVVlUMk1BTkRYdTQ2ZXZP?=
 =?utf-8?B?dlFibWNEVlZXNXNGYk1keTRyUnFXOHNSU0tobzBUK29uay9uVURMd3B1bnl6?=
 =?utf-8?B?UEdPMlUrV3pEUjhQQkpsRTlRNHY0ZkRUUXhJQi9CQllXamJEazZlUndXa0tu?=
 =?utf-8?B?MjcyRjNQWjV1aE1salovSUNrMEh2WnVuM2NOcXlXSjQrZFJJWk9EaVBtS2Zo?=
 =?utf-8?B?bFZBT1BORkt3TWZQMXowbXdwRGRkMWQxLzBVenRuQVowemNjUWs1ZnlTWk5x?=
 =?utf-8?B?S24ycnRhb284blo4R0FCaERWdlJWRUZkNmk4bS94eERhQWZGZlNqY0d5eW1k?=
 =?utf-8?B?WHliTWpVRjAzZHRQKzhKdjhBZ3RZeGhDM0t2ajEySzJydStpdnByVGt5QmRz?=
 =?utf-8?B?Y1BsbTh0bHdGV0VvbnBKdEE4T2hZOUJaS0xyVkR5OUpZVTNsSi9GbVphRzNr?=
 =?utf-8?B?RktMOW1hZDRaeHJvV3BSOGY0K1B0MEFtNEZ6Wk1iWm9YbjBUVUFTU3ExOG9N?=
 =?utf-8?B?QkdKTEhZd2pFdURBZ1hQL1luU1Fha0U2RldDUzRpNHdsVTdUWTNGcTdUYlgx?=
 =?utf-8?B?SUU3S1BhVGRTUnJvREtZZWVxT0pMUzU0MStLR0JZN1dVeVRoMjNVTHJLZENu?=
 =?utf-8?B?TWpWZG1zV2NERUZ4WnIyendWcGJrU0xqblhnTS9FazdPM2J5b2hRWTAycTFw?=
 =?utf-8?B?RUYrK3FiSHZtOXBqc29xUDZZdTE5bXI1RmlsVGdta3VQemJzSDFBMlpjNkFz?=
 =?utf-8?B?VlIrNllCZ2xDWkdxZzRxakc5VXZhOHB6YzRxNnM1dks5SlJZLzAxZGlFMWZ2?=
 =?utf-8?B?bXBFZ2t0RTFPdmljNVl3cEdEazgvWnVmelhJY0JvanlYV2VkOEVwRXRTVW41?=
 =?utf-8?B?eEFPYVViVkwzNDNwbTEySjl5ekRGdlBSRzBKWXArTEhROXZ0c0pYUzh0aTNr?=
 =?utf-8?B?bDY1Vk1Vend1Y3ZDU1IyT1AzamZYWGVURWRSbGJPM2UwdGs1WCtnMWNacHZ6?=
 =?utf-8?B?U29oeFFBZk5vM3Y3cEpZd0JGekJHcWF5N3F6bTd3TFRscm1BeDZ3anNzSDZt?=
 =?utf-8?B?NmxscEx2K2hkNjBjbUtiQmZ6UFdvTW5CNzlJNnZuY1E0R29HdGhqejBWRnV5?=
 =?utf-8?B?RU5DVWVMVVdSOC9waDFSdHZYTWpHRTE1MGZNZkJ2dVZaWnVWanR3ckJ2TSs5?=
 =?utf-8?B?cjhpT2ZEVjgzeVFSZEp3YUdFR25Lb0RHUE1hTHB5WUs2bktPbmR5SS9zb0JD?=
 =?utf-8?B?TEdweVlMaTRkVVpSWkhOaVhkcklWb21Rb005c2VSdThVMGt5MkNSU3BWVGxP?=
 =?utf-8?B?TWV4amZFWHZIalovdyswZz09?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_F676026AC861410E934F1BBAC20CDCE2intelcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3303.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89f6527a-845c-42a2-1cdc-08d90b2f0972
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2021 16:51:29.8338 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F2qRpjR1dedK+Jts2AFx1pETrNFKoJWuTjtM/W4ZHe8LVuoA7F7RFY2CwY5etdYbb4dSH8wQlz55EnuSCOQzCXdN5m8SleA59xzdrH5cmW8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2920
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.120;
 envelope-from=james.r.harris@intel.com; helo=mga04.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 29 Apr 2021 13:22:14 -0400
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

--_000_F676026AC861410E934F1BBAC20CDCE2intelcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksDQoNCknigJltIHNlZWluZyBTUERLIHRlc3QgZmFpbHVyZXMgd2l0aCBRRU1VIE5WTWUgY29u
dHJvbGxlcnMgdGhhdCBJ4oCZdmUgYmlzZWN0ZWQgdG8gUUVNVSBjb21taXQgMjYwNTI1N2EyNiAo
4oCcaHcvYmxvY2svbnZtZTogYWRkIHRoZSBkYXRhc2V0IG1hbmFnZW1lbnQgY29tbWFuZOKAnSku
DQoNClRoZSBmYWlsaW5nIHRlc3RzIGFyZSByZWxhdGVkIHRvIHdyaXRlIHplcm9lcyBoYW5kbGlu
Zy4gIElmIGFuIE5WTWUgY29udHJvbGxlciBzdXBwb3J0cyBEU00sIGFuZCBETEZFQVQgaW5kaWNh
dGVzIHRoYXQgZGVhbGxvY2F0ZWQgYmxvY2tzIHdpbGwgcmVhZCBiYWNrIGFzIHplcm9lcywgdGhl
biBTUERLIHVzZXMgREVBTExPQ0FURSB0byBpbXBsZW1lbnQgdGhlIHdyaXRlIHplcm9lcyBvcGVy
YXRpb24uICAoTm90ZTogU1BESyBwcmVmZXJzIHRoaXMgbWV0aG9kIHRvIHVzaW5nIE5WTWUgV1JJ
VEVfWkVST0VTLCBzaW5jZSB0aGUgbGF0dGVyIGlzIGxpbWl0ZWQgdG8gYSAxNi1iaXQgYmxvY2sg
Y291bnQuKQ0KDQpRRU1VIHNldHMgRExGRUFUID0gMHg5IOKAkyBhbmQgYWN0dWFsbHkgc2V0IGl0
IHRvIDB4OSBldmVuIGJlZm9yZSB0aGlzIGNvbW1pdC4gIFNpbmNlIHRoZSBsb3dlciAzIGJpdHMg
YXJlIDBiMDAxLCBpdCBpcyByZXBvcnRpbmcgdGhhdCBkZWFsbG9jYXRlZCBibG9ja3Mgd2lsbCBy
ZWFkIGJhY2sgbGF0ZXIgYXMgMC4gIFRoaXMgZG9lcyBub3QgYWN0dWFsbHkgc2VlbSB0byBiZSB0
aGUgY2FzZSBob3dldmVyIOKAkyByZWFkaW5nIHByZXZpb3VzbHkgZGVhbGxvY2F0ZWQgYmxvY2tz
IGRvIG5vdCBhY3R1YWxseSByZXR1cm4gMHMuDQoNCkl0IHNlZW1zIERMRkVBVCBpcyBiZWluZyBz
ZXQgaW5jb3JyZWN0bHkgaGVyZSDigJMgc2hvdWxkIHByb2JhYmx5IGJlIDB4OCBpbnN0ZWFkPw0K
DQpUaGFua3MsDQoNCkppbQ0KDQoNCg0K

--_000_F676026AC861410E934F1BBAC20CDCE2intelcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <E8296E04EDD96D49B466B3FF2D4FACCC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIiB4
bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIiB4bWxuczptPSJo
dHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJo
dHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPG1l
dGEgbmFtZT0iR2VuZXJhdG9yIiBjb250ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQg
bWVkaXVtKSI+DQo8c3R5bGU+PCEtLQ0KLyogRm9udCBEZWZpbml0aW9ucyAqLw0KQGZvbnQtZmFj
ZQ0KCXtmb250LWZhbWlseToiQ2FtYnJpYSBNYXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUgNCA2
IDMgMiA0O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6Q2FsaWJyaTsNCglwYW5vc2UtMToy
IDE1IDUgMiAyIDIgNCAzIDIgNDt9DQovKiBTdHlsZSBEZWZpbml0aW9ucyAqLw0KcC5Nc29Ob3Jt
YWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbA0KCXttYXJnaW46MGluOw0KCWZvbnQtc2l6
ZToxMi4wcHQ7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0Kc3Bhbi5FbWFp
bFN0eWxlMTcNCgl7bXNvLXN0eWxlLXR5cGU6cGVyc29uYWwtY29tcG9zZTsNCglmb250LWZhbWls
eToiQ2FsaWJyaSIsc2Fucy1zZXJpZjsNCgljb2xvcjp3aW5kb3d0ZXh0O30NCi5Nc29DaHBEZWZh
dWx0DQoJe21zby1zdHlsZS10eXBlOmV4cG9ydC1vbmx5Ow0KCWZvbnQtc2l6ZToxMi4wcHQ7DQoJ
Zm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0KQHBhZ2UgV29yZFNlY3Rpb24xDQoJ
e3NpemU6OC41aW4gMTEuMGluOw0KCW1hcmdpbjoxLjBpbiAxLjBpbiAxLjBpbiAxLjBpbjt9DQpk
aXYuV29yZFNlY3Rpb24xDQoJe3BhZ2U6V29yZFNlY3Rpb24xO30NCi0tPjwvc3R5bGU+DQo8L2hl
YWQ+DQo8Ym9keSBsYW5nPSJFTi1VUyIgbGluaz0iIzA1NjNDMSIgdmxpbms9IiM5NTRGNzIiIHN0
eWxlPSJ3b3JkLXdyYXA6YnJlYWstd29yZCI+DQo8ZGl2IGNsYXNzPSJXb3JkU2VjdGlvbjEiPg0K
PHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPkhpLDxv
OnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJm
b250LXNpemU6MTEuMHB0Ij48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0i
TXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+SeKAmW0gc2VlaW5nIFNQ
REsgdGVzdCBmYWlsdXJlcyB3aXRoIFFFTVUgTlZNZSBjb250cm9sbGVycyB0aGF0IEnigJl2ZSBi
aXNlY3RlZCB0byBRRU1VIGNvbW1pdCAyNjA1MjU3YTI2ICjigJxody9ibG9jay9udm1lOiBhZGQg
dGhlIGRhdGFzZXQgbWFuYWdlbWVudCBjb21tYW5k4oCdKS48bzpwPjwvbzpwPjwvc3Bhbj48L3A+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+PG86
cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5
bGU9ImZvbnQtc2l6ZToxMS4wcHQiPlRoZSBmYWlsaW5nIHRlc3RzIGFyZSByZWxhdGVkIHRvIHdy
aXRlIHplcm9lcyBoYW5kbGluZy4mbmJzcDsgSWYgYW4gTlZNZSBjb250cm9sbGVyIHN1cHBvcnRz
IERTTSwgYW5kIERMRkVBVCBpbmRpY2F0ZXMgdGhhdCBkZWFsbG9jYXRlZCBibG9ja3Mgd2lsbCBy
ZWFkIGJhY2sgYXMgemVyb2VzLCB0aGVuIFNQREsgdXNlcyBERUFMTE9DQVRFIHRvIGltcGxlbWVu
dCB0aGUNCiB3cml0ZSB6ZXJvZXMgb3BlcmF0aW9uLiZuYnNwOyAoTm90ZTogU1BESyBwcmVmZXJz
IHRoaXMgbWV0aG9kIHRvIHVzaW5nIE5WTWUgV1JJVEVfWkVST0VTLCBzaW5jZSB0aGUgbGF0dGVy
IGlzIGxpbWl0ZWQgdG8gYSAxNi1iaXQgYmxvY2sgY291bnQuKTxvOnA+PC9vOnA+PC9zcGFuPjwv
cD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48
bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBz
dHlsZT0iZm9udC1zaXplOjExLjBwdCI+UUVNVSBzZXRzIERMRkVBVCA9IDB4OSDigJMgYW5kIGFj
dHVhbGx5IHNldCBpdCB0byAweDkgZXZlbiBiZWZvcmUgdGhpcyBjb21taXQuJm5ic3A7IFNpbmNl
IHRoZSBsb3dlciAzIGJpdHMgYXJlIDBiMDAxLCBpdCBpcyByZXBvcnRpbmcgdGhhdCBkZWFsbG9j
YXRlZCBibG9ja3Mgd2lsbCByZWFkIGJhY2sgbGF0ZXIgYXMgMC4mbmJzcDsgVGhpcyBkb2VzIG5v
dCBhY3R1YWxseSBzZWVtDQogdG8gYmUgdGhlIGNhc2UgaG93ZXZlciDigJMgcmVhZGluZyBwcmV2
aW91c2x5IGRlYWxsb2NhdGVkIGJsb2NrcyBkbyBub3QgYWN0dWFsbHkgcmV0dXJuIDBzLjxvOnA+
PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250
LXNpemU6MTEuMHB0Ij48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNv
Tm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+SXQgc2VlbXMgRExGRUFUIGlz
IGJlaW5nIHNldCBpbmNvcnJlY3RseSBoZXJlIOKAkyBzaG91bGQgcHJvYmFibHkgYmUgMHg4IGlu
c3RlYWQ/PG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4g
c3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxw
IGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5UaGFua3Ms
PG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9
ImZvbnQtc2l6ZToxMS4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNz
PSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5KaW08bzpwPjwvbzpw
Pjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXpl
OjExLjBwdCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFu
PjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0
Ij48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4N
Cg==

--_000_F676026AC861410E934F1BBAC20CDCE2intelcom_--

