Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E65B339D7A
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 10:59:42 +0100 (CET)
Received: from localhost ([::1]:57820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL13d-0000RB-C5
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 04:59:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lL122-0007ko-SV
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 04:58:03 -0500
Resent-Date: Sat, 13 Mar 2021 04:58:02 -0500
Resent-Message-Id: <E1lL122-0007ko-SV@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lL11x-0004Tz-Vb
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 04:58:02 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1615629468; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=VNzHcqmFBBxBZq42hxFa4GOAhnSQPGvQ8PS9j78M0x4xVYcWEyndIv5oI1uNsLMHHhhM1E/eWA9VMr2JKDBsT8H0qSSkN93RgFs5xLntbN+ttzKt37vqVbFKwES5T6ThBKWtiAbWzfIrVIN7xpOXzyU+VvNSijDS+yUp3lSBsXU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1615629468;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=qGo8ROKcOYI2Q9gxQ+gxZOgo3Cs9D7rp0xhEsRfOseo=; 
 b=cCD32TjrNYpj45TUjfGWIUrXUoCHCh4QNlwlF816ffG3QETqzTsrTCg3r7sCNrhwbr9wOXiMT3NuP4qCjS73r9Ju2sZMxrSAmQtF0gnUqnKJkSYNi5zncVx9eI5RyGR655CH2uepcEgGe75ehXGNncqMfMy7cII14ESzuHLRLaM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1615629465445549.6840769124166;
 Sat, 13 Mar 2021 01:57:45 -0800 (PST)
In-Reply-To: <20210313094747.2966948-1-laurent@vivier.eu>
Subject: Re: [PULL 0/5] Linux user for 6.0 patches
Message-ID: <161562946420.22588.3105267720570774622@c9d4d6fbb2f1>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: laurent@vivier.eu
Date: Sat, 13 Mar 2021 01:57:45 -0800 (PST)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDMxMzA5NDc0Ny4yOTY2
OTQ4LTEtbGF1cmVudEB2aXZpZXIuZXUvCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2
ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBp
bmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIxMDMxMzA5NDc0Ny4yOTY2
OTQ4LTEtbGF1cmVudEB2aXZpZXIuZXUKU3ViamVjdDogW1BVTEwgMC81XSBMaW51eCB1c2VyIGZv
ciA2LjAgcGF0Y2hlcwoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaApnaXQg
cmV2LXBhcnNlIGJhc2UgPiAvZGV2L251bGwgfHwgZXhpdCAwCmdpdCBjb25maWcgLS1sb2NhbCBk
aWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVlCmdp
dCBjb25maWcgLS1sb2NhbCBkaWZmLmFsZ29yaXRobSBoaXN0b2dyYW0KLi9zY3JpcHRzL2NoZWNr
cGF0Y2gucGwgLS1tYWlsYmFjayBiYXNlLi4KPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClVwZGF0
aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQKRnJvbSBodHRwczov
L2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUKIC0gW3RhZyB1cGRhdGVdICAgICAgcGF0
Y2hldy8yMDIxMDMxMTE3MjQ1OS45OTAyODEtMS1wYm9uemluaUByZWRoYXQuY29tIC0+IHBhdGNo
ZXcvMjAyMTAzMTExNzI0NTkuOTkwMjgxLTEtcGJvbnppbmlAcmVkaGF0LmNvbQogLSBbdGFnIHVw
ZGF0ZV0gICAgICBwYXRjaGV3LzIwMjEwMzEyMTMxOTIxLjQyMTAyMy0xLWt3b2xmQHJlZGhhdC5j
b20gLT4gcGF0Y2hldy8yMDIxMDMxMjEzMTkyMS40MjEwMjMtMS1rd29sZkByZWRoYXQuY29tCiAq
IFtuZXcgdGFnXSAgICAgICAgIHBhdGNoZXcvMjAyMTAzMTMwOTQ3NDcuMjk2Njk0OC0xLWxhdXJl
bnRAdml2aWVyLmV1IC0+IHBhdGNoZXcvMjAyMTAzMTMwOTQ3NDcuMjk2Njk0OC0xLWxhdXJlbnRA
dml2aWVyLmV1ClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKM2UzMDM0ZiBsaW51eC11
c2VyL2VsZmxvYWQ6IGZpeCBhZGRyZXNzIGNhbGN1bGF0aW9uIGluIGZhbGxiYWNrIHNjZW5hcmlv
CjRhNTdkZmMgbGludXgtdXNlci9lbGZsb2FkOiBkbyBub3QgYXNzdW1lIE1BUF9GSVhFRF9OT1JF
UExBQ0Uga2VybmVsIHN1cHBvcnQKZjFmNTlhMiBsaW51eC11c2VyL2VsZmxvYWQ6IG11bm1hcCBw
cm9wZXIgYWRkcmVzcyBpbiBwZ2RfZmluZF9ob2xlX2ZhbGxiYWNrCmUwNDJlNzcgbGludXgtdXNl
cjogbWFuYWdlIGJpbmZtdC1taXNjIHByZXNlcnZlLWFyZ1swXSBmbGFnCjhhNjIyYzUgbGludXgt
dXNlcjogRml4IGV4ZWN1dGFibGUgcGFnZSBvZiAvcHJvYy9zZWxmL21hcHMKCj09PSBPVVRQVVQg
QkVHSU4gPT09CjEvNSBDaGVja2luZyBjb21taXQgOGE2MjJjNTdiYTBiIChsaW51eC11c2VyOiBG
aXggZXhlY3V0YWJsZSBwYWdlIG9mIC9wcm9jL3NlbGYvbWFwcykKMi81IENoZWNraW5nIGNvbW1p
dCBlMDQyZTc3Zjc5ZjQgKGxpbnV4LXVzZXI6IG1hbmFnZSBiaW5mbXQtbWlzYyBwcmVzZXJ2ZS1h
cmdbMF0gZmxhZykKRVJST1I6IGxpbmUgb3ZlciA5MCBjaGFyYWN0ZXJzCiMxOTY6IEZJTEU6IHNj
cmlwdHMvcWVtdS1iaW5mbXQtY29uZi5zaDozNDE6CitvcHRpb25zPSQoZ2V0b3B0IC1vIGRzOlE6
UzplOmhjOnA6ZzogLWwgZGViaWFuLHN5c3RlbWQ6LHFlbXUtcGF0aDoscWVtdS1zdWZmaXg6LGV4
cG9ydGRpcjosaGVscCxjcmVkZW50aWFsOixwZXJzaXN0ZW50OixwcmVzZXJ2ZS1hcmd2MDogLS0g
IiRAIikKCnRvdGFsOiAxIGVycm9ycywgMCB3YXJuaW5ncywgMTI3IGxpbmVzIGNoZWNrZWQKClBh
dGNoIDIvNSBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhl
c2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWlu
ZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgoKMy81IENoZWNraW5nIGNvbW1pdCBm
MWY1OWEyZGEwYzYgKGxpbnV4LXVzZXIvZWxmbG9hZDogbXVubWFwIHByb3BlciBhZGRyZXNzIGlu
IHBnZF9maW5kX2hvbGVfZmFsbGJhY2spCjQvNSBDaGVja2luZyBjb21taXQgNGE1N2RmYzk4NDll
IChsaW51eC11c2VyL2VsZmxvYWQ6IGRvIG5vdCBhc3N1bWUgTUFQX0ZJWEVEX05PUkVQTEFDRSBr
ZXJuZWwgc3VwcG9ydCkKNS81IENoZWNraW5nIGNvbW1pdCAzZTMwMzRmZjIxMDEgKGxpbnV4LXVz
ZXIvZWxmbG9hZDogZml4IGFkZHJlc3MgY2FsY3VsYXRpb24gaW4gZmFsbGJhY2sgc2NlbmFyaW8p
Cj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgpU
aGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMjEw
MzEzMDk0NzQ3LjI5NjY5NDgtMS1sYXVyZW50QHZpdmllci5ldS90ZXN0aW5nLmNoZWNrcGF0Y2gv
P3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNo
ZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBw
YXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

