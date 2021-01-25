Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC929302588
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 14:33:18 +0100 (CET)
Received: from localhost ([::1]:43424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l41za-0007AC-1x
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 08:33:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1l41xr-0006HU-OK; Mon, 25 Jan 2021 08:31:31 -0500
Resent-Date: Mon, 25 Jan 2021 08:31:31 -0500
Resent-Message-Id: <E1l41xr-0006HU-OK@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1l41xo-0001QF-6f; Mon, 25 Jan 2021 08:31:31 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1611581450; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=RhsmstMPXXmGncJ2JXMre3yHbk2Bf7UTjuTGHi+aiZiCsn/h6uq6qVGSjVrLK2ba4QN7Wkgy1/4SlD94IAyvvZnzDwfTobYQHC4GDP+rBq6WdDENm0cL4BodLgmbQsV3xpidwN4Zle3wZ9bNfV5HhX/UZbAwfxYTa90mmdX2xUM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1611581450;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=SbjE58Qo/FY9F4sUC7B+wbUnbVrVCKSFULmbzuAhyWo=; 
 b=Tqq7hgPTUJ/igmQhxC0NC8Sjb5wwW9v7pX1c3pBztoK96Oh7vdgk9BQxBR+MoCYgQJ1fG7IcQeY19pYkQ4nY3vUdEanTTNM+HNn1UbN2cJPKGzw7qDXAuOt9/1SufBJlzW/gQ7ad0bu1Pxep2rJtbAPfkGgnQPbzyv6nhKgKfg8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1611581448483761.9721270912748;
 Mon, 25 Jan 2021 05:30:48 -0800 (PST)
In-Reply-To: <20210125132238.179972-1-borntraeger@de.ibm.com>
Subject: Re: [PATCH v2] s390x/cpu_model: disallow unpack for --only-migratable
Message-ID: <161158144666.29232.14727021807162456508@c667a6b167f6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: borntraeger@de.ibm.com
Date: Mon, 25 Jan 2021 05:30:48 -0800 (PST)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_SBL=1.623 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com, berrange@redhat.com, frankja@linux.ibm.com,
 david@redhat.com, cohuck@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 qemu-s390x@nongnu.org, rth@twiddle.net, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDEyNTEzMjIzOC4xNzk5
NzItMS1ib3JudHJhZWdlckBkZS5pYm0uY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRv
IGhhdmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1v
cmUgaW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMTAxMjUxMzIyMzgu
MTc5OTcyLTEtYm9ybnRyYWVnZXJAZGUuaWJtLmNvbQpTdWJqZWN0OiBbUEFUQ0ggdjJdIHMzOTB4
L2NwdV9tb2RlbDogZGlzYWxsb3cgdW5wYWNrIGZvciAtLW9ubHktbWlncmF0YWJsZQoKPT09IFRF
U1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2
L251bGwgfHwgZXhpdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0
IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZm
LmFsZ29yaXRobSBoaXN0b2dyYW0KLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBi
YXNlLi4KPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4Nzgy
MTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQKRnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1w
cm9qZWN0L3FlbXUKIC0gW3RhZyB1cGRhdGVdICAgICAgcGF0Y2hldy8yMDIxMDEyNTEyNTMxMi4x
Mzg0OTEtMS1ib3JudHJhZWdlckBkZS5pYm0uY29tIC0+IHBhdGNoZXcvMjAyMTAxMjUxMjUzMTIu
MTM4NDkxLTEtYm9ybnRyYWVnZXJAZGUuaWJtLmNvbQogKiBbbmV3IHRhZ10gICAgICAgICBwYXRj
aGV3LzIwMjEwMTI1MTMyMjM4LjE3OTk3Mi0xLWJvcm50cmFlZ2VyQGRlLmlibS5jb20gLT4gcGF0
Y2hldy8yMDIxMDEyNTEzMjIzOC4xNzk5NzItMS1ib3JudHJhZWdlckBkZS5pYm0uY29tClN3aXRj
aGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKOWQ1NWFkMiBzMzkweC9jcHVfbW9kZWw6IGRpc2Fs
bG93IHVucGFjayBmb3IgLS1vbmx5LW1pZ3JhdGFibGUKCj09PSBPVVRQVVQgQkVHSU4gPT09CkVS
Uk9SOiBjb2RlIGluZGVudCBzaG91bGQgbmV2ZXIgdXNlIHRhYnMKIzM3OiBGSUxFOiB0YXJnZXQv
czM5MHgvY3B1X21vZGVscy5jOjg4NjoKK15JcmV0dXJuOyQKCnRvdGFsOiAxIGVycm9ycywgMCB3
YXJuaW5ncywgMjEgbGluZXMgY2hlY2tlZAoKQ29tbWl0IDlkNTVhZDIzZTAxOCAoczM5MHgvY3B1
X21vZGVsOiBkaXNhbGxvdyB1bnBhY2sgZm9yIC0tb25seS1taWdyYXRhYmxlKSBoYXMgc3R5bGUg
cHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxz
ZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENI
IGluIE1BSU5UQUlORVJTLgo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQg
d2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hl
dy5vcmcvbG9ncy8yMDIxMDEyNTEzMjIzOC4xNzk5NzItMS1ib3JudHJhZWdlckBkZS5pYm0uY29t
L3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1
dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2Vu
ZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

