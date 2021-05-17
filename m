Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 191F0382C1F
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 14:30:06 +0200 (CEST)
Received: from localhost ([::1]:59500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1licNp-0002Xs-4Y
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 08:30:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1licLp-0000hA-Dg
 for qemu-devel@nongnu.org; Mon, 17 May 2021 08:28:01 -0400
Resent-Date: Mon, 17 May 2021 08:28:01 -0400
Resent-Message-Id: <E1licLp-0000hA-Dg@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1licLn-0004Zz-6V
 for qemu-devel@nongnu.org; Mon, 17 May 2021 08:28:01 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1621254470; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ATf6S5GGG3wGPTAzIptnL/UO9I79WUtueLBb0a23b9tSN0zz75W0rO/5cHIk9oOAHTyQtfNZpu7puk0DcJ8Nfv9nRU7SqaNfur/uIE8SYjC76pHk1fGq6lYKvXy0huIIwAKDsHEy4bIyWjRkF4b0GagnOeieFQKTcH3Yjr8Q/1M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1621254470;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=CW6kh3H+1WAFyXDwGsY0b5pGaHi5wJm3wUxqsaY+7zM=; 
 b=VKZAv8fhvcFGPykO2sL43Y4sQzpqeWH1JqHzv/vANBppbMpA0HVqIT8aFu1FQ/D+fZdkiHWcvUyvouwhRFOLuvxmI86snGqXR+flU6adz0XG3Q3m1PzsdyuCKAWrvaJUJ45/SZW2/bvpIye2kAMTR5ObOp2HI/rsd4Pt91zKzoI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1621254467719689.6994322997962;
 Mon, 17 May 2021 05:27:47 -0700 (PDT)
In-Reply-To: <20210517121908.2624991-1-pbonzini@redhat.com>
Subject: Re: [PATCH] remove qemu-options* from root directory
Message-ID: <162125446674.9151.12444109583163660455@d887ba82c771>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: pbonzini@redhat.com
Date: Mon, 17 May 2021 05:27:47 -0700 (PDT)
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDUxNzEyMTkwOC4yNjI0
OTkxLTEtcGJvbnppbmlAcmVkaGF0LmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBo
YXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3Jl
IGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjEwNTE3MTIxOTA4LjI2
MjQ5OTEtMS1wYm9uemluaUByZWRoYXQuY29tClN1YmplY3Q6IFtQQVRDSF0gcmVtb3ZlIHFlbXUt
b3B0aW9ucyogZnJvbSByb290IGRpcmVjdG9yeQoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQoj
IS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2L251bGwgfHwgZXhpdCAwCmdpdCBj
b25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYu
cmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLmFsZ29yaXRobSBoaXN0b2dyYW0K
Li9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBiYXNlLi4KPT09IFRFU1QgU0NSSVBU
IEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMz
ODQKRnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUKIC0gW3RhZyB1
cGRhdGVdICAgICAgcGF0Y2hldy8yMDIxMDUxNzA3MDg1MS44NTc4NDEtMS1mNGJ1Z0BhbXNhdC5v
cmcgLT4gcGF0Y2hldy8yMDIxMDUxNzA3MDg1MS44NTc4NDEtMS1mNGJ1Z0BhbXNhdC5vcmcKICog
W25ldyB0YWddICAgICAgICAgcGF0Y2hldy8yMDIxMDUxNzEyMTkwOC4yNjI0OTkxLTEtcGJvbnpp
bmlAcmVkaGF0LmNvbSAtPiBwYXRjaGV3LzIwMjEwNTE3MTIxOTA4LjI2MjQ5OTEtMS1wYm9uemlu
aUByZWRoYXQuY29tClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKZmE4NGRmNSByZW1v
dmUgcWVtdS1vcHRpb25zKiBmcm9tIHJvb3QgZGlyZWN0b3J5Cgo9PT0gT1VUUFVUIEJFR0lOID09
PQpXQVJOSU5HOiBhZGRlZCwgbW92ZWQgb3IgZGVsZXRlZCBmaWxlKHMpLCBkb2VzIE1BSU5UQUlO
RVJTIG5lZWQgdXBkYXRpbmc/CiMyNTogCnJlbmFtZSBmcm9tIHFlbXUtb3B0aW9ucy5oCgpFUlJP
UjogTWFjcm9zIHdpdGggY29tcGxleCB2YWx1ZXMgc2hvdWxkIGJlIGVuY2xvc2VkIGluIHBhcmVu
dGhlc2lzCiMzNzogRklMRTogaW5jbHVkZS9xZW11L3FlbXUtb3B0aW9ucy5oOjMzOgorI2RlZmlu
ZSBERUYob3B0aW9uLCBvcHRfYXJnLCBvcHRfZW51bSwgb3B0X2hlbHAsIGFyY2hfbWFzaykgICAg
IFwKKyAgICBvcHRfZW51bSwKCnRvdGFsOiAxIGVycm9ycywgMSB3YXJuaW5ncywgNzkgbGluZXMg
Y2hlY2tlZAoKQ29tbWl0IGZhODRkZjU3MDNlMCAocmVtb3ZlIHFlbXUtb3B0aW9ucyogZnJvbSBy
b290IGRpcmVjdG9yeSkgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55
IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBt
YWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KPT09IE9VVFBVVCBFTkQg
PT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKClRoZSBmdWxsIGxvZyBpcyBh
dmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAyMTA1MTcxMjE5MDguMjYyNDk5
MS0xLXBib256aW5pQHJlZGhhdC5jb20vdGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2Uu
Ci0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3Bh
dGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEBy
ZWRoYXQuY29t

