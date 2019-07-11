Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0622365EE8
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jul 2019 19:44:07 +0200 (CEST)
Received: from localhost ([::1]:44262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hld6y-0007gd-0f
	for lists+qemu-devel@lfdr.de; Thu, 11 Jul 2019 13:44:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38864)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <no-reply@patchew.org>) id 1hld57-00007f-4j
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 13:42:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1hld51-0005ku-IW
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 13:42:07 -0400
Resent-Date: Thu, 11 Jul 2019 13:42:04 -0400
Resent-Message-Id: <E1hld51-0005ku-IW@eggs.gnu.org>
Received: from sender4-of-o59.zoho.com ([136.143.188.59]:21943)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1hld51-0005e6-3c
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 13:42:03 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1562866879; cv=none; d=zoho.com; s=zohoarc; 
 b=VFG6Pq/zaU/OO49fzrfYliDckE2JLY5DIv3So/cdcqBHd7icI131UhraNcWvbHGmVPGeBUTFDNstN8pOae9NJOjA/x2O+DjI25Vw110YMTMkPkfonoz4NIvYblaGVVwxq89fyVpD56Rgbbf3YVmB9kQo4hIBoNTW0YzhY2NcUCQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
 s=zohoarc; t=1562866879;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
 bh=Jcr7jjp63ZpdSXnllpDchI4NZLlG/wwwaMvsDONCols=; 
 b=kAqtcjRV0LKJ5RcxJatnTrw3OB91DhNRM20KYDqWK1W81PUFfHXjUMJsaeucbGpMCRHnIVp6hDPeFb9hMi83CrrwDZqJ6pWu3gEHKW5i8+CbGez5Kat4m5wVh2X8ZLUJhnYbnJiw/QJsookSQR3QZ6tXjpLgaqdDGq9K596OMiQ=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1562866878972127.62788161850324;
 Thu, 11 Jul 2019 10:41:18 -0700 (PDT)
Message-ID: <156286687760.12463.11131522037817931956@c4a48874b076>
In-Reply-To: <20190711173131.6347-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: laurent@vivier.eu
Date: Thu, 11 Jul 2019 10:41:18 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 136.143.188.59
Subject: Re: [Qemu-devel] [PATCH v4] linux-user: fix to handle variably
 sized SIOCGSTAMP with new kernels
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
Cc: berrange@redhat.com, arnd@arndb.de, gerhard.stenzel@de.ibm.com,
 riku.voipio@iki.fi, qemu-devel@nongnu.org, christian.ehrhardt@canonical.com,
 laurent@vivier.eu, borntraeger@de.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MDcxMTE3MzEzMS42MzQ3
LTEtbGF1cmVudEB2aXZpZXIuZXUvCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2ZSBz
b21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBpbmZv
cm1hdGlvbjoKClR5cGU6IHNlcmllcwpTdWJqZWN0OiBbUWVtdS1kZXZlbF0gW1BBVENIIHY0XSBs
aW51eC11c2VyOiBmaXggdG8gaGFuZGxlIHZhcmlhYmx5IHNpemVkIFNJT0NHU1RBTVAgd2l0aCBu
ZXcga2VybmVscwpNZXNzYWdlLWlkOiAyMDE5MDcxMTE3MzEzMS42MzQ3LTEtbGF1cmVudEB2aXZp
ZXIuZXUKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJz
ZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5h
bWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmln
IC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBs
IC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpTd2l0Y2hlZCB0byBh
IG5ldyBicmFuY2ggJ3Rlc3QnCmFkYjM0MDUgbGludXgtdXNlcjogZml4IHRvIGhhbmRsZSB2YXJp
YWJseSBzaXplZCBTSU9DR1NUQU1QIHdpdGggbmV3IGtlcm5lbHMKCj09PSBPVVRQVVQgQkVHSU4g
PT09CkVSUk9SOiBsaW5lIG92ZXIgOTAgY2hhcmFjdGVycwojNzk6IEZJTEU6IGxpbnV4LXVzZXIv
c3lzY2FsbF9kZWZzLmg6NzU2OgorI2RlZmluZSBUQVJHRVRfU0lPQ0dTVEFNUF9ORVcgICBUQVJH
RVRfSU9SKDB4ODksIDB4MDYsIGFiaV9sbG9uZ1syXSkgLyogR2V0IHN0YW1wICh0aW1ldmFsNjQp
ICovCgpFUlJPUjogbGluZSBvdmVyIDkwIGNoYXJhY3RlcnMKIzgwOiBGSUxFOiBsaW51eC11c2Vy
L3N5c2NhbGxfZGVmcy5oOjc1NzoKKyNkZWZpbmUgVEFSR0VUX1NJT0NHU1RBTVBOU19ORVcgVEFS
R0VUX0lPUigweDg5LCAweDA3LCBhYmlfbGxvbmdbMl0pIC8qIEdldCBzdGFtcCAodGltZXNwZWM2
NCkgKi8KCnRvdGFsOiAyIGVycm9ycywgMCB3YXJuaW5ncywgNTAgbGluZXMgY2hlY2tlZAoKQ29t
bWl0IGFkYjM0MDVhMDZhNCAobGludXgtdXNlcjogZml4IHRvIGhhbmRsZSB2YXJpYWJseSBzaXpl
ZCBTSU9DR1NUQU1QIHdpdGggbmV3IGtlcm5lbHMpIGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNl
IHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBv
cnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMu
Cj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgpU
aGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMTkw
NzExMTczMTMxLjYzNDctMS1sYXVyZW50QHZpdmllci5ldS90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5
cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcg
W2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRj
aGV3LWRldmVsQHJlZGhhdC5jb20=


