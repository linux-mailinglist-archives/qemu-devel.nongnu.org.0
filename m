Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CA23274DB
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 23:30:41 +0100 (CET)
Received: from localhost ([::1]:48262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGUaD-00055e-2N
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 17:30:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lGUY1-0003mo-MM
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 17:28:21 -0500
Resent-Date: Sun, 28 Feb 2021 17:28:21 -0500
Resent-Message-Id: <E1lGUY1-0003mo-MM@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lGUXz-0007gW-1a
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 17:28:21 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1614551269; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=QGsU3Q4WCd5YzdyQYkYNc3GChpSjevjs0ogqow+jvkbsImcRkB2b0NozsvEPgIZf2UcPVxbOiaTa9bV53l4h8zHu2qvD0VCAOv06ygCoy1dWruxnXPtiiqJ6HB+0ZBm36Tg+eXPenC622RU++0w3F+C74yKbd7XlpHqLtdViiG0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1614551269;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=hBEXABUkAqjrEpK1asjaTNkqrwnjx0OVvyZavWycvb0=; 
 b=j0wIFXg4pEHkpRiRRPzu9xd+wHzhNVeRSnx3HM1fUHxP4IMopRF9YrTyx+eJK8B5xxsi5wSgRSxON2olVuwNOMX9BbixkYM7G2pjpDxrGT8NPMAbK4Sb2x698CP3jGXwomgHvH2wHacT37zV8fnAKboKmzEXFfLk10qLM2DNU0I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1614551266971218.38451403242448;
 Sun, 28 Feb 2021 14:27:46 -0800 (PST)
In-Reply-To: <20210228222314.304787-1-f4bug@amsat.org>
Subject: Re: [PATCH 0/4] hexagon: Add Docker image & testing to gitlab-ci
Message-ID: <161455126522.22330.4031847683939241454@c667a6b167f6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: f4bug@amsat.org
Date: Sun, 28 Feb 2021 14:27:46 -0800 (PST)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, bcain@quicinc.com, philmd@redhat.com, qemu-devel@nongnu.org,
 ale.qemu@rev.ng, tsimpson@quicinc.com, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDIyODIyMjMxNC4zMDQ3
ODctMS1mNGJ1Z0BhbXNhdC5vcmcvCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2ZSBz
b21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBpbmZv
cm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIxMDIyODIyMjMxNC4zMDQ3ODct
MS1mNGJ1Z0BhbXNhdC5vcmcKU3ViamVjdDogW1BBVENIIDAvNF0gaGV4YWdvbjogQWRkIERvY2tl
ciBpbWFnZSAmIHRlc3RpbmcgdG8gZ2l0bGFiLWNpCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09
CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0
IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlm
Zi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3Jh
bQouL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJ
UFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcx
MzM4NApGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdQogLSBbdGFn
IHVwZGF0ZV0gICAgICBwYXRjaGV3LzIwMjEwMjI3MjMyNTE5LjIyMjY2My0xLXJpY2hhcmQuaGVu
ZGVyc29uQGxpbmFyby5vcmcgLT4gcGF0Y2hldy8yMDIxMDIyNzIzMjUxOS4yMjI2NjMtMS1yaWNo
YXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnCiAtIFt0YWcgdXBkYXRlXSAgICAgIHBhdGNoZXcvMjAy
MTAyMjgwNTA2MDkuMjQ3NzktMS1ibWVuZy5jbkBnbWFpbC5jb20gLT4gcGF0Y2hldy8yMDIxMDIy
ODA1MDYwOS4yNDc3OS0xLWJtZW5nLmNuQGdtYWlsLmNvbQogLSBbdGFnIHVwZGF0ZV0gICAgICBw
YXRjaGV3LzIwMjEwMjI4MTExNjU3LjIzMjQwLTEtYXNoZUBraXZpa2Fray5lZSAtPiBwYXRjaGV3
LzIwMjEwMjI4MTExNjU3LjIzMjQwLTEtYXNoZUBraXZpa2Fray5lZQogKiBbbmV3IHRhZ10gICAg
ICAgICBwYXRjaGV3LzIwMjEwMjI4MjIyMzE0LjMwNDc4Ny0xLWY0YnVnQGFtc2F0Lm9yZyAtPiBw
YXRjaGV3LzIwMjEwMjI4MjIyMzE0LjMwNDc4Ny0xLWY0YnVnQGFtc2F0Lm9yZwpTd2l0Y2hlZCB0
byBhIG5ldyBicmFuY2ggJ3Rlc3QnCjQzMDdjMGEgdGVzdHMvdGNnOiBVc2UgSGV4YWdvbiBEb2Nr
ZXIgaW1hZ2UKNTk3OTkzMiBnaXRsYWItY2k6IEJ1aWxkIEhleGFnb24gY3Jvc3MtdG9vbGNoYWlu
CmVmNjAzMWIgZ2l0bGFiLWNpOiBQYXNzIG9wdGlvbmFsIEVYVFJBX0ZJTEVTIHdoZW4gYnVpbGRp
bmcgZG9ja2VyIGltYWdlcwo2NTU2OGFkIGRvY2tlcjogQWRkIEhleGFnb24gaW1hZ2UKCj09PSBP
VVRQVVQgQkVHSU4gPT09CjEvNCBDaGVja2luZyBjb21taXQgNjU1NjhhZDZkYTM1IChkb2NrZXI6
IEFkZCBIZXhhZ29uIGltYWdlKQpVc2Ugb2YgdW5pbml0aWFsaXplZCB2YWx1ZSAkYWNwaV90ZXN0
ZXhwZWN0ZWQgaW4gc3RyaW5nIGVxIGF0IC4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIGxpbmUgMTUy
OS4KV0FSTklORzogYWRkZWQsIG1vdmVkIG9yIGRlbGV0ZWQgZmlsZShzKSwgZG9lcyBNQUlOVEFJ
TkVSUyBuZWVkIHVwZGF0aW5nPwojMzE6IApuZXcgZmlsZSBtb2RlIDEwMDY0NAoKV0FSTklORzog
bGluZSBvdmVyIDgwIGNoYXJhY3RlcnMKIzEyNzogRklMRTogdGVzdHMvZG9ja2VyL2RvY2tlcmZp
bGVzL2RlYmlhbi1oZXhhZ29uLWNyb3NzLmRvY2tlci5kL2J1aWxkLXRvb2xjaGFpbi5zaDo2MzoK
KyAgICAtRENNQUtFX0FTTV9GTEFHUz0iLUcwIC1tbG9uZy1jYWxscyAtZm5vLXBpYyAtLXRhcmdl
dD1oZXhhZ29uLXVua25vd24tbGludXgtbXVzbCAiIFwKCkVSUk9SOiBsaW5lIG92ZXIgOTAgY2hh
cmFjdGVycwojMTU0OiBGSUxFOiB0ZXN0cy9kb2NrZXIvZG9ja2VyZmlsZXMvZGViaWFuLWhleGFn
b24tY3Jvc3MuZG9ja2VyLmQvYnVpbGQtdG9vbGNoYWluLnNoOjkwOgorICAgIENST1NTX0NGTEFH
Uz0iLUcwIC1PMCAtbXY2NSAtZm5vLWJ1aWx0aW4gLWZuby1yb3VuZGluZy1tYXRoIC0tdGFyZ2V0
PWhleGFnb24tdW5rbm93bi1saW51eC1tdXNsIiBcCgpFUlJPUjogbGluZSBvdmVyIDkwIGNoYXJh
Y3RlcnMKIzE5MTogRklMRTogdGVzdHMvZG9ja2VyL2RvY2tlcmZpbGVzL2RlYmlhbi1oZXhhZ29u
LWNyb3NzLmRvY2tlci5kL2J1aWxkLXRvb2xjaGFpbi5zaDoxMjc6CisgICAgQ0ZMQUdTPSItRzAg
LU8wIC1tdjY1IC1mbm8tYnVpbHRpbiAtZm5vLXJvdW5kaW5nLW1hdGggLS10YXJnZXQ9aGV4YWdv
bi11bmtub3duLWxpbnV4LW11c2wiIFwKCnRvdGFsOiAyIGVycm9ycywgMiB3YXJuaW5ncywgMTcy
IGxpbmVzIGNoZWNrZWQKClBhdGNoIDEvNCBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZp
ZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRo
ZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgoKMi80
IENoZWNraW5nIGNvbW1pdCBlZjYwMzFiOWE4YjggKGdpdGxhYi1jaTogUGFzcyBvcHRpb25hbCBF
WFRSQV9GSUxFUyB3aGVuIGJ1aWxkaW5nIGRvY2tlciBpbWFnZXMpCjMvNCBDaGVja2luZyBjb21t
aXQgNTk3OTkzMjk1YTEzIChnaXRsYWItY2k6IEJ1aWxkIEhleGFnb24gY3Jvc3MtdG9vbGNoYWlu
KQo0LzQgQ2hlY2tpbmcgY29tbWl0IDQzMDdjMGExNmMyMSAodGVzdHMvdGNnOiBVc2UgSGV4YWdv
biBEb2NrZXIgaW1hZ2UpCj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3
aXRoIGNvZGU6IDEKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3
Lm9yZy9sb2dzLzIwMjEwMjI4MjIyMzE0LjMwNDc4Ny0xLWY0YnVnQGFtc2F0Lm9yZy90ZXN0aW5n
LmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNh
bGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBm
ZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

