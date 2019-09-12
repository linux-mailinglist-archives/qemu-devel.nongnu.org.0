Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BD4B1111
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Sep 2019 16:24:57 +0200 (CEST)
Received: from localhost ([::1]:35094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8Q1o-0003F4-I8
	for lists+qemu-devel@lfdr.de; Thu, 12 Sep 2019 10:24:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40466)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1i8PUe-0006qD-5j
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 09:50:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1i8PUY-0002wM-QU
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 09:50:39 -0400
Resent-Date: Thu, 12 Sep 2019 09:50:39 -0400
Resent-Message-Id: <E1i8PUY-0002wM-QU@eggs.gnu.org>
Received: from sender4-of-o55.zoho.com ([136.143.188.55]:21577)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1i8PUY-0002uB-HX
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 09:50:34 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1568296224; cv=none; d=zoho.com; s=zohoarc; 
 b=HjjuyNigon1xCgv+TUeheizH+EqQyXZeY+8XU3YvXN2Gg7Td2iZY1pdV90/7T4q91tlh8z6Bq3ON6QjBa59xbNPI1mqGyqYk/MUrAKd0OYegoYjGzh0KF7C2lchDoaP9YiNqr6+k4Y2gL+bL3FwFy3WlihpvHSbju8XQmz6Ujsw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
 s=zohoarc; t=1568296224;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
 bh=9NME0oc/r31KKEiyhqxIbptMHtj2fFefhtiMbFnWk50=; 
 b=XnuzX/Jyeo4/6M6V5hHU0+sPb6S+Yf2JChR7OIVSSYhOSJQqGgWwmrv+FwHLXmlBTfNWrGie1KQpI4tIN6JhU2blJRXpHQUYkWwY5c2juYWb7rRp27h42lupM1uBI8gi8PZFf0TPLXVEpyBSfyZCL5fydwsqFKIGqHI1dMzVvTQ=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1568296220452476.39643885313103;
 Thu, 12 Sep 2019 06:50:20 -0700 (PDT)
In-Reply-To: <20190912122514.22504-1-marcandre.lureau@redhat.com>
Message-ID: <156829621910.25007.13135132995120150143@5dec9699b7de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: marcandre.lureau@redhat.com
Date: Thu, 12 Sep 2019 06:50:20 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 136.143.188.55
Subject: Re: [Qemu-devel] [PATCH v3 0/6] Add dbus-vmstate
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
Cc: berrange@redhat.com, quintela@redhat.com, mprivozn@redhat.com,
 qemu-devel@nongnu.org, dgilbert@redhat.com, pbonzini@redhat.com,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MDkxMjEyMjUxNC4yMjUw
NC0xLW1hcmNhbmRyZS5sdXJlYXVAcmVkaGF0LmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBmYWls
ZWQgdGhlIGRvY2tlci1xdWlja0BjZW50b3M3IGJ1aWxkIHRlc3QuIFBsZWFzZSBmaW5kIHRoZSB0
ZXN0aW5nIGNvbW1hbmRzIGFuZAp0aGVpciBvdXRwdXQgYmVsb3cuIElmIHlvdSBoYXZlIERvY2tl
ciBpbnN0YWxsZWQsIHlvdSBjYW4gcHJvYmFibHkgcmVwcm9kdWNlIGl0CmxvY2FsbHkuCgo9PT0g
VEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCm1ha2UgZG9ja2VyLWltYWdlLWNlbnRv
czcgVj0xIE5FVFdPUks9MQp0aW1lIG1ha2UgZG9ja2VyLXRlc3QtcXVpY2tAY2VudG9zNyBTSE9X
X0VOVj0xIEo9MTQgTkVUV09SSz0xCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpsaWJ1ZGV2ICAg
ICAgICAgICBubwpkZWZhdWx0IGRldmljZXMgICB5ZXMKCndhcm5pbmc6IFB5dGhvbiAyIHN1cHBv
cnQgaXMgZGVwcmVjYXRlZAp3YXJuaW5nOiBQeXRob24gMyB3aWxsIGJlIHJlcXVpcmVkIGZvciBi
dWlsZGluZyBmdXR1cmUgdmVyc2lvbnMgb2YgUUVNVQoKTk9URTogY3Jvc3MtY29tcGlsZXJzIGVu
YWJsZWQ6ICAnY2MnCiAgR0VOICAgICB4ODZfNjQtc29mdG1tdS9jb25maWctZGV2aWNlcy5tYWsu
dG1wCi0tLQpDb3VsZCBub3QgZ2V0IHBhc3N3b3JkIGRhdGFiYXNlIGluZm9ybWF0aW9uIGZvciBV
SUQgb2YgY3VycmVudCBwcm9jZXNzOiBVc2VyICI/Pz8iIHVua25vd24gb3Igbm8gbWVtb3J5IHRv
IGFsbG9jYXRlIHBhc3N3b3JkIGVudHJ5CgoqKgpFUlJPUjovdG1wL3FlbXUtdGVzdC9zcmMvdGVz
dHMvZGJ1cy12bXN0YXRlLXRlc3QuYzoxNTA6Z2V0X2Nvbm5lY3Rpb246IGFzc2VydGlvbiBmYWls
ZWQgKGVyciA9PSBOVUxMKTogVGhlIGNvbm5lY3Rpb24gaXMgY2xvc2VkIChnLWlvLWVycm9yLXF1
YXJrLCAxOCkKY2xlYW5pbmcgdXAgcGlkIDI4NTc1CkVSUk9SIC0gQmFpbCBvdXQhIEVSUk9SOi90
bXAvcWVtdS10ZXN0L3NyYy90ZXN0cy9kYnVzLXZtc3RhdGUtdGVzdC5jOjE1MDpnZXRfY29ubmVj
dGlvbjogYXNzZXJ0aW9uIGZhaWxlZCAoZXJyID09IE5VTEwpOiBUaGUgY29ubmVjdGlvbiBpcyBj
bG9zZWQgKGctaW8tZXJyb3ItcXVhcmssIDE4KQptYWtlOiAqKiogW2NoZWNrLXF0ZXN0LXg4Nl82
NF0gRXJyb3IgMQptYWtlOiAqKiogV2FpdGluZyBmb3IgdW5maW5pc2hlZCBqb2JzLi4uLgogIFRF
U1QgICAgaW90ZXN0LXFjb3cyOiAwODAKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0
dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMTkwOTEyMTIyNTE0LjIyNTA0LTEtbWFyY2FuZHJlLmx1
cmVhdUByZWRoYXQuY29tL3Rlc3RpbmcuZG9ja2VyLXF1aWNrQGNlbnRvczcvP3R5cGU9bWVzc2Fn
ZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8v
cGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVs
QHJlZGhhdC5jb20=


