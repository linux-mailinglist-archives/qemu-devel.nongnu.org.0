Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD31268F7
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 19:19:16 +0200 (CEST)
Received: from localhost ([127.0.0.1]:48308 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTUtX-0004Pf-NG
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 13:19:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43443)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1hTUqR-0002gV-GK
	for qemu-devel@nongnu.org; Wed, 22 May 2019 13:16:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1hTUqP-0008NL-Fx
	for qemu-devel@nongnu.org; Wed, 22 May 2019 13:16:03 -0400
Resent-Date: Wed, 22 May 2019 13:16:02 -0400
Resent-Message-Id: <E1hTUqP-0008NL-Fx@eggs.gnu.org>
Received: from sender4-of-o55.zoho.com ([136.143.188.55]:21570)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1hTUqN-0008Jr-Mo
	for qemu-devel@nongnu.org; Wed, 22 May 2019 13:16:00 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1558545315; cv=none; d=zoho.com; s=zohoarc; 
	b=aW4mPGlEPerG5vfegofxliX6ufvRxfFqjbLQ/ZekGpWRuq/l6XJtGaQnviOUtj+70Q3se1eqSoI8inWxvcBzZeBxH7ppZXwgWoNBb8N1tDQFM3MemAnqe2dYRJU+MxDeCubBa3eLaPIfOedcq0tz5307S+A/rCuA99vm1SW+PcU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
	s=zohoarc; t=1558545315;
	h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
	bh=ebz6FtljNroHX8dJHEuikGniFiZnOfBHaYCcZL6PqJc=; 
	b=P9q+hLiwHP/RC3YPuOMF2TE56p6FNwPmHnAkVlMAvjbzW4j1P80WNebBATQJbf7zuFYPDU604BPkpBrrg2hxRAxcLD7pVzD1oBv5LxSRB1gd9olPT/r32oJiUV8m05KabK2nBYBbZgpFdrKcV665nBtXbrXGs0MgTn7NTsFbnMo=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org>
	header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1558545313719718.0192596972972;
	Wed, 22 May 2019 10:15:13 -0700 (PDT)
In-Reply-To: <20190522162147.26303-1-wens@kernel.org>
Message-ID: <155854531263.24.8817707922240677584@549697c9ad12>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: wens@kernel.org
Date: Wed, 22 May 2019 10:15:13 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 136.143.188.55
Subject: Re: [Qemu-devel] [PATCH v3] linux-user: Pass through nanosecond
 timestamp components for stat syscalls
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: qemu-devel@nongnu.org
Cc: riku.voipio@iki.fi, qemu-devel@nongnu.org, wens@kernel.org,
	laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MDUyMjE2MjE0Ny4yNjMw
