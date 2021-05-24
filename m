Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DEA38E577
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 13:28:51 +0200 (CEST)
Received: from localhost ([::1]:35692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll8lN-0000xd-R3
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 07:28:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1ll8kY-0000FS-BX
 for qemu-devel@nongnu.org; Mon, 24 May 2021 07:27:58 -0400
Resent-Date: Mon, 24 May 2021 07:27:58 -0400
Resent-Message-Id: <E1ll8kY-0000FS-BX@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1ll8kW-00079d-0Q
 for qemu-devel@nongnu.org; Mon, 24 May 2021 07:27:58 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1621855670; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=DClWPq5u/AQghthZO0FT6FAgfVQj3kvYFuZNU5Ur2i0XWyLQO5AhWirTdQthZKPtU3ztF0PmkCdyXcdAjP1YkC1ZdSOwVaYSa3pU3a7Mc1k8Ciu/nhWxmalc9T72ptAIxt0dKBtvm45sO/S18g50E4K3movPTKruQFsO+nyKudU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1621855670;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=tggB6WF/yhm+Cp/X/FfaG8cgzS0fkcDMoMVAfZi8/PY=; 
 b=OFbNTq8O/PnzhwK7m4T8cmYD00wvZtXmWPjZAeqzQwOLp2HUDzdOPJI00JEFXWvbAHxsMCcwFZsvfamXKspaEU/yrDxSc+j/uh7kHXB7Bcal5sVdlXWR0h+f1eUur/H+GZq0dCTSoDRO5Es5HA71HwoeiDXLoza44l/cLdimAQU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1621855668030314.88357344451947;
 Mon, 24 May 2021 04:27:48 -0700 (PDT)
In-Reply-To: <20210524112323.2310-1-alex.bennee@linaro.org>
Subject: Re: [RFC PATCH] linux-user: glib-ify is_proc_myself
Message-ID: <162185566691.1840.2916700102735860729@0addf061776e>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: alex.bennee@linaro.org
Date: Mon, 24 May 2021 04:27:48 -0700 (PDT)
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
Cc: yamamoto@midokura.com, alex.bennee@linaro.org, qemu-devel@nongnu.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDUyNDExMjMyMy4yMzEw
LTEtYWxleC5iZW5uZWVAbGluYXJvLm9yZy8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBo
YXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3Jl
IGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjEwNTI0MTEyMzIzLjIz
MTAtMS1hbGV4LmJlbm5lZUBsaW5hcm8ub3JnClN1YmplY3Q6IFtSRkMgUEFUQ0hdIGxpbnV4LXVz
ZXI6IGdsaWItaWZ5IGlzX3Byb2NfbXlzZWxmCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMh
L2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNv
bmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5y
ZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQou
L3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQg
RU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4
NApGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdQogKiBbbmV3IHRh
Z10gICAgICAgICBwYXRjaGV3LzIwMjEwNTI0MTEyMzIzLjIzMTAtMS1hbGV4LmJlbm5lZUBsaW5h
cm8ub3JnIC0+IHBhdGNoZXcvMjAyMTA1MjQxMTIzMjMuMjMxMC0xLWFsZXguYmVubmVlQGxpbmFy
by5vcmcKU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0Jwo0ZTAwNzZmIGxpbnV4LXVzZXI6
IGdsaWItaWZ5IGlzX3Byb2NfbXlzZWxmCgo9PT0gT1VUUFVUIEJFR0lOID09PQpFUlJPUjogImZv
byAqIGJhciIgc2hvdWxkIGJlICJmb28gKmJhciIKIzQzOiBGSUxFOiBsaW51eC11c2VyL3N5c2Nh
bGwuYzo3OTk2OgorICAgICAgICAgICAgZ19hdXRvZnJlZSBjaGFyICogbXlzZWxmID0gZ19zdHJk
dXBfcHJpbnRmKCIlZC8iLCBnZXRwaWQoKSk7Cgp0b3RhbDogMSBlcnJvcnMsIDAgd2FybmluZ3Ms
IDUyIGxpbmVzIGNoZWNrZWQKCkNvbW1pdCA0ZTAwNzZmYWQyN2UgKGxpbnV4LXVzZXI6IGdsaWIt
aWZ5IGlzX3Byb2NfbXlzZWxmKSBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJ
ZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8g
dGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgo9PT0gT1VUUFVU
IEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9n
IGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIxMDUyNDExMjMyMy4y
MzEwLTEtYWxleC5iZW5uZWVAbGluYXJvLm9yZy90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVz
c2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBz
Oi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRl
dmVsQHJlZGhhdC5jb20=

