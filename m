Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 277E12C2B2E
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 16:25:23 +0100 (CET)
Received: from localhost ([::1]:32796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khaC2-0000SK-0n
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 10:25:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kha8u-0004vp-4c
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 10:22:09 -0500
Resent-Date: Tue, 24 Nov 2020 10:22:08 -0500
Resent-Message-Id: <E1kha8u-0004vp-4c@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kha8j-0007z8-LJ
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 10:22:03 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1606231307; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Dmla1Y+eVrjWFs91GZaRq1Ck/sjwFxwktJ5+7FLdeF2ccmTvmle5wSgKTlqZyAmZ6/OwSkth5bT8tBJm41DQXhDtowo4DU8Xlx5ZykbyFL8JbxBxY1Bd7sZQ741sIlB6qmI3VdwJmwSUHcpBpduh03tDDxURgTk0Y8wNwW3D4PU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1606231307;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=tgvW7P2yUOe6w839HxynOUYcL/bU6UM8f5IY0JmW5xQ=; 
 b=CZyNS2Y0WtGc5pMZ5a1NsZktoeUzkRTzRA6r9cG+CY4qT6lWMVByRxss80US0OvyVB3TdyTXwfXblyXS/G+d+ZmdMX83tbiL5s0B2C1cVgOIunhbPJKzvUKgAR479tf/FKHdQXr5y6cX1JWIgFyjNRx5ZmoPo7N4LPsgK4MY34w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1606231304985420.2584881565733;
 Tue, 24 Nov 2020 07:21:44 -0800 (PST)
In-Reply-To: <20201124151500.2945356-1-ehabkost@redhat.com>
Subject: Re: [PULL 0/1] PCI host devaddr property fix for 5.2
Message-ID: <160623130350.25614.8973973535060718811@9aeb27d8af94>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: ehabkost@redhat.com
Date: Tue, 24 Nov 2020 07:21:44 -0800 (PST)
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
Cc: pbonzini@redhat.com, berrange@redhat.com, qemu-devel@nongnu.org,
 ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMTEyNDE1MTUwMC4yOTQ1
MzU2LTEtZWhhYmtvc3RAcmVkaGF0LmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBo
YXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3Jl
IGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjAxMTI0MTUxNTAwLjI5
NDUzNTYtMS1laGFia29zdEByZWRoYXQuY29tClN1YmplY3Q6IFtQVUxMIDAvMV0gUENJIGhvc3Qg
ZGV2YWRkciBwcm9wZXJ0eSBmaXggZm9yIDUuMgoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQoj
IS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2L251bGwgfHwgZXhpdCAwCmdpdCBj
b25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYu
cmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLmFsZ29yaXRobSBoaXN0b2dyYW0K
Li9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBiYXNlLi4KPT09IFRFU1QgU0NSSVBU
IEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMz
ODQKRnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUKICogW25ldyB0
YWddICAgICAgICAgcGF0Y2hldy8yMDIwMTEyNDE1MTUwMC4yOTQ1MzU2LTEtZWhhYmtvc3RAcmVk
aGF0LmNvbSAtPiBwYXRjaGV3LzIwMjAxMTI0MTUxNTAwLjI5NDUzNTYtMS1laGFia29zdEByZWRo
YXQuY29tClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKZDY4MWRjMyBSZXZlcnQgImh3
L2NvcmUvcWRldi1wcm9wZXJ0aWVzOiBVc2UgcWVtdV9zdHJ0b3VsKCkgaW4gc2V0X3BjaV9ob3N0
X2RldmFkZHIoKSIKCj09PSBPVVRQVVQgQkVHSU4gPT09CkVSUk9SOiBjb25zaWRlciB1c2luZyBx
ZW11X3N0cnRvdWwgaW4gcHJlZmVyZW5jZSB0byBzdHJ0b3VsCiM0MjogRklMRTogaHcvY29yZS9x
ZGV2LXByb3BlcnRpZXMtc3lzdGVtLmM6ODc2OgorICAgIHZhbCA9IHN0cnRvdWwocCwgJmUsIDE2
KTsKCkVSUk9SOiBjb25zaWRlciB1c2luZyBxZW11X3N0cnRvdWwgaW4gcHJlZmVyZW5jZSB0byBz
dHJ0b3VsCiM1MTogRklMRTogaHcvY29yZS9xZGV2LXByb3BlcnRpZXMtc3lzdGVtLmM6ODgzOgor
ICAgIHZhbCA9IHN0cnRvdWwocCwgJmUsIDE2KTsKCkVSUk9SOiBjb25zaWRlciB1c2luZyBxZW11
X3N0cnRvdWwgaW4gcHJlZmVyZW5jZSB0byBzdHJ0b3VsCiM2MTogRklMRTogaHcvY29yZS9xZGV2
LXByb3BlcnRpZXMtc3lzdGVtLmM6ODkxOgorICAgICAgICB2YWwgPSBzdHJ0b3VsKHAsICZlLCAx
Nik7CgpFUlJPUjogY29uc2lkZXIgdXNpbmcgcWVtdV9zdHJ0b3VsIGluIHByZWZlcmVuY2UgdG8g
c3RydG91bAojNzM6IEZJTEU6IGh3L2NvcmUvcWRldi1wcm9wZXJ0aWVzLXN5c3RlbS5jOjkwMjoK
KyAgICB2YWwgPSBzdHJ0b3VsKHAsICZlLCAxMCk7Cgp0b3RhbDogNCBlcnJvcnMsIDAgd2Fybmlu
Z3MsIDU2IGxpbmVzIGNoZWNrZWQKCkNvbW1pdCBkNjgxZGMzM2QxMzggKFJldmVydCAiaHcvY29y
ZS9xZGV2LXByb3BlcnRpZXM6IFVzZSBxZW11X3N0cnRvdWwoKSBpbiBzZXRfcGNpX2hvc3RfZGV2
YWRkcigpIikgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRo
ZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFp
bmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KPT09IE9VVFBVVCBFTkQgPT09CgpU
ZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFi
bGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAyMDExMjQxNTE1MDAuMjk0NTM1Ni0xLWVo
YWJrb3N0QHJlZGhhdC5jb20vdGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpF
bWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcu
b3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQu
Y29t