My0xLXdlbnNAa2VybmVsLm9yZy8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNv
bWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9y
bWF0aW9uOgoKTWVzc2FnZS1pZDogMjAxOTA1MjIxNjIxNDcuMjYzMDMtMS13ZW5zQGtlcm5lbC5v
cmcKVHlwZTogc2VyaWVzClN1YmplY3Q6IFtRZW11LWRldmVsXSBbUEFUQ0ggdjNdIGxpbnV4LXVz
ZXI6IFBhc3MgdGhyb3VnaCBuYW5vc2Vjb25kIHRpbWVzdGFtcCBjb21wb25lbnRzIGZvciBzdGF0
IHN5c2NhbGxzCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCmdpdCByZXYt
cGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYu
cmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNv
bmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQouL3NjcmlwdHMvY2hlY2twYXRj
aC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKRnJvbSBodHRw
czovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUKICogW25ldyB0YWddICAgICAgICAg
ICAgICAgcGF0Y2hldy8yMDE5MDUyMjE2MjE0Ny4yNjMwMy0xLXdlbnNAa2VybmVsLm9yZyAtPiBw
YXRjaGV3LzIwMTkwNTIyMTYyMTQ3LjI2MzAzLTEtd2Vuc0BrZXJuZWwub3JnClN3aXRjaGVkIHRv
IGEgbmV3IGJyYW5jaCAndGVzdCcKNmVjMzI1Zjg5YyBsaW51eC11c2VyOiBQYXNzIHRocm91Z2gg
bmFub3NlY29uZCB0aW1lc3RhbXAgY29tcG9uZW50cyBmb3Igc3RhdCBzeXNjYWxscwoKPT09IE9V
VFBVVCBCRUdJTiA9PT0KRVJST1I6IGNvZGUgaW5kZW50IHNob3VsZCBuZXZlciB1c2UgdGFicwoj
MTA0OiBGSUxFOiBsaW51eC11c2VyL3N5c2NhbGxfZGVmcy5oOjExOTc6CiteSWFiaV91bG9uZyAg
dGFyZ2V0X3N0X2F0aW1lX25zZWM7JAoKRVJST1I6IGNvZGUgaW5kZW50IHNob3VsZCBuZXZlciB1
c2UgdGFicwojMTA3OiBGSUxFOiBsaW51eC11c2VyL3N5c2NhbGxfZGVmcy5oOjExOTk6CiteSWFi
aV91bG9uZyAgdGFyZ2V0X3N0X210aW1lX25zZWM7JAoKRVJST1I6IGNvZGUgaW5kZW50IHNob3Vs
ZCBuZXZlciB1c2UgdGFicwojMTEwOiBGSUxFOiBsaW51eC11c2VyL3N5c2NhbGxfZGVmcy5oOjEy
MDE6CiteSWFiaV91bG9uZyAgdGFyZ2V0X3N0X2N0aW1lX25zZWM7JAoKRVJST1I6IGNvZGUgaW5k
ZW50IHNob3VsZCBuZXZlciB1c2UgdGFicwojMTE5OiBGSUxFOiBsaW51eC11c2VyL3N5c2NhbGxf
ZGVmcy5oOjEyMzM6CiteSWFiaV91bG9uZ15JdGFyZ2V0X3N0X2F0aW1lX25zZWM7JAoKRVJST1I6
IGNvZGUgaW5kZW50IHNob3VsZCBuZXZlciB1c2UgdGFicwojMTIzOiBGSUxFOiBsaW51eC11c2Vy
L3N5c2NhbGxfZGVmcy5oOjEyMzY6CiteSWFiaV91bG9uZ15JdGFyZ2V0X3N0X210aW1lX25zZWM7
JAoKRVJST1I6IGNvZGUgaW5kZW50IHNob3VsZCBuZXZlciB1c2UgdGFicwojMTI3OiBGSUxFOiBs
aW51eC11c2VyL3N5c2NhbGxfZGVmcy5oOjEyMzk6CiteSWFiaV91bG9uZ15JdGFyZ2V0X3N0X2N0
aW1lX25zZWM7JAoKRVJST1I6IGNvZGUgaW5kZW50IHNob3VsZCBuZXZlciB1c2UgdGFicwojMTM2
OiBGSUxFOiBsaW51eC11c2VyL3N5c2NhbGxfZGVmcy5oOjEzMTg6CiteSWFiaV91bG9uZ15JdGFy
Z2V0X3N0X2F0aW1lX25zZWM7JAoKRVJST1I6IGNvZGUgaW5kZW50IHNob3VsZCBuZXZlciB1c2Ug
dGFicwojMTQwOiBGSUxFOiBsaW51eC11c2VyL3N5c2NhbGxfZGVmcy5oOjEzMjE6CiteSWFiaV91
bG9uZ15JdGFyZ2V0X3N0X210aW1lX25zZWM7JAoKRVJST1I6IGNvZGUgaW5kZW50IHNob3VsZCBu
ZXZlciB1c2UgdGFicwojMTQ0OiBGSUxFOiBsaW51eC11c2VyL3N5c2NhbGxfZGVmcy5oOjEzMjQ6
CiteSWFiaV91bG9uZ15JdGFyZ2V0X3N0X2N0aW1lX25zZWM7JAoKRVJST1I6IGNvZGUgaW5kZW50
IHNob3VsZCBuZXZlciB1c2UgdGFicwojMTYwOiBGSUxFOiBsaW51eC11c2VyL3N5c2NhbGxfZGVm
cy5oOjEzNDI6CiteSWFiaV91bG9uZ15JdGFyZ2V0X3N0X2F0aW1lX25zZWM7JAoKRVJST1I6IGNv
ZGUgaW5kZW50IHNob3VsZCBuZXZlciB1c2UgdGFicwojMTYzOiBGSUxFOiBsaW51eC11c2VyL3N5
c2NhbGxfZGVmcy5oOjEzNDQ6CiteSWFiaV91bG9uZ15JdGFyZ2V0X3N0X210aW1lX25zZWM7JAoK
RVJST1I6IGNvZGUgaW5kZW50IHNob3VsZCBuZXZlciB1c2UgdGFicwojMTY2OiBGSUxFOiBsaW51
eC11c2VyL3N5c2NhbGxfZGVmcy5oOjEzNDY6CiteSWFiaV91bG9uZ15JdGFyZ2V0X3N0X2N0aW1l
X25zZWM7JAoKRVJST1I6IGNvZGUgaW5kZW50IHNob3VsZCBuZXZlciB1c2UgdGFicwojMTcwOiBG
SUxFOiBsaW51eC11c2VyL3N5c2NhbGxfZGVmcy5oOjEzNDk6CiteSWFiaV91bG9uZ15JX191bnVz
ZWQxWzJdOyQKCkVSUk9SOiBjb2RlIGluZGVudCBzaG91bGQgbmV2ZXIgdXNlIHRhYnMKIzE3OTog
RklMRTogbGludXgtdXNlci9zeXNjYWxsX2RlZnMuaDoxMzc3OgorXkl1bnNpZ25lZCBpbnReSXRh
cmdldF9zdF9hdGltZV9uc2VjOyQKCkVSUk9SOiBjb2RlIGluZGVudCBzaG91bGQgbmV2ZXIgdXNl
IHRhYnMKIzE4MzogRklMRTogbGludXgtdXNlci9zeXNjYWxsX2RlZnMuaDoxMzgwOgorXkl1bnNp
Z25lZCBpbnReSXRhcmdldF9zdF9tdGltZV9uc2VjOyQKCkVSUk9SOiBjb2RlIGluZGVudCBzaG91
bGQgbmV2ZXIgdXNlIHRhYnMKIzE4NzogRklMRTogbGludXgtdXNlci9zeXNjYWxsX2RlZnMuaDox
MzgzOgorXkl1bnNpZ25lZCBpbnReSXRhcmdldF9zdF9jdGltZV9uc2VjOyQKCkVSUk9SOiBjb2Rl
IGluZGVudCBzaG91bGQgbmV2ZXIgdXNlIHRhYnMKIzE5MTogRklMRTogbGludXgtdXNlci9zeXNj
YWxsX2RlZnMuaDoxMzg1OgorXkl1bnNpZ25lZCBpbnReSV9fdW51c2VkMTskCgpFUlJPUjogY29k
ZSBpbmRlbnQgc2hvdWxkIG5ldmVyIHVzZSB0YWJzCiMxOTI6IEZJTEU6IGxpbnV4LXVzZXIvc3lz
Y2FsbF9kZWZzLmg6MTM4NjoKK15JdW5zaWduZWQgaW50XklfX3VudXNlZDI7JAoKdG90YWw6IDE4
IGVycm9ycywgMCB3YXJuaW5ncywgMjExIGxpbmVzIGNoZWNrZWQKCkNvbW1pdCA2ZWMzMjVmODlj
MDYgKGxpbnV4LXVzZXI6IFBhc3MgdGhyb3VnaCBuYW5vc2Vjb25kIHRpbWVzdGFtcCBjb21wb25l
bnRzIGZvciBzdGF0IHN5c2NhbGxzKSBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcu
ICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0g
dG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgo9PT0gT1VU
UFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwg
bG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDE5MDUyMjE2MjE0
Ny4yNjMwMy0xLXdlbnNAa2VybmVsLm9yZy90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2Fn
ZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8v
cGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVs
QHJlZGhhdC5jb20=


