Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D542D4032
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 11:46:37 +0100 (CET)
Received: from localhost ([::1]:57342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmwzU-0001px-Kt
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 05:46:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kmwre-0003pJ-Dc
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 05:38:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kmwrS-0007WA-T3
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 05:38:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607510297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aSFlnPPNsnlstEhWLbzSSNHJELlJMFm5l9F9Az8p8oc=;
 b=UEMKQAhjfBmNwapL7HUW9KFP4h6srnTvgH6ViEKLTt2yKEQQlMFguKfhSoWE9c48cbjD5B
 dSReG4CTe99CZ4LfReYX1ZHBm0EUQChk3Hx4s6DK3Gw1Q9Nzig0azVOisnR1GatbDU7m9Z
 E8H/Vk/PRKFCVHcB7znEUNQ8dbN7zbg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-1Jj2NpIQNLWZyP33eFhJGw-1; Wed, 09 Dec 2020 05:38:13 -0500
X-MC-Unique: 1Jj2NpIQNLWZyP33eFhJGw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93C445203;
 Wed,  9 Dec 2020 10:38:12 +0000 (UTC)
Received: from localhost (ovpn-115-48.ams2.redhat.com [10.36.115.48])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0FB595D9D3;
 Wed,  9 Dec 2020 10:38:08 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/3] docs: generate qemu-storage-daemon-qmp-ref(7) man page
Date: Wed,  9 Dec 2020 10:38:00 +0000
Message-Id: <20201209103802.350848-2-stefanha@redhat.com>
In-Reply-To: <20201209103802.350848-1-stefanha@redhat.com>
References: <20201209103802.350848-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Kashyap Chamarthy <kchamart@redhat.com>,
 afrosi@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QWx0aG91Z2ggaW5kaXZpZHVhbCBxZW11LXN0b3JhZ2UtZGFlbW9uIFFNUCBjb21tYW5kcyBhcmUg
