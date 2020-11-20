Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 377172BB0A8
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 17:35:54 +0100 (CET)
Received: from localhost ([::1]:52368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg9O5-0001AR-7G
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 11:35:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kg9Gz-0002EF-EY; Fri, 20 Nov 2020 11:28:34 -0500
Resent-Date: Fri, 20 Nov 2020 11:28:33 -0500
Resent-Message-Id: <E1kg9Gz-0002EF-EY@lists.gnu.org>
Received: from sender4-of-o57.zoho.com ([136.143.188.57]:21786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kg9Gv-0006hp-Bl; Fri, 20 Nov 2020 11:28:32 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1605889666; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=MZolvs1Lfhcal1Ulyz87pB6DtmS8MXLLXcBueuc1DEY1Ll4/ebolgBzObFckoaM0utiucZW9tXT+UDaNYvCrmm6uBrHd/5wm+1kXtbnNPg83KIl20u7DTGYR1ufOJDJ2qcY8Mqxb8f7x6OCKx81oy1+MyhGp7RIL2e6+isi59BU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1605889666;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=Nc+pk/2wKobOJqu4y+bgyud+XPtTXI19fbEbi5RVY48=; 
 b=baMF/3ssXiSLZ6HkA0G5A4iLXs1eg7RtAhCshprKvP+1H7YN84LISHdplaW59xf2aeK/czMoZxpHsR6KshRGV4YlqBTRcWwG8BMKiO8IxoIaNXPcjPmHu7L6FOi/y9mQh5mY6Tdck2UQfr1sCV5By6PLPjRMSy4mE7HDzYyJB/k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1605889664847305.9138749527988;
 Fri, 20 Nov 2020 08:27:44 -0800 (PST)
In-Reply-To: <20201120161622.1537-1-vsementsov@virtuozzo.com>
Subject: Re: [PATCH RFC 0/5] Fix accidental crash in iotest 30
Message-ID: <160588966278.47.2041524974915724124@9aeb27d8af94>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: vsementsov@virtuozzo.com
Date: Fri, 20 Nov 2020 08:27:44 -0800 (PST)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.57; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o57.zoho.com
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, vsementsov@virtuozzo.com,
 berto@igalia.com, qemu-block@nongnu.org, jsnow@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com, den@openvz.org,
 pbonzini@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMTEyMDE2MTYyMi4xNTM3
LTEtdnNlbWVudHNvdkB2aXJ0dW96em8uY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRv
IGhhdmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1v
cmUgaW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMDExMjAxNjE2MjIu
MTUzNy0xLXZzZW1lbnRzb3ZAdmlydHVvenpvLmNvbQpTdWJqZWN0OiBbUEFUQ0ggUkZDIDAvNV0g
Rml4IGFjY2lkZW50YWwgY3Jhc2ggaW4gaW90ZXN0IDMwCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4g
PT09CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAK
Z2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwg
ZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3Rv
Z3JhbQouL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBT
Q1JJUFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4
ODcxMzM4NApGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdQogKiBb
bmV3IHRhZ10gICAgICAgICBwYXRjaGV3LzIwMjAxMTIwMTYxNjIyLjE1MzctMS12c2VtZW50c292
QHZpcnR1b3p6by5jb20gLT4gcGF0Y2hldy8yMDIwMTEyMDE2MTYyMi4xNTM3LTEtdnNlbWVudHNv
dkB2aXJ0dW96em8uY29tClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKOWFlZDU4MCBi
bG9jazogcHJvdGVjdCBzb21lIGdyYXBoLW1vZGlmeW5nIHRoaW5ncyBieSBtdXRleAo3NGM0NTU3
IGJsb2NrOiBtb3ZlIHNvbWUgbWlycm9yIGFuZCBzdHJlYW0gaGFuZGxlcnMgdG8gY29yb3V0aW5l
CmZhZTcwYmQgc2NyaXB0cy9ibG9jay1jb3JvdXRpbmUtd3JhcHBlci5weTogYWxsb3cgbW9yZSBm
dW5jdGlvbiB0eXBlcwo3YmNjZjJjIGlvdGVzdC0zMC1zaG9ydGVuOiBjb25jZW50cmF0ZSBvbiBm
YWlsaW5nIHRlc3QgY2FzZQoxYzc5ZjA4IGFib3J0LW9uLXNldC10by10cnVlCgo9PT0gT1VUUFVU
IEJFR0lOID09PQoxLzUgQ2hlY2tpbmcgY29tbWl0IDFjNzlmMDg2ZWFlOCAoYWJvcnQtb24tc2V0
LXRvLXRydWUpCkVSUk9SOiBkbyBub3QgaW5pdGlhbGlzZSBnbG9iYWxzIHRvIDAgb3IgTlVMTAoj
MTg6IEZJTEU6IGJsb2NrLmM6ODc6Citib29sIGFib3J0X29uX3NldF90b190cnVlID0gZmFsc2U7
CgpFUlJPUjogbGluZSBvdmVyIDkwIGNoYXJhY3RlcnMKIzI3OiBGSUxFOiBibG9jay5jOjIwMDc6
CisgICAgICAgIGlmICgoYWRkZWRfcGVybXMgfHwgcmVtb3ZlZF9zaGFyZWRfcGVybXMpICYmIHRp
Z2h0ZW5fcmVzdHJpY3Rpb25zID09ICZhYm9ydF9vbl9zZXRfdG9fdHJ1ZSkgewoKV0FSTklORzog
bGluZSBvdmVyIDgwIGNoYXJhY3RlcnMKIzQ0OiBGSUxFOiBibG9jay5jOjIwNzU6CisgICAgICAg
ICAgICByZXQgPSBiZHJ2X2NoaWxkX2NoZWNrX3Blcm0oYywgcSwgY3VyX3Blcm0sIGN1cl9zaGFy
ZWQsIGlnbm9yZV9jaGlsZHJlbiwKCldBUk5JTkc6IGxpbmUgb3ZlciA4MCBjaGFyYWN0ZXJzCiM0
NzogRklMRTogYmxvY2suYzoyMDc4OgorICAgICAgICAgICAgcmV0ID0gYmRydl9jaGlsZF9jaGVj
a19wZXJtKGMsIHEsIGN1cl9wZXJtLCBjdXJfc2hhcmVkLCBpZ25vcmVfY2hpbGRyZW4sCgpXQVJO
SU5HOiBsaW5lIG92ZXIgODAgY2hhcmFjdGVycwojNDg6IEZJTEU6IGJsb2NrLmM6MjA3OToKKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0aWdodGVuX3Jlc3RyaWN0aW9u
cyA/ICZjaGlsZF90aWdodGVuX3Jlc3RyCgp0b3RhbDogMiBlcnJvcnMsIDMgd2FybmluZ3MsIDc0
IGxpbmVzIGNoZWNrZWQKClBhdGNoIDEvNSBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZp
ZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRo
ZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgoKMi81
IENoZWNraW5nIGNvbW1pdCA3YmNjZjJjZjhiZmYgKGlvdGVzdC0zMC1zaG9ydGVuOiBjb25jZW50
cmF0ZSBvbiBmYWlsaW5nIHRlc3QgY2FzZSkKMy81IENoZWNraW5nIGNvbW1pdCBmYWU3MGJkMzg1
MWEgKHNjcmlwdHMvYmxvY2stY29yb3V0aW5lLXdyYXBwZXIucHk6IGFsbG93IG1vcmUgZnVuY3Rp
b24gdHlwZXMpCldBUk5JTkc6IGxpbmUgb3ZlciA4MCBjaGFyYWN0ZXJzCiMzNTogRklMRTogc2Ny
aXB0cy9ibG9jay1jb3JvdXRpbmUtd3JhcHBlci5weTo4MjoKK2Z1bmNfZGVjbF9yZSA9IHJlLmNv
bXBpbGUocideKD9QPHJldHVybl90eXBlPih2b2lkfGludCkpXHMqZ2VuZXJhdGVkX2NvX3dyYXBw
ZXJccyonCgp0b3RhbDogMCBlcnJvcnMsIDEgd2FybmluZ3MsIDgwIGxpbmVzIGNoZWNrZWQKClBh
dGNoIDMvNSBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhl
c2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWlu
ZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgo0LzUgQ2hlY2tpbmcgY29tbWl0IDc0
YzQ1NTdlNmRlYSAoYmxvY2s6IG1vdmUgc29tZSBtaXJyb3IgYW5kIHN0cmVhbSBoYW5kbGVycyB0
byBjb3JvdXRpbmUpCjUvNSBDaGVja2luZyBjb21taXQgOWFlZDU4MDkzMDE4IChibG9jazogcHJv
dGVjdCBzb21lIGdyYXBoLW1vZGlmeW5nIHRoaW5ncyBieSBtdXRleCkKPT09IE9VVFBVVCBFTkQg
PT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKClRoZSBmdWxsIGxvZyBpcyBh
dmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAyMDExMjAxNjE2MjIuMTUzNy0x
LXZzZW1lbnRzb3ZAdmlydHVvenpvLmNvbS90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2Fn
ZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8v
cGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVs
QHJlZGhhdC5jb20=

