Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 785A72937D2
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Oct 2020 11:18:39 +0200 (CEST)
Received: from localhost ([::1]:48030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUnmw-0006sz-IW
	for lists+qemu-devel@lfdr.de; Tue, 20 Oct 2020 05:18:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kUnm2-00068Y-PL
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 05:17:42 -0400
Resent-Date: Tue, 20 Oct 2020 05:17:42 -0400
Resent-Message-Id: <E1kUnm2-00068Y-PL@lists.gnu.org>
Received: from sender4-of-o57.zoho.com ([136.143.188.57]:21739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kUnm0-00087x-1s
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 05:17:42 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1603185443; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=BSBL/TVOAdRMUbwWav50Y7Y+VKCmv+q73uSULAxeHtqk8bGy5O4Lc+DUL5cCgFXyrEEGsiGjFld1TLW2VHLZyxPZ34sGWGoXkyGAUYMyZwYoZ33I4GPK/2We9HHoyXyTUg/0vIfsxInqcs51Yu1hx8PuWcig9Z4yyXUSqiOAfB8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1603185443;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=aJkLfV2kAAkuJ4m52VH6Xu9PHdHK+5f+F0jka8WLYLI=; 
 b=gUEseeQTtjoJ7uuy/s1n701qeHJEHL6+Q1vOWGdZGxIsIyFAiOkeNsMHlaXQUdC/oLaS5dEydrnI1fJ0SJE85NSZnTP8vWPXUHeaO+LGp679WO/jOp7zMFjbuhRuboSjHuajNZ4o9npSk/TnmnIgWt6/VPRnSyTBKbfHa6NovCc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1603185440972916.1806768292164;
 Tue, 20 Oct 2020 02:17:20 -0700 (PDT)
Subject: Re: [PATCH v2] hw/core/qdev-clock: add a reference on aliased clocks
Message-ID: <160318543901.32698.18309056390234077760@66eaa9a8a123>
In-Reply-To: <20201020091024.320381-1-luc@lmichel.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: luc@lmichel.fr
Date: Tue, 20 Oct 2020 02:17:20 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.57; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o57.zoho.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 05:17:37
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Cc: damien.hedde@greensocs.com, peter.maydell@linaro.org, berrange@redhat.com,
 ehabkost@redhat.com, armbru@redhat.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 pbonzini@redhat.com, luc@lmichel.fr, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMTAyMDA5MTAyNC4zMjAz
ODEtMS1sdWNAbG1pY2hlbC5mci8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNv
bWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9y
bWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjAxMDIwMDkxMDI0LjMyMDM4MS0x
LWx1Y0BsbWljaGVsLmZyClN1YmplY3Q6IFtQQVRDSCB2Ml0gaHcvY29yZS9xZGV2LWNsb2NrOiBh
ZGQgYSByZWZlcmVuY2Ugb24gYWxpYXNlZCBjbG9ja3MKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9
PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQgMApn
aXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBk
aWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9n
cmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNUIFND
UklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4
NzEzMzg0CmVycm9yOiBSUEMgZmFpbGVkOyByZXN1bHQ9NywgSFRUUCBjb2RlID0gMApmYXRhbDog
VGhlIHJlbW90ZSBlbmQgaHVuZyB1cCB1bmV4cGVjdGVkbHkKZXJyb3I6IENvdWxkIG5vdCBmZXRj
aCAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0ClRyYWNlYmFjayAobW9z
dCByZWNlbnQgY2FsbCBsYXN0KToKICBGaWxlICJwYXRjaGV3LXRlc3Rlci9zcmMvcGF0Y2hldy1j
bGkiLCBsaW5lIDUyMSwgaW4gdGVzdF9vbmUKICAgIGdpdF9jbG9uZV9yZXBvKGNsb25lLCByWyJy
ZXBvIl0sIHJbImhlYWQiXSwgbG9nZiwgVHJ1ZSkKICBGaWxlICJwYXRjaGV3LXRlc3Rlci9zcmMv
cGF0Y2hldy1jbGkiLCBsaW5lIDQ4LCBpbiBnaXRfY2xvbmVfcmVwbwogICAgc3Rkb3V0PWxvZ2Ys
IHN0ZGVycj1sb2dmKQogIEZpbGUgIi9vcHQvcmgvcmgtcHl0aG9uMzYvcm9vdC91c3IvbGliNjQv
cHl0aG9uMy42L3N1YnByb2Nlc3MucHkiLCBsaW5lIDI5MSwgaW4gY2hlY2tfY2FsbAogICAgcmFp
c2UgQ2FsbGVkUHJvY2Vzc0Vycm9yKHJldGNvZGUsIGNtZCkKc3VicHJvY2Vzcy5DYWxsZWRQcm9j
ZXNzRXJyb3I6IENvbW1hbmQgJ1snZ2l0JywgJ3JlbW90ZScsICdhZGQnLCAnLWYnLCAnLS1taXJy
b3I9ZmV0Y2gnLCAnM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NCcsICdo
dHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUnXScgcmV0dXJuZWQgbm9uLXpl
cm8gZXhpdCBzdGF0dXMgMS4KCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8v
cGF0Y2hldy5vcmcvbG9ncy8yMDIwMTAyMDA5MTAyNC4zMjAzODEtMS1sdWNAbG1pY2hlbC5mci90
ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRv
bWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQg
eW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

