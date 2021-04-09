Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E745535A69A
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 21:05:12 +0200 (CEST)
Received: from localhost ([::1]:51624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUwRL-00067U-GW
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 15:05:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lUwOg-0004oa-3u
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 15:02:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lUwOY-0000Hb-KJ
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 15:02:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617994936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=m/p3DjynXgoYk5s0BlTH3Xm1+kEenHIuO7rNu9W3mI8=;
 b=Vue+hOBjsU8Niy17wkVOB9Ct8iiK/znY/HgkT0RhM1BByZhR07vaER1tqsfG+MZL0EwazE
 j7iVAFyZq84KTecP4aPZsMnqvOhFO/vO7bA22/BEDuJPywg4a0W8cuSYza4QiqA+g45RrR
 CXg/LbW+Xlrg3AD8XcWup4w+ptm4COM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-hLK3PlqdMq-3kCWCLLPgaQ-1; Fri, 09 Apr 2021 15:02:14 -0400
X-MC-Unique: hLK3PlqdMq-3kCWCLLPgaQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B51B387A826
 for <qemu-devel@nongnu.org>; Fri,  9 Apr 2021 19:02:13 +0000 (UTC)
Received: from localhost (ovpn-112-55.ams2.redhat.com [10.36.112.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ECE5D19718;
 Fri,  9 Apr 2021 19:02:03 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] docs/devel/qgraph: add troubleshooting information
Date: Fri,  9 Apr 2021 20:01:07 +0100
Message-Id: <20210409190109.476167-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SSByZWNlbnRseSBuZWVkZWQgdG8gdHJvdWJsZXNob290IGEgY2FzZSB3aGVyZSBxb3MtdGVzdCB0
ZXJtaW5hdGVkIGltbWVkaWF0ZWx5DQp3aXRoIG5vIG91dHB1dC4gSW4gb3RoZXIgd29yZHMsIHFv
cy10ZXN0IGRlY2lkZWQgdGhhdCBubyB0ZXN0cyBhcmUgcnVubmFibGUuDQoNCkFmdGVyIGxvdHMg
b2YgaGVhZCBzY3JhdGNoaW5nIGFuZCBzb21lIGhlbHAgZnJvbSBFbWFudWVsZSBpdCB0dXJuZWQg
b3V0IHRoYXQNCnRoZSBtYWNoaW5lIHR5cGVzIHdlcmVuJ3QgYmVpbmcgZGV0ZWN0ZWQgYXMgZXhw
ZWN0ZWQuDQoNClRoZXNlIHBhdGNoZXMgYWRkIGRvY3VtZW50YXRpb24gYWJvdXQgaG93IHRvIHRy
b3VibGVzaG9vdCBzaW1pbGFyIGNhc2VzIGluIHRoZQ0KZnV0dXJlLg0KDQpTdGVmYW4gSGFqbm9j
emkgKDIpOg0KICBsaWJxb3MvcWdyYXBoOiBmaXggIlVOQVZBSUxCTEUiIHR5cG8NCiAgZG9jcy9k
ZXZlbC9xZ3JhcGg6IGFkZCB0cm91Ymxlc2hvb3RpbmcgaW5mb3JtYXRpb24NCg0KIGRvY3MvZGV2
ZWwvcWdyYXBoLnJzdCAgICAgICB8IDU4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysNCiB0ZXN0cy9xdGVzdC9saWJxb3MvcWdyYXBoLmMgfCAgMiArLQ0KIDIgZmlsZXMgY2hh
bmdlZCwgNTkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KDQotLSANCjIuMzAuMg0KDQo=


