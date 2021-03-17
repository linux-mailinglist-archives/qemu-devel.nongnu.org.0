Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3480E33FBF8
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 00:44:45 +0100 (CET)
Received: from localhost ([::1]:49310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMfqG-0002K1-93
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 19:44:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lMfoa-0001kU-Po; Wed, 17 Mar 2021 19:43:00 -0400
Resent-Date: Wed, 17 Mar 2021 19:43:00 -0400
Resent-Message-Id: <E1lMfoa-0001kU-Po@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lMfoY-00067t-2A; Wed, 17 Mar 2021 19:43:00 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1616024571; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=nZgQxrVK6ATfUeYp9PFWdxWdk7UkmeKU9L1CVIw7iXqYCAUYmgRvDkcPX/iTf2CHJKXWAc8usMj+2pjBMzMPhbsElOBNwRt9SPdo1hiCtuL+47jriSF3w/pkEjxs/utVE6AWMNst1vQZAgwId4r/bmtCYfLisBEyzc0vEwCCuk4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1616024571;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=xYIansm4jTXJc2Jyz2AkEaE8VTmmyUeTzvDVZQh8Kfc=; 
 b=e9tSXdqAY8cRnGj45actPX+y/QFoaWj5sUTMw2D71HkwAE1F3/s0IrQtSWF8aMVxcchOqV94+uBlH9y8/UpnHJKIxcOIFGVSIMDUEWMMOk4OV2LTYtmP7M5apjEwbGyPLM8qwrv5VJmOzu3U5q5UgbLrcZ5GceZeto3qR80UltI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1616024568955603.6955479894941;
 Wed, 17 Mar 2021 16:42:48 -0700 (PDT)
In-Reply-To: <20210317233301.4130-1-rebecca@nuviainc.com>
Subject: Re: [PATCH v5 0/4] target/arm: Add support for FEAT_TLBIOS and
 FEAT_TLBIRANGE
Message-ID: <161602456764.4054.11846486629167678471@c9d4d6fbb2f1>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: rebecca@nuviainc.com
Date: Wed, 17 Mar 2021 16:42:48 -0700 (PDT)
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

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDMxNzIzMzMwMS40MTMw
LTEtcmViZWNjYUBudXZpYWluYy5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2
ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBp
bmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIxMDMxNzIzMzMwMS40MTMw
LTEtcmViZWNjYUBudXZpYWluYy5jb20KU3ViamVjdDogW1BBVENIIHY1IDAvNF0gdGFyZ2V0L2Fy
bTogQWRkIHN1cHBvcnQgZm9yIEZFQVRfVExCSU9TIGFuZCBGRUFUX1RMQklSQU5HRQoKPT09IFRF
U1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2
L251bGwgfHwgZXhpdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0
IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZm
LmFsZ29yaXRobSBoaXN0b2dyYW0KLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBi
YXNlLi4KPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4Nzgy
MTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQKRnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1w
cm9qZWN0L3FlbXUKICogW25ldyB0YWddICAgICAgICAgcGF0Y2hldy8yMDIxMDMxNzIzMzMwMS40
MTMwLTEtcmViZWNjYUBudXZpYWluYy5jb20gLT4gcGF0Y2hldy8yMDIxMDMxNzIzMzMwMS40MTMw
LTEtcmViZWNjYUBudXZpYWluYy5jb20KU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0Jwoz
OWIzYzM2IHRhcmdldC9hcm06IHNldCBJRF9BQTY0SVNBUjAuVExCIHRvIDIgZm9yIG1heCBBQVJD
SDY0IENQVSB0eXBlCmUzYmMyNTMgdGFyZ2V0L2FybTogQWRkIHN1cHBvcnQgZm9yIEZFQVRfVExC
SU9TCjk0ZTVjYzEgdGFyZ2V0L2FybTogQWRkIHN1cHBvcnQgZm9yIEZFQVRfVExCSVJBTkdFCjg1
ZjhiYWYgYWNjZWwvdGNnOiBBZGQgVExCIGludmFsaWRhdGlvbiBzdXBwb3J0IGZvciByYW5nZXMg
b2YgYWRkcmVzc2VzCgo9PT0gT1VUUFVUIEJFR0lOID09PQoxLzQgQ2hlY2tpbmcgY29tbWl0IDg1
ZjhiYWZmNzRkYSAoYWNjZWwvdGNnOiBBZGQgVExCIGludmFsaWRhdGlvbiBzdXBwb3J0IGZvciBy
YW5nZXMgb2YgYWRkcmVzc2VzKQpXQVJOSU5HOiBsaW5lIG92ZXIgODAgY2hhcmFjdGVycwojMjM4
OiBGSUxFOiBpbmNsdWRlL2V4ZWMvZXhlYy1hbGwuaDozNTQ6CitzdGF0aWMgaW5saW5lIHZvaWQg
dGxiX2ZsdXNoX3BhZ2VfcmFuZ2VfYml0c19ieV9tbXVpZHhfYWxsX2NwdXNfc3luY2VkKENQVVN0
YXRlICpzcmNfY3B1LAoKV0FSTklORzogbGluZSBvdmVyIDgwIGNoYXJhY3RlcnMKIzIzOTogRklM
RTogaW5jbHVkZS9leGVjL2V4ZWMtYWxsLmg6MzU1OgorICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0YXJnZXRfdWxv
bmcgYWRkciwKCkVSUk9SOiBsaW5lIG92ZXIgOTAgY2hhcmFjdGVycwojMjQwOiBGSUxFOiBpbmNs
dWRlL2V4ZWMvZXhlYy1hbGwuaDozNTY6CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRhcmdldF91bG9uZyBsZW5n
dGgsCgpXQVJOSU5HOiBsaW5lIG92ZXIgODAgY2hhcmFjdGVycwojMjQxOiBGSUxFOiBpbmNsdWRl
L2V4ZWMvZXhlYy1hbGwuaDozNTc6CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQxNl90IGlkeG1hcCwKCldB
Uk5JTkc6IGxpbmUgb3ZlciA4MCBjaGFyYWN0ZXJzCiMyNDI6IEZJTEU6IGluY2x1ZGUvZXhlYy9l
eGVjLWFsbC5oOjM1ODoKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgYml0cykKCnRvdGFsOiAxIGVy
cm9ycywgNCB3YXJuaW5ncywgMjE3IGxpbmVzIGNoZWNrZWQKClBhdGNoIDEvNCBoYXMgc3R5bGUg
cHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxz
ZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENI
IGluIE1BSU5UQUlORVJTLgoKMi80IENoZWNraW5nIGNvbW1pdCA5NGU1Y2MxMzk0YjQgKHRhcmdl
dC9hcm06IEFkZCBzdXBwb3J0IGZvciBGRUFUX1RMQklSQU5HRSkKMy80IENoZWNraW5nIGNvbW1p
dCBlM2JjMjUzOTI2Y2QgKHRhcmdldC9hcm06IEFkZCBzdXBwb3J0IGZvciBGRUFUX1RMQklPUykK
NC80IENoZWNraW5nIGNvbW1pdCAzOWIzYzM2MDY4YjQgKHRhcmdldC9hcm06IHNldCBJRF9BQTY0
SVNBUjAuVExCIHRvIDIgZm9yIG1heCBBQVJDSDY0IENQVSB0eXBlKQo9PT0gT1VUUFVUIEVORCA9
PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2
YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIxMDMxNzIzMzMwMS40MTMwLTEt
cmViZWNjYUBudXZpYWluYy5jb20vdGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0t
LQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNo
ZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRo
YXQuY29t

