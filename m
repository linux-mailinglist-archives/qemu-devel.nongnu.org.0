Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD2630EE2D
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 09:17:08 +0100 (CET)
Received: from localhost ([::1]:41004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Zp5-0006oB-Hf
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 03:17:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1l7Zo2-0006M7-BR
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 03:16:02 -0500
Resent-Date: Thu, 04 Feb 2021 03:16:02 -0500
Resent-Message-Id: <E1l7Zo2-0006M7-BR@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1l7Znz-00047e-Ug
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 03:16:01 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1612426548; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=TVtQ/0HOnPc3OTaD0pc6pGyJlCU96ntztVvxE/S4zVDCLY7PP+AkL3rbNosonEUuzwGIo+v6mrnJs+QQ0C9MExJ0e0mweS90SzHZ4xmK4yltrPDmdH0x8HzasXrbDL/uMc4uwo1C/+0mR9/QnoIRqPaJBpAJbil81nV6vNx5kq4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1612426548;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=AMRsrwQXpq2w/+j4ZQEKEDByLGhtrHVoOLWHaT6qfKc=; 
 b=O49EemdolHtGxkhkutMczyfuE+0boKzFlwD+9RNChW/4RjsxWHcan1W5A7F1CrChggqn8jfksmPouVa7D9pvzxXZNMzp4QN7lk4Z569g1QqNnXoBMuZ4wcNZLxzC2H9Ea794m7jdGSZEfC+NBQP5fmhyj7NJt7xvydcBK2KFI8E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1612426544975225.1510839264688;
 Thu, 4 Feb 2021 00:15:44 -0800 (PST)
In-Reply-To: <cover.1612424814.git.isaku.yamahata@intel.com>
Subject: Re: [PATCH 0/4] ACPI related fixes
Message-ID: <161242654373.30579.11329990738781122576@c667a6b167f6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: isaku.yamahata@gmail.com
Date: Thu, 4 Feb 2021 00:15:44 -0800 (PST)
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
Cc: isaku.yamahata@intel.com, imammedo@redhat.com, qemu-devel@nongnu.org,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS9jb3Zlci4xNjEyNDI0ODE0Lmdp
dC5pc2FrdS55YW1haGF0YUBpbnRlbC5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8g
aGF2ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9y
ZSBpbmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiBjb3Zlci4xNjEyNDI0ODE0
LmdpdC5pc2FrdS55YW1haGF0YUBpbnRlbC5jb20KU3ViamVjdDogW1BBVENIIDAvNF0gQUNQSSBy
ZWxhdGVkIGZpeGVzCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCmdpdCBy
ZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRp
ZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0
IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQouL3NjcmlwdHMvY2hlY2tw
YXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKVXBkYXRp
bmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApGcm9tIGh0dHBzOi8v
Z2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdQogKiBbbmV3IHRhZ10gICAgICAgICBwYXRj
aGV3L2NvdmVyLjE2MTI0MjQ4MTQuZ2l0LmlzYWt1LnlhbWFoYXRhQGludGVsLmNvbSAtPiBwYXRj
aGV3L2NvdmVyLjE2MTI0MjQ4MTQuZ2l0LmlzYWt1LnlhbWFoYXRhQGludGVsLmNvbQpTd2l0Y2hl
ZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCjhlZWE0ZTEgaTM4NjogYWNwaTogRG9uJ3QgYnVpbGQg
SFBFVCBBQ1BJIGVudHJ5IGlmIEhQRVQgaXMgZGlzYWJsZWQKNGYwYWIxYiBody9pMzg2OiBkZWNs
YXJlIEFDUEkgbW90aGVyIGJvYXJkIHJlc291cmNlIGZvciBNTUNPTkZJRyByZWdpb24KNjk0Nzgx
MiBhY3BpOiBzZXQgZmFkdC5zbWlfY21kIHRvIHplcm8gd2hlbiBTTU0gaXMgbm90IHN1cHBvcnRl
ZAo0YWU5MmZkIGFjcGkvY29yZTogYWx3YXlzIHNldCBTQ0lfRU4gd2hlbiBTTU0gaXNuJ3Qgc3Vw
cG9ydGVkCgo9PT0gT1VUUFVUIEJFR0lOID09PQoxLzQgQ2hlY2tpbmcgY29tbWl0IDRhZTkyZmQ4
ZThhNSAoYWNwaS9jb3JlOiBhbHdheXMgc2V0IFNDSV9FTiB3aGVuIFNNTSBpc24ndCBzdXBwb3J0
ZWQpCjIvNCBDaGVja2luZyBjb21taXQgNjk0NzgxMmM4ZTY5IChhY3BpOiBzZXQgZmFkdC5zbWlf
Y21kIHRvIHplcm8gd2hlbiBTTU0gaXMgbm90IHN1cHBvcnRlZCkKRVJST1I6IGxpbmUgb3ZlciA5
MCBjaGFyYWN0ZXJzCiM0MTogRklMRTogaHcvaTM4Ni9hY3BpLWJ1aWxkLmM6MTY3OgorICAgICAg
ICAgICAgc21tX2VuYWJsZWQgPyBvYmplY3RfcHJvcGVydHlfZ2V0X3VpbnQobywgQUNQSV9QTV9Q
Uk9QX0FDUElfRU5BQkxFX0NNRCwgTlVMTCkgOiAwLAoKRVJST1I6IGxpbmUgb3ZlciA5MCBjaGFy
YWN0ZXJzCiM0NDogRklMRTogaHcvaTM4Ni9hY3BpLWJ1aWxkLmM6MTY5OgorICAgICAgICAgICAg
c21tX2VuYWJsZWQgPyBvYmplY3RfcHJvcGVydHlfZ2V0X3VpbnQobywgQUNQSV9QTV9QUk9QX0FD
UElfRElTQUJMRV9DTUQsIE5VTEwpIDogMCwKCnRvdGFsOiAyIGVycm9ycywgMCB3YXJuaW5ncywg
MjMgbGluZXMgY2hlY2tlZAoKUGF0Y2ggMi80IGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJl
dmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQg
dGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCgoz
LzQgQ2hlY2tpbmcgY29tbWl0IDRmMGFiMWI5NzQ0YyAoaHcvaTM4NjogZGVjbGFyZSBBQ1BJIG1v
dGhlciBib2FyZCByZXNvdXJjZSBmb3IgTU1DT05GSUcgcmVnaW9uKQo0LzQgQ2hlY2tpbmcgY29t
bWl0IDhlZWE0ZTE4N2FjOCAoaTM4NjogYWNwaTogRG9uJ3QgYnVpbGQgSFBFVCBBQ1BJIGVudHJ5
IGlmIEhQRVQgaXMgZGlzYWJsZWQpCj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4
aXRlZCB3aXRoIGNvZGU6IDEKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9w
YXRjaGV3Lm9yZy9sb2dzL2NvdmVyLjE2MTI0MjQ4MTQuZ2l0LmlzYWt1LnlhbWFoYXRhQGludGVs
LmNvbS90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRl
ZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNl
IHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

