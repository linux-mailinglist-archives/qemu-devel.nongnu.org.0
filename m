Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9333D55EB
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 10:54:54 +0200 (CEST)
Received: from localhost ([::1]:59588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7wNx-0002dy-UJ
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 04:54:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m7wMQ-00017O-C0
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 04:53:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m7wMO-00079w-QX
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 04:53:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627289596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=O2yWeHJ1k6anG1eKAi5ivtvIIuLZIovVBfRz+5qxj1o=;
 b=EF+GOyCXr+jJ55UkbMr6Y/AdffpZSU7Dz+fFIf6yelmDZqc1/iNsrs8kwn/YbhaHp8cxN6
 9jR2kQusbKKINvVAyEXqNho9L/5g+Zn+AWxMpM4sO6K8ib4/adxpTM/znmIkurpUCcHhl0
 cxBU8pz1G4wHaeTdCX74q/H5ESc7ExY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-nsIZbNCUMPaHHI7WtF9eRQ-1; Mon, 26 Jul 2021 04:53:13 -0400
X-MC-Unique: nsIZbNCUMPaHHI7WtF9eRQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1513CC621;
 Mon, 26 Jul 2021 08:53:11 +0000 (UTC)
Received: from localhost (ovpn-113-151.ams2.redhat.com [10.36.113.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 891426A8F8;
 Mon, 26 Jul 2021 08:53:07 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL for-6.1 0/1] Block patches
Date: Mon, 26 Jul 2021 09:53:05 +0100
Message-Id: <20210726085306.729309-1-stefanha@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBhMjM3NjUwN2Y2MTU0OTViMWQxNjY4
NTQ0OWNlMGVhNzhjMmNhZjlkOg0KDQogIE1lcmdlIHJlbW90ZS10cmFja2luZyBicmFuY2ggJ3Jl
bW90ZXMvYm9uemluaS1naXRsYWIvdGFncy9mb3ItdXBzdHJlYW0nIGludG8gc3RhZ2luZyAoMjAy
MS0wNy0yNCAxMTowNDo1NyArMDEwMCkNCg0KYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9z
aXRvcnkgYXQ6DQoNCiAgaHR0cHM6Ly9naXRsYWIuY29tL3N0ZWZhbmhhL3FlbXUuZ2l0IHRhZ3Mv
YmxvY2stcHVsbC1yZXF1ZXN0DQoNCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byAxNWE3
MzBlN2EzYWFhYzE4MGRmNzJjZDU3MzBlMDYxN2JjZjQ0YTVhOg0KDQogIGJsb2NrL252bWU6IEZp
eCBWRklPX01BUF9ETUEgZmFpbGVkOiBObyBzcGFjZSBsZWZ0IG9uIGRldmljZSAoMjAyMS0wNy0y
NiAwOTozODoxMiArMDEwMCkNCg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KUHVsbCByZXF1ZXN0DQoNClBoaWwncyBibG9j
ay9udm1lLmMgRU5PU1BDIGZpeCBmb3IgbmV3ZXIgTGludXgga2VybmVscyB0aGF0IHJldHVybiB0
aGlzIGVycm5vLg0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tDQoNClBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpICgxKToNCiAg
YmxvY2svbnZtZTogRml4IFZGSU9fTUFQX0RNQSBmYWlsZWQ6IE5vIHNwYWNlIGxlZnQgb24gZGV2
aWNlDQoNCiBibG9jay9udm1lLmMgfCAyMiArKysrKysrKysrKysrKysrKysrKysrDQogMSBmaWxl
IGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKykNCg0KLS0gDQoyLjMxLjENCg0K


