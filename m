Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE15D340887
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 16:15:19 +0100 (CET)
Received: from localhost ([::1]:54610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMuMo-0002Nt-PH
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 11:15:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lMuKo-0000UP-Dv
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 11:13:14 -0400
Resent-Date: Thu, 18 Mar 2021 11:13:14 -0400
Resent-Message-Id: <E1lMuKo-0000UP-Dv@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lMuKk-0004lR-Ez
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 11:13:13 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1616080374; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=fRF/jhNBukiftEs/+IQMhQBmU6s0xl6k3hiBwiBjCwxBMewxFSzoSZbe9ceChErRbTR10M4SRLOiflsbEbmf3oAsItSruyrbJzst0T0l85TtiRWb+BLcrQEsWxpGMALUHI5N6Xsdj+tk18fK/CFhuQYKKPd+/f6NmA/R6dEwDm8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1616080374;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=Y3YFdqqZj01+KQ1Zkgtirl6RuZyugJ+6Zc5Q6Vty9p8=; 
 b=LcZ7bPqPIZ8+jkR3U2y++hPfVJiKVkVjtOVEJW9nCGzegPiXMfOEAfMSz+WeKyC00wOWgSVX80UGUdJo9TRodUSmE2aeCphk2tvHVxXN5C1YftXkUmgygQeq78+1o5rWFqBnB13zvjFOYhEvhRaZd6g8Y4gBmEVyz7OrNgtglU4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1616080370137239.19576191690783;
 Thu, 18 Mar 2021 08:12:50 -0700 (PDT)
In-Reply-To: <20210318150022.1824646-1-pbonzini@redhat.com>
Subject: Re: [PATCH 0/3] target/i386: kvm-unit-tests fixes related to page
 table lookup
Message-ID: <161608036821.12522.8466663518234857979@c9d4d6fbb2f1>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: pbonzini@redhat.com
Date: Thu, 18 Mar 2021 08:12:50 -0700 (PDT)
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

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDMxODE1MDAyMi4xODI0
NjQ2LTEtcGJvbnppbmlAcmVkaGF0LmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBo
YXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3Jl
IGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjEwMzE4MTUwMDIyLjE4
MjQ2NDYtMS1wYm9uemluaUByZWRoYXQuY29tClN1YmplY3Q6IFtQQVRDSCAwLzNdIHRhcmdldC9p
Mzg2OiBrdm0tdW5pdC10ZXN0cyBmaXhlcyByZWxhdGVkIHRvIHBhZ2UgdGFibGUgbG9va3VwCgo9
PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+
IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQg
MApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2Fs
IGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQouL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxi
YWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFm
Zjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRj
aGV3LXByb2plY3QvcWVtdQogICBiMTI0OThmLi4xZGIxMzZhICBtYXN0ZXIgICAgIC0+IG1hc3Rl
cgogLSBbdGFnIHVwZGF0ZV0gICAgICBwYXRjaGV3LzIwMjEwMzE3MDMyMjE3LjE0NjA2ODQtMS1t
aWNoYWVsLnJvdGhAYW1kLmNvbSAtPiBwYXRjaGV3LzIwMjEwMzE3MDMyMjE3LjE0NjA2ODQtMS1t
aWNoYWVsLnJvdGhAYW1kLmNvbQogLSBbdGFnIHVwZGF0ZV0gICAgICBwYXRjaGV3LzIwMjEwMzE3
MDM1MjQyLjI0NDE4LTEtY3Jvc2FAcmVkaGF0LmNvbSAtPiBwYXRjaGV3LzIwMjEwMzE3MDM1MjQy
LjI0NDE4LTEtY3Jvc2FAcmVkaGF0LmNvbQogKiBbbmV3IHRhZ10gICAgICAgICBwYXRjaGV3LzIw
MjEwMzE4MTUwMDIyLjE4MjQ2NDYtMS1wYm9uemluaUByZWRoYXQuY29tIC0+IHBhdGNoZXcvMjAy
MTAzMTgxNTAwMjIuMTgyNDY0Ni0xLXBib256aW5pQHJlZGhhdC5jb20KU3dpdGNoZWQgdG8gYSBu
ZXcgYnJhbmNoICd0ZXN0JwoyYjg1MGQxIHRhcmdldC9pMzg2OiBzdm06IGRvIG5vdCBkaXNjYXJk
IGhpZ2ggMzIgYml0cyBvZiBFWElUSU5GTzEKOTg3MGVhNiB0YXJnZXQvaTM4NjogZmFpbCBpZiB0
b2dnbGluZyBMQTU3IGluIDY0LWJpdCBtb2RlCjdjNWNhMGIgdGFyZ2V0L2kzODY6IGFsbG93IG1v
ZGlmeWluZyBUQ0cgcGh5cy1hZGRyLWJpdHMKCj09PSBPVVRQVVQgQkVHSU4gPT09CjEvMyBDaGVj
a2luZyBjb21taXQgN2M1Y2EwYjRiNmJkICh0YXJnZXQvaTM4NjogYWxsb3cgbW9kaWZ5aW5nIFRD
RyBwaHlzLWFkZHItYml0cykKMi8zIENoZWNraW5nIGNvbW1pdCA5ODcwZWE2NTU2YzYgKHRhcmdl
dC9pMzg2OiBmYWlsIGlmIHRvZ2dsaW5nIExBNTcgaW4gNjQtYml0IG1vZGUpCkVSUk9SOiBzdXNw
ZWN0IGNvZGUgaW5kZW50IGZvciBjb25kaXRpb25hbCBzdGF0ZW1lbnRzICg4LCAxMykKIzIzOiBG
SUxFOiB0YXJnZXQvaTM4Ni90Y2cvbWlzY19oZWxwZXIuYzoxNzA6CisgICAgICAgIGlmICgoKHQw
IF4gZW52LT5jcls0XSkgJiBDUjRfTEE1N19NQVNLKSAmJgpbLi4uXQorICAgICAgICAgICAgIHJh
aXNlX2V4Y2VwdGlvbl9yYShlbnYsIEVYQ1AwRF9HUEYsIEdFVFBDKCkpOwoKdG90YWw6IDEgZXJy
b3JzLCAwIHdhcm5pbmdzLCAxMCBsaW5lcyBjaGVja2VkCgpQYXRjaCAyLzMgaGFzIHN0eWxlIHBy
b2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2Ug
cG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBp
biBNQUlOVEFJTkVSUy4KCjMvMyBDaGVja2luZyBjb21taXQgMmI4NTBkMWU2YWM5ICh0YXJnZXQv
aTM4Njogc3ZtOiBkbyBub3QgZGlzY2FyZCBoaWdoIDMyIGJpdHMgb2YgRVhJVElORk8xKQo9PT0g
T1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1
bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIxMDMxODE1
MDAyMi4xODI0NjQ2LTEtcGJvbnppbmlAcmVkaGF0LmNvbS90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5
cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcg
W2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRj
aGV3LWRldmVsQHJlZGhhdC5jb20=

