Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA7233D7FD
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 16:47:29 +0100 (CET)
Received: from localhost ([::1]:37150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMBuq-0005Xu-9x
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 11:47:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lMBqQ-0002qp-Hr
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 11:42:54 -0400
Resent-Date: Tue, 16 Mar 2021 11:42:54 -0400
Resent-Message-Id: <E1lMBqQ-0002qp-Hr@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lMBqF-0006iS-Is
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 11:42:53 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1615909356; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=A3ykEOX2J725fFkEt2P3vPHg7K6oJUiZ6IGcuKk79/QgULOfdTHuCWRYlrek97gQq/Zg9xy+z/aRZeU19tfbntObwrXmjwhhPn3Vd8/p5i6HNcG4Zlgqe6mwYBy8Nn8mUYoms1a9fft7B/sgNNnsLyChfylOh5IvBthIjWIlrRA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1615909356;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=DvvSdObiomYt6XN+AQtDAk5p8pVxMllOayaAAQNGFZo=; 
 b=kd9oyCoCHv0Gsb1tewDC7P8hzqKIhDzAAr9QQTGZz/F1QJKARYT5ckq0gRgvaiQ7K8n2sN0ITy4yfTDYpUK7SsEVawiIVxgpWgD6fC0lH704UXtOCl7I9wrNq9NVFUlyJCqkQcirYagopMFCOPYVM/tslE49YkPqLbIyvvIZE5Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1615909187976796.7450691248556;
 Tue, 16 Mar 2021 08:39:47 -0700 (PDT)
In-Reply-To: <20210316143812.2363588-1-kraxel@redhat.com>
Subject: Re: [PATCH 0/9] edid: windows fixes
Message-ID: <161590918687.11496.4679678303822429887@c9d4d6fbb2f1>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: kraxel@redhat.com
Date: Tue, 16 Mar 2021 08:39:47 -0700 (PDT)
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
Cc: qemu-devel@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDMxNjE0MzgxMi4yMzYz
NTg4LTEta3JheGVsQHJlZGhhdC5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2
ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBp
bmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIxMDMxNjE0MzgxMi4yMzYz
NTg4LTEta3JheGVsQHJlZGhhdC5jb20KU3ViamVjdDogW1BBVENIIDAvOV0gZWRpZDogd2luZG93
cyBmaXhlcwoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaApnaXQgcmV2LXBh
cnNlIGJhc2UgPiAvZGV2L251bGwgfHwgZXhpdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJl
bmFtZWxpbWl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25m
aWcgLS1sb2NhbCBkaWZmLmFsZ29yaXRobSBoaXN0b2dyYW0KLi9zY3JpcHRzL2NoZWNrcGF0Y2gu
cGwgLS1tYWlsYmFjayBiYXNlLi4KPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNj
OGNmNWE5YzIxZmY4NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQKRnJvbSBodHRwczovL2dpdGh1
Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUKIC0gW3RhZyB1cGRhdGVdICAgICAgcGF0Y2hldy8y
MDIxMDIxMjE1MDI1Ni44ODUtMS16aGl3ZWlfbGl1QGMtc2t5LmNvbSAtPiBwYXRjaGV3LzIwMjEw
MjEyMTUwMjU2Ljg4NS0xLXpoaXdlaV9saXVAYy1za3kuY29tCiAtIFt0YWcgdXBkYXRlXSAgICAg
IHBhdGNoZXcvMjAyMTAzMTYxMzU5MDcuMzY0NjkwMS0xLWFybWJydUByZWRoYXQuY29tIC0+IHBh
dGNoZXcvMjAyMTAzMTYxMzU5MDcuMzY0NjkwMS0xLWFybWJydUByZWRoYXQuY29tCiAqIFtuZXcg
dGFnXSAgICAgICAgIHBhdGNoZXcvMjAyMTAzMTYxNDM4MTIuMjM2MzU4OC0xLWtyYXhlbEByZWRo
YXQuY29tIC0+IHBhdGNoZXcvMjAyMTAzMTYxNDM4MTIuMjM2MzU4OC0xLWtyYXhlbEByZWRoYXQu
Y29tClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKYWJmZGIzZSBlZGlkOiBhZGQgc3Vw
cG9ydCBmb3IgRGlzcGxheUlEIGV4dGVuc2lvbiAoNWsgcmVzb2x1dGlvbikKZDMzMDUzNCBlZGlk
OiBhbGxvdyBhcmJpdHJhcnktbGVuZ3RoIGNoZWNrc3Vtcwo3NTQzZGExIGVkaWQ6IG1vdmUgdGlt
aW5nIGdlbmVyYXRpb24gaW50byBhIHNlcGFyYXRlIGZ1bmN0aW9uCjBjNDI4OTQgZWRpZDogTWFr
ZSByZWZyZXNoIHJhdGUgY29uZmlndXJhYmxlCmQxMmFmYTUgZWRpZDogcHJlZmVyIHN0YW5kYXJk
IHRpbWluZ3MKNWY2ODNhNCBlZGlkOiB1c2UgZHRhIGV4dGVuc2lvbiBibG9jayBkZXNjcmlwdG9y
cwpjNmRkYTJjIGVkaWQ6IG1vdmUgeHRyYTMgZGVzY3JpcHRvcgo1NzJlNjk4IGVkaWQ6IGVkaWRf
ZGVzY19uZXh0CjI5ZDUzYjggcWVtdS1lZGlkOiB1c2UgcWVtdV9lZGlkX3NpemUoKQoKPT09IE9V
VFBVVCBCRUdJTiA9PT0KMS85IENoZWNraW5nIGNvbW1pdCAyOWQ1M2I4NGQ4OTcgKHFlbXUtZWRp
ZDogdXNlIHFlbXVfZWRpZF9zaXplKCkpCjIvOSBDaGVja2luZyBjb21taXQgNTcyZTY5OGFhNjc4
IChlZGlkOiBlZGlkX2Rlc2NfbmV4dCkKMy85IENoZWNraW5nIGNvbW1pdCBjNmRkYTJjZWYwZWYg
KGVkaWQ6IG1vdmUgeHRyYTMgZGVzY3JpcHRvcikKNC85IENoZWNraW5nIGNvbW1pdCA1ZjY4M2E0
ZjMxZTEgKGVkaWQ6IHVzZSBkdGEgZXh0ZW5zaW9uIGJsb2NrIGRlc2NyaXB0b3JzKQo1LzkgQ2hl
Y2tpbmcgY29tbWl0IGQxMmFmYTVlNWRkMSAoZWRpZDogcHJlZmVyIHN0YW5kYXJkIHRpbWluZ3Mp
CjYvOSBDaGVja2luZyBjb21taXQgMGM0Mjg5NGFkMGU0IChlZGlkOiBNYWtlIHJlZnJlc2ggcmF0
ZSBjb25maWd1cmFibGUpCldBUk5JTkc6IGxpbmUgb3ZlciA4MCBjaGFyYWN0ZXJzCiMzMzogRklM
RTogaHcvZGlzcGxheS9lZGlkLWdlbmVyYXRlLmM6MjM5OgorICAgIHVpbnQ2NF90IGNsb2NrICA9
ICh1aW50NjRfdClyZWZyZXNoX3JhdGUgKiAoeHJlcyArIHhibGFuaykgKiAoeXJlcyArIHlibGFu
ayk7CgpFUlJPUjogTWFjcm9zIHdpdGggY29tcGxleCB2YWx1ZXMgc2hvdWxkIGJlIGVuY2xvc2Vk
IGluIHBhcmVudGhlc2lzCiM3ODogRklMRTogaW5jbHVkZS9ody9kaXNwbGF5L2VkaWQuaDoyNToK
KyNkZWZpbmUgREVGSU5FX0VESURfUFJPUEVSVElFUyhfc3RhdGUsIF9lZGlkX2luZm8pICAgICAg
ICAgICAgICAgICAgICAgICAgIFwKKyAgICBERUZJTkVfUFJPUF9VSU5UMzIoInhyZXMiLCBfc3Rh
dGUsIF9lZGlkX2luZm8ucHJlZngsIDApLCAgICAgICAgICAgICAgIFwKKyAgICBERUZJTkVfUFJP
UF9VSU5UMzIoInlyZXMiLCBfc3RhdGUsIF9lZGlkX2luZm8ucHJlZnksIDApLCAgICAgICAgICAg
ICAgIFwKKyAgICBERUZJTkVfUFJPUF9VSU5UMzIoInhtYXgiLCBfc3RhdGUsIF9lZGlkX2luZm8u
bWF4eCwgMCksICAgICAgICAgICAgICAgIFwKKyAgICBERUZJTkVfUFJPUF9VSU5UMzIoInltYXgi
LCBfc3RhdGUsIF9lZGlkX2luZm8ubWF4eSwgMCksICAgICAgICAgICAgICAgIFwKKyAgICBERUZJ
TkVfUFJPUF9VSU5UMzIoInJlZnJlc2hfcmF0ZSIsIF9zdGF0ZSwgX2VkaWRfaW5mby5yZWZyZXNo
X3JhdGUsIDApCgp0b3RhbDogMSBlcnJvcnMsIDEgd2FybmluZ3MsIDU3IGxpbmVzIGNoZWNrZWQK
ClBhdGNoIDYvOSBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2Yg
dGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50
YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgoKNy85IENoZWNraW5nIGNvbW1p
dCA3NTQzZGExNWI3NTUgKGVkaWQ6IG1vdmUgdGltaW5nIGdlbmVyYXRpb24gaW50byBhIHNlcGFy
YXRlIGZ1bmN0aW9uKQo4LzkgQ2hlY2tpbmcgY29tbWl0IGQzMzA1MzRmYzY0YiAoZWRpZDogYWxs
b3cgYXJiaXRyYXJ5LWxlbmd0aCBjaGVja3N1bXMpCjkvOSBDaGVja2luZyBjb21taXQgYWJmZGIz
ZTBmMTE2IChlZGlkOiBhZGQgc3VwcG9ydCBmb3IgRGlzcGxheUlEIGV4dGVuc2lvbiAoNWsgcmVz
b2x1dGlvbikpCj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNv
ZGU6IDEKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9s
b2dzLzIwMjEwMzE2MTQzODEyLjIzNjM1ODgtMS1rcmF4ZWxAcmVkaGF0LmNvbS90ZXN0aW5nLmNo
ZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5
IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVk
YmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

