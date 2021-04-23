Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAD1369653
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 17:41:34 +0200 (CEST)
Received: from localhost ([::1]:39834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZxvx-0005QU-W5
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 11:41:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lZxuS-0004ts-7P
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 11:40:01 -0400
Resent-Date: Fri, 23 Apr 2021 11:40:00 -0400
Resent-Message-Id: <E1lZxuS-0004ts-7P@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lZxuO-0003uk-Qc
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 11:39:59 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1619192389; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=NyPwdlZzsS7FpOwluo8NOYkEAL6bOkQTVH2doatXm4MlsmoBcTjgp5D3ud+DFnMxtSz0nlJ7fbHCwJ57EJIDn6tXVKeJQviWNOiCjBlpEu5xZ/ixgnhWdguIEugZatzFvjTu67mDY/vVO2pff4fYXTPFGVH1jz8MaDBAnlMdhi4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1619192389;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=jkVzwQkELUHDtcPqWm62ghBfwTfNuGwXLIQRil951oA=; 
 b=IhdYgId+Z7Kzt00FA6SXBHGq9MwzhQUZ4Cml05kQ6HxBoBOe8XhJxolayOpdHsPZu/y78bUrHKfEEE7wblNvh0rXK0/aiVMyfW6Nnmd6zjudkbzkyuxoYCi+qaHdAX9hr07sRMOSd51Fe4bq8cv6R4g+jw4l5TlnuBNXROABORw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1619192387384298.48464777685604;
 Fri, 23 Apr 2021 08:39:47 -0700 (PDT)
In-Reply-To: <cover.1619190878.git.sbrivio@redhat.com>
Subject: Re: [PATCH 0/2] Support for AF_UNIX -netdev socket and a small fix
Message-ID: <161919238618.9599.8882659842876835054@72b6d80f974b>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: sbrivio@redhat.com
Date: Fri, 23 Apr 2021 08:39:47 -0700 (PDT)
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
Cc: ralph.schmieder@gmail.com, berrange@redhat.com, qemu-devel@nongnu.org,
 laine@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS9jb3Zlci4xNjE5MTkwODc4Lmdp
dC5zYnJpdmlvQHJlZGhhdC5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2ZSBz
b21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBpbmZv
cm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiBjb3Zlci4xNjE5MTkwODc4LmdpdC5z
YnJpdmlvQHJlZGhhdC5jb20KU3ViamVjdDogW1BBVENIIDAvMl0gU3VwcG9ydCBmb3IgQUZfVU5J
WCAtbmV0ZGV2IHNvY2tldCBhbmQgYSBzbWFsbCBmaXgKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9
PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQgMApn
aXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBk
aWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9n
cmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNUIFND
UklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4
NzEzMzg0CkZyb20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiAtIFt0
YWcgdXBkYXRlXSAgICAgIHBhdGNoZXcvMjAyMTA0MjExMjI2MjQuMTIyOTItMS1kYXZpZEByZWRo
YXQuY29tIC0+IHBhdGNoZXcvMjAyMTA0MjExMjI2MjQuMTIyOTItMS1kYXZpZEByZWRoYXQuY29t
CiAtIFt0YWcgdXBkYXRlXSAgICAgIHBhdGNoZXcvMjAyMTA0MjIxNjQzNDQuMjgzMzg5LTEta3dv
bGZAcmVkaGF0LmNvbSAtPiBwYXRjaGV3LzIwMjEwNDIyMTY0MzQ0LjI4MzM4OS0xLWt3b2xmQHJl
ZGhhdC5jb20KIC0gW3RhZyB1cGRhdGVdICAgICAgcGF0Y2hldy8yMDIxMDQyMjIzMDIyNy4zMTQ3
NTEtMS1yaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnIC0+IHBhdGNoZXcvMjAyMTA0MjIyMzAy
MjcuMzE0NzUxLTEtcmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZwogLSBbdGFnIHVwZGF0ZV0g
ICAgICBwYXRjaGV3LzIwMjEwNDIzMTQyNDQwLjU4MjE4OC0xLXRodXRoQHJlZGhhdC5jb20gLT4g
cGF0Y2hldy8yMDIxMDQyMzE0MjQ0MC41ODIxODgtMS10aHV0aEByZWRoYXQuY29tCiAqIFtuZXcg
dGFnXSAgICAgICAgIHBhdGNoZXcvY292ZXIuMTYxOTE5MDg3OC5naXQuc2JyaXZpb0ByZWRoYXQu
Y29tIC0+IHBhdGNoZXcvY292ZXIuMTYxOTE5MDg3OC5naXQuc2JyaXZpb0ByZWRoYXQuY29tClN3
aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKOGVhY2YzOSBuZXQ6IERvbid0IGlnbm9yZSBF
SU5WQUwgb24gbmV0ZGV2IHNvY2tldCBjb25uZWN0aW9uCjE3YzBiNmUgbmV0OiBBbGxvdyBhbHNv
IFVOSVggZG9tYWluIHNvY2tldHMgdG8gYmUgdXNlZCBhcyAtbmV0ZGV2IHNvY2tldAoKPT09IE9V
VFBVVCBCRUdJTiA9PT0KMS8yIENoZWNraW5nIGNvbW1pdCAxN2MwYjZlYzhkNmIgKG5ldDogQWxs
b3cgYWxzbyBVTklYIGRvbWFpbiBzb2NrZXRzIHRvIGJlIHVzZWQgYXMgLW5ldGRldiBzb2NrZXQp
CkVSUk9SOiBicmFjZXMge30gYXJlIG5lY2Vzc2FyeSBmb3IgYWxsIGFybXMgb2YgdGhpcyBzdGF0
ZW1lbnQKIzM4OiBGSUxFOiBuZXQvc29ja2V0LmM6NTIzOgorICAgICAgICBpZiAocGFyc2VfaG9z
dF9wb3J0KHNhZGRyX2luLCBob3N0X3N0ciwgZXJycCkgPCAwKQpbLi4uXQoKRVJST1I6IGJyYWNl
cyB7fSBhcmUgbmVjZXNzYXJ5IGZvciBhbGwgYXJtcyBvZiB0aGlzIHN0YXRlbWVudAojNzQ6IEZJ
TEU6IG5ldC9zb2NrZXQuYzo1NTc6CisgICAgaWYgKHBmID09IFBGX0lORVQpClsuLi5dCgpFUlJP
UjogYnJhY2VzIHt9IGFyZSBuZWNlc3NhcnkgZm9yIGFsbCBhcm1zIG9mIHRoaXMgc3RhdGVtZW50
CiMxMDk6IEZJTEU6IG5ldC9zb2NrZXQuYzo2MDY6CisgICAgICAgIGlmIChwYXJzZV9ob3N0X3Bv
cnQoc2FkZHJfaW4sIGhvc3Rfc3RyLCBlcnJwKSA8IDApClsuLi5dCgp0b3RhbDogMyBlcnJvcnMs
IDAgd2FybmluZ3MsIDE2MyBsaW5lcyBjaGVja2VkCgpQYXRjaCAxLzIgaGFzIHN0eWxlIHByb2Js
ZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9z
aXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBN
QUlOVEFJTkVSUy4KCjIvMiBDaGVja2luZyBjb21taXQgOGVhY2YzOTE3NDA2IChuZXQ6IERvbid0
IGlnbm9yZSBFSU5WQUwgb24gbmV0ZGV2IHNvY2tldCBjb25uZWN0aW9uKQo9PT0gT1VUUFVUIEVO
RCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlz
IGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy9jb3Zlci4xNjE5MTkwODc4Lmdp
dC5zYnJpdmlvQHJlZGhhdC5jb20vdGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0t
LQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNo
ZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRo
YXQuY29t

