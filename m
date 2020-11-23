Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0542C0E73
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 16:08:46 +0100 (CET)
Received: from localhost ([::1]:57610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khDSP-0004Tr-D1
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 10:08:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jose.carlos.venegas.munoz@intel.com>)
 id 1khDQL-0003le-Da
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 10:06:37 -0500
Received: from mga05.intel.com ([192.55.52.43]:7786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jose.carlos.venegas.munoz@intel.com>)
 id 1khDQI-0001Wn-Oj
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 10:06:36 -0500
IronPort-SDR: kXr8F+fr7j/zY9iNgk4JvuHR1LXnpSCP9UVb5Y3KKAbImp96hhCCgGPawIYbjsUh9ZL1u3mgR9
 MtujKrriB1rQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9813"; a="256487268"
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; d="scan'208";a="256487268"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2020 07:06:29 -0800
IronPort-SDR: w3SaM3eKmblryczf7Gip1muvyrBOsi54eeDNXVy4Y2vAarz5BaSOhSmeo5HlVSnLXnulRIaVDe
 R7AEPlbrfhhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; d="scan'208";a="370063084"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by FMSMGA003.fm.intel.com with ESMTP; 23 Nov 2020 07:06:28 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 23 Nov 2020 07:06:27 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 23 Nov 2020 07:06:27 -0800
Received: from orsmsx612.amr.corp.intel.com ([10.22.229.25]) by
 ORSMSX612.amr.corp.intel.com ([10.22.229.25]) with mapi id 15.01.1713.004;
 Mon, 23 Nov 2020 07:06:27 -0800
From: "Venegas Munoz, Jose Carlos" <jose.carlos.venegas.munoz@intel.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [Virtio-fs] [PATCH] virtiofsd: Use --thread-pool-size=0 to mean
 no thread pool
Thread-Topic: [Virtio-fs] [PATCH] virtiofsd: Use --thread-pool-size=0 to mean
 no thread pool
Thread-Index: AQHWs6wS+hq1rToqXk+gGyKm0jKNO6m6eUOAgAE5L4CAAIaOAIAIjASAgAfqnYCAAJWfAIAIyVwA
Date: Mon, 23 Nov 2020 15:06:27 +0000
Message-ID: <2BBB73D4-5C09-4DA1-B491-22A5134819FA@intel.com>
References: <20201105194416.GA1384085@redhat.com>
 <20201105195253.GB1384085@redhat.com>
 <D9233684-9B76-468E-A5F1-B35DA3F3C091@intel.com>
 <20201106223524.GG1436035@redhat.com>
 <CAOssrKcJr9a_5EUTU19BTp1UaST64Shh9w0UeR6TXPLqkN7bBw@mail.gmail.com>
 <C5CAD300-DB1D-4C6A-A2D3-2E6BA9F901DF@intel.com>
 <20201117185540.GB91497@redhat.com>
In-Reply-To: <20201117185540.GB91497@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="utf-8"
Content-ID: <FD26DC93E1B7C2458AF6AC81B0C0D975@intel.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=192.55.52.43;
 envelope-from=jose.carlos.venegas.munoz@intel.com; helo=mga05.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: virtio-fs-list <virtio-fs@redhat.com>, Miklos Szeredi <mszeredi@redhat.com>,
 "Shinde, Archana M" <archana.m.shinde@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Miklos Szeredi <miklos@szeredi.hu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rm9yIGFsbCB0aGUgY2FzZXMgdGhlIG1lbW9yeSBmb3IgdGhlIGd1ZXN0IGlzIDJHLg0KDQoNCu+7
