Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 598D33A71F1
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 00:31:49 +0200 (CEST)
Received: from localhost ([::1]:50536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsv7U-0003h6-FO
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 18:31:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lsv6T-00030y-G4
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 18:30:45 -0400
Resent-Date: Mon, 14 Jun 2021 18:30:45 -0400
Resent-Message-Id: <E1lsv6T-00030y-G4@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lsv6P-0001pM-N0
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 18:30:45 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1623709832; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=cXtdzH3rSY4eSxWqI4KAhjpppiaBf7pKQ/coexYfJPqzGVthSpLD2lU6Zf0ufjsDeJUQnXqNJCKz1yCq71pYffPp3xZdbsl3j1NdaGpw8iEXXBYfO/hACTnqjAT9aHk1+wVIvBPBVEqpLN4X9MQlQjW4JlpEnMsKtpU7kBt7lCg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1623709832;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=Q3NrorXBi4fm+jkzus8pCwvu0kwWOh4wKVSzfCfbits=; 
 b=VWDEueYF2PZ5hAV5L7hXtEmzvICWJra1adBFmAPTbsvJHBl5CsGdFYLXHdSLbUWgTXZss+o5x/qlDP4aJCzBokQA1Nq6pswOTOxF2RYOuJ7/y24jO9dUIuA1E6PvEoMyElIYKFj+kaub7kQLGLTu3LUD4VQOX+UYYbK1htlzhp0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1623709829516103.3545568752487;
 Mon, 14 Jun 2021 15:30:29 -0700 (PDT)
In-Reply-To: <20210611164305.440633-1-mcascell@redhat.com>
Subject: Re: [PATCH v2] Test comment for git-publish
Message-ID: <162370982844.2358.7497742131893674982@7c66fb7bc3ab>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: mcascell@redhat.com
Date: Mon, 14 Jun 2021 15:30:29 -0700 (PDT)
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
Cc: mcascell@redhat.com, yuval.shaia.ml@gmail.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDYxMTE2NDMwNS40NDA2
MzMtMS1tY2FzY2VsbEByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhh
dmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUg
aW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMTA2MTExNjQzMDUuNDQw
NjMzLTEtbWNhc2NlbGxAcmVkaGF0LmNvbQpTdWJqZWN0OiBbUEFUQ0ggdjJdIFRlc3QgY29tbWVu
dCBmb3IgZ2l0LXB1Ymxpc2gKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gK
Z2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQgMApnaXQgY29uZmlnIC0tbG9j
YWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1
ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFtCi4vc2NyaXB0cy9j
aGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpV
cGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0ClN3aXRjaGVk
IHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKYmY3ODRmNCBUZXN0IGNvbW1lbnQgZm9yIGdpdC1wdWJs
aXNoCgo9PT0gT1VUUFVUIEJFR0lOID09PQpFUlJPUjogZG8gbm90IHVzZSBDOTkgLy8gY29tbWVu
dHMKIzIxOiBGSUxFOiBody9yZG1hL3Ztdy9wdnJkbWFfbWFpbi5jOjQzMDoKKyAgICAgICAgICAg
IHB2cmRtYV9leGVjX2NtZChkZXYpOyAvLyB0aGlzIGlzIGEgdGVzdCBjb21tZW50CgpFUlJPUjog
TWlzc2luZyBTaWduZWQtb2ZmLWJ5OiBsaW5lKHMpCgp0b3RhbDogMiBlcnJvcnMsIDAgd2Fybmlu
Z3MsIDggbGluZXMgY2hlY2tlZAoKQ29tbWl0IGJmNzg0ZjQ4YWM1ZiAoVGVzdCBjb21tZW50IGZv
ciBnaXQtcHVibGlzaCkgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55
IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBt
YWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KPT09IE9VVFBVVCBFTkQg
PT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKClRoZSBmdWxsIGxvZyBpcyBh
dmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAyMTA2MTExNjQzMDUuNDQwNjMz
LTEtbWNhc2NlbGxAcmVkaGF0LmNvbS90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4K
LS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0
Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJl
ZGhhdC5jb20=

