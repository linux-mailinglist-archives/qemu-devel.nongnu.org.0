Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F1B3A723B
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 00:51:29 +0200 (CEST)
Received: from localhost ([::1]:41942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsvQW-00019a-LY
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 18:51:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lsvPq-0000Pb-9L
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 18:50:46 -0400
Resent-Date: Mon, 14 Jun 2021 18:50:46 -0400
Resent-Message-Id: <E1lsvPq-0000Pb-9L@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lsvPo-00063H-Ei
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 18:50:46 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1623711035; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=kNYw80TzNH7dP7VRMQjx/eKoPUkbq4vts0WZBPMCfRpHLvBJIV20LqSETb3pwXw/BIHqUZhZbYU6p9CxGC0et3QYJxe+sY2Wa5PsU11OhOagkdZYP2YjfZEU5pV0gYjkfVp0TDhnPjGsKXE4N2SeHnx2aoh5yzL6dJhU8aRI7fs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1623711035;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=TIi57LuH3Pyx3D1cuN2ie+cg1tS+ZLEp7l1VTZlJLhk=; 
 b=NNqlljdGtbJua5bKT6bBpOwyc4qNyKiGbCYVjNWrhYF6Xu/ECchwfc70oz/1ECmrTYDaPS9QLwXQGFCe3uZ7VoB+RHr3l28LhZnb4mw2ETkhtazgZlWCahisxjDXs2T9CvUM5krBnphDDxM5CbB2f+R0uUaLfBgELSavnUhAeD8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1623711034704472.1689603778592;
 Mon, 14 Jun 2021 15:50:34 -0700 (PDT)
In-Reply-To: <20210611162033.437690-1-mcascell@redhat.com>
Subject: Re: [PATCH] Test comment for git-publish
Message-ID: <162371103360.2358.9052256805706339327@7c66fb7bc3ab>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: mcascell@redhat.com
Date: Mon, 14 Jun 2021 15:50:34 -0700 (PDT)
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
Cc: mcascell@redhat.com, qemu-devel@nongnu.org, yuval.shaia.ml@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDYxMTE2MjAzMy40Mzc2
OTAtMS1tY2FzY2VsbEByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhh
dmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUg
aW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMTA2MTExNjIwMzMuNDM3
NjkwLTEtbWNhc2NlbGxAcmVkaGF0LmNvbQpTdWJqZWN0OiBbUEFUQ0hdIFRlc3QgY29tbWVudCBm
b3IgZ2l0LXB1Ymxpc2gKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKZ2l0
IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQgMApnaXQgY29uZmlnIC0tbG9jYWwg
ZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQpn
aXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFtCi4vc2NyaXB0cy9jaGVj
a3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpVcGRh
dGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0ClN3aXRjaGVkIHRv
IGEgbmV3IGJyYW5jaCAndGVzdCcKNjU5NTBkYyBUZXN0IGNvbW1lbnQgZm9yIGdpdC1wdWJsaXNo
Cgo9PT0gT1VUUFVUIEJFR0lOID09PQpFUlJPUjogZG8gbm90IHVzZSBDOTkgLy8gY29tbWVudHMK
IzIxOiBGSUxFOiBody9yZG1hL3Ztdy9wdnJkbWFfbWFpbi5jOjQzMDoKKyAgICAgICAgICAgIHB2
cmRtYV9leGVjX2NtZChkZXYpOyAvLyB0aGlzIGlzIGEgdGVzdCBjb21tZW50CgpFUlJPUjogTWlz
c2luZyBTaWduZWQtb2ZmLWJ5OiBsaW5lKHMpCgp0b3RhbDogMiBlcnJvcnMsIDAgd2FybmluZ3Ms
IDggbGluZXMgY2hlY2tlZAoKQ29tbWl0IDY1OTUwZGNlYTI0ZiAoVGVzdCBjb21tZW50IGZvciBn
aXQtcHVibGlzaCkgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9m
IHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWlu
dGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KPT09IE9VVFBVVCBFTkQgPT09
CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKClRoZSBmdWxsIGxvZyBpcyBhdmFp
bGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAyMTA2MTExNjIwMzMuNDM3NjkwLTEt
bWNhc2NlbGxAcmVkaGF0LmNvbS90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0t
CkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hl
dy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhh
dC5jb20=

