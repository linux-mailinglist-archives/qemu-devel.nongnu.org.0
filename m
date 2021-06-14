Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F213A723F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 00:54:06 +0200 (CEST)
Received: from localhost ([::1]:44090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsvT3-0002dk-MG
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 18:54:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lsvSM-0001yI-Ml
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 18:53:22 -0400
Resent-Date: Mon, 14 Jun 2021 18:53:22 -0400
Resent-Message-Id: <E1lsvSM-0001yI-Ml@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lsvSJ-0007c9-TA
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 18:53:22 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1623711187; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=XkqdIDuTwmr9wVCN6odfLbYQF8c95VaKBr6jv5xw5vKP2vrPdXplHsHXb/Y15ZDKUY48r1TdK+6XycFHiiXCDAb4Wy7U/e2HYfmaaxZfmHZTrYiw/oMrboZGtNAH8+qqY8+IHzEuuw+EIecZ8NnqN8B79kXE0HnJtSPqcN4kUbQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1623711187;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=bIwmqQIgEHFJKrFXdTfVOlMcEjLeOqCDy5ynqhlTNdc=; 
 b=FykGfWZ2FALWNxHo33ratnDrb8YH/RwGBnjdQUBLihWwu+j5fPkN6Rn5/XbaBb7WYm/1xFgjsGHKPA67bbokAGHj7/36l3xX48ij261QL3VAKY5+V45+WX54VDBvUbfuoYVf310ojh4zys19Rmre1REvKRkwNHGBCWIp4sv8RK4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1623711186878218.0856868539105;
 Mon, 14 Jun 2021 15:53:06 -0700 (PDT)
In-Reply-To: <20210610085831.19779-1-lizhijian@cn.fujitsu.com>
Subject: Re: [RFC PATCH] migration/rdma: Fix out of order wrid
Message-ID: <162371118578.2358.12447251487494492434@7c66fb7bc3ab>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: lizhijian@cn.fujitsu.com
Date: Mon, 14 Jun 2021 15:53:06 -0700 (PDT)
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
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, lizhijian@cn.fujitsu.com,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDYxMDA4NTgzMS4xOTc3
OS0xLWxpemhpamlhbkBjbi5mdWppdHN1LmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0
byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgpt
b3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjEwNjEwMDg1ODMx
LjE5Nzc5LTEtbGl6aGlqaWFuQGNuLmZ1aml0c3UuY29tClN1YmplY3Q6IFtSRkMgUEFUQ0hdIG1p
Z3JhdGlvbi9yZG1hOiBGaXggb3V0IG9mIG9yZGVyIHdyaWQKCj09PSBURVNUIFNDUklQVCBCRUdJ
TiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQg
MApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2Nh
bCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlz
dG9ncmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNU
IFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJk
ODg4NzEzMzg0ClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKMmQ3Mzk5MSBtaWdyYXRp
b24vcmRtYTogRml4IG91dCBvZiBvcmRlciB3cmlkCgo9PT0gT1VUUFVUIEJFR0lOID09PQpFUlJP
UjogbGluZSBvdmVyIDkwIGNoYXJhY3RlcnMKIzc2OiBGSUxFOiBtaWdyYXRpb24vcmRtYS5jOjE2
MTg6CisgICAgICAgICAgICBpZiAocmRtYS0+b29vX3dyaWQgPj0gUkRNQV9XUklEX1NFTkRfQ09O
VFJPTCAmJiByZG1hLT5vb29fd3JpZCA9PSB3cmlkX3JlcXVlc3RlZCkgewoKRVJST1I6IGxpbmUg
b3ZlciA5MCBjaGFyYWN0ZXJzCiM5MTogRklMRTogbWlncmF0aW9uL3JkbWEuYzoxNjMzOgorICAg
ICAgICAgICAgICAgICAgICBlcnJvcl9yZXBvcnQoIm1vcmUgdGhhbiBvbmUgb3V0IG9mIG9yZGVy
IHdpcmQoJWxkLCAlbGQpIiwgcmRtYS0+b29vX3dyaWQsIHdyX2lkKTsKCkVSUk9SOiBFcnJvciBt
ZXNzYWdlcyBzaG91bGQgbm90IGNvbnRhaW4gbmV3bGluZXMKIzk0OiBGSUxFOiBtaWdyYXRpb24v
cmRtYS5jOjE2MzY6CisgICAgICAgICAgICAgICAgZXJyb3JfcmVwb3J0KCJnZXQgb3V0IG9mIG9y
ZGVyIHdpcmQoJWxkKVxuIiwgd3JfaWQpOwoKdG90YWw6IDMgZXJyb3JzLCAwIHdhcm5pbmdzLCA0
MCBsaW5lcyBjaGVja2VkCgpDb21taXQgMmQ3Mzk5MThlY2M0IChtaWdyYXRpb24vcmRtYTogRml4
IG91dCBvZiBvcmRlciB3cmlkKSBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJ
ZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8g
dGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgo9PT0gT1VUUFVU
IEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9n
IGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIxMDYxMDA4NTgzMS4x
OTc3OS0xLWxpemhpamlhbkBjbi5mdWppdHN1LmNvbS90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9
bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0
dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3
LWRldmVsQHJlZGhhdC5jb20=

