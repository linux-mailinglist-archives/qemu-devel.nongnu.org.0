Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4492F11E7
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 12:52:13 +0100 (CET)
Received: from localhost ([::1]:33862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyvk5-00022v-0H
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 06:52:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kyvib-0000lR-T4
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 06:50:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kyvia-0006lf-3n
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 06:50:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610365838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xm8QHIWg8JIxvxz/1fkSr4r0PjiSUTcRbmY5lFf/Hhc=;
 b=O86qNhnQh3zmoWsPRrBZZvV4uzvsZY8K2T58KpXj8MH7x2wvIJSzhSBhGPGxZ9xJXYpnpq
 gPr/hrk8xghzZavzQb8KPKJ+0XjMY1mLiLSVl0k63d3xtHxKiNRsLPJaXq8EZf6cCaiRjj
 eC0jRREu19CEeDQJl7M2Rezma37MOeY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492--paTIGJEMbaUZIp11VeTfw-1; Mon, 11 Jan 2021 06:50:35 -0500
X-MC-Unique: -paTIGJEMbaUZIp11VeTfw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7EA18030A0;
 Mon, 11 Jan 2021 11:50:34 +0000 (UTC)
Received: from localhost (ovpn-113-164.ams2.redhat.com [10.36.113.164])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D7F75D9F8;
 Mon, 11 Jan 2021 11:50:26 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/6] .github: point Repo Lockdown bot to GitLab repo
Date: Mon, 11 Jan 2021 11:50:12 +0000
Message-Id: <20210111115017.156802-2-stefanha@redhat.com>
In-Reply-To: <20210111115017.156802-1-stefanha@redhat.com>
References: <20210111115017.156802-1-stefanha@redhat.com>
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
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VXNlIHRoZSBHaXRMYWIgcmVwbyBVUkwgYXMgdGhlIG1haW4gcmVwbyBsb2NhdGlvbiBpbiBvcmRl
ciB0byByZWR1Y2UKbG9hZCBvbiBxZW11Lm9yZy4KClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBIYWpu
b2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KLS0tCiAuZ2l0aHViL2xvY2tkb3duLnltbCB8IDgg
KysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvLmdpdGh1Yi9sb2NrZG93bi55bWwgYi8uZ2l0aHViL2xvY2tkb3duLnlt
bAppbmRleCA5YWNjMzkzZjFjLi4wN2ZjMmYzMWVlIDEwMDY0NAotLS0gYS8uZ2l0aHViL2xvY2tk
b3duLnltbAorKysgYi8uZ2l0aHViL2xvY2tkb3duLnltbApAQCAtMTAsOCArMTAsOCBAQCBpc3N1
ZXM6CiAgIGNvbW1lbnQ6IHwKICAgICBUaGFuayB5b3UgZm9yIHlvdXIgaW50ZXJlc3QgaW4gdGhl
IFFFTVUgcHJvamVjdC4KIAotICAgIFRoaXMgcmVwb3NpdG9yeSBpcyBhIHJlYWQtb25seSBtaXJy
b3Igb2YgdGhlIHByb2plY3QncyBtYXN0ZXIKLSAgICByZXBvc3RvcmllcyBob3N0ZWQgb24gaHR0
cHM6Ly9naXQucWVtdS5vcmcvZ2l0L3FlbXUuZ2l0LgorICAgIFRoaXMgcmVwb3NpdG9yeSBpcyBh
IHJlYWQtb25seSBtaXJyb3Igb2YgdGhlIHByb2plY3QncyByZXBvc3RvcmllcyBob3N0ZWQKKyAg
ICBhdCBodHRwczovL2dpdGxhYi5jb20vcWVtdS1wcm9qZWN0L3FlbXUuZ2l0LgogICAgIFRoZSBw
cm9qZWN0IGRvZXMgbm90IHByb2Nlc3MgaXNzdWVzIGZpbGVkIG9uIEdpdEh1Yi4KIAogICAgIFRo
ZSBwcm9qZWN0IGlzc3VlcyBhcmUgdHJhY2tlZCBvbiBMYXVuY2hwYWQ6CkBAIC0yNCw4ICsyNCw4
IEBAIHB1bGxzOgogICBjb21tZW50OiB8CiAgICAgVGhhbmsgeW91IGZvciB5b3VyIGludGVyZXN0
IGluIHRoZSBRRU1VIHByb2plY3QuCiAKLSAgICBUaGlzIHJlcG9zaXRvcnkgaXMgYSByZWFkLW9u
bHkgbWlycm9yIG9mIHRoZSBwcm9qZWN0J3MgbWFzdGVyCi0gICAgcmVwb3N0b3JpZXMgaG9zdGVk
IG9uIGh0dHBzOi8vZ2l0LnFlbXUub3JnL2dpdC9xZW11LmdpdC4KKyAgICBUaGlzIHJlcG9zaXRv
cnkgaXMgYSByZWFkLW9ubHkgbWlycm9yIG9mIHRoZSBwcm9qZWN0J3MgcmVwb3N0b3JpZXMgaG9z
dGVkCisgICAgb24gaHR0cHM6Ly9naXRsYWIuY29tL3FlbXUtcHJvamVjdC9xZW11LmdpdC4KICAg
ICBUaGUgcHJvamVjdCBkb2VzIG5vdCBwcm9jZXNzIG1lcmdlIHJlcXVlc3RzIGZpbGVkIG9uIEdp
dEh1Yi4KIAogICAgIFFFTVUgd2VsY29tZXMgY29udHJpYnV0aW9ucyBvZiBjb2RlIChlaXRoZXIg
Zml4aW5nIGJ1Z3Mgb3IgYWRkaW5nIG5ldwotLSAKMi4yOS4yCgo=


