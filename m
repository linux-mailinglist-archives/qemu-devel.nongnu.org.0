Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7083B2C0E75
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 16:11:57 +0100 (CET)
Received: from localhost ([::1]:33984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khDVU-0006ap-D0
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 10:11:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jose.carlos.venegas.munoz@intel.com>)
 id 1khDRn-0004Kv-Eb
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 10:08:07 -0500
Received: from mga07.intel.com ([134.134.136.100]:37750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jose.carlos.venegas.munoz@intel.com>)
 id 1khDRb-0001sg-SP
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 10:08:07 -0500
IronPort-SDR: 8V6pmX4ktfSx3QPV9SQOPUCe1DhNGyqYKIyHF0r8vgxcQ1svZqyqdWVEPZP6saqxn/dvJ+Lqk7
 sjTHIkkOvqbg==
X-IronPort-AV: E=McAfee;i="6000,8403,9813"; a="235920925"
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; d="scan'208";a="235920925"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2020 07:07:47 -0800
IronPort-SDR: O6OByKhnjrBQr0qZW8JwTWvGH+tVXf55mJTNiug1m87y2QxFc5qXzAMmk20YRoqyMZANrKIzdQ
 1WdyHUVtAmqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; d="scan'208";a="370063667"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by FMSMGA003.fm.intel.com with ESMTP; 23 Nov 2020 07:07:47 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 23 Nov 2020 07:07:46 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 23 Nov 2020 07:07:46 -0800
Received: from orsmsx612.amr.corp.intel.com ([10.22.229.25]) by
 ORSMSX612.amr.corp.intel.com ([10.22.229.25]) with mapi id 15.01.1713.004;
 Mon, 23 Nov 2020 07:07:46 -0800
From: "Venegas Munoz, Jose Carlos" <jose.carlos.venegas.munoz@intel.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [Virtio-fs] [PATCH] virtiofsd: Use --thread-pool-size=0 to mean
 no thread pool
Thread-Topic: [Virtio-fs] [PATCH] virtiofsd: Use --thread-pool-size=0 to mean
 no thread pool
Thread-Index: AQHWs6wS+hq1rToqXk+gGyKm0jKNO6m6eUOAgAE5L4CAAIaOAIAIjASAgAfqnYCAANAQAIAIj0oA
Date: Mon, 23 Nov 2020 15:07:46 +0000
Message-ID: <BAA622CA-4535-4577-B16F-66C8BE74E574@intel.com>
References: <20201105194416.GA1384085@redhat.com>
 <20201105195253.GB1384085@redhat.com>
 <D9233684-9B76-468E-A5F1-B35DA3F3C091@intel.com>
 <20201106223524.GG1436035@redhat.com>
 <CAOssrKcJr9a_5EUTU19BTp1UaST64Shh9w0UeR6TXPLqkN7bBw@mail.gmail.com>
 <C5CAD300-DB1D-4C6A-A2D3-2E6BA9F901DF@intel.com>
 <20201117222450.GC91497@redhat.com>
In-Reply-To: <20201117222450.GC91497@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="utf-8"
Content-ID: <E1D9DF7FD306CE4CB97CFFC47142CD61@intel.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=jose.carlos.venegas.munoz@intel.com; helo=mga07.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: virtio-fs-list <virtio-fs@redhat.com>, Miklos Szeredi <mszeredi@redhat.com>,
 "Shinde, Archana M" <archana.m.shinde@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Miklos Szeredi <miklos@szeredi.hu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Q29vbCwgdGhhbmtzIEkgd2lsbCBicmluZyBzb21lIHJlc3VsdHMgdGhpcyB3ZWVrLg0KDQrvu79P
