Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 131A838E71C
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 15:07:16 +0200 (CEST)
Received: from localhost ([::1]:43904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llAId-0002ey-5H
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 09:07:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1llADv-0002WC-BO
 for qemu-devel@nongnu.org; Mon, 24 May 2021 09:02:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1llADr-0007gm-GW
 for qemu-devel@nongnu.org; Mon, 24 May 2021 09:02:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621861338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=euWbwCjrkNwNyW160mPypQMGgxxibCb1PhvP4119mfk=;
 b=Y2m6ShEGEVH/Hs9MTg3HrQ/rFnxjRlYBFCmsOgv36sr+cd5Z1fUXCzVktijFzPHsNI2hHc
 9WIedJUGEjEPzett08c9lL+0/F0FM2kjrBEOb/2y22LrdhLNo7CNVowcKDd9ctuoe9lVkV
 h6NAlJxxDIzuSet2CcvxYzEuo2pHfcs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-EjjnrvcSPxSbOyWrcR_M1w-1; Mon, 24 May 2021 09:02:11 -0400
X-MC-Unique: EjjnrvcSPxSbOyWrcR_M1w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97891A40E7;
 Mon, 24 May 2021 13:02:10 +0000 (UTC)
Received: from localhost (ovpn-113-244.ams2.redhat.com [10.36.113.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C2DF35C230;
 Mon, 24 May 2021 13:02:06 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 2/8] bitops.h: Improve find_xxx_bit() documentation
Date: Mon, 24 May 2021 14:01:44 +0100
Message-Id: <20210524130150.50998-3-stefanha@redhat.com>
In-Reply-To: <20210524130150.50998-1-stefanha@redhat.com>
References: <20210524130150.50998-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 John G Johnson <john.g.johnson@oracle.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPgoKRG9jdW1l
bnQgdGhlIGZvbGxvd2luZyBmdW5jdGlvbnMgcmV0dXJuIHRoZSBiaXRtYXAgc2l6ZQppZiBubyBt
YXRjaGluZyBiaXQgaXMgZm91bmQ6CgotIGZpbmRfZmlyc3RfYml0Ci0gZmluZF9uZXh0X2JpdAot
IGZpbmRfbGFzdF9iaXQKLSBmaW5kX2ZpcnN0X3plcm9fYml0Ci0gZmluZF9uZXh0X3plcm9fYml0
CgpSZXZpZXdlZC1ieTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFy
by5vcmc+ClNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVk
aGF0LmNvbT4KUmV2aWV3ZWQtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNv
bT4KTWVzc2FnZS1pZDogMjAyMTA1MTAyMDA3NTguMjYyMzE1NC0yLXBoaWxtZEByZWRoYXQuY29t
ClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4KLS0t
CiBpbmNsdWRlL3FlbXUvYml0b3BzLmggfCAxNSArKysrKysrKysrKystLS0KIDEgZmlsZSBjaGFu
Z2VkLCAxMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2luY2x1
ZGUvcWVtdS9iaXRvcHMuaCBiL2luY2x1ZGUvcWVtdS9iaXRvcHMuaAppbmRleCAzYWNiZjMzODRj
Li5hNzJmNjlmZWE4IDEwMDY0NAotLS0gYS9pbmNsdWRlL3FlbXUvYml0b3BzLmgKKysrIGIvaW5j
bHVkZS9xZW11L2JpdG9wcy5oCkBAIC0xNDAsNyArMTQwLDggQEAgc3RhdGljIGlubGluZSBpbnQg
dGVzdF9iaXQobG9uZyBuciwgY29uc3QgdW5zaWduZWQgbG9uZyAqYWRkcikKICAqIEBhZGRyOiBU
aGUgYWRkcmVzcyB0byBzdGFydCB0aGUgc2VhcmNoIGF0CiAgKiBAc2l6ZTogVGhlIG1heGltdW0g
c2l6ZSB0byBzZWFyY2gKICAqCi0gKiBSZXR1cm5zIHRoZSBiaXQgbnVtYmVyIG9mIHRoZSBmaXJz
dCBzZXQgYml0LCBvciBzaXplLgorICogUmV0dXJucyB0aGUgYml0IG51bWJlciBvZiB0aGUgbGFz
dCBzZXQgYml0LAorICogb3IgQHNpemUgaWYgdGhlcmUgaXMgbm8gc2V0IGJpdCBpbiB0aGUgYml0
bWFwLgogICovCiB1bnNpZ25lZCBsb25nIGZpbmRfbGFzdF9iaXQoY29uc3QgdW5zaWduZWQgbG9u
ZyAqYWRkciwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHNpemUp
OwpAQCAtMTUwLDYgKzE1MSw5IEBAIHVuc2lnbmVkIGxvbmcgZmluZF9sYXN0X2JpdChjb25zdCB1
bnNpZ25lZCBsb25nICphZGRyLAogICogQGFkZHI6IFRoZSBhZGRyZXNzIHRvIGJhc2UgdGhlIHNl
YXJjaCBvbgogICogQG9mZnNldDogVGhlIGJpdG51bWJlciB0byBzdGFydCBzZWFyY2hpbmcgYXQK
ICAqIEBzaXplOiBUaGUgYml0bWFwIHNpemUgaW4gYml0cworICoKKyAqIFJldHVybnMgdGhlIGJp
dCBudW1iZXIgb2YgdGhlIG5leHQgc2V0IGJpdCwKKyAqIG9yIEBzaXplIGlmIHRoZXJlIGFyZSBu
byBmdXJ0aGVyIHNldCBiaXRzIGluIHRoZSBiaXRtYXAuCiAgKi8KIHVuc2lnbmVkIGxvbmcgZmlu
ZF9uZXh0X2JpdChjb25zdCB1bnNpZ25lZCBsb25nICphZGRyLAogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHVuc2lnbmVkIGxvbmcgc2l6ZSwKQEAgLTE2MCw2ICsxNjQsOSBAQCB1bnNpZ25l
ZCBsb25nIGZpbmRfbmV4dF9iaXQoY29uc3QgdW5zaWduZWQgbG9uZyAqYWRkciwKICAqIEBhZGRy
OiBUaGUgYWRkcmVzcyB0byBiYXNlIHRoZSBzZWFyY2ggb24KICAqIEBvZmZzZXQ6IFRoZSBiaXRu
dW1iZXIgdG8gc3RhcnQgc2VhcmNoaW5nIGF0CiAgKiBAc2l6ZTogVGhlIGJpdG1hcCBzaXplIGlu
IGJpdHMKKyAqCisgKiBSZXR1cm5zIHRoZSBiaXQgbnVtYmVyIG9mIHRoZSBuZXh0IGNsZWFyZWQg
Yml0LAorICogb3IgQHNpemUgaWYgdGhlcmUgYXJlIG5vIGZ1cnRoZXIgY2xlYXIgYml0cyBpbiB0
aGUgYml0bWFwLgogICovCiAKIHVuc2lnbmVkIGxvbmcgZmluZF9uZXh0X3plcm9fYml0KGNvbnN0
IHVuc2lnbmVkIGxvbmcgKmFkZHIsCkBAIC0xNzEsNyArMTc4LDggQEAgdW5zaWduZWQgbG9uZyBm
aW5kX25leHRfemVyb19iaXQoY29uc3QgdW5zaWduZWQgbG9uZyAqYWRkciwKICAqIEBhZGRyOiBU
aGUgYWRkcmVzcyB0byBzdGFydCB0aGUgc2VhcmNoIGF0CiAgKiBAc2l6ZTogVGhlIG1heGltdW0g
c2l6ZSB0byBzZWFyY2gKICAqCi0gKiBSZXR1cm5zIHRoZSBiaXQgbnVtYmVyIG9mIHRoZSBmaXJz
dCBzZXQgYml0LgorICogUmV0dXJucyB0aGUgYml0IG51bWJlciBvZiB0aGUgZmlyc3Qgc2V0IGJp
dCwKKyAqIG9yIEBzaXplIGlmIHRoZXJlIGlzIG5vIHNldCBiaXQgaW4gdGhlIGJpdG1hcC4KICAq
Lwogc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIGZpbmRfZmlyc3RfYml0KGNvbnN0IHVuc2ln
bmVkIGxvbmcgKmFkZHIsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdW5zaWduZWQgbG9uZyBzaXplKQpAQCAtMTk0LDcgKzIwMiw4IEBAIHN0YXRpYyBpbmxpbmUg
dW5zaWduZWQgbG9uZyBmaW5kX2ZpcnN0X2JpdChjb25zdCB1bnNpZ25lZCBsb25nICphZGRyLAog
ICogQGFkZHI6IFRoZSBhZGRyZXNzIHRvIHN0YXJ0IHRoZSBzZWFyY2ggYXQKICAqIEBzaXplOiBU
aGUgbWF4aW11bSBzaXplIHRvIHNlYXJjaAogICoKLSAqIFJldHVybnMgdGhlIGJpdCBudW1iZXIg
b2YgdGhlIGZpcnN0IGNsZWFyZWQgYml0LgorICogUmV0dXJucyB0aGUgYml0IG51bWJlciBvZiB0
aGUgZmlyc3QgY2xlYXJlZCBiaXQsCisgKiBvciBAc2l6ZSBpZiB0aGVyZSBpcyBubyBjbGVhciBi
aXQgaW4gdGhlIGJpdG1hcC4KICAqLwogc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIGZpbmRf
Zmlyc3RfemVyb19iaXQoY29uc3QgdW5zaWduZWQgbG9uZyAqYWRkciwKICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgc2l6ZSkKLS0g
CjIuMzEuMQoK


