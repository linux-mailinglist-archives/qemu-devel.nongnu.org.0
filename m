Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3732138BCDF
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 05:11:11 +0200 (CEST)
Received: from localhost ([::1]:54420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljvZ8-0004g3-Ai
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 23:11:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1ljvYC-0003ro-Jn; Thu, 20 May 2021 23:10:12 -0400
Resent-Date: Thu, 20 May 2021 23:10:12 -0400
Resent-Message-Id: <E1ljvYC-0003ro-Jn@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1ljvY9-0003AK-JM; Thu, 20 May 2021 23:10:12 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1621566593; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=N3g+8YgNahR6NHpNySWPm6t8EHQbsgrmFx6wEEOr+hKZw4LkP2DUCBhsRqs6HaN6VwHYBdMwA7BG04VONpz9wS9yWLbNTgVNPnofQ12ntrpNYNCNV3FJ0jff33D9rq2O9tb9gP2WqAxDkjA5vOLd0a/KxmTkRSXVtKiKfHvpDwI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1621566593;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=tFSwmScP3cTAEMu8IhWxn6LORL2yiIejJi7PLtX6dQ4=; 
 b=IcWQ3RTuXZsd6nuKfE4b31di+BVX1He+y4i+C0EGudqFuMsD9aYW9FsrAuw5G8un4K0ywbrb9bgOQtowskjoFBT1QKOsQDlmKV+nbuFU3nfQQglZvN/f11UXHsjYFWkD9Paxv1gm40X/scrdygynVqAYpL5GPkCn7mcg9jomxGw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 162156659123063.374848144303314;
 Thu, 20 May 2021 20:09:51 -0700 (PDT)
In-Reply-To: <20210521030146.2831663-1-iii@linux.ibm.com>
Subject: Re: [PATCH 0/2] Fix SIGILL psw.addr reporting
Message-ID: <162156658953.13945.10893118825055538744@0addf061776e>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: iii@linux.ibm.com
Date: Thu, 20 May 2021 20:09:51 -0700 (PDT)
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
Cc: iii@linux.ibm.com, david@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, laurent@vivier.eu, borntraeger@de.ibm.com,
 qemu-s390x@nongnu.org, krebbel@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDUyMTAzMDE0Ni4yODMx
NjYzLTEtaWlpQGxpbnV4LmlibS5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2
ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBp
bmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIxMDUyMTAzMDE0Ni4yODMx
NjYzLTEtaWlpQGxpbnV4LmlibS5jb20KU3ViamVjdDogW1BBVENIIDAvMl0gRml4IFNJR0lMTCBw
c3cuYWRkciByZXBvcnRpbmcKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gK
Z2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQgMApnaXQgY29uZmlnIC0tbG9j
YWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1
ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFtCi4vc2NyaXB0cy9j
aGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpV
cGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0CkZyb20gaHR0
cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiAqIFtuZXcgdGFnXSAgICAgICAg
IHBhdGNoZXcvMjAyMTA1MjEwMzAxNDYuMjgzMTY2My0xLWlpaUBsaW51eC5pYm0uY29tIC0+IHBh
dGNoZXcvMjAyMTA1MjEwMzAxNDYuMjgzMTY2My0xLWlpaUBsaW51eC5pYm0uY29tClN3aXRjaGVk
IHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKMDY5ZDAyYiB0ZXN0cy90Y2cvczM5MHg6IFRlc3QgU0lH
SUxMIGhhbmRsaW5nCmE4Njk2NDMgdGFyZ2V0L3MzOTB4OiBGaXggU0lHSUxMIHBzdy5hZGRyIHJl
cG9ydGluZwoKPT09IE9VVFBVVCBCRUdJTiA9PT0KMS8yIENoZWNraW5nIGNvbW1pdCBhODY5NjQz
NjRkNGQgKHRhcmdldC9zMzkweDogRml4IFNJR0lMTCBwc3cuYWRkciByZXBvcnRpbmcpCjIvMiBD
aGVja2luZyBjb21taXQgMDY5ZDAyYjBlZGYyICh0ZXN0cy90Y2cvczM5MHg6IFRlc3QgU0lHSUxM
IGhhbmRsaW5nKQpXQVJOSU5HOiBhZGRlZCwgbW92ZWQgb3IgZGVsZXRlZCBmaWxlKHMpLCBkb2Vz
IE1BSU5UQUlORVJTIG5lZWQgdXBkYXRpbmc/CiMyNjogCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CgpF
UlJPUjogZXh0ZXJucyBzaG91bGQgYmUgYXZvaWRlZCBpbiAuYyBmaWxlcwojMzc6IEZJTEU6IHRl
c3RzL3RjZy9zMzkweC9zaWdpbGwuYzo3OgorZXh0ZXJuIGNoYXIgZXhwZWN0ZWRfc2lfYWRkcltd
OwoKRVJST1I6IGV4dGVybnMgc2hvdWxkIGJlIGF2b2lkZWQgaW4gLmMgZmlsZXMKIzM4OiBGSUxF
OiB0ZXN0cy90Y2cvczM5MHgvc2lnaWxsLmM6ODoKK2V4dGVybiBjaGFyIGV4cGVjdGVkX3Bzd19h
ZGRyW107Cgp0b3RhbDogMiBlcnJvcnMsIDEgd2FybmluZ3MsIDQ1IGxpbmVzIGNoZWNrZWQKClBh
dGNoIDIvMiBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhl
c2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWlu
ZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgoKPT09IE9VVFBVVCBFTkQgPT09CgpU
ZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFi
bGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAyMTA1MjEwMzAxNDYuMjgzMTY2My0xLWlp
aUBsaW51eC5pYm0uY29tL3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlwZT1tZXNzYWdlLgotLS0KRW1h
aWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9y
Zy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNv
bQ==

