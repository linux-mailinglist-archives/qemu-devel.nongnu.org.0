Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 569582E975B
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 15:35:45 +0100 (CET)
Received: from localhost ([::1]:42858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwQxU-0007t2-Bo
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 09:35:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kwQu1-00069y-9I
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 09:32:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kwQtz-0000yb-H3
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 09:32:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609770726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=obD3qSTMw3n4C1f6m1wW9WuZJhfO/kPfGgqxSpt6MoI=;
 b=SaJPH5sTL+Eejqr9ebfQNhm3Vwm5mprM3fYQbO+pbj03l3iO2YwZtBKMWrbNreOE9zZw0B
 lH5uBw6ORedoN7lgEJtgLY8vyh03FB9llCWzCkKN+9KYObZ2DkncfcTXTkYsbUDi3mSgZ1
 PHMvPT5CbaLSD3a4vHrNxXuABGLmuYc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-576-OLf8X1bbPX2bUcYlCJxjVg-1; Mon, 04 Jan 2021 09:32:04 -0500
X-MC-Unique: OLf8X1bbPX2bUcYlCJxjVg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2CE8180E461;
 Mon,  4 Jan 2021 14:32:03 +0000 (UTC)
Received: from localhost (ovpn-113-37.ams2.redhat.com [10.36.113.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 32B965D9D5;
 Mon,  4 Jan 2021 14:32:00 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/5] trace: Send "-d trace:help" output to stdout
Date: Mon,  4 Jan 2021 14:31:50 +0000
Message-Id: <20210104143154.462212-2-stefanha@redhat.com>
In-Reply-To: <20210104143154.462212-1-stefanha@redhat.com>
References: <20210104143154.462212-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Doug Evans <dje@google.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogRG91ZyBFdmFucyA8ZGplQGdvb2dsZS5jb20+CgouLi4gZm9yIGNvbnNpc3RlbmN5IHdp
dGggIi1kIGhlbHAiLgoKU2lnbmVkLW9mZi1ieTogRG91ZyBFdmFucyA8ZGplQGdvb2dsZS5jb20+
Ck1lc3NhZ2UtaWQ6IDIwMjAxMTI1MjE1MjQ1LjM1MTQ2OTUtMS1kamVAZ29vZ2xlLmNvbQpTaWdu
ZWQtb2ZmLWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+Ci0tLQogdHJh
Y2UvY29udHJvbC5oIHwgIDMgKystCiB0cmFjZS9jb250cm9sLmMgfCAxMiArKysrKystLS0tLS0K
IDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL3RyYWNlL2NvbnRyb2wuaCBiL3RyYWNlL2NvbnRyb2wuaAppbmRleCAwNWI5NWVhNDUz
Li45NTIyYTdiMzE4IDEwMDY0NAotLS0gYS90cmFjZS9jb250cm9sLmgKKysrIGIvdHJhY2UvY29u
dHJvbC5oCkBAIC0yMDEsMTAgKzIwMSwxMSBAQCB2b2lkIHRyYWNlX2ZpbmlfdmNwdShDUFVTdGF0
ZSAqdmNwdSk7CiAKIC8qKgogICogdHJhY2VfbGlzdF9ldmVudHM6CisgKiBAZjogV2hlcmUgdG8g
c2VuZCBvdXRwdXQuCiAgKgogICogTGlzdCBhbGwgYXZhaWxhYmxlIGV2ZW50cy4KICAqLwotdm9p
ZCB0cmFjZV9saXN0X2V2ZW50cyh2b2lkKTsKK3ZvaWQgdHJhY2VfbGlzdF9ldmVudHMoRklMRSAq
Zik7CiAKIC8qKgogICogdHJhY2VfZW5hYmxlX2V2ZW50czoKZGlmZiAtLWdpdCBhL3RyYWNlL2Nv
bnRyb2wuYyBiL3RyYWNlL2NvbnRyb2wuYwppbmRleCBiODJmYjg3MzE2Li5jZDA0ZGQ0ZTBjIDEw
MDY0NAotLS0gYS90cmFjZS9jb250cm9sLmMKKysrIGIvdHJhY2UvY29udHJvbC5jCkBAIC0xMjUs
MTggKzEyNSwxOCBAQCBUcmFjZUV2ZW50ICp0cmFjZV9ldmVudF9pdGVyX25leHQoVHJhY2VFdmVu
dEl0ZXIgKml0ZXIpCiAgICAgcmV0dXJuIE5VTEw7CiB9CiAKLXZvaWQgdHJhY2VfbGlzdF9ldmVu
dHModm9pZCkKK3ZvaWQgdHJhY2VfbGlzdF9ldmVudHMoRklMRSAqZikKIHsKICAgICBUcmFjZUV2
ZW50SXRlciBpdGVyOwogICAgIFRyYWNlRXZlbnQgKmV2OwogICAgIHRyYWNlX2V2ZW50X2l0ZXJf
aW5pdCgmaXRlciwgTlVMTCk7CiAgICAgd2hpbGUgKChldiA9IHRyYWNlX2V2ZW50X2l0ZXJfbmV4
dCgmaXRlcikpICE9IE5VTEwpIHsKLSAgICAgICAgZnByaW50ZihzdGRlcnIsICIlc1xuIiwgdHJh
Y2VfZXZlbnRfZ2V0X25hbWUoZXYpKTsKKyAgICAgICAgZnByaW50ZihmLCAiJXNcbiIsIHRyYWNl
X2V2ZW50X2dldF9uYW1lKGV2KSk7CiAgICAgfQogI2lmZGVmIENPTkZJR19UUkFDRV9EVFJBQ0UK
LSAgICBmcHJpbnRmKHN0ZGVyciwgIlRoaXMgbGlzdCBvZiBuYW1lcyBvZiB0cmFjZSBwb2ludHMg
bWF5IGJlIGluY29tcGxldGUgIgotICAgICAgICAgICAgICAgICAgICAid2hlbiB1c2luZyB0aGUg
RFRyYWNlL1N5c3RlbVRhcCBiYWNrZW5kcy5cbiIKLSAgICAgICAgICAgICAgICAgICAgIlJ1biAn
cWVtdS10cmFjZS1zdGFwIGxpc3QgJXMnIHRvIHByaW50IHRoZSBmdWxsIGxpc3QuXG4iLAorICAg
IGZwcmludGYoZiwgIlRoaXMgbGlzdCBvZiBuYW1lcyBvZiB0cmFjZSBwb2ludHMgbWF5IGJlIGlu
Y29tcGxldGUgIgorICAgICAgICAgICAgICAgIndoZW4gdXNpbmcgdGhlIERUcmFjZS9TeXN0ZW1U
YXAgYmFja2VuZHMuXG4iCisgICAgICAgICAgICAgICAiUnVuICdxZW11LXRyYWNlLXN0YXAgbGlz
dCAlcycgdG8gcHJpbnQgdGhlIGZ1bGwgbGlzdC5cbiIsCiAgICAgICAgICAgICBlcnJvcl9nZXRf
cHJvZ25hbWUoKSk7CiAjZW5kaWYKIH0KQEAgLTE3Niw3ICsxNzYsNyBAQCBzdGF0aWMgdm9pZCBk
b190cmFjZV9lbmFibGVfZXZlbnRzKGNvbnN0IGNoYXIgKmxpbmVfYnVmKQogdm9pZCB0cmFjZV9l
bmFibGVfZXZlbnRzKGNvbnN0IGNoYXIgKmxpbmVfYnVmKQogewogICAgIGlmIChpc19oZWxwX29w
dGlvbihsaW5lX2J1ZikpIHsKLSAgICAgICAgdHJhY2VfbGlzdF9ldmVudHMoKTsKKyAgICAgICAg
dHJhY2VfbGlzdF9ldmVudHMoc3Rkb3V0KTsKICAgICAgICAgaWYgKG1vbml0b3JfY3VyKCkgPT0g
TlVMTCkgewogICAgICAgICAgICAgZXhpdCgwKTsKICAgICAgICAgfQotLSAKMi4yOS4yCgo=


