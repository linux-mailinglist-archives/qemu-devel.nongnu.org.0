Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0428C2070A9
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 12:04:14 +0200 (CEST)
Received: from localhost ([::1]:39670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jo2GK-0002o2-Vu
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 06:04:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jo2Ea-00013J-1Y
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 06:02:24 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:31985
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jo2EX-0003Th-Pi
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 06:02:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592992939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9RPrktnTluPCsaQABxKg+rWRP/33VcrikRqxQOMJdpU=;
 b=JeQZ6o+AMUryjua+OHyYHTuHeW4kyjz0KVZWwG6XosQnBsJ1OoSWncs7NWEwBMyq5Znu1v
 /452iT0bHNH1lvLpuv/jm6H1men9uTfwniqn5iv/XpXJL86lmP5kv8iXblx7WuHhSnrjRG
 zkX9ypwoiz8PVT0w78S8s48PXpJNY+Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-6E_jCrTeMGiyBmEA9SbvBQ-1; Wed, 24 Jun 2020 06:02:16 -0400
X-MC-Unique: 6E_jCrTeMGiyBmEA9SbvBQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F05621B18BC0;
 Wed, 24 Jun 2020 10:02:14 +0000 (UTC)
Received: from localhost (ovpn-114-150.ams2.redhat.com [10.36.114.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A48E57168B;
 Wed, 24 Jun 2020 10:02:11 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 00/12] Block patches
Date: Wed, 24 Jun 2020 11:01:58 +0100
Message-Id: <20200624100210.59975-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=205.139.110.61; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 00:34:35
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCAxNzExOTlmNTZmNWY5YmRmMWU1ZDY3
MGQwOWVmMTM1MWQ4ZjAxYmFlOg0KDQogIE1lcmdlIHJlbW90ZS10cmFja2luZyBicmFuY2ggJ3Jl
bW90ZXMvYWxpc3RhaXIvdGFncy9wdWxsLXJpc2N2LXRvLWFwcGx5LTIwMjAwNjE5LTMnIGludG8g
c3RhZ2luZyAoMjAyMC0wNi0yMiAxNDo0NToyNSArMDEwMCkNCg0KYXJlIGF2YWlsYWJsZSBpbiB0
aGUgR2l0IHJlcG9zaXRvcnkgYXQ6DQoNCiAgaHR0cHM6Ly9naXRodWIuY29tL3N0ZWZhbmhhL3Fl
bXUuZ2l0IHRhZ3MvYmxvY2stcHVsbC1yZXF1ZXN0DQoNCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdl
cyB1cCB0byA3ODM4YzY3ZjIyYTgxZmNmNjY5Nzg1Y2Q2YzA4NzY0Mzg0MjIwNzFhOg0KDQogIGJs
b2NrL252bWU6IHN1cHBvcnQgbmVzdGVkIGFpb19wb2xsKCkgKDIwMjAtMDYtMjMgMTU6NDY6MDgg
KzAxMDApDQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0NClB1bGwgcmVxdWVzdA0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQoNCkRhbmllbGUgQnVv
bm8gKDQpOg0KICBjb3JvdXRpbmU6IHN1cHBvcnQgU2FmZVN0YWNrIGluIHVjb250ZXh0IGJhY2tl
bmQNCiAgY29yb3V0aW5lOiBhZGQgY2hlY2sgZm9yIFNhZmVTdGFjayBpbiBzaWdhbHRzdGFjaw0K
ICBjb25maWd1cmU6IGFkZCBmbGFncyB0byBzdXBwb3J0IFNhZmVTdGFjaw0KICBjaGVjay1ibG9j
azogZW5hYmxlIGlvdGVzdHMgd2l0aCBTYWZlU3RhY2sNCg0KU3RlZmFuIEhham5vY3ppICg4KToN
CiAgbWluaWtjb25mOiBleHBsaWNpdGx5IHNldCBlbmNvZGluZyB0byBVVEYtOA0KICBibG9jay9u
dm1lOiBwb2xsIHF1ZXVlcyB3aXRob3V0IHEtPmxvY2sNCiAgYmxvY2svbnZtZTogZHJvcCB0YXV0
b2xvZ291cyBhc3NlcnRpb24NCiAgYmxvY2svbnZtZTogZG9uJ3QgYWNjZXNzIENRRSBhZnRlciBt
b3ZpbmcgY3EuaGVhZA0KICBibG9jay9udm1lOiBzd2l0Y2ggdG8gYSBOVk1lUmVxdWVzdCBmcmVl
bGlzdA0KICBibG9jay9udm1lOiBjbGFyaWZ5IHRoYXQgZnJlZV9yZXFfcXVldWUgaXMgcHJvdGVj
dGVkIGJ5IHEtPmxvY2sNCiAgYmxvY2svbnZtZToga2VlcCBCRFJWTlZNZVN0YXRlIHBvaW50ZXIg
aW4gTlZNZVF1ZXVlUGFpcg0KICBibG9jay9udm1lOiBzdXBwb3J0IG5lc3RlZCBhaW9fcG9sbCgp
DQoNCiBjb25maWd1cmUgICAgICAgICAgICAgICAgICAgIHwgIDczICsrKysrKysrKysrKw0KIGlu
Y2x1ZGUvcWVtdS9jb3JvdXRpbmVfaW50LmggfCAgIDUgKw0KIGJsb2NrL252bWUuYyAgICAgICAg
ICAgICAgICAgfCAyMjAgKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0NCiB1dGls
L2Nvcm91dGluZS1zaWdhbHRzdGFjay5jIHwgICA0ICsNCiB1dGlsL2Nvcm91dGluZS11Y29udGV4
dC5jICAgIHwgIDI4ICsrKysrDQogYmxvY2svdHJhY2UtZXZlbnRzICAgICAgICAgICB8ICAgMiAr
LQ0KIHNjcmlwdHMvbWluaWtjb25mLnB5ICAgICAgICAgfCAgIDYgKy0NCiB0ZXN0cy9jaGVjay1i
bG9jay5zaCAgICAgICAgIHwgIDEyICstDQogOCBmaWxlcyBjaGFuZ2VkLCAyODQgaW5zZXJ0aW9u
cygrKSwgNjYgZGVsZXRpb25zKC0pDQoNCi0tIA0KMi4yNi4yDQoNCg==


