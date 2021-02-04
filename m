Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D0830F6AD
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 16:48:20 +0100 (CET)
Received: from localhost ([::1]:52048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7grj-0000z6-3w
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 10:48:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7gnd-0007Bl-N5
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:44:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7gna-0004O1-4H
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:44:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612453437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UHEYOy4P9NdBNkUkRhHUXhiQOOr0yJ+8Zjr6cC1kA5M=;
 b=DJIA3Z99bk/v7jNN1+l/Katd0QuqoN9iAAW7Zq1a2E7ae0G3IxgDT3WdwgIHaxqbpz5Ucl
 nV2/jjbWqmp7qFWZlg78QQ93oKmept+XbGn8pwvb73/mVNVPISt5xnYZgkW/OPBMgoEbuu
 kGr1Uu7RlgSPcAVy9i+JlzuZGx1OQG0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-CLE6n92pNdShkd9S9WeJEQ-1; Thu, 04 Feb 2021 10:43:55 -0500
X-MC-Unique: CLE6n92pNdShkd9S9WeJEQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68789801961;
 Thu,  4 Feb 2021 15:43:53 +0000 (UTC)
Received: from localhost (ovpn-115-89.ams2.redhat.com [10.36.115.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7E9F85D6D7;
 Thu,  4 Feb 2021 15:43:40 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL v2 01/27] .github: point Repo Lockdown bot to GitLab repo
Date: Thu,  4 Feb 2021 15:43:01 +0000
Message-Id: <20210204154327.386529-2-stefanha@redhat.com>
In-Reply-To: <20210204154327.386529-1-stefanha@redhat.com>
References: <20210204154327.386529-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>, Thomas Huth <thuth@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VXNlIHRoZSBHaXRMYWIgcmVwbyBVUkwgYXMgdGhlIG1haW4gcmVwbyBsb2NhdGlvbiBpbiBvcmRl
ciB0byByZWR1Y2UKbG9hZCBvbiBxZW11Lm9yZy4KClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBIYWpu
b2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KUmV2aWV3ZWQtYnk6IFdhaW5lciBkb3MgU2FudG9z
IE1vc2NoZXR0YSA8d2FpbmVyc21AcmVkaGF0LmNvbT4KUmV2aWV3ZWQtYnk6IFRob21hcyBIdXRo
IDx0aHV0aEByZWRoYXQuY29tPgpNZXNzYWdlLWlkOiAyMDIxMDExMTExNTAxNy4xNTY4MDItMi1z
dGVmYW5oYUByZWRoYXQuY29tClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFu
aGFAcmVkaGF0LmNvbT4KLS0tCiAuZ2l0aHViL2xvY2tkb3duLnltbCB8IDggKysrKy0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvLmdpdGh1Yi9sb2NrZG93bi55bWwgYi8uZ2l0aHViL2xvY2tkb3duLnltbAppbmRleCA5YWNj
MzkzZjFjLi4wN2ZjMmYzMWVlIDEwMDY0NAotLS0gYS8uZ2l0aHViL2xvY2tkb3duLnltbAorKysg
Yi8uZ2l0aHViL2xvY2tkb3duLnltbApAQCAtMTAsOCArMTAsOCBAQCBpc3N1ZXM6CiAgIGNvbW1l
bnQ6IHwKICAgICBUaGFuayB5b3UgZm9yIHlvdXIgaW50ZXJlc3QgaW4gdGhlIFFFTVUgcHJvamVj
dC4KIAotICAgIFRoaXMgcmVwb3NpdG9yeSBpcyBhIHJlYWQtb25seSBtaXJyb3Igb2YgdGhlIHBy
b2plY3QncyBtYXN0ZXIKLSAgICByZXBvc3RvcmllcyBob3N0ZWQgb24gaHR0cHM6Ly9naXQucWVt
dS5vcmcvZ2l0L3FlbXUuZ2l0LgorICAgIFRoaXMgcmVwb3NpdG9yeSBpcyBhIHJlYWQtb25seSBt
aXJyb3Igb2YgdGhlIHByb2plY3QncyByZXBvc3RvcmllcyBob3N0ZWQKKyAgICBhdCBodHRwczov
L2dpdGxhYi5jb20vcWVtdS1wcm9qZWN0L3FlbXUuZ2l0LgogICAgIFRoZSBwcm9qZWN0IGRvZXMg
bm90IHByb2Nlc3MgaXNzdWVzIGZpbGVkIG9uIEdpdEh1Yi4KIAogICAgIFRoZSBwcm9qZWN0IGlz
c3VlcyBhcmUgdHJhY2tlZCBvbiBMYXVuY2hwYWQ6CkBAIC0yNCw4ICsyNCw4IEBAIHB1bGxzOgog
ICBjb21tZW50OiB8CiAgICAgVGhhbmsgeW91IGZvciB5b3VyIGludGVyZXN0IGluIHRoZSBRRU1V
IHByb2plY3QuCiAKLSAgICBUaGlzIHJlcG9zaXRvcnkgaXMgYSByZWFkLW9ubHkgbWlycm9yIG9m
IHRoZSBwcm9qZWN0J3MgbWFzdGVyCi0gICAgcmVwb3N0b3JpZXMgaG9zdGVkIG9uIGh0dHBzOi8v
Z2l0LnFlbXUub3JnL2dpdC9xZW11LmdpdC4KKyAgICBUaGlzIHJlcG9zaXRvcnkgaXMgYSByZWFk
LW9ubHkgbWlycm9yIG9mIHRoZSBwcm9qZWN0J3MgcmVwb3N0b3JpZXMgaG9zdGVkCisgICAgb24g
aHR0cHM6Ly9naXRsYWIuY29tL3FlbXUtcHJvamVjdC9xZW11LmdpdC4KICAgICBUaGUgcHJvamVj
dCBkb2VzIG5vdCBwcm9jZXNzIG1lcmdlIHJlcXVlc3RzIGZpbGVkIG9uIEdpdEh1Yi4KIAogICAg
IFFFTVUgd2VsY29tZXMgY29udHJpYnV0aW9ucyBvZiBjb2RlIChlaXRoZXIgZml4aW5nIGJ1Z3Mg
b3IgYWRkaW5nIG5ldwotLSAKMi4yOS4yCgo=


