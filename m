Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AB830ABFA
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 16:52:50 +0100 (CET)
Received: from localhost ([::1]:52076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6bVR-00043q-2Z
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 10:52:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l6bS5-0000FV-65
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:49:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l6bS2-0007dk-Sc
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:49:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612194558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Aw2aaqFmUOPIaJnnia04oigbk8nUxqBEWnZVexh5mW8=;
 b=OjlEF7WAvFGd/r4WJpua/Wa+5J4b9mkVak9idJtCySMuI74Eur+4fJP78H/zyS8LV27xTO
 yG7K5Sx1CtkELyCm8KeKpGXOWdUvKFzVXMpkNqHpNiEIXRq9DCFX9ldveLUOYgm8b0iFh7
 dj0yRaKwnxt3Fq6dqloqikm/DQtJvGE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-Cv5wwW0NOOO_wY0dEe95BQ-1; Mon, 01 Feb 2021 10:49:13 -0500
X-MC-Unique: Cv5wwW0NOOO_wY0dEe95BQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2EEF10D40A3;
 Mon,  1 Feb 2021 15:47:51 +0000 (UTC)
Received: from localhost (ovpn-115-140.ams2.redhat.com [10.36.115.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B7B055C1A3;
 Mon,  1 Feb 2021 15:47:21 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/11] trace: fix simpletrace doc mismerge
Date: Mon,  1 Feb 2021 15:46:53 +0000
Message-Id: <20210201154703.180022-2-stefanha@redhat.com>
In-Reply-To: <20210201154703.180022-1-stefanha@redhat.com>
References: <20210201154703.180022-1-stefanha@redhat.com>
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
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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

VGhlIHNpbXBsZXRyYWNlIGRvY3VtZW50YXRpb24gc2VjdGlvbiB3YXMgYWNjaWRlbnRhbGx5IHNw
bGl0IHdoZW4gdGhlCmZ0cmFjZSBzZWN0aW9uIHdhcyBpbnRyb2R1Y2VkLiBNb3ZlIHRoZSBzaW1w
bGV0cmFjZS1zcGVjaWZpYwpkb2N1bWVudGF0aW9uIGJhY2sgaW50byB0aGUgc2ltcGxldHJhY2Ug
c2VjdGlvbi4KCkZpeGVzOiBlNjRkZDVlZmIyYzZkNTIyYTNiYzlkMDk2Y2Q0OWE0ZTUzZjBhZTEw
ICgidHJhY2U6IGRvY3VtZW50IGZ0cmFjZSBiYWNrZW5kIikKUmV2aWV3ZWQtYnk6IFBldGVyIE1h
eWRlbGwgPHBldGVyLm1heWRlbGxAbGluYXJvLm9yZz4KU2lnbmVkLW9mZi1ieTogU3RlZmFuIEhh
am5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPgpNZXNzYWdlLWlkOiAyMDIwMTIxNjE2MDkyMy43
MjI4OTQtMi1zdGVmYW5oYUByZWRoYXQuY29tClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBIYWpub2N6
aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KLS0tCiBkb2NzL2RldmVsL3RyYWNpbmcudHh0IHwgMzQg
KysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE3IGlu
c2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RvY3MvZGV2ZWwvdHJh
Y2luZy50eHQgYi9kb2NzL2RldmVsL3RyYWNpbmcudHh0CmluZGV4IGRiYTQzZmM3YTQuLjMxM2I4
ZWE0ZTkgMTAwNjQ0Ci0tLSBhL2RvY3MvZGV2ZWwvdHJhY2luZy50eHQKKysrIGIvZG9jcy9kZXZl
bC90cmFjaW5nLnR4dApAQCAtMjE4LDYgKzIxOCwyMyBAQCBzb3VyY2UgdHJlZS4gIEl0IG1heSBu
b3QgYmUgYXMgcG93ZXJmdWwgYXMgcGxhdGZvcm0tc3BlY2lmaWMgb3IgdGhpcmQtcGFydHkKIHRy
YWNlIGJhY2tlbmRzIGJ1dCBpdCBpcyBwb3J0YWJsZS4gIFRoaXMgaXMgdGhlIHJlY29tbWVuZGVk
IHRyYWNlIGJhY2tlbmQKIHVubGVzcyB5b3UgaGF2ZSBzcGVjaWZpYyBuZWVkcyBmb3IgbW9yZSBh
ZHZhbmNlZCBiYWNrZW5kcy4KIAorPT09PSBNb25pdG9yIGNvbW1hbmRzID09PT0KKworKiB0cmFj
ZS1maWxlIG9ufG9mZnxmbHVzaHxzZXQgPHBhdGg+CisgIEVuYWJsZS9kaXNhYmxlL2ZsdXNoIHRo
ZSB0cmFjZSBmaWxlIG9yIHNldCB0aGUgdHJhY2UgZmlsZSBuYW1lLgorCis9PT09IEFuYWx5emlu
ZyB0cmFjZSBmaWxlcyA9PT09CisKK1RoZSAic2ltcGxlIiBiYWNrZW5kIHByb2R1Y2VzIGJpbmFy
eSB0cmFjZSBmaWxlcyB0aGF0IGNhbiBiZSBmb3JtYXR0ZWQgd2l0aCB0aGUKK3NpbXBsZXRyYWNl
LnB5IHNjcmlwdC4gIFRoZSBzY3JpcHQgdGFrZXMgdGhlICJ0cmFjZS1ldmVudHMtYWxsIiBmaWxl
IGFuZCB0aGUKK2JpbmFyeSB0cmFjZToKKworICAgIC4vc2NyaXB0cy9zaW1wbGV0cmFjZS5weSB0
cmFjZS1ldmVudHMtYWxsIHRyYWNlLTEyMzQ1CisKK1lvdSBtdXN0IGVuc3VyZSB0aGF0IHRoZSBz
YW1lICJ0cmFjZS1ldmVudHMtYWxsIiBmaWxlIHdhcyB1c2VkIHRvIGJ1aWxkIFFFTVUsCitvdGhl
cndpc2UgdHJhY2UgZXZlbnQgZGVjbGFyYXRpb25zIG1heSBoYXZlIGNoYW5nZWQgYW5kIG91dHB1
dCB3aWxsIG5vdCBiZQorY29uc2lzdGVudC4KKwogPT09IEZ0cmFjZSA9PT0KIAogVGhlICJmdHJh
Y2UiIGJhY2tlbmQgd3JpdGVzIHRyYWNlIGRhdGEgdG8gZnRyYWNlIG1hcmtlci4gVGhpcyBlZmZl
Y3RpdmVseQpAQCAtMjQ2LDIzICsyNjMsNiBAQCBOT1RFOiBzeXNsb2cgbWF5IHNxdWFzaCBkdXBs
aWNhdGUgY29uc2VjdXRpdmUgdHJhY2UgZXZlbnRzIGFuZCBhcHBseSByYXRlCiAKIFJlc3RyaWN0
aW9uOiAic3lzbG9nIiBiYWNrZW5kIGlzIHJlc3RyaWN0ZWQgdG8gUE9TSVggY29tcGxpYW50IE9T
LgogCi09PT09IE1vbml0b3IgY29tbWFuZHMgPT09PQotCi0qIHRyYWNlLWZpbGUgb258b2ZmfGZs
dXNofHNldCA8cGF0aD4KLSAgRW5hYmxlL2Rpc2FibGUvZmx1c2ggdGhlIHRyYWNlIGZpbGUgb3Ig
c2V0IHRoZSB0cmFjZSBmaWxlIG5hbWUuCi0KLT09PT0gQW5hbHl6aW5nIHRyYWNlIGZpbGVzID09
PT0KLQotVGhlICJzaW1wbGUiIGJhY2tlbmQgcHJvZHVjZXMgYmluYXJ5IHRyYWNlIGZpbGVzIHRo
YXQgY2FuIGJlIGZvcm1hdHRlZCB3aXRoIHRoZQotc2ltcGxldHJhY2UucHkgc2NyaXB0LiAgVGhl
IHNjcmlwdCB0YWtlcyB0aGUgInRyYWNlLWV2ZW50cy1hbGwiIGZpbGUgYW5kIHRoZQotYmluYXJ5
IHRyYWNlOgotCi0gICAgLi9zY3JpcHRzL3NpbXBsZXRyYWNlLnB5IHRyYWNlLWV2ZW50cy1hbGwg
dHJhY2UtMTIzNDUKLQotWW91IG11c3QgZW5zdXJlIHRoYXQgdGhlIHNhbWUgInRyYWNlLWV2ZW50
cy1hbGwiIGZpbGUgd2FzIHVzZWQgdG8gYnVpbGQgUUVNVSwKLW90aGVyd2lzZSB0cmFjZSBldmVu
dCBkZWNsYXJhdGlvbnMgbWF5IGhhdmUgY2hhbmdlZCBhbmQgb3V0cHV0IHdpbGwgbm90IGJlCi1j
b25zaXN0ZW50LgotCiA9PT0gTFRUbmcgVXNlcnNwYWNlIFRyYWNlciA9PT0KIAogVGhlICJ1c3Qi
IGJhY2tlbmQgdXNlcyB0aGUgTFRUbmcgVXNlcnNwYWNlIFRyYWNlciBsaWJyYXJ5LiAgVGhlcmUg
YXJlIG5vCi0tIAoyLjI5LjIKCg==


