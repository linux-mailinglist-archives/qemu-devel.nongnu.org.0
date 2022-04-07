Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D8D4F89A6
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 00:14:59 +0200 (CEST)
Received: from localhost ([::1]:38948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncaP4-0003Ow-70
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 18:14:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.zhang2@samsung.com>)
 id 1ncZLg-0000QK-CZ
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 17:07:24 -0400
Received: from mailout1.w2.samsung.com ([211.189.100.11]:30232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.zhang2@samsung.com>)
 id 1ncZLe-0000mB-3J
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 17:07:24 -0400
Received: from uscas1p1.samsung.com (unknown [182.198.245.206])
 by mailout1.w2.samsung.com (KnoxPortal) with ESMTP id
 20220407210709usoutp01d79a60f0940303b6a42501e3aee8b62b~juU0HrqUu0478304783usoutp01V;
 Thu,  7 Apr 2022 21:07:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w2.samsung.com
 20220407210709usoutp01d79a60f0940303b6a42501e3aee8b62b~juU0HrqUu0478304783usoutp01V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1649365629;
 bh=8ztwd6FwriKvt2oDJnhlLB/97uMSyYNnTRn4+LhCoUg=;
 h=From:To:CC:Subject:Date:In-Reply-To:References:From;
 b=X1oXFb+H6LgZb7DePxYCMr6396xNYwXrWWvISqvAl/7hW16lJBUhLGzA4Y8WePCIt
 ya69QDK4o1hWNyRJfgSl1FtzTm7F2rd+Pb1jE58qGH9OxurW5nJUmJei7u/WVBZxAe
 XtmEU7NXppP705bJi4AMPXjpvbC0d1weOEDaukA4=
Received: from ussmges1new.samsung.com (u109.gpu85.samsung.co.kr
 [203.254.195.109]) by uscas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220407210708uscas1p29cb73242b9b16692bf37bed2138b5b1b~juUzuGxJT2037420374uscas1p23;
 Thu,  7 Apr 2022 21:07:08 +0000 (GMT)
Received: from uscas1p2.samsung.com ( [182.198.245.207]) by
 ussmges1new.samsung.com (USCPEMTA) with SMTP id 98.47.09760.C725F426; Thu, 
 7 Apr 2022 17:07:08 -0400 (EDT)
Received: from ussmgxs2new.samsung.com (u91.gpu85.samsung.co.kr
 [203.254.195.91]) by uscas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220407210707uscas1p15e77e16a23897a79d15a368dd098e842~juUzJDiyy1644716447uscas1p1n;
 Thu,  7 Apr 2022 21:07:07 +0000 (GMT)
X-AuditID: cbfec36d-503ff70000002620-b7-624f527ced50
Received: from SSI-EX4.ssi.samsung.com ( [105.128.2.146]) by
 ussmgxs2new.samsung.com (USCPEXMTA) with SMTP id 5D.C8.09672.B725F426; Thu, 
 7 Apr 2022 17:07:07 -0400 (EDT)
