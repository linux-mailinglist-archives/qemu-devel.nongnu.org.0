Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0512030245A
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 12:39:00 +0100 (CET)
Received: from localhost ([::1]:47190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l40Cx-0006Ef-3t
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 06:38:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l409W-0003hM-OQ
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 06:35:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l409S-0002wk-9x
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 06:35:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611574520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cOf6nyTPlnRdfmzFb5l/dVpj2lJO2PQriUoXwJgsSww=;
 b=NtZtAs+h1uFEehz+9psf1TuLl4YMkFr2Na8ksI7Kol7QmNCY7Jf1PoyEL+KKmSIw4VCPVt
 VHD5lD0hLr27ZYQRif9BQVxjRolrm6tejrHK3WbitK/cTMxoAJEpI6OqWTuoAwltECuS7f
 B9G4KAoG2BBY5qQEDqkFlb1UJb+YXi8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-g9K9yMISNhGruR3bKhdkGg-1; Mon, 25 Jan 2021 06:35:18 -0500
X-MC-Unique: g9K9yMISNhGruR3bKhdkGg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 994F7803624;
 Mon, 25 Jan 2021 11:35:17 +0000 (UTC)
Received: from localhost (ovpn-115-94.ams2.redhat.com [10.36.115.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 37D185C737;
 Mon, 25 Jan 2021 11:35:14 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] error: rename error_with_timestamp to
 message_with_timestamp
Date: Mon, 25 Jan 2021 11:35:06 +0000
Message-Id: <20210125113507.224287-2-stefanha@redhat.com>
In-Reply-To: <20210125113507.224287-1-stefanha@redhat.com>
References: <20210125113507.224287-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhlIC1tc2cgdGltZXN0YW1wPW9ufG9mZiBvcHRpb24gY29udHJvbHMgd2hldGhlciBhIHRpbWVz
dGFtcCBpcyBwcmludGVkCndpdGggZXJyb3JfcmVwb3J0KCkgbWVzc2FnZXMuIFRoZSAiLW1zZyIg
bmFtZSBzdWdnZXN0cyB0aGF0IHRoaXMgb3B0aW9uCmhhcyBhIHdpZGVyIGVmZmVjdCB0aGFuIGp1
c3QgZXJyb3JfcmVwb3J0KCkuIFRoZSBuZXh0IHBhdGNoIGV4dGVuZHMgaXQKdG8gdGhlICdsb2cn
IHRyYWNlIGJhY2tlbmQsIHNvIHJlbmFtZSB0aGUgdmFyaWFibGUgZnJvbQplcnJvcl93aXRoX3Rp
bWVzdGFtcCB0byBtZXNzYWdlX3dpdGhfdGltZXN0YW1wLgoKU2lnbmVkLW9mZi1ieTogU3RlZmFu
IEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPgotLS0KIGluY2x1ZGUvcWVtdS9lcnJvci1y
ZXBvcnQuaCB8IDIgKy0KIHNvZnRtbXUvdmwuYyAgICAgICAgICAgICAgICB8IDIgKy0KIHV0aWwv
cWVtdS1lcnJvci5jICAgICAgICAgICB8IDQgKystLQogMyBmaWxlcyBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9xZW11L2Vycm9y
LXJlcG9ydC5oIGIvaW5jbHVkZS9xZW11L2Vycm9yLXJlcG9ydC5oCmluZGV4IGE1YWQ5NWZmMWIu
LjlkMTk3ZGFjYTMgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvcWVtdS9lcnJvci1yZXBvcnQuaAorKysg
Yi9pbmNsdWRlL3FlbXUvZXJyb3ItcmVwb3J0LmgKQEAgLTc0LDcgKzc0LDcgQEAgdm9pZCBlcnJv
cl9pbml0KGNvbnN0IGNoYXIgKmFyZ3YwKTsKIAogY29uc3QgY2hhciAqZXJyb3JfZ2V0X3Byb2du
YW1lKHZvaWQpOwogCi1leHRlcm4gYm9vbCBlcnJvcl93aXRoX3RpbWVzdGFtcDsKK2V4dGVybiBi
b29sIG1lc3NhZ2Vfd2l0aF90aW1lc3RhbXA7CiBleHRlcm4gYm9vbCBlcnJvcl93aXRoX2d1ZXN0
bmFtZTsKIGV4dGVybiBjb25zdCBjaGFyICplcnJvcl9ndWVzdF9uYW1lOwogCmRpZmYgLS1naXQg
YS9zb2Z0bW11L3ZsLmMgYi9zb2Z0bW11L3ZsLmMKaW5kZXggYTg4NzZiODk2NS4uYmQ1NTQ2ODY2
OSAxMDA2NDQKLS0tIGEvc29mdG1tdS92bC5jCisrKyBiL3NvZnRtbXUvdmwuYwpAQCAtNzM3LDcg
KzczNyw3IEBAIHN0YXRpYyB2b2lkIHJlYWx0aW1lX2luaXQodm9pZCkKIAogc3RhdGljIHZvaWQg
Y29uZmlndXJlX21zZyhRZW11T3B0cyAqb3B0cykKIHsKLSAgICBlcnJvcl93aXRoX3RpbWVzdGFt
cCA9IHFlbXVfb3B0X2dldF9ib29sKG9wdHMsICJ0aW1lc3RhbXAiLCBmYWxzZSk7CisgICAgbWVz
c2FnZV93aXRoX3RpbWVzdGFtcCA9IHFlbXVfb3B0X2dldF9ib29sKG9wdHMsICJ0aW1lc3RhbXAi
LCBmYWxzZSk7CiAgICAgZXJyb3Jfd2l0aF9ndWVzdG5hbWUgPSBxZW11X29wdF9nZXRfYm9vbChv
cHRzLCAiZ3Vlc3QtbmFtZSIsIGZhbHNlKTsKIH0KIApkaWZmIC0tZ2l0IGEvdXRpbC9xZW11LWVy
cm9yLmMgYi91dGlsL3FlbXUtZXJyb3IuYwppbmRleCBhYTMwZjAzNTY0Li41MmE5ZTAxM2M0IDEw
MDY0NAotLS0gYS91dGlsL3FlbXUtZXJyb3IuYworKysgYi91dGlsL3FlbXUtZXJyb3IuYwpAQCAt
MjUsNyArMjUsNyBAQCB0eXBlZGVmIGVudW0gewogfSByZXBvcnRfdHlwZTsKIAogLyogUHJlcGVu
ZCB0aW1lc3RhbXAgdG8gbWVzc2FnZXMgKi8KLWJvb2wgZXJyb3Jfd2l0aF90aW1lc3RhbXA7Citi
b29sIG1lc3NhZ2Vfd2l0aF90aW1lc3RhbXA7CiBib29sIGVycm9yX3dpdGhfZ3Vlc3RuYW1lOwog
Y29uc3QgY2hhciAqZXJyb3JfZ3Vlc3RfbmFtZTsKIApAQCAtMjA4LDcgKzIwOCw3IEBAIHN0YXRp
YyB2b2lkIHZyZXBvcnQocmVwb3J0X3R5cGUgdHlwZSwgY29uc3QgY2hhciAqZm10LCB2YV9saXN0
IGFwKQogICAgIEdUaW1lVmFsIHR2OwogICAgIGdjaGFyICp0aW1lc3RyOwogCi0gICAgaWYgKGVy
cm9yX3dpdGhfdGltZXN0YW1wICYmICFtb25pdG9yX2N1cigpKSB7CisgICAgaWYgKG1lc3NhZ2Vf
d2l0aF90aW1lc3RhbXAgJiYgIW1vbml0b3JfY3VyKCkpIHsKICAgICAgICAgZ19nZXRfY3VycmVu
dF90aW1lKCZ0dik7CiAgICAgICAgIHRpbWVzdHIgPSBnX3RpbWVfdmFsX3RvX2lzbzg2MDEoJnR2
KTsKICAgICAgICAgZXJyb3JfcHJpbnRmKCIlcyAiLCB0aW1lc3RyKTsKLS0gCjIuMjkuMgoK


