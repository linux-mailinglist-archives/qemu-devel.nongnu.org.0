Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 247DA32384C
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 09:08:22 +0100 (CET)
Received: from localhost ([::1]:35184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEpDZ-0003wH-5t
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 03:08:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lEpCB-0003Uz-Ji
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 03:06:55 -0500
Resent-Date: Wed, 24 Feb 2021 03:06:55 -0500
Resent-Message-Id: <E1lEpCB-0003Uz-Ji@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lEpC7-00080E-Sl
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 03:06:55 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1614154004; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=cAlnKMFoCK3+K9BioJ83l3fObNV/0M/X4OCNXCfQ0b5ciPPgX0iP8jugVEuplPrhVKbD25Gr0ATVcl/M4OEgjFRVRH4xLkv57YgdHzb5+NZP1ueYNPZTyRr6k+Fkqi5ezIiubis717C1yXSErVRN+CEUELCZWm/hzEdoK86lUHM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1614154004;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=DK8D06IeYaODr/vyrF6BzJTQypT2sCabynw6EI74pYw=; 
 b=lNR9YxwVnCIomS8pD5E26Nt1/W5C90QflE3vuoHOI9bR4KkKcp6Ihm3bKNoxu4ozkhFuvVn7X0B3VtOf4LFwtQ0LzOVHsds9oSN+icleWRwW+WTNFKchk7EOmpkIHCPFc7vMkdaMdfGGhQHfks6JgIO06L0xNARtjODmHXuzvd0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1614154002755649.5041074129223;
 Wed, 24 Feb 2021 00:06:42 -0800 (PST)
In-Reply-To: <161415330721.7209.10377443778673632209.malone@gac.canonical.com>
Subject: Re: [Bug 1908832] Re: jack audio dev produces no sound
Message-ID: <161415400180.13232.3411672190983955290@c667a6b167f6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: 1908832@bugs.launchpad.net
Date: Wed, 24 Feb 2021 00:06:42 -0800 (PST)
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

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8xNjE0MTUzMzA3MjEuNzIwOS4x
MDM3NzQ0Mzc3ODY3MzYzMjIwOS5tYWxvbmVAZ2FjLmNhbm9uaWNhbC5jb20vCgoKCkhpLAoKVGhp
cyBzZXJpZXMgc2VlbXMgdG8gaGF2ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91
dHB1dCBiZWxvdyBmb3IKbW9yZSBpbmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlk
OiAxNjE0MTUzMzA3MjEuNzIwOS4xMDM3NzQ0Mzc3ODY3MzYzMjIwOS5tYWxvbmVAZ2FjLmNhbm9u
aWNhbC5jb20KU3ViamVjdDogW0J1ZyAxOTA4ODMyXSBSZTogamFjayBhdWRpbyBkZXYgcHJvZHVj
ZXMgbm8gc291bmQKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJl
di1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlm
Zi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQg
Y29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFtCi4vc2NyaXB0cy9jaGVja3Bh
dGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpVcGRhdGlu
ZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0CkZyb20gaHR0cHM6Ly9n
aXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiAqIFtuZXcgdGFnXSAgICAgICAgIHBhdGNo
ZXcvMTYxNDE1MzMwNzIxLjcyMDkuMTAzNzc0NDM3Nzg2NzM2MzIyMDkubWFsb25lQGdhYy5jYW5v
bmljYWwuY29tIC0+IHBhdGNoZXcvMTYxNDE1MzMwNzIxLjcyMDkuMTAzNzc0NDM3Nzg2NzM2MzIy
MDkubWFsb25lQGdhYy5jYW5vbmljYWwuY29tClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVz
dCcKZWUwYjVlMyBqYWNrIGF1ZGlvIGRldiBwcm9kdWNlcyBubyBzb3VuZAoKPT09IE9VVFBVVCBC
RUdJTiA9PT0KRVJST1I6IE1pc3NpbmcgU2lnbmVkLW9mZi1ieTogbGluZShzKQoKdG90YWw6IDEg
ZXJyb3JzLCAwIHdhcm5pbmdzLCA4IGxpbmVzIGNoZWNrZWQKCkNvbW1pdCBlZTBiNWUzZGJhZmYg
KGphY2sgYXVkaW8gZGV2IHByb2R1Y2VzIG5vIHNvdW5kKSBoYXMgc3R5bGUgcHJvYmxlbXMsIHBs
ZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMg
cmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlO
RVJTLgo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAx
CgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8x
NjE0MTUzMzA3MjEuNzIwOS4xMDM3NzQ0Mzc3ODY3MzYzMjIwOS5tYWxvbmVAZ2FjLmNhbm9uaWNh
bC5jb20vdGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0
ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFz
ZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

