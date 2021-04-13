Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CE235E4B7
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 19:10:05 +0200 (CEST)
Received: from localhost ([::1]:39992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWMY8-0005r8-FB
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 13:10:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lWMUL-0003Bk-KO
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 13:06:09 -0400
Resent-Date: Tue, 13 Apr 2021 13:06:09 -0400
Resent-Message-Id: <E1lWMUL-0003Bk-KO@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lWMU6-0008Pq-BS
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 13:06:08 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1618333544; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=l9mQOyLyhmsA17P0+0D1DllHpfqOFRuVSgN13P+atphY6LNsgbn30E7v5HgTpskdO46SKUZjwImHLk7heaCFo+q15k3rneOAqOMRsED7VhNIwnBWhQ6zLjFuSbem7Pdz5lfBqctYpvf3UwIcY5WyO+A0QectRLtWGHBoj+tY7BE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1618333544;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=Pikw0mGEw5p2rClQIuy9SSbTwv+BPOfbfvBUbAr6WnQ=; 
 b=DF5iPpgpBBMUysRb66iSRkizZDGpuMYc0Pja4U4hGhGbP4vdLXO9+brJsH8fhG7b22C1k034K7XclxRSDeJzRn61tZRlW+debKPYbRhCRi1W8n/gbFNynhl6SD9XR8ohkb1y6ludlQLA8WRoDxaRSuAkZyv6Q2Xg+nAV105JdEI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1618333536953223.87731431486793;
 Tue, 13 Apr 2021 10:05:36 -0700 (PDT)
In-Reply-To: <20210413160850.240064-1-pbonzini@redhat.com>
Subject: Re: [PULL v2 0/3] osdep.h + QOM changes for QEMU 6.0-rc3
Message-ID: <161833353579.10350.18278026278164568995@72b6d80f974b>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: pbonzini@redhat.com
Date: Tue, 13 Apr 2021 10:05:36 -0700 (PDT)
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDQxMzE2MDg1MC4yNDAw
NjQtMS1wYm9uemluaUByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhh
dmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUg
aW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMTA0MTMxNjA4NTAuMjQw
MDY0LTEtcGJvbnppbmlAcmVkaGF0LmNvbQpTdWJqZWN0OiBbUFVMTCB2MiAwLzNdIG9zZGVwLmgg
KyBRT00gY2hhbmdlcyBmb3IgUUVNVSA2LjAtcmMzCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09
CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0
IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlm
Zi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3Jh
bQouL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJ
UFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcx
MzM4NApTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCjQ4NzcyMmEgcWFwaS9xb20uanNv
bjogRG8gbm90IHVzZSBDT05GSUdfVklSVElPX0NSWVBUTyBpbiBjb21tb24gY29kZQo1ODhmNjFm
IG9zZGVwOiBwcm90ZWN0IHFlbXUvb3NkZXAuaCB3aXRoIGV4dGVybiAiQyIKNTMxNjMyNyBvc2Rl
cDogaW5jbHVkZSBnbGliLWNvbXBhdC5oIGJlZm9yZSBvdGhlciBRRU1VIGhlYWRlcnMKCj09PSBP
VVRQVVQgQkVHSU4gPT09CjEvMyBDaGVja2luZyBjb21taXQgNTMxNjMyNzUxOWE3IChvc2RlcDog
aW5jbHVkZSBnbGliLWNvbXBhdC5oIGJlZm9yZSBvdGhlciBRRU1VIGhlYWRlcnMpCjIvMyBDaGVj
a2luZyBjb21taXQgNTg4ZjYxZmVhOWFlIChvc2RlcDogcHJvdGVjdCBxZW11L29zZGVwLmggd2l0
aCBleHRlcm4gIkMiKQpXQVJOSU5HOiBhcmNoaXRlY3R1cmUgc3BlY2lmaWMgZGVmaW5lcyBzaG91
bGQgYmUgYXZvaWRlZAojNTE6IEZJTEU6IGluY2x1ZGUvcWVtdS9jb21waWxlci5oOjE0OgorI2lm
ZGVmIF9fY3BsdXNwbHVzCgpFUlJPUjogc3RvcmFnZSBjbGFzcyBzaG91bGQgYmUgYXQgdGhlIGJl
Z2lubmluZyBvZiB0aGUgZGVjbGFyYXRpb24KIzUyOiBGSUxFOiBpbmNsdWRlL3FlbXUvY29tcGls
ZXIuaDoxNToKKyNkZWZpbmUgUUVNVV9FWFRFUk5fQyBleHRlcm4gIkMiCgpFUlJPUjogc3RvcmFn
ZSBjbGFzcyBzaG91bGQgYmUgYXQgdGhlIGJlZ2lubmluZyBvZiB0aGUgZGVjbGFyYXRpb24KIzU0
OiBGSUxFOiBpbmNsdWRlL3FlbXUvY29tcGlsZXIuaDoxNzoKKyNkZWZpbmUgUUVNVV9FWFRFUk5f
QyBleHRlcm4KCldBUk5JTkc6IGFyY2hpdGVjdHVyZSBzcGVjaWZpYyBkZWZpbmVzIHNob3VsZCBi
ZSBhdm9pZGVkCiM3NzogRklMRTogaW5jbHVkZS9xZW11L29zZGVwLmg6MTE2OgorI2lmZGVmIF9f
Y3BsdXNwbHVzCgpXQVJOSU5HOiBhcmNoaXRlY3R1cmUgc3BlY2lmaWMgZGVmaW5lcyBzaG91bGQg
YmUgYXZvaWRlZAojODg6IEZJTEU6IGluY2x1ZGUvcWVtdS9vc2RlcC5oOjczMDoKKyNpZmRlZiBf
X2NwbHVzcGx1cwoKdG90YWw6IDIgZXJyb3JzLCAzIHdhcm5pbmdzLCA0NyBsaW5lcyBjaGVja2Vk
CgpQYXRjaCAyLzMgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9m
IHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWlu
dGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KCjMvMyBDaGVja2luZyBjb21t
aXQgNDg3NzIyYTNkNGVmIChxYXBpL3FvbS5qc29uOiBEbyBub3QgdXNlIENPTkZJR19WSVJUSU9f
Q1JZUFRPIGluIGNvbW1vbiBjb2RlKQo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBl
eGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8v
cGF0Y2hldy5vcmcvbG9ncy8yMDIxMDQxMzE2MDg1MC4yNDAwNjQtMS1wYm9uemluaUByZWRoYXQu
Y29tL3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVk
IGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ug
c2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

