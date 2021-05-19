Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB9E388FFC
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 16:11:33 +0200 (CEST)
Received: from localhost ([::1]:36060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljMv6-0001Gc-UB
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 10:11:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1ljMtu-000884-Ar; Wed, 19 May 2021 10:10:18 -0400
Resent-Date: Wed, 19 May 2021 10:10:18 -0400
Resent-Message-Id: <E1ljMtu-000884-Ar@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1ljMtp-0005AE-U7; Wed, 19 May 2021 10:10:17 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1621433403; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=jh8RjBbpth/XWYLyFdfeE8yyDMqJ9U+VbFiVkXas2oNICgG93cJU8iGpv5ErsehN8avY0mmybW0OzWmBGmY9dgQrrLtVPSJENy/ruL2mlZuANrVFyxRVBlRP19jWijfft6kCdaB+M4qzSEFX3yGZQG628kwaVsGZ3JPOIVYFGKg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1621433403;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=yhhNoAkYL3N/MoKvskzMemB/0aSJEBGE0VGCNmo5nz0=; 
 b=LrfO90EYc9iSCJVBj7dCHqbnF8Fxt+MWCKNmsBaZWuPsbfbirJXZH6uLCGaG42mPgo2IAWHp7FDU4cba5tbx8ryqeY4uHqZM5F/6obVOMHHM0EnbwVtnc+ComPCWRqtEYQwK9hG9s5l8fcbrYU+xTNr8SoDDt+Lad6BZ8L89+gw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1621433387259382.28655537764405;
 Wed, 19 May 2021 07:09:47 -0700 (PDT)
In-Reply-To: <20210518154014.2999326-1-pbonzini@redhat.com>
Subject: Re: [PATCH 0/3] vl: add -object support back into -readconfig
Message-ID: <162143338554.17859.10417398921858982905@0addf061776e>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: pbonzini@redhat.com
Date: Wed, 19 May 2021 07:09:47 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com, qemu-stable@nongnu.org, qemu-devel@nongnu.org,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDUxODE1NDAxNC4yOTk5
MzI2LTEtcGJvbnppbmlAcmVkaGF0LmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBo
YXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3Jl
IGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjEwNTE4MTU0MDE0LjI5
OTkzMjYtMS1wYm9uemluaUByZWRoYXQuY29tClN1YmplY3Q6IFtQQVRDSCAwLzNdIHZsOiBhZGQg
LW9iamVjdCBzdXBwb3J0IGJhY2sgaW50byAtcmVhZGNvbmZpZwoKPT09IFRFU1QgU0NSSVBUIEJF
R0lOID09PQojIS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2L251bGwgfHwgZXhp
dCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxv
Y2FsIGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLmFsZ29yaXRobSBo
aXN0b2dyYW0KLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBiYXNlLi4KPT09IFRF
U1QgU0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0
YmQ4ODg3MTMzODQKRnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUK
ICogW25ldyB0YWddICAgICAgICAgcGF0Y2hldy8yMDIxMDUxODE1NDAxNC4yOTk5MzI2LTEtcGJv
bnppbmlAcmVkaGF0LmNvbSAtPiBwYXRjaGV3LzIwMjEwNTE4MTU0MDE0LjI5OTkzMjYtMS1wYm9u
emluaUByZWRoYXQuY29tCiAtIFt0YWcgdXBkYXRlXSAgICAgIHBhdGNoZXcvMjAyMTA1MTkxMDQ0
MzMuMTY4NzAtMS1qY212YmtiY0BnbWFpbC5jb20gLT4gcGF0Y2hldy8yMDIxMDUxOTEwNDQzMy4x
Njg3MC0xLWpjbXZia2JjQGdtYWlsLmNvbQogLSBbdGFnIHVwZGF0ZV0gICAgICBwYXRjaGV3LzIw
MjEwNTE5MTEzNTI4LjEyNDc0LTEtZGF2b3JvbmV0c2tpeUBnbWFpbC5jb20gLT4gcGF0Y2hldy8y
MDIxMDUxOTExMzUyOC4xMjQ3NC0xLWRhdm9yb25ldHNraXlAZ21haWwuY29tClN3aXRjaGVkIHRv
IGEgbmV3IGJyYW5jaCAndGVzdCcKMDEyNGNlNyB2bDogcGx1ZyAtb2JqZWN0IGJhY2sgaW50byAt
cmVhZGNvbmZpZwplMGNiODU3IHZsOiBwbHVtYiBrZXl2YWwtYmFzZWQgb3B0aW9ucyBpbnRvIC1y
ZWFkY29uZmlnCjJiMDE5NTYgcWVtdS1jb25maWc6IHBhcnNlIGNvbmZpZ3VyYXRpb24gZmlsZXMg
dG8gYSBRRGljdAoKPT09IE9VVFBVVCBCRUdJTiA9PT0KMS8zIENoZWNraW5nIGNvbW1pdCAyYjAx
OTU2MzFmMjAgKHFlbXUtY29uZmlnOiBwYXJzZSBjb25maWd1cmF0aW9uIGZpbGVzIHRvIGEgUURp
Y3QpCldBUk5JTkc6IGxpbmUgb3ZlciA4MCBjaGFyYWN0ZXJzCiMzNTogRklMRTogaW5jbHVkZS9x
ZW11L2NvbmZpZy1maWxlLmg6NDoKK3R5cGVkZWYgdm9pZCBRRU1VQ29uZmlnQ0IoY29uc3QgY2hh
ciAqZ3JvdXAsIFFEaWN0ICpxZGljdCwgdm9pZCAqb3BhcXVlLCBFcnJvciAqKmVycnApOwoKV0FS
TklORzogbGluZSBvdmVyIDgwIGNoYXJhY3RlcnMKIzQ2OiBGSUxFOiBpbmNsdWRlL3FlbXUvY29u
ZmlnLWZpbGUuaDoyMDoKK3ZvaWQgcWVtdV9jb25maWdfZG9fcGFyc2UoY29uc3QgY2hhciAqZ3Jv
dXAsIFFEaWN0ICpxZGljdCwgdm9pZCAqb3BhcXVlLCBFcnJvciAqKmVycnApOwoKV0FSTklORzog
bGluZSBvdmVyIDgwIGNoYXJhY3RlcnMKIzcwOiBGSUxFOiBzb2Z0bW11L3ZsLmM6MzM4OToKKyAg
ICAgICAgICAgICAgICBxZW11X3JlYWRfY29uZmlnX2ZpbGUob3B0YXJnLCBxZW11X2NvbmZpZ19k
b19wYXJzZSwgJmVycm9yX2ZhdGFsKTsKCldBUk5JTkc6IGxpbmUgb3ZlciA4MCBjaGFyYWN0ZXJz
CiMxNzg6IEZJTEU6IHV0aWwvcWVtdS1jb25maWcuYzo0Mjg6Cit2b2lkIHFlbXVfY29uZmlnX2Rv
X3BhcnNlKGNvbnN0IGNoYXIgKmdyb3VwLCBRRGljdCAqcWRpY3QsIHZvaWQgKm9wYXF1ZSwgRXJy
b3IgKiplcnJwKQoKV0FSTklORzogbGluZSBvdmVyIDgwIGNoYXJhY3RlcnMKIzIwMDogRklMRTog
dXRpbC9xZW11LWNvbmZpZy5jOjQ1MDoKK2ludCBxZW11X2NvbmZpZ19wYXJzZShGSUxFICpmcCwg
UWVtdU9wdHNMaXN0ICoqbGlzdHMsIGNvbnN0IGNoYXIgKmZuYW1lLCBFcnJvciAqKmVycnApCgp0
b3RhbDogMCBlcnJvcnMsIDUgd2FybmluZ3MsIDE3MSBsaW5lcyBjaGVja2VkCgpQYXRjaCAxLzMg
aGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9y
cwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUK
Q0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KMi8zIENoZWNraW5nIGNvbW1pdCBlMGNiODU3MWQ3
YTIgKHZsOiBwbHVtYiBrZXl2YWwtYmFzZWQgb3B0aW9ucyBpbnRvIC1yZWFkY29uZmlnKQpFUlJP
UjogbGluZSBvdmVyIDkwIGNoYXJhY3RlcnMKIzczOiBGSUxFOiBzb2Z0bW11L3ZsLmM6MjEyNzoK
K3N0YXRpYyB2b2lkIHFlbXVfcmVjb3JkX2NvbmZpZ19ncm91cChjb25zdCBjaGFyICpncm91cCwg
UURpY3QgKmRpY3QsIGJvb2wgZnJvbV9qc29uLCBFcnJvciAqKmVycnApCgpXQVJOSU5HOiBsaW5l
IG92ZXIgODAgY2hhcmFjdGVycwojOTc6IEZJTEU6IHNvZnRtbXUvdmwuYzoyMTUxOgorICAgICAg
ICBlcnJvcl9zZXRnKGVycnAsICJMaXN0cyBjYW5ub3QgYmUgYXQgdG9wIGxldmVsIG9mIGEgY29u
ZmlndXJhdGlvbiBzZWN0aW9uIik7CgpXQVJOSU5HOiBsaW5lIG92ZXIgODAgY2hhcmFjdGVycwoj
MTgyOiBGSUxFOiBzb2Z0bW11L3ZsLmM6MzQyMzoKKyAgICAgICAgICAgICAgICBxZW11X3JlYWRf
Y29uZmlnX2ZpbGUob3B0YXJnLCBxZW11X3BhcnNlX2NvbmZpZ19ncm91cCwgJmVycm9yX2ZhdGFs
KTsKCnRvdGFsOiAxIGVycm9ycywgMiB3YXJuaW5ncywgMTQzIGxpbmVzIGNoZWNrZWQKClBhdGNo
IDIvMyBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2Ug
ZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIs
IHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgoKMy8zIENoZWNraW5nIGNvbW1pdCAwMTI0
Y2U3MmE2MzQgKHZsOiBwbHVnIC1vYmplY3QgYmFjayBpbnRvIC1yZWFkY29uZmlnKQo9PT0gT1VU
UFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwg
bG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIxMDUxODE1NDAx
NC4yOTk5MzI2LTEtcGJvbnppbmlAcmVkaGF0LmNvbS90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9
bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0
dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3
LWRldmVsQHJlZGhhdC5jb20=

