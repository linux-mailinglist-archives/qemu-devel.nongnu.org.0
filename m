Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B0534C0D0
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 03:05:40 +0200 (CEST)
Received: from localhost ([::1]:54468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQgLb-0005Ed-9f
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 21:05:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lQgK3-0004pt-AE
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 21:04:03 -0400
Resent-Date: Sun, 28 Mar 2021 21:04:03 -0400
Resent-Message-Id: <E1lQgK3-0004pt-AE@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lQgK0-0004tg-S6
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 21:04:02 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1616979828; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=a4VhpWeAYpwr2YKFU95I33diFlBxsy0nqs81j3FYvHfuT8wyGa0eYhA1Mi40qEK7h9nbJbdK3Ywok2C790IjfuxJ2VtjRXhDoCylyRqwgU4p4qEts3qH5RTUZwFferKAYck9Dz+Eyugo7CUZEUpfUuMqSF/G5MfTuo5drrFwvHE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1616979828;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=L4t7uRHtNpV+2tNB/p/uhi5QSmxRh9JVaSiyqalz78M=; 
 b=e0bh8UfN7EKfwciariYwhO4QlQiBt54bulydtQ2ZyR+1L1lSk/nBX+oN+VWLYil+HiUvdx90BZ4rkRLUmuWhtbp951UYxW8Ef8tyiq62Nd5lF+ONluLCiL+xYgLTjb2nUpnpyw6XaGNMlygXudT7WR0RrGRyzZ/ZzRiNatl47s8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1616979825115621.4494580481951;
 Sun, 28 Mar 2021 18:03:45 -0700 (PDT)
In-Reply-To: <20210328205726.1330291-1-vincent@bernat.ch>
Subject: Re: [RFC v1] hw/smbios: support for type 41 (onboard devices extended
 information)
Message-ID: <161697982422.20063.7602918359466631120@72b6d80f974b>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: vincent@bernat.ch
Date: Sun, 28 Mar 2021 18:03:45 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, vincent@bernat.ch
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDMyODIwNTcyNi4xMzMw
MjkxLTEtdmluY2VudEBiZXJuYXQuY2gvCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2
ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBp
bmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIxMDMyODIwNTcyNi4xMzMw
MjkxLTEtdmluY2VudEBiZXJuYXQuY2gKU3ViamVjdDogW1JGQyB2MV0gaHcvc21iaW9zOiBzdXBw
b3J0IGZvciB0eXBlIDQxIChvbmJvYXJkIGRldmljZXMgZXh0ZW5kZWQgaW5mb3JtYXRpb24pCgo9
PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+
IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQg
MApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2Fs
IGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQouL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxi
YWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFm
Zjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRj
aGV3LXByb2plY3QvcWVtdQogKiBbbmV3IHRhZ10gICAgICAgICBwYXRjaGV3LzIwMjEwMzI4MjA1
NzI2LjEzMzAyOTEtMS12aW5jZW50QGJlcm5hdC5jaCAtPiBwYXRjaGV3LzIwMjEwMzI4MjA1NzI2
LjEzMzAyOTEtMS12aW5jZW50QGJlcm5hdC5jaApTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rl
c3QnCmUzMDc5NWQgaHcvc21iaW9zOiBzdXBwb3J0IGZvciB0eXBlIDQxIChvbmJvYXJkIGRldmlj
ZXMgZXh0ZW5kZWQgaW5mb3JtYXRpb24pCgo9PT0gT1VUUFVUIEJFR0lOID09PQpFUlJPUjogZG8g
bm90IHVzZSBhc3NpZ25tZW50IGluIGlmIGNvbmRpdGlvbgojMTc1OiBGSUxFOiBody9zbWJpb3Mv
c21iaW9zLmM6MTMwOToKKyAgICAgICAgICAgIGlmICgodCA9IGNhbGxvYygxLCBzaXplb2Yoc3Ry
dWN0IHR5cGU0MV9pbnN0YW5jZSkpKSA9PSBOVUxMKSB7CgpXQVJOSU5HOiBsaW5lIG92ZXIgODAg
Y2hhcmFjdGVycwojMjA1OiBGSUxFOiBody9zbWJpb3Mvc21iaW9zLmM6MTMzOToKKyAgICAgICAg
ICAgIHQtPnBjaS5kZXZpY2UgPSAoKHVpbnQ4X3QpcGRldmljZSA8PCAzKSArICgodWludDhfdClw
ZnVuY3Rpb24gJiAweDcpOwoKdG90YWw6IDEgZXJyb3JzLCAxIHdhcm5pbmdzLCAxODMgbGluZXMg
Y2hlY2tlZAoKQ29tbWl0IGUzMDc5NWQ0OTFhMCAoaHcvc21iaW9zOiBzdXBwb3J0IGZvciB0eXBl
IDQxIChvbmJvYXJkIGRldmljZXMgZXh0ZW5kZWQgaW5mb3JtYXRpb24pKSBoYXMgc3R5bGUgcHJv
YmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBw
b3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGlu
IE1BSU5UQUlORVJTLgo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0
aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5v
cmcvbG9ncy8yMDIxMDMyODIwNTcyNi4xMzMwMjkxLTEtdmluY2VudEBiZXJuYXQuY2gvdGVzdGlu
Zy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGlj
YWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIg
ZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

