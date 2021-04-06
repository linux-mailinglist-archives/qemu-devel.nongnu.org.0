Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E29355A48
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 19:26:46 +0200 (CEST)
Received: from localhost ([::1]:60710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTpTQ-0003T9-ST
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 13:26:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lTpRu-0002e6-Iu
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 13:25:11 -0400
Resent-Date: Tue, 06 Apr 2021 13:25:10 -0400
Resent-Message-Id: <E1lTpRu-0002e6-Iu@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lTpRo-00040Q-6F
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 13:25:09 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1617729888; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ZaCmIzUcADaLB1IiOnzMKvV8c3IXxwq47c9Wjx8mkCgOIwgEFjT7qHVSCrcUZX2fNM/XK3hEyf0r4ITlLrGy5HTIezKXPGFhsWk+os/r9VjJnI0E7X/CzOICWI4hLabkxwrDjOd+ZqFzJNJB5aAAIRUOgi7JIOud1AY36h1UyT8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1617729888;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=7bag2FDdq/0tGjzWr6lsC1vsh7juIapV/zq/czHbeFk=; 
 b=lWTiHn9+kLhK94YGz6IEqAd8wO9yYuZ0I5IPJpTNTivGPT2LVMD977j5pJcoE5kQ98e8OOu4pal/LiBrxUmLIiXFircEppItwBYxuQcWrn+IwDlbSg19faKaNboqShoJmXzqqJtIPKlMKjifVA3eTp9onS4zfxgGqNOLvOZD+sg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1617729885898565.0522633779807;
 Tue, 6 Apr 2021 10:24:45 -0700 (PDT)
In-Reply-To: <87eefnwd0l.fsf@linaro.org>
Subject: Re: trace_FOO_tcg bit-rotted?
Message-ID: <161772988444.9816.16282613196911297326@72b6d80f974b>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: alex.bennee@linaro.org
Date: Tue, 6 Apr 2021 10:24:45 -0700 (PDT)
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
Cc: matheus.ferst@eldorado.org.br, vilanova@ac.upc.edu, stefanha@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS84N2VlZm53ZDBsLmZzZkBsaW5h
cm8ub3JnLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhhdmUgc29tZSBjb2Rpbmcgc3R5
bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUgaW5mb3JtYXRpb246CgpUeXBl
OiBzZXJpZXMKTWVzc2FnZS1pZDogODdlZWZud2QwbC5mc2ZAbGluYXJvLm9yZwpTdWJqZWN0OiB0
cmFjZV9GT09fdGNnIGJpdC1yb3R0ZWQ/Cgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jp
bi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNvbmZp
ZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5h
bWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQouL3Nj
cmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQgRU5E
ID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApG
cm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdQogLSBbdGFnIHVwZGF0
ZV0gICAgICBwYXRjaGV3LzIwMjEwMzI5MTUwMTI5LjEyMTE4Mi0xLXNnYXJ6YXJlQHJlZGhhdC5j
b20gLT4gcGF0Y2hldy8yMDIxMDMyOTE1MDEyOS4xMjExODItMS1zZ2FyemFyZUByZWRoYXQuY29t
CiAqIFtuZXcgdGFnXSAgICAgICAgIHBhdGNoZXcvODdlZWZud2QwbC5mc2ZAbGluYXJvLm9yZyAt
PiBwYXRjaGV3Lzg3ZWVmbndkMGwuZnNmQGxpbmFyby5vcmcKU3dpdGNoZWQgdG8gYSBuZXcgYnJh
bmNoICd0ZXN0Jwo4MDBiNzMwIHRyYWNlX0ZPT190Y2cgYml0LXJvdHRlZD8KCj09PSBPVVRQVVQg
QkVHSU4gPT09CkVSUk9SOiBNaXNzaW5nIFNpZ25lZC1vZmYtYnk6IGxpbmUocykKCnRvdGFsOiAx
IGVycm9ycywgMCB3YXJuaW5ncywgMjYgbGluZXMgY2hlY2tlZAoKQ29tbWl0IDgwMGI3MzBjODQ5
ZiAodHJhY2VfRk9PX3RjZyBiaXQtcm90dGVkPykgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2Ug
cmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9y
dCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4K
PT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKClRo
ZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvODdlZWZu
d2QwbC5mc2ZAbGluYXJvLm9yZy90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0t
CkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hl
dy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhh
dC5jb20=

