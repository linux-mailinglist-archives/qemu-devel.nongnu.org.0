Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCD533B018
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 11:38:56 +0100 (CET)
Received: from localhost ([::1]:46538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLkch-0000FD-7P
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 06:38:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lLkb8-0007SF-6K
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 06:37:18 -0400
Resent-Date: Mon, 15 Mar 2021 06:37:18 -0400
Resent-Message-Id: <E1lLkb8-0007SF-6K@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lLkb2-0006T5-Ly
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 06:37:17 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1615804617; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=HU5BQx4IuSLN7RNDlh+LEEpb8PuylsFinBw3PuUXkrxo785uAcoKlrFVQJAVh6ykN256ARTHamyfxuhPaEMbO6AW7Fm3WTH3vTDV/Zgkk23ToRS6MxfXqwNqYhEmHkuCP1WT4xS0wbWQ1w4ven2GN3CCAD8UC7haamV+SYgfqm4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1615804617;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=fjqYTvC10IjFDZGHJYL2Y+1gQWKZp/kPe/S5mUdcJPA=; 
 b=B/grw0yO9Brobm+lCYOX39Zna8fX3bhRv5GSf/pHwr5gJvPjGqijsfq1luQPdzK2+Ey2kb/HoAsRNbMDI3FbW34e3V7La/f/DJhxf7fYC/TiwyQOSw2aqSOZheokhygYYxFmWjGsTtmIgY/rQsAuif+Py9nB77I7EZSGqW1F7X0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1615804615783533.2828911425017;
 Mon, 15 Mar 2021 03:36:55 -0700 (PDT)
In-Reply-To: <20210315103209.20870-1-akihiko.odaki@gmail.com>
Subject: Re: [PATCH] net/macos: implement vmnet-based netdev
Message-ID: <161580460951.23459.5949103988667273286@c9d4d6fbb2f1>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: akihiko.odaki@gmail.com
Date: Mon, 15 Mar 2021 03:36:55 -0700 (PDT)
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
Cc: thuth@redhat.com, stefanha@gmail.com, jasowang@redhat.com,
 armbru@redhat.com, qemu-devel@nongnu.org, phillip@axleos.com,
 akihiko.odaki@gmail.com, hsp.cat7@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDMxNTEwMzIwOS4yMDg3
MC0xLWFraWhpa28ub2Rha2lAZ21haWwuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRv
IGhhdmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1v
cmUgaW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMTAzMTUxMDMyMDku
MjA4NzAtMS1ha2loaWtvLm9kYWtpQGdtYWlsLmNvbQpTdWJqZWN0OiBbUEFUQ0hdIG5ldC9tYWNv
czogaW1wbGVtZW50IHZtbmV0LWJhc2VkIG5ldGRldgoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09
PQojIS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2L251bGwgfHwgZXhpdCAwCmdp
dCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRp
ZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLmFsZ29yaXRobSBoaXN0b2dy
YW0KLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBiYXNlLi4KPT09IFRFU1QgU0NS
SVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3
MTMzODQKRnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUKIC0gW3Rh
ZyB1cGRhdGVdICAgICAgcGF0Y2hldy8yMDIxMDMxNTEwMTM1Mi4xNTI4ODgtMS1tcmV6YW5pbkBy
ZWRoYXQuY29tIC0+IHBhdGNoZXcvMjAyMTAzMTUxMDEzNTIuMTUyODg4LTEtbXJlemFuaW5AcmVk
aGF0LmNvbQogKiBbbmV3IHRhZ10gICAgICAgICBwYXRjaGV3LzIwMjEwMzE1MTAzMjA5LjIwODcw
LTEtYWtpaGlrby5vZGFraUBnbWFpbC5jb20gLT4gcGF0Y2hldy8yMDIxMDMxNTEwMzIwOS4yMDg3
MC0xLWFraWhpa28ub2Rha2lAZ21haWwuY29tClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVz
dCcKNGNlYjI0MiBuZXQvbWFjb3M6IGltcGxlbWVudCB2bW5ldC1iYXNlZCBuZXRkZXYKCj09PSBP
VVRQVVQgQkVHSU4gPT09ClVzZSBvZiB1bmluaXRpYWxpemVkIHZhbHVlICRhY3BpX3Rlc3RleHBl
Y3RlZCBpbiBzdHJpbmcgZXEgYXQgLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgbGluZSAxNTI5LgpX
QVJOSU5HOiBhZGRlZCwgbW92ZWQgb3IgZGVsZXRlZCBmaWxlKHMpLCBkb2VzIE1BSU5UQUlORVJT
IG5lZWQgdXBkYXRpbmc/CiMxNDQ6IApuZXcgZmlsZSBtb2RlIDEwMDY0NAoKRVJST1I6IGV4dGVy
bnMgc2hvdWxkIGJlIGF2b2lkZWQgaW4gLmMgZmlsZXMKIzE3ODogRklMRTogbmV0L3ZtbmV0LW1h
Y29zLmM6MzA6CitpbnQgbmV0X2luaXRfdm1uZXRfbWFjb3MoY29uc3QgTmV0ZGV2ICpuZXRkZXYs
IGNvbnN0IGNoYXIgKm5hbWUsCgpXQVJOSU5HOiBhcmNoaXRlY3R1cmUgc3BlY2lmaWMgZGVmaW5l
cyBzaG91bGQgYmUgYXZvaWRlZAojMjAzOiBGSUxFOiBuZXQvdm1uZXQtbWFjb3MuYzo1NToKKyNp
ZiBfX01BQ19PU19YX1ZFUlNJT05fTUFYX0FMTE9XRUQgPj0gMTEwMDAwCgpFUlJPUjogc3BhY2Vz
IHJlcXVpcmVkIGFyb3VuZCB0aGF0ICdeJyAoY3R4OkV4VikKIzI4NzogRklMRTogbmV0L3ZtbmV0
LW1hY29zLmM6MTM5OgorICAgICAgICBeYm9vbChzaXplX3QgaW5kZXgsIHhwY19vYmplY3RfdCAg
X05vbm51bGwgdmFsdWUpIHsKICAgICAgICAgXgoKRVJST1I6IHNwYWNlcyByZXF1aXJlZCBhcm91
bmQgdGhhdCAnXicgKGN0eDpFeFYpCiMzMDA6IEZJTEU6IG5ldC92bW5ldC1tYWNvcy5jOjE1MjoK
KyAgICAgICAgICAgIF5ib29sKHNpemVfdCBpbmRleCwgeHBjX29iamVjdF90ICBfTm9ubnVsbCB2
YWx1ZSkgewogICAgICAgICAgICAgXgoKV0FSTklORzogbGluZSBvdmVyIDgwIGNoYXJhY3RlcnMK
IzM4NTogRklMRTogbmV0L3ZtbmV0LW1hY29zLmM6MjM3OgorICAgIHhwY19vYmplY3RfdCBpZmFj
ZV9kZXNjID0gX2NvbnN0cnVjdF92bW5ldF9pbnRlcmZhY2VfZGVzY3JpcHRpb24odm1uZXRfb3B0
cyk7CgpFUlJPUjogc3BhY2VzIHJlcXVpcmVkIGFyb3VuZCB0aGF0ICdeJyAoY3R4OkV4VikKIzQx
OTogRklMRTogbmV0L3ZtbmV0LW1hY29zLmM6MjcxOgorICAgICAgICBeKHZtbmV0X3JldHVybl90
IHN0YXR1cywgeHBjX29iamVjdF90ICBfTnVsbGFibGUgaW50ZXJmYWNlX3BhcmFtKSB7CiAgICAg
ICAgIF4KCkVSUk9SOiBzcGFjZXMgcmVxdWlyZWQgYXJvdW5kIHRoYXQgJ14nIChjdHg6RXhWKQoj
NTAwOiBGSUxFOiBuZXQvdm1uZXQtbWFjb3MuYzozNTI6CisgICAgICAgIF4oaW50ZXJmYWNlX2V2
ZW50X3QgZXZlbnRfbWFzaywgeHBjX29iamVjdF90ICBfTm9ubnVsbCBldmVudCkgewogICAgICAg
ICBeCgpXQVJOSU5HOiBCbG9jayBjb21tZW50cyB1c2UgYSBsZWFkaW5nIC8qIG9uIGEgc2VwYXJh
dGUgbGluZQojNTM4OiBGSUxFOiBuZXQvdm1uZXQtbWFjb3MuYzozOTA6CisgICAgICAgIC8qIERp
c3BhdGNoIHRoaXMgYmxvY2sgdG8gYSBnbG9iYWwgcXVldWUgaW5zdGVhZCBvZiB0aGUgbWFpbiBx
dWV1ZSwKCkVSUk9SOiBzcGFjZXMgcmVxdWlyZWQgYXJvdW5kIHRoYXQgJ14nIChjdHg6RXhWKQoj
NTQ1OiBGSUxFOiBuZXQvdm1uZXQtbWFjb3MuYzozOTc6CisgICAgICAgICAgICAgICAgICAgICAg
IF57CiAgICAgICAgICAgICAgICAgICAgICAgIF4KCnRvdGFsOiA2IGVycm9ycywgNCB3YXJuaW5n
cywgNjU0IGxpbmVzIGNoZWNrZWQKCkNvbW1pdCA0Y2ViMjQyZjI4MWMgKG5ldC9tYWNvczogaW1w
bGVtZW50IHZtbmV0LWJhc2VkIG5ldGRldikgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2
aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0
aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KPT09
IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKClRoZSBm
dWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAyMTAzMTUx
MDMyMDkuMjA4NzAtMS1ha2loaWtvLm9kYWtpQGdtYWlsLmNvbS90ZXN0aW5nLmNoZWNrcGF0Y2gv
P3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNo
ZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBw
YXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

