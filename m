Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 915052F394A
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 19:59:58 +0100 (CET)
Received: from localhost ([::1]:49180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzOtZ-00084v-Cw
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 13:59:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kzOom-0003ZJ-9i
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 13:55:00 -0500
Resent-Date: Tue, 12 Jan 2021 13:55:00 -0500
Resent-Message-Id: <E1kzOom-0003ZJ-9i@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kzOof-0005Bb-Tr
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 13:55:00 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1610477688; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=lhh7I5QIi7a18L0ON/1I/Blz7lnLBA64Xn5T5DaVWNXNy2nkE6Grl0wyII4/JL+WMclKUdmo/1ejpGoM9+GHZ0a2v70JLntkVnPvHZJtEJ5dPtVkvGSHMzK/mdFD2VZOCHEiLlV8s2fgMHVXo5FcqTrcu6vbvVIDIsdwJFuU1fc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1610477688;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=p9SOxFS6MFM4kdUcgcHXTG+xhboBBuCCGljv7N0d7lk=; 
 b=iN87j/VnoxYre7TZeur+WMfObbtzEtAvKfVRY65SISVXUiL1hX7msUBl7SZYvX5ck+3IP9Si6oV+eVu0fMVIIOOrEbjio95uyqaxjvh+ro83De1OevBPoYOVlhq5oEJ4A0+NKPUQNOqmOk5iZneIzn3nV41KO3yXQSCr42+SXgI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1610477686682763.3051061298384;
 Tue, 12 Jan 2021 10:54:46 -0800 (PST)
In-Reply-To: <1610476384-13760-1-git-send-email-tsimpson@quicinc.com>
Subject: Re: [PATCH] tests/tcg/multiarch/testthread.c: Add pthread_cancel test
Message-ID: <161047768564.30323.8540160028847855024@73fb1a5943b8>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: tsimpson@quicinc.com
Date: Tue, 12 Jan 2021 10:54:46 -0800 (PST)
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
Cc: tsimpson@quicinc.com, alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8xNjEwNDc2Mzg0LTEzNzYwLTEt
Z2l0LXNlbmQtZW1haWwtdHNpbXBzb25AcXVpY2luYy5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMg
c2VlbXMgdG8gaGF2ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxv
dyBmb3IKbW9yZSBpbmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAxNjEwNDc2
Mzg0LTEzNzYwLTEtZ2l0LXNlbmQtZW1haWwtdHNpbXBzb25AcXVpY2luYy5jb20KU3ViamVjdDog
W1BBVENIXSB0ZXN0cy90Y2cvbXVsdGlhcmNoL3Rlc3R0aHJlYWQuYzogQWRkIHB0aHJlYWRfY2Fu
Y2VsIHRlc3QKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1w
YXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5y
ZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29u
ZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFtCi4vc2NyaXB0cy9jaGVja3BhdGNo
LnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAz
YzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0CkZyb20gaHR0cHM6Ly9naXRo
dWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiAqIFtuZXcgdGFnXSAgICAgICAgIHBhdGNoZXcv
MTYxMDQ3NjM4NC0xMzc2MC0xLWdpdC1zZW5kLWVtYWlsLXRzaW1wc29uQHF1aWNpbmMuY29tIC0+
IHBhdGNoZXcvMTYxMDQ3NjM4NC0xMzc2MC0xLWdpdC1zZW5kLWVtYWlsLXRzaW1wc29uQHF1aWNp
bmMuY29tClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKZDYyY2QxZSB0ZXN0cy90Y2cv
bXVsdGlhcmNoL3Rlc3R0aHJlYWQuYzogQWRkIHB0aHJlYWRfY2FuY2VsIHRlc3QKCj09PSBPVVRQ
VVQgQkVHSU4gPT09CkVSUk9SOiBNaXNzaW5nIFNpZ25lZC1vZmYtYnk6IGxpbmUocykKCnRvdGFs
OiAxIGVycm9ycywgMCB3YXJuaW5ncywgMjkgbGluZXMgY2hlY2tlZAoKQ29tbWl0IGQ2MmNkMWU3
OWEwNiAodGVzdHMvdGNnL211bHRpYXJjaC90ZXN0dGhyZWFkLmM6IEFkZCBwdGhyZWFkX2NhbmNl
bCB0ZXN0KSBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhl
c2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWlu
ZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgo9PT0gT1VUUFVUIEVORCA9PT0KClRl
c3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJs
ZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8xNjEwNDc2Mzg0LTEzNzYwLTEtZ2l0LXNlbmQt
ZW1haWwtdHNpbXBzb25AcXVpY2luYy5jb20vdGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3Nh
Z2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczov
L3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZl
bEByZWRoYXQuY29t

