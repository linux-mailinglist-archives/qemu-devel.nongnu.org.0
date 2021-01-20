Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 971462FCBEE
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 08:47:08 +0100 (CET)
Received: from localhost ([::1]:53272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l28Cp-0005UB-Mo
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 02:47:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1l28Bi-0004zh-NK
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 02:45:58 -0500
Resent-Date: Wed, 20 Jan 2021 02:45:58 -0500
Resent-Message-Id: <E1l28Bi-0004zh-NK@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1l28Bf-0002ED-F3
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 02:45:58 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1611128746; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=CNFalVMvM4eKETY1N+VvLPEg3jnXh1KXrVshuVpZeBpYcTNXngALAihKMGCynFYhpb9YGf0M6ON9jtlMUifIWQX4/jthLN/s9LyI6ux+JeDg1riwcvzFt3U6XpN6+mh1mXSZ9elVdS19JrZam0CT+9vhtZ8MhhisPmoTJf9qUv8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1611128746;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=yVLGW8DDEtgd6r+aQ+PIY/68V617JjRfv7NUE+RE7AQ=; 
 b=K2kOspmudZk1z40Wd1NcZ9ZNLdWTJUBT71wE3Cv2BcQRvz9/rwse0FDkvwrpRSByfkQsOZ0PbsocRRSbqWEBkgWzyPNVu5NUAFBlFQjR9F86LZShKjb0Un/wifQ7HKAjjsGo40NijePHAD/MUu+atHxV6rFrrVt87lLGIMup3k8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1611128743993688.9439067942959;
 Tue, 19 Jan 2021 23:45:43 -0800 (PST)
In-Reply-To: <20210120074102.51534-1-marcandre.lureau@redhat.com>
Subject: Re: [PATCH v2] RFC: sphinx: adopt kernel readthedoc theme
Message-ID: <161112874243.30182.14775788977564880771@73fb1a5943b8>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: marcandre.lureau@redhat.com
Date: Tue, 19 Jan 2021 23:45:43 -0800 (PST)
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
Cc: peter.maydell@linaro.org, berrange@redhat.com, qemu-devel@nongnu.org,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, bmeng.cn@gmail.com,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDEyMDA3NDEwMi41MTUz
NC0xLW1hcmNhbmRyZS5sdXJlYXVAcmVkaGF0LmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVt
cyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZv
cgptb3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjEwMTIwMDc0
MTAyLjUxNTM0LTEtbWFyY2FuZHJlLmx1cmVhdUByZWRoYXQuY29tClN1YmplY3Q6IFtQQVRDSCB2
Ml0gUkZDOiBzcGhpbng6IGFkb3B0IGtlcm5lbCByZWFkdGhlZG9jIHRoZW1lCgo9PT0gVEVTVCBT
Q1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVs
bCB8fCBleGl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29u
ZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxn
b3JpdGhtIGhpc3RvZ3JhbQouL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2Uu
Lgo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRk
MWRlZjdmNDRiZDg4ODcxMzM4NApGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2pl
Y3QvcWVtdQogKiBbbmV3IHRhZ10gICAgICAgICBwYXRjaGV3LzIwMjEwMTIwMDc0MTAyLjUxNTM0
LTEtbWFyY2FuZHJlLmx1cmVhdUByZWRoYXQuY29tIC0+IHBhdGNoZXcvMjAyMTAxMjAwNzQxMDIu
NTE1MzQtMS1tYXJjYW5kcmUubHVyZWF1QHJlZGhhdC5jb20KU3dpdGNoZWQgdG8gYSBuZXcgYnJh
bmNoICd0ZXN0JwoyOTEyOGM4IFJGQzogc3BoaW54OiBhZG9wdCBrZXJuZWwgcmVhZHRoZWRvYyB0
aGVtZQoKPT09IE9VVFBVVCBCRUdJTiA9PT0KV0FSTklORzogYWRkZWQsIG1vdmVkIG9yIGRlbGV0
ZWQgZmlsZShzKSwgZG9lcyBNQUlOVEFJTkVSUyBuZWVkIHVwZGF0aW5nPwojMzc6IApkZWxldGVk
IGZpbGUgbW9kZSAxMDA2NDQKCkVSUk9SOiBsaW5lIG92ZXIgOTAgY2hhcmFjdGVycwojNjA6IEZJ
TEU6IGRvY3MvY29uZi5weToxNTc6CisgICAgc3lzLnN0ZGVyci53cml0ZSgnV2FybmluZzogVGhl
IFNwaGlueCBcJ3NwaGlueF9ydGRfdGhlbWVcJyBIVE1MIHRoZW1lIHdhcyBub3QgZm91bmQuIE1h
a2Ugc3VyZSB5b3UgaGF2ZSB0aGUgdGhlbWUgaW5zdGFsbGVkIHRvIHByb2R1Y2UgcHJldHR5IEhU
TUwgb3V0cHV0LiBGYWxsaW5nIGJhY2sgdG8gdGhlIGRlZmF1bHQgdGhlbWUuXG4nKQoKRVJST1I6
IHRyYWlsaW5nIHdoaXRlc3BhY2UKIzkxOiBGSUxFOiBkb2NzL2NvbmYucHk6MTgxOgorICAgICJn
aXRsYWJfdXNlciI6ICJxZW11LXByb2plY3QiLCAkCgp0b3RhbDogMiBlcnJvcnMsIDEgd2Fybmlu
Z3MsIDIxOSBsaW5lcyBjaGVja2VkCgpDb21taXQgMjkxMjhjODVlYTU3IChSRkM6IHNwaGlueDog
YWRvcHQga2VybmVsIHJlYWR0aGVkb2MgdGhlbWUpIGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNl
IHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBv
cnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMu
Cj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgpU
aGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMjEw
MTIwMDc0MTAyLjUxNTM0LTEtbWFyY2FuZHJlLmx1cmVhdUByZWRoYXQuY29tL3Rlc3RpbmcuY2hl
Y2twYXRjaC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkg
YnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRi
YWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

