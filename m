Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 749D2295D96
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Oct 2020 13:43:01 +0200 (CEST)
Received: from localhost ([::1]:35292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVYzk-0004zV-F0
	for lists+qemu-devel@lfdr.de; Thu, 22 Oct 2020 07:43:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kVYmX-00063L-R2
 for qemu-devel@nongnu.org; Thu, 22 Oct 2020 07:29:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kVYmW-00059f-0k
 for qemu-devel@nongnu.org; Thu, 22 Oct 2020 07:29:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603366159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CMNwoCnigUPcB3dN719WwGHMtn3wt9B/0xh5QicFSB8=;
 b=HtyoP8WW3huNO2ByXZruFgze28Am5XeNpDgefXMhA67wgdn5YM6ndMEDoZs4PDASxgejJg
 LB1+QrbBxfFk3aJ3KjUsxVW2AKgSkubWOkaiei6FBl35PaL9b59BYYmjA2twM98RjiVtYR
 UIwOiR7Z7QXnXdKWBpFtJJk7+O7YTt0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-6SA4LxTcNB-v25Yxy1iuiQ-1; Thu, 22 Oct 2020 07:29:17 -0400
X-MC-Unique: 6SA4LxTcNB-v25Yxy1iuiQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F35FA106B813;
 Thu, 22 Oct 2020 11:29:15 +0000 (UTC)
Received: from localhost (ovpn-114-229.ams2.redhat.com [10.36.114.229])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4DBCD5B4B8;
 Thu, 22 Oct 2020 11:29:12 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 18/28] util/vhost-user-server: move header to include/
Date: Thu, 22 Oct 2020 12:27:16 +0100
Message-Id: <20201022112726.736757-19-stefanha@redhat.com>
In-Reply-To: <20201022112726.736757-1-stefanha@redhat.com>
References: <20201022112726.736757-1-stefanha@redhat.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/22 00:54:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>
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
aXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCmluZGV4IDM5ZmQ0ODhiZDAuLjQ2MWRhZTQ5
ODkgMTAwNjQ0Ci0tLSBhL01BSU5UQUlORVJTCisrKyBiL01BSU5UQUlORVJTCkBAIC0zMDY2LDgg
KzMwNjYsMTAgQEAgVmhvc3QtdXNlciBibG9jayBkZXZpY2UgYmFja2VuZCBzZXJ2ZXIKIE06IENv
aWJ5IFh1IDxDb2lieS5YdUBnbWFpbC5jb20+CiBTOiBNYWludGFpbmVkCiBGOiBibG9jay9leHBv
cnQvdmhvc3QtdXNlci1ibGstc2VydmVyLmMKLUY6IHV0aWwvdmhvc3QtdXNlci1zZXJ2ZXIuYwor
RjogYmxvY2svZXhwb3J0L3Zob3N0LXVzZXItYmxrLXNlcnZlci5oCitGOiBpbmNsdWRlL3FlbXUv
dmhvc3QtdXNlci1zZXJ2ZXIuaAogRjogdGVzdHMvcXRlc3QvbGlicW9zL3Zob3N0LXVzZXItYmxr
LmMKK0Y6IHV0aWwvdmhvc3QtdXNlci1zZXJ2ZXIuYwogCiBSZXBsaWNhdGlvbgogTTogV2VuIENv
bmd5YW5nIDx3ZW5jb25neWFuZzJAaHVhd2VpLmNvbT4KZGlmZiAtLWdpdCBhL3V0aWwvdmhvc3Qt
dXNlci1zZXJ2ZXIuaCBiL2luY2x1ZGUvcWVtdS92aG9zdC11c2VyLXNlcnZlci5oCnNpbWlsYXJp
dHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSB1dGlsL3Zob3N0LXVzZXItc2VydmVyLmgKcmVuYW1l
IHRvIGluY2x1ZGUvcWVtdS92aG9zdC11c2VyLXNlcnZlci5oCmRpZmYgLS1naXQgYS9ibG9jay9l
eHBvcnQvdmhvc3QtdXNlci1ibGstc2VydmVyLmMgYi9ibG9jay9leHBvcnQvdmhvc3QtdXNlci1i
bGstc2VydmVyLmMKaW5kZXggM2U1YmQ2Y2FlZS4uZjcwMjFjYmQ3YiAxMDA2NDQKLS0tIGEvYmxv
Y2svZXhwb3J0L3Zob3N0LXVzZXItYmxrLXNlcnZlci5jCisrKyBiL2Jsb2NrL2V4cG9ydC92aG9z
dC11c2VyLWJsay1zZXJ2ZXIuYwpAQCAtMTMsNyArMTMsNyBAQAogI2luY2x1ZGUgImJsb2NrL2Js
b2NrLmgiCiAjaW5jbHVkZSAiY29udHJpYi9saWJ2aG9zdC11c2VyL2xpYnZob3N0LXVzZXIuaCIK
ICNpbmNsdWRlICJzdGFuZGFyZC1oZWFkZXJzL2xpbnV4L3ZpcnRpb19ibGsuaCIKLSNpbmNsdWRl
ICJ1dGlsL3Zob3N0LXVzZXItc2VydmVyLmgiCisjaW5jbHVkZSAicWVtdS92aG9zdC11c2VyLXNl
cnZlci5oIgogI2luY2x1ZGUgInZob3N0LXVzZXItYmxrLXNlcnZlci5oIgogI2luY2x1ZGUgInFh
cGkvZXJyb3IuaCIKICNpbmNsdWRlICJxb20vb2JqZWN0X2ludGVyZmFjZXMuaCIKZGlmZiAtLWdp
dCBhL3V0aWwvdmhvc3QtdXNlci1zZXJ2ZXIuYyBiL3V0aWwvdmhvc3QtdXNlci1zZXJ2ZXIuYwpp
bmRleCA1MTY5OTliMzhhLi43ODNkODQ3YTZkIDEwMDY0NAotLS0gYS91dGlsL3Zob3N0LXVzZXIt
c2VydmVyLmMKKysrIGIvdXRpbC92aG9zdC11c2VyLXNlcnZlci5jCkBAIC05LDggKzksOCBAQAog
ICovCiAjaW5jbHVkZSAicWVtdS9vc2RlcC5oIgogI2luY2x1ZGUgInFlbXUvbWFpbi1sb29wLmgi
CisjaW5jbHVkZSAicWVtdS92aG9zdC11c2VyLXNlcnZlci5oIgogI2luY2x1ZGUgImJsb2NrL2Fp
by13YWl0LmgiCi0jaW5jbHVkZSAidmhvc3QtdXNlci1zZXJ2ZXIuaCIKIAogLyoKICAqIFRoZW9y
eSBvZiBvcGVyYXRpb246Ci0tIAoyLjI2LjIKCg==


