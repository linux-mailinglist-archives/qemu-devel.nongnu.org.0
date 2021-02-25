Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC1B3252B6
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 16:49:18 +0100 (CET)
Received: from localhost ([::1]:54612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFItB-0002nE-FO
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 10:49:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lFIrH-0001UZ-Hh
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 10:47:19 -0500
Resent-Date: Thu, 25 Feb 2021 10:47:19 -0500
Resent-Message-Id: <E1lFIrH-0001UZ-Hh@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lFIrF-0005dE-KL
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 10:47:19 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1614268022; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=VLcSv/aGJqgPFFlPhO/NaEUuQ7Pbr+k6HHVfKnP1YSeYg4O4JdxdeSC/nJLNe/upiJuMrcgvk4jVom18MK8QclmpzzM5XTkcEGDmjZ7VwYqMxhihfSfHceHucD1EgVQmFJ4Vpj4QoKhTQmmofm4kq+xNNgyfR/ID/v/XkcGjJ34=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1614268022;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=lE7ESDQ/iO/cAGp6VUKqHiuvdzXEtncmEcpyrQyc+Hc=; 
 b=fjVNwAE4VsL3mIyKW2JM8zRgq+2Yi79Imk7DxmYNO8fsGCd+X3qGoNI7E8sKUXwF7N0iooHiogA9qjujUeT9FqPPYwilRfmMkmiCExa/3LhmoLKkWso1dNrRxul60N3hSbDLE2hnhBNWrr1HJYWrO3z8PtC7FQOUHljkQKP+8Yc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1614268020912772.8845874882609;
 Thu, 25 Feb 2021 07:47:00 -0800 (PST)
In-Reply-To: <20210225054756.35962-1-linuxmaker@163.com>
Subject: Re: [PATCH] tcg/i386: rdpmc: use the the condtions
Message-ID: <161426801968.1906.17177190400224006153@c667a6b167f6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: linuxmaker@163.com
Date: Thu, 25 Feb 2021 07:47:00 -0800 (PST)
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 ehabkost@redhat.com, linuxmaker@163.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDIyNTA1NDc1Ni4zNTk2
Mi0xLWxpbnV4bWFrZXJAMTYzLmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZl
IHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGlu
Zm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjEwMjI1MDU0NzU2LjM1OTYy
LTEtbGludXhtYWtlckAxNjMuY29tClN1YmplY3Q6IFtQQVRDSF0gdGNnL2kzODY6IHJkcG1jOiB1
c2UgdGhlIHRoZSBjb25kdGlvbnMKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jh
c2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQgMApnaXQgY29uZmlnIC0t
bG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMg
VHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFtCi4vc2NyaXB0
cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNUIFNDUklQVCBFTkQgPT09
CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0ClN3aXRj
aGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKODk1YjhlNyB0Y2cvaTM4NjogcmRwbWM6IHVzZSB0
aGUgdGhlIGNvbmR0aW9ucwoKPT09IE9VVFBVVCBCRUdJTiA9PT0KRVJST1I6IHNwYWNlIHByb2hp
Yml0ZWQgYmVmb3JlIHRoYXQgY2xvc2UgcGFyZW50aGVzaXMgJyknCiMyMjogRklMRTogdGFyZ2V0
L2kzODYvdGNnL21pc2NfaGVscGVyLmM6MjI1OgorICAgIGlmICgoKGVudi0+Y3JbNF0gJiBDUjRf
UENFX01BU0spID09IDAgKSAmJgoKdG90YWw6IDEgZXJyb3JzLCAwIHdhcm5pbmdzLCA5IGxpbmVz
IGNoZWNrZWQKCkNvbW1pdCA4OTViOGU3MWUzMDcgKHRjZy9pMzg2OiByZHBtYzogdXNlIHRoZSB0
aGUgY29uZHRpb25zKSBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkg
b2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1h
aW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgo9PT0gT1VUUFVUIEVORCA9
PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2
YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIxMDIyNTA1NDc1Ni4zNTk2Mi0x
LWxpbnV4bWFrZXJAMTYzLmNvbS90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0t
CkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hl
dy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhh
dC5jb20=

