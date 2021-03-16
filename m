Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F4533DA84
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 18:20:47 +0100 (CET)
Received: from localhost ([::1]:45558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMDN8-00022m-G7
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 13:20:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lMD77-0001Bk-6H; Tue, 16 Mar 2021 13:04:13 -0400
Resent-Date: Tue, 16 Mar 2021 13:04:13 -0400
Resent-Message-Id: <E1lMD77-0001Bk-6H@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lMD73-0004Pt-9s; Tue, 16 Mar 2021 13:04:12 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1615914243; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=APVK+Vr3NoAD97fKForVr5pOACuEjrco16i7gfEQ0G4SnLYZUJSMRErwkX++XqcyC2C34VmdmOtI+Wt0mzDHuNUMjHMHz6yBZj79QYGEplelRRJy9e0jd1fGvV03LPv+jwmxf7Beic7Za9RfmEDHyj1G+rmo39mMRVlPGvDA6/E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1615914243;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=ZgjQdtuJsT4HMD+M1TveOQB7gbXCbmnXTVHrpqK6XUE=; 
 b=hzOfWkWmy5/VFUz1mvGVU9aRT7uDMewcWNaCjTS3hBNtV0tLusSznTDvUQTq+nANt2qrY+W7altB65tVau/UrJ9aH8QHrmRIFGwr2XZQe4V5Xi5IVT1Y+B1Ec7BxeaEj91wafyEKjWttvBX7sTp3jAD2OWZJQlh7AX9ssxP9dg0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1615914229382483.7943073805267;
 Tue, 16 Mar 2021 10:03:49 -0700 (PDT)
In-Reply-To: <20210316154910.25804-1-rebecca@nuviainc.com>
Subject: Re: [PATCH v4 0/3] target/arm: Add support for FEAT_TLBIOS and
 FEAT_TLBIRANGE
Message-ID: <161591422750.11496.15457338112726761074@c9d4d6fbb2f1>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: rebecca@nuviainc.com
Date: Tue, 16 Mar 2021 10:03:49 -0700 (PDT)
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, richard.henderson@linaro.org,
 rebecca@nuviainc.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDMxNjE1NDkxMC4yNTgw
NC0xLXJlYmVjY2FAbnV2aWFpbmMuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhh
dmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUg
aW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMTAzMTYxNTQ5MTAuMjU4
MDQtMS1yZWJlY2NhQG51dmlhaW5jLmNvbQpTdWJqZWN0OiBbUEFUQ0ggdjQgMC8zXSB0YXJnZXQv
YXJtOiBBZGQgc3VwcG9ydCBmb3IgRkVBVF9UTEJJT1MgYW5kIEZFQVRfVExCSVJBTkdFCgo9PT0g
VEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9k
ZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApn
aXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRp
ZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQouL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNr
IGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3
ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3
LXByb2plY3QvcWVtdQogLSBbdGFnIHVwZGF0ZV0gICAgICBwYXRjaGV3LzIwMjEwMjEyMTUwMjU2
Ljg4NS0xLXpoaXdlaV9saXVAYy1za3kuY29tIC0+IHBhdGNoZXcvMjAyMTAyMTIxNTAyNTYuODg1
LTEtemhpd2VpX2xpdUBjLXNreS5jb20KIC0gW3RhZyB1cGRhdGVdICAgICAgcGF0Y2hldy8yMDIx
MDMxNjEyMDQyMC4xOTY1OC0xLWJtZW5nLmNuQGdtYWlsLmNvbSAtPiBwYXRjaGV3LzIwMjEwMzE2
MTIwNDIwLjE5NjU4LTEtYm1lbmcuY25AZ21haWwuY29tCiAtIFt0YWcgdXBkYXRlXSAgICAgIHBh
dGNoZXcvMjAyMTAzMTYxMzEzNTMuNDUzMy0xLXBldGVyLm1heWRlbGxAbGluYXJvLm9yZyAtPiBw
YXRjaGV3LzIwMjEwMzE2MTMxMzUzLjQ1MzMtMS1wZXRlci5tYXlkZWxsQGxpbmFyby5vcmcKIC0g
W3RhZyB1cGRhdGVdICAgICAgcGF0Y2hldy8yMDIxMDMxNjEzNDQ1Ni4zMjQzMTAyLTEtbWFyY2Fu
ZHJlLmx1cmVhdUByZWRoYXQuY29tIC0+IHBhdGNoZXcvMjAyMTAzMTYxMzQ0NTYuMzI0MzEwMi0x
LW1hcmNhbmRyZS5sdXJlYXVAcmVkaGF0LmNvbQogKiBbbmV3IHRhZ10gICAgICAgICBwYXRjaGV3
LzIwMjEwMzE2MTU0OTEwLjI1ODA0LTEtcmViZWNjYUBudXZpYWluYy5jb20gLT4gcGF0Y2hldy8y
MDIxMDMxNjE1NDkxMC4yNTgwNC0xLXJlYmVjY2FAbnV2aWFpbmMuY29tClN3aXRjaGVkIHRvIGEg
bmV3IGJyYW5jaCAndGVzdCcKZTlmM2UwMCB0YXJnZXQvYXJtOiBzZXQgSURfQUE2NElTQVIwLlRM
QiB0byAyIGZvciBtYXggQUFSQ0g2NCBDUFUgdHlwZQo4YmNhYzRjIHRhcmdldC9hcm06IEFkZCBz
dXBwb3J0IGZvciBGRUFUX1RMQklPUwpmMTcxOTY2IHRhcmdldC9hcm06IEFkZCBzdXBwb3J0IGZv
ciBGRUFUX1RMQklSQU5HRQoKPT09IE9VVFBVVCBCRUdJTiA9PT0KMS8zIENoZWNraW5nIGNvbW1p
dCBmMTcxOTY2NTdlZTMgKHRhcmdldC9hcm06IEFkZCBzdXBwb3J0IGZvciBGRUFUX1RMQklSQU5H
RSkKV0FSTklORzogbGluZSBvdmVyIDgwIGNoYXJhY3RlcnMKIzIxODogRklMRTogaW5jbHVkZS9l
eGVjL2V4ZWMtYWxsLmg6MzU0Ogorc3RhdGljIGlubGluZSB2b2lkIHRsYl9mbHVzaF9wYWdlX3Jh
bmdlX2JpdHNfYnlfbW11aWR4X2FsbF9jcHVzX3N5bmNlZChDUFVTdGF0ZSAqc3JjX2NwdSwKCldB
Uk5JTkc6IGxpbmUgb3ZlciA4MCBjaGFyYWN0ZXJzCiMyMTk6IEZJTEU6IGluY2x1ZGUvZXhlYy9l
eGVjLWFsbC5oOjM1NToKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdGFyZ2V0X3Vsb25nIGFkZHIsCgpFUlJPUjog
bGluZSBvdmVyIDkwIGNoYXJhY3RlcnMKIzIyMDogRklMRTogaW5jbHVkZS9leGVjL2V4ZWMtYWxs
Lmg6MzU2OgorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB0YXJnZXRfdWxvbmcgbGVuZ3RoLAoKV0FSTklORzogbGlu
ZSBvdmVyIDgwIGNoYXJhY3RlcnMKIzIyMTogRklMRTogaW5jbHVkZS9leGVjL2V4ZWMtYWxsLmg6
MzU3OgorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB1aW50MTZfdCBpZHhtYXAsCgpXQVJOSU5HOiBsaW5lIG92ZXIg
ODAgY2hhcmFjdGVycwojMjIyOiBGSUxFOiBpbmNsdWRlL2V4ZWMvZXhlYy1hbGwuaDozNTg6Cisg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHVuc2lnbmVkIGJpdHMpCgp0b3RhbDogMSBlcnJvcnMsIDQgd2FybmluZ3Ms
IDU0NSBsaW5lcyBjaGVja2VkCgpQYXRjaCAxLzMgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2Ug
cmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9y
dCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4K
CjIvMyBDaGVja2luZyBjb21taXQgOGJjYWM0YzA0YzhlICh0YXJnZXQvYXJtOiBBZGQgc3VwcG9y
dCBmb3IgRkVBVF9UTEJJT1MpCjMvMyBDaGVja2luZyBjb21taXQgZTlmM2UwMDJkNzNkICh0YXJn
ZXQvYXJtOiBzZXQgSURfQUE2NElTQVIwLlRMQiB0byAyIGZvciBtYXggQUFSQ0g2NCBDUFUgdHlw
ZSkKPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoK
ClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAy
MTAzMTYxNTQ5MTAuMjU4MDQtMS1yZWJlY2NhQG51dmlhaW5jLmNvbS90ZXN0aW5nLmNoZWNrcGF0
Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBh
dGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0
byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

