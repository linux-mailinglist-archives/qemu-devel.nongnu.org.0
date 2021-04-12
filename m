Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A5B35C8EE
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 16:39:02 +0200 (CEST)
Received: from localhost ([::1]:40462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVxiP-00005k-MA
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 10:39:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lVxeY-0005Pq-0u
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 10:35:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lVxeU-0007ux-Ja
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 10:35:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618238098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=93+ZsdMSqCZG5DETBxUYM5xc0TFQgk6H2ATtGs6dxfo=;
 b=R78RGxo0EQv5NQ9uekdF8evqEZspR5x2FO2FqpL04988NQj5rzQ1nLAZ3HEPj/dIrrUkPe
 3VvMqVSSJQAfjeuJrr6qhwqgab1r+ekYeFEwdikF4AdSqPNH4aJpawZYxBAvXoG+jdRjNe
 dF2/d51rKd6jezRd/rJFCFpDYwcFGg0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-zWNQgjjMOG-mAllD0fww3g-1; Mon, 12 Apr 2021 10:34:56 -0400
X-MC-Unique: zWNQgjjMOG-mAllD0fww3g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99B23189C440
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 14:34:55 +0000 (UTC)
Received: from localhost (ovpn-115-66.ams2.redhat.com [10.36.115.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D9A9860BD8;
 Mon, 12 Apr 2021 14:34:51 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] docs/devel/qgraph: add troubleshooting information
Date: Mon, 12 Apr 2021 15:34:37 +0100
Message-Id: <20210412143437.727560-3-stefanha@redhat.com>
In-Reply-To: <20210412143437.727560-1-stefanha@redhat.com>
References: <20210412143437.727560-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_BASE64_TEXT=1.741, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SXQgY2FuIGJlIHRyaWNreSB0byB0cm91Ymxlc2hvb3QgcW9zLXRlc3Qgd2hlbiBhIHRlc3Qgd29u
J3QgZXhlY3V0ZS4gQWRkCmFuIGV4cGxhbmF0aW9uIG9mIGhvdyB0byB0cmFjZSBxZ3JhcGggbm9k
ZSBjb25uZWN0aXZpdHkgYW5kIGZpbmQgd2hpY2gKbm9kZSBoYXMgdGhlIHByb2JsZW0uCgpDYzog
RW1hbnVlbGUgR2l1c2VwcGUgRXNwb3NpdG8gPGVlc3Bvc2l0QHJlZGhhdC5jb20+CkNjOiBQYW9s
byBCb256aW5pIDxwYm9uemluaUByZWRoYXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gSGFq
bm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+Ci0tLQogZG9jcy9kZXZlbC9xZ3JhcGgucnN0IHwg
NTggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNo
YW5nZWQsIDU4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kb2NzL2RldmVsL3FncmFwaC5y
c3QgYi9kb2NzL2RldmVsL3FncmFwaC5yc3QKaW5kZXggYTlhZmYxNjdhZC4uMzE4NTM0ZDRiMCAx
MDA2NDQKLS0tIGEvZG9jcy9kZXZlbC9xZ3JhcGgucnN0CisrKyBiL2RvY3MvZGV2ZWwvcWdyYXBo
LnJzdApAQCAtOTIsNiArOTIsNjQgQEAgVGhlIGJhc2ljIGZyYW1ld29yayBzdGVwcyBhcmUgdGhl
IGZvbGxvd2luZzoKIERlcGVuZGluZyBvbiB0aGUgUUVNVSBiaW5hcnkgdXNlZCwgb25seSBzb21l
IGRyaXZlcnMvbWFjaGluZXMgd2lsbCBiZQogYXZhaWxhYmxlIGFuZCBvbmx5IHRlc3QgdGhhdCBh
cmUgcmVhY2hlZCBieSB0aGVtIHdpbGwgYmUgZXhlY3V0ZWQuCiAKK1Ryb3VibGVzaG9vdGluZyB1
bmF2YWlsYWJsZSB0ZXN0cworXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eCitJZiB0
aGVyZSBpcyBubyBwYXRoIGZyb20gYW4gYXZhaWxhYmxlIG1hY2hpbmUgdG8gYSB0ZXN0IHRoZW4g
dGhhdCB0ZXN0IHdpbGwgYmUKK3VuYXZhaWxhYmxlIGFuZCB3b24ndCBleGVjdXRlLiBUaGlzIGNh
biBoYXBwZW4gaWYgYSB0ZXN0IG9yIGRyaXZlciBkaWQgbm90IHNldAordXAgaXRzIHFncmFwaCBu
b2RlIGNvcnJlY3RseS4gSXQgY2FuIGFsc28gaGFwcGVuIGlmIHRoZSBuZWNlc3NhcnkgbWFjaGlu
ZSB0eXBlCitvciBkZXZpY2UgaXMgbWlzc2luZyBmcm9tIHRoZSBRRU1VIGJpbmFyeSBiZWNhdXNl
IGl0IHdhcyBjb21waWxlZCBvdXQgb3IKK290aGVyd2lzZS4KKworSXQgaXMgcG9zc2libGUgdG8g
dHJvdWJsZXNob290IHVuYXZhaWxhYmxlIHRlc3RzIGJ5IHJ1bm5pbmc6OgorCisgICQgUVRFU1Rf
UUVNVV9CSU5BUlk9YnVpbGQvcWVtdS1zeXN0ZW0teDg2XzY0IGJ1aWxkL3Rlc3RzL3F0ZXN0L3Fv
cy10ZXN0IC0tdmVyYm9zZQorICAjIEFMTCBRR1JBUEggRURHRVM6IHsKKyAgIyAgIHNyYz0ndmly
dGlvLW5ldCcKKyAgIyAgICAgIHwtPiBkZXN0PSd2aXJ0aW8tbmV0LXRlc3RzL3Zob3N0LXVzZXIv
bXVsdGlxdWV1ZScgdHlwZT0yIChub2RlPTB4NTU5MTQyMTA5ZTMwKQorICAjICAgICAgfC0+IGRl
c3Q9J3ZpcnRpby1uZXQtdGVzdHMvdmhvc3QtdXNlci9taWdyYXRlJyB0eXBlPTIgKG5vZGU9MHg1
NTkxNDIxMDlkMDApCisgICMgICBzcmM9J3ZpcnRpby1uZXQtcGNpJworICAjICAgICAgfC0+IGRl
c3Q9J3ZpcnRpby1uZXQnIHR5cGU9MSAobm9kZT0weDU1OTE0MjEwZDc0MCkKKyAgIyAgIHNyYz0n
cGNpLWJ1cycKKyAgIyAgICAgIHwtPiBkZXN0PSd2aXJ0aW8tbmV0LXBjaScgdHlwZT0yIChub2Rl
PTB4NTU5MTQyMTBkODgwKQorICAjICAgc3JjPSdwY2ktYnVzLXBjJworICAjICAgICAgfC0+IGRl
c3Q9J3BjaS1idXMnIHR5cGU9MSAobm9kZT0weDU1OTE0MjEwM2Y0MCkKKyAgIyAgIHNyYz0naTQ0
MEZYLXBjaWhvc3QnCisgICMgICAgICB8LT4gZGVzdD0ncGNpLWJ1cy1wYycgdHlwZT0wIChub2Rl
PTB4NTU5MTQyMTBhYzcwKQorICAjICAgc3JjPSd4ODZfNjQvcGMnCisgICMgICAgICB8LT4gZGVz
dD0naTQ0MEZYLXBjaWhvc3QnIHR5cGU9MCAobm9kZT0weDU1OTE0MjExMTdmMCkKKyAgIyAgIHNy
Yz0nJworICAjICAgICAgfC0+IGRlc3Q9J3g4Nl82NC9wYycgdHlwZT0wIChub2RlPTB4NTU5MTQy
MTExNjAwKQorICAjICAgICAgfC0+IGRlc3Q9J2FybS9yYXNwaTInIHR5cGU9MCAobm9kZT0weDU1
OTE0MjExMDc0MCkKKyAgLi4uCisgICMgfQorICAjIEFMTCBRR1JBUEggTk9ERVM6IHsKKyAgIyAg
IG5hbWU9J3ZpcnRpby1uZXQtdGVzdHMvYW5ub3VuY2Utc2VsZicgdHlwZT0zIGNtZF9saW5lPSco
bnVsbCknIFthdmFpbGFibGVdCisgICMgICBuYW1lPSdhcm0vcmFzcGkyJyB0eXBlPTAgY21kX2xp
bmU9Jy1NIHJhc3BpMiAnIFtVTkFWQUlMQUJMRV0KKyAgLi4uCisgICMgfQorCitUaGUgYGB2aXJ0
aW8tbmV0LXRlc3RzL2Fubm91bmNlLXNlbGZgYCB0ZXN0IGlzIGxpc3RlZCBhcyAiYXZhaWxhYmxl
IiBpbiB0aGUKKyJBTEwgUUdSQVBIIE5PREVTIiBvdXRwdXQuIFRoaXMgbWVhbnMgdGhlIHRlc3Qg
d2lsbCBleGVjdXRlLiBXZSBjYW4gZm9sbG93IHRoZQorcWdyYXBoIHBhdGggaW4gdGhlICJBTEwg
UUdSQVBIIEVER0VTIiBvdXRwdXQgYXMgZm9sbG93czogJycgLT4gJ3g4Nl82NC9wYycgLT4KKydp
NDQwRlgtcGNpaG9zdCcgLT4gJ3BjaS1idXMtcGMnIC0+ICdwY2ktYnVzJyAtPiAndmlydGlvLW5l
dC1wY2knIC0+CisndmlydGlvLW5ldCcuIFRoZSByb290IG9mIHRoZSBxZ3JhcGggaXMgJycgYW5k
IHRoZSBkZXB0aCBmaXJzdCBzZWFyY2ggYmVnaW5zCit0aGVyZS4KKworVGhlIGBgYXJtL3Jhc3Bp
YGAgbWFjaGluZSBub2RlIGlzIGxpc3RlZCBhcyAiVU5BVkFJTEFCTEUiLiBBbHRob3VnaCBpdCBp
cworcmVhY2hhYmxlIGZyb20gdGhlIHJvb3QgdmlhICcnIC0+ICdhcm0vcmFzcGkyJyB0aGUgbm9k
ZSBpcyB1bmF2YWlsYWJsZSBiZWNhdXNlCit0aGUgUUVNVSBiaW5hcnkgZGlkIG5vdCBsaXN0IGl0
IHdoZW4gcXVlcmllZCBieSB0aGUgZnJhbWV3b3JrLiBUaGlzIGlzIGV4cGVjdGVkCitiZWNhdXNl
IHdlIHVzZWQgdGhlIGBgcWVtdS1zeXN0ZW0teDg2XzY0YGAgYmluYXJ5IHdoaWNoIGRvZXMgbm90
IHN1cHBvcnQgQVJNCittYWNoaW5lIHR5cGVzLgorCitJZiBhIHRlc3QgaXMgdW5leHBlY3RlZGx5
IGxpc3RlZCBhcyAiVU5BVkFJTEFCTEUiLCBmaXJzdCBjaGVjayB0aGF0IHRoZSAiQUxMCitRR1JB
UEggRURHRVMiIG91dHB1dCByZXBvcnRzIGVkZ2UgY29ubmVjdGl2aXR5IGZyb20gdGhlIHJvb3Qg
KCcnKSB0byB0aGUgdGVzdC4KK0lmIHRoZXJlIGlzIG5vIGNvbm5lY3Rpdml0eSB0aGVuIHRoZSBx
Z3JhcGggbm9kZXMgd2VyZSBub3Qgc2V0IHVwIGNvcnJlY3RseSBhbmQKK3RoZSBkcml2ZXIgb3Ig
dGVzdCBjb2RlIGlzIGluY29ycmVjdC4gSWYgdGhlcmUgaXMgY29ubmVjdGl2aXR5LCBjaGVjayB0
aGUKK2F2YWlsYWJpbGl0eSBvZiBlYWNoIG5vZGUgaW4gdGhlIHBhdGggaW4gdGhlICJBTEwgUUdS
QVBIIE5PREVTIiBvdXRwdXQuIFRoZQorZmlyc3QgdW5hdmFpbGFibGUgbm9kZSBpbiB0aGUgcGF0
aCBpcyB0aGUgcmVhc29uIHdoeSB0aGUgdGVzdCBpcyB1bmF2YWlsYWJsZS4KK1R5cGljYWxseSB0
aGlzIGlzIGJlY2F1c2UgdGhlIFFFTVUgYmluYXJ5IGxhY2tzIHN1cHBvcnQgZm9yIHRoZSBuZWNl
c3NhcnkKK21hY2hpbmUgdHlwZSBvciBkZXZpY2UuCisKIENyZWF0aW5nIGEgbmV3IGRyaXZlciBh
bmQgaXRzIGludGVyZmFjZQogIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIi
IiIKIAotLSAKMi4zMC4yCgo=