biAxNy8xMS8yMCAxNjoyNCwgIlZpdmVrIEdveWFsIiA8dmdveWFsQHJlZGhhdC5jb20+IHdyb3Rl
Og0KDQogICAgT24gVHVlLCBOb3YgMTcsIDIwMjAgYXQgMDQ6MDA6MDlQTSArMDAwMCwgVmVuZWdh
cyBNdW5veiwgSm9zZSBDYXJsb3Mgd3JvdGU6DQogICAgPiA+ICAgTm90IHN1cmUgd2hhdCB0aGUg
ZGVmYXVsdCBpcyBmb3IgOXAsIGJ1dCBjb21wYXJpbmcNCiAgICA+ID4gICBkZWZhdWx0IHRvIGRl
ZmF1bHQgd2lsbCBkZWZpbml0ZWx5IG5vdCBiZSBhcHBsZXMgdG8gYXBwbGVzIHNpbmNlIHRoaXMN
CiAgICA+ID4gICBtb2RlIGlzIG5vbmV4aXN0ZW50IGluIDlwLg0KICAgID4gDQogICAgPiBJbiBL
YXRhIHdlIGFyZSBsb29raW5nIGZvciB0aGUgYmVzdCBjb25maWcgZm9yIGZzIGNvbXBhdGliaWxp
dHkgYW5kIHBlcmZvcm1hbmNlLiBTbyBldmVuIGlmIGFyZSBubyBhcHBsZXMgdG8gYXBwbGVzLA0K
ICAgID4gd2UgYXJlIGZvciB0aGUgYmVzdCBjb25maWcgZm9yIGJvdGggYW5kIGNvbXBhcmluZyB0
aGUgYmVzdCB0aGF0IGVhY2ggb2YgdGhlbSBjYW4gZG8uDQoNCiAgICBDYW4gd2UgcnVuIHRlc3Rz
IGluIG1vcmUgdGhhbiBvbmUgY29uZmlndXJhdGlvbi4gUmlnaHQgbm93IHlvdSBhcmUgdXNpbmcN
CiAgICBjYWNoZT1tbWFwIGZvciB2aXJ0aW8tOXAgYW5kIGNhY2hlPWF1dG8gZm9yIHZpcnRpb2Zz
IGFuZCBhcyBNaWtsb3MNCiAgICBzYWlkIHRoaXMgaXMgbm90IGFwcGxlcyB0byBhcHBsZXMgY29t
cGFyaXNvbi4NCg0KICAgIFNvIHlvdSBjYW4gY29udGludWUgdG8gcnVuIGFib3ZlIGJ1dCBhbHNv
IHJ1biBhZGRpdGlvbmFsIHRlc3RzIGlmDQogICAgdGltZSBwZXJtaXRzLg0KDQogICAgdmlydGlv
LTlwCXZpcnRpby1mcw0KDQogICAgY2FjaGU9bW1hcAljYWNoZT1ub25lICsgREFYDQogICAgY2Fj
aGU9bm9uZQljYWNoZT1ub25lDQogICAgY2FjaGU9bG9vc2UJY2FjaGU9YWx3YXlzDQoNCiAgICBH
aXZlbiB5b3UgYXJlIHVzaW5nIGNhY2hlPW1tYXAgZm9yIHZpcnRpby05cCwgImNhY2hlPW5vbmUg
KyBEQVgiIGlzDQogICAgc29tZXdoYXQgZXF1aXZhbGVudCBvZiB0aGF0LiBQcm92aWRlcyBzdHJv
bmcgY29oZXJlbmN5IGFzIHdlbGwgYXMNCiAgICBhbGxvdyBmb3IgbW1hcCgpIHRvIHdvcmsuDQoN
CiAgICBOb3cga2VybmVsIHZpcnRpb2ZzIERBWCBzdXBwb3J0IGdvdCBtZXJnZWQgaW4gNS4xMC1y
YzEuIEZvciBxZW11LA0KICAgIHlvdSBjYW4gdXNlIHZpcnRpby1mcy1kZXYgYnJhbmNoLg0KDQog
ICAgaHR0cHM6Ly9naXRsYWIuY29tL3ZpcnRpby1mcy9xZW11Ly0vY29tbWl0cy92aXJ0aW8tZnMt
ZGV2DQoNCiAgICBUaGFua3MNCiAgICBWaXZlaw0KDQoNCg==

