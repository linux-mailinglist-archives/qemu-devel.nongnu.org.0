Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5B838E71A
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 15:06:12 +0200 (CEST)
Received: from localhost ([::1]:40176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llAHc-0008VR-1f
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 09:06:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1llADq-0002Hx-7B
 for qemu-devel@nongnu.org; Mon, 24 May 2021 09:02:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1llADk-0007eY-Aa
 for qemu-devel@nongnu.org; Mon, 24 May 2021 09:02:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621861329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=aMOwLpz3PVbcVd5Gn2dywk3MDT+vQNV+yVXhKAfexv4=;
 b=OqpG/yBDhtqYYu55gMOR8i2Qux2P0DQUtTtDofpqpeXjg6wRXDNNoKFeqDmQcowj5WSIW+
 jS/OXcgYDQ/LpdQYkT8g3UZL6vxQRcmynDaZRq13SliiYZDPC7AiB3DTEFA6rO4wOAQUdK
 7bPZ61bdEqZ2prd0RXrB+HRZXcYk79E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-VpF3J3PFNW6hTUb0GH2JMg-1; Mon, 24 May 2021 09:02:05 -0400
X-MC-Unique: VpF3J3PFNW6hTUb0GH2JMg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 274681966324;
 Mon, 24 May 2021 13:02:04 +0000 (UTC)
Received: from localhost (ovpn-113-244.ams2.redhat.com [10.36.113.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 070E15D9F0;
 Mon, 24 May 2021 13:01:59 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 0/8] Block patches
Date: Mon, 24 May 2021 14:01:42 +0100
Message-Id: <20210524130150.50998-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 John G Johnson <john.g.johnson@oracle.com>, John Snow <jsnow@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA2Yzc2OTY5MGFjODQ1ZmE2MjY0MmE1
ZjkzYjRlNGJkOTA2YWRhYjk1Og0KDQogIE1lcmdlIHJlbW90ZS10cmFja2luZyBicmFuY2ggJ3Jl
bW90ZXMvdnNlbWVudHNvdi90YWdzL3B1bGwtc2ltcGxlYmVuY2gtMjAyMS0wNS0wNCcgaW50byBz
dGFnaW5nICgyMDIxLTA1LTIxIDEyOjAyOjM0ICswMTAwKQ0KDQphcmUgYXZhaWxhYmxlIGluIHRo
ZSBHaXQgcmVwb3NpdG9yeSBhdDoNCg0KICBodHRwczovL2dpdGxhYi5jb20vc3RlZmFuaGEvcWVt
dS5naXQgdGFncy9ibG9jay1wdWxsLXJlcXVlc3QNCg0KZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2Vz
IHVwIHRvIDBhNmYwYzc2YTAzMDcxMDc4MGNlMTBkNjM0N2E3MGYwOTgwMjRkMjE6DQoNCiAgY29y
b3V0aW5lLXNsZWVwOiBpbnRyb2R1Y2UgcWVtdV9jb19zbGVlcCAoMjAyMS0wNS0yMSAxODoyMjoz
MyArMDEwMCkNCg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQ0KUHVsbCByZXF1ZXN0DQoNCihSZXNlbnQgZHVlIHRvIGFuIGVt
YWlsIHByZXBhcmF0aW9uIG1pc3Rha2UuKQ0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQoNClBhb2xvIEJvbnppbmkgKDYp
Og0KICBjb3JvdXRpbmUtc2xlZXA6IHVzZSBhIHN0YWNrLWFsbG9jYXRlZCB0aW1lcg0KICBjb3Jv
dXRpbmUtc2xlZXA6IGRpc2FsbG93IE5VTEwgUWVtdUNvU2xlZXBTdGF0ZSoqIGFyZ3VtZW50DQog
IGNvcm91dGluZS1zbGVlcDogYWxsb3cgcWVtdV9jb19zbGVlcF93YWtlIHRoYXQgd2FrZXMgbm90
aGluZw0KICBjb3JvdXRpbmUtc2xlZXA6IG1vdmUgdGltZXIgb3V0IG9mIFFlbXVDb1NsZWVwU3Rh
dGUNCiAgY29yb3V0aW5lLXNsZWVwOiByZXBsYWNlIFFlbXVDb1NsZWVwU3RhdGUgcG9pbnRlciB3
aXRoIHN0cnVjdCBpbiB0aGUNCiAgICBBUEkNCiAgY29yb3V0aW5lLXNsZWVwOiBpbnRyb2R1Y2Ug
cWVtdV9jb19zbGVlcA0KDQpQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSAoMSk6DQogIGJpdG9wcy5o
OiBJbXByb3ZlIGZpbmRfeHh4X2JpdCgpIGRvY3VtZW50YXRpb24NCg0KWmVuZ2h1aSBZdSAoMSk6
DQogIG11bHRpLXByb2Nlc3M6IEluaXRpYWxpemUgdmFyaWFibGVzIGRlY2xhcmVkIHdpdGggZ19h
dXRvKg0KDQogaW5jbHVkZS9xZW11L2JpdG9wcy5oICAgICAgIHwgMTUgKysrKysrLS0NCiBpbmNs
dWRlL3FlbXUvY29yb3V0aW5lLmggICAgfCAyNyArKysrKysrKy0tLS0tDQogYmxvY2svYmxvY2st
Y29weS5jICAgICAgICAgIHwgMTAgKystLS0NCiBibG9jay9uYmQuYyAgICAgICAgICAgICAgICAg
fCAxNCArKystLS0tDQogaHcvcmVtb3RlL21lbW9yeS5jICAgICAgICAgIHwgIDUgKy0tDQogaHcv
cmVtb3RlL3Byb3h5LmMgICAgICAgICAgIHwgIDMgKy0NCiB1dGlsL3FlbXUtY29yb3V0aW5lLXNs
ZWVwLmMgfCA3NSArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tDQogNyBmaWxl
cyBjaGFuZ2VkLCA3OSBpbnNlcnRpb25zKCspLCA3MCBkZWxldGlvbnMoLSkNCg0KLS0gDQoyLjMx
LjENCg0K


