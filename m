Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CE13A173B
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 16:29:21 +0200 (CEST)
Received: from localhost ([::1]:48926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqzCr-00082v-15
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 10:29:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lqzC9-0007Og-6W
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:28:37 -0400
Resent-Date: Wed, 09 Jun 2021 10:28:37 -0400
Resent-Message-Id: <E1lqzC9-0007Og-6W@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lqzC6-0002Gz-C0
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:28:36 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1623248908; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ZJX8h1hCz2pLi5cJ8eCHC+6QBP1BsIDs6ptsMzCnKsWCBxLYPKwGndAXh29nNpqgzc5oI0DETboLABuDbrGXJsBH7waoI50+x+PZMLa9KdtVX+WmWmmvk7/QcXwGMPg3qw+XvnqwEoVAB+X0g2nSdDotE5zZJFYYUJbn3sj90v4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1623248908;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=5YoqTqLktjNNpymKQ1yPlGcBL1K08Q48AReZEn1uWQw=; 
 b=W/bC/w9EGHcSKNF+MYcJvpBZQpHEtj8Y4ofqokCdvIjLbNIGQxrBRjjCgNx7d5PbDBP/+r0safjY0G8wH7P6BZeVLgLNKmxncIKBr8RwRkZ/4t8KT7tVaaMz3ry3+P8xXQQU3ZpadOtSloI68Uvqyixiw7MXjv72IIkHnXBtqGc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1623248906126651.5398266463787;
 Wed, 9 Jun 2021 07:28:26 -0700 (PDT)
In-Reply-To: <20210607232530.454435-1-vivek.kasireddy@intel.com>
Subject: Re: [PATCH v1 0/5] virtio-gpu: Add implicit (and default) sync
 mechanism for blobs
Message-ID: <162324890492.6796.2380315237701208135@d310de11c650>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: vivek.kasireddy@intel.com
Date: Wed, 9 Jun 2021 07:28:26 -0700 (PDT)
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
Cc: kraxel@redhat.com, tina.zhang@intel.com, vivek.kasireddy@intel.com,
 qemu-devel@nongnu.org, dongwon.kim@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDYwNzIzMjUzMC40NTQ0
MzUtMS12aXZlay5rYXNpcmVkZHlAaW50ZWwuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1z
IHRvIGhhdmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9y
Cm1vcmUgaW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMTA2MDcyMzI1
MzAuNDU0NDM1LTEtdml2ZWsua2FzaXJlZGR5QGludGVsLmNvbQpTdWJqZWN0OiBbUEFUQ0ggdjEg
MC81XSB2aXJ0aW8tZ3B1OiBBZGQgaW1wbGljaXQgKGFuZCBkZWZhdWx0KSBzeW5jIG1lY2hhbmlz
bSBmb3IgYmxvYnMKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJl
di1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlm
Zi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQg
Y29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFtCi4vc2NyaXB0cy9jaGVja3Bh
dGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpVcGRhdGlu
ZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0ClN3aXRjaGVkIHRvIGEg
bmV3IGJyYW5jaCAndGVzdCcKMjU1YmJlZSB2aXJ0aW8tZ3B1OiBNYWtlIHJlc291cmNlX2ZsdXNo
IHdhaXQgb24gdGhlIHN5bmMgb2JqZWN0IGZvciBibG9icwo2MGQ4MGJkIHVpOiBDcmVhdGUgc3lu
YyBvYmplY3RzIG9ubHkgZm9yIGJsb2JzCmZkNGM1MDMgdWkvZWdsOiBBZGQgZWdsIGhlbHBlcnMg
dG8gaGVscCB3aXRoIHN5bmNocm9uaXphdGlvbgpmYWVkMzdlIHVpOiBBZGQgYSBoZWxwZXIgdG8g
d2FpdCBvbiBhIGRtYWJ1ZiBzeW5jIG9iamVjdAo5ZjlhNmM2IHVpL2d0azogQ3JlYXRlIGEgY29t
bW9uIHJlbGVhc2VfZG1hYnVmIGhlbHBlcgoKPT09IE9VVFBVVCBCRUdJTiA9PT0KMS81IENoZWNr
aW5nIGNvbW1pdCA5ZjlhNmM2YzQ1OTMgKHVpL2d0azogQ3JlYXRlIGEgY29tbW9uIHJlbGVhc2Vf
ZG1hYnVmIGhlbHBlcikKMi81IENoZWNraW5nIGNvbW1pdCBmYWVkMzdlYzg5ZGMgKHVpOiBBZGQg
YSBoZWxwZXIgdG8gd2FpdCBvbiBhIGRtYWJ1ZiBzeW5jIG9iamVjdCkKMy81IENoZWNraW5nIGNv
bW1pdCBmZDRjNTAzOTJmYTMgKHVpL2VnbDogQWRkIGVnbCBoZWxwZXJzIHRvIGhlbHAgd2l0aCBz
eW5jaHJvbml6YXRpb24pCkVSUk9SOiBjb2RlIGluZGVudCBzaG91bGQgbmV2ZXIgdXNlIHRhYnMK
IzY0OiBGSUxFOiB1aS9lZ2wtaGVscGVycy5jOjg4OgorXkleSV5JXklFR0xfU1lOQ19OQVRJVkVf
RkVOQ0VfQU5EUk9JRCwgTlVMTCk7JAoKdG90YWw6IDEgZXJyb3JzLCAwIHdhcm5pbmdzLCAxMDAg
bGluZXMgY2hlY2tlZAoKUGF0Y2ggMy81IGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmll
dy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhl
bSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCgo0LzUg
Q2hlY2tpbmcgY29tbWl0IDYwZDgwYmQzNmYyMyAodWk6IENyZWF0ZSBzeW5jIG9iamVjdHMgb25s
eSBmb3IgYmxvYnMpCjUvNSBDaGVja2luZyBjb21taXQgMjU1YmJlZTgxZGUzICh2aXJ0aW8tZ3B1
OiBNYWtlIHJlc291cmNlX2ZsdXNoIHdhaXQgb24gdGhlIHN5bmMgb2JqZWN0IGZvciBibG9icykK
PT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKClRo
ZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAyMTA2
MDcyMzI1MzAuNDU0NDM1LTEtdml2ZWsua2FzaXJlZGR5QGludGVsLmNvbS90ZXN0aW5nLmNoZWNr
cGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5
IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFj
ayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

