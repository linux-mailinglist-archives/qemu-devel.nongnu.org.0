Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 199982E9783
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 15:44:13 +0100 (CET)
Received: from localhost ([::1]:60144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwR5g-0006qG-6z
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 09:44:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kwR4Z-00061g-Ij; Mon, 04 Jan 2021 09:43:03 -0500
Resent-Date: Mon, 04 Jan 2021 09:43:03 -0500
Resent-Message-Id: <E1kwR4Z-00061g-Ij@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kwR4V-0004P4-JW; Mon, 04 Jan 2021 09:43:02 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1609771367; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Vl+80UGZ1Mxfd8WvJmVL24ws/aFup4dO5VFzHynrJWcjuLgWZyP6wn9Fa7nzANE0RcGblUUD2Al3m/kGK7utUOKkzXMaBhiDWmcPcuvMFqpGbfFH47/G+mc7WzmVh6KKSi+Tch5WRGzbzwQWzIl8nDQTR+mtoAZzaPFOm7Efjqo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1609771367;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=/IqQ8WWvBh9PRiddOtQpzDC9I0iN5qT4t8aPM78ilj8=; 
 b=dem30qkFBDXN4tLOGJUO2vjkfz9bJ5rP5zPjXxS35PHEC+auEujHTdZtRElJDdkhgJWElwUn6g9c0loegTLaOgRkK4TTE16oQRVj2a/q5J/h492GIVlqjgubWZkpqbameHhYAHIv2Fugf2Vic4+4MSkkfxHzA3A+MRSXPZW9jK0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1609771365966806.6308980683825;
 Mon, 4 Jan 2021 06:42:45 -0800 (PST)
In-Reply-To: <20210104143154.462212-1-stefanha@redhat.com>
Subject: Re: [PULL 0/5] Tracing patches
Message-ID: <160977136391.13070.3982684701794238349@600e7e483b3a>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: stefanha@redhat.com
Date: Mon, 4 Jan 2021 06:42:45 -0800 (PST)
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, stefanha@redhat.com, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDEwNDE0MzE1NC40NjIy
MTItMS1zdGVmYW5oYUByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhh
dmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUg
aW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMTAxMDQxNDMxNTQuNDYy
MjEyLTEtc3RlZmFuaGFAcmVkaGF0LmNvbQpTdWJqZWN0OiBbUFVMTCAwLzVdIFRyYWNpbmcgcGF0
Y2hlcwoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaApnaXQgcmV2LXBhcnNl
IGJhc2UgPiAvZGV2L251bGwgfHwgZXhpdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFt
ZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcg
LS1sb2NhbCBkaWZmLmFsZ29yaXRobSBoaXN0b2dyYW0KLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwg
LS1tYWlsYmFjayBiYXNlLi4KPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNm
NWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQKRnJvbSBodHRwczovL2dpdGh1Yi5j
b20vcGF0Y2hldy1wcm9qZWN0L3FlbXUKICogW25ldyB0YWddICAgICAgICAgcGF0Y2hldy8yMDIx
MDEwNDE0MzE1NC40NjIyMTItMS1zdGVmYW5oYUByZWRoYXQuY29tIC0+IHBhdGNoZXcvMjAyMTAx
MDQxNDMxNTQuNDYyMjEyLTEtc3RlZmFuaGFAcmVkaGF0LmNvbQpTd2l0Y2hlZCB0byBhIG5ldyBi
cmFuY2ggJ3Rlc3QnCjZiMTczOGYgdHJhY2V0b29sOiBzaG93IHRyYWNlLWV2ZW50cyBmaWxlbmFt
ZS9saW5lbm8gaW4gZm10IHN0cmluZyBlcnJvcnMKZDY2YTlmYyB0cmFjZXRvb2w6IGFkZCBpbnB1
dCBmaWxlbmFtZSBhbmQgbGluZSBudW1iZXIgdG8gRXZlbnQKMDI2MmEyOCB0cmFjZXRvb2w6IGFk
ZCBvdXRfbGluZW5vIGFuZCBvdXRfbmV4dF9saW5lbm8gdG8gb3V0KCkKOTViZDA1OCB0cmFjZXRv
b2w6IGFkZCBvdXRwdXQgZmlsZW5hbWUgY29tbWFuZC1saW5lIGFyZ3VtZW50CmY4Y2ZiNDcgdHJh
Y2U6IFNlbmQgIi1kIHRyYWNlOmhlbHAiIG91dHB1dCB0byBzdGRvdXQKCj09PSBPVVRQVVQgQkVH
SU4gPT09CjEvNSBDaGVja2luZyBjb21taXQgZjhjZmI0N2UzYWUyICh0cmFjZTogU2VuZCAiLWQg
dHJhY2U6aGVscCIgb3V0cHV0IHRvIHN0ZG91dCkKMi81IENoZWNraW5nIGNvbW1pdCA5NWJkMDU4
Y2VmODggKHRyYWNldG9vbDogYWRkIG91dHB1dCBmaWxlbmFtZSBjb21tYW5kLWxpbmUgYXJndW1l
bnQpCkVSUk9SOiBsaW5lIG92ZXIgOTAgY2hhcmFjdGVycwojNzM6IEZJTEU6IHNjcmlwdHMvdHJh
Y2V0b29sLnB5OjM1OgorVXNhZ2U6ICUoc2NyaXB0KXMgLS1mb3JtYXQ9PGZvcm1hdD4gLS1iYWNr
ZW5kcz08YmFja2VuZHM+IFs8b3B0aW9ucz5dIDx0cmFjZS1ldmVudHM+IC4uLiA8b3V0cHV0PgoK
dG90YWw6IDEgZXJyb3JzLCAwIHdhcm5pbmdzLCAxNDQgbGluZXMgY2hlY2tlZAoKUGF0Y2ggMi81
IGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJv
cnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2Vl
CkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCgozLzUgQ2hlY2tpbmcgY29tbWl0IDAyNjJhMjhl
ODdkMCAodHJhY2V0b29sOiBhZGQgb3V0X2xpbmVubyBhbmQgb3V0X25leHRfbGluZW5vIHRvIG91
dCgpKQo0LzUgQ2hlY2tpbmcgY29tbWl0IGQ2NmE5ZmM0ZTYyZiAodHJhY2V0b29sOiBhZGQgaW5w
dXQgZmlsZW5hbWUgYW5kIGxpbmUgbnVtYmVyIHRvIEV2ZW50KQo1LzUgQ2hlY2tpbmcgY29tbWl0
IDZiMTczOGY1MDhhZCAodHJhY2V0b29sOiBzaG93IHRyYWNlLWV2ZW50cyBmaWxlbmFtZS9saW5l
bm8gaW4gZm10IHN0cmluZyBlcnJvcnMpCj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5k
IGV4aXRlZCB3aXRoIGNvZGU6IDEKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6
Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMjEwMTA0MTQzMTU0LjQ2MjIxMi0xLXN0ZWZhbmhhQHJlZGhh
dC5jb20vdGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0
ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFz
ZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

