Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB642F5C8D
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 09:41:47 +0100 (CET)
Received: from localhost ([::1]:48016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzyCQ-0000UV-6m
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 03:41:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kzyBS-0008J6-Rf; Thu, 14 Jan 2021 03:40:46 -0500
Resent-Date: Thu, 14 Jan 2021 03:40:46 -0500
Resent-Message-Id: <E1kzyBS-0008J6-Rf@lists.gnu.org>
Received: from sender4-of-o52.zoho.com ([136.143.188.52]:21205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kzyBQ-00034h-0o; Thu, 14 Jan 2021 03:40:46 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1610613628; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=TV6oTz7cDRPyY+adSfeufuYyLaTdfKY3JIrI5bhIIWL9lwGwsAU74LMg4Qyooj1JFbCNO9Sc2t+r2QEqGc1sEVrbVlsirFZc+mG8zzkmbSq7c8guDyf2+xjf1KgspY98Korq7sZZ6U9ikSaN+o9edG+nEHw39hrekvnt59xz44k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1610613628;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=lX/1taTEjCey71Part5Ei/mVBHjbpS61rdTcAMa0GPc=; 
 b=i37KLSnUo2PVVaXMgvnmltfTNj6HDSxg0Hm8fQLrzCvoaLcC9PuWh7pHRN6XOWPS1wLtONwK6wK3QhzcYwI79QYqu5J3VScFpCHIhdYn+VyculTiUg8l/jH9YXLQeL7pcXVev/xn6XHgd8JjnzyA2WSlIV0EJwoFXrhl+5I7lG0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1610613626046946.520628145836;
 Thu, 14 Jan 2021 00:40:26 -0800 (PST)
In-Reply-To: <20210114081059.19632-1-zhanghan64@huawei.com>
Subject: Re: [PATCH 0/6] Fix some style problems in audio
Message-ID: <161061362461.25322.14663542493131765720@73fb1a5943b8>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: zhanghan64@huawei.com
Date: Thu, 14 Jan 2021 00:40:26 -0800 (PST)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.52; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o52.zoho.com
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
Cc: hunongda@huawei.com, zhang.zhanghailiang@huawei.com,
 qemu-trivial@nongnu.org, qemu-devel@nongnu.org, alex.chen@huawei.com,
 kraxel@redhat.com, zhanghan64@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDExNDA4MTA1OS4xOTYz
Mi0xLXpoYW5naGFuNjRAaHVhd2VpLmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBo
YXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3Jl
IGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjEwMTE0MDgxMDU5LjE5
NjMyLTEtemhhbmdoYW42NEBodWF3ZWkuY29tClN1YmplY3Q6IFtQQVRDSCAwLzZdIEZpeCBzb21l
IHN0eWxlIHByb2JsZW1zIGluIGF1ZGlvCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jp
bi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNvbmZp
ZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5h
bWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQouL3Nj
cmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQgRU5E
ID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApG
cm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdQogKiBbbmV3IHRhZ10g
ICAgICAgICBwYXRjaGV3LzIwMjEwMTE0MDgxMDU5LjE5NjMyLTEtemhhbmdoYW42NEBodWF3ZWku
Y29tIC0+IHBhdGNoZXcvMjAyMTAxMTQwODEwNTkuMTk2MzItMS16aGFuZ2hhbjY0QGh1YXdlaS5j
b20KU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0Jwo4ZjM1YTkyIGF1ZGlvOiBTdXNwZWN0
IGNvZGUgaW5kZW50IGZvciBjb25kaXRpb25hbCBzdGF0ZW1lbnRzCjhlZDA4NTMgYXVkaW86IERv
bid0IHVzZSAnIycgZmxhZyBvZiBwcmludGYgZm9ybWF0ICgnJSMnKSBpbgo1MWNkMWU3IGF1ZGlv
OiBGaXggbGluZXMgb3ZlciA5MCBjaGFyYWN0ZXJzCjVkODU0OWMgYXVkaW86IGZvbyogYmFyIiBz
aG91bGQgYmUgImZvbyAqYmFyIi4KZDFmZjgyYyBhdWRpbzogQWRkIHNwYWNlcyBhcm91bmQgb3Bl
cmF0b3IvZGVsZXRlIHJlZHVuZGFudCBzcGFjZXMKZmQxNWZlMiBhdWRpbzogQWRkIGJyYWNlcyBm
b3Igc3RhdGVtZW50cy9maXggYnJhY2VzJyBwb3NpdGlvbgoKPT09IE9VVFBVVCBCRUdJTiA9PT0K
MS82IENoZWNraW5nIGNvbW1pdCBmZDE1ZmUyZDhjN2MgKGF1ZGlvOiBBZGQgYnJhY2VzIGZvciBz
dGF0ZW1lbnRzL2ZpeCBicmFjZXMnIHBvc2l0aW9uKQoyLzYgQ2hlY2tpbmcgY29tbWl0IGQxZmY4
MmMyNjY1YSAoYXVkaW86IEFkZCBzcGFjZXMgYXJvdW5kIG9wZXJhdG9yL2RlbGV0ZSByZWR1bmRh
bnQgc3BhY2VzKQpFUlJPUjogc3BhY2UgcHJvaGliaXRlZCBiZXR3ZWVuIGZ1bmN0aW9uIG5hbWUg
YW5kIG9wZW4gcGFyZW50aGVzaXMgJygnCiMyMzogRklMRTogYXVkaW8vYXVkaW9fdGVtcGxhdGUu
aDoyMTE6CisgICAgICAgIGdsdWUgKGF1ZGlvX3BjbV9od19mcmVlX3Jlc291cmNlc18gLCBUWVBF
KSAoaHcpOwoKdG90YWw6IDEgZXJyb3JzLCAwIHdhcm5pbmdzLCAzMiBsaW5lcyBjaGVja2VkCgpQ
YXRjaCAyLzYgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRo
ZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFp
bmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KCjMvNiBDaGVja2luZyBjb21taXQg
NWQ4NTQ5Y2RiNmI0IChhdWRpbzogZm9vKiBiYXIiIHNob3VsZCBiZSAiZm9vICpiYXIiLikKNC82
IENoZWNraW5nIGNvbW1pdCA1MWNkMWU3MzhhMWMgKGF1ZGlvOiBGaXggbGluZXMgb3ZlciA5MCBj
aGFyYWN0ZXJzKQo1LzYgQ2hlY2tpbmcgY29tbWl0IDhlZDA4NTM2OTkzZCAoYXVkaW86IERvbid0
IHVzZSAnIycgZmxhZyBvZiBwcmludGYgZm9ybWF0ICgnJSMnKSBpbikKNi82IENoZWNraW5nIGNv
bW1pdCA4ZjM1YTkyZTZhYTYgKGF1ZGlvOiBTdXNwZWN0IGNvZGUgaW5kZW50IGZvciBjb25kaXRp
b25hbCBzdGF0ZW1lbnRzKQo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQg
d2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hl
dy5vcmcvbG9ncy8yMDIxMDExNDA4MTA1OS4xOTYzMi0xLXpoYW5naGFuNjRAaHVhd2VpLmNvbS90
ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRv
bWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQg
eW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