Received: from SSI-EX2.ssi.samsung.com (105.128.2.227) by
 SSI-EX4.ssi.samsung.com (105.128.2.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.2242.4; Thu, 7 Apr 2022 14:07:06 -0700
Received: from SSI-EX2.ssi.samsung.com ([fe80::2149:7df2:31b5:d9a0]) by
 SSI-EX2.ssi.samsung.com ([fe80::719f:92d1:f17f:5400%4]) with mapi id
 15.01.2242.008; Thu, 7 Apr 2022 14:07:06 -0700
From: Tong Zhang <t.zhang2@samsung.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>, "linuxarm@huawei.com"
 <linuxarm@huawei.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, Marcel Apfelbaum
 <marcel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, Markus Armbruster <armbru@redhat.com>, "Mark
 Cave-Ayland" <mark.cave-ayland@ilande.co.uk>, Adam Manzanares
 <a.manzanares@samsung.com>
Subject: Re: [PATCH v9 33/45] cxl/cxl-host: Add memops for CFMWS region.
Thread-Topic: [PATCH v9 33/45] cxl/cxl-host: Add memops for CFMWS region.
Thread-Index: AQHYSDkUJ08UOGfKTUOYMlZSJLRxo6zla7+A
Date: Thu, 7 Apr 2022 21:07:06 +0000
Message-ID: <7a17a19d-dcd4-61d5-b699-7ba06c9600bd@samsung.com>
In-Reply-To: <20220404151445.10955-34-Jonathan.Cameron@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [105.128.2.176]
Content-Type: text/plain; charset="utf-8"
Content-ID: <1974E8420EBA2D44931D0345BA4AD8A5@ssi.samsung.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0xTVxzHOfdZisDlETni4iIjcZqBsph4Fhc2xGV3CwluGc64JVrkhsdo
 S1rRwZbRzfFoGa+N2lBAHkYUKAOBQWW1VIQ5wNruIaNIAXkpLHMQYLLycLQXM/77/M73+/2d
 b06OAPdtoQIFiZKznEwiSg6ihETbT0uWkM/fj449MKV6EeWMKQCyT1gpVNEwSiDVdAGOci1N
 AGnUVoDqbTqAlhodOPq5+RaO+ntycFRXNUAhi7aPQLev38WQsqeARIpeCXrmmCVRZ9s6icru
 jhGotfMfGt3J0xPI+ks9gfJGVgnUfv8rEl1vU1Ood9ZCvbmDNT2uolnrd4Ukq1P+ibGlc4sY
 e0Nrp9mvu/8i2Sn7BZrVlK/i7GXDDMYODxgodnKgBWP/Nt6nWHVpBrvQvOuY10nh63FccuI5
 TrY//LQwYalIQ6asbvt07mIPqQDWbSrgLoDMQVi3lgtUQCjwZWoBrBhfIPghE4NZU63guWu+
 +CbJCw0A5pqubA5zALY038P4oRPAko5nuDNCMXugQ1lNOQV/xozD2oZ6lwtn8im4sv4H4XT5
 MSz8dWLVxf7MO3C40kDy/CosG7e5NhFMMHz8m51ysicTDnXtC7ST3Zkj0Dja6zoHzHb4tE+H
 ORlnAuDQZAXGF/eB1aUGnOftcL3jIcXzbjj6dGZjj2DDvxc2duzno+FwVF9N8LwbFuc+pPlr
 fWBvySTBR3fAW9cGXY8EmSohdNT2bz7SUZj5Y+fm/p1wzV6z2SEDlgwtAz7wDYC67kaaFw5D
 R4+BLgTB2i29tf930m7ppN3SSbulUyUg60BAqlwujufkYRLufKhcJJanSuJDz0jFzWDjX/ev
 3xbrgX5oPrQLYALQBaAAD/L3TBdHxfp6xonS0jmZ9JQsNZmTd4GdAiIowLMmsUnky8SLznKf
 cFwKJ3uuYgL3QAWWLTWYR3UMpr/6CtUS+UjaFPNuyJFz6bFfRuTviipPy698o1jZ8SQ17LWX
 yg4yNLQrij0y+9wK57O7E6Y9/n3PLDvv0/TDmRMpN/D55U4vz2sz5TcL2j+I6urI00dWE/ar
 v9ddSPELH3Hz0JpjTMGhaSeWxzR6R0aFo9vPOGsz3VGbIsaTii6H5ew7PmwMTFIQR73vrfUN
 TmuUrfSipWjwQLV02NvPa23l2N4i+/ePTl7qb3kSV+NnifQZ9/VOVpXUz2SfdkuLecHmX59k
 M352KN0Q8sXHV4od6tCRxRU2piom+oE5Imvg7ZeXS23qtyY+Ilaivz30oVuU6kGyJOvwpVNB
 hDxBFLYPl8lF/wEYhuopRgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPKsWRmVeSWpSXmKPExsWS2cA0Sbc6yD/JYMl3Y4uOBw2MFncfX2Cz
 mL/2PotF17N+Zovu8xsYLaZPvcBosfrmGkaLr+t/MVuc2HSQ2eL00Q5mi1ULr7FZnJ91isXi
 8MYzTBadR/tZLRpO5ln8//WK1WL/tn+sFnPOPGCx2LL/G7vF8d4dLBYXLq5msei994fFYvvV
 JlaLjdumslmcfHWezUHS48CLheweFyZPYPVY0/mayWP2hy9MHjtn3WX3aDnyltXj6d1mdo/p
 c/8weyze85LJ4861PWweT65tZvJ4v+8qm8fU2fUenzfJBfBFcdmkpOZklqUW6dslcGV8nTid
 teAPT8WHaUdZGxgv8HQxcnJICJhIfJyyl7WLkYtDSGA1o8S5U9eZIZwPjBK3X/9ignD2M0rM
 WnaHDaSFTUBd4lfnIjaQhIjAWWaJlWtXM4EkmAX62CTW75QBsYUFPCQuPf7DAmKLCHhK3Fmw
 hxXCNpKY8+gmM4jNIqAi8eLyXbChvAJ2Emu2f2aH2HaGUeLR8o3sIAlOASeJffdPghUxCohJ
 fD+1BmqZuMStJ/OZIJ4QkFiy5zwzhC0q8fLxP1YIW1Hi/veXQHM4gOo1Jdbv0odotZO4v2MR
 C4StKDGl+yE7xA2CEidnPmGBaJWUOLjiBssEoL+RbJuFMGkWkkmzkEyahWTSAkbWVYzipcXF
 uekVxUZ5qeV6xYm5xaV56XrJ+bmbGIFp7vS/w9E7GG/f+qh3iJGJg/EQowQHs5IIb1WuT5IQ
 b0piZVVqUX58UWlOavEhRmkOFiVx3pdRE+OFBNITS1KzU1MLUotgskwcnFINTMbR+q/6H35W
 Z8o71fjI9j53HIPGsbUu5hd8uN/zaAvNOHeMdc69M4YbXhoKp51Su+g9Qz3bJljqe9su6/cT
 lObGLX2ez8SkYab+pj31W3tVt5K34QYNEed3t1XOcF/P3sD4acU8loki0o8Wf/p2MTXT4ytL
 /5I1nnekpG9GZrDUfPVzVy5OSxCc+nCKh4tkGOPhrWssuHUlZn3fqP2r//fvy+mMawUKDM+y
 5LnPexK/5EibdVvuiWd+HGumRSX5F17OK1T0NlnLFv1GZ2Ov+oSCwsvePNG7Gep9eqTzZqmE
 r6gt8eg0TuGfEHJCI4L/iH7E2kXvU9Tn7NedvGfGy1sN93gfyFxk763df/OjEktxRqKhFnNR
 cSIA/6hkROIDAAA=
X-CMS-MailID: 20220407210707uscas1p15e77e16a23897a79d15a368dd098e842
CMS-TYPE: 301P
X-CMS-RootMailID: 20220404153138uscas1p2e261ac1dab4f0b2904e9d877acf77510
References: <20220404151445.10955-1-Jonathan.Cameron@huawei.com>
 <CGME20220404153138uscas1p2e261ac1dab4f0b2904e9d877acf77510@uscas1p2.samsung.com>
 <20220404151445.10955-34-Jonathan.Cameron@huawei.com>
Received-SPF: pass client-ip=211.189.100.11; envelope-from=t.zhang2@samsung.com;
 helo=mailout1.w2.samsung.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 07 Apr 2022 18:13:45 -0400
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alison Schofield <alison.schofield@intel.com>,
 Ben Widawsky <ben.widawsky@intel.com>, David Hildenbrand <david@redhat.com>,
 "k . jensen @ samsung . com" <k.jensen@samsung.com>,
 Samarth Saxena <samarths@cadence.com>, Chris Browy <cbrowy@avery-design.com>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, Shreyas Shah <shreyas.shah@elastics.cloud>,
 Saransh Gupta1 <saransh@ibm.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 "ztong0001@gmail.com" <ztong0001@gmail.com>,
 "linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Dan Williams <dan.j.williams@intel.com>,
 "dave@stgolabs.net" <dave@stgolabs.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQpPbiA0LzQvMjIgMDg6MTQsIEpvbmF0aGFuIENhbWVyb24gd3JvdGU6DQo+IEZyb206IEpvbmF0
aGFuIENhbWVyb24gPGpvbmF0aGFuLmNhbWVyb25AaHVhd2VpLmNvbT4NCj4NCj4NCj4gK3N0YXRp
YyBNZW1UeFJlc3VsdCBjeGxfcmVhZF9jZm13cyh2b2lkICpvcGFxdWUsIGh3YWRkciBhZGRyLCB1
aW50NjRfdCAqZGF0YSwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNp
Z25lZCBzaXplLCBNZW1UeEF0dHJzIGF0dHJzKQ0KPiArew0KPiArICAgIENYTEZpeGVkV2luZG93
ICpmdyA9IG9wYXF1ZTsNCj4gKyAgICBQQ0lEZXZpY2UgKmQ7DQo+ICsNCj4gKyAgICBkID0gY3hs
X2NmbXdzX2ZpbmRfZGV2aWNlKGZ3LCBhZGRyKTsNCj4gKyAgICBpZiAoZCA9PSBOVUxMKSB7DQo+
ICsgICAgICAgICpkYXRhID0gMDsNCg0KSSdtIGxvb2tpbmcgYXQgdGhpcyBjb2RlIGFuZCBjb21w
YXJpbmcgaXQgdG8gQ1hMMi4wIHNwZWMgOC4yLjUuMTIuMiBDWEwgSERNDQoNCkRlY29kZXIgR2xv
YmFsIENvbnRyb2wgUmVnaXN0ZXIgKE9mZnNldCAwNGgpIHRhYmxlLiBJdCBzZWVtcyB0aGF0IHdl
IHNob3VsZA0KDQpjaGVjayBQT1NJT05fT05fRVJSX0VOIGJpdCwgaWYgdGhpcyBiaXQgaXMgc2V0
LCB3ZSByZXR1cm4gcG9pc29uLCBvdGhlcndpc2UNCg0Kc2hvdWxkIHJldHVybiBhbGwgMSdzIGRh
dGEuDQoNCkFsc28sIGZyb20gdGhlIHNwZWMsIHRoaXMgYml0IGlzIGltcGxlbWVudGF0aW9uIHNw
ZWNpZmljIGFuZCBoYXJkIA0Kd2lyZWQoUk8pIHRvIGVpdGhlciAxIG9yIDAsDQoNCmJ1dCBmb3Ig
dHlwZTMgZGV2aWNlIGxvb2tzIGxpa2Ugd2UgYXJlIGN1cnJlbnRseSBhbGxvd2luZyBpdCB0byBi
ZSANCm92ZXJ3cml0dGVuIGluIGN0M2RfcmVnX3dyaXRlKCkNCg0KZnVuY3Rpb24uIFdlIHByb2Jh
Ymx5IGFsc28gbmVlZCBtb3JlIHNhbml0YXRpb24gaW4gY3QzZF9yZWdfd3JpdGUuIChBbHNvIA0K
Zm9yIEhETQ0KDQpyYW5nZS9pbnRlcmxlYXZpbmcgc2V0dGluZ3MuKQ0KDQo+ICsgICAgICAgIC8q
IFJlYWRzIHRvIGludmFsaWQgYWRkcmVzcyByZXR1cm4gcG9pc29uICovDQo+ICsgICAgICAgIHJl
dHVybiBNRU1UWF9FUlJPUjsNCj4gKyAgICB9DQo+ICsNCj4gKyAgICByZXR1cm4gY3hsX3R5cGUz
X3JlYWQoZCwgYWRkciArIGZ3LT5iYXNlLCBkYXRhLCBzaXplLCBhdHRycyk7DQo+ICt9DQo+ICsN
Cg0KLSBUb25nDQoNCg==

