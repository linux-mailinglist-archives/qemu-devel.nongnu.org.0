Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B421932371D
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 07:05:21 +0100 (CET)
Received: from localhost ([::1]:36030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEnIW-0000xF-OI
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 01:05:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lEnHJ-0000UA-3A
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 01:04:05 -0500
Resent-Date: Wed, 24 Feb 2021 01:04:05 -0500
Resent-Message-Id: <E1lEnHJ-0000UA-3A@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lEnHG-0001bM-KW
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 01:04:04 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1614146633; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ZWwC6j6H7R1QkjLxuvwZQvuqlVWr/1Hypljlw0tXcc45rbr4tQVkTK1Gnkr2tEgNjW+SAVXEZKsuO32SbnzvEseTYz3OZOCSr4nrXwJ5F6x/5e7OerCe36cFkm9pzArsV5oaTpulfezJoaMIb30cRpVszPTG/dXI/dUVCEuUyf8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1614146633;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=gfX5yv9hMb2XH+ngG7sRxOKNrkDvXZv4bfw2T1Jp1Nk=; 
 b=QuCklzgW74V5KYclDfMwJ7yUEEnEqkp3NSvOR/PyocUJed3vDiFem7GDdW4iqEeq3I8oIFVgFl2lFLVYMulqzPQihvG5AoUQXl3mTfMYBzJGW+F2wMw2gVwKp5ICHdQtaRHm/ZIXNKXmkidhKT0tK2LzJZXZz20WwQHE0QOzF+s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1614146630831964.0444452866375;
 Tue, 23 Feb 2021 22:03:50 -0800 (PST)
In-Reply-To: <20210224055401.492407-1-jasowang@redhat.com>
Subject: Re: [PATCH 0/6] Detect reentrant RX casue by loopback
Message-ID: <161414662972.13232.10666773702775968385@c667a6b167f6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: jasowang@redhat.com
Date: Tue, 23 Feb 2021 22:03:50 -0800 (PST)
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
Cc: jasowang@redhat.com, qemu-devel@nongnu.org, ppandit@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDIyNDA1NTQwMS40OTI0
MDctMS1qYXNvd2FuZ0ByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhh
dmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUg
aW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMTAyMjQwNTU0MDEuNDky
NDA3LTEtamFzb3dhbmdAcmVkaGF0LmNvbQpTdWJqZWN0OiBbUEFUQ0ggMC82XSBEZXRlY3QgcmVl
bnRyYW50IFJYIGNhc3VlIGJ5IGxvb3BiYWNrCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMh
L2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNv
bmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5y
ZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQou
L3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQg
RU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4
NApGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdQogKiBbbmV3IHRh
Z10gICAgICAgICBwYXRjaGV3LzIwMjEwMjI0MDU1NDAxLjQ5MjQwNy0xLWphc293YW5nQHJlZGhh
dC5jb20gLT4gcGF0Y2hldy8yMDIxMDIyNDA1NTQwMS40OTI0MDctMS1qYXNvd2FuZ0ByZWRoYXQu
Y29tClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKNmE0MWQwOSB0eF9wa3Q6IHN3aXRj
aCB0byB1c2UgcWVtdV9yZWNlaXZlX3BhY2tldF9pb3YoKSBmb3IgbG9vcGJhY2sKNTQ4MGU1NSBz
dW5nZW06IHN3aXRjaCB0byB1c2UgcWVtdV9yZWNlaXZlX3BhY2tldCgpIGZvciBsb29wYmFjawpm
MzVmYWI2IG1zZjItbWFjOiBzd2l0Y2ggdG8gdXNlIHFlbXVfcmVjZWl2ZV9wYWNrZXQoKSBmb3Ig
bG9vcGJhY2sKMWRjMjljZiBkcDgzOTN4OiBzd2l0Y2ggdG8gdXNlIHFlbXVfcmVjZWl2ZV9wYWNr
ZXQoKSBmb3IgbG9vcGJhY2sgcGFja2V0CjZjNzk4MzQgZTEwMDA6IHN3aXRjaCB0byB1c2UgcWVt
dV9yZWNlaXZlX3BhY2tldCgpIGZvciBsb29wYmFjawowNDY2MGMwIG5ldDogaW50cm9kdWNlIHFl
bXVfcmVjZWl2ZV9wYWNrZXQoKQoKPT09IE9VVFBVVCBCRUdJTiA9PT0KMS82IENoZWNraW5nIGNv
bW1pdCAwNDY2MGMwNmQ4OGUgKG5ldDogaW50cm9kdWNlIHFlbXVfcmVjZWl2ZV9wYWNrZXQoKSkK
RVJST1I6IHNwYWNlIHJlcXVpcmVkIGFmdGVyIHRoYXQgJywnIChjdHg6VnhWKQojNDI6IEZJTEU6
IGluY2x1ZGUvbmV0L25ldC5oOjE1NDoKK3NzaXplX3QgcWVtdV9yZWNlaXZlX3BhY2tldChOZXRD
bGllbnRTdGF0ZSAqbmMsIGNvbnN0IHVpbnQ4X3QgKmJ1ZixpbnQgc2l6ZSk7CiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBe
Cgp0b3RhbDogMSBlcnJvcnMsIDAgd2FybmluZ3MsIDExNSBsaW5lcyBjaGVja2VkCgpQYXRjaCAx
LzYgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVy
cm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBz
ZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KCjIvNiBDaGVja2luZyBjb21taXQgNmM3OTgz
NDY4ZTk0IChlMTAwMDogc3dpdGNoIHRvIHVzZSBxZW11X3JlY2VpdmVfcGFja2V0KCkgZm9yIGxv
b3BiYWNrKQozLzYgQ2hlY2tpbmcgY29tbWl0IDFkYzI5Y2ZhMzExNyAoZHA4MzkzeDogc3dpdGNo
IHRvIHVzZSBxZW11X3JlY2VpdmVfcGFja2V0KCkgZm9yIGxvb3BiYWNrIHBhY2tldCkKNC82IENo
ZWNraW5nIGNvbW1pdCBmMzVmYWI2Y2I3MzcgKG1zZjItbWFjOiBzd2l0Y2ggdG8gdXNlIHFlbXVf
cmVjZWl2ZV9wYWNrZXQoKSBmb3IgbG9vcGJhY2spCjUvNiBDaGVja2luZyBjb21taXQgNTQ4MGU1
NTU3Njc4IChzdW5nZW06IHN3aXRjaCB0byB1c2UgcWVtdV9yZWNlaXZlX3BhY2tldCgpIGZvciBs
b29wYmFjaykKNi82IENoZWNraW5nIGNvbW1pdCA2YTQxZDA5M2E3MDUgKHR4X3BrdDogc3dpdGNo
IHRvIHVzZSBxZW11X3JlY2VpdmVfcGFja2V0X2lvdigpIGZvciBsb29wYmFjaykKPT09IE9VVFBV
VCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKClRoZSBmdWxsIGxv
ZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAyMTAyMjQwNTU0MDEu
NDkyNDA3LTEtamFzb3dhbmdAcmVkaGF0LmNvbS90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVz
c2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBz
Oi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRl
dmVsQHJlZGhhdC5jb20=

