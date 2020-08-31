Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3373C257E0E
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Aug 2020 17:57:04 +0200 (CEST)
Received: from localhost ([::1]:36304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kCmB4-0004u0-Um
	for lists+qemu-devel@lfdr.de; Mon, 31 Aug 2020 11:57:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kCmAN-0004MD-Cu; Mon, 31 Aug 2020 11:56:19 -0400
Resent-Date: Mon, 31 Aug 2020 11:56:19 -0400
Resent-Message-Id: <E1kCmAN-0004MD-Cu@lists.gnu.org>
Received: from sender4-of-o57.zoho.com ([136.143.188.57]:21720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kCmAK-0004e9-IZ; Mon, 31 Aug 2020 11:56:19 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1598889362; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Z8aoeyRkdtPN0CuijzLuA26AfQ82Zyp8XjDSO0bhJn27EAq/ZJgishAFIhjPFAHdCofVN8tGjhYanFbxbdsMUx2BgZ4r2e5eGT4MYS05yEekSknQP2Kbn9pt7TEqBtCtnTz+oDJSoFdeUZlUrs/TpVut1Wv8KdPJxOav+1wOAsY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1598889362;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=Rnd08LyEVdrnwdntxiYUK1EjcKAm9yTwumZnz4Vw7ZY=; 
 b=ZuPJEGWYxjntmSpCerWl/LdSOLjLjtjwtLFFatwVlsCbJu884NhDCJJ5liq2juLKa/Sisfdfde9gVsigoIZ+6MM+bwXtL1AHoe6SPrV1Fbb2FoCxcS+s/72kvW34/jUw8pgFM54aRrPqKPfPhHv8nGRt/tlxC2m5gK61HWbvvY8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 159888935900611.333334314656895;
 Mon, 31 Aug 2020 08:55:59 -0700 (PDT)
Subject: Re: [PATCH 0/2] Replace posix_fallocate() with falloate()
Message-ID: <159888935774.27000.4901880719963125119@66eaa9a8a123>
In-Reply-To: <20200831140127.657134-1-nsoffer@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: nirsof@gmail.com
Date: Mon, 31 Aug 2020 08:55:59 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.57; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o57.zoho.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/31 11:56:12
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, armbru@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, nsoffer@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDgzMTE0MDEyNy42NTcx
MzQtMS1uc29mZmVyQHJlZGhhdC5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2
ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBp
bmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIwMDgzMTE0MDEyNy42NTcx
MzQtMS1uc29mZmVyQHJlZGhhdC5jb20KU3ViamVjdDogW1BBVENIIDAvMl0gUmVwbGFjZSBwb3Np
eF9mYWxsb2NhdGUoKSB3aXRoIGZhbGxvYXRlKCkKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0K
IyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQgMApnaXQg
Y29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZm
LnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFt
Ci4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNUIFNDUklQ
VCBFTkQgPT09CgpGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdQog
KiBbbmV3IHRhZ10gICAgICAgICBwYXRjaGV3LzIwMjAwODMxMTQwMTI3LjY1NzEzNC0xLW5zb2Zm
ZXJAcmVkaGF0LmNvbSAtPiBwYXRjaGV3LzIwMjAwODMxMTQwMTI3LjY1NzEzNC0xLW5zb2ZmZXJA
cmVkaGF0LmNvbQpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCjcwZTM1ZWQgYmxvY2s6
IGZpbGUtcG9zaXg6IFJlcGxhY2UgcG9zaXhfZmFsbG9jYXRlIHdpdGggZmFsbG9jYXRlCjM1ZDg5
ZDEgYmxvY2s6IGZpbGUtcG9zaXg6IEV4dHJhY3QgcHJlYWxsb2NhdGUgaGVscGVycwoKPT09IE9V
VFBVVCBCRUdJTiA9PT0KMS8yIENoZWNraW5nIGNvbW1pdCAzNWQ4OWQxMzAwZTQgKGJsb2NrOiBm
aWxlLXBvc2l4OiBFeHRyYWN0IHByZWFsbG9jYXRlIGhlbHBlcnMpCkVSUk9SOiBicmFjZXMge30g
YXJlIG5lY2Vzc2FyeSBmb3IgYWxsIGFybXMgb2YgdGhpcyBzdGF0ZW1lbnQKIzMzOiBGSUxFOiBi
bG9jay9maWxlLXBvc2l4LmM6MTg0MToKKyAgICBpZiAob2Zmc2V0ID09IGN1cnJlbnRfbGVuZ3Ro
KQpbLi4uXQoKdG90YWw6IDEgZXJyb3JzLCAwIHdhcm5pbmdzLCAyMzQgbGluZXMgY2hlY2tlZAoK
UGF0Y2ggMS8yIGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0
aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRh
aW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCgoyLzIgQ2hlY2tpbmcgY29tbWl0
IDcwZTM1ZWRhNWJjOSAoYmxvY2s6IGZpbGUtcG9zaXg6IFJlcGxhY2UgcG9zaXhfZmFsbG9jYXRl
IHdpdGggZmFsbG9jYXRlKQpFUlJPUjogYnJhY2VzIHt9IGFyZSBuZWNlc3NhcnkgZm9yIGFsbCBh
cm1zIG9mIHRoaXMgc3RhdGVtZW50CiMxMTA6IEZJTEU6IGJsb2NrL2ZpbGUtcG9zaXguYzoxOTY3
OgorICAgICAgICBpZiAocmVzdWx0ICE9IC1FTk9UU1VQKQpbLi4uXQoKdG90YWw6IDEgZXJyb3Jz
LCAwIHdhcm5pbmdzLCAxMDggbGluZXMgY2hlY2tlZAoKUGF0Y2ggMi8yIGhhcyBzdHlsZSBwcm9i
bGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBv
c2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4g
TUFJTlRBSU5FUlMuCgo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0
aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5v
cmcvbG9ncy8yMDIwMDgzMTE0MDEyNy42NTcxMzQtMS1uc29mZmVyQHJlZGhhdC5jb20vdGVzdGlu
Zy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGlj
YWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIg
ZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

