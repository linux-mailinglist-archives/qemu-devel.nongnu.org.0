Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF0645E57C
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 03:42:10 +0100 (CET)
Received: from localhost ([::1]:38554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqRBe-0002pp-11
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 21:42:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1mqRA8-0001yW-8V
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 21:40:32 -0500
Received: from mga12.intel.com ([192.55.52.136]:25884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wei.w.wang@intel.com>)
 id 1mqRA5-0002Tz-7o
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 21:40:31 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10179"; a="215621606"
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; d="scan'208";a="215621606"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2021 18:40:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; d="scan'208";a="509907707"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 25 Nov 2021 18:40:26 -0800
Received: from shsmsx601.ccr.corp.intel.com (10.109.6.141) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 25 Nov 2021 18:40:26 -0800
Received: from shsmsx601.ccr.corp.intel.com (10.109.6.141) by
 SHSMSX601.ccr.corp.intel.com (10.109.6.141) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 26 Nov 2021 10:40:24 +0800
Received: from shsmsx601.ccr.corp.intel.com ([10.109.6.141]) by
 SHSMSX601.ccr.corp.intel.com ([10.109.6.141]) with mapi id 15.01.2242.012;
 Fri, 26 Nov 2021 10:40:24 +0800
From: "Wang, Wei W" <wei.w.wang@intel.com>
To: Jason Wang <jasowang@redhat.com>
Subject: RE: [PATCH 1/2] virito-balloon: process all in sgs for free_page_vq
Thread-Topic: [PATCH 1/2] virito-balloon: process all in sgs for free_page_vq
Thread-Index: AQHX4aM373Nsl56tkkG+6+cIJtb0FKwTY5qAgACAqgCAAABxgIABFUCQ//+X/gCAAIbTYA==
Date: Fri, 26 Nov 2021 02:40:24 +0000
Message-ID: <79943b517d394d4fbfb0850af5458798@intel.com>
References: <20211125022046.10433-1-jasowang@redhat.com>
 <f4ae1d19-1409-7250-5149-8831b2cfa1d2@redhat.com>
 <20211125110724-mutt-send-email-mst@kernel.org>
 <d162f85f-214b-3d4b-c860-47b3367e7099@redhat.com>
 <b8d226cb51d04484861f1e1809043c1d@intel.com>
 <CACGkMEtKazhmn=1AfiGszoOYUNAyEnyBQtbw79jh2wL=hm+Pcg@mail.gmail.com>
In-Reply-To: <CACGkMEtKazhmn=1AfiGszoOYUNAyEnyBQtbw79jh2wL=hm+Pcg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.200.16
x-originating-ip: [10.239.127.36]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=192.55.52.136; envelope-from=wei.w.wang@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Alexander Duyck <alexander.duyck@gmail.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gRnJpZGF5LCBOb3ZlbWJlciAyNiwgMjAyMSAxMDozMSBBTSwgSmFzb24gV2FuZyB3cm90ZToN
Cj4gDQo+IEkndmUgdGVzdGVkIHRoZSBjb2RlIHdpdGggbWlncmF0aW9uIGJlZm9yZSBzZW5kaW5n
IHRoZSBwYXRjaGVzLCBJIHNlZSB0aGUgaGludA0KPiB3b3JrcyBmaW5lLg0KPiANCg0KVGhhdCdz
IGdyZWF0IChhc3N1bWUgeW91IHNhdyBncmVhdCByZWR1Y3Rpb24gaW4gdGhlIG1pZ3JhdGlvbiB0
aW1lIGFzIHdlbGwpLg0KUmV2aWV3ZWQtYnk6IFdlaSBXYW5nIDx3ZWkudy53YW5nQGludGVsLmNv
bT4NCg0KVGhhbmtzLA0KV2VpDQo=

