Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6840310389
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 04:26:12 +0100 (CET)
Received: from localhost ([::1]:43328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7rl5-0000Mt-PX
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 22:26:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1l7rjn-0008Mc-8I
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 22:24:51 -0500
Resent-Date: Thu, 04 Feb 2021 22:24:51 -0500
Resent-Message-Id: <E1l7rjn-0008Mc-8I@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1l7rjk-0003cX-TN
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 22:24:50 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1612495482; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ggOqOmDmgCqAZwZ627bJAgPhO2lbPANz57DO9JjuGYqONsnWH0nII+Pk2P+k3wsQUftkvXmCdMvibzfrKJ1ATA5cozWQVRu+P9XoiYhv2yEvWqicWG2siZP8BnwBn7uW9TU1l7FyK5zy58ICMOJwTCTLfCrPcNEToY+puF5T97w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1612495482;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=yG3VdjMyR67g2210IyFRDhHG50P6EPMLpAt0Yd80zGo=; 
 b=H/xJm719bbsT3z6u/YSWu5BN/8Um/ta7gwNncCAFkUy8tHIOW9vUIh76gu459E27E3783W64iudIu0A4a/UOvjF5CGGxz80cz9Oakbzju9xGhHXyO2NcVcmUY8zz+aDKexQxbOUq8AyRsaozCaGeL7IZrlZMxhZTtBeqiq1whhc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 16124954820961015.0841980782;
 Thu, 4 Feb 2021 19:24:42 -0800 (PST)
In-Reply-To: <161249398803.13999.15324457641617983607.malonedeb@soybean.canonical.com>
Subject: Re: [Bug 1914696] [NEW] aarch64: migration failed: Segmentation fault
 (core dumped)
Message-ID: <161249548106.30579.5518035252261174941@c667a6b167f6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: 1914696@bugs.launchpad.net
Date: Thu, 4 Feb 2021 19:24:42 -0800 (PST)
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8xNjEyNDkzOTg4MDMuMTM5OTku
MTUzMjQ0NTc2NDE2MTc5ODM2MDcubWFsb25lZGViQHNveWJlYW4uY2Fub25pY2FsLmNvbS8KCgoK
SGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1z
LiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1l
c3NhZ2UtaWQ6IDE2MTI0OTM5ODgwMy4xMzk5OS4xNTMyNDQ1NzY0MTYxNzk4MzYwNy5tYWxvbmVk
ZWJAc295YmVhbi5jYW5vbmljYWwuY29tClN1YmplY3Q6IFtCdWcgMTkxNDY5Nl0gW05FV10gYWFy
Y2g2NDogbWlncmF0aW9uIGZhaWxlZDogU2VnbWVudGF0aW9uIGZhdWx0IChjb3JlIGR1bXBlZCkK
Cj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNl
ID4gL2Rldi9udWxsIHx8IGV4aXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1p
dCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9j
YWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFp
bGJhY2sgYmFzZS4uCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMy
MWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0CkZyb20gaHR0cHM6Ly9naXRodWIuY29tL3Bh
dGNoZXctcHJvamVjdC9xZW11CiAqIFtuZXcgdGFnXSAgICAgICAgIHBhdGNoZXcvMTYxMjQ5Mzk4
ODAzLjEzOTk5LjE1MzI0NDU3NjQxNjE3OTgzNjA3Lm1hbG9uZWRlYkBzb3liZWFuLmNhbm9uaWNh
bC5jb20gLT4gcGF0Y2hldy8xNjEyNDkzOTg4MDMuMTM5OTkuMTUzMjQ0NTc2NDE2MTc5ODM2MDcu
bWFsb25lZGViQHNveWJlYW4uY2Fub25pY2FsLmNvbQpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2gg
J3Rlc3QnCgo9PT0gT1VUUFVUIEJFR0lOID09PQpjaGVja3BhdGNoLnBsOiBubyByZXZpc2lvbnMg
cmV0dXJuZWQgZm9yIHJldmxpc3QgJ2Jhc2UuLicKPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNv
bW1hbmQgZXhpdGVkIHdpdGggY29kZTogMjU1CgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBh
dApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8xNjEyNDkzOTg4MDMuMTM5OTkuMTUzMjQ0NTc2NDE2
MTc5ODM2MDcubWFsb25lZGViQHNveWJlYW4uY2Fub25pY2FsLmNvbS90ZXN0aW5nLmNoZWNrcGF0
Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBh
dGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0
byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

