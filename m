Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0E52E3489
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 07:38:18 +0100 (CET)
Received: from localhost ([::1]:51894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktmAb-0006W9-AE
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 01:38:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1ktm9a-00065T-T6
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 01:37:15 -0500
Resent-Date: Mon, 28 Dec 2020 01:37:14 -0500
Resent-Message-Id: <E1ktm9a-00065T-T6@lists.gnu.org>
Received: from sender4-of-o57.zoho.com ([136.143.188.57]:21746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1ktm9Y-0002yX-5G
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 01:37:14 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1609137412; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=FmGjLAAWGgaXBU7jSRDiS1BY04mucRbmL15x7MK4wMN83L6iS5e5GeEOgjtcmFxaOF676Wrzn+nimZstfXFJIP2NFLh4Cxwb+QPKR5YiUeaYak0I5NWyY6aizwZYThMk3dX9DTWKdLpwIct/Q/ASiIrkm/BpkPHjc/ElGvzG7s4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1609137412;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=lfnom0tONwm39hOUaXKeiBgQLbTxK9Vx6z/Y10orF2E=; 
 b=Wt06Q8nVaynEUwk6pefil2uEqCacCPNMO8Spp8EBkhALJ06SAWbIeQbKjiGNJzPmnGW+EAUzT7pOSRWxqcmMeJHZUWW7YH3xy6t0dqqCgzo6QS9gaOzkLtmTUxaVk7Kyw8zLOjt6D+j+SL5BvPe/5BK3CjwbhikKIp2h2M1/uBE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1609137405365210.11860196775137;
 Sun, 27 Dec 2020 22:36:45 -0800 (PST)
In-Reply-To: <ME3P282MB17458B2705C43E860A26171DFCD90@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
Subject: Re: [PATCH v2 0/7] fuzz: improve crash case minimization
Message-ID: <160913740414.10865.3882457129063578218@600e7e483b3a>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: Qiuhao.Li@outlook.com
Date: Sun, 27 Dec 2020 22:36:45 -0800 (PST)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.57; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o57.zoho.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: thuth@redhat.com, darren.kenny@oracle.com, qemu-devel@nongnu.org,
 alxndr@bu.edu, bsd@redhat.com, stefanha@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS9NRTNQMjgyTUIxNzQ1OEIyNzA1
QzQzRTg2MEEyNjE3MURGQ0Q5MEBNRTNQMjgyTUIxNzQ1LkFVU1AyODIuUFJPRC5PVVRMT09LLkNP
TS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHBy
b2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2Vy
aWVzCk1lc3NhZ2UtaWQ6IE1FM1AyODJNQjE3NDU4QjI3MDVDNDNFODYwQTI2MTcxREZDRDkwQE1F
M1AyODJNQjE3NDUuQVVTUDI4Mi5QUk9ELk9VVExPT0suQ09NClN1YmplY3Q6IFtQQVRDSCB2MiAw
LzddIGZ1eno6IGltcHJvdmUgY3Jhc2ggY2FzZSBtaW5pbWl6YXRpb24KCj09PSBURVNUIFNDUklQ
VCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8
IGV4aXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcg
LS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0
aG0gaGlzdG9ncmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09
PSBURVNUIFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVm
N2Y0NGJkODg4NzEzMzg0CkZyb20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9x
ZW11CiAqIFtuZXcgdGFnXSAgICAgICAgIHBhdGNoZXcvTUUzUDI4Mk1CMTc0NThCMjcwNUM0M0U4
NjBBMjYxNzFERkNEOTBATUUzUDI4Mk1CMTc0NS5BVVNQMjgyLlBST0QuT1VUTE9PSy5DT00gLT4g
cGF0Y2hldy9NRTNQMjgyTUIxNzQ1OEIyNzA1QzQzRTg2MEEyNjE3MURGQ0Q5MEBNRTNQMjgyTUIx
NzQ1LkFVU1AyODIuUFJPRC5PVVRMT09LLkNPTQpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rl
c3QnCmRkYWQ5YjkgZnV6ejogaGV1cmlzdGljIHNwbGl0IHdyaXRlIGJhc2VkIG9uIHBhc3QgSU9z
CjlmZjk5ZjggZnV6ejogYWRkIG1pbmltaXphdGlvbiBvcHRpb25zCmZmMDE1ZDEgZnV6ejogc2V0
IGJpdHMgaW4gb3BlcmFuZCBvZiB3cml0ZS9vdXQgdG8gemVybwpmZDU3MjI3IGZ1eno6IGxvb3Ag
dGhlIHJlbW92ZSBtaW5pbWl6ZXIgYW5kIHJlZmFjdG9yaW5nCmQ5NTZmMzggZnV6ejogc3BsaXQg
d3JpdGUgb3BlcmFuZCB1c2luZyBiaW5hcnkgYXBwcm9hY2gKMDZlYTYyMiBmdXp6OiBkb3VibGUg
dGhlIElPcyB0byByZW1vdmUgZm9yIGV2ZXJ5IGxvb3AKNmU3NzA4ZCBmdXp6OiBhY2NlbGVyYXRl
IG5vbi1jcmFzaCBkZXRlY3Rpb24KCj09PSBPVVRQVVQgQkVHSU4gPT09CjEvNyBDaGVja2luZyBj
b21taXQgNmU3NzA4ZGIzMmQzIChmdXp6OiBhY2NlbGVyYXRlIG5vbi1jcmFzaCBkZXRlY3Rpb24p
CkVSUk9SOiB0cmFpbGluZyB3aGl0ZXNwYWNlCiMzODogRklMRTogc2NyaXB0cy9vc3MtZnV6ei9t
aW5pbWl6ZV9xdGVzdF90cmFjZS5weTozNDoKK2NyYXNoIG91dHB1dCBidXQgaW5kaWNhdGVzIHRo
ZSBzYW1lIGJ1Zy4gVW5kZXIgdGhpcyBzaXR1YXRpb24sIG91ciBtaW5pbWl6ZXIgaXMgJAoKRVJS
T1I6IHRyYWlsaW5nIHdoaXRlc3BhY2UKIzM5OiBGSUxFOiBzY3JpcHRzL29zcy1mdXp6L21pbmlt
aXplX3F0ZXN0X3RyYWNlLnB5OjM1OgoraW5jYXBhYmxlIG9mIHJlY29nbml6aW5nIGFuZCBzdG9w
cGVkIGZyb20gcmVtb3ZpbmcgaXQuIEluIHRoZSBmdXR1cmUsIHdlIG1heSAkCgp0b3RhbDogMiBl
cnJvcnMsIDAgd2FybmluZ3MsIDY1IGxpbmVzIGNoZWNrZWQKClBhdGNoIDEvNyBoYXMgc3R5bGUg
cHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxz
ZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENI
IGluIE1BSU5UQUlORVJTLgoKMi83IENoZWNraW5nIGNvbW1pdCAwNmVhNjIyMWE0OTIgKGZ1eno6
IGRvdWJsZSB0aGUgSU9zIHRvIHJlbW92ZSBmb3IgZXZlcnkgbG9vcCkKMy83IENoZWNraW5nIGNv
bW1pdCBkOTU2ZjM4N2ZhZDkgKGZ1eno6IHNwbGl0IHdyaXRlIG9wZXJhbmQgdXNpbmcgYmluYXJ5
IGFwcHJvYWNoKQpFUlJPUjogdHJhaWxpbmcgd2hpdGVzcGFjZQojMTA0OiBGSUxFOiBzY3JpcHRz
L29zcy1mdXp6L21pbmltaXplX3F0ZXN0X3RyYWNlLnB5OjEzNToKKyAgICAgICAgIyBpdCBpbnRv
IHR3byBzZXBhcmF0ZSB3cml0ZSBjb21tYW5kcy4gSWYgc3BsaXR0aW5nIHRoZSBkYXRhIG9wZXJh
bmQgJAoKRVJST1I6IHRyYWlsaW5nIHdoaXRlc3BhY2UKIzEwNzogRklMRTogc2NyaXB0cy9vc3Mt
ZnV6ei9taW5pbWl6ZV9xdGVzdF90cmFjZS5weToxMzg6CisgICAgICAgICMgaXMgdG8gcHJ1bmUg
dW5uZWNjZXNzYXJ5IGJ5dGVzIGZyb20gbG9uZyB3cml0ZXMsIHdoaWxlIGFjY29tbW9kYXRpbmcg
JAoKdG90YWw6IDIgZXJyb3JzLCAwIHdhcm5pbmdzLCA2MiBsaW5lcyBjaGVja2VkCgpQYXRjaCAz
LzcgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVy
cm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBz
ZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KCjQvNyBDaGVja2luZyBjb21taXQgZmQ1NzIy
NzIzN2MxIChmdXp6OiBsb29wIHRoZSByZW1vdmUgbWluaW1pemVyIGFuZCByZWZhY3RvcmluZykK
RVJST1I6IHRyYWlsaW5nIHdoaXRlc3BhY2UKIzEwMTogRklMRTogc2NyaXB0cy9vc3MtZnV6ei9t
aW5pbWl6ZV9xdGVzdF90cmFjZS5weToxODc6CisgICAgJAoKdG90YWw6IDEgZXJyb3JzLCAwIHdh
cm5pbmdzLCA1NCBsaW5lcyBjaGVja2VkCgpQYXRjaCA0LzcgaGFzIHN0eWxlIHByb2JsZW1zLCBw
bGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVz
IHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJ
TkVSUy4KCjUvNyBDaGVja2luZyBjb21taXQgZmYwMTVkMWYzOTQ1IChmdXp6OiBzZXQgYml0cyBp
biBvcGVyYW5kIG9mIHdyaXRlL291dCB0byB6ZXJvKQo2LzcgQ2hlY2tpbmcgY29tbWl0IDlmZjk5
Zjg2ZDM0YiAoZnV6ejogYWRkIG1pbmltaXphdGlvbiBvcHRpb25zKQo3LzcgQ2hlY2tpbmcgY29t
bWl0IGRkYWQ5YjkxMWFkMSAoZnV6ejogaGV1cmlzdGljIHNwbGl0IHdyaXRlIGJhc2VkIG9uIHBh
c3QgSU9zKQpFUlJPUjogdHJhaWxpbmcgd2hpdGVzcGFjZQojNDg6IEZJTEU6IHNjcmlwdHMvb3Nz
LWZ1enovbWluaW1pemVfcXRlc3RfdHJhY2UucHk6MTEzOgorICAgICQKCkVSUk9SOiB0cmFpbGlu
ZyB3aGl0ZXNwYWNlCiM1NDogRklMRTogc2NyaXB0cy9vc3MtZnV6ei9taW5pbWl6ZV9xdGVzdF90
cmFjZS5weToxMTk6CisgICAgJAoKdG90YWw6IDIgZXJyb3JzLCAwIHdhcm5pbmdzLCA2NyBsaW5l
cyBjaGVja2VkCgpQYXRjaCA3LzcgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAg
SWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRv
IHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KCj09PSBPVVRQ
VVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgpUaGUgZnVsbCBs
b2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzL01FM1AyODJNQjE3NDU4
QjI3MDVDNDNFODYwQTI2MTcxREZDRDkwQE1FM1AyODJNQjE3NDUuQVVTUDI4Mi5QUk9ELk9VVExP
T0suQ09NL3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJh
dGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVh
c2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

