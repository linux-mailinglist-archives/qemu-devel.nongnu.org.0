Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0722B2ADCCC
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 18:21:40 +0100 (CET)
Received: from localhost ([::1]:54272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcXKt-0002yL-0U
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 12:21:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kcXBb-0002rA-KR
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 12:12:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kcXBW-0001gM-Pn
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 12:12:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605028317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d9dfRSaJbUyc6EkbObGXJdWxSJMbqgSGbpCcBqSsK+o=;
 b=NNI04F7CHGs/74Pvbmx3u2SUa/zhKUPDU0Ue6n+lZ3DWE90G0VFBR/DZ38hvXFmBUAeQjo
 Ej8NtSKDO0+Jf4UUvf3/D/rZLcyyOOxVIkQu0cP3i2NiWjWDz7Bjmcl36q5dponBXtfU5j
 IFk7J7kmBbMFgbUZ/2Bk9Ov2Di19144=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-ot-1aJ_GO1Ku3yEwUIIaHw-1; Tue, 10 Nov 2020 12:11:55 -0500
X-MC-Unique: ot-1aJ_GO1Ku3yEwUIIaHw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 952C456C36;
 Tue, 10 Nov 2020 17:11:54 +0000 (UTC)
Received: from localhost (ovpn-114-36.ams2.redhat.com [10.36.114.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DF2F2385;
 Tue, 10 Nov 2020 17:11:47 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] configure: mark vhost-user Linux-only
Date: Tue, 10 Nov 2020 17:11:21 +0000
Message-Id: <20201110171121.1265142-4-stefanha@redhat.com>
In-Reply-To: <20201110171121.1265142-1-stefanha@redhat.com>
References: <20201110171121.1265142-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 00:21:06
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhlIHZob3N0LXVzZXIgcHJvdG9jb2wgdXNlcyB0aGUgTGludXggZXZlbnRmZCBmZWF0dXJlIGFu
ZCBpcyB0eXBpY2FsbHkKY29ubmVjdGVkIHRvIExpbnV4IGt2bS5rbyBpb2V2ZW50ZmQgYW5kIGly
cWZkIGZpbGUgZGVzY3JpcHRvcnMuIFRoZQpwcm90b2NvbCBzcGVjaWZpY2F0aW9uIGluIGRvY3Mv
aW50ZXJvcC92aG9zdC11c2VyLnJzdCBkb2VzIG5vdCBkZXNjcmliZQpob3cgcGxhdGZvcm1zIHdp
dGhvdXQgZXZlbnRmZCBzdXBwb3J0IHdvcmsuCgpUaGUgUUVNVSB2aG9zdC11c2VyIGRldmljZXMg
Y29tcGlsZSBvbiBvdGhlciBQT1NJWCBob3N0IG9wZXJhdGluZwpzeXN0ZW1zIGJlY2F1c2UgZXZl
bnRmZCB1c2FnZSBpcyBhYnN0cmFjdGVkIGluIFFFTVUuIFRoZSBsaWJ2aG9zdC11c2VyCnByb2dy
YW1zIGluIGNvbnRyaWIvIGRvIG5vdCBjb21waWxlIGJ1dCB3ZSBmYWlsZWQgdG8gbm90aWNlIHNp
bmNlIHRoZXkKYXJlIG5vdCBidWlsdCBieSBkZWZhdWx0LgoKTWFrZSBpdCBjbGVhciB0aGF0IHZo
b3N0LXVzZXIgaXMgb25seSBzdXBwb3J0ZWQgb24gTGludXggZm9yIHRoZSB0aW1lCmJlaW5nLiBJ
ZiBzb21lb25lIHdpc2hlcyB0byBzdXBwb3J0IGl0IG9uIG90aGVyIHBsYXRmb3JtcyB0aGVuIHRo
ZQpkZXRhaWxzIGNhbiBiZSBhZGRlZCB0byB2aG9zdC11c2VyLnJzdCBhbmQgQ0kgam9icyBjYW4g
dGVzdCB0aGUgZmVhdHVyZQp0byBwcmV2ZW50IGJpdHJvdC4KClNpZ25lZC1vZmYtYnk6IFN0ZWZh
biBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KLS0tCiBjb25maWd1cmUgfCA5ICsrKyst
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9jb25maWd1cmUgYi9jb25maWd1cmUKaW5kZXggNWFlNzNmYTMyYy4uZWY0MzFm
ODZjMCAxMDA3NTUKLS0tIGEvY29uZmlndXJlCisrKyBiL2NvbmZpZ3VyZQpAQCAtMzI4LDcgKzMy
OCw3IEBAIHZob3N0X25ldD0iIgogdmhvc3RfY3J5cHRvPSIiCiB2aG9zdF9zY3NpPSIiCiB2aG9z
dF92c29jaz0iIgotdmhvc3RfdXNlcj0iIgordmhvc3RfdXNlcj0ibm8iCiB2aG9zdF91c2VyX2Js
a19zZXJ2ZXI9ImF1dG8iCiB2aG9zdF91c2VyX2ZzPSIiCiBrdm09ImF1dG8iCkBAIC03MTgsNyAr
NzE4LDYgQEAgZmkKIGNhc2UgJHRhcmdldG9zIGluCiBNSU5HVzMyKikKICAgbWluZ3czMj0ieWVz
IgotICB2aG9zdF91c2VyPSJubyIKICAgYXVkaW9fcG9zc2libGVfZHJpdmVycz0iZHNvdW5kIHNk
bCIKICAgaWYgY2hlY2tfaW5jbHVkZSBkc291bmQuaDsgdGhlbgogICAgIGF1ZGlvX2Rydl9saXN0
PSJkc291bmQiCkBAIC03OTcsNiArNzk2LDcgQEAgTGludXgpCiAgIGF1ZGlvX3Bvc3NpYmxlX2Ry
aXZlcnM9Im9zcyBhbHNhIHNkbCBwYSIKICAgbGludXg9InllcyIKICAgbGludXhfdXNlcj0ieWVz
IgorICB2aG9zdF91c2VyPSJ5ZXMiCiA7OwogZXNhYwogCkBAIC0yMzM5LDkgKzIzMzksOCBAQCBm
aQogIyB2aG9zdCBpbnRlcmRlcGVuZGVuY2llcyBhbmQgaG9zdCBzdXBwb3J0CiAKICMgdmhvc3Qg
YmFja2VuZHMKLXRlc3QgIiR2aG9zdF91c2VyIiA9ICIiICYmIHZob3N0X3VzZXI9eWVzCi1pZiB0
ZXN0ICIkdmhvc3RfdXNlciIgPSAieWVzIiAmJiB0ZXN0ICIkbWluZ3czMiIgPSAieWVzIjsgdGhl
bgotICBlcnJvcl9leGl0ICJ2aG9zdC11c2VyIGlzbid0IGF2YWlsYWJsZSBvbiB3aW4zMiIKK2lm
IHRlc3QgIiR2aG9zdF91c2VyIiA9ICJ5ZXMiICYmIHRlc3QgIiRsaW51eCIgIT0gInllcyI7IHRo
ZW4KKyAgZXJyb3JfZXhpdCAidmhvc3QtdXNlciBpcyBvbmx5IGF2YWlsYWJsZSBvbiBMaW51eCIK
IGZpCiB0ZXN0ICIkdmhvc3RfdmRwYSIgPSAiIiAmJiB2aG9zdF92ZHBhPSRsaW51eAogaWYgdGVz
dCAiJHZob3N0X3ZkcGEiID0gInllcyIgJiYgdGVzdCAiJGxpbnV4IiAhPSAieWVzIjsgdGhlbgot
LSAKMi4yOC4wCgo=


