Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0FB1624EE
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Feb 2020 11:49:01 +0100 (CET)
Received: from localhost ([::1]:60824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j40R2-00023V-Hb
	for lists+qemu-devel@lfdr.de; Tue, 18 Feb 2020 05:49:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53597)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1j40Lt-0001gR-0e
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 05:43:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1j40Lr-0002Gq-HF
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 05:43:40 -0500
Resent-Date: Tue, 18 Feb 2020 05:43:40 -0500
Resent-Message-Id: <E1j40Lr-0002Gq-HF@eggs.gnu.org>
Received: from sender4-of-o51.zoho.com ([136.143.188.51]:21199)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1j40Lr-0002Dy-8M; Tue, 18 Feb 2020 05:43:39 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1582022604; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=EXdzYdJSZxLrmfsaWViwElx86J0qFAZo6udvicvbspDOGrlT6HvqPLd77485Pcath7ku8/N57JsLNRrNYquq8yiHnyia64ofbpW2cUjK/Fsttnbf6nME6hYFQ82maq41o4tEWBBLNUUSRpbYzldI6kCHOAHwXlumWV2elSMdVRo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1582022604;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=MLjfBZYJWXxQdX6gH/rpp5oOYxAk8sDKXDwllWbkI/Q=; 
 b=H1vkwTaxHbfl5k78ABxcLAlBrL0+knSHRXTZuxGtHt6TlGkmhm095eolLSsGmXDKxaDxw3sIFagS+388QlOPm7IJwYc+wXMQs4uYI7CRHtA3EoMP+JYzBIwcnR8AHgs3O6USU7WkAk39F1jvxTN8mmwFnsTQwzZ+c3k54+WIOBE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1582022601904538.4223851292269;
 Tue, 18 Feb 2020 02:43:21 -0800 (PST)
