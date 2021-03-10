Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC223346A4
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 19:27:11 +0100 (CET)
Received: from localhost ([::1]:48064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK3Y6-0002Dq-Cd
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 13:27:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lK3WV-0001Bs-Rt
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 13:25:31 -0500
Resent-Date: Wed, 10 Mar 2021 13:25:31 -0500
Resent-Message-Id: <E1lK3WV-0001Bs-Rt@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lK3WS-00011h-NJ
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 13:25:31 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1615400698; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Eoo1fI1CsbcNjxl25JJCf7ULWhxDfObR10TS0hsAN5SLGb+vfJJ75zIaETodLsoXr6suoZVPXk41DDkWZuAx9znwVTN9mqftYKg3Cm9vykLYzejoU8fmGyCPeQ0V/jIjG0oLIL9+lYoOe1HMvomlJv0Yg+k/xi3GpQDs1Q+vmxg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1615400698;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=GosbIcOdS1fQ7Q9HkeEzTTYSbpS4oItw0g3WaCipgkk=; 
 b=BlY2GGSPu4zwu2BL9tA60Qpa5MSMr/SqXU8FTDe2sKLwyYOV0ipMhjJhIsQr10VnN1eculA2TLIQrAAG5r5yttN/Xhnki2QrW6fYvBtXxXVr0USsXZGUVUBly+HbiD7Wezv6yVxxzvInH80RlNOdF8CLcEBFbQO+pfKSiDZFAyE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1615400683678992.4891599022453;
 Wed, 10 Mar 2021 10:24:43 -0800 (PST)
In-Reply-To: <726fc52e2f4ae6914ae43263bc02721a6c0eb6e7.1615398669.git.huangy81@chinatelecom.cn>
Subject: Re: [RFC] tests/migration: introduce multifd into guestperf toolkit
Message-ID: <161540068259.3874.1699795445911271818@f3770d8ad632>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: huangy81@chinatelecom.cn
Date: Wed, 10 Mar 2021 10:24:43 -0800 (PST)
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
Cc: crosa@redhat.com, huangy81@chinatelecom.cn, qemu-devel@nongnu.org,
 ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS83MjZmYzUyZTJmNGFlNjkxNGFl
NDMyNjNiYzAyNzIxYTZjMGViNmU3LjE2MTUzOTg2NjkuZ2l0Lmh1YW5neTgxQGNoaW5hdGVsZWNv
bS5jbi8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxl
IHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKVHlwZTog
c2VyaWVzCk1lc3NhZ2UtaWQ6IDcyNmZjNTJlMmY0YWU2OTE0YWU0MzI2M2JjMDI3MjFhNmMwZWI2
ZTcuMTYxNTM5ODY2OS5naXQuaHVhbmd5ODFAY2hpbmF0ZWxlY29tLmNuClN1YmplY3Q6IFtSRkNd
IHRlc3RzL21pZ3JhdGlvbjogaW50cm9kdWNlIG11bHRpZmQgaW50byBndWVzdHBlcmYgdG9vbGtp
dAoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJh
c2UgPiAvZGV2L251bGwgfHwgZXhpdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxp
bWl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1s
b2NhbCBkaWZmLmFsZ29yaXRobSBoaXN0b2dyYW0KLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1t
YWlsYmFjayBiYXNlLi4KPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5
YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQKRnJvbSBodHRwczovL2dpdGh1Yi5jb20v
cGF0Y2hldy1wcm9qZWN0L3FlbXUKIC0gW3RhZyB1cGRhdGVdICAgICAgcGF0Y2hldy8yMDIxMDMx
MDE3MzAwNC40MjAxOTAtMS1zdGVmYW5oYUByZWRoYXQuY29tIC0+IHBhdGNoZXcvMjAyMTAzMTAx
NzMwMDQuNDIwMTkwLTEtc3RlZmFuaGFAcmVkaGF0LmNvbQogKiBbbmV3IHRhZ10gICAgICAgICBw
YXRjaGV3LzcyNmZjNTJlMmY0YWU2OTE0YWU0MzI2M2JjMDI3MjFhNmMwZWI2ZTcuMTYxNTM5ODY2
OS5naXQuaHVhbmd5ODFAY2hpbmF0ZWxlY29tLmNuIC0+IHBhdGNoZXcvNzI2ZmM1MmUyZjRhZTY5
MTRhZTQzMjYzYmMwMjcyMWE2YzBlYjZlNy4xNjE1Mzk4NjY5LmdpdC5odWFuZ3k4MUBjaGluYXRl
bGVjb20uY24KU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0Jwo0MjRmYWQ3IHRlc3RzL21p
Z3JhdGlvbjogaW50cm9kdWNlIG11bHRpZmQgaW50byBndWVzdHBlcmYgdG9vbGtpdAoKPT09IE9V
VFBVVCBCRUdJTiA9PT0KRVJST1I6IGxpbmUgb3ZlciA5MCBjaGFyYWN0ZXJzCiMxMTk6IEZJTEU6
IHRlc3RzL21pZ3JhdGlvbi9ndWVzdHBlcmYvc2hlbGwucHk6MTI1OgorICAgICAgICBwYXJzZXIu
YWRkX2FyZ3VtZW50KCItLW11bHRpZmQiLCBkZXN0PSJtdWx0aWZkIiwgZGVmYXVsdD1GYWxzZSwg
YWN0aW9uPSJzdG9yZV90cnVlIikKCkVSUk9SOiBsaW5lIG92ZXIgOTAgY2hhcmFjdGVycwojMTIw
OiBGSUxFOiB0ZXN0cy9taWdyYXRpb24vZ3Vlc3RwZXJmL3NoZWxsLnB5OjEyNjoKKyAgICAgICAg
cGFyc2VyLmFkZF9hcmd1bWVudCgiLS1tdWx0aWZkLWNoYW5uZWxzIiwgZGVzdD0ibXVsdGlmZF9j
aGFubmVscyIsIGRlZmF1bHQ9MiwgdHlwZT1pbnQpCgp0b3RhbDogMiBlcnJvcnMsIDAgd2Fybmlu
Z3MsIDkzIGxpbmVzIGNoZWNrZWQKCkNvbW1pdCA0MjRmYWQ3ZmJjM2YgKHRlc3RzL21pZ3JhdGlv
bjogaW50cm9kdWNlIG11bHRpZmQgaW50byBndWVzdHBlcmYgdG9vbGtpdCkgaGFzIHN0eWxlIHBy
b2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2Ug
cG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBp
biBNQUlOVEFJTkVSUy4KPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdp
dGggY29kZTogMQoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcu
b3JnL2xvZ3MvNzI2ZmM1MmUyZjRhZTY5MTRhZTQzMjYzYmMwMjcyMWE2YzBlYjZlNy4xNjE1Mzk4
NjY5LmdpdC5odWFuZ3k4MUBjaGluYXRlbGVjb20uY24vdGVzdGluZy5jaGVja3BhdGNoLz90eXBl
PW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFto
dHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hl
dy1kZXZlbEByZWRoYXQuY29t

