Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F7530F631
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 16:26:56 +0100 (CET)
Received: from localhost ([::1]:49882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7gX1-0002vv-JX
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 10:26:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <a-shinkevich@yandex.ru>)
 id 1l7fsL-0007lx-JR; Thu, 04 Feb 2021 09:44:53 -0500
Received: from forward500o.mail.yandex.net ([37.140.190.195]:54371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <a-shinkevich@yandex.ru>)
 id 1l7fsI-0002gS-6b; Thu, 04 Feb 2021 09:44:53 -0500
Received: from sas1-9b68b0b83e4d.qloud-c.yandex.net
 (sas1-9b68b0b83e4d.qloud-c.yandex.net
 [IPv6:2a02:6b8:c14:2706:0:640:9b68:b0b8])
 by forward500o.mail.yandex.net (Yandex) with ESMTP id 03EA560253;
 Thu,  4 Feb 2021 17:44:43 +0300 (MSK)
Received: from localhost (localhost [::1])
 by sas1-9b68b0b83e4d.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 8rZmpPKce6-igHuZdP8; Thu, 04 Feb 2021 17:44:42 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
 t=1612449882; bh=v1ZkU3h8pqXe32Uo3StC4PzXR2j0FHWxDnLjQPvUnBY=;
 h=Message-Id:Cc:Subject:In-Reply-To:Date:References:To:From;
 b=EclI2wuPVAyLK4/pMQeg0TXz1SjfCTc3kBQDjd+tGMlgDLRY/9LKx0MZUPJDYy6ht
 G1mFpZGpxvM4o3oM6UEhtaPHDsqoUSQnL6vVJKNYlP79uV+NzA88ivoouxw2UvAG44
 sclmIyS9/6PWRu2fRDUhyPZxBbV1NM/X6XLqtfEA=
Authentication-Results: sas1-9b68b0b83e4d.qloud-c.yandex.net;
 dkim=pass header.i=@yandex.ru
Received: by sas1-ac0cb6954dcf.qloud-c.yandex.net with HTTP;
 Thu, 04 Feb 2021 17:44:42 +0300
From: Shinkevich Andrey <a-shinkevich@yandex.ru>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
In-Reply-To: <87sg6dqdrn.fsf@linaro.org>
References: <3063641612353936@sas1-6059effbd848.qloud-c.yandex.net>
 <87sg6dqdrn.fsf@linaro.org>
