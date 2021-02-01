Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A710E30AC2D
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 17:01:55 +0100 (CET)
Received: from localhost ([::1]:46994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6beE-0005rQ-Kv
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 11:01:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l6bTA-0001mb-Mf
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:50:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l6bT7-00086X-1X
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:50:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612194623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4p3cFaJrxY2t1gwr/N4Nd8NbirLWXZLRVYNPehY0rHI=;
 b=LpqHe4xnU1b3aCgHsBYNmwl8/pU1kpsNk39G4vW9AI1Rq6lWRP8z7fGDKY62Du4ctp4+b6
 y7jcMzBumVtF2mOBLoqxKAm3i+QuvH/dgvfmmpRHL+XGupx1xjGanrT5ZJxoGymxWngMUl
 n8Yxb4b1XNnwZk0RDWpbzSLKWgunm90=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-BUgqfHWjNeeiDdkK-O-JTQ-1; Mon, 01 Feb 2021 10:50:21 -0500
X-MC-Unique: BUgqfHWjNeeiDdkK-O-JTQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0012310A92FB;
 Mon,  1 Feb 2021 15:48:05 +0000 (UTC)
Received: from localhost (ovpn-115-140.ams2.redhat.com [10.36.115.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 953615D735;
 Mon,  1 Feb 2021 15:48:05 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/11] simpletrace: build() missing 2 required positional
 arguments
Date: Mon,  1 Feb 2021 15:47:01 +0000
Message-Id: <20210201154703.180022-10-stefanha@redhat.com>
In-Reply-To: <20210201154703.180022-1-stefanha@redhat.com>
References: <20210201154703.180022-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogVm9sa2VyIFLDvG1lbGluIDx2cl9xZW11QHQtb25saW5lLmRlPgoKQ29tbWl0IDRlNjZj
OWVmNjQgInRyYWNldG9vbDogYWRkIGlucHV0IGZpbGVuYW1lIGFuZCBsaW5lIG51bWJlciB0bwpF
dmVudCIgZm9yZ290IHRvIGFkZCBhIGxpbmUgbnVtYmVyIGFuZCBhIGZpbGVuYW1lIGFyZ3VtZW50
IGF0IG9uZQpidWlsZCBtZXRob2QgY2FsbCBzaXRlLgoKVHJhY2ViYWNrIChtb3N0IHJlY2VudCBj
YWxsIGxhc3QpOgogIEZpbGUgIi4vc2NyaXB0cy9zaW1wbGV0cmFjZS5weSIsIGxpbmUgMjYxLCBp
biA8bW9kdWxlPgogICAgcnVuKEZvcm1hdHRlcigpKQogIEZpbGUgIi4vc2NyaXB0cy9zaW1wbGV0
cmFjZS5weSIsIGxpbmUgMjM2LCBpbiBydW4KICAgIHByb2Nlc3MoZXZlbnRzLCBzeXMuYXJndlsy
XSwgYW5hbHl6ZXIsIHJlYWRfaGVhZGVyPXJlYWRfaGVhZGVyKQogIEZpbGUgIi4vc2NyaXB0cy9z
aW1wbGV0cmFjZS5weSIsIGxpbmUgMTc3LCBpbiBwcm9jZXNzCiAgICBkcm9wcGVkX2V2ZW50ID0K
ICAgICAgRXZlbnQuYnVpbGQoIkRyb3BwZWRfRXZlbnQodWludDY0X3QgbnVtX2V2ZW50c19kcm9w
cGVkKSIpClR5cGVFcnJvcjogYnVpbGQoKSBtaXNzaW5nIDIgcmVxdWlyZWQgcG9zaXRpb25hbCBh
cmd1bWVudHM6CiAgJ2xpbmVubycgYW5kICdmaWxlbmFtZScKCkFkZCB0aGUgbWlzc2luZyBhcmd1
bWVudHMuCgpTaWduZWQtb2ZmLWJ5OiBWb2xrZXIgUsO8bWVsaW4gPHZyX3FlbXVAdC1vbmxpbmUu
ZGU+ClJldmlld2VkLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8ZjRidWdAYW1zYXQub3Jn
PgpNZXNzYWdlLWlkOiAyMDIxMDEzMTE3MzQxNS4zMzkyLTEtdnJfcWVtdUB0LW9ubGluZS5kZQpT
aWduZWQtb2ZmLWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+Ci0tLQog
c2NyaXB0cy9zaW1wbGV0cmFjZS5weSB8IDQgKysrLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3NjcmlwdHMvc2ltcGxldHJhY2Uu
cHkgYi9zY3JpcHRzL3NpbXBsZXRyYWNlLnB5CmluZGV4IDIwZjAwMjYwNjYuLmQ2MWZiMGJkODcg
MTAwNzU1Ci0tLSBhL3NjcmlwdHMvc2ltcGxldHJhY2UucHkKKysrIGIvc2NyaXB0cy9zaW1wbGV0
cmFjZS5weQpAQCAtMTc0LDcgKzE3NCw5IEBAIGRlZiBwcm9jZXNzKGV2ZW50cywgbG9nLCBhbmFs
eXplciwgcmVhZF9oZWFkZXI9VHJ1ZSk6CiAgICAgaWYgcmVhZF9oZWFkZXI6CiAgICAgICAgIHJl
YWRfdHJhY2VfaGVhZGVyKGxvZykKIAotICAgIGRyb3BwZWRfZXZlbnQgPSBFdmVudC5idWlsZCgi
RHJvcHBlZF9FdmVudCh1aW50NjRfdCBudW1fZXZlbnRzX2Ryb3BwZWQpIikKKyAgICBmcmFtZWlu
Zm8gPSBpbnNwZWN0LmdldGZyYW1laW5mbyhpbnNwZWN0LmN1cnJlbnRmcmFtZSgpKQorICAgIGRy
b3BwZWRfZXZlbnQgPSBFdmVudC5idWlsZCgiRHJvcHBlZF9FdmVudCh1aW50NjRfdCBudW1fZXZl
bnRzX2Ryb3BwZWQpIiwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZnJhbWVpbmZv
LmxpbmVubyArIDEsIGZyYW1laW5mby5maWxlbmFtZSkKICAgICBlZGljdCA9IHsiZHJvcHBlZCI6
IGRyb3BwZWRfZXZlbnR9CiAgICAgaWR0b25hbWUgPSB7ZHJvcHBlZF9ldmVudF9pZDogImRyb3Bw
ZWQifQogCi0tIAoyLjI5LjIKCg==


