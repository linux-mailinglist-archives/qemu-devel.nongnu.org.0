Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EF932B459
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 06:16:51 +0100 (CET)
Received: from localhost ([::1]:51188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHJsQ-0004Mm-Uf
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 00:16:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lHJrS-0003uT-Ca
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 00:15:50 -0500
Resent-Date: Wed, 03 Mar 2021 00:15:50 -0500
Resent-Message-Id: <E1lHJrS-0003uT-Ca@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lHJrQ-0005PB-1R
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 00:15:50 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1614748543; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=BVj/S8/PmFDQ7cYyMR+Fsvl8HQm9ZsNiRRAL9SPeki0sD/BSyNM6AvO9US2OHBC+kvqg1MuV8UI2jPbUISjxOAVQbxOLxNdeurXnsYnso7fWWIkfSve8wXThi+keD8w+MuF7q0cN3x/ntPC+ukVC4pRjJ0a5dxBzPgmfZppt32s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1614748543;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=u1xqT8cwJdXOkbLwCDetuTmiQ/HdutYhiVgQhrG2ULA=; 
 b=lfyqAYh5mTjqRZv8MVpXefjpuW3DgWgAG7DScfSMr/SNymgU/1ryyghcFAG6m2gI3lk6TL3SH+Oc+UtZQg1B9Pxy4mA+YZRpuO/EndympmJUjilvPt/TyHrDARuTStIvw56tm0cKRd1/FxfFYuEo3vlKXm6l/TvoskaqdODM04c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1614748541468710.8896921288136;
 Tue, 2 Mar 2021 21:15:41 -0800 (PST)
In-Reply-To: <161474788220.8516.15014999465847517073.malonedeb@gac.canonical.com>
Subject: Re: [Bug 1917565] [NEW] Windows 10 fails with "Boot device
 inaccessible"
Message-ID: <161474854052.13544.11508514670649941906@c667a6b167f6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: 1917565@bugs.launchpad.net
Date: Tue, 2 Mar 2021 21:15:41 -0800 (PST)
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

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8xNjE0NzQ3ODgyMjAuODUxNi4x
NTAxNDk5OTQ2NTg0NzUxNzA3My5tYWxvbmVkZWJAZ2FjLmNhbm9uaWNhbC5jb20vCgoKCkhpLAoK
VGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2Vl
IG91dHB1dCBiZWxvdyBmb3IKbW9yZSBpbmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdl
LWlkOiAxNjE0NzQ3ODgyMjAuODUxNi4xNTAxNDk5OTQ2NTg0NzUxNzA3My5tYWxvbmVkZWJAZ2Fj
LmNhbm9uaWNhbC5jb20KU3ViamVjdDogW0J1ZyAxOTE3NTY1XSBbTkVXXSBXaW5kb3dzIDEwIGZh
aWxzIHdpdGggIkJvb3QgZGV2aWNlIGluYWNjZXNzaWJsZSIKCj09PSBURVNUIFNDUklQVCBCRUdJ
TiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQg
MApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2Nh
bCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlz
dG9ncmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNU
IFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJk
ODg4NzEzMzg0CkZyb20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiAq
IFtuZXcgdGFnXSAgICAgICAgIHBhdGNoZXcvMTYxNDc0Nzg4MjIwLjg1MTYuMTUwMTQ5OTk0NjU4
NDc1MTcwNzMubWFsb25lZGViQGdhYy5jYW5vbmljYWwuY29tIC0+IHBhdGNoZXcvMTYxNDc0Nzg4
MjIwLjg1MTYuMTUwMTQ5OTk0NjU4NDc1MTcwNzMubWFsb25lZGViQGdhYy5jYW5vbmljYWwuY29t
ClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKCj09PSBPVVRQVVQgQkVHSU4gPT09CmNo
ZWNrcGF0Y2gucGw6IG5vIHJldmlzaW9ucyByZXR1cm5lZCBmb3IgcmV2bGlzdCAnYmFzZS4uJwo9
PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAyNTUKCgpU
aGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzE2MTQ3
NDc4ODIyMC44NTE2LjE1MDE0OTk5NDY1ODQ3NTE3MDczLm1hbG9uZWRlYkBnYWMuY2Fub25pY2Fs
LmNvbS90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRl
ZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNl
IHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