Subject: Re: TCG and MTTCG questions
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Thu, 04 Feb 2021 17:44:42 +0300
Message-Id: <641941612445918@mail.yandex.ru>
Content-Transfer-Encoding: base64
Content-Type: text/html; charset=utf-8
Received-SPF: pass client-ip=37.140.190.195;
 envelope-from=a-shinkevich@yandex.ru; helo=forward500o.mail.yandex.net
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, HTML_MIME_NO_HTML_TAG=0.377, MIME_HTML_ONLY=0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 04 Feb 2021 10:22:57 -0500
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
Cc: "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PGRpdj4rIHFlbXUtYXJtQCwgcWVtdS1kZXZlbEAsIHJpY2hhcmQuaGVuZGVyc29uQDwvZGl2Pjxk
aXY+wqA8L2Rpdj48ZGl2PkRlYXIgQWxleCw8L2Rpdj48ZGl2PsKgPC9kaXY+PGRpdj5UaGFuayB5
b3Ugc28gbXVjaCBmb3IgeW91ciBxdWljayByZXNwb25zZSBhbmQgZm9yIGFuc3dlcmluZyBteSBx
dWVzdGlvbnMuIEl0IHdhcyBoZWxwZnVsLjwvZGl2PjxkaXY+SSB3b3VsZCBsaWtlIHRvIHN1YnNj
cmliZSBmb3IgdGhlIG1haWxpbmcgbGlzdCByZWdhcmRpbmcgdGhlIFRDRywgTVRUQ0cgYW5kIEFS
TSBkZXZlbG9wbWVudCBwcm9ncmVzcyBpbiBRRU1VLjwvZGl2PjxkaXY+VG8gc2VlIHdoYXQgSSBj
b3VsZCBjb250cmlidXRlLCBJIHdpbGwgd2FudCB0byB0ZXN0IG15IGNhc2VzIGFuZCBpbnZlc3Rp
Z2F0ZSB0aGUgUUVNVSBjb2RlIG1vcmUgY2FyZWZ1bGx5LCBpbmNsdWRpbmcgdGhlIHBhdGNoZXMg
eW91IHdlcmUgcmVmZXJyaW5nIHRvLiBUaGVuIEkgd2lsbCBjb21lIGJhY2sgd2l0aCBkZXRhaWxz
LjwvZGl2PjxkaXY+VGhlIG1haW4gaWRlYSBjdXJyZW50bHkgaXMgdG8gYWNjZWxlcmF0ZSB0aGUg
aW5zdHJ1Y3Rpb24gdHJhbnNsYXRpb24gaW4gY2FzZSBvZiB0aGUgQVJNdjggZ3Vlc3Qgb24gdGhl
IHg4Nl82NCBob3N0IGFuZCB0byBhZGQgaW5zdHJ1Y3Rpb25zIHRoYXQgaGF2ZSBub3QgYmVlbiBz
dXBwb3J0ZWQgeWV0LCBpZiBhbnkuPC9kaXY+PGRpdj5BIHBhcnRpY3VsYXIgY2hhbGxlbmdlIEkg
YW0gdHJ5aW5nIHRvIGNvcGUgd2l0aCBub3cgaXMgdG8gdGVzdCBvbiB0aGUgbmVzdGVkIFFFTVUg
Vk1zIChBUk0gZ3Vlc3Qgb24geDg2IGhvc3QgVk0pLiBUaGF0IGlzIG5vdCBhIGdvb2QgYXBwcm9h
Y2ggYnV0IHRoZSBvbmx5IGF2YWlsYWJsZSBmb3IgbWUgbm93LiBJZiB5b3UgYWR2aXNlIG1lIHRo
ZSBwcm9zIGFuZCBjb25zIG9mIHN1Y2ggYSB0ZXN0aW5nIG1vZGVsLCBJIHdpbGwgYXBwcmVjaWF0
ZS48L2Rpdj48ZGl2PsKgPC9kaXY+PGRpdj5LaW5kIHJlZ2FyZHMsPC9kaXY+PGRpdj5BbmRyZXkg
U2hpbmtldmljaDwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PjAzLjAyLjIwMjEsIDIwOjA5LCAiQWxl
eCBCZW5uw6llIiAmbHQ7YWxleC5iZW5uZWVAbGluYXJvLm9yZyZndDs6PC9kaXY+PGJsb2NrcXVv
dGU+PHA+PGJyIC8+U2hpbmtldmljaCBBbmRyZXkgJmx0OzxhIGhyZWY9Im1haWx0bzphLXNoaW5r
ZXZpY2hAeWFuZGV4LnJ1IiByZWw9Im5vb3BlbmVyIG5vcmVmZXJyZXIiPmEtc2hpbmtldmljaEB5
YW5kZXgucnU8L2E+Jmd0OyB3cml0ZXM6PGJyIC8+wqA8L3A+PGJsb2NrcXVvdGU+wqBEZWFyIEFs
ZXgsPGJyIC8+wqDCoDxiciAvPsKgTXkgbmFtZSBpcyBBbmRyZXkgU2hpbmtldmljaC4gSSB1c2Vk
IHRvIGNvbnRyaWJ1dGUgaW50byB0aGUgUUVNVSBwcm9qZWN0IChibG9jayBsYXllcikuIE5vdyBJ
IHR1cm5lZCBteSBtaW5kIHRvIHRoZSBUQ0cgYW5kIE1UVENHLjxiciAvPsKgV291bGQgeW91IHBs
ZWFzZSBhbnN3ZXIgc29tZSBxdWVzdGlvbnM/PC9ibG9ja3F1b3RlPjxwPjxiciAvPlN1cmUuIElu
IGZ1dHVyZSBwbGVhc2UganVzdCBhc2sgb24gcWVtdS1kZXZlbCAoYW5kIGNjIG1lKSBzbyBvdGhl
cnMgY2FuPGJyIC8+KGhvcGVmdWxseSkgYmVuZWZpdCBmcm9tIHRoZSBkaXNjb3Vyc2UuPGJyIC8+
wqA8L3A+PGJsb2NrcXVvdGU+wqDCoDxiciAvPsKgSSB3b3VsZCBsaWtlIHRvIGluc3RhbGwgYSBM
aW51eCBBUk02NCBndWVzdCBvbiB0aGUgVk0gcnVubmluZyBvbiBhIExpbnV4IHg4Nl82NCBob3N0
LiBCb3RoIHN5c3RlbXMgYXJlIHRoZSBDZW50T1MuPGJyIC8+wqDCoDxiciAvPsKgMS4gV2hpY2gg
c3VwcG9ydGVkIG1hY2hpbmUgKGxpc3RlZCB3aXRoIOKAnHFlbXUtc3lzdGVtLWFhcmNoNjQgLU0g
aGVscOKAnSBjb21tYW5kKSBpcyBnb29kIHRvIHRyYW5zbGF0ZSB0aGUgQUFyY2g2NCBpbnN0cnVj
dGlvbiBzZXQ8YnIgLz7CoChBUk12OCkgdG8gdGhlIHg4Nl82NCBDUFUgcGxhdGZvcm0/PC9ibG9j
a3F1b3RlPjxwPjxiciAvPklmIGFsbCB5b3UgYXJlIGludGVyZXN0ZWQgaW4gaXMgdGhlIEFSTXY4
IHBsYXRmb3JtIHRoZW4gYnkgZmFyIHRoZSBiZXN0PGJyIC8+bWFjaGluZSBpcyAtTSB2aXJ0IHdo
aWNoIGNhbiBydW4gd2l0aCBhbGwgdGhlIHY4IENQVXMgaW5jbHVkaW5nIC1jcHUgbWF4LjxiciAv
PsKgPC9wPjxibG9ja3F1b3RlPsKgMi4gSWYgbm90IHN1cHBvcnRlZCBieSBRRU1VIHlldCwgb3Ig
aWYgaXQgaXMgdHVybmVkIG91dCB0aGF0IG5vdCBhbGwgaW5zdHJ1Y3Rpb25zIGFyZSBzdXBwb3J0
ZWQgYnkgdGhlIFRDRywgd2hhdCBxdWFsaWZpY2F0aW9ucyBhcmUgcmVxdWlyZWQgdG88YnIgLz7C
oGltcGxlbWVudCB0aGVtIGluIFRDRz8gSSBtZWFuIHRoZSBzcGVjaWFsaXN0KHMpIHF1YWxpZmll
ZCBpbiBBc3NlbWJseSBmb3IgQUFyY2g2NCBhbmQgeDg2XzY0LCBvciBpbiBMaW51eCBLVk0gYW5k
IExpbnV4IGtlcm5lbCBNZW1vcnk8YnIgLz7CoE1hbmFnZXIsIG9yIGVsc2UgaW4gR0NDIGNvbXBp
bGVyLCBldGMuLjwvYmxvY2txdW90ZT48cD48YnIgLz5Ob3RoaW5nIG1vcmUgdGhhbiByZWFkaW5n
IHRoZSBBUk0gQVJNIGFuZCBiZWluZyBhYmxlIHRvIGZvbGxvdyB0aGUgY29kZS48YnIgLz5UaGUg
VENHIGlzIHNpbWlsYXIgdG8gYSBjb21waWxlciBidXQgZGlmZmVyZW50IGVub3VnaCB0byBiZSBp
dCdzIG93bjxiciAvPnRoaW5nLiBXZSBoYXZlIHByZXR0eSBnb29kIGNvdmVyYWdlIG9mIHRoZSBB
Uk12OCBJU0EsIG1vc3QgbmV3PGJyIC8+aW5zdHJ1Y3Rpb25zIGFyZSBzeXN0ZW0gbGV2ZWwgb25l
cyBmb3IgbmV3IGZlYXR1cmVzLiBUaGUgYmlnZ2VzdDxiciAvPm91dHN0YW5kaW5nIHNldCBpcyBT
VkUyIGFuZCBNVEUgZm9yIHdoaWNoIHRoZXJlIGFyZSBwYXRjaGVzIG9uIGxpc3QuPGJyIC8+PGJy
IC8+SXMgdGhlcmUgYW55dGhpbmcgaW4gcGFydGljdWxhciB5b3UgYXJlIGludGVyZXN0ZWQgaW4/
PGJyIC8+wqA8L3A+PGJsb2NrcXVvdGU+wqAzLiBXaG9tIG1heSBJIGNvbnRhY3QgdG8gY29udHJp
YnV0ZSBpbnRvIHRoZSBRRU1VIE1UVENHPGJyIC8+wqBpbXBsZW1lbnRhdGlvbj88L2Jsb2NrcXVv
dGU+PHA+PGJyIC8+QWxsIGRldmVsb3BtZW50IHRha2VzIHBsYWNlIG9uIHFlbXUtZGV2ZWwuIFlv
dSBjYW4gQ0MgbWUgYW5kIHRoZSBUQ0cgYW5kPGJyIC8+QVJNIG1haW50YWluZXJzICh3aGljaCB5
b3UgY2FuIGNvbmZpZ3VyZSBnaXQgdG8gZG8gd2hlbiB5b3Ugc2VuZCBwYXRjaGVzPGJyIC8+YXV0
b21hdGljYWxseSkuPGJyIC8+wqA8L3A+PGJsb2NrcXVvdGU+wqA0LiBXaGVyZSBjYW4gSSBmaW5k
IGFuIHVwLXRvLWRhdGUgbGlzdCBvZiBjaGFsbGVuZ2VzIG9mIHRoZSBUQ0cgYW5kPGJyIC8+wqBN
VFRDRyBpbXBsZW1lbnRhdGlvbiB0byBwYXJ0aWNpcGF0ZSBhcyBhIGNvbnRyaWJ1dG9yPzwvYmxv
Y2txdW90ZT48cD48YnIgLz5JJ20gYWZyYWlkOjxiciAvPjxiciAvPsKgwqA8YSBocmVmPSJodHRw
czovL3dpa2kucWVtdS5vcmcvRmVhdHVyZXMvdGNnLW11bHRpdGhyZWFkIiByZWw9Im5vb3BlbmVy
IG5vcmVmZXJyZXIiPmh0dHBzOi8vd2lraS5xZW11Lm9yZy9GZWF0dXJlcy90Y2ctbXVsdGl0aHJl
YWQ8L2E+PGJyIC8+PGJyIC8+aXMgYWJvdXQgYXMgdXB0byBkYXRlIGFzIHlvdSdsbCBmaW5kLiBN
VFRDRyBpcyBjb25zaWRlcmVkIGZlYXR1cmU8YnIgLz5jb21wbGV0ZS4gVHdvIGJpZyB0YXNrcyB0
aGF0IHJlbWFpbiBhcmU6PGJyIC8+PGJyIC8+wqDCoC0gcmVkdWNpbmcgQlFMIGNvbnRlbnRpb24g
KHNlZSBwYXRjaGVzIGZyb20gPGEgaHJlZj0ibWFpbHRvOnJvYmVydC5mb2xleUBsaW5hcm8ub3Jn
IiByZWw9Im5vb3BlbmVyIG5vcmVmZXJyZXIiPnJvYmVydC5mb2xleUBsaW5hcm8ub3JnPC9hPiBv
bjxiciAvPsKgwqDCoMKgdGhlIGxpc3QsIGN1cnJlbnRseSBzdGFsbGVkIGFzIGhlIG1vdmVkIG9u
KTxiciAvPjxiciAvPsKgwqAtIGltcGxlbWVudGluZyBzdHJvbmctb24td2VhayBNVFRDRyAoaGln
aGx5IGxpa2VseSB0byBzdWNrIHBlcmZvcm1hbmNlPGJyIC8+wqDCoMKgwqB3aXNlLCBidXQgc29t
ZW9uZSBuZWVkcyB0byB0cnkgYW5kIG1lYXN1cmUgaXQgdG8gc2VlIGlmIGl0J3Mgd29ydGggd2hp
bGUpPGJyIC8+wqA8L3A+PGJsb2NrcXVvdGU+wqBJZiBzb21lIG9mIG15IHF1ZXN0aW9ucyBjYW5u
b3QgYmUgYW5zd2VyZWQsIHJlZmVyIG1lIHRvIHRoZSBxdWFsaWZpZWQgcGVyc29uIHBsZWFzZS48
YnIgLz7CoMKgPGJyIC8+wqBJIGFtIGxvb2tpbmcgZm9yd2FyZCB0byBoZWFyaW5nIGZyb20geW91
LjxiciAvPsKgVGhhbmsgeW91LjxiciAvPsKgwqA8YnIgLz7CoEtpbmQgcmVnYXJkcyw8YnIgLz7C
oEFuZHJleSBTaGlua2V2aWNoPC9ibG9ja3F1b3RlPjxwPjxiciAvPsKgPC9wPi0tPGJyIC8+QWxl
eCBCZW5uw6llPC9ibG9ja3F1b3RlPg==

