Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF81342039
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 15:55:18 +0100 (CET)
Received: from localhost ([::1]:49192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNGWz-0005sU-4X
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 10:55:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lNGVS-0004d0-Dc
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 10:53:43 -0400
Resent-Date: Fri, 19 Mar 2021 10:53:42 -0400
Resent-Message-Id: <E1lNGVS-0004d0-Dc@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lNGVM-0004JR-SE
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 10:53:41 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1616165605; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Jd92yWz7kBGyx7ju9DXS2+b8q7Hj4cbWL7N+TXhQVUu8GJq80wBUHczW/hdQHThI8j2F1WC0jJ3hHsaQtz3SaWprbaQDSkyGxIpZX6aH7sIJRHWKC15qG+V73bhu5rR3cbUk0XE7VPD1yOi/2F3mmEsqxKn2vIKTHibbICSrneU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1616165605;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=M19pYglegs+fKEfa3pfEnCa4Q0x+V72SpWQvu/Leok8=; 
 b=Z8Zub+AoCfFfSBq2WXfWcKBTZ7khXyJjUfQ0oDPcypX9hCrw4gsCHbd1n5p10PKfdYpSkxCtav14l4ggq8UaxN+K1gwDYGCFGWquJ9QFcoLHJ/ny1T3oZybeMzUOE+0FfTK4pmiS7OSjl6VpVleJvwSkc88P/+LbjbNjwLAc/cE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1616165509400398.9207124487598;
 Fri, 19 Mar 2021 07:51:49 -0700 (PDT)
In-Reply-To: <20210319143924.2173798-1-pbonzini@redhat.com>
Subject: Re: [PULL 0/8] Misc bugfixes for QEMU soft freeze
Message-ID: <161616550837.25433.12732430070779474036@c9d4d6fbb2f1>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: pbonzini@redhat.com
Date: Fri, 19 Mar 2021 07:51:49 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: qemu-devel@nongnu.org
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDMxOTE0MzkyNC4yMTcz
Nzk4LTEtcGJvbnppbmlAcmVkaGF0LmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBo
YXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3Jl
IGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjEwMzE5MTQzOTI0LjIx
NzM3OTgtMS1wYm9uemluaUByZWRoYXQuY29tClN1YmplY3Q6IFtQVUxMIDAvOF0gTWlzYyBidWdm
aXhlcyBmb3IgUUVNVSBzb2Z0IGZyZWV6ZQoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9i
aW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2L251bGwgfHwgZXhpdCAwCmdpdCBjb25m
aWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVu
YW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLmFsZ29yaXRobSBoaXN0b2dyYW0KLi9z
Y3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBiYXNlLi4KPT09IFRFU1QgU0NSSVBUIEVO
RCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQK
RnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUKIC0gW3RhZyB1cGRh
dGVdICAgICAgcGF0Y2hldy8yMDIxMDMxOTEzMjAwOC4xODMwOTUwLTEtYXJtYnJ1QHJlZGhhdC5j
b20gLT4gcGF0Y2hldy8yMDIxMDMxOTEzMjAwOC4xODMwOTUwLTEtYXJtYnJ1QHJlZGhhdC5jb20K
IC0gW3RhZyB1cGRhdGVdICAgICAgcGF0Y2hldy8yMDIxMDMxOTEzMjUzNy4yMDQ2MzM5LTEtbGF1
cmVudEB2aXZpZXIuZXUgLT4gcGF0Y2hldy8yMDIxMDMxOTEzMjUzNy4yMDQ2MzM5LTEtbGF1cmVu
dEB2aXZpZXIuZXUKIC0gW3RhZyB1cGRhdGVdICAgICAgcGF0Y2hldy8yMDIxMDMxOTE0MTQ1OS4x
MTk2NzQxLTEtZ2Vvcmcua290aGVpbWVyQGtlcm5rb256ZXB0LmNvbSAtPiBwYXRjaGV3LzIwMjEw
MzE5MTQxNDU5LjExOTY3NDEtMS1nZW9yZy5rb3RoZWltZXJAa2VybmtvbnplcHQuY29tCiAtIFt0
YWcgdXBkYXRlXSAgICAgIHBhdGNoZXcvMjAyMTAzMTkxNDIzMDguMzk4MDI1OS0xLXBoaWxtZEBy
ZWRoYXQuY29tIC0+IHBhdGNoZXcvMjAyMTAzMTkxNDIzMDguMzk4MDI1OS0xLXBoaWxtZEByZWRo
YXQuY29tCiAqIFtuZXcgdGFnXSAgICAgICAgIHBhdGNoZXcvMjAyMTAzMTkxNDM5MjQuMjE3Mzc5
OC0xLXBib256aW5pQHJlZGhhdC5jb20gLT4gcGF0Y2hldy8yMDIxMDMxOTE0MzkyNC4yMTczNzk4
LTEtcGJvbnppbmlAcmVkaGF0LmNvbQpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCjMw
MjhlMDYgdGVzdHMvcXRlc3Q6IGNsZWFudXAgdGhlIHRlc3RjYXNlIGZvciBidWcgMTg3ODY0Mgpi
YjY5NGQwIGh3L2ludGMvaTgyNTk6IFJlZmFjdG9yIHBpY19yZWFkX2lycSgpIHRvIGF2b2lkIHVu
aW5pdGlhbGl6ZWQgdmFyaWFibGUKZDI4NDhkNyBpMzg2OiBNYWtlIG1pZ3JhdGlvbiBmYWlsIHdo
ZW4gSHlwZXItViByZWVubGlnaHRlbm1lbnQgd2FzIGVuYWJsZWQgYnV0ICd1c2VyX3RzY19raHon
IGlzIHVuc2V0CmIzMjcyY2QgaTM4NjogRml4ICdoeXBlcmNhbGxfaHlwZXJjYWxsJyB0eXBvCjFh
Y2IxMjEgdGFyZ2V0L2kzODY6IHN2bTogZG8gbm90IGRpc2NhcmQgaGlnaCAzMiBiaXRzIG9mIEVY
SVRJTkZPMQo5OGQ0Mjk0IHRhcmdldC9pMzg2OiBmYWlsIGlmIHRvZ2dsaW5nIExBNTcgaW4gNjQt
Yml0IG1vZGUKNDFmZGI0YyB0YXJnZXQvaTM4NjogYWxsb3cgbW9kaWZ5aW5nIFRDRyBwaHlzLWFk
ZHItYml0cwowMzk5OTU3IHFvbTogdXNlIHFlbXVfcHJpbnRmIHRvIHByaW50IGhlbHAgZm9yIHVz
ZXItY3JlYXRhYmxlIG9iamVjdHMKCj09PSBPVVRQVVQgQkVHSU4gPT09CjEvOCBDaGVja2luZyBj
b21taXQgMDM5OTk1NzlkNzE3IChxb206IHVzZSBxZW11X3ByaW50ZiB0byBwcmludCBoZWxwIGZv
ciB1c2VyLWNyZWF0YWJsZSBvYmplY3RzKQoyLzggQ2hlY2tpbmcgY29tbWl0IDQxZmRiNGMyY2E5
MSAodGFyZ2V0L2kzODY6IGFsbG93IG1vZGlmeWluZyBUQ0cgcGh5cy1hZGRyLWJpdHMpCjMvOCBD
aGVja2luZyBjb21taXQgOThkNDI5NDYxNWUwICh0YXJnZXQvaTM4NjogZmFpbCBpZiB0b2dnbGlu
ZyBMQTU3IGluIDY0LWJpdCBtb2RlKQpFUlJPUjogc3VzcGVjdCBjb2RlIGluZGVudCBmb3IgY29u
ZGl0aW9uYWwgc3RhdGVtZW50cyAoOCwgMTMpCiMyMzogRklMRTogdGFyZ2V0L2kzODYvdGNnL21p
c2NfaGVscGVyLmM6MTcwOgorICAgICAgICBpZiAoKCh0MCBeIGVudi0+Y3JbNF0pICYgQ1I0X0xB
NTdfTUFTSykgJiYKWy4uLl0KKyAgICAgICAgICAgICByYWlzZV9leGNlcHRpb25fcmEoZW52LCBF
WENQMERfR1BGLCBHRVRQQygpKTsKCnRvdGFsOiAxIGVycm9ycywgMCB3YXJuaW5ncywgMTAgbGlu
ZXMgY2hlY2tlZAoKUGF0Y2ggMy84IGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4g
IElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0
byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCgo0LzggQ2hl
Y2tpbmcgY29tbWl0IDFhY2IxMjE4NmQ5YyAodGFyZ2V0L2kzODY6IHN2bTogZG8gbm90IGRpc2Nh
cmQgaGlnaCAzMiBiaXRzIG9mIEVYSVRJTkZPMSkKNS84IENoZWNraW5nIGNvbW1pdCBiMzI3MmNk
NTI1MDcgKGkzODY6IEZpeCAnaHlwZXJjYWxsX2h5cGVyY2FsbCcgdHlwbykKNi84IENoZWNraW5n
IGNvbW1pdCBkMjg0OGQ3Y2ViMzggKGkzODY6IE1ha2UgbWlncmF0aW9uIGZhaWwgd2hlbiBIeXBl
ci1WIHJlZW5saWdodGVubWVudCB3YXMgZW5hYmxlZCBidXQgJ3VzZXJfdHNjX2toeicgaXMgdW5z
ZXQpCjcvOCBDaGVja2luZyBjb21taXQgYmI2OTRkMDNhOWVlIChody9pbnRjL2k4MjU5OiBSZWZh
Y3RvciBwaWNfcmVhZF9pcnEoKSB0byBhdm9pZCB1bmluaXRpYWxpemVkIHZhcmlhYmxlKQo4Lzgg
Q2hlY2tpbmcgY29tbWl0IDMwMjhlMDZjN2FlZiAodGVzdHMvcXRlc3Q6IGNsZWFudXAgdGhlIHRl
c3RjYXNlIGZvciBidWcgMTg3ODY0MikKV0FSTklORzogYWRkZWQsIG1vdmVkIG9yIGRlbGV0ZWQg
ZmlsZShzKSwgZG9lcyBNQUlOVEFJTkVSUyBuZWVkIHVwZGF0aW5nPwojMTQ6IAogdGVzdHMvcXRl
c3Qve2Z1enotdGVzdC5jID0+IGxwYy1pY2g5LXRlc3QuY30gfCAxMiArKysrKysrLS0tLS0KCnRv
dGFsOiAwIGVycm9ycywgMSB3YXJuaW5ncywgNDIgbGluZXMgY2hlY2tlZAoKUGF0Y2ggOC84IGhh
cyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMK
YXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNI
RUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5k
IGV4aXRlZCB3aXRoIGNvZGU6IDEKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6
Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMjEwMzE5MTQzOTI0LjIxNzM3OTgtMS1wYm9uemluaUByZWRo
YXQuY29tL3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJh
dGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVh
c2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