aWRlbnRpY2FsIHRvClFFTVUgUU1QIGNvbW1hbmRzLCBxZW11LXN0b3JhZ2UtZGFlbW9uIG9ubHkg
c3VwcG9ydHMgYSBzdWJzZXQgb2YgUUVNVSdzClFNUCBjb21tYW5kcy4gR2VuZXJhdGUgYSBtYW51
YWwgcGFnZSBvZiBqdXN0IHRoZSBjb21tYW5kcyBzdXBwb3J0ZWQgYnkKcWVtdS1zdG9yYWdlLWRh
ZW1vbiBzbyB0aGF0IHVzZXJzIGtub3cgZXhhY3RseSB3aGF0IGlzIGF2YWlsYWJsZSBpbgpxZW11
LXN0b3JhZ2UtZGFlbW9uLgoKQWRkIGFuIGgxIGhlYWRpbmcgaW4gc3RvcmFnZS1kYWVtb24vcWFw
aS9xYXBpLXNjaGVtYS5qc29uIHNvIHRoYXQKYmxvY2stY29yZS5qc29uIGlzIGF0IHRoZSBoMiBo
ZWFkaW5nIGxldmVsLgoKU2lnbmVkLW9mZi1ieTogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUBy
ZWRoYXQuY29tPgotLS0KIGRvY3MvaW50ZXJvcC9pbmRleC5yc3QgICAgICAgICAgICAgICAgICAg
ICAgIHwgIDEgKwogZG9jcy9pbnRlcm9wL3FlbXUtc3RvcmFnZS1kYWVtb24tcW1wLXJlZi5yc3Qg
fCAxMyArKysrKysrKysrKysrCiBzdG9yYWdlLWRhZW1vbi9xYXBpL3FhcGktc2NoZW1hLmpzb24g
ICAgICAgICB8ICAzICsrKwogZG9jcy9pbnRlcm9wL2NvbmYucHkgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgMiArKwogZG9jcy9tZXNvbi5idWlsZCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgMSArCiA1IGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBkb2NzL2ludGVyb3AvcWVtdS1zdG9yYWdlLWRhZW1vbi1xbXAtcmVmLnJzdAoKZGlm
ZiAtLWdpdCBhL2RvY3MvaW50ZXJvcC9pbmRleC5yc3QgYi9kb2NzL2ludGVyb3AvaW5kZXgucnN0
CmluZGV4IGNkNzhkNjc5ZDguLjk1ZDU2NDk1ZjYgMTAwNjQ0Ci0tLSBhL2RvY3MvaW50ZXJvcC9p
bmRleC5yc3QKKysrIGIvZG9jcy9pbnRlcm9wL2luZGV4LnJzdApAQCAtMjAsNiArMjAsNyBAQCBD
b250ZW50czoKICAgIHFlbXUtZ2EKICAgIHFlbXUtZ2EtcmVmCiAgICBxZW11LXFtcC1yZWYKKyAg
IHFlbXUtc3RvcmFnZS1kYWVtb24tcW1wLXJlZgogICAgdmhvc3QtdXNlcgogICAgdmhvc3QtdXNl
ci1ncHUKICAgIHZob3N0LXZkcGEKZGlmZiAtLWdpdCBhL2RvY3MvaW50ZXJvcC9xZW11LXN0b3Jh
Z2UtZGFlbW9uLXFtcC1yZWYucnN0IGIvZG9jcy9pbnRlcm9wL3FlbXUtc3RvcmFnZS1kYWVtb24t
cW1wLXJlZi5yc3QKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uY2FmOWRh
ZDIzYQotLS0gL2Rldi9udWxsCisrKyBiL2RvY3MvaW50ZXJvcC9xZW11LXN0b3JhZ2UtZGFlbW9u
LXFtcC1yZWYucnN0CkBAIC0wLDAgKzEsMTMgQEAKK1FFTVUgU3RvcmFnZSBEYWVtb24gUU1QIFJl
ZmVyZW5jZSBNYW51YWwKKz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0K
KworLi4KKyAgIFRPRE86IHRoZSBvbGQgVGV4aW5mbyBtYW51YWwgdXNlZCB0byBub3RlIHRoYXQg
dGhpcyBtYW51YWwKKyAgIGlzIEdQTC12Mi1vci1sYXRlci4gV2Ugc2hvdWxkIG1ha2UgdGhhdCBy
ZWFkZXItdmlzaWJsZQorICAgYm90aCBoZXJlIGFuZCBpbiBvdXIgU3BoaW54IG1hbnVhbHMgbW9y
ZSBnZW5lcmFsbHkuCisKKy4uCisgICBUT0RPOiBkaXNwbGF5IHRoZSBRRU1VIHZlcnNpb24sIGJv
dGggaGVyZSBhbmQgaW4gb3VyIFNwaGlueCBtYW51YWxzCisgICBtb3JlIGdlbmVyYWxseS4KKwor
Li4gcWFwaS1kb2M6OiBzdG9yYWdlLWRhZW1vbi9xYXBpL3FhcGktc2NoZW1hLmpzb24KZGlmZiAt
LWdpdCBhL3N0b3JhZ2UtZGFlbW9uL3FhcGkvcWFwaS1zY2hlbWEuanNvbiBiL3N0b3JhZ2UtZGFl
bW9uL3FhcGkvcWFwaS1zY2hlbWEuanNvbgppbmRleCBjNmFkNWFlMWUzLi4yODExN2MzYWFjIDEw
MDY0NAotLS0gYS9zdG9yYWdlLWRhZW1vbi9xYXBpL3FhcGktc2NoZW1hLmpzb24KKysrIGIvc3Rv
cmFnZS1kYWVtb24vcWFwaS9xYXBpLXNjaGVtYS5qc29uCkBAIC0xNSw2ICsxNSw5IEBACiAKIHsg
J2luY2x1ZGUnOiAnLi4vLi4vcWFwaS9wcmFnbWEuanNvbicgfQogCisjIworIyA9IEJsb2NrIGRl
dmljZXMKKyMjCiB7ICdpbmNsdWRlJzogJy4uLy4uL3FhcGkvYmxvY2stY29yZS5qc29uJyB9CiB7
ICdpbmNsdWRlJzogJy4uLy4uL3FhcGkvYmxvY2stZXhwb3J0Lmpzb24nIH0KIHsgJ2luY2x1ZGUn
OiAnLi4vLi4vcWFwaS9jaGFyLmpzb24nIH0KZGlmZiAtLWdpdCBhL2RvY3MvaW50ZXJvcC9jb25m
LnB5IGIvZG9jcy9pbnRlcm9wL2NvbmYucHkKaW5kZXggMjYzNGNhMzQxMC4uZjQzNzBhYWExMyAx
MDA2NDQKLS0tIGEvZG9jcy9pbnRlcm9wL2NvbmYucHkKKysrIGIvZG9jcy9pbnRlcm9wL2NvbmYu
cHkKQEAgLTIzLDQgKzIzLDYgQEAgbWFuX3BhZ2VzID0gWwogICAgICBbXSwgNyksCiAgICAgKCdx
ZW11LXFtcC1yZWYnLCAncWVtdS1xbXAtcmVmJywgJ1FFTVUgUU1QIFJlZmVyZW5jZSBNYW51YWwn
LAogICAgICBbXSwgNyksCisgICAgKCdxZW11LXN0b3JhZ2UtZGFlbW9uLXFtcC1yZWYnLCAncWVt
dS1zdG9yYWdlLWRhZW1vbi1xbXAtcmVmJywKKyAgICAgJ1FFTVUgU3RvcmFnZSBEYWVtb24gUU1Q
IFJlZmVyZW5jZSBNYW51YWwnLCBbXSwgNyksCiBdCmRpZmYgLS1naXQgYS9kb2NzL21lc29uLmJ1
aWxkIGIvZG9jcy9tZXNvbi5idWlsZAppbmRleCBlYmQ4NWQ1OWY5Li5kZjVkYzUwNDg1IDEwMDY0
NAotLS0gYS9kb2NzL21lc29uLmJ1aWxkCisrKyBiL2RvY3MvbWVzb24uYnVpbGQKQEAgLTU2LDYg
KzU2LDcgQEAgaWYgYnVpbGRfZG9jcwogICAgICAgICAncWVtdS1nYS44JzogKGhhdmVfdG9vbHMg
PyAnbWFuOCcgOiAnJyksCiAgICAgICAgICdxZW11LWdhLXJlZi43JzogJ21hbjcnLAogICAgICAg
ICAncWVtdS1xbXAtcmVmLjcnOiAnbWFuNycsCisgICAgICAgICdxZW11LXN0b3JhZ2UtZGFlbW9u
LXFtcC1yZWYuNyc6IChoYXZlX3Rvb2xzID8gJ21hbjcnIDogJycpLAogICAgIH0sCiAgICAgJ3Rv
b2xzJzogewogICAgICAgICAncWVtdS1pbWcuMSc6IChoYXZlX3Rvb2xzID8gJ21hbjEnIDogJycp
LAotLSAKMi4yOC4wCgo=


