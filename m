Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E81B3C140C
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 15:14:51 +0200 (CEST)
Received: from localhost ([::1]:44930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Tre-0005qA-Gn
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 09:14:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m1Tp1-00021I-0N
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 09:12:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m1Tok-0000dC-Ax
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 09:12:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625749909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2Rmka2+mWmLRqVir9uV++5ePj+mfhWg3aqXSUlf32TY=;
 b=T7Cf863YDO9cY+fXbbKi5fQFgk88p8bESDcwkAUJtBBl7fL1bMQmE0TrQF89tNX2YqaUX4
 fSa9z3PpokwVW4aZ8E7cRqX5bbUWsbPu083Ldsn38tFhsNDJLTEw4Gwyr1SkBb60wgdV1Y
 W+C0RyqEJSrzVUkT/WRppvmw2PemVuM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-yDbKeciANG2VqFvjhC3jbw-1; Thu, 08 Jul 2021 09:11:48 -0400
X-MC-Unique: yDbKeciANG2VqFvjhC3jbw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F0991098481;
 Thu,  8 Jul 2021 13:11:47 +0000 (UTC)
Received: from localhost (ovpn-114-141.ams2.redhat.com [10.36.114.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AA05C5C1D5;
 Thu,  8 Jul 2021 13:11:44 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 0/5] Block patches
Date: Thu,  8 Jul 2021 14:11:38 +0100
Message-Id: <20210708131143.240647-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA3MTFjMDQxOGM4YzFjZTNhMjQzNDZm
MDU4YjAwMWM0YzVhMmYwZjgxOg0KDQogIE1lcmdlIHJlbW90ZS10cmFja2luZyBicmFuY2ggJ3Jl
bW90ZXMvcGhpbG1kL3RhZ3MvbWlwcy0yMDIxMDcwMicgaW50byBzdGFnaW5nICgyMDIxLTA3LTA0
IDE0OjA0OjEyICswMTAwKQ0KDQphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBh
dDoNCg0KICBodHRwczovL2dpdGxhYi5jb20vc3RlZmFuaGEvcWVtdS5naXQgdGFncy9ibG9jay1w
dWxsLXJlcXVlc3QNCg0KZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDlmNDYwYzY0ZTEz
ODk3MTE3ZjM1ZmZiNjFmNmY1ZTAxMDJjYWJjNzA6DQoNCiAgYmxvY2svaW86IE1lcmdlIGRpc2Nh
cmQgcmVxdWVzdCBhbGlnbm1lbnRzICgyMDIxLTA3LTA2IDE0OjI4OjU1ICswMTAwKQ0KDQotLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tDQpQdWxsIHJlcXVlc3QNCg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KDQpBa2loaWtvIE9kYWtpICgzKToNCiAgYmxv
Y2svZmlsZS1wb3NpeDogT3B0aW1pemUgZm9yIG1hY09TDQogIGJsb2NrOiBBZGQgYmFja2VuZF9k
ZWZhdWx0cyBwcm9wZXJ0eQ0KICBibG9jay9pbzogTWVyZ2UgZGlzY2FyZCByZXF1ZXN0IGFsaWdu
bWVudHMNCg0KU3RlZmFuIEhham5vY3ppICgyKToNCiAgdXRpbC9hc3luYzogYWRkIGEgaHVtYW4t
cmVhZGFibGUgbmFtZSB0byBCSHMgZm9yIGRlYnVnZ2luZw0KICB1dGlsL2FzeW5jOiBwcmludCBs
ZWFrZWQgQkggbmFtZSB3aGVuIEFpb0NvbnRleHQgZmluYWxpemVzDQoNCiBpbmNsdWRlL2Jsb2Nr
L2Fpby5oICAgICAgICAgICAgfCAzMSArKysrKysrKysrKysrKysrKysrKysrLS0tDQogaW5jbHVk
ZS9ody9ibG9jay9ibG9jay5oICAgICAgIHwgIDMgKysrDQogaW5jbHVkZS9xZW11L21haW4tbG9v
cC5oICAgICAgIHwgIDQgKysrLQ0KIGJsb2NrL2ZpbGUtcG9zaXguYyAgICAgICAgICAgICB8IDI3
ICsrKysrKysrKysrKysrKysrKysrLS0NCiBibG9jay9pby5jICAgICAgICAgICAgICAgICAgICAg
fCAgMiArKw0KIGh3L2Jsb2NrL2Jsb2NrLmMgICAgICAgICAgICAgICB8IDQyICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKy0tLS0NCiB0ZXN0cy91bml0L3B0aW1lci10ZXN0LXN0dWJzLmMg
fCAgMiArLQ0KIHV0aWwvYXN5bmMuYyAgICAgICAgICAgICAgICAgICB8IDI1ICsrKysrKysrKysr
KysrKystLS0tDQogdXRpbC9tYWluLWxvb3AuYyAgICAgICAgICAgICAgIHwgIDQgKystLQ0KIHRl
c3RzL3FlbXUtaW90ZXN0cy8xNzIub3V0ICAgICB8IDM4ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKw0KIDEwIGZpbGVzIGNoYW5nZWQsIDE2MSBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlv
bnMoLSkNCg0KLS0gDQoyLjMxLjENCg0K


