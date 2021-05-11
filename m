Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4640037A120
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 09:47:42 +0200 (CEST)
Received: from localhost ([::1]:54978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgN7F-00082I-CF
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 03:47:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lgN5h-0006bc-Cq; Tue, 11 May 2021 03:46:05 -0400
Resent-Date: Tue, 11 May 2021 03:46:05 -0400
Resent-Message-Id: <E1lgN5h-0006bc-Cq@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lgN5e-0000Vg-Jl; Tue, 11 May 2021 03:46:04 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1620719149; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ZgcUaNoiesZDOECe5KjeLPXSgcEJA1moHJwl8COmtQaOCxYCV/oi9rwhp0/r4PR6aGRXrmZx96FgyKsSLHZ7PrvM8RiEet8FZMUtrxrHJcIy9MNqZ7GdF5C5dkRFkYQPb0/8JISxKQLa8SDJCxFzORrS4oBfyzUdl1alaDep0Vw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1620719149;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=m5/VS0UYClRJYP8BYMR4wKCr5iSPUtzJDpG0OC0hZ3U=; 
 b=WflFSTtUYD6azz49inpEHj9uXSUb5Yz7pVRVRwgNsWosUg3HIHB8YFivioTuFioN09mURbAlGSEzfpm2gVe0+2EFsustlTHU28LvR4n2RFa101K8Qmc8wip4KNG5oWoBdSkI49ehmjBVEhNTsX23F4cHqRjd6LTvTGVvaar4unU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1620719146636399.43386567267146;
 Tue, 11 May 2021 00:45:46 -0700 (PDT)
In-Reply-To: <20210511073511.32511-1-hare@suse.de>
Subject: Re: [PATCH] hw/block/nvme: re-enable NVMe PCI hotplug
Message-ID: <162071914531.13003.11125094093285682224@d887ba82c771>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: hare@suse.de
Date: Tue, 11 May 2021 00:45:46 -0700 (PDT)
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
Cc: kwolf@redhat.com, keith.busch@wdc.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, minwoo.im.dev@gmail.com, hare@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDUxMTA3MzUxMS4zMjUx
MS0xLWhhcmVAc3VzZS5kZS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUg
Y29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0
aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjEwNTExMDczNTExLjMyNTExLTEtaGFy
ZUBzdXNlLmRlClN1YmplY3Q6IFtQQVRDSF0gaHcvYmxvY2svbnZtZTogcmUtZW5hYmxlIE5WTWUg
UENJIGhvdHBsdWcKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJl
di1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlm
Zi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQg
Y29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFtCi4vc2NyaXB0cy9jaGVja3Bh
dGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpVcGRhdGlu
ZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0CkZyb20gaHR0cHM6Ly9n
aXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiAgIGU1OGM3YTMuLmU0ZjNlZGUgIG1hc3Rl
ciAgICAgLT4gbWFzdGVyCiAqIFtuZXcgdGFnXSAgICAgICAgIHBhdGNoZXcvMjAyMTA1MTEwNzM1
MTEuMzI1MTEtMS1oYXJlQHN1c2UuZGUgLT4gcGF0Y2hldy8yMDIxMDUxMTA3MzUxMS4zMjUxMS0x
LWhhcmVAc3VzZS5kZQpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCjFkMjQ2MjIgaHcv
YmxvY2svbnZtZTogcmUtZW5hYmxlIE5WTWUgUENJIGhvdHBsdWcKCj09PSBPVVRQVVQgQkVHSU4g
PT09CkVSUk9SOiBicmFjZXMge30gYXJlIG5lY2Vzc2FyeSBmb3IgYWxsIGFybXMgb2YgdGhpcyBz
dGF0ZW1lbnQKIzEwMTogRklMRTogaHcvYmxvY2svbnZtZS1zdWJzeXMuYzo1MDoKKyAgICBpZiAo
IW4tPnN1YnN5cykKWy4uLl0KCnRvdGFsOiAxIGVycm9ycywgMCB3YXJuaW5ncywgMTgyIGxpbmVz
IGNoZWNrZWQKCkNvbW1pdCAxZDI0NjIyYzVkMTkgKGh3L2Jsb2NrL252bWU6IHJlLWVuYWJsZSBO
Vk1lIFBDSSBob3RwbHVnKSBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBh
bnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhl
IG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgo9PT0gT1VUUFVUIEVO
RCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlz
IGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIxMDUxMTA3MzUxMS4zMjUx
MS0xLWhhcmVAc3VzZS5kZS90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVt
YWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5v
cmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5j
b20=

