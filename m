Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03133289798
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Oct 2020 22:04:42 +0200 (CEST)
Received: from localhost ([::1]:56268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQyd7-0005MA-27
	for lists+qemu-devel@lfdr.de; Fri, 09 Oct 2020 16:04:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kQyCy-0002hn-6D
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 15:37:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kQyCm-00033n-1r
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 15:37:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602272247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pPiggTpVpBP6WyrjkaLNUR5sEnCfL2gs8y/QUqBmEOE=;
 b=ZM2QGs5Q2A0zxu3Sf+NoUNCH0sduB+OoTW5bteN424A2AkRrG+EAMxPtE8r+VmhgTjcpeU
 l31dNH2fUu/pn3uDBZMHREjPYpfe2TNneykuX2mtzUKx4jATqgbrl2+FkGuXRyqWtljG5F
 5x5JqDMWv57rUu9595S44I1oMZnxQYM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-ZF1n2SODMdWKxqkmSmQqmQ-1; Fri, 09 Oct 2020 15:37:22 -0400
X-MC-Unique: ZF1n2SODMdWKxqkmSmQqmQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 159EA1084D69;
 Fri,  9 Oct 2020 19:37:20 +0000 (UTC)
Received: from localhost (ovpn-112-20.ams2.redhat.com [10.36.112.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D717D5C1D0;
 Fri,  9 Oct 2020 19:37:16 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 20/30] util/vhost-user-server: use static library in meson.build
Date: Fri,  9 Oct 2020 20:35:19 +0100
Message-Id: <20201009193529.322822-21-stefanha@redhat.com>
In-Reply-To: <20201009193529.322822-1-stefanha@redhat.com>
References: <20201009193529.322822-1-stefanha@redhat.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/09 02:34:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RG9uJ3QgY29tcGlsZSBjb250cmliL2xpYnZob3N0LXVzZXIvbGlidmhvc3QtdXNlci5jIGFnYWlu
LiBJbnN0ZWFkIGJ1aWxkCnRoZSBzdGF0aWMgbGlicmFyeSBvbmNlIGFuZCB0aGVuIHJldXNlIGl0
IHRocm91Z2hvdXQgUUVNVS4KCkFsc28gc3dpdGNoIGZyb20gQ09ORklHX0xJTlVYIHRvIENPTkZJ
R19WSE9TVF9VU0VSLCB3aGljaCBpcyB3aGF0IHRoZQp2aG9zdC11c2VyIHRvb2xzICh2aG9zdC11
c2VyLWdwdSwgZXRjKSBkby4KClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFu
aGFAcmVkaGF0LmNvbT4KTWVzc2FnZS1pZDogMjAyMDA5MjQxNTE1NDkuOTEzNzM3LTE0LXN0ZWZh
bmhhQHJlZGhhdC5jb20KU2lnbmVkLW9mZi1ieTogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUBy
ZWRoYXQuY29tPgotLS0KIGJsb2NrL2V4cG9ydC9leHBvcnQuYyAgICAgICAgICAgICB8IDggKysr
Ky0tLS0KIGJsb2NrL2V4cG9ydC9tZXNvbi5idWlsZCAgICAgICAgICB8IDIgKy0KIGNvbnRyaWIv
bGlidmhvc3QtdXNlci9tZXNvbi5idWlsZCB8IDEgKwogbWVzb24uYnVpbGQgICAgICAgICAgICAg
ICAgICAgICAgIHwgNiArKysrKy0KIHRlc3RzL3F0ZXN0L21lc29uLmJ1aWxkICAgICAgICAgICB8
IDIgKy0KIHV0aWwvbWVzb24uYnVpbGQgICAgICAgICAgICAgICAgICB8IDQgKysrLQogNiBmaWxl
cyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2Jsb2NrL2V4cG9ydC9leHBvcnQuYyBiL2Jsb2NrL2V4cG9ydC9leHBvcnQuYwppbmRleCBiZDdj
YWMyNDFmLi41NTA4OTdlMjM2IDEwMDY0NAotLS0gYS9ibG9jay9leHBvcnQvZXhwb3J0LmMKKysr
IGIvYmxvY2svZXhwb3J0L2V4cG9ydC5jCkBAIC0xNywxNyArMTcsMTcgQEAKICNpbmNsdWRlICJz
eXNlbXUvYmxvY2stYmFja2VuZC5oIgogI2luY2x1ZGUgImJsb2NrL2V4cG9ydC5oIgogI2luY2x1
ZGUgImJsb2NrL25iZC5oIgotI2lmIENPTkZJR19MSU5VWAotI2luY2x1ZGUgImJsb2NrL2V4cG9y
dC92aG9zdC11c2VyLWJsay1zZXJ2ZXIuaCIKLSNlbmRpZgogI2luY2x1ZGUgInFhcGkvZXJyb3Iu
aCIKICNpbmNsdWRlICJxYXBpL3FhcGktY29tbWFuZHMtYmxvY2stZXhwb3J0LmgiCiAjaW5jbHVk
ZSAicWFwaS9xYXBpLWV2ZW50cy1ibG9jay1leHBvcnQuaCIKICNpbmNsdWRlICJxZW11L2lkLmgi
CisjaWZkZWYgQ09ORklHX1ZIT1NUX1VTRVIKKyNpbmNsdWRlICJ2aG9zdC11c2VyLWJsay1zZXJ2
ZXIuaCIKKyNlbmRpZgogCiBzdGF0aWMgY29uc3QgQmxvY2tFeHBvcnREcml2ZXIgKmJsa19leHBf
ZHJpdmVyc1tdID0gewogICAgICZibGtfZXhwX25iZCwKLSNpZiBDT05GSUdfTElOVVgKKyNpZmRl
ZiBDT05GSUdfVkhPU1RfVVNFUgogICAgICZibGtfZXhwX3Zob3N0X3VzZXJfYmxrLAogI2VuZGlm
CiB9OwpkaWZmIC0tZ2l0IGEvYmxvY2svZXhwb3J0L21lc29uLmJ1aWxkIGIvYmxvY2svZXhwb3J0
L21lc29uLmJ1aWxkCmluZGV4IGVmM2E5NTc2ZjcuLjQ2OWE3YWEwZjUgMTAwNjQ0Ci0tLSBhL2Js
b2NrL2V4cG9ydC9tZXNvbi5idWlsZAorKysgYi9ibG9jay9leHBvcnQvbWVzb24uYnVpbGQKQEAg
LTEsMiArMSwyIEBACiBibG9ja19zcy5hZGQoZmlsZXMoJ2V4cG9ydC5jJykpCi1ibG9ja19zcy5h
ZGQod2hlbjogJ0NPTkZJR19MSU5VWCcsIGlmX3RydWU6IGZpbGVzKCd2aG9zdC11c2VyLWJsay1z
ZXJ2ZXIuYycsICcuLi8uLi9jb250cmliL2xpYnZob3N0LXVzZXIvbGlidmhvc3QtdXNlci5jJykp
CitibG9ja19zcy5hZGQod2hlbjogJ0NPTkZJR19WSE9TVF9VU0VSJywgaWZfdHJ1ZTogZmlsZXMo
J3Zob3N0LXVzZXItYmxrLXNlcnZlci5jJykpCmRpZmYgLS1naXQgYS9jb250cmliL2xpYnZob3N0
LXVzZXIvbWVzb24uYnVpbGQgYi9jb250cmliL2xpYnZob3N0LXVzZXIvbWVzb24uYnVpbGQKaW5k
ZXggZTY4ZGQxYTU4MS4uYTI2MWU3NjY1ZiAxMDA2NDQKLS0tIGEvY29udHJpYi9saWJ2aG9zdC11
c2VyL21lc29uLmJ1aWxkCisrKyBiL2NvbnRyaWIvbGlidmhvc3QtdXNlci9tZXNvbi5idWlsZApA
QCAtMSwzICsxLDQgQEAKIGxpYnZob3N0X3VzZXIgPSBzdGF0aWNfbGlicmFyeSgndmhvc3QtdXNl
cicsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmlsZXMoJ2xpYnZob3N0LXVzZXIu
YycsICdsaWJ2aG9zdC11c2VyLWdsaWIuYycpLAogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGJ1aWxkX2J5X2RlZmF1bHQ6IGZhbHNlKQordmhvc3RfdXNlciA9IGRlY2xhcmVfZGVwZW5k
ZW5jeShsaW5rX3dpdGg6IGxpYnZob3N0X3VzZXIpCmRpZmYgLS1naXQgYS9tZXNvbi5idWlsZCBi
L21lc29uLmJ1aWxkCmluZGV4IDE3Yzg5Yzg3YzYuLjRkZGQ4OTlmZGQgMTAwNjQ0Ci0tLSBhL21l
c29uLmJ1aWxkCisrKyBiL21lc29uLmJ1aWxkCkBAIC0xMjk3LDYgKzEyOTcsMTEgQEAgdHJhY2Vf
ZXZlbnRzX3N1YmRpcnMgKz0gWwogICAndXRpbCcsCiBdCiAKK3Zob3N0X3VzZXIgPSBub3RfZm91
bmQKK2lmICdDT05GSUdfVkhPU1RfVVNFUicgaW4gY29uZmlnX2hvc3QKKyAgc3ViZGlyKCdjb250
cmliL2xpYnZob3N0LXVzZXInKQorZW5kaWYKKwogc3ViZGlyKCdxYXBpJykKIHN1YmRpcigncW9i
amVjdCcpCiBzdWJkaXIoJ3N0dWJzJykKQEAgLTE2ODAsNyArMTY4NSw2IEBAIGlmIGhhdmVfdG9v
bHMKICAgICAgICAgICAgICBpbnN0YWxsOiB0cnVlKQogCiAgIGlmICdDT05GSUdfVkhPU1RfVVNF
UicgaW4gY29uZmlnX2hvc3QKLSAgICBzdWJkaXIoJ2NvbnRyaWIvbGlidmhvc3QtdXNlcicpCiAg
ICAgc3ViZGlyKCdjb250cmliL3Zob3N0LXVzZXItYmxrJykKICAgICBzdWJkaXIoJ2NvbnRyaWIv
dmhvc3QtdXNlci1ncHUnKQogICAgIHN1YmRpcignY29udHJpYi92aG9zdC11c2VyLWlucHV0JykK
ZGlmZiAtLWdpdCBhL3Rlc3RzL3F0ZXN0L21lc29uLmJ1aWxkIGIvdGVzdHMvcXRlc3QvbWVzb24u
YnVpbGQKaW5kZXggNmZlMjE3MjYyYi4uNmZiNDUwZGRjZSAxMDA2NDQKLS0tIGEvdGVzdHMvcXRl
c3QvbWVzb24uYnVpbGQKKysrIGIvdGVzdHMvcXRlc3QvbWVzb24uYnVpbGQKQEAgLTE5Miw3ICsx
OTIsNyBAQCBxb3NfdGVzdF9zcy5hZGQoCiApCiBxb3NfdGVzdF9zcy5hZGQod2hlbjogJ0NPTkZJ
R19WSVJURlMnLCBpZl90cnVlOiBmaWxlcygndmlydGlvLTlwLXRlc3QuYycpKQogcW9zX3Rlc3Rf
c3MuYWRkKHdoZW46ICdDT05GSUdfVkhPU1RfVVNFUicsIGlmX3RydWU6IGZpbGVzKCd2aG9zdC11
c2VyLXRlc3QuYycpKQotcW9zX3Rlc3Rfc3MuYWRkKHdoZW46IFsnQ09ORklHX0xJTlVYJywgJ0NP
TkZJR19UT09MUyddLCBpZl90cnVlOiBmaWxlcygndmhvc3QtdXNlci1ibGstdGVzdC5jJykpCitx
b3NfdGVzdF9zcy5hZGQod2hlbjogWydDT05GSUdfVkhPU1RfVVNFUicsICdDT05GSUdfVE9PTFMn
XSwgaWZfdHJ1ZTogZmlsZXMoJ3Zob3N0LXVzZXItYmxrLXRlc3QuYycpKQogCiBleHRyYV9xdGVz
dF9kZXBzID0gewogICAnYmlvcy10YWJsZXMtdGVzdCc6IFtpb10sCmRpZmYgLS1naXQgYS91dGls
L21lc29uLmJ1aWxkIGIvdXRpbC9tZXNvbi5idWlsZAppbmRleCAyMjk2ZTgxYjM0Li45YjJhN2E1
ZGU5IDEwMDY0NAotLS0gYS91dGlsL21lc29uLmJ1aWxkCisrKyBiL3V0aWwvbWVzb24uYnVpbGQK
QEAgLTY2LDcgKzY2LDkgQEAgaWYgaGF2ZV9ibG9jawogICB1dGlsX3NzLmFkZChmaWxlcygnbWFp
bi1sb29wLmMnKSkKICAgdXRpbF9zcy5hZGQoZmlsZXMoJ252ZGltbS11dGlscy5jJykpCiAgIHV0
aWxfc3MuYWRkKGZpbGVzKCdxZW11LWNvcm91dGluZS5jJywgJ3FlbXUtY29yb3V0aW5lLWxvY2su
YycsICdxZW11LWNvcm91dGluZS1pby5jJykpCi0gIHV0aWxfc3MuYWRkKHdoZW46ICdDT05GSUdf
TElOVVgnLCBpZl90cnVlOiBmaWxlcygndmhvc3QtdXNlci1zZXJ2ZXIuYycpKQorICB1dGlsX3Nz
LmFkZCh3aGVuOiAnQ09ORklHX1ZIT1NUX1VTRVInLCBpZl90cnVlOiBbCisgICAgZmlsZXMoJ3Zo
b3N0LXVzZXItc2VydmVyLmMnKSwgdmhvc3RfdXNlcgorICBdKQogICB1dGlsX3NzLmFkZChmaWxl
cygnYmxvY2staGVscGVycy5jJykpCiAgIHV0aWxfc3MuYWRkKGZpbGVzKCdxZW11LWNvcm91dGlu
ZS1zbGVlcC5jJykpCiAgIHV0aWxfc3MuYWRkKGZpbGVzKCdxZW11LWNvLXNoYXJlZC1yZXNvdXJj
ZS5jJykpCi0tIAoyLjI2LjIKCg==


