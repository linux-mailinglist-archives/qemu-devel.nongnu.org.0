Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCF627CE47
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Sep 2020 14:57:55 +0200 (CEST)
Received: from localhost ([::1]:50406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNFCc-0000Gq-Lt
	for lists+qemu-devel@lfdr.de; Tue, 29 Sep 2020 08:57:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kNFAZ-0006lz-MW
 for qemu-devel@nongnu.org; Tue, 29 Sep 2020 08:55:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kNFAR-000316-BQ
 for qemu-devel@nongnu.org; Tue, 29 Sep 2020 08:55:47 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601384138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aQ6mKk/Xvpoh0FwSh8rFgMjwPJbPcXVa/7jUk56NGb0=;
 b=N0mMUIDuGb7hvU9b+QLUCR1QcUWQmraEsNT9ShN03wlE5f3d/HfylAYo3zOFbdRacPD36r
 wFbJoMnUuW8X5fkeaADf/JK+s1/ZxUwwvrqChy2ZMCCSKoYnUHbLVYDi/A3ZoThM3hxdAc
 6vJ7Cxm/0plaPoeO9c4gtvcDQUUHUHc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-83dlRuGOMcSYI-RR_JhMJQ-1; Tue, 29 Sep 2020 08:55:35 -0400
X-MC-Unique: 83dlRuGOMcSYI-RR_JhMJQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4D558D84AA;
 Tue, 29 Sep 2020 12:55:34 +0000 (UTC)
Received: from localhost (ovpn-113-13.ams2.redhat.com [10.36.113.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8A39821ECD;
 Tue, 29 Sep 2020 12:55:25 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/4] util/vhost-user-server: use static library in
 meson.build
Date: Tue, 29 Sep 2020 13:55:13 +0100
Message-Id: <20200929125516.186715-2-stefanha@redhat.com>
In-Reply-To: <20200929125516.186715-1-stefanha@redhat.com>
References: <20200929125516.186715-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/29 02:22:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.687,
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
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RG9uJ3QgY29tcGlsZSBjb250cmliL2xpYnZob3N0LXVzZXIvbGlidmhvc3QtdXNlci5jIGFnYWlu
LiBJbnN0ZWFkIGJ1aWxkCnRoZSBzdGF0aWMgbGlicmFyeSBvbmNlIGFuZCB0aGVuIHJldXNlIGl0
IHRocm91Z2hvdXQgUUVNVS4KCkFsc28gc3dpdGNoIGZyb20gQ09ORklHX0xJTlVYIHRvIENPTkZJ
R19WSE9TVF9VU0VSLCB3aGljaCBpcyB3aGF0IHRoZQp2aG9zdC11c2VyIHRvb2xzICh2aG9zdC11
c2VyLWdwdSwgZXRjKSBkby4KClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFu
aGFAcmVkaGF0LmNvbT4KLS0tCiBibG9jay9leHBvcnQvZXhwb3J0LmMgICAgICAgICAgICAgfCA4
ICsrKystLS0tCiBibG9jay9leHBvcnQvbWVzb24uYnVpbGQgICAgICAgICAgfCAyICstCiBjb250
cmliL2xpYnZob3N0LXVzZXIvbWVzb24uYnVpbGQgfCAxICsKIG1lc29uLmJ1aWxkICAgICAgICAg
ICAgICAgICAgICAgICB8IDYgKysrKystCiB0ZXN0cy9xdGVzdC9tZXNvbi5idWlsZCAgICAgICAg
ICAgfCAyICstCiB1dGlsL21lc29uLmJ1aWxkICAgICAgICAgICAgICAgICAgfCA0ICsrKy0KIDYg
ZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9ibG9jay9leHBvcnQvZXhwb3J0LmMgYi9ibG9jay9leHBvcnQvZXhwb3J0LmMKaW5kZXgg
YmQ3Y2FjMjQxZi4uNTUwODk3ZTIzNiAxMDA2NDQKLS0tIGEvYmxvY2svZXhwb3J0L2V4cG9ydC5j
CisrKyBiL2Jsb2NrL2V4cG9ydC9leHBvcnQuYwpAQCAtMTcsMTcgKzE3LDE3IEBACiAjaW5jbHVk
ZSAic3lzZW11L2Jsb2NrLWJhY2tlbmQuaCIKICNpbmNsdWRlICJibG9jay9leHBvcnQuaCIKICNp
bmNsdWRlICJibG9jay9uYmQuaCIKLSNpZiBDT05GSUdfTElOVVgKLSNpbmNsdWRlICJibG9jay9l
eHBvcnQvdmhvc3QtdXNlci1ibGstc2VydmVyLmgiCi0jZW5kaWYKICNpbmNsdWRlICJxYXBpL2Vy
cm9yLmgiCiAjaW5jbHVkZSAicWFwaS9xYXBpLWNvbW1hbmRzLWJsb2NrLWV4cG9ydC5oIgogI2lu
Y2x1ZGUgInFhcGkvcWFwaS1ldmVudHMtYmxvY2stZXhwb3J0LmgiCiAjaW5jbHVkZSAicWVtdS9p
ZC5oIgorI2lmZGVmIENPTkZJR19WSE9TVF9VU0VSCisjaW5jbHVkZSAidmhvc3QtdXNlci1ibGst
c2VydmVyLmgiCisjZW5kaWYKIAogc3RhdGljIGNvbnN0IEJsb2NrRXhwb3J0RHJpdmVyICpibGtf
ZXhwX2RyaXZlcnNbXSA9IHsKICAgICAmYmxrX2V4cF9uYmQsCi0jaWYgQ09ORklHX0xJTlVYCisj
aWZkZWYgQ09ORklHX1ZIT1NUX1VTRVIKICAgICAmYmxrX2V4cF92aG9zdF91c2VyX2JsaywKICNl
bmRpZgogfTsKZGlmZiAtLWdpdCBhL2Jsb2NrL2V4cG9ydC9tZXNvbi5idWlsZCBiL2Jsb2NrL2V4
cG9ydC9tZXNvbi5idWlsZAppbmRleCBlZjNhOTU3NmY3Li40NjlhN2FhMGY1IDEwMDY0NAotLS0g
YS9ibG9jay9leHBvcnQvbWVzb24uYnVpbGQKKysrIGIvYmxvY2svZXhwb3J0L21lc29uLmJ1aWxk
CkBAIC0xLDIgKzEsMiBAQAogYmxvY2tfc3MuYWRkKGZpbGVzKCdleHBvcnQuYycpKQotYmxvY2tf
c3MuYWRkKHdoZW46ICdDT05GSUdfTElOVVgnLCBpZl90cnVlOiBmaWxlcygndmhvc3QtdXNlci1i
bGstc2VydmVyLmMnLCAnLi4vLi4vY29udHJpYi9saWJ2aG9zdC11c2VyL2xpYnZob3N0LXVzZXIu
YycpKQorYmxvY2tfc3MuYWRkKHdoZW46ICdDT05GSUdfVkhPU1RfVVNFUicsIGlmX3RydWU6IGZp
bGVzKCd2aG9zdC11c2VyLWJsay1zZXJ2ZXIuYycpKQpkaWZmIC0tZ2l0IGEvY29udHJpYi9saWJ2
aG9zdC11c2VyL21lc29uLmJ1aWxkIGIvY29udHJpYi9saWJ2aG9zdC11c2VyL21lc29uLmJ1aWxk
CmluZGV4IGU2OGRkMWE1ODEuLmEyNjFlNzY2NWYgMTAwNjQ0Ci0tLSBhL2NvbnRyaWIvbGlidmhv
c3QtdXNlci9tZXNvbi5idWlsZAorKysgYi9jb250cmliL2xpYnZob3N0LXVzZXIvbWVzb24uYnVp
bGQKQEAgLTEsMyArMSw0IEBACiBsaWJ2aG9zdF91c2VyID0gc3RhdGljX2xpYnJhcnkoJ3Zob3N0
LXVzZXInLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZpbGVzKCdsaWJ2aG9zdC11
c2VyLmMnLCAnbGlidmhvc3QtdXNlci1nbGliLmMnKSwKICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBidWlsZF9ieV9kZWZhdWx0OiBmYWxzZSkKK3Zob3N0X3VzZXIgPSBkZWNsYXJlX2Rl
cGVuZGVuY3kobGlua193aXRoOiBsaWJ2aG9zdF91c2VyKQpkaWZmIC0tZ2l0IGEvbWVzb24uYnVp
bGQgYi9tZXNvbi5idWlsZAppbmRleCA0YzZjNzMxMGZhLi5lYjg0Yjk3ZWJiIDEwMDY0NAotLS0g
YS9tZXNvbi5idWlsZAorKysgYi9tZXNvbi5idWlsZApAQCAtNzg4LDYgKzc4OCwxMSBAQCB0cmFj
ZV9ldmVudHNfc3ViZGlycyArPSBbCiAgICd1dGlsJywKIF0KIAordmhvc3RfdXNlciA9IG5vdF9m
b3VuZAoraWYgJ0NPTkZJR19WSE9TVF9VU0VSJyBpbiBjb25maWdfaG9zdAorICBzdWJkaXIoJ2Nv
bnRyaWIvbGlidmhvc3QtdXNlcicpCitlbmRpZgorCiBzdWJkaXIoJ3FhcGknKQogc3ViZGlyKCdx
b2JqZWN0JykKIHN1YmRpcignc3R1YnMnKQpAQCAtMTE2OSw3ICsxMTc0LDYgQEAgaWYgaGF2ZV90
b29scwogICAgICAgICAgICAgIGluc3RhbGw6IHRydWUpCiAKICAgaWYgJ0NPTkZJR19WSE9TVF9V
U0VSJyBpbiBjb25maWdfaG9zdAotICAgIHN1YmRpcignY29udHJpYi9saWJ2aG9zdC11c2VyJykK
ICAgICBzdWJkaXIoJ2NvbnRyaWIvdmhvc3QtdXNlci1ibGsnKQogICAgIHN1YmRpcignY29udHJp
Yi92aG9zdC11c2VyLWdwdScpCiAgICAgc3ViZGlyKCdjb250cmliL3Zob3N0LXVzZXItaW5wdXQn
KQpkaWZmIC0tZ2l0IGEvdGVzdHMvcXRlc3QvbWVzb24uYnVpbGQgYi90ZXN0cy9xdGVzdC9tZXNv
bi5idWlsZAppbmRleCBjNzI4MjFiMDlhLi5hYThkMDk4NWUxIDEwMDY0NAotLS0gYS90ZXN0cy9x
dGVzdC9tZXNvbi5idWlsZAorKysgYi90ZXN0cy9xdGVzdC9tZXNvbi5idWlsZApAQCAtMTkxLDcg
KzE5MSw3IEBAIHFvc190ZXN0X3NzLmFkZCgKICkKIHFvc190ZXN0X3NzLmFkZCh3aGVuOiAnQ09O
RklHX1ZJUlRGUycsIGlmX3RydWU6IGZpbGVzKCd2aXJ0aW8tOXAtdGVzdC5jJykpCiBxb3NfdGVz
dF9zcy5hZGQod2hlbjogJ0NPTkZJR19WSE9TVF9VU0VSJywgaWZfdHJ1ZTogZmlsZXMoJ3Zob3N0
LXVzZXItdGVzdC5jJykpCi1xb3NfdGVzdF9zcy5hZGQod2hlbjogJ0NPTkZJR19MSU5VWCcsIGlm
X3RydWU6IGZpbGVzKCd2aG9zdC11c2VyLWJsay10ZXN0LmMnKSkKK3Fvc190ZXN0X3NzLmFkZCh3
aGVuOiAnQ09ORklHX1ZIT1NUX1VTRVInLCBpZl90cnVlOiBmaWxlcygndmhvc3QtdXNlci1ibGst
dGVzdC5jJykpCiAKIGV4dHJhX3F0ZXN0X2RlcHMgPSB7CiAgICdiaW9zLXRhYmxlcy10ZXN0Jzog
W2lvXSwKZGlmZiAtLWdpdCBhL3V0aWwvbWVzb24uYnVpbGQgYi91dGlsL21lc29uLmJ1aWxkCmlu
ZGV4IDIyOTZlODFiMzQuLjliMmE3YTVkZTkgMTAwNjQ0Ci0tLSBhL3V0aWwvbWVzb24uYnVpbGQK
KysrIGIvdXRpbC9tZXNvbi5idWlsZApAQCAtNjYsNyArNjYsOSBAQCBpZiBoYXZlX2Jsb2NrCiAg
IHV0aWxfc3MuYWRkKGZpbGVzKCdtYWluLWxvb3AuYycpKQogICB1dGlsX3NzLmFkZChmaWxlcygn
bnZkaW1tLXV0aWxzLmMnKSkKICAgdXRpbF9zcy5hZGQoZmlsZXMoJ3FlbXUtY29yb3V0aW5lLmMn
LCAncWVtdS1jb3JvdXRpbmUtbG9jay5jJywgJ3FlbXUtY29yb3V0aW5lLWlvLmMnKSkKLSAgdXRp
bF9zcy5hZGQod2hlbjogJ0NPTkZJR19MSU5VWCcsIGlmX3RydWU6IGZpbGVzKCd2aG9zdC11c2Vy
LXNlcnZlci5jJykpCisgIHV0aWxfc3MuYWRkKHdoZW46ICdDT05GSUdfVkhPU1RfVVNFUicsIGlm
X3RydWU6IFsKKyAgICBmaWxlcygndmhvc3QtdXNlci1zZXJ2ZXIuYycpLCB2aG9zdF91c2VyCisg
IF0pCiAgIHV0aWxfc3MuYWRkKGZpbGVzKCdibG9jay1oZWxwZXJzLmMnKSkKICAgdXRpbF9zcy5h
ZGQoZmlsZXMoJ3FlbXUtY29yb3V0aW5lLXNsZWVwLmMnKSkKICAgdXRpbF9zcy5hZGQoZmlsZXMo
J3FlbXUtY28tc2hhcmVkLXJlc291cmNlLmMnKSkKLS0gCjIuMjYuMgoK


