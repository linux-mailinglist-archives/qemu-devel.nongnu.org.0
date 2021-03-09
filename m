Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9856633223F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 10:42:42 +0100 (CET)
Received: from localhost ([::1]:48240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJYsz-0002Wp-G8
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 04:42:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lJYrh-0000s3-Em
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 04:41:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lJYrf-0002wi-QF
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 04:41:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615282879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5rEXWS7uGrlTnZF510fXSwb4CQeNkarRS4PurwQdCL4=;
 b=UanqrSYu6L1jjHKGPC+DdOYEXcQZfiIGyw+oV0iZSWzZoKTO4VXvfRWsu2NPOE3jF0NBZb
 sbGoTyIvtlOVL1uUfNQnAcfiKBPnpGfozWL8SjGkQ0iGZZMJii6HJYZdlchp2lRdIKf5uC
 skjgXUFYsBSW2yl1AbyQ74G3hgQu9D8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-aCXk2Hg5OFOBndjbf0UFpw-1; Tue, 09 Mar 2021 04:41:16 -0500
X-MC-Unique: aCXk2Hg5OFOBndjbf0UFpw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF9ED87A82A;
 Tue,  9 Mar 2021 09:41:15 +0000 (UTC)
Received: from localhost (ovpn-115-70.ams2.redhat.com [10.36.115.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 27DA861F55;
 Tue,  9 Mar 2021 09:41:12 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] vhost-user-blk-test: add vhost-user-blk server tests
Date: Tue,  9 Mar 2021 09:41:02 +0000
Message-Id: <20210309094106.196911-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Coiby Xu <Coiby.Xu@gmail.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhlc2UgcGF0Y2hlcyB3ZXJlIGRyb3BwZWQgZnJvbSBLZXZpbidzIGxhc3QgYmxvY2sgcHVsbCBy
ZXF1ZXN0IGR1ZSB0byBhIEdpdExhYg0KQ0kgZmFpbHVyZS4gVGhlIG9sZCBDZW50T1MgNyBhbmQg
b3BlbnN1c2UgTGVhcCBidWlsZCBpbWFnZXMgbGFjaw0KbWVtZmRfY3JlYXRlKDIpIChpbnRyb2R1
Y2VkIGluIExpbnV4IGFyb3VuZCAyMDE0KS4gVGhlIHZob3N0LXVzZXItYmxrIHNlcnZlcg0KaGFk
IGEgZGVwZW5kZW5jeSBvbiBtZW1mZF9jcmVhdGUoMikgZHVlIHRvIFZIT1NUX1VTRVJfUFJPVE9D
T0xfRl9JTkZMSUdIVF9TSE1GRA0KYW5kIHFlbXUtc3RvcmFnZS1kYWVtb24gd291bGQgZmFpbCB0
byBjcmVhdGUgYSB2aG9zdC11c2VyLWJsayBleHBvcnQuDQoNClNpbmNlIHdlIGhhdmUgbm90IHRo
b3VnaHQgYWJvdXQgb3IgdGVzdGVkIFZIT1NUX1VTRVJfUFJPVE9DT0xfRl9JTkZMSUdIVF9TSE1G
RA0KYW55d2F5LCBkaXNhYmxlIGl0IGZvciBub3cuIEl0IGNhbiBiZSByZS1lbmFibGVkIGFnYWlu
IGxhdGVyIHdoZW4gaXQncyBuZWVkZWQNCmZvciByZWNvbm5lY3Rpb24gc3VwcG9ydC4NCg0KQ29p
YnkgWHUgKDEpOg0KICB0ZXN0OiBuZXcgcVRlc3QgY2FzZSB0byB0ZXN0IHRoZSB2aG9zdC11c2Vy
LWJsay1zZXJ2ZXINCg0KU3RlZmFuIEhham5vY3ppICgzKToNCiAgYmxvY2svZXhwb3J0OiBkaXNh
YmxlIFZIT1NUX1VTRVJfUFJPVE9DT0xfRl9JTkZMSUdIVF9TSE1GRCBmb3Igbm93DQogIHRlc3Rz
L3F0ZXN0OiBhZGQgbXVsdGktcXVldWUgdGVzdCBjYXNlIHRvIHZob3N0LXVzZXItYmxrLXRlc3QN
CiAgdmhvc3QtdXNlci1ibGstdGVzdDogdGVzdCBkaXNjYXJkL3dyaXRlIHplcm9lcyBpbnZhbGlk
IGlucHV0cw0KDQogTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAyICsN
CiB0ZXN0cy9xdGVzdC9saWJxb3Mvdmhvc3QtdXNlci1ibGsuaCAgfCAgNDggKysNCiBibG9jay9l
eHBvcnQvdmhvc3QtdXNlci1ibGstc2VydmVyLmMgfCAgIDMgKy0NCiB0ZXN0cy9xdGVzdC9saWJx
b3Mvdmhvc3QtdXNlci1ibGsuYyAgfCAxMzAgKysrKw0KIHRlc3RzL3F0ZXN0L3Zob3N0LXVzZXIt
YmxrLXRlc3QuYyAgICB8IDk4MyArKysrKysrKysrKysrKysrKysrKysrKysrKysNCiB0ZXN0cy9x
dGVzdC9saWJxb3MvbWVzb24uYnVpbGQgICAgICAgfCAgIDEgKw0KIHRlc3RzL3F0ZXN0L21lc29u
LmJ1aWxkICAgICAgICAgICAgICB8ICAgNCArDQogNyBmaWxlcyBjaGFuZ2VkLCAxMTY5IGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3RzL3F0ZXN0
L2xpYnFvcy92aG9zdC11c2VyLWJsay5oDQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3RzL3F0ZXN0
L2xpYnFvcy92aG9zdC11c2VyLWJsay5jDQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3RzL3F0ZXN0
L3Zob3N0LXVzZXItYmxrLXRlc3QuYw0KDQotLSANCjIuMjkuMg0KDQo=


