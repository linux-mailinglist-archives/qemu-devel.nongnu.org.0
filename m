Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E324D30ABDE
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 16:49:32 +0100 (CET)
Received: from localhost ([::1]:42542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6bSF-0008IZ-LJ
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 10:49:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l6bR9-0007Zj-Gs
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:48:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l6bR6-0007Di-GR
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:48:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612194498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bIZ3HgXTqrTtSAFSQ+DXUufLsS/DgowWXvdl4+wMFtY=;
 b=CwlZXkxzlxNRUIkD+h7v8bVA0Sy7X+QDNaUVaxkpqTn4+QOTP5/bLgB9dVEHZHNP1Rfau8
 tOIR9lyqDCbC62BO/Y0C5/fIdBlnjImf/RM45L8LZf8bUH3kLpZ8wYsTmWR/unQwKBHuQZ
 CZzjj3LjH6DrJmi3zPGSOpe8u/GyyqU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-jo54M3XWP-WpMi9_SX8vAQ-1; Mon, 01 Feb 2021 10:48:16 -0500
X-MC-Unique: jo54M3XWP-WpMi9_SX8vAQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35B7B1005E61;
 Mon,  1 Feb 2021 15:47:15 +0000 (UTC)
Received: from localhost (ovpn-115-140.ams2.redhat.com [10.36.115.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9675E60C9D;
 Mon,  1 Feb 2021 15:47:04 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/11] Tracing patches
Date: Mon,  1 Feb 2021 15:46:52 +0000
Message-Id: <20210201154703.180022-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA3NDIwOGNkMjUyYzVkYTlkODY3Mjcw
YTE3ODc5OWFiZDgwMmI5MzM4Og0KDQogIE1lcmdlIHJlbW90ZS10cmFja2luZyBicmFuY2ggJ3Jl
bW90ZXMvYmVycmFuZ2UtZ2l0bGFiL3RhZ3MvbWlzYy1maXhlcy1wdWxsLXJlcXVlc3QnIGludG8g
c3RhZ2luZyAoMjAyMS0wMS0yOSAxOTo1MToyNSArMDAwMCkNCg0KYXJlIGF2YWlsYWJsZSBpbiB0
aGUgR2l0IHJlcG9zaXRvcnkgYXQ6DQoNCiAgaHR0cHM6Ly9naXRsYWIuY29tL3N0ZWZhbmhhL3Fl
bXUuZ2l0IHRhZ3MvdHJhY2luZy1wdWxsLXJlcXVlc3QNCg0KZm9yIHlvdSB0byBmZXRjaCBjaGFu
Z2VzIHVwIHRvIDBkZmIzY2E3M2M1NGZjMTA1YWI3OGUzN2UzMWFiMDViZWQxMzYwYWE6DQoNCiAg
dHJhY2U6IHVwZGF0ZSBkb2NzIHdpdGggbWVzb24gYnVpbGQgaW5mb3JtYXRpb24gKDIwMjEtMDIt
MDEgMTE6MjM6MDQgKzAwMDApDQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NClB1bGwgcmVxdWVzdA0KDQotLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQoN
CkRhbmllbCBQLiBCZXJyYW5nw6kgKDEpOg0KICB0cmFjZXRvb2w6IGFsc28gc3RyaXAgJWwgYW5k
ICVsbCBmcm9tIHN5c3RlbXRhcCBmb3JtYXQgc3RyaW5ncw0KDQpMYXVyZW50IFZpdmllciAoMSk6
DQogIHRyYWNldG9vbDogZml4ICJQUkkiIG1hY3JvIGRlY29kaW5nDQoNClN0ZWZhbiBIYWpub2N6
aSAoOCk6DQogIHRyYWNlOiBmaXggc2ltcGxldHJhY2UgZG9jIG1pc21lcmdlDQogIHRyYWNpbmc6
IGNvbnZlcnQgZG9jdW1lbnRhdGlvbiB0byByU1QNCiAgdHJhY2U6IHJlY29tbWVuZCAibG9nIiBi
YWNrZW5kIGZvciBnZXR0aW5nIHN0YXJ0ZWQgd2l0aCB0cmFjaW5nDQogIHRyYWNlOiBhZGQgbWVz
b24gY3VzdG9tX3RhcmdldCgpIGRlcGVuZF9maWxlcyBmb3IgdHJhY2V0b29sDQogIGVycm9yOiBy
ZW5hbWUgZXJyb3Jfd2l0aF90aW1lc3RhbXAgdG8gbWVzc2FnZV93aXRoX3RpbWVzdGFtcA0KICB0
cmFjZTogbWFrZSB0aGUgJ2xvZycgYmFja2VuZCB0aW1lc3RhbXAgY29uZmlndXJhYmxlDQogIHRy
YWNlOiBkb2N1bWVudCBob3cgdG8gc3BlY2lmeSBtdWx0aXBsZSAtLXRyYWNlIHBhdHRlcm5zDQog
IHRyYWNlOiB1cGRhdGUgZG9jcyB3aXRoIG1lc29uIGJ1aWxkIGluZm9ybWF0aW9uDQoNClZvbGtl
ciBSw7xtZWxpbiAoMSk6DQogIHNpbXBsZXRyYWNlOiBidWlsZCgpIG1pc3NpbmcgMiByZXF1aXJl
ZCBwb3NpdGlvbmFsIGFyZ3VtZW50cw0KDQogZG9jcy9kZXZlbC9pbmRleC5yc3QgICAgICAgICAg
ICAgICAgICAgIHwgICAxICsNCiBkb2NzL2RldmVsL3t0cmFjaW5nLnR4dCA9PiB0cmFjaW5nLnJz
dH0gfCAyNDggKysrKysrKysrKysrKystLS0tLS0tLS0tDQogbWVzb24uYnVpbGQgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgIDI4ICsrLQ0KIGluY2x1ZGUvcWVtdS9lcnJvci1yZXBvcnQu
aCAgICAgICAgICAgICB8ICAgMiArLQ0KIHNvZnRtbXUvdmwuYyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAgMiArLQ0KIHV0aWwvcWVtdS1lcnJvci5jICAgICAgICAgICAgICAgICAgICAg
ICB8ICAgNCArLQ0KIHNjcmlwdHMvc2ltcGxldHJhY2UucHkgICAgICAgICAgICAgICAgICB8ICAg
NCArLQ0KIHNjcmlwdHMvdHJhY2V0b29sL2JhY2tlbmQvbG9nLnB5ICAgICAgICB8ICAxOSArLQ0K
IHNjcmlwdHMvdHJhY2V0b29sL2Zvcm1hdC9sb2dfc3RhcC5weSAgICB8ICAgOCArLQ0KIHRyYWNl
L21lc29uLmJ1aWxkICAgICAgICAgICAgICAgICAgICAgICB8ICAyMSArLQ0KIDEwIGZpbGVzIGNo
YW5nZWQsIDIxNiBpbnNlcnRpb25zKCspLCAxMjEgZGVsZXRpb25zKC0pDQogcmVuYW1lIGRvY3Mv
ZGV2ZWwve3RyYWNpbmcudHh0ID0+IHRyYWNpbmcucnN0fSAoNzIlKQ0KDQotLSANCjIuMjkuMg0K
DQo=


