Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D77092D4880
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 19:02:50 +0100 (CET)
Received: from localhost ([::1]:34664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn3nd-0004VM-SK
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 13:02:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kn3UI-0003fi-US
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:42:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kn3UG-0007mG-Ja
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:42:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607535767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oSxOd1u8e3fJnH7nU1M1dxTh+HCkarFImSvjmmFt7EA=;
 b=fUmy23V/cYcYwm1HRNBTlNjtaVJhiEjZbHRlIRMBCyls4z9Vp4j6LaAgfrOGCH94dGWzMB
 G7+Rd3N+nC73GODWI18SqFho08Gi1+n8Jl654grLU06rHoYYSl2OvzSXT6zGkkeKGyt4oE
 P4Rqe50mUwPR1u8t2PrHpToVs/4Qacc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-X0xuH_o0OL6hdCHuVG8nNw-1; Wed, 09 Dec 2020 12:42:46 -0500
X-MC-Unique: X0xuH_o0OL6hdCHuVG8nNw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7896107ACE4;
 Wed,  9 Dec 2020 17:42:44 +0000 (UTC)
Received: from localhost (ovpn-115-48.ams2.redhat.com [10.36.115.48])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3D9A96EF41;
 Wed,  9 Dec 2020 17:42:41 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] trace: recommend "log" backend for getting started with
 tracing
