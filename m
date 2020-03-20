Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9279818D6BB
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Mar 2020 19:21:33 +0100 (CET)
Received: from localhost ([::1]:57543 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jFMGy-0004xV-4M
	for lists+qemu-devel@lfdr.de; Fri, 20 Mar 2020 14:21:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42810)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1jFMGD-0004Ut-Qm
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 14:20:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1jFMGC-0002y1-7t
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 14:20:45 -0400
Resent-Date: Fri, 20 Mar 2020 14:20:45 -0400
Resent-Message-Id: <E1jFMGC-0002y1-7t@eggs.gnu.org>
Received: from sender4-of-o51.zoho.com ([136.143.188.51]:21145)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1jFMGC-0002v1-03
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 14:20:44 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1584728428; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Oas0Gpm32gmBnUdBDsMeCsfQWx+mvocnuHfqOwUEcI/4hdeSg4DXmotbScxcGNvo/i9lK8TjR+slNKP8gy3tHx1SZnn1Q66A1xBjFmDX5RH/6ANShWRn562v+IFljUZlg+iKpyhRwFXcXXj57UH6gBuMk5Y/UjbbWJC4Z5RoIXk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1584728428;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=SA3PpHAuMMUDaUHMezN9R3DiwdtVe5XWY6MuSWu8EfM=; 
 b=oKTl/6nYd9fPfLvnv1I31lKBVzCa+bZEtqiY83E6WBJNgNmz6rbZFQm3izM3lUbjy5hEnHB2wgWWnMyys0Q0LkewmgDjFDcthIzLfk9t6Qp2RZTQkqrzcp+KwYbjiAAHPZmPSegi5yMHVXxUiMohNKuviM4wug+2WY5tW/ZkQNc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1584728425988904.7284635556323;
 Fri, 20 Mar 2020 11:20:25 -0700 (PDT)
In-Reply-To: <20200320155106.549514-1-marcandre.lureau@redhat.com>
Subject: Re: [PULL v2 0/1] Slirp patches
Message-ID: <158472842482.16549.4040421729686986328@39012742ff91>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: marcandre.lureau@redhat.com
Date: Fri, 20 Mar 2020 11:20:25 -0700 (PDT)
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org,
 samuel.thibault@ens-lyon.org, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDMyMDE1NTEwNi41NDk1
MTQtMS1tYXJjYW5kcmUubHVyZWF1QHJlZGhhdC5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2Vl
bXMgdG8gaGF2ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBm
b3IKbW9yZSBpbmZvcm1hdGlvbjoKClN1YmplY3Q6IFtQVUxMIHYyIDAvMV0gU2xpcnAgcGF0Y2hl
cwpNZXNzYWdlLWlkOiAyMDIwMDMyMDE1NTEwNi41NDk1MTQtMS1tYXJjYW5kcmUubHVyZWF1QHJl
ZGhhdC5jb20KVHlwZTogc2VyaWVzCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9i
YXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNvbmZpZyAt
LWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVz
IFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQouL3Njcmlw
dHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQgRU5EID09
PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApTd2l0
Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCmNhMDAxNzggc2xpcnA6IHVwZGF0ZSBzdWJtb2R1
bGUgdG8gdjQuMi4wKwoKPT09IE9VVFBVVCBCRUdJTiA9PT0KRVJST1I6IE1pc3NpbmcgU2lnbmVk
LW9mZi1ieTogbGluZShzKQoKdG90YWw6IDEgZXJyb3JzLCAwIHdhcm5pbmdzLCAyIGxpbmVzIGNo
ZWNrZWQKCkNvbW1pdCBjYTAwMTc4MzE2MDYgKHNsaXJwOiB1cGRhdGUgc3VibW9kdWxlIHRvIHY0
LjIuMCspIGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVz
ZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5l
ciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCj09PSBPVVRQVVQgRU5EID09PQoKVGVz
dCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxl
IGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMjAwMzIwMTU1MTA2LjU0OTUxNC0xLW1hcmNh
bmRyZS5sdXJlYXVAcmVkaGF0LmNvbS90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4K
LS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0
Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJl
ZGhhdC5jb20=

