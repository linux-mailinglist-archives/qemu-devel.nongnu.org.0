Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8D07F02A
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Aug 2019 11:16:15 +0200 (CEST)
Received: from localhost ([::1]:32900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htTfa-0007KN-G2
	for lists+qemu-devel@lfdr.de; Fri, 02 Aug 2019 05:16:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50471)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <no-reply@patchew.org>) id 1htTf4-0006pd-QG
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 05:15:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1htTf3-00004s-Iw
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 05:15:42 -0400
Resent-Date: Fri, 02 Aug 2019 05:15:42 -0400
Resent-Message-Id: <E1htTf3-00004s-Iw@eggs.gnu.org>
Received: from sender-of-o53.zoho.com ([135.84.80.218]:21881)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1htTf3-0008TN-9A
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 05:15:41 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1564737322; cv=none; d=zoho.com; s=zohoarc; 
 b=Y2VDOJfLq9QikhIDHR1b0lAmoFwpxJOSrotfKDaEuASU0dJt8EcfQ7/erCnhPFFWHcDZzAs8RfD9/wd7h47qF9j5xlYTlTMaSVyBdw79VmzWN8vl0k9tDPycIgJQH3XwUHMYODId3KzvCsbTIbg5NKMEPZmDNaghywAdKiYPCeM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
 s=zohoarc; t=1564737322;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
 bh=0+6QuuvfYbFHrTKHWo1qAlK8fkDpsy3FeWu53HWsfgw=; 
 b=GplIoyu3/Sd7gD1F1RUwGcf43b9pBmIWJ4ZxjwEennqO2dpg/ADK2K4m/ZfsyXYRFXvBjZF5zjOOBwerHK1NcRqr9JwoqT4V8PUR3/n16ca5NTivmTfylJ5Lf/rA+kgnGMud/SNeP/2SgGhV5PrLAoJlsz4HdEiDtTrDWiWBB8Q=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1564737320309225.71196788172415;
 Fri, 2 Aug 2019 02:15:20 -0700 (PDT)
Message-ID: <156473731912.29356.1980093422220742642@c4a48874b076>
In-Reply-To: <1564736786-26495-1-git-send-email-ivanren@tencent.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: renyime@gmail.com
Date: Fri, 2 Aug 2019 02:15:20 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 135.84.80.218
Subject: Re: [Qemu-devel] [PATCH v2] migration: always initial ram_counters
 for a new migration
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
Cc: qemu-devel@nongnu.org, richardw.yang@linux.intel.com, dgilbert@redhat.com,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8xNTY0NzM2Nzg2LTI2NDk1LTEt
Z2l0LXNlbmQtZW1haWwtaXZhbnJlbkB0ZW5jZW50LmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBm
YWlsZWQgYnVpbGQgdGVzdCBvbiBzMzkweCBob3N0LiBQbGVhc2UgZmluZCB0aGUgZGV0YWlscyBi
ZWxvdy4KCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKIyBUZXN0aW5nIHNj
cmlwdCB3aWxsIGJlIGludm9rZWQgdW5kZXIgdGhlIGdpdCBjaGVja291dCB3aXRoCiMgSEVBRCBw
b2ludGluZyB0byBhIGNvbW1pdCB0aGF0IGhhcyB0aGUgcGF0Y2hlcyBhcHBsaWVkIG9uIHRvcCBv
ZiAiYmFzZSIKIyBicmFuY2gKc2V0IC1lCgplY2hvCmVjaG8gIj09PSBFTlYgPT09IgplbnYKCmVj
aG8KZWNobyAiPT09IFBBQ0tBR0VTID09PSIKcnBtIC1xYQoKZWNobwplY2hvICI9PT0gVU5BTUUg
PT09Igp1bmFtZSAtYQoKQ0M9JEhPTUUvYmluL2NjCklOU1RBTEw9JFBXRC9pbnN0YWxsCkJVSUxE
PSRQV0QvYnVpbGQKbWtkaXIgLXAgJEJVSUxEICRJTlNUQUxMClNSQz0kUFdECmNkICRCVUlMRAok
U1JDL2NvbmZpZ3VyZSAtLWNjPSRDQyAtLXByZWZpeD0kSU5TVEFMTAptYWtlIC1qNAojIFhYWDog
d2UgbmVlZCByZWxpYWJsZSBjbGVhbiB1cAojIG1ha2UgY2hlY2sgLWo0IFY9MQptYWtlIGluc3Rh
bGwKPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KCiAgQ0MgICAgICBtaWdyYXRpb24vY2hhbm5lbC5v
CiAgQ0MgICAgICBtaWdyYXRpb24vc2F2ZXZtLm8KICBDQyAgICAgIG1pZ3JhdGlvbi9jb2xvLm8K
L3Zhci90bXAvcGF0Y2hldy10ZXN0ZXItdG1wLXhmMnh4ZnJjL3NyYy9taWdyYXRpb24vbWlncmF0
aW9uLmM6MzAzMzo4OiBlcnJvcjogcmV0dXJuIHR5cGUgZGVmYXVsdHMgdG8g4oCYaW504oCZIFst
V2Vycm9yPWltcGxpY2l0LWludF0KIDMwMzMgfCBzdGF0aWMgdXBkYXRlX2l0ZXJhdGlvbl9pbml0
aWFsX3N0YXR1cyhNaWdyYXRpb25TdGF0ZSAqcykKICAgICAgfCAgICAgICAgXn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fgovdmFyL3RtcC9wYXRjaGV3LXRlc3Rlci10bXAteGYyeHhmcmMv
c3JjL21pZ3JhdGlvbi9taWdyYXRpb24uYzogSW4gZnVuY3Rpb24g4oCYdXBkYXRlX2l0ZXJhdGlv
bl9pbml0aWFsX3N0YXR1c+KAmToKL3Zhci90bXAvcGF0Y2hldy10ZXN0ZXItdG1wLXhmMnh4ZnJj
L3NyYy9taWdyYXRpb24vbWlncmF0aW9uLmM6MzA0MjoxOiBlcnJvcjogY29udHJvbCByZWFjaGVz
IGVuZCBvZiBub24tdm9pZCBmdW5jdGlvbiBbLVdlcnJvcj1yZXR1cm4tdHlwZV0KIDMwNDIgfCB9
CiAgICAgIHwgXgpjYzE6IGFsbCB3YXJuaW5ncyBiZWluZyB0cmVhdGVkIGFzIGVycm9ycwoKClRo
ZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMTU2NDcz
Njc4Ni0yNjQ5NS0xLWdpdC1zZW5kLWVtYWlsLWl2YW5yZW5AdGVuY2VudC5jb20vdGVzdGluZy5z
MzkweC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkg
UGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNr
IHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==