Date: Wed,  9 Dec 2020 17:42:25 +0000
Message-Id: <20201209174225.401337-4-stefanha@redhat.com>
In-Reply-To: <20201209174225.401337-1-stefanha@redhat.com>
References: <20201209174225.401337-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VGhlICJzaW1wbGUiIGJhY2tlbmQgaXMgYWN0dWFsbHkgbW9yZSBjb21wbGljYXRlZCB0byB1c2Ug
dGhhbiB0aGUgImxvZyIKYmFja2VuZC4gVXBkYXRlIHRoZSBxdWlja3N0YXJ0IGRvY3VtZW50YXRp
b24gdG8gZmVhdHVyZSB0aGUgImxvZyIKYmFja2VuZCBpbnN0ZWFkIG9mIHRoZSAic2ltcGxlIiBi
YWNrZW5kLgoKU3VnZ2VzdGVkLWJ5OiBQZXRlciBNYXlkZWxsIDxwZXRlci5tYXlkZWxsQGxpbmFy
by5vcmc+ClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNv
bT4KLS0tCiBkb2NzL2RldmVsL3RyYWNpbmcucnN0IHwgMTkgKysrKysrKystLS0tLS0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZG9jcy9kZXZlbC90cmFjaW5nLnJzdCBiL2RvY3MvZGV2ZWwvdHJhY2luZy5yc3QKaW5k
ZXggNzZjYzFiMjRmYS4uMDM5YTBiYjI2NyAxMDA2NDQKLS0tIGEvZG9jcy9kZXZlbC90cmFjaW5n
LnJzdAorKysgYi9kb2NzL2RldmVsL3RyYWNpbmcucnN0CkBAIC0xMSw5ICsxMSw5IEBAIGZvciBk
ZWJ1Z2dpbmcsIHByb2ZpbGluZywgYW5kIG9ic2VydmluZyBleGVjdXRpb24uCiBRdWlja3N0YXJ0
CiA9PT09PT09PT09CiAKLTEuIEJ1aWxkIHdpdGggdGhlICdzaW1wbGUnIHRyYWNlIGJhY2tlbmQ6
OgorMS4gQnVpbGQgd2l0aCB0aGUgJ2xvZycgdHJhY2UgYmFja2VuZDo6CiAKLSAgICAuL2NvbmZp
Z3VyZSAtLWVuYWJsZS10cmFjZS1iYWNrZW5kcz1zaW1wbGUKKyAgICAuL2NvbmZpZ3VyZSAtLWVu
YWJsZS10cmFjZS1iYWNrZW5kcz1sb2cKICAgICBtYWtlCiAKIDIuIENyZWF0ZSBhIGZpbGUgd2l0
aCB0aGUgZXZlbnRzIHlvdSB3YW50IHRvIHRyYWNlOjoKQEAgLTI0LDEwICsyNCw2IEBAIFF1aWNr
c3RhcnQKIAogICAgIHFlbXUgLS10cmFjZSBldmVudHM9L3RtcC9ldmVudHMgLi4uICMgeW91ciBu
b3JtYWwgUUVNVSBpbnZvY2F0aW9uCiAKLTQuIFByZXR0eS1wcmludCB0aGUgYmluYXJ5IHRyYWNl
IGZpbGU6OgotCi0gICAgLi9zY3JpcHRzL3NpbXBsZXRyYWNlLnB5IHRyYWNlLWV2ZW50cy1hbGwg
dHJhY2UtKiAjIE92ZXJyaWRlICogd2l0aCBRRU1VIDxwaWQ+Ci0KIFRyYWNlIGV2ZW50cwogPT09
PT09PT09PT09CiAKQEAgLTE5NSw3ICsxOTEsNyBAQCBzY3JpcHQuCiAKIFRoZSB0cmFjZSBiYWNr
ZW5kcyBhcmUgY2hvc2VuIGF0IGNvbmZpZ3VyZSB0aW1lOjoKIAotICAgIC4vY29uZmlndXJlIC0t
ZW5hYmxlLXRyYWNlLWJhY2tlbmRzPXNpbXBsZQorICAgIC4vY29uZmlndXJlIC0tZW5hYmxlLXRy
YWNlLWJhY2tlbmRzPWxvZwogCiBGb3IgYSBsaXN0IG9mIHN1cHBvcnRlZCB0cmFjZSBiYWNrZW5k
cywgdHJ5IC4vY29uZmlndXJlIC0taGVscCBvciBzZWUgYmVsb3cuCiBJZiBtdWx0aXBsZSBiYWNr
ZW5kcyBhcmUgZW5hYmxlZCwgdGhlIHRyYWNlIGlzIHNlbnQgdG8gdGhlbSBhbGwuCkBAIC0yMjcs
MTAgKzIyMywxMSBAQCB1c2VzIERQUklOVEYoKS4KIFNpbXBsZXRyYWNlCiAtLS0tLS0tLS0tLQog
Ci1UaGUgInNpbXBsZSIgYmFja2VuZCBzdXBwb3J0cyBjb21tb24gdXNlIGNhc2VzIGFuZCBjb21l
cyBhcyBwYXJ0IG9mIHRoZSBRRU1VCi1zb3VyY2UgdHJlZS4gIEl0IG1heSBub3QgYmUgYXMgcG93
ZXJmdWwgYXMgcGxhdGZvcm0tc3BlY2lmaWMgb3IgdGhpcmQtcGFydHkKLXRyYWNlIGJhY2tlbmRz
IGJ1dCBpdCBpcyBwb3J0YWJsZS4gIFRoaXMgaXMgdGhlIHJlY29tbWVuZGVkIHRyYWNlIGJhY2tl
bmQKLXVubGVzcyB5b3UgaGF2ZSBzcGVjaWZpYyBuZWVkcyBmb3IgbW9yZSBhZHZhbmNlZCBiYWNr
ZW5kcy4KK1RoZSAic2ltcGxlIiBiYWNrZW5kIHdyaXRlcyBiaW5hcnkgdHJhY2UgbG9ncyB0byBh
IGZpbGUgZnJvbSBhIHRocmVhZCwgbWFraW5nCitpdCBsb3dlciBvdmVyaGVhZCB0aGFuIHRoZSAi
bG9nIiBiYWNrZW5kLiBBIFB5dGhvbiBBUEkgaXMgYXZhaWxhYmxlIGZvciB3cml0aW5nCitvZmZs
aW5lIHRyYWNlIGZpbGUgYW5hbHlzaXMgc2NyaXB0cy4gSXQgbWF5IG5vdCBiZSBhcyBwb3dlcmZ1
bCBhcworcGxhdGZvcm0tc3BlY2lmaWMgb3IgdGhpcmQtcGFydHkgdHJhY2UgYmFja2VuZHMgYnV0
IGl0IGlzIHBvcnRhYmxlIGFuZCBoYXMgbm8KK3NwZWNpYWwgbGlicmFyeSBkZXBlbmRlbmNpZXMu
CiAKIE1vbml0b3IgY29tbWFuZHMKIH5+fn5+fn5+fn5+fn5+fn4KLS0gCjIuMjguMAoK


