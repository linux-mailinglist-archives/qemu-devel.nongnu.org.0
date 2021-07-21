Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F513D0F51
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 15:16:01 +0200 (CEST)
Received: from localhost ([::1]:35684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6C4u-0004xV-EI
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 09:16:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m6C2H-0002xw-8I
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 09:13:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m6C2E-0006aF-RD
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 09:13:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626873194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5GRASMVsIM0ZZXxS/i5+FjCQ5gz0nAkmQis3DzOZWV0=;
 b=fd1a3/+0sjsw2OX8OCSHJzPlS8+q24u8ncueZx8nwQgmDDOH11YVyc7L+u19+Vm3L9kNwL
 PO6iCC87f0UcvUOSGjGsu2BWNtdBK2mOxb86/+uRzL5u5YuRsoucxfHoEWp3k2Xw2Fdbck
 dY5P2a8iHhMnTgl0kvhnAzSnr0XOCG8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-mg5AlRttP2mWDBh5-xzIyg-1; Wed, 21 Jul 2021 09:13:11 -0400
X-MC-Unique: mg5AlRttP2mWDBh5-xzIyg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D64291009E5B;
 Wed, 21 Jul 2021 13:12:59 +0000 (UTC)
Received: from localhost (ovpn-114-233.ams2.redhat.com [10.36.114.233])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 904E61F5;
 Wed, 21 Jul 2021 13:12:54 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL for-6.1 0/3] Block patches
Date: Wed, 21 Jul 2021 14:12:50 +0100
Message-Id: <20210721131253.275821-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA4MDFmM2RiNzU2NGRjY2U4YTM3YTcw
ODMzYzBhYmU0MGVjMTlmOGNlOg0KDQogIE1lcmdlIHJlbW90ZS10cmFja2luZyBicmFuY2ggJ3Jl
bW90ZXMvcGhpbG1kL3RhZ3Mva2NvbmZpZy0yMDIxMDcyMCcgaW50byBzdGFnaW5nICgyMDIxLTA3
LTIwIDE5OjMwOjI4ICswMTAwKQ0KDQphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9y
eSBhdDoNCg0KICBodHRwczovL2dpdGxhYi5jb20vc3RlZmFuaGEvcWVtdS5naXQgdGFncy9ibG9j
ay1wdWxsLXJlcXVlc3QNCg0KZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIGQ3ZGRkMGEx
NjE4YTc1YjMxZGMzMDhiYjM3MzY1Y2UxZGE5NzIxNTQ6DQoNCiAgbGludXgtYWlvOiBsaW1pdCB0
aGUgYmF0Y2ggc2l6ZSB1c2luZyBgYWlvLW1heC1iYXRjaGAgcGFyYW1ldGVyICgyMDIxLTA3LTIx
IDEzOjQ3OjUwICswMTAwKQ0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpQdWxsIHJlcXVlc3QNCg0KU3RlZmFubydzIHBl
cmZvcm1hbmNlIHJlZ3Jlc3Npb24gZml4IGZvciBjb21taXQgMjU1OGNiOGRkNCAoImxpbnV4LWFp
bzoNCmluY3JlYXNpbmcgTUFYX0VWRU5UUyB0byBhIGxhcmdlciBoYXJkY29kZWQgdmFsdWUiKS4N
Cg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQ0KDQpTdGVmYW5vIEdhcnphcmVsbGEgKDMpOg0KICBpb3RocmVhZDogZ2VuZXJh
bGl6ZSBpb3RocmVhZF9zZXRfcGFyYW0vaW90aHJlYWRfZ2V0X3BhcmFtDQogIGlvdGhyZWFkOiBh
ZGQgYWlvLW1heC1iYXRjaCBwYXJhbWV0ZXINCiAgbGludXgtYWlvOiBsaW1pdCB0aGUgYmF0Y2gg
c2l6ZSB1c2luZyBgYWlvLW1heC1iYXRjaGAgcGFyYW1ldGVyDQoNCiBxYXBpL21pc2MuanNvbiAg
ICAgICAgICAgIHwgIDYgKystDQogcWFwaS9xb20uanNvbiAgICAgICAgICAgICB8ICA3ICsrKy0N
CiBpbmNsdWRlL2Jsb2NrL2Fpby5oICAgICAgIHwgMTIgKysrKysrDQogaW5jbHVkZS9zeXNlbXUv
aW90aHJlYWQuaCB8ICAzICsrDQogYmxvY2svbGludXgtYWlvLmMgICAgICAgICB8ICA5ICsrKyst
DQogaW90aHJlYWQuYyAgICAgICAgICAgICAgICB8IDgyICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKystLS0tLQ0KIG1vbml0b3IvaG1wLWNtZHMuYyAgICAgICAgfCAgMiArDQogdXRp
bC9haW8tcG9zaXguYyAgICAgICAgICB8IDEyICsrKysrKw0KIHV0aWwvYWlvLXdpbjMyLmMgICAg
ICAgICAgfCAgNSArKysNCiB1dGlsL2FzeW5jLmMgICAgICAgICAgICAgIHwgIDIgKw0KIHFlbXUt
b3B0aW9ucy5oeCAgICAgICAgICAgfCAgOCArKystDQogMTEgZmlsZXMgY2hhbmdlZCwgMTM0IGlu
c2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQ0KDQotLSANCjIuMzEuMQ0KDQo=


