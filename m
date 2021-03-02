Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E0032A9BA
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 19:53:15 +0100 (CET)
Received: from localhost ([::1]:39918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHA8w-00052a-GE
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 13:53:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lH9w2-0004Jx-9V
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 13:39:54 -0500
Resent-Date: Tue, 02 Mar 2021 13:39:54 -0500
Resent-Message-Id: <E1lH9w2-0004Jx-9V@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lH9w0-0005HK-0x
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 13:39:54 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1614710387; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=V1AvBYiUIpPhU0TrCIAC1IAXd4wDsQJgLNddixHzXL3nRyzLM9lqaLpEgPtyIICtbN6q/b1KPKjwYE0gHWwMdfd+Jlz8mIm5SAlayNGIjfHqT5fgj0Ef0BqgIODAZtGcKJI+nTOJtbIm0qy49V5wHZqDkBAsJ2P1lLc6bVSbIIU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1614710387;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=Rz4UJsifnAOVxbzMp2Saj0k83vZN/YCycROYs9t8sbE=; 
 b=On2TK8MggLjU/hb9pUgmvZ7earACgSvO7itYKvDe3jqcZl+dbvAQw+MTe8UdH0W8Qals5mjfFyNd1Faaxyeb7Et75wyDez8yNVi27Z2al5njyzv15HkixeLW6HfwLqrAPogf/5I/VvOJuuOHzhoq2pSIXvD/fqe/RkNP9218ySo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1614710385976135.92205831941476;
 Tue, 2 Mar 2021 10:39:45 -0800 (PST)
In-Reply-To: <20210302180023.54555-1-pbonzini@redhat.com>
Subject: Re: [PATCH v3] vl: deprecate -writeconfig
Message-ID: <161471038498.13544.6856210964815059060@c667a6b167f6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: pbonzini@redhat.com
Date: Tue, 2 Mar 2021 10:39:45 -0800 (PST)
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
Cc: qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDMwMjE4MDAyMy41NDU1
NS0xLXBib256aW5pQHJlZGhhdC5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2
ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBp
bmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIxMDMwMjE4MDAyMy41NDU1
NS0xLXBib256aW5pQHJlZGhhdC5jb20KU3ViamVjdDogW1BBVENIIHYzXSB2bDogZGVwcmVjYXRl
IC13cml0ZWNvbmZpZwoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaApnaXQg
cmV2LXBhcnNlIGJhc2UgPiAvZGV2L251bGwgfHwgZXhpdCAwCmdpdCBjb25maWcgLS1sb2NhbCBk
aWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVlCmdp
dCBjb25maWcgLS1sb2NhbCBkaWZmLmFsZ29yaXRobSBoaXN0b2dyYW0KLi9zY3JpcHRzL2NoZWNr
cGF0Y2gucGwgLS1tYWlsYmFjayBiYXNlLi4KPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClVwZGF0
aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQKRnJvbSBodHRwczov
L2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUKICogW25ldyB0YWddICAgICAgICAgcGF0
Y2hldy8yMDIxMDMwMjE4MDAyMy41NDU1NS0xLXBib256aW5pQHJlZGhhdC5jb20gLT4gcGF0Y2hl
dy8yMDIxMDMwMjE4MDAyMy41NDU1NS0xLXBib256aW5pQHJlZGhhdC5jb20KU3dpdGNoZWQgdG8g
YSBuZXcgYnJhbmNoICd0ZXN0JwoyNWI0Y2QxIHZsOiBkZXByZWNhdGUgLXdyaXRlY29uZmlnCgo9
PT0gT1VUUFVUIEJFR0lOID09PQpFUlJPUjogbGluZSBvdmVyIDkwIGNoYXJhY3RlcnMKIzY2OiBG
SUxFOiBzb2Z0bW11L3ZsLmM6MzM1OToKKyAgICAgICAgICAgICAgICAgICAgd2Fybl9yZXBvcnQo
Ii13cml0ZWNvbmZpZyBpcyBkZXByZWNhdGVkIGFuZCB3aWxsIGdvIGF3YXkgd2l0aG91dCBhIHJl
cGxhY2VtZW50Iik7Cgp0b3RhbDogMSBlcnJvcnMsIDAgd2FybmluZ3MsIDM0IGxpbmVzIGNoZWNr
ZWQKCkNvbW1pdCAyNWI0Y2QxMDYwZDIgKHZsOiBkZXByZWNhdGUgLXdyaXRlY29uZmlnKSBoYXMg
c3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFy
ZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVD
S1BBVENIIGluIE1BSU5UQUlORVJTLgo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBl
eGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8v
cGF0Y2hldy5vcmcvbG9ncy8yMDIxMDMwMjE4MDAyMy41NDU1NS0xLXBib256aW5pQHJlZGhhdC5j
b20vdGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQg
YXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBz
ZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

