Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2890E2C5005
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 09:13:58 +0100 (CET)
Received: from localhost ([::1]:58108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiCPd-0003ma-8g
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 03:13:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kiCOh-00039N-8J
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 03:12:59 -0500
Resent-Date: Thu, 26 Nov 2020 03:12:59 -0500
Resent-Message-Id: <E1kiCOh-00039N-8J@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kiCOe-0003Li-Dr
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 03:12:58 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1606378364; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=c2CW+Ir9CtOmRMsT8ls1w1H0Nk8Lov/cwqLOduDkVS6Lls98MDTLQ9EhL+iq57sMWAeCBL7tRRDgu5yRvJobYOnpGoUQfUs31Kwvkpart09aS0DZcgOI0vFaEn5mSHOlAXf+YC95vFng8gaSlCUiW6+opj1XpVXh3iyar+Zvbuk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1606378364;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=x8ctWL+C0j95O73r4MiahjR7fxLIyalURtPJhLOMzlo=; 
 b=jgEjRwP8CGiNAAgiaKyr8NYtA7OcPF7YxCyWRpfeOa4bPOEtw1vZEGtd7soeNfLYCmwjrjDHOlcirbaMQ8Xulev254+pCKw0fStWL86uo2iUzox4oRQzavtFR/9cOkdHpuar5ZwA2pK3ZwmWXSf10VGz/Lj5qNy+wSmBvIh8vN4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1606378363203954.7917263318899;
 Thu, 26 Nov 2020 00:12:43 -0800 (PST)
In-Reply-To: <20201126075921.3116321-1-pbonzini@redhat.com>
Subject: Re: [PULL 0/5] Final (?) batch of misc patches for QEMU 5.2
Message-ID: <160637836210.26255.6320009226858576046@9aeb27d8af94>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: pbonzini@redhat.com
Date: Thu, 26 Nov 2020 00:12:43 -0800 (PST)
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

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMTEyNjA3NTkyMS4zMTE2
MzIxLTEtcGJvbnppbmlAcmVkaGF0LmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBo
YXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3Jl
IGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjAxMTI2MDc1OTIxLjMx
MTYzMjEtMS1wYm9uemluaUByZWRoYXQuY29tClN1YmplY3Q6IFtQVUxMIDAvNV0gRmluYWwgKD8p
IGJhdGNoIG9mIG1pc2MgcGF0Y2hlcyBmb3IgUUVNVSA1LjIKCj09PSBURVNUIFNDUklQVCBCRUdJ
TiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQg
MApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2Nh
bCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlz
dG9ncmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNU
IFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJk
ODg4NzEzMzg0CkZyb20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiAq
IFtuZXcgdGFnXSAgICAgICAgIHBhdGNoZXcvMjAyMDExMjYwNzU5MjEuMzExNjMyMS0xLXBib256
aW5pQHJlZGhhdC5jb20gLT4gcGF0Y2hldy8yMDIwMTEyNjA3NTkyMS4zMTE2MzIxLTEtcGJvbnpp
bmlAcmVkaGF0LmNvbQpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCmI5OTVkNjAgbnNp
czogRml4IGJ1aWxkIGZvciA2NCBiaXQgaW5zdGFsbGVyCjllNWJlNjYgdGFyZ2V0L2kzODY6IGZp
eCBvcGVyYW5kIG9yZGVyIGZvciBQREVQIGFuZCBQRVhUCjdmZDM5YTUgdGVzdHMvZG9ja2VyLCB0
ZXN0cy92bTogcmVtb3ZlIHNldHVwdG9vbHMgZnJvbSBpbWFnZXMKYTEwZjFiMCBjb25maWd1cmU6
IHJlbW92ZSBweXRob24gcGtnX3Jlc291cmNlcyBjaGVjawo5ZmEyZjYzIG1lc29uOiB1c2UgZGVw
ZW5kZW5jeSgpIHRvIGZpbmQgbGlianBlZwoKPT09IE9VVFBVVCBCRUdJTiA9PT0KMS81IENoZWNr
aW5nIGNvbW1pdCA5ZmEyZjYzODAyMGYgKG1lc29uOiB1c2UgZGVwZW5kZW5jeSgpIHRvIGZpbmQg
bGlianBlZykKMi81IENoZWNraW5nIGNvbW1pdCBhMTBmMWIwMmYzNDUgKGNvbmZpZ3VyZTogcmVt
b3ZlIHB5dGhvbiBwa2dfcmVzb3VyY2VzIGNoZWNrKQozLzUgQ2hlY2tpbmcgY29tbWl0IDdmZDM5
YTVlYjRlMCAodGVzdHMvZG9ja2VyLCB0ZXN0cy92bTogcmVtb3ZlIHNldHVwdG9vbHMgZnJvbSBp
bWFnZXMpCjQvNSBDaGVja2luZyBjb21taXQgOWU1YmU2NjQ4ZTk2ICh0YXJnZXQvaTM4NjogZml4
IG9wZXJhbmQgb3JkZXIgZm9yIFBERVAgYW5kIFBFWFQpCldBUk5JTkc6IEJsb2NrIGNvbW1lbnRz
IHVzZSBhIGxlYWRpbmcgLyogb24gYSBzZXBhcmF0ZSBsaW5lCiMyOTogRklMRTogdGFyZ2V0L2kz
ODYvdHJhbnNsYXRlLmM6MzkzOToKKyAgICAgICAgICAgICAgICAvKiBOb3RlIHRoYXQgYnkgemVy
by1leHRlbmRpbmcgdGhlIHNvdXJjZSBvcGVyYW5kLCB3ZQoKV0FSTklORzogQmxvY2sgY29tbWVu
dHMgdXNlIGEgbGVhZGluZyAvKiBvbiBhIHNlcGFyYXRlIGxpbmUKIzQ2OiBGSUxFOiB0YXJnZXQv
aTM4Ni90cmFuc2xhdGUuYzozOTU3OgorICAgICAgICAgICAgICAgIC8qIE5vdGUgdGhhdCBieSB6
ZXJvLWV4dGVuZGluZyB0aGUgc291cmNlIG9wZXJhbmQsIHdlCgpXQVJOSU5HOiBhZGRlZCwgbW92
ZWQgb3IgZGVsZXRlZCBmaWxlKHMpLCBkb2VzIE1BSU5UQUlORVJTIG5lZWQgdXBkYXRpbmc/CiM3
MzogCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CgpFUlJPUjogb3BlbiBicmFjZSAneycgZm9sbG93aW5n
IGZ1bmN0aW9uIGRlY2xhcmF0aW9ucyBnbyBvbiB0aGUgbmV4dCBsaW5lCiM4MjogRklMRTogdGVz
dHMvdGNnL2kzODYvdGVzdC1pMzg2LWJtaTIuYzo1OgoraW50IG1haW4oaW50IGFyZ2MsIGNoYXIg
KmFyZ3ZbXSkgewoKV0FSTklORzogbGluZSBvdmVyIDgwIGNoYXJhY3RlcnMKIzkzOiBGSUxFOiB0
ZXN0cy90Y2cvaTM4Ni90ZXN0LWkzODYtYm1pMi5jOjE2OgorICAgIGFzbSB2b2xhdGlsZSAoInBk
ZXBxICAgJTIsICUxLCAlMCIgOiAiPXIiKHJlc3VsdDY0KSA6ICJyIihyZXN1bHQ2NCksICJtIiht
YXNrKSk7CgpXQVJOSU5HOiBsaW5lIG92ZXIgODAgY2hhcmFjdGVycwojOTY6IEZJTEU6IHRlc3Rz
L3RjZy9pMzg2L3Rlc3QtaTM4Ni1ibWkyLmM6MTk6CisgICAgYXNtIHZvbGF0aWxlICgicGV4dHEg
ICAlMiwgJTEsICUwIiA6ICI9ciIocmVzdWx0NjQpIDogInIiKC0xdWxsKSwgIm0iKG1hc2spKTsK
CldBUk5JTkc6IGxpbmUgb3ZlciA4MCBjaGFyYWN0ZXJzCiM5OTogRklMRTogdGVzdHMvdGNnL2kz
ODYvdGVzdC1pMzg2LWJtaTIuYzoyMjoKKyAgICBhc20gdm9sYXRpbGUgKCJwZGVwcSAgICUyLCAl
MSwgJTAiIDogIj1yIihyZXN1bHQ2NCkgOiAiciIoLTF1bGwpLCAibSIobWFzaykpOwoKV0FSTklO
RzogbGluZSBvdmVyIDgwIGNoYXJhY3RlcnMKIzEwMzogRklMRTogdGVzdHMvdGNnL2kzODYvdGVz
dC1pMzg2LWJtaTIuYzoyNjoKKyAgICBhc20gdm9sYXRpbGUgKCJwZXh0bCAgICUyLCAlazEsICVr
MCIgOiAiPXIiKHJlc3VsdDMyKSA6ICJyIihlaGxvKSwgIm0iKG1hc2spKTsKCldBUk5JTkc6IGxp
bmUgb3ZlciA4MCBjaGFyYWN0ZXJzCiMxMDY6IEZJTEU6IHRlc3RzL3RjZy9pMzg2L3Rlc3QtaTM4
Ni1ibWkyLmM6Mjk6CisgICAgYXNtIHZvbGF0aWxlICgicGRlcGwgICAlMiwgJWsxLCAlazAiIDog
Ij1yIihyZXN1bHQzMikgOiAiciIocmVzdWx0MzIpLCAibSIobWFzaykpOwoKV0FSTklORzogbGlu
ZSBvdmVyIDgwIGNoYXJhY3RlcnMKIzEwOTogRklMRTogdGVzdHMvdGNnL2kzODYvdGVzdC1pMzg2
LWJtaTIuYzozMjoKKyAgICBhc20gdm9sYXRpbGUgKCJwZXh0bCAgICUyLCAlazEsICVrMCIgOiAi
PXIiKHJlc3VsdDMyKSA6ICJyIigtMXVsbCksICJtIihtYXNrKSk7CgpXQVJOSU5HOiBsaW5lIG92
ZXIgODAgY2hhcmFjdGVycwojMTEyOiBGSUxFOiB0ZXN0cy90Y2cvaTM4Ni90ZXN0LWkzODYtYm1p
Mi5jOjM1OgorICAgIGFzbSB2b2xhdGlsZSAoInBkZXBsICAgJTIsICVrMSwgJWswIiA6ICI9ciIo
cmVzdWx0MzIpIDogInIiKC0xdWxsKSwgIm0iKG1hc2spKTsKCnRvdGFsOiAxIGVycm9ycywgMTAg
d2FybmluZ3MsIDgxIGxpbmVzIGNoZWNrZWQKClBhdGNoIDQvNSBoYXMgc3R5bGUgcHJvYmxlbXMs
IHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2
ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5U
QUlORVJTLgoKNS81IENoZWNraW5nIGNvbW1pdCBiOTk1ZDYwNDQ2YWEgKG5zaXM6IEZpeCBidWls
ZCBmb3IgNjQgYml0IGluc3RhbGxlcikKPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQg
ZXhpdGVkIHdpdGggY29kZTogMQoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDov
L3BhdGNoZXcub3JnL2xvZ3MvMjAyMDExMjYwNzU5MjEuMzExNjMyMS0xLXBib256aW5pQHJlZGhh
dC5jb20vdGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0
ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFz
ZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

