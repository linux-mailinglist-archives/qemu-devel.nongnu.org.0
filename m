Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B41C028C007
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Oct 2020 20:50:56 +0200 (CEST)
Received: from localhost ([::1]:44202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kS2uN-0003Va-MD
	for lists+qemu-devel@lfdr.de; Mon, 12 Oct 2020 14:50:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kS2ZT-00048Y-7A
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 14:29:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kS2ZR-0004Eh-0K
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 14:29:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602527356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EFnVhMLuEriDxJ4B0fq+DMN68qIzPOHHtQfUhTd9ezk=;
 b=f0tLs2RvwObvvbXenskjCpUxdXc+pWupwiAtzvHcr17FH6g64tQY4VI6KEAIGWhOiTCHQt
 fT16RAG+6RXSmGwiLYvuUDYn7RwatMxybwoxzJXUt6d3pKDQuwneKaUMd/kt0Aat3T73d0
 fatkS6ga5M3iCHZNMvQmp2uijjtOTfU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-f5_we4yCMreiXTDcxe_HrA-1; Mon, 12 Oct 2020 14:29:14 -0400
X-MC-Unique: f5_we4yCMreiXTDcxe_HrA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1631D802B69;
 Mon, 12 Oct 2020 18:29:13 +0000 (UTC)
Received: from localhost (ovpn-115-4.ams2.redhat.com [10.36.115.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F39306EF54;
 Mon, 12 Oct 2020 18:29:09 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL v2 19/30] util/vhost-user-server: move header to include/
Date: Mon, 12 Oct 2020 19:27:49 +0100
Message-Id: <20201012182800.157697-20-stefanha@redhat.com>
In-Reply-To: <20201012182800.157697-1-stefanha@redhat.com>
References: <20201012182800.157697-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/12 02:58:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGVhZGVycyB1c2VkIGJ5IG90aGVyIHN1YnN5c3RlbXMgYXJlIGxvY2F0ZWQgaW4gaW5jbHVkZS8u
IEFsc28gYWRkIHRoZQp2aG9zdC11c2VyLXNlcnZlciBhbmQgdmhvc3QtdXNlci1ibGstc2VydmVy
IGhlYWRlcnMgdG8gTUFJTlRBSU5FUlMuCgpTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gSGFqbm9jemkg
PHN0ZWZhbmhhQHJlZGhhdC5jb20+Ck1lc3NhZ2UtaWQ6IDIwMjAwOTI0MTUxNTQ5LjkxMzczNy0x
My1zdGVmYW5oYUByZWRoYXQuY29tClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3Rl
ZmFuaGFAcmVkaGF0LmNvbT4KLS0tCiBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCA0ICsrKy0KIHt1dGlsID0+IGluY2x1ZGUvcWVtdX0vdmhvc3QtdXNlci1zZXJ2
ZXIuaCB8IDAKIGJsb2NrL2V4cG9ydC92aG9zdC11c2VyLWJsay1zZXJ2ZXIuYyAgICAgICB8IDIg
Ky0KIHV0aWwvdmhvc3QtdXNlci1zZXJ2ZXIuYyAgICAgICAgICAgICAgICAgICB8IDIgKy0KIDQg
ZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQogcmVuYW1lIHt1
dGlsID0+IGluY2x1ZGUvcWVtdX0vdmhvc3QtdXNlci1zZXJ2ZXIuaCAoMTAwJSkKCmRpZmYgLS1n
aXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCmluZGV4IDI4MjYyMzE5ZGIuLjU5ZmNhZjk3
MDYgMTAwNjQ0Ci0tLSBhL01BSU5UQUlORVJTCisrKyBiL01BSU5UQUlORVJTCkBAIC0zMDcyLDkg
KzMwNzIsMTEgQEAgVmhvc3QtdXNlciBibG9jayBkZXZpY2UgYmFja2VuZCBzZXJ2ZXIKIE06IENv
aWJ5IFh1IDxDb2lieS5YdUBnbWFpbC5jb20+CiBTOiBNYWludGFpbmVkCiBGOiBibG9jay9leHBv
cnQvdmhvc3QtdXNlci1ibGstc2VydmVyLmMKLUY6IHV0aWwvdmhvc3QtdXNlci1zZXJ2ZXIuYwor
RjogYmxvY2svZXhwb3J0L3Zob3N0LXVzZXItYmxrLXNlcnZlci5oCitGOiBpbmNsdWRlL3FlbXUv
dmhvc3QtdXNlci1zZXJ2ZXIuaAogRjogdGVzdHMvcXRlc3Qvdmhvc3QtdXNlci1ibGstdGVzdC5j
CiBGOiB0ZXN0cy9xdGVzdC9saWJxb3Mvdmhvc3QtdXNlci1ibGsuYworRjogdXRpbC92aG9zdC11
c2VyLXNlcnZlci5jCiAKIFJlcGxpY2F0aW9uCiBNOiBXZW4gQ29uZ3lhbmcgPHdlbmNvbmd5YW5n
MkBodWF3ZWkuY29tPgpkaWZmIC0tZ2l0IGEvdXRpbC92aG9zdC11c2VyLXNlcnZlci5oIGIvaW5j
bHVkZS9xZW11L3Zob3N0LXVzZXItc2VydmVyLmgKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFt
ZSBmcm9tIHV0aWwvdmhvc3QtdXNlci1zZXJ2ZXIuaApyZW5hbWUgdG8gaW5jbHVkZS9xZW11L3Zo
b3N0LXVzZXItc2VydmVyLmgKZGlmZiAtLWdpdCBhL2Jsb2NrL2V4cG9ydC92aG9zdC11c2VyLWJs
ay1zZXJ2ZXIuYyBiL2Jsb2NrL2V4cG9ydC92aG9zdC11c2VyLWJsay1zZXJ2ZXIuYwppbmRleCA5
MWZjNzA0MGIyLi44MTA3MmE1YTQ2IDEwMDY0NAotLS0gYS9ibG9jay9leHBvcnQvdmhvc3QtdXNl
ci1ibGstc2VydmVyLmMKKysrIGIvYmxvY2svZXhwb3J0L3Zob3N0LXVzZXItYmxrLXNlcnZlci5j
CkBAIC0xMyw3ICsxMyw3IEBACiAjaW5jbHVkZSAiYmxvY2svYmxvY2suaCIKICNpbmNsdWRlICJj
b250cmliL2xpYnZob3N0LXVzZXIvbGlidmhvc3QtdXNlci5oIgogI2luY2x1ZGUgInN0YW5kYXJk
LWhlYWRlcnMvbGludXgvdmlydGlvX2Jsay5oIgotI2luY2x1ZGUgInV0aWwvdmhvc3QtdXNlci1z
ZXJ2ZXIuaCIKKyNpbmNsdWRlICJxZW11L3Zob3N0LXVzZXItc2VydmVyLmgiCiAjaW5jbHVkZSAi
dmhvc3QtdXNlci1ibGstc2VydmVyLmgiCiAjaW5jbHVkZSAicWFwaS9lcnJvci5oIgogI2luY2x1
ZGUgInFvbS9vYmplY3RfaW50ZXJmYWNlcy5oIgpkaWZmIC0tZ2l0IGEvdXRpbC92aG9zdC11c2Vy
LXNlcnZlci5jIGIvdXRpbC92aG9zdC11c2VyLXNlcnZlci5jCmluZGV4IDJhMjcxMzllYjguLjNm
ZDI2YzlmMzAgMTAwNjQ0Ci0tLSBhL3V0aWwvdmhvc3QtdXNlci1zZXJ2ZXIuYworKysgYi91dGls
L3Zob3N0LXVzZXItc2VydmVyLmMKQEAgLTksOCArOSw4IEBACiAgKi8KICNpbmNsdWRlICJxZW11
L29zZGVwLmgiCiAjaW5jbHVkZSAicWVtdS9tYWluLWxvb3AuaCIKKyNpbmNsdWRlICJxZW11L3Zo
b3N0LXVzZXItc2VydmVyLmgiCiAjaW5jbHVkZSAiYmxvY2svYWlvLXdhaXQuaCIKLSNpbmNsdWRl
ICJ2aG9zdC11c2VyLXNlcnZlci5oIgogCiAvKgogICogVGhlb3J5IG9mIG9wZXJhdGlvbjoKLS0g
CjIuMjYuMgoK


