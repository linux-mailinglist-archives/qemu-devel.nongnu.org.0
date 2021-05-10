Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0946C378C88
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 15:02:51 +0200 (CEST)
Received: from localhost ([::1]:43832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg5Yg-0004Tl-5h
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 09:02:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lg5XE-0003nK-3f
 for qemu-devel@nongnu.org; Mon, 10 May 2021 09:01:21 -0400
Resent-Date: Mon, 10 May 2021 09:01:20 -0400
Resent-Message-Id: <E1lg5XE-0003nK-3f@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lg5X5-0006WT-6k
 for qemu-devel@nongnu.org; Mon, 10 May 2021 09:01:19 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1620651662; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=EZIauKstTIib0r22SFSwkLyYwa0QWqgxF5QtvRCcCLcO8HDwegQ3g/B4DpCHAOqRhu+Tvf/avvaUYf9X6ObpMQd743y0vQpdXFh3taWVJxGfYvvJR0wuzBZj9RdJaqlX4u5j5zTTJo/bwCyOtj7Ys+ZGAvJcfoglzIjknGdzI7M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1620651662;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=xprXIP/3TWzVI3g1EFwwEc1PtIeJJNhKpp3vh6g1vGo=; 
 b=IW0zkUY45ueETt6wljI8NkP1MKzpz1gGhC8sm5AGkMVprdaKVAFnuOdGvV3mgM9k0wequGTT+y02F5BdsdcGIvrySPk77o9RYQQToRFdHBUoU+1ZJ1A+iuNaATFDC+ApX9PpxdZ9oJ0OSgDrr7xohASKK9KBsPasP0fIpsTamnQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1620651645342827.2977443796274;
 Mon, 10 May 2021 06:00:45 -0700 (PDT)
In-Reply-To: <20210510125340.903323-1-anthony.perard@citrix.com>
Subject: Re: [PULL 0/3] xen queue 2021-05-10
Message-ID: <162065164405.20601.12371180670224947865@d887ba82c771>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: qemu-devel@nongnu.org
Date: Mon, 10 May 2021 06:00:45 -0700 (PDT)
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
Cc: anthony.perard@citrix.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDUxMDEyNTM0MC45MDMz
MjMtMS1hbnRob255LnBlcmFyZEBjaXRyaXguY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1z
IHRvIGhhdmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9y
Cm1vcmUgaW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMTA1MTAxMjUz
NDAuOTAzMzIzLTEtYW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbQpTdWJqZWN0OiBbUFVMTCAwLzNd
IHhlbiBxdWV1ZSAyMDIxLTA1LTEwCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9i
YXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNvbmZpZyAt
LWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVz
IFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQouL3Njcmlw
dHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQgRU5EID09
PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApGcm9t
IGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdQogKiBbbmV3IHRhZ10gICAg
ICAgICBwYXRjaGV3LzIwMjEwNTEwMTI1MzQwLjkwMzMyMy0xLWFudGhvbnkucGVyYXJkQGNpdHJp
eC5jb20gLT4gcGF0Y2hldy8yMDIxMDUxMDEyNTM0MC45MDMzMjMtMS1hbnRob255LnBlcmFyZEBj
aXRyaXguY29tClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKNDNmNjdmYSB4ZW4tYmxv
Y2s6IFVzZSBzcGVjaWZpYyBibG9ja2RldiBkcml2ZXIKYmY2Yjk5MiB4ZW46IEZyZWUgeGVuZm9y
ZWlnbm1lbW9yeV9yZXNvdXJjZSBhdCBleGl0CjE3M2NjOTUgeGVuLW1hcGNhY2hlOiBhdm9pZCBh
IHJhY2Ugb24gbWVtb3J5IG1hcCB3aGlsZSB1c2luZyBNQVBfRklYRUQKCj09PSBPVVRQVVQgQkVH
SU4gPT09CjEvMyBDaGVja2luZyBjb21taXQgMTczY2M5NTk4OWU2ICh4ZW4tbWFwY2FjaGU6IGF2
b2lkIGEgcmFjZSBvbiBtZW1vcnkgbWFwIHdoaWxlIHVzaW5nIE1BUF9GSVhFRCkKMi8zIENoZWNr
aW5nIGNvbW1pdCBiZjZiOTkyMWFmMjcgKHhlbjogRnJlZSB4ZW5mb3JlaWdubWVtb3J5X3Jlc291
cmNlIGF0IGV4aXQpCkVSUk9SOiBBdXRob3IgZW1haWwgYWRkcmVzcyBpcyBtYW5nbGVkIGJ5IHRo
ZSBtYWlsaW5nIGxpc3QKIzI6IApBdXRob3I6IEFudGhvbnkgUEVSQVJEIHZpYSA8cWVtdS1kZXZl
bEBub25nbnUub3JnPgoKdG90YWw6IDEgZXJyb3JzLCAwIHdhcm5pbmdzLCA0OSBsaW5lcyBjaGVj
a2VkCgpQYXRjaCAyLzMgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55
IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBt
YWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KCjMvMyBDaGVja2luZyBj
b21taXQgNDNmNjdmYTYyNjZkICh4ZW4tYmxvY2s6IFVzZSBzcGVjaWZpYyBibG9ja2RldiBkcml2
ZXIpCkVSUk9SOiBBdXRob3IgZW1haWwgYWRkcmVzcyBpcyBtYW5nbGVkIGJ5IHRoZSBtYWlsaW5n
IGxpc3QKIzI6IApBdXRob3I6IEFudGhvbnkgUEVSQVJEIHZpYSA8cWVtdS1kZXZlbEBub25nbnUu
b3JnPgoKdG90YWw6IDEgZXJyb3JzLCAwIHdhcm5pbmdzLCAyNiBsaW5lcyBjaGVja2VkCgpQYXRj
aCAzLzMgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNl
IGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVy
LCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KCj09PSBPVVRQVVQgRU5EID09PQoKVGVz
dCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxl
IGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMjEwNTEwMTI1MzQwLjkwMzMyMy0xLWFudGhv
bnkucGVyYXJkQGNpdHJpeC5jb20vdGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0t
LQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNo
ZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRo
YXQuY29t

