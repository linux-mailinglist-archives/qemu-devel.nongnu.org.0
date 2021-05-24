Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9FC38E714
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 15:03:49 +0200 (CEST)
Received: from localhost ([::1]:60024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llAFI-0002m4-AQ
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 09:03:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1llACM-00011F-3h
 for qemu-devel@nongnu.org; Mon, 24 May 2021 09:00:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1llACH-0006uc-Te
 for qemu-devel@nongnu.org; Mon, 24 May 2021 09:00:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621861239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4wl7rPXXt8P9kkmc9QSDTY04lprPBtJFDtc2ENHnivc=;
 b=LWVWSO00QfHZxpxys8fCVBiTcX0EAdxkRYz5C15GnxsCjuruThM/HvxoQlWyAK2lJXxo95
 j4hTjAy5ttTcDaApIq2JQ33Qk5pg49f16gTRg218reQ/kAOx+N8xNC5jHNQX78W5iJlAZP
 0VdrVigSDMP9vhPtIIPhVJRi3b4eGZA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-gIHmn_VuMReXu7zrlU18eQ-1; Mon, 24 May 2021 09:00:35 -0400
X-MC-Unique: gIHmn_VuMReXu7zrlU18eQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 184151005D53;
 Mon, 24 May 2021 13:00:34 +0000 (UTC)
Received: from localhost (ovpn-113-244.ams2.redhat.com [10.36.113.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 105BA77F22;
 Mon, 24 May 2021 13:00:24 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL for-6.0 0/8] Block patches
Date: Mon, 24 May 2021 14:00:16 +0100
Message-Id: <20210524130024.50651-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: Fam Zheng <fam@euphon.net>, John G Johnson <john.g.johnson@oracle.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Max Reitz <mreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
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
LS0tLS0tLS0tLS0tLS0tLS0tLQ0KUHVsbCByZXF1ZXN0DQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCg0KUGFvbG8gQm9u
emluaSAoNik6DQogIGNvcm91dGluZS1zbGVlcDogdXNlIGEgc3RhY2stYWxsb2NhdGVkIHRpbWVy
DQogIGNvcm91dGluZS1zbGVlcDogZGlzYWxsb3cgTlVMTCBRZW11Q29TbGVlcFN0YXRlKiogYXJn
dW1lbnQNCiAgY29yb3V0aW5lLXNsZWVwOiBhbGxvdyBxZW11X2NvX3NsZWVwX3dha2UgdGhhdCB3
YWtlcyBub3RoaW5nDQogIGNvcm91dGluZS1zbGVlcDogbW92ZSB0aW1lciBvdXQgb2YgUWVtdUNv
U2xlZXBTdGF0ZQ0KICBjb3JvdXRpbmUtc2xlZXA6IHJlcGxhY2UgUWVtdUNvU2xlZXBTdGF0ZSBw
b2ludGVyIHdpdGggc3RydWN0IGluIHRoZQ0KICAgIEFQSQ0KICBjb3JvdXRpbmUtc2xlZXA6IGlu
dHJvZHVjZSBxZW11X2NvX3NsZWVwDQoNClBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpICgxKToNCiAg
Yml0b3BzLmg6IEltcHJvdmUgZmluZF94eHhfYml0KCkgZG9jdW1lbnRhdGlvbg0KDQpaZW5naHVp
IFl1ICgxKToNCiAgbXVsdGktcHJvY2VzczogSW5pdGlhbGl6ZSB2YXJpYWJsZXMgZGVjbGFyZWQg
d2l0aCBnX2F1dG8qDQoNCiBpbmNsdWRlL3FlbXUvYml0b3BzLmggICAgICAgfCAxNSArKysrKyst
LQ0KIGluY2x1ZGUvcWVtdS9jb3JvdXRpbmUuaCAgICB8IDI3ICsrKysrKysrLS0tLS0NCiBibG9j
ay9ibG9jay1jb3B5LmMgICAgICAgICAgfCAxMCArKy0tLQ0KIGJsb2NrL25iZC5jICAgICAgICAg
ICAgICAgICB8IDE0ICsrKy0tLS0NCiBody9yZW1vdGUvbWVtb3J5LmMgICAgICAgICAgfCAgNSAr
LS0NCiBody9yZW1vdGUvcHJveHkuYyAgICAgICAgICAgfCAgMyArLQ0KIHV0aWwvcWVtdS1jb3Jv
dXRpbmUtc2xlZXAuYyB8IDc1ICsrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0N
CiA3IGZpbGVzIGNoYW5nZWQsIDc5IGluc2VydGlvbnMoKyksIDcwIGRlbGV0aW9ucygtKQ0KDQot
LSANCjIuMzEuMQ0KDQo=


