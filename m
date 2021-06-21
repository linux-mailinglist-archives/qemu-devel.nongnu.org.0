Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3D33AEB44
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 16:29:34 +0200 (CEST)
Received: from localhost ([::1]:55196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvKvb-0004m9-O4
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 10:29:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lvKu7-0003Rx-LL; Mon, 21 Jun 2021 10:27:59 -0400
Resent-Date: Mon, 21 Jun 2021 10:27:59 -0400
Resent-Message-Id: <E1lvKu7-0003Rx-LL@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lvKu5-0001jN-Ro; Mon, 21 Jun 2021 10:27:59 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1624285668; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=NQOf+iMSQ062NndhVQ/rMpZXyZyOft9GkW67mlc4RVCKC8CdCp/osS4iUKjh6G7WjAjtI2R4B2aRkYvjWM8dM4uP6GRns2vnICzBCsJHwyshjCrg7kOoXLaPMCFfMKqtxlLUYMSqd2hZGACGlZx1s32qnZJqdk2iWVaAalqTfVE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1624285668;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=xcnzAeiZ9abb2bELfgGU2xSwA62WHIqb5tumYFXv02E=; 
 b=OZy68gBFBcWJXhBlWttNLbHBwzucvgtBfaeDrcZKcaDqoGwxWhZ65t8hVg44YTXXU0L7c5C/QPBIxbuTsucCrWJRVxCmJr+Qz0ZrS/fRi3H0mRfwRLbcl3PrNXV2nVd4qJNXZuyhhptPZhPrcpYpgZ55CBs1UrmrqdET9XIEO9c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1624285666694824.0002569658069;
 Mon, 21 Jun 2021 07:27:46 -0700 (PDT)
In-Reply-To: <20210621142103.1417408-1-oro@il.ibm.com>
Subject: Re: [PATCH] block/rbd: Add support for rbd image encryption
Message-ID: <162428566565.6049.8269036786615275036@7c66fb7bc3ab>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: oro@il.ibm.com
Date: Mon, 21 Jun 2021 07:27:46 -0700 (PDT)
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
Cc: kwolf@redhat.com, berrange@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, to.my.trociny@gmail.com, oro@il.ibm.com,
 idryomov@gmail.com, dannyh@il.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDYyMTE0MjEwMy4xNDE3
NDA4LTEtb3JvQGlsLmlibS5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2ZSBz
b21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBpbmZv
cm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIxMDYyMTE0MjEwMy4xNDE3NDA4
LTEtb3JvQGlsLmlibS5jb20KU3ViamVjdDogW1BBVENIXSBibG9jay9yYmQ6IEFkZCBzdXBwb3J0
IGZvciByYmQgaW1hZ2UgZW5jcnlwdGlvbgoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9i
aW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2L251bGwgfHwgZXhpdCAwCmdpdCBjb25m
aWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVu
YW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLmFsZ29yaXRobSBoaXN0b2dyYW0KLi9z
Y3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBiYXNlLi4KPT09IFRFU1QgU0NSSVBUIEVO
RCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQK
RnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUKIC0gW3RhZyB1cGRh
dGVdICAgICAgcGF0Y2hldy8yMDIxMDYxNDA4MzgwMC4xMTY2MTY2LTEtcmljaGFyZC5oZW5kZXJz
b25AbGluYXJvLm9yZyAtPiBwYXRjaGV3LzIwMjEwNjE0MDgzODAwLjExNjYxNjYtMS1yaWNoYXJk
LmhlbmRlcnNvbkBsaW5hcm8ub3JnCiAqIFtuZXcgdGFnXSAgICAgICAgIHBhdGNoZXcvMjAyMTA2
MjExNDIxMDMuMTQxNzQwOC0xLW9yb0BpbC5pYm0uY29tIC0+IHBhdGNoZXcvMjAyMTA2MjExNDIx
MDMuMTQxNzQwOC0xLW9yb0BpbC5pYm0uY29tClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVz
dCcKMTlmYWFlZSBibG9jay9yYmQ6IEFkZCBzdXBwb3J0IGZvciByYmQgaW1hZ2UgZW5jcnlwdGlv
bgoKPT09IE9VVFBVVCBCRUdJTiA9PT0KRVJST1I6ICIoZm9vKiopIiBzaG91bGQgYmUgIihmb28g
KiopIgojNjA6IEZJTEU6IGJsb2NrL3JiZC5jOjM3NDoKKyAgICAgICAgICAgIGx1a3Nfb3B0cy0+
a2V5X3NlY3JldCwgKHVpbnQ4X3QqKilwYXNzcGhyYXNlLCBwYXNzcGhyYXNlX2xlbiwgZXJycCk7
Cgp0b3RhbDogMSBlcnJvcnMsIDAgd2FybmluZ3MsIDYwMSBsaW5lcyBjaGVja2VkCgpDb21taXQg
MTlmYWFlZTEyYjZkIChibG9jay9yYmQ6IEFkZCBzdXBwb3J0IGZvciByYmQgaW1hZ2UgZW5jcnlw
dGlvbikgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNl
IGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVy
LCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0
IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUg
YXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAyMTA2MjExNDIxMDMuMTQxNzQwOC0xLW9yb0Bp
bC5pYm0uY29tL3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2Vu
ZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQ
bGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

