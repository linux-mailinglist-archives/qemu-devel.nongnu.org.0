Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 130AA35E09A
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 15:51:23 +0200 (CEST)
Received: from localhost ([::1]:53582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWJRq-00023w-6n
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 09:51:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lWJPA-00010m-VS
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 09:48:37 -0400
Resent-Date: Tue, 13 Apr 2021 09:48:36 -0400
Resent-Message-Id: <E1lWJPA-00010m-VS@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lWJP7-0001qI-AT
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 09:48:35 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1618321707; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=dXAp4kXV2ch4cm3df6QFsVrLXmbfn/0BgTX1pn9XVJwHMSOVPR79pfiOdOJy47tzTsZMvT8gAC+6Rrfhr6vcyAD9A0fYvN8s5OjWi0aC5vDa0++5kRNA+9eZxTCWSsA0bHzHbGmxw2q4/q4kycAuhRPtrwmUHpGxBpyR/QNI038=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1618321707;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=eiM7qZJbJxQ9NakreSgXS6P+UlzJdOlZw7yMP4Io6gY=; 
 b=amQJrB2m21VWPqAKLD85kh5AiUaMuT+k6koTF8FjBywCCSxcqgMiKiz8x4+gTsMjcyMA2GnMfFg1rBRV/f+qU2M9ahq9+R6mEiRUQnemwaYcZZS5JjungzqhXVo5sfrvkioPZw46r/OW0Goff1zBmbuff+ZxaPrEBOsg0zlM348=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1618321703092626.5800845144876;
 Tue, 13 Apr 2021 06:48:23 -0700 (PDT)
In-Reply-To: <20210413124800.216095-1-pbonzini@redhat.com>
Subject: Re: [PULL 0/2] osdep.h changes for QEMU 6.0-rc3
Message-ID: <161832170214.10350.3223637097229067511@72b6d80f974b>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: pbonzini@redhat.com
Date: Tue, 13 Apr 2021 06:48:23 -0700 (PDT)
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

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDQxMzEyNDgwMC4yMTYw
OTUtMS1wYm9uemluaUByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhh
dmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUg
aW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMTA0MTMxMjQ4MDAuMjE2
MDk1LTEtcGJvbnppbmlAcmVkaGF0LmNvbQpTdWJqZWN0OiBbUFVMTCAwLzJdIG9zZGVwLmggY2hh
bmdlcyBmb3IgUUVNVSA2LjAtcmMzCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9i
YXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNvbmZpZyAt
LWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVz
IFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQouL3Njcmlw
dHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQgRU5EID09
PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApTd2l0
Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCjJmNjMwOGUgb3NkZXA6IHByb3RlY3QgcWVtdS9v
c2RlcC5oIHdpdGggZXh0ZXJuICJDIgo5YWVkNDA0IG9zZGVwOiBpbmNsdWRlIGdsaWItY29tcGF0
LmggYmVmb3JlIG90aGVyIFFFTVUgaGVhZGVycwoKPT09IE9VVFBVVCBCRUdJTiA9PT0KMS8yIENo
ZWNraW5nIGNvbW1pdCA5YWVkNDA0NTkxY2IgKG9zZGVwOiBpbmNsdWRlIGdsaWItY29tcGF0Lmgg
YmVmb3JlIG90aGVyIFFFTVUgaGVhZGVycykKMi8yIENoZWNraW5nIGNvbW1pdCAyZjYzMDhlMWI1
MjQgKG9zZGVwOiBwcm90ZWN0IHFlbXUvb3NkZXAuaCB3aXRoIGV4dGVybiAiQyIpCldBUk5JTkc6
IGFyY2hpdGVjdHVyZSBzcGVjaWZpYyBkZWZpbmVzIHNob3VsZCBiZSBhdm9pZGVkCiM1MTogRklM
RTogaW5jbHVkZS9xZW11L2NvbXBpbGVyLmg6MTQ6CisjaWZkZWYgX19jcGx1c3BsdXMKCkVSUk9S
OiBzdG9yYWdlIGNsYXNzIHNob3VsZCBiZSBhdCB0aGUgYmVnaW5uaW5nIG9mIHRoZSBkZWNsYXJh
dGlvbgojNTI6IEZJTEU6IGluY2x1ZGUvcWVtdS9jb21waWxlci5oOjE1OgorI2RlZmluZSBRRU1V
X0VYVEVSTl9DIGV4dGVybiAiQyIKCkVSUk9SOiBzdG9yYWdlIGNsYXNzIHNob3VsZCBiZSBhdCB0
aGUgYmVnaW5uaW5nIG9mIHRoZSBkZWNsYXJhdGlvbgojNTQ6IEZJTEU6IGluY2x1ZGUvcWVtdS9j
b21waWxlci5oOjE3OgorI2RlZmluZSBRRU1VX0VYVEVSTl9DIGV4dGVybgoKV0FSTklORzogYXJj
aGl0ZWN0dXJlIHNwZWNpZmljIGRlZmluZXMgc2hvdWxkIGJlIGF2b2lkZWQKIzc3OiBGSUxFOiBp
bmNsdWRlL3FlbXUvb3NkZXAuaDoxMTY6CisjaWZkZWYgX19jcGx1c3BsdXMKCldBUk5JTkc6IGFy
Y2hpdGVjdHVyZSBzcGVjaWZpYyBkZWZpbmVzIHNob3VsZCBiZSBhdm9pZGVkCiM4ODogRklMRTog
aW5jbHVkZS9xZW11L29zZGVwLmg6NzMwOgorI2lmZGVmIF9fY3BsdXNwbHVzCgp0b3RhbDogMiBl
cnJvcnMsIDMgd2FybmluZ3MsIDQ3IGxpbmVzIGNoZWNrZWQKClBhdGNoIDIvMiBoYXMgc3R5bGUg
cHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxz
ZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENI
IGluIE1BSU5UQUlORVJTLgoKPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVk
IHdpdGggY29kZTogMQoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNo
ZXcub3JnL2xvZ3MvMjAyMTA0MTMxMjQ4MDAuMjE2MDk1LTEtcGJvbnppbmlAcmVkaGF0LmNvbS90
ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRv
bWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQg
eW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

