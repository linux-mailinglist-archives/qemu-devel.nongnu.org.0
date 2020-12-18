Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 552F12DEB63
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 23:03:54 +0100 (CET)
Received: from localhost ([::1]:38100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqNqr-00018B-En
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 17:03:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kqNfm-0005Ml-8q
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 16:52:26 -0500
Resent-Date: Fri, 18 Dec 2020 16:52:26 -0500
Resent-Message-Id: <E1kqNfm-0005Ml-8q@lists.gnu.org>
Received: from sender4-of-o52.zoho.com ([136.143.188.52]:21224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kqNfZ-00062p-T9
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 16:52:24 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1608328312; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=DR4XHVSxPSyX6qhmMdq5anlW4b2YGPp+SQIS0mkp9bQq3N9QtAgiTqGDlvsMIoh7/xkOwdHRzIDpW8NsZMjzoeo89/MD5WShKm2EdQ/oBig/D4ehhHrXHWzTj4qujalYBMAwwID2f3c2I6fWMTXXBTivBcbxnYikZQo8UWw/yRY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1608328312;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=LVCSIINkF36eeksALXwsliA5j8nTZbto/cTkYw4UpfE=; 
 b=jmCll+1Oh/5/e8LtZw7+pTk5XRTDJocX0Qq0SINHZstTIRxF+8eGmwog2qOkROMEY5s5woRK6ZLNnVj5xulj7Q6zz8Okc7mZuXYSCQsJhLcGjE5g8D1vkBAbeSSnx29gwvn7fFxgKboiu7Rk2S64iTUvM25be0SVA6bzGT09S8k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1608328310366656.7263998489296;
 Fri, 18 Dec 2020 13:51:50 -0800 (PST)
In-Reply-To: <20201218214142.3673709-1-scw@google.com>
Subject: Re: [PATCH 0/2] thunk, linux-user: Add support for SIOCETHTOOL ioctl
Message-ID: <160832830889.29521.18042892918061202182@600e7e483b3a>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: qemu-devel@nongnu.org
Date: Fri, 18 Dec 2020 13:51:50 -0800 (PST)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.52; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o52.zoho.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: laurent@vivier.eu, riku.voipio@iki.fi, qemu-devel@nongnu.org,
 scw@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMTIxODIxNDE0Mi4zNjcz
NzA5LTEtc2N3QGdvb2dsZS5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2ZSBz
b21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBpbmZv
cm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIwMTIxODIxNDE0Mi4zNjczNzA5
LTEtc2N3QGdvb2dsZS5jb20KU3ViamVjdDogW1BBVENIIDAvMl0gdGh1bmssIGxpbnV4LXVzZXI6
IEFkZCBzdXBwb3J0IGZvciBTSU9DRVRIVE9PTCBpb2N0bAoKPT09IFRFU1QgU0NSSVBUIEJFR0lO
ID09PQojIS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2L251bGwgfHwgZXhpdCAw
CmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxvY2Fs
IGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLmFsZ29yaXRobSBoaXN0
b2dyYW0KLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBiYXNlLi4KPT09IFRFU1Qg
U0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4
ODg3MTMzODQKRnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUKICog
W25ldyB0YWddICAgICAgICAgcGF0Y2hldy8yMDIwMTIxODIxNDE0Mi4zNjczNzA5LTEtc2N3QGdv
b2dsZS5jb20gLT4gcGF0Y2hldy8yMDIwMTIxODIxNDE0Mi4zNjczNzA5LTEtc2N3QGdvb2dsZS5j
b20KU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0Jwo3NDdhNDYwIGxpbnV4LXVzZXI6IEFk
ZCBzdXBwb3J0IGZvciBTSU9DRVRIVE9PTCBpb2N0bApjM2E3MTdmIHRodW5rOiBzdXBwb3J0cyBm
bGV4aWJsZSBhcnJheXMKCj09PSBPVVRQVVQgQkVHSU4gPT09CjEvMiBDaGVja2luZyBjb21taXQg
YzNhNzE3ZjI3YmU4ICh0aHVuazogc3VwcG9ydHMgZmxleGlibGUgYXJyYXlzKQpFUlJPUjogTWFj
cm9zIHdpdGggY29tcGxleCB2YWx1ZXMgc2hvdWxkIGJlIGVuY2xvc2VkIGluIHBhcmVudGhlc2lz
CiM1MjogRklMRTogaW5jbHVkZS9leGVjL3VzZXIvdGh1bmsuaDo1NDoKKyNkZWZpbmUgTUtfRkxF
WElCTEVfQVJSQVkodHlwZSwgbGVuX2ZpZWxkX2lkeCkgXAorICAgIFRZUEVfRkxFWElCTEVfQVJS
QVksIChsZW5fZmllbGRfaWR4KSwgdHlwZQoKdG90YWw6IDEgZXJyb3JzLCAwIHdhcm5pbmdzLCAy
NjYgbGluZXMgY2hlY2tlZAoKUGF0Y2ggMS8yIGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJl
dmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQg
dGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCgoy
LzIgQ2hlY2tpbmcgY29tbWl0IDc0N2E0NjAyZjA5MyAobGludXgtdXNlcjogQWRkIHN1cHBvcnQg
Zm9yIFNJT0NFVEhUT09MIGlvY3RsKQpXQVJOSU5HOiBhZGRlZCwgbW92ZWQgb3IgZGVsZXRlZCBm
aWxlKHMpLCBkb2VzIE1BSU5UQUlORVJTIG5lZWQgdXBkYXRpbmc/CiMyNTogCm5ldyBmaWxlIG1v
ZGUgMTAwNjQ0CgpXQVJOSU5HOiBCbG9jayBjb21tZW50cyB1c2UgYSBsZWFkaW5nIC8qIG9uIGEg
c2VwYXJhdGUgbGluZQojNzY1OiBGSUxFOiBsaW51eC11c2VyL2V0aHRvb2wuYzo3MzY6CisgICAg
aW50IHR5cGVfc2l6ZSA9IHRodW5rX3R5cGVfc2l6ZSh0eXBlX3B0ciwgLyppc19ob3N0PSovIDAp
OwoKV0FSTklORzogQmxvY2sgY29tbWVudHMgdXNlIGEgbGVhZGluZyAvKiBvbiBhIHNlcGFyYXRl
IGxpbmUKIzc3MTogRklMRTogbGludXgtdXNlci9ldGh0b29sLmM6NzQyOgorICAgIHR5cGVfc2l6
ZSA9IHRodW5rX3R5cGVfc2l6ZV93aXRoX3NyYyhzcmMsIHR5cGVfcHRyLCAvKmlzX2hvc3Q9Ki8g
MCk7CgpFUlJPUjogTWFjcm9zIHdpdGggY29tcGxleCB2YWx1ZXMgc2hvdWxkIGJlIGVuY2xvc2Vk
IGluIHBhcmVudGhlc2lzCiMxMTM5OiBGSUxFOiBsaW51eC11c2VyL3N5c2NhbGxfZGVmcy5oOjI4
Njk6CisjZGVmaW5lIFNUUlVDVChuYW1lLCAuLi4pIFNUUlVDVF8gIyMgbmFtZSwKCkVSUk9SOiBN
YWNyb3Mgd2l0aCBjb21wbGV4IHZhbHVlcyBzaG91bGQgYmUgZW5jbG9zZWQgaW4gcGFyZW50aGVz
aXMKIzExNDA6IEZJTEU6IGxpbnV4LXVzZXIvc3lzY2FsbF9kZWZzLmg6Mjg3MDoKKyNkZWZpbmUg
U1RSVUNUX1NQRUNJQUwobmFtZSkgU1RSVUNUXyAjIyBuYW1lLAoKdG90YWw6IDIgZXJyb3JzLCAz
IHdhcm5pbmdzLCAxNzg3IGxpbmVzIGNoZWNrZWQKClBhdGNoIDIvMiBoYXMgc3R5bGUgcHJvYmxl
bXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3Np
dGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1B
SU5UQUlORVJTLgoKPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGgg
Y29kZTogMQoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3Jn
L2xvZ3MvMjAyMDEyMTgyMTQxNDIuMzY3MzcwOS0xLXNjd0Bnb29nbGUuY29tL3Rlc3RpbmcuY2hl
Y2twYXRjaC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkg
YnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRi
YWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

