Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E31E2D90CD
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 22:49:43 +0100 (CET)
Received: from localhost ([::1]:33608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koZFO-0002SA-Bq
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 16:49:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1koZEb-0001iF-Vb
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 16:48:53 -0500
Resent-Date: Sun, 13 Dec 2020 16:48:53 -0500
Resent-Message-Id: <E1koZEb-0001iF-Vb@lists.gnu.org>
Received: from sender4-of-o52.zoho.com ([136.143.188.52]:21273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1koZEY-0007kW-Id
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 16:48:53 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1607896122; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=K0nZ6Pv42NOHHe85dySu6/4Y6Sn1KSjl0sz4dYsUMX3Df+IPH/hSsW14DauqHj9jjf42sh1x84dTnXWgk/Ij/EKPt2NzCEnOeZAD7eDr+ev57f6bTpMo2Md4LIFLsDqqk9VjrJxKmPwAlRCVZTzSA+0fpzJa9KSDHTMHY599LE0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1607896122;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=fVD/W/rTu8MfvDhbnC1L5oI2FlyENapAAwYqHQ9XRg0=; 
 b=UeXYM3BtGyPveoR1+gS5mD/o133dzimSkkr+Il2WAHbCNdR2yfohF/KXeS68Jb/ltQLzz06YRVsvsX6E7ysnqyR655tDLgKUL9HjGejwtYE5WzifATuR+2XRby1roS+6oGel4fgpztPiNre2zkkHP6DnVe3LzopXMqzThWeb18Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1607896120379322.70296006745207;
 Sun, 13 Dec 2020 13:48:40 -0800 (PST)
In-Reply-To: <20201213213016.457350-1-fontaine.fabrice@gmail.com>
Subject: Re: [PATCH v2] hw/usb/host-libusb.c: fix build with kernel < 5.0
Message-ID: <160789611928.28045.4851957679755627513@600e7e483b3a>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: fontaine.fabrice@gmail.com
Date: Sun, 13 Dec 2020 13:48:40 -0800 (PST)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.52; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o52.zoho.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: fontaine.fabrice@gmail.com, qemu-devel@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMTIxMzIxMzAxNi40NTcz
NTAtMS1mb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVt
cyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZv
cgptb3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjAxMjEzMjEz
MDE2LjQ1NzM1MC0xLWZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tClN1YmplY3Q6IFtQQVRDSCB2
Ml0gaHcvdXNiL2hvc3QtbGlidXNiLmM6IGZpeCBidWlsZCB3aXRoIGtlcm5lbCA8IDUuMAoKPT09
IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAv
ZGV2L251bGwgfHwgZXhpdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAK
Z2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBk
aWZmLmFsZ29yaXRobSBoaXN0b2dyYW0KLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFj
ayBiYXNlLi4KPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4
NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQKRnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hl
dy1wcm9qZWN0L3FlbXUKICogW25ldyB0YWddICAgICAgICAgcGF0Y2hldy8yMDIwMTIxMzIxMzAx
Ni40NTczNTAtMS1mb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbSAtPiBwYXRjaGV3LzIwMjAxMjEz
MjEzMDE2LjQ1NzM1MC0xLWZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tClN3aXRjaGVkIHRvIGEg
bmV3IGJyYW5jaCAndGVzdCcKODVhOWFiNCBody91c2IvaG9zdC1saWJ1c2IuYzogZml4IGJ1aWxk
IHdpdGgga2VybmVsIDwgNS4wCgo9PT0gT1VUUFVUIEJFR0lOID09PQpFUlJPUjogY29kZSBpbmRl
bnQgc2hvdWxkIG5ldmVyIHVzZSB0YWJzCiMzNjogRklMRTogaHcvdXNiL2hvc3QtbGlidXNiLmM6
OTQ1OgorXklkZWZpbmVkKFVTQkRFVkZTX0dFVF9TUEVFRCkkCgp0b3RhbDogMSBlcnJvcnMsIDAg
d2FybmluZ3MsIDkgbGluZXMgY2hlY2tlZAoKQ29tbWl0IDg1YTlhYjQyMzU4MCAoaHcvdXNiL2hv
c3QtbGlidXNiLmM6IGZpeCBidWlsZCB3aXRoIGtlcm5lbCA8IDUuMCkgaGFzIHN0eWxlIHByb2Js
ZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9z
aXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBN
QUlOVEFJTkVSUy4KPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGgg
Y29kZTogMQoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3Jn
L2xvZ3MvMjAyMDEyMTMyMTMwMTYuNDU3MzUwLTEtZm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20v
dGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0
b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5k
IHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

