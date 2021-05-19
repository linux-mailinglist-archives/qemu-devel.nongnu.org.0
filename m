Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1C63892BD
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 17:35:17 +0200 (CEST)
Received: from localhost ([::1]:51196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljOE8-0000Kz-VJ
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 11:35:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1ljOD3-00084L-R6
 for qemu-devel@nongnu.org; Wed, 19 May 2021 11:34:09 -0400
Resent-Date: Wed, 19 May 2021 11:34:09 -0400
Resent-Message-Id: <E1ljOD3-00084L-R6@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1ljOD1-0007ty-7i
 for qemu-devel@nongnu.org; Wed, 19 May 2021 11:34:09 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1621438434; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=FPNHOyCEO/EZ+Xag+bbs6fn1yf8e6TVBGtjljhnAJvd0dlifh1AQ+tQ+vrsxD3lY8dxsiB7CNSoaW0QOwIUEYjq6YM12/tQGhsKKqqvGMgXemWpM4FRQAAD5yBroXk/0xkatmwGxpSFFM72SdLwNHtaR1ZFIDrkTzIQ9r704jAU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1621438434;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=cKmAWG37Y42fH1zpnYgz/XLsHNH3Gqu4zdOFyXf9uVk=; 
 b=gmGU1Kik6aOzdi0SfGMO6k0G+JXBuPxniuVOnRpOLTsE4risFvNS+BNNm7BCkL+7gdboWpAv4gYCn6GRhmXeXMM437P+F7JU1xJp6e3LDOSN7KS3H4SaWjZDvycnLi343oGO68fKZWcaGBZvFy+7yMP53SU75+HOXS6ONMi/JFE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1621438426713298.73818239027446;
 Wed, 19 May 2021 08:33:46 -0700 (PDT)
In-Reply-To: <20210519152541.30625-1-mwilck@suse.com>
Subject: Re: [PATCH] qemu-binfmt-conf.sh: fix -F option
Message-ID: <162143842538.22072.12320152107262083294@0addf061776e>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: mwilck@suse.com
Date: Wed, 19 May 2021 08:33:46 -0700 (PDT)
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
Cc: lvivier@redhat.com, qemu-devel@nongnu.org, mwilck@suse.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDUxOTE1MjU0MS4zMDYy
NS0xLW13aWxja0BzdXNlLmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNv
bWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9y
bWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjEwNTE5MTUyNTQxLjMwNjI1LTEt
bXdpbGNrQHN1c2UuY29tClN1YmplY3Q6IFtQQVRDSF0gcWVtdS1iaW5mbXQtY29uZi5zaDogZml4
IC1GIG9wdGlvbgoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaApnaXQgcmV2
LXBhcnNlIGJhc2UgPiAvZGV2L251bGwgfHwgZXhpdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZm
LnJlbmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVlCmdpdCBj
b25maWcgLS1sb2NhbCBkaWZmLmFsZ29yaXRobSBoaXN0b2dyYW0KLi9zY3JpcHRzL2NoZWNrcGF0
Y2gucGwgLS1tYWlsYmFjayBiYXNlLi4KPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClVwZGF0aW5n
IDNjOGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQKRnJvbSBodHRwczovL2dp
dGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUKICogW25ldyB0YWddICAgICAgICAgcGF0Y2hl
dy8yMDIxMDUxOTE1MjU0MS4zMDYyNS0xLW13aWxja0BzdXNlLmNvbSAtPiBwYXRjaGV3LzIwMjEw
NTE5MTUyNTQxLjMwNjI1LTEtbXdpbGNrQHN1c2UuY29tClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5j
aCAndGVzdCcKZDQxYTA3YiBxZW11LWJpbmZtdC1jb25mLnNoOiBmaXggLUYgb3B0aW9uCgo9PT0g
T1VUUFVUIEJFR0lOID09PQpFUlJPUjogbGluZSBvdmVyIDkwIGNoYXJhY3RlcnMKIzI1OiBGSUxF
OiBzY3JpcHRzL3FlbXUtYmluZm10LWNvbmYuc2g6MzQzOgorb3B0aW9ucz0kKGdldG9wdCAtbyBk
czpROlM6ZTpoYzpwOmc6RjogLWwgZGViaWFuLHN5c3RlbWQ6LHFlbXUtcGF0aDoscWVtdS1zdWZm
aXg6LGV4cG9ydGRpcjosaGVscCxjcmVkZW50aWFsOixwZXJzaXN0ZW50OixwcmVzZXJ2ZS1hcmd2
MDogLS0gIiRAIikKCnRvdGFsOiAxIGVycm9ycywgMCB3YXJuaW5ncywgOCBsaW5lcyBjaGVja2Vk
CgpDb21taXQgZDQxYTA3YjRhNGRmIChxZW11LWJpbmZtdC1jb25mLnNoOiBmaXggLUYgb3B0aW9u
KSBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJy
b3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNl
ZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29t
bWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApo
dHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIxMDUxOTE1MjU0MS4zMDYyNS0xLW13aWxja0BzdXNl
LmNvbS90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRl
ZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNl
IHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

