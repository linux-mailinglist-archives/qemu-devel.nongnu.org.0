Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4882B30ABF9
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 16:52:39 +0100 (CET)
Received: from localhost ([::1]:51032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6bVG-0003da-B1
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 10:52:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l6bSc-0001Mq-AS
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:49:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l6bSZ-0007tA-7M
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:49:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612194590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DjfggZoSwBZDjnSBhtCt6L41N4kkD8gXVLZvUQ+WMBo=;
 b=HIZr3eX3soJkOn4YkyW5SsfkLYCkcxh3cUajAWEgwkIhX3lbjOSdX0Mx79JTr+vz+IAClz
 WhWCnv/hWy2U8ZhLLZJbhmfxz1pdBbLgvGHqH9WVQhb6VHhV7PU6+hV1692looL/JPjVzq
 WIc+aJnbzuWFg4fc93DNl44T51qWWdw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-_Z3QEII-NuGdNHYaEERUAw-1; Mon, 01 Feb 2021 10:49:48 -0500
X-MC-Unique: _Z3QEII-NuGdNHYaEERUAw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E4FB8B158A;
 Mon,  1 Feb 2021 15:47:55 +0000 (UTC)
Received: from localhost (ovpn-115-140.ams2.redhat.com [10.36.115.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B48B59CA0;
 Mon,  1 Feb 2021 15:47:54 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/11] trace: recommend "log" backend for getting started with
 tracing
Date: Mon,  1 Feb 2021 15:46:55 +0000
Message-Id: <20210201154703.180022-4-stefanha@redhat.com>
In-Reply-To: <20210201154703.180022-1-stefanha@redhat.com>
References: <20210201154703.180022-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhlICJzaW1wbGUiIGJhY2tlbmQgaXMgYWN0dWFsbHkgbW9yZSBjb21wbGljYXRlZCB0byB1c2Ug
dGhhbiB0aGUgImxvZyIKYmFja2VuZC4gVXBkYXRlIHRoZSBxdWlja3N0YXJ0IGRvY3VtZW50YXRp
b24gdG8gZmVhdHVyZSB0aGUgImxvZyIKYmFja2VuZCBpbnN0ZWFkIG9mIHRoZSAic2ltcGxlIiBi
YWNrZW5kLgoKU3VnZ2VzdGVkLWJ5OiBQZXRlciBNYXlkZWxsIDxwZXRlci5tYXlkZWxsQGxpbmFy
by5vcmc+ClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNv
bT4KUmV2aWV3ZWQtYnk6IFBldGVyIE1heWRlbGwgPHBldGVyLm1heWRlbGxAbGluYXJvLm9yZz4K
TWVzc2FnZS1pZDogMjAyMDEyMTYxNjA5MjMuNzIyODk0LTQtc3RlZmFuaGFAcmVkaGF0LmNvbQpT
aWduZWQtb2ZmLWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+Ci0tLQog
ZG9jcy9kZXZlbC90cmFjaW5nLnJzdCB8IDM1ICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0t
LS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZG9jcy9kZXZlbC90cmFjaW5nLnJzdCBiL2RvY3MvZGV2ZWwvdHJhY2lu
Zy5yc3QKaW5kZXggZjdlNTg5ZjY3Yy4uNGViZjhlMzhlYSAxMDA2NDQKLS0tIGEvZG9jcy9kZXZl
bC90cmFjaW5nLnJzdAorKysgYi9kb2NzL2RldmVsL3RyYWNpbmcucnN0CkBAIC0xMSwyMiArMTEs
MjIgQEAgZm9yIGRlYnVnZ2luZywgcHJvZmlsaW5nLCBhbmQgb2JzZXJ2aW5nIGV4ZWN1dGlvbi4K
IFF1aWNrc3RhcnQKID09PT09PT09PT0KIAotMS4gQnVpbGQgd2l0aCB0aGUgJ3NpbXBsZScgdHJh
Y2UgYmFja2VuZDo6CitFbmFibGUgdHJhY2luZyBvZiBgYG1lbW9yeV9yZWdpb25fb3BzX3JlYWRg
YCBhbmQgYGBtZW1vcnlfcmVnaW9uX29wc193cml0ZWBgCitldmVudHM6OgogCi0gICAgLi9jb25m
aWd1cmUgLS1lbmFibGUtdHJhY2UtYmFja2VuZHM9c2ltcGxlCi0gICAgbWFrZQorICAgICQgcWVt
dSAtLXRyYWNlICJtZW1vcnlfcmVnaW9uX29wc18qIiAuLi4KKyAgICAuLi4KKyAgICA3MTk1ODVA
MTYwODEzMDEzMC40NDExODg6bWVtb3J5X3JlZ2lvbl9vcHNfcmVhZCBjcHUgMCBtciAweDU2MmZk
ZmJiMzgyMCBhZGRyIDB4M2NjIHZhbHVlIDB4Njcgc2l6ZSAxCisgICAgNzE5NTg1QDE2MDgxMzAx
MzAuNDQxMTkwOm1lbW9yeV9yZWdpb25fb3BzX3dyaXRlIGNwdSAwIG1yIDB4NTYyZmRmYmQyZjAw
IGFkZHIgMHgzZDQgdmFsdWUgMHg3MGUgc2l6ZSAyCiAKLTIuIENyZWF0ZSBhIGZpbGUgd2l0aCB0
aGUgZXZlbnRzIHlvdSB3YW50IHRvIHRyYWNlOjoKK1RoaXMgb3V0cHV0IGNvbWVzIGZyb20gdGhl
ICJsb2ciIHRyYWNlIGJhY2tlbmQgdGhhdCBpcyBlbmFibGVkIGJ5IGRlZmF1bHQgd2hlbgorYGAu
L2NvbmZpZ3VyZSAtLWVuYWJsZS10cmFjZS1iYWNrZW5kcz1CQUNLRU5EU2BgIHdhcyBub3QgZXhw
bGljaXRseSBzcGVjaWZpZWQuCiAKLSAgICBlY2hvIG1lbW9yeV9yZWdpb25fb3BzX3JlYWQgPi90
bXAvZXZlbnRzCitNb3JlIHRoYW4gb25lIHRyYWNlIGV2ZW50IHBhdHRlcm4gY2FuIGJlIHNwZWNp
ZmllZCBieSBwcm92aWRpbmcgYSBmaWxlCitpbnN0ZWFkOjoKIAotMy4gUnVuIHRoZSB2aXJ0dWFs
IG1hY2hpbmUgdG8gcHJvZHVjZSBhIHRyYWNlIGZpbGU6OgotCi0gICAgcWVtdSAtLXRyYWNlIGV2
ZW50cz0vdG1wL2V2ZW50cyAuLi4gIyB5b3VyIG5vcm1hbCBRRU1VIGludm9jYXRpb24KLQotNC4g
UHJldHR5LXByaW50IHRoZSBiaW5hcnkgdHJhY2UgZmlsZTo6Ci0KLSAgICAuL3NjcmlwdHMvc2lt
cGxldHJhY2UucHkgdHJhY2UtZXZlbnRzLWFsbCB0cmFjZS0qICMgT3ZlcnJpZGUgKiB3aXRoIFFF
TVUgPHBpZD4KKyAgICAkIGVjaG8gIm1lbW9yeV9yZWdpb25fb3BzXyoiID4vdG1wL2V2ZW50cwor
ICAgICQgcWVtdSAtLXRyYWNlIGV2ZW50cz0vdG1wL2V2ZW50cyAuLi4KIAogVHJhY2UgZXZlbnRz
CiA9PT09PT09PT09PT0KQEAgLTE5NSw3ICsxOTUsNyBAQCBzY3JpcHQuCiAKIFRoZSB0cmFjZSBi
YWNrZW5kcyBhcmUgY2hvc2VuIGF0IGNvbmZpZ3VyZSB0aW1lOjoKIAotICAgIC4vY29uZmlndXJl
IC0tZW5hYmxlLXRyYWNlLWJhY2tlbmRzPXNpbXBsZQorICAgIC4vY29uZmlndXJlIC0tZW5hYmxl
LXRyYWNlLWJhY2tlbmRzPXNpbXBsZSxkdHJhY2UKIAogRm9yIGEgbGlzdCBvZiBzdXBwb3J0ZWQg
dHJhY2UgYmFja2VuZHMsIHRyeSAuL2NvbmZpZ3VyZSAtLWhlbHAgb3Igc2VlIGJlbG93LgogSWYg
bXVsdGlwbGUgYmFja2VuZHMgYXJlIGVuYWJsZWQsIHRoZSB0cmFjZSBpcyBzZW50IHRvIHRoZW0g
YWxsLgpAQCAtMjI3LDEwICsyMjcsMTEgQEAgdXNlcyBEUFJJTlRGKCkuCiBTaW1wbGV0cmFjZQog
LS0tLS0tLS0tLS0KIAotVGhlICJzaW1wbGUiIGJhY2tlbmQgc3VwcG9ydHMgY29tbW9uIHVzZSBj
YXNlcyBhbmQgY29tZXMgYXMgcGFydCBvZiB0aGUgUUVNVQotc291cmNlIHRyZWUuICBJdCBtYXkg
bm90IGJlIGFzIHBvd2VyZnVsIGFzIHBsYXRmb3JtLXNwZWNpZmljIG9yIHRoaXJkLXBhcnR5Ci10
cmFjZSBiYWNrZW5kcyBidXQgaXQgaXMgcG9ydGFibGUuICBUaGlzIGlzIHRoZSByZWNvbW1lbmRl
ZCB0cmFjZSBiYWNrZW5kCi11bmxlc3MgeW91IGhhdmUgc3BlY2lmaWMgbmVlZHMgZm9yIG1vcmUg
YWR2YW5jZWQgYmFja2VuZHMuCitUaGUgInNpbXBsZSIgYmFja2VuZCB3cml0ZXMgYmluYXJ5IHRy
YWNlIGxvZ3MgdG8gYSBmaWxlIGZyb20gYSB0aHJlYWQsIG1ha2luZworaXQgbG93ZXIgb3Zlcmhl
YWQgdGhhbiB0aGUgImxvZyIgYmFja2VuZC4gQSBQeXRob24gQVBJIGlzIGF2YWlsYWJsZSBmb3Ig
d3JpdGluZworb2ZmbGluZSB0cmFjZSBmaWxlIGFuYWx5c2lzIHNjcmlwdHMuIEl0IG1heSBub3Qg
YmUgYXMgcG93ZXJmdWwgYXMKK3BsYXRmb3JtLXNwZWNpZmljIG9yIHRoaXJkLXBhcnR5IHRyYWNl
IGJhY2tlbmRzIGJ1dCBpdCBpcyBwb3J0YWJsZSBhbmQgaGFzIG5vCitzcGVjaWFsIGxpYnJhcnkg
ZGVwZW5kZW5jaWVzLgogCiBNb25pdG9yIGNvbW1hbmRzCiB+fn5+fn5+fn5+fn5+fn5+Ci0tIAoy
LjI5LjIKCg==


