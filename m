Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9C336894E
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 01:26:18 +0200 (CEST)
Received: from localhost ([::1]:49470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZii8-0007JG-Qf
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 19:26:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lZigt-0006fK-EO
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 19:24:59 -0400
Resent-Date: Thu, 22 Apr 2021 19:24:59 -0400
Resent-Message-Id: <E1lZigt-0006fK-EO@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lZigq-0004gf-Vr
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 19:24:59 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1619133889; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=dEC7Iha6NxJQ1i103c2sD/WYqaP4fOj/eFFlTr+73VOw2j4USwfX4ROKoCZrYMJO5gOkV9H1N1K4ZX654kLFlp0WBnUa1hoqCpA9vI+xJDQn9+KB/Z/10EWwjkYAKmdGzEzRgEpOE2UHqqLFrj9oPiap/IpS/2tZ2TbH2w2KSVE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1619133889;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=JZAsYSKZ5xVU44mR61U1VLM85LNxqI/oEK2o/kZ5HzA=; 
 b=B+al1Tb+FpI2vNXv4mSEmiRyXYT7Zy1Ul7xPR72E4XTCj69e/jH+ijsoLrxnGjH5ZP+ptchWwEGW66VXVPPEC10+FM2iXMe7v2NHqCQaBbGmeExZsUY1DdQhfZqEmRYIH3q1QGyatJYjKK8Qfjy5o4rjpMSOMhZ8jFV6YrgpQ3U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1619133888448494.04670081648146;
 Thu, 22 Apr 2021 16:24:48 -0700 (PDT)
In-Reply-To: <20210422230227.314751-1-richard.henderson@linaro.org>
Subject: Re: [PATCH v2 0/7] linux-user: sigaction fixes/cleanups
Message-ID: <161913388741.19742.13437078672826461468@72b6d80f974b>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: richard.henderson@linaro.org
Date: Thu, 22 Apr 2021 16:24:48 -0700 (PDT)
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
Cc: alex.bennee@linaro.org, qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDQyMjIzMDIyNy4zMTQ3
NTEtMS1yaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNl
ZW1zIHRvIGhhdmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cg
Zm9yCm1vcmUgaW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMTA0MjIy
MzAyMjcuMzE0NzUxLTEtcmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZwpTdWJqZWN0OiBbUEFU
Q0ggdjIgMC83XSBsaW51eC11c2VyOiBzaWdhY3Rpb24gZml4ZXMvY2xlYW51cHMKCj09PSBURVNU
IFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9u
dWxsIHx8IGV4aXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBj
b25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5h
bGdvcml0aG0gaGlzdG9ncmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFz
ZS4uCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2
NGQxZGVmN2Y0NGJkODg4NzEzMzg0CkZyb20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJv
amVjdC9xZW11CiAqIFtuZXcgdGFnXSAgICAgICAgIHBhdGNoZXcvMjAyMTA0MjIyMzAyMjcuMzE0
NzUxLTEtcmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZyAtPiBwYXRjaGV3LzIwMjEwNDIyMjMw
MjI3LjMxNDc1MS0xLXJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmcKU3dpdGNoZWQgdG8gYSBu
ZXcgYnJhbmNoICd0ZXN0Jwo5ZWVlNzQ2IGxpbnV4LXVzZXI6IFRpZHkgVEFSR0VUX05SX3J0X3Np
Z2FjdGlvbgo0NmMyNTQxIGxpbnV4LXVzZXIvYWxwaGE6IFNoYXJlIGNvZGUgZm9yIFRBUkdFVF9O
Ul9zaWdhY3Rpb24KYzY5Nzc2YiBsaW51eC11c2VyL2FscGhhOiBEZWZpbmUgVEFSR0VUX0FSQ0hf
SEFTX0tBX1JFU1RPUkVSCmRlOWU1YzIgbGludXgtdXNlcjogSG9ub3IgVEFSR0VUX0FSQ0hfSEFT
X1NBX1JFU1RPUkVSIGluIGRvX3N5c2NhbGwKNTdiZDk2MCBsaW51eC11c2VyOiBQYXNzIGthX3Jl
c3RvcmVyIHRvIGRvX3NpZ2FjdGlvbgplZjQwNTRlIGxpbnV4LXVzZXIvYWxwaGE6IFJlbmFtZSB0
aGUgc2lnYWN0aW9uIHJlc3RvcmVyIGZpZWxkCmRmNGZhYzkgbGludXgtdXNlci9hbHBoYTogRml4
IHJ0IHNpZ2ZyYW1lIHJldHVybgoKPT09IE9VVFBVVCBCRUdJTiA9PT0KMS83IENoZWNraW5nIGNv
bW1pdCBkZjRmYWM5NzdjNGMgKGxpbnV4LXVzZXIvYWxwaGE6IEZpeCBydCBzaWdmcmFtZSByZXR1
cm4pCjIvNyBDaGVja2luZyBjb21taXQgZWY0MDU0ZTQyNTc0IChsaW51eC11c2VyL2FscGhhOiBS
ZW5hbWUgdGhlIHNpZ2FjdGlvbiByZXN0b3JlciBmaWVsZCkKMy83IENoZWNraW5nIGNvbW1pdCA1
N2JkOTYwNGVmMTggKGxpbnV4LXVzZXI6IFBhc3Mga2FfcmVzdG9yZXIgdG8gZG9fc2lnYWN0aW9u
KQpFUlJPUjogY29kZSBpbmRlbnQgc2hvdWxkIG5ldmVyIHVzZSB0YWJzCiM2NDogRklMRTogbGlu
dXgtdXNlci9zeXNjYWxsLmM6OTAxOToKK15JICAgIHJldCA9IGdldF9lcnJubyhkb19zaWdhY3Rp
b24oYXJnMSwgcGFjdCwgJm9hY3QsIDApKTskCgp0b3RhbDogMSBlcnJvcnMsIDAgd2FybmluZ3Ms
IDk3IGxpbmVzIGNoZWNrZWQKClBhdGNoIDMvNyBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSBy
ZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0
IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgoK
NC83IENoZWNraW5nIGNvbW1pdCBkZTllNWMyNjdmODUgKGxpbnV4LXVzZXI6IEhvbm9yIFRBUkdF
VF9BUkNIX0hBU19TQV9SRVNUT1JFUiBpbiBkb19zeXNjYWxsKQo1LzcgQ2hlY2tpbmcgY29tbWl0
IGM2OTc3NmJmMmIwNyAobGludXgtdXNlci9hbHBoYTogRGVmaW5lIFRBUkdFVF9BUkNIX0hBU19L
QV9SRVNUT1JFUikKNi83IENoZWNraW5nIGNvbW1pdCA0NmMyNTQxYjYxN2QgKGxpbnV4LXVzZXIv
YWxwaGE6IFNoYXJlIGNvZGUgZm9yIFRBUkdFVF9OUl9zaWdhY3Rpb24pCjcvNyBDaGVja2luZyBj
b21taXQgOWVlZTc0NjRkMzE4IChsaW51eC11c2VyOiBUaWR5IFRBUkdFVF9OUl9ydF9zaWdhY3Rp
b24pCj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEK
CgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIw
MjEwNDIyMjMwMjI3LjMxNDc1MS0xLXJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmcvdGVzdGlu
Zy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGlj
YWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIg
ZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

