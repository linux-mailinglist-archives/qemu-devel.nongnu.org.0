Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F8B35C8CC
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 16:32:19 +0200 (CEST)
Received: from localhost ([::1]:58770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVxbu-0004Fa-GR
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 10:32:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lVxac-0003gz-25
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 10:30:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lVxaZ-0005Yz-UT
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 10:30:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618237854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8DhdbzN8kWd9sNt/Yr/XDn2YwH3qOzYTm56pAd+o/eg=;
 b=CZS9eb9ZL+oaYLQIOy0HJWjh89rPQfOKb73I1P5uXL+VNGA8seD6LQW5JLKzLWdkwDUPhv
 Zjf8MkVg3uIAECy0RzAtJj5CMYvN7cbAiQZ5QtBEmRKty6yWJIpnVELU37bruWYrFDqmy0
 xmG6HaLwTV11Hv2V+nxymBz6eW9SNdI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-93-GjmtHk9eMHikyC3VQUjWKw-1; Mon, 12 Apr 2021 10:30:53 -0400
X-MC-Unique: GjmtHk9eMHikyC3VQUjWKw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1031210054F6;
 Mon, 12 Apr 2021 14:30:52 +0000 (UTC)
Received: from localhost (ovpn-115-66.ams2.redhat.com [10.36.115.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 716012DAD0;
 Mon, 12 Apr 2021 14:30:51 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] libqtest: refuse QTEST_QEMU_BINARY=qemu-kvm
Date: Mon, 12 Apr 2021 15:30:50 +0100
Message-Id: <20210412143050.725918-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Qin Wang <qinwang@rehdat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

U29tZSBkb3duc3RyZWFtcyByZW5hbWUgdGhlIFFFTVUgYmluYXJ5IHRvICJxZW11LWt2bSIuIFRo
aXMgYnJlYWtzCnF0ZXN0X2dldF9hcmNoKCksIHdoaWNoIGF0dGVtcHRzIHRvIHBhcnNlIHRoZSB0
YXJnZXQgYXJjaGl0ZWN0dXJlIGZyb20KdGhlIFFURVNUX1FFTVVfQklOQVJZIGVudmlyb25tZW50
IHZhcmlhYmxlLgoKUHJpbnQgYW4gZXJyb3IgaW5zdGVhZCBvZiByZXR1cm5pbmcgdGhlIGFyY2hp
dGVjdHVyZSAia3ZtIi4gVGhpbmdzIGZhaWwKaW4gd2VpcmQgd2F5cyB3aGVuIHRoZSBhcmNoaXRl
Y3R1cmUgc3RyaW5nIGlzIGJvZ3VzLgoKQXJndWFibHkgcXRlc3RzIHNob3VsZCBhbHdheXMgYmUg
cnVuIGluIGEgYnVpbGQgZGlyZWN0b3J5IGluc3RlYWQgb2YKYWdhaW5zdCBhbiBpbnN0YWxsZWQg
UUVNVS4gSW4gYW55IGNhc2UsIHByaW50aW5nIGEgY2xlYXIgZXJyb3Igd2hlbiB0aGlzCmhhcHBl
bnMgaXMgaGVscGZ1bC4KClNpbmNlIHRoaXMgaXMgYW4gZXJyb3IgdGhhdCBpcyB0cmlnZ2VyZWQg
YnkgdGhlIHVzZXIgYW5kIG5vdCBhIHRlc3QKZmFpbHVyZSwgdXNlIGV4aXQoMSkgaW5zdGVhZCBv
ZiBhYm9ydCgpLiBDaGFuZ2UgdGhlIGV4aXN0aW5nIGFib3J0KCkKY2FsbCBpbiBxdGVzdF9nZXRf
YXJjaCgpIHRvIGV4aXQoMSkgdG9vIGZvciB0aGUgc2FtZSByZWFzb24gYW5kIHRvIGJlCmNvbnNp
c3RlbnQuCgpSZXBvcnRlZC1ieTogUWluIFdhbmcgPHFpbndhbmdAcmVoZGF0LmNvbT4KQ2M6IEVt
YW51ZWxlIEdpdXNlcHBlIEVzcG9zaXRvIDxlZXNwb3NpdEByZWRoYXQuY29tPgpTaWduZWQtb2Zm
LWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+Ci0tLQp2MzoKICogQWRk
IG5ld2xpbmUgdG8gd3JhcCBlcnJvciBtZXNzYWdlIG91dHB1dCBhdCA4MCBjb2x1bW5zIFtUaG9t
YXNdCiAqIERyb3AgaW5mb3JtYXRpb24gYWJvdXQgd29ya2luZyBhcm91bmQgdGhpcyB1c2luZyBh
IHN5bWxpbmsgW1Rob21hc10KICogVXNlIGV4aXQoMSkgaW5zdGVhZCBvZiBhYm9ydCgpIFtUaG9t
YXNdCgogdGVzdHMvcXRlc3QvbGlicXRlc3QuYyB8IDkgKysrKysrKystCiAxIGZpbGUgY2hhbmdl
ZCwgOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMvcXRl
c3QvbGlicXRlc3QuYyBiL3Rlc3RzL3F0ZXN0L2xpYnF0ZXN0LmMKaW5kZXggNzFlMzU5ZWZjZC4u
ODI1YjEzYTQ0YyAxMDA2NDQKLS0tIGEvdGVzdHMvcXRlc3QvbGlicXRlc3QuYworKysgYi90ZXN0
cy9xdGVzdC9saWJxdGVzdC5jCkBAIC05MDcsNyArOTA3LDE0IEBAIGNvbnN0IGNoYXIgKnF0ZXN0
X2dldF9hcmNoKHZvaWQpCiAKICAgICBpZiAoIWVuZCkgewogICAgICAgICBmcHJpbnRmKHN0ZGVy
ciwgIkNhbid0IGRldGVybWluZSBhcmNoaXRlY3R1cmUgZnJvbSBiaW5hcnkgbmFtZS5cbiIpOwot
ICAgICAgICBhYm9ydCgpOworICAgICAgICBleGl0KDEpOworICAgIH0KKworICAgIGlmICghc3Ry
c3RyKHFlbXUsICItc3lzdGVtLSIpKSB7CisgICAgICAgIGZwcmludGYoc3RkZXJyLCAiUVRFU1Rf
UUVNVV9CSU5BUlkgbXVzdCBlbmQgd2l0aCAqLXN5c3RlbS08YXJjaD4gIgorICAgICAgICAgICAg
ICAgICJ3aGVyZSAnYXJjaCcgaXMgdGhlIHRhcmdldFxuYXJjaGl0ZWN0dXJlICh4ODZfNjQsIGFh
cmNoNjQsICIKKyAgICAgICAgICAgICAgICAiZXRjKS5cbiIpOworICAgICAgICBleGl0KDEpOwog
ICAgIH0KIAogICAgIHJldHVybiBlbmQgKyAxOwotLSAKMi4zMC4yCgo=