In-Reply-To: <20200218100740.2228521-1-f.gruenbichler@proxmox.com>
Subject: Re: [RFC qemu 0/6] mirror: implement incremental and bitmap modes
Message-ID: <158202260049.4691.1110775206977768468@a1bbccc8075a>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: f.gruenbichler@proxmox.com
Date: Tue, 18 Feb 2020 02:43:21 -0800 (PST)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 136.143.188.51
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, armbru@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDIxODEwMDc0MC4yMjI4
NTIxLTEtZi5ncnVlbmJpY2hsZXJAcHJveG1veC5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2Vl
bXMgdG8gaGF2ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBm
b3IKbW9yZSBpbmZvcm1hdGlvbjoKClN1YmplY3Q6IFtSRkMgcWVtdSAwLzZdIG1pcnJvcjogaW1w
bGVtZW50IGluY3JlbWVudGFsIGFuZCBiaXRtYXAgbW9kZXMKTWVzc2FnZS1pZDogMjAyMDAyMTgx
MDA3NDAuMjIyODUyMS0xLWYuZ3J1ZW5iaWNobGVyQHByb3htb3guY29tClR5cGU6IHNlcmllcwoK
PT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2Ug
PiAvZGV2L251bGwgfHwgZXhpdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0
IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2Nh
bCBkaWZmLmFsZ29yaXRobSBoaXN0b2dyYW0KLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWls
YmFjayBiYXNlLi4KPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIx
ZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQKRnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0
Y2hldy1wcm9qZWN0L3FlbXUKICogW25ldyB0YWddICAgICAgICAgcGF0Y2hldy8yMDIwMDIxODA5
NDQwMi4yNjYyNS0xLXBoaWxtZEByZWRoYXQuY29tIC0+IHBhdGNoZXcvMjAyMDAyMTgwOTQ0MDIu
MjY2MjUtMS1waGlsbWRAcmVkaGF0LmNvbQogKiBbbmV3IHRhZ10gICAgICAgICBwYXRjaGV3LzIw
MjAwMjE4MTAwNzQwLjIyMjg1MjEtMS1mLmdydWVuYmljaGxlckBwcm94bW94LmNvbSAtPiBwYXRj
aGV3LzIwMjAwMjE4MTAwNzQwLjIyMjg1MjEtMS1mLmdydWVuYmljaGxlckBwcm94bW94LmNvbQpT
d2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCjUwZGE3ZGQgbWlycm9yOiBtb3ZlIHNvbWUg
Y2hlY2tzIHRvIFFNUAoyMjM2OTg1IGlvdGVzdHM6IGFkZCB0ZXN0IGZvciBiaXRtYXAgbWlycm9y
CmI2NWFhMzEgbWlycm9yOiBzd2l0Y2ggdG8gYmRydl9kaXJ0eV9iaXRtYXBfbWVyZ2VfaW50ZXJu
YWwKYzAzZTA1ZiBtaXJyb3I6IGFkZCBjaGVjayBmb3IgYml0bWFwLW1vZGUgd2l0aG91dCBiaXRt
YXAKMWU5MDlmMiBkcml2ZS1taXJyb3I6IGFkZCBzdXBwb3J0IGZvciBjb25kaXRpb25hbCBhbmQg
YWx3YXlzIGJpdG1hcCBzeW5jIG1vZGVzCmU3YmFhZDMgZHJpdmUtbWlycm9yOiBhZGQgc3VwcG9y
dCBmb3Igc3luYz1iaXRtYXAgbW9kZT1uZXZlcgoKPT09IE9VVFBVVCBCRUdJTiA9PT0KMS82IENo
ZWNraW5nIGNvbW1pdCBlN2JhYWQzYTc2NWIgKGRyaXZlLW1pcnJvcjogYWRkIHN1cHBvcnQgZm9y
IHN5bmM9Yml0bWFwIG1vZGU9bmV2ZXIpCjIvNiBDaGVja2luZyBjb21taXQgMWU5MDlmMjg5MTQ3
IChkcml2ZS1taXJyb3I6IGFkZCBzdXBwb3J0IGZvciBjb25kaXRpb25hbCBhbmQgYWx3YXlzIGJp
dG1hcCBzeW5jIG1vZGVzKQpFUlJPUjogTWlzc2luZyBTaWduZWQtb2ZmLWJ5OiBsaW5lKHMpCgp0
b3RhbDogMSBlcnJvcnMsIDAgd2FybmluZ3MsIDQ4IGxpbmVzIGNoZWNrZWQKClBhdGNoIDIvNiBo
YXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3Jz
CmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpD
SEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgoKMy82IENoZWNraW5nIGNvbW1pdCBjMDNlMDVmOWY3
MzMgKG1pcnJvcjogYWRkIGNoZWNrIGZvciBiaXRtYXAtbW9kZSB3aXRob3V0IGJpdG1hcCkKNC82
IENoZWNraW5nIGNvbW1pdCBiNjVhYTMxMmU2NGUgKG1pcnJvcjogc3dpdGNoIHRvIGJkcnZfZGly
dHlfYml0bWFwX21lcmdlX2ludGVybmFsKQo1LzYgQ2hlY2tpbmcgY29tbWl0IDIyMzY5ODU2MjVi
ZSAoaW90ZXN0czogYWRkIHRlc3QgZm9yIGJpdG1hcCBtaXJyb3IpCldBUk5JTkc6IGFkZGVkLCBt
b3ZlZCBvciBkZWxldGVkIGZpbGUocyksIGRvZXMgTUFJTlRBSU5FUlMgbmVlZCB1cGRhdGluZz8K
IzI0OiAKbmV3IGZpbGUgbW9kZSAxMDA3NTUKCnRvdGFsOiAwIGVycm9ycywgMSB3YXJuaW5ncywg
MzM5NyBsaW5lcyBjaGVja2VkCgpQYXRjaCA1LzYgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2Ug
cmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9y
dCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4K
Ni82IENoZWNraW5nIGNvbW1pdCA1MGRhN2RkZDE4N2MgKG1pcnJvcjogbW92ZSBzb21lIGNoZWNr
cyB0byBRTVApCj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNv
ZGU6IDEKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9s
b2dzLzIwMjAwMjE4MTAwNzQwLjIyMjg1MjEtMS1mLmdydWVuYmljaGxlckBwcm94bW94LmNvbS90
ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRv
bWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQg
eW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

