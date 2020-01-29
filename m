Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE2014C4BB
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jan 2020 03:54:10 +0100 (CET)
Received: from localhost ([::1]:40072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwdUX-0007Ef-8A
	for lists+qemu-devel@lfdr.de; Tue, 28 Jan 2020 21:54:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60992)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1iwdTd-0006hI-7L
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 21:53:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1iwdTc-0006Ji-89
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 21:53:13 -0500
Resent-Date: Tue, 28 Jan 2020 21:53:13 -0500
Resent-Message-Id: <E1iwdTc-0006Ji-89@eggs.gnu.org>
Received: from sender4-of-o51.zoho.com ([136.143.188.51]:21131)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1iwdTc-0006HF-0f; Tue, 28 Jan 2020 21:53:12 -0500
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1580266361001110.52502624143733;
 Tue, 28 Jan 2020 18:52:41 -0800 (PST)
In-Reply-To: <20200129023111.1699-1-aik@ozlabs.ru>
Subject: Re: [PATCH qemu] spapr_pci: Create assigned properties for bridges
Message-ID: <158026635992.18399.11193157206201615561@f6d1ed32ca6b>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: aik@ozlabs.ru
Date: Tue, 28 Jan 2020 18:52:41 -0800 (PST)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 136.143.188.51
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
Cc: aik@ozlabs.ru, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDEyOTAyMzExMS4xNjk5
LTEtYWlrQG96bGFicy5ydS8KCgoKSGksCgpUaGlzIHNlcmllcyBmYWlsZWQgYnVpbGQgdGVzdCBv
biBGcmVlQlNEIGhvc3QuIFBsZWFzZSBmaW5kIHRoZSBkZXRhaWxzIGJlbG93LgoKPT09IFRFU1Qg
U0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaAojIFRlc3Rpbmcgc2NyaXB0IHdpbGwgYmUgaW52
b2tlZCB1bmRlciB0aGUgZ2l0IGNoZWNrb3V0IHdpdGgKIyBIRUFEIHBvaW50aW5nIHRvIGEgY29t
bWl0IHRoYXQgaGFzIHRoZSBwYXRjaGVzIGFwcGxpZWQgb24gdG9wIG9mICJiYXNlIgojIGJyYW5j
aAppZiBxZW11LXN5c3RlbS14ODZfNjQgLS1oZWxwID4vZGV2L251bGwgMj4mMTsgdGhlbgogIFFF
TVU9cWVtdS1zeXN0ZW0teDg2XzY0CmVsaWYgL3Vzci9saWJleGVjL3FlbXUta3ZtIC0taGVscCA+
L2Rldi9udWxsIDI+JjE7IHRoZW4KICBRRU1VPS91c3IvbGliZXhlYy9xZW11LWt2bQplbHNlCiAg
ZXhpdCAxCmZpCm1ha2Ugdm0tYnVpbGQtZnJlZWJzZCBKPTIxIFFFTVU9JFFFTVUKZXhpdCAwCj09
PSBURVNUIFNDUklQVCBFTkQgPT09CgoKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0
dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMjAwMTI5MDIzMTExLjE2OTktMS1haWtAb3psYWJzLnJ1
L3Rlc3RpbmcuRnJlZUJTRC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9t
YXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5
b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

