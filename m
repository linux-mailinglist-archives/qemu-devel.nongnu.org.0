Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF8733FDFD
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 05:03:09 +0100 (CET)
Received: from localhost ([::1]:36076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMjsL-0007xY-2W
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 00:03:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lMjqZ-0007QA-VB
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 00:01:19 -0400
Resent-Date: Thu, 18 Mar 2021 00:01:19 -0400
Resent-Message-Id: <E1lMjqZ-0007QA-VB@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lMjqW-0002Vx-HQ
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 00:01:19 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1616040062; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=i6Io2oyTfQs9lHZnVTlODANtAgMy6uxF6JEiApGp6RWU3kaZkkqGgm/QJCclV1AvlL307yDg8AMs3L45aMKml44f395DmeJ9Kc5vQpsISQlKCaplOTzzkdBtCCHkJ7LOVFgsxZF79lTGAzmMycFI7By0be0aXSCtpRfegVj6ghw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1616040062;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=74qULIcSaoV/TPSvJG+tNpZ/1mtq5XmCGMc7UpH6qvg=; 
 b=aUYZP18yJwGWu5RI/eOE+q+9YY8XHO4hBPaWbQmPfRsstcx8jwYUQRQPBQ4fCjCBGq+1P2hvSb0KBLDiWPC2pOt67joN7FN6GFlcY6LdOtOJCA5BHmJRzNP2sNr5FBbEMTldovXw7Gn/BvtsFBq1z3bcTZVg/z0fnkGW3jESTTI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1616040059449597.4733120505783;
 Wed, 17 Mar 2021 21:00:59 -0700 (PDT)
In-Reply-To: <20210318035427.13436-1-akihiko.odaki@gmail.com>
Subject: Re: [PATCH v2] net/macos: implement vmnet-based netdev
Message-ID: <161604005791.7441.15490694161720110760@c9d4d6fbb2f1>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: akihiko.odaki@gmail.com
Date: Wed, 17 Mar 2021 21:00:59 -0700 (PDT)
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
Cc: thuth@redhat.com, stefanha@gmail.com, jasowang@redhat.com,
 armbru@redhat.com, qemu-devel@nongnu.org, phillip@axleos.com,
 akihiko.odaki@gmail.com, hsp.cat7@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDMxODAzNTQyNy4xMzQz
Ni0xLWFraWhpa28ub2Rha2lAZ21haWwuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRv
IGhhdmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1v
cmUgaW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMTAzMTgwMzU0Mjcu
MTM0MzYtMS1ha2loaWtvLm9kYWtpQGdtYWlsLmNvbQpTdWJqZWN0OiBbUEFUQ0ggdjJdIG5ldC9t
YWNvczogaW1wbGVtZW50IHZtbmV0LWJhc2VkIG5ldGRldgoKPT09IFRFU1QgU0NSSVBUIEJFR0lO
ID09PQojIS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2L251bGwgfHwgZXhpdCAw
CmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxvY2Fs
IGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLmFsZ29yaXRobSBoaXN0
b2dyYW0KLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBiYXNlLi4KPT09IFRFU1Qg
U0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4
ODg3MTMzODQKRnJvbSBodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUKICog
W25ldyB0YWddICAgICAgICAgcGF0Y2hldy8yMDIxMDMxODAzNTQyNy4xMzQzNi0xLWFraWhpa28u
b2Rha2lAZ21haWwuY29tIC0+IHBhdGNoZXcvMjAyMTAzMTgwMzU0MjcuMTM0MzYtMS1ha2loaWtv
Lm9kYWtpQGdtYWlsLmNvbQpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCmMzZTA1MDcg
bmV0L21hY29zOiBpbXBsZW1lbnQgdm1uZXQtYmFzZWQgbmV0ZGV2Cgo9PT0gT1VUUFVUIEJFR0lO
ID09PQpVc2Ugb2YgdW5pbml0aWFsaXplZCB2YWx1ZSAkYWNwaV90ZXN0ZXhwZWN0ZWQgaW4gc3Ry
aW5nIGVxIGF0IC4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIGxpbmUgMTUyOS4KV0FSTklORzogYWRk
ZWQsIG1vdmVkIG9yIGRlbGV0ZWQgZmlsZShzKSwgZG9lcyBNQUlOVEFJTkVSUyBuZWVkIHVwZGF0
aW5nPwojMTQ0OiAKbmV3IGZpbGUgbW9kZSAxMDA2NDQKCkVSUk9SOiBleHRlcm5zIHNob3VsZCBi
ZSBhdm9pZGVkIGluIC5jIGZpbGVzCiMxNzg6IEZJTEU6IG5ldC92bW5ldC1tYWNvcy5jOjMwOgor
aW50IG5ldF9pbml0X3ZtbmV0X21hY29zKGNvbnN0IE5ldGRldiAqbmV0ZGV2LCBjb25zdCBjaGFy
ICpuYW1lLAoKV0FSTklORzogYXJjaGl0ZWN0dXJlIHNwZWNpZmljIGRlZmluZXMgc2hvdWxkIGJl
IGF2b2lkZWQKIzIwMzogRklMRTogbmV0L3ZtbmV0LW1hY29zLmM6NTU6CisjaWYgX19NQUNfT1Nf
WF9WRVJTSU9OX01BWF9BTExPV0VEID49IDExMDAwMAoKRVJST1I6IHNwYWNlcyByZXF1aXJlZCBh
cm91bmQgdGhhdCAnXicgKGN0eDpFeFYpCiMyODc6IEZJTEU6IG5ldC92bW5ldC1tYWNvcy5jOjEz
OToKKyAgICAgICAgXmJvb2woc2l6ZV90IGluZGV4LCB4cGNfb2JqZWN0X3QgIF9Ob25udWxsIHZh
bHVlKSB7CiAgICAgICAgIF4KCkVSUk9SOiBzcGFjZXMgcmVxdWlyZWQgYXJvdW5kIHRoYXQgJ14n
IChjdHg6RXhWKQojMzAwOiBGSUxFOiBuZXQvdm1uZXQtbWFjb3MuYzoxNTI6CisgICAgICAgICAg
ICBeYm9vbChzaXplX3QgaW5kZXgsIHhwY19vYmplY3RfdCAgX05vbm51bGwgdmFsdWUpIHsKICAg
ICAgICAgICAgIF4KCldBUk5JTkc6IGxpbmUgb3ZlciA4MCBjaGFyYWN0ZXJzCiMzODU6IEZJTEU6
IG5ldC92bW5ldC1tYWNvcy5jOjIzNzoKKyAgICB4cGNfb2JqZWN0X3QgaWZhY2VfZGVzYyA9IF9j
b25zdHJ1Y3Rfdm1uZXRfaW50ZXJmYWNlX2Rlc2NyaXB0aW9uKHZtbmV0X29wdHMpOwoKRVJST1I6
IHNwYWNlcyByZXF1aXJlZCBhcm91bmQgdGhhdCAnXicgKGN0eDpFeFYpCiM0MTk6IEZJTEU6IG5l
dC92bW5ldC1tYWNvcy5jOjI3MToKKyAgICAgICAgXih2bW5ldF9yZXR1cm5fdCBzdGF0dXMsIHhw
Y19vYmplY3RfdCAgX051bGxhYmxlIGludGVyZmFjZV9wYXJhbSkgewogICAgICAgICBeCgpFUlJP
Ujogc3BhY2VzIHJlcXVpcmVkIGFyb3VuZCB0aGF0ICdeJyAoY3R4OkV4VikKIzUwMDogRklMRTog
bmV0L3ZtbmV0LW1hY29zLmM6MzUyOgorICAgICAgICBeKGludGVyZmFjZV9ldmVudF90IGV2ZW50
X21hc2ssIHhwY19vYmplY3RfdCAgX05vbm51bGwgZXZlbnQpIHsKICAgICAgICAgXgoKV0FSTklO
RzogQmxvY2sgY29tbWVudHMgdXNlIGEgbGVhZGluZyAvKiBvbiBhIHNlcGFyYXRlIGxpbmUKIzUz
ODogRklMRTogbmV0L3ZtbmV0LW1hY29zLmM6MzkwOgorICAgICAgICAvKiBEaXNwYXRjaCB0aGlz
IGJsb2NrIHRvIGEgZ2xvYmFsIHF1ZXVlIGluc3RlYWQgb2YgdGhlIG1haW4gcXVldWUsCgpFUlJP
Ujogc3BhY2VzIHJlcXVpcmVkIGFyb3VuZCB0aGF0ICdeJyAoY3R4OkV4VikKIzU0NTogRklMRTog
bmV0L3ZtbmV0LW1hY29zLmM6Mzk3OgorICAgICAgICAgICAgICAgICAgICAgICBeewogICAgICAg
ICAgICAgICAgICAgICAgICBeCgp0b3RhbDogNiBlcnJvcnMsIDQgd2FybmluZ3MsIDY1MyBsaW5l
cyBjaGVja2VkCgpDb21taXQgYzNlMDUwN2Y0Yzk1IChuZXQvbWFjb3M6IGltcGxlbWVudCB2bW5l
dC1iYXNlZCBuZXRkZXYpIGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFu
eSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUg
bWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCj09PSBPVVRQVVQgRU5E
ID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgpUaGUgZnVsbCBsb2cgaXMg
YXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMjEwMzE4MDM1NDI3LjEzNDM2
LTEtYWtpaGlrby5vZGFraUBnbWFpbC5jb20vdGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3Nh
Z2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczov
L3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZl
bEByZWRoYXQuY29t

