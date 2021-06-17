Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 222573AB4A6
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 15:25:57 +0200 (CEST)
Received: from localhost ([::1]:42526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lts1r-0002p4-Sl
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 09:25:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1ltrnK-0004Ub-VS
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 09:10:54 -0400
Resent-Date: Thu, 17 Jun 2021 09:10:54 -0400
Resent-Message-Id: <E1ltrnK-0004Ub-VS@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1ltrnF-0001Aw-Aw
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 09:10:54 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1623935442; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=OcFelv3qJrssculjzcPIrYCDkCYjfdZgAcpzJr0I1QaKw63cmUcCdW8xeSaeVdNyquFzk82FJX1DwunQ9RudCLM96w21VQH4Hame/7k9BEMop38exl/ykmLXdSVhUpoFcJYTAuYSQFMRkcDUXTX43fvqsQj392KYh+x8ZPygPHA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1623935442;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=r7m0EPUL0fRZbxPgb5IABezhCt89G117cTRJsZsy+4M=; 
 b=AB5tCDdU6f+dqta/o/GaVHhG6LxggVaaNlVGUWy/ulauLHVFWtCSdkNL45zehXpzjVWDkNA8j1MCls2KHkY7uEcRkMgBxleWyrcQDZlmXFoGROkXJqSdiGUlHxHeGxMxJQyNcJykJisIaA/sH0QeRORsd1Wo1KZrEAqO/dy8S4Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 162393544045481.29236867325551;
 Thu, 17 Jun 2021 06:10:40 -0700 (PDT)
In-Reply-To: <20210617121707.764126-1-ma.mandourr@gmail.com>
Subject: Re: [RFC PATCH v2] Add a post for the new TCG cache modelling plugin
Message-ID: <162393543924.29201.17843453188426495372@7c66fb7bc3ab>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: ma.mandourr@gmail.com
Date: Thu, 17 Jun 2021 06:10:40 -0700 (PDT)
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
Cc: stefanha@gmail.com, ma.mandourr@gmail.com, alex.bennee@linaro.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDYxNzEyMTcwNy43NjQx
MjYtMS1tYS5tYW5kb3VyckBnbWFpbC5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8g
aGF2ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9y
ZSBpbmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIxMDYxNzEyMTcwNy43
NjQxMjYtMS1tYS5tYW5kb3VyckBnbWFpbC5jb20KU3ViamVjdDogW1JGQyBQQVRDSCB2Ml0gQWRk
IGEgcG9zdCBmb3IgdGhlIG5ldyBUQ0cgY2FjaGUgbW9kZWxsaW5nIHBsdWdpbgoKPT09IFRFU1Qg
U0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2L251
bGwgfHwgZXhpdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNv
bmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLmFs
Z29yaXRobSBoaXN0b2dyYW0KLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBiYXNl
Li4KPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0
ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQKU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0JwphYTI1
M2NhIEFkZCBhIHBvc3QgZm9yIHRoZSBuZXcgVENHIGNhY2hlIG1vZGVsbGluZyBwbHVnaW4KCj09
PSBPVVRQVVQgQkVHSU4gPT09CldBUk5JTkc6IGFkZGVkLCBtb3ZlZCBvciBkZWxldGVkIGZpbGUo
cyksIGRvZXMgTUFJTlRBSU5FUlMgbmVlZCB1cGRhdGluZz8KIzE4OiAKbmV3IGZpbGUgbW9kZSAx
MDA2NDQKCkVSUk9SOiB0cmFpbGluZyB3aGl0ZXNwYWNlCiMyODQ6IEZJTEU6IF9wb3N0cy8yMDIx
LTA2LTE3LXRjZy1jYWNoZS1tb2RlbGxpbmctcGx1Z2luLm1kOjI2MjoKK1tbUkZDIFBBVENIIHYz
IDAvNF0gQ2FjaGUgVENHIHBsdWdpbiAmIHN5bWJvbC1yZXNvbHV0aW9uIEFQSV0oaHR0cHM6Ly9w
YXRjaGV3Lm9yZy9RRU1VLzIwMjEwNjA4MDQwNTMyLjU2NDQ5LTEtbWEubWFuZG91cnJAZ21haWwu
Y29tLykgICQKCkVSUk9SOiB0cmFpbGluZyB3aGl0ZXNwYWNlCiMyODU6IEZJTEU6IF9wb3N0cy8y
MDIxLTA2LTE3LXRjZy1jYWNoZS1tb2RlbGxpbmctcGx1Z2luLm1kOjI2MzoKK1tbUkZDIFBBVENI
IHYzIDEvNF0gcGx1Z2lucy9hcGk6IGV4cG9zZSBzeW1ib2wgbG9va3VwIHRvIHBsdWdpbnNdKGh0
dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDYwODA0MDUzMi41NjQ0OS0xLW1hLm1hbmRvdXJy
QGdtYWlsLmNvbS8yMDIxMDYwODA0MDUzMi41NjQ0OS0yLW1hLm1hbmRvdXJyQGdtYWlsLmNvbS8p
ICAkCgpFUlJPUjogdHJhaWxpbmcgd2hpdGVzcGFjZQojMjg2OiBGSUxFOiBfcG9zdHMvMjAyMS0w
Ni0xNy10Y2ctY2FjaGUtbW9kZWxsaW5nLXBsdWdpbi5tZDoyNjQ6CitbW1JGQyBQQVRDSCB2MyAy
LzRdIHBsdWdpbnM6IEFkZGVkIGEgbmV3IGNhY2hlIG1vZGVsbGluZyBwbHVnaW4uXShodHRwczov
L3BhdGNoZXcub3JnL1FFTVUvMjAyMTA2MDgwNDA1MzIuNTY0NDktMS1tYS5tYW5kb3VyckBnbWFp
bC5jb20vMjAyMTA2MDgwNDA1MzIuNTY0NDktMy1tYS5tYW5kb3VyckBnbWFpbC5jb20vKSAgJAoK
RVJST1I6IHRyYWlsaW5nIHdoaXRlc3BhY2UKIzI4NzogRklMRTogX3Bvc3RzLzIwMjEtMDYtMTct
dGNnLWNhY2hlLW1vZGVsbGluZy1wbHVnaW4ubWQ6MjY1OgorW1tSRkMgUEFUQ0ggdjMgMy80XSBw
bHVnaW5zL2NhY2hlOiBFbmFibGVkIGNhY2hlIHBhcmFtZXRlcml6YXRpb25dKGh0dHBzOi8vcGF0
Y2hldy5vcmcvUUVNVS8yMDIxMDYwODA0MDUzMi41NjQ0OS0xLW1hLm1hbmRvdXJyQGdtYWlsLmNv
bS8yMDIxMDYwODA0MDUzMi41NjQ0OS00LW1hLm1hbmRvdXJyQGdtYWlsLmNvbS8pICAkCgp0b3Rh
bDogNCBlcnJvcnMsIDEgd2FybmluZ3MsIDI2NiBsaW5lcyBjaGVja2VkCgpDb21taXQgYWEyNTNj
YWIxODMxIChBZGQgYSBwb3N0IGZvciB0aGUgbmV3IFRDRyBjYWNoZSBtb2RlbGxpbmcgcGx1Z2lu
KSBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJy
b3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNl
ZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29t
bWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApo
dHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIxMDYxNzEyMTcwNy43NjQxMjYtMS1tYS5tYW5kb3Vy
ckBnbWFpbC5jb20vdGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBn
ZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10u
ClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