v09uIDE3LzExLzIwIDEyOjU1LCAiVml2ZWsgR295YWwiIDx2Z295YWxAcmVkaGF0LmNvbT4gd3Jv
dGU6DQoNCiAgICBPbiBUdWUsIE5vdiAxNywgMjAyMCBhdCAwNDowMDowOVBNICswMDAwLCBWZW5l
Z2FzIE11bm96LCBKb3NlIENhcmxvcyB3cm90ZToNCiAgICA+ID4gICBOb3Qgc3VyZSB3aGF0IHRo
ZSBkZWZhdWx0IGlzIGZvciA5cCwgYnV0IGNvbXBhcmluZw0KICAgID4gPiAgIGRlZmF1bHQgdG8g
ZGVmYXVsdCB3aWxsIGRlZmluaXRlbHkgbm90IGJlIGFwcGxlcyB0byBhcHBsZXMgc2luY2UgdGhp
cw0KICAgID4gPiAgIG1vZGUgaXMgbm9uZXhpc3RlbnQgaW4gOXAuDQogICAgPiANCiAgICA+IElu
IEthdGEgd2UgYXJlIGxvb2tpbmcgZm9yIHRoZSBiZXN0IGNvbmZpZyBmb3IgZnMgY29tcGF0aWJp
bGl0eSBhbmQgcGVyZm9ybWFuY2UuIFNvIGV2ZW4gaWYgYXJlIG5vIGFwcGxlcyB0byBhcHBsZXMs
DQogICAgPiB3ZSBhcmUgZm9yIHRoZSBiZXN0IGNvbmZpZyBmb3IgYm90aCBhbmQgY29tcGFyaW5n
IHRoZSBiZXN0IHRoYXQgZWFjaCBvZiB0aGVtIGNhbiBkby4NCiAgICA+IA0KICAgID4gSW4gdGhl
IGNhc2Ugb2YgS2F0YSBmb3IgOXBmcyh0aGlzIGlzIHRoZSBjb25maWcgd2UgaGF2ZSBmb3VuZCBo
YXMgYmV0dGVyIHBlcmZvcm1hbmNlIGFuZCBmcyBjb21wYXRpYmlsaXR5ICBpbiBnZW5lcmFsKSB3
ZSBoYXZlOg0KICAgID4gYGBgDQogICAgPiAtZGV2aWNlIHZpcnRpby05cC1wY2kgIyBkZXZpY2Ug
dHlwZQ0KICAgID4gLGRpc2FibGUtbW9kZXJuPWZhbHNlIA0KICAgID4gLGZzZGV2PWV4dHJhLTlw
LWthdGFTaGFyZWQgIyBhdHRyOiBkZXZpY2UgaWQgIGZvciBmc2Rldg0KICAgID4gLG1vdW50X3Rh
Zz1rYXRhU2hhcmVkICAjIGF0dHI6IHRhZyBvbiBob3cgd2lsbCBiZSBmb3VuZCBkZSBzaGFyZWRm
cyANCiAgICA+ICxyb21maWxlPSANCiAgICA+IC1mc2RldiBsb2NhbCAgI2xvY2FsOiBTaW1wbHkg
bGV0cyBRRU1VIGNhbGwgdGhlIGluZGl2aWR1YWwgVkZTIGZ1bmN0aW9ucyAobW9yZSBvciBsZXNz
KSBkaXJlY3RseSBvbiBob3N0Lg0KICAgID4gLGlkPWV4dHJhLTlwLWthdGFTaGFyZWQgDQogICAg
PiAscGF0aD0ke1NIQVJFRF9QQVRIfSAjIGF0dHJzOiBwYXRoIHRvIHNoYXJlDQogICAgPiAsc2Vj
dXJpdHlfbW9kZWw9bm9uZSAjICAgIA0KICAgID4gIyAgICBwYXNzdGhyb3VnaDogRmlsZXMgYXJl
IHN0b3JlZCB1c2luZyB0aGUgc2FtZSBjcmVkZW50aWFscyBhcyB0aGV5IGFyZSBjcmVhdGVkIG9u
IHRoZSBndWVzdC4gVGhpcyByZXF1aXJlcyBRRU1VIHRvIHJ1biBhcyAjIHJvb3QuDQogICAgPiAj
ICAgIG5vbmU6IFNhbWUgYXMgInBhc3N0aHJvdWdoIiBleGNlcHQgdGhlIHNldmVyIHdvbid0IHJl
cG9ydCBmYWlsdXJlcyBpZiBpdCBmYWlscyB0byBzZXQgZmlsZSBhdHRyaWJ1dGVzIGxpa2Ugb3du
ZXJzaGlwICMgDQogICAgPiAjICAoY2hvd24pLiBUaGlzIG1ha2VzIGEgcGFzc3Rocm91Z2ggbGlr
ZSBzZWN1cml0eSBtb2RlbCB1c2FibGUgZm9yIHBlb3BsZSB3aG8gcnVuIGt2bSBhcyBub24gcm9v
dC4NCiAgICA+ICxtdWx0aWRldnM9cmVtYXANCiAgICA+IGBgYA0KICAgID4gDQogICAgPiBUaGUg
bW91bnQgb3B0aW9ucyBhcmU6DQogICAgPiBgYGANCiAgICA+IHRyYW5zPXZpcnRpbyANCiAgICA+
ICAgICAsdmVyc2lvbj05cDIwMDAuTCANCiAgICA+ICAgICAsY2FjaGU9bW1hcCANCiAgICA+ICAg
ICAsIm5vZGV2IiAjIFNlY3VyaXR5OiBUaGUgbm9kZXYgbW91bnQgb3B0aW9uIHNwZWNpZmllcyB0
aGF0IHRoZSBmaWxlc3lzdGVtIGNhbm5vdCBjb250YWluIHNwZWNpYWwgZGV2aWNlcy4gDQogICAg
PiAgICAgLCJtc2l6ZT04MTkyIiAjIG1zaXplOiBNYXhpbXVtIHBhY2tldCBzaXplIGluY2x1ZGlu
ZyBhbnkgaGVhZGVycy4NCiAgICA+IGBgYA0KDQogICAgSG93IG11Y2ggUkFNIHlvdSBhcmUgZ2l2
aW5nIHRvIHRoZXNlIGNvbnRhaW5lcnMgd2hlbiB1c2luZyB2aXJ0aW8tOXA/DQoNCiAgICBWaXZl
aw0KDQoNCg==

