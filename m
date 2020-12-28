Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 159FB2E34D2
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 08:48:40 +0100 (CET)
Received: from localhost ([::1]:52834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktnGh-0000oE-68
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 02:48:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1ktnEo-00083L-F0; Mon, 28 Dec 2020 02:46:43 -0500
Resent-Date: Mon, 28 Dec 2020 02:46:42 -0500
Resent-Message-Id: <E1ktnEo-00083L-F0@lists.gnu.org>
Received: from sender4-of-o55.zoho.com ([136.143.188.55]:21581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1ktnEl-0008Ja-5O; Mon, 28 Dec 2020 02:46:41 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1609141550; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=hTML4MOCQSmRP6a10MnEQjLlh2QCoy7oGwEmpfK+sVZDbNhvLxiqUE6kPvzL1kV3WVRa2BWrWMP9wIX3Qp5Htsw7no+KBG/pd+H8db4hYe8bQtagtYgawEbshESlhGnno5nvHC87rMFUodmFZ0iKtvK+G2MQL0MZTWH2hWdhj0o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1609141550;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=yyviRqO/AxzPA4qMMjgykC4zCcvCJyb1zyrOO0ml3/k=; 
 b=Ss2hL+2sYj8sVaprkDGRvEqvsOSa2xDYOXrru7IvlA2TogObnK4DnTuMfcdgdfLzW/7hwhI4x1AvSq8bBKWRVvslJ8THV1fKFN2+qtVlIzo1EljLmUamgbiLBf0qWAw350aPW58mGrMdoJNIhro1BYY4tkPdriKNvHDxCbIrluw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1609141543683617.4321460860792;
 Sun, 27 Dec 2020 23:45:43 -0800 (PST)
In-Reply-To: <20201228071129.24563-1-zhanghan64@huawei.com>
Subject: Re: [PATCH 0/4] Fix some style problems in qobject
Message-ID: <160914154293.10865.8756339184706011694@600e7e483b3a>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: zhanghan64@huawei.com
Date: Sun, 27 Dec 2020 23:45:43 -0800 (PST)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.55; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o55.zoho.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
 qemu-trivial@nongnu.org, armbru@redhat.com, qemu-devel@nongnu.org,
 alex.chen@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMTIyODA3MTEyOS4yNDU2
My0xLXpoYW5naGFuNjRAaHVhd2VpLmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBo
YXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3Jl
IGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjAxMjI4MDcxMTI5LjI0
NTYzLTEtemhhbmdoYW42NEBodWF3ZWkuY29tClN1YmplY3Q6IFtQQVRDSCAwLzRdIEZpeCBzb21l
IHN0eWxlIHByb2JsZW1zIGluIHFvYmplY3QKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEv
YmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQgMApnaXQgY29u
ZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJl
bmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFtCi4v
c2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNUIFNDUklQVCBF
TkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0
CkZyb20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiAtIFt0YWcgdXBk
YXRlXSAgICAgIHBhdGNoZXcvMjAyMDEyMTkxMDQyMjkuMTk2NC0xLW1hcmsuY2F2ZS1heWxhbmRA
aWxhbmRlLmNvLnVrIC0+IHBhdGNoZXcvMjAyMDEyMTkxMDQyMjkuMTk2NC0xLW1hcmsuY2F2ZS1h
eWxhbmRAaWxhbmRlLmNvLnVrCiAtIFt0YWcgdXBkYXRlXSAgICAgIHBhdGNoZXcvMjAyMDEyMjYx
MDMzNDcuODY4LTEtZ2FvamluaGFvQGh1YXdlaS5jb20gLT4gcGF0Y2hldy8yMDIwMTIyNjEwMzM0
Ny44NjgtMS1nYW9qaW5oYW9AaHVhd2VpLmNvbQogKiBbbmV3IHRhZ10gICAgICAgICBwYXRjaGV3
LzIwMjAxMjI4MDcxMTI5LjI0NTYzLTEtemhhbmdoYW42NEBodWF3ZWkuY29tIC0+IHBhdGNoZXcv
MjAyMDEyMjgwNzExMjkuMjQ1NjMtMS16aGFuZ2hhbjY0QGh1YXdlaS5jb20KU3dpdGNoZWQgdG8g
YSBuZXcgYnJhbmNoICd0ZXN0JwoxY2FhMGZkIHFvYmplY3Q6IGJyYWNlcyB7fSBhcmUgbmVjZXNz
YXJ5IGZvciBhbGwgYXJtcyBvZiB0aGlzIHN0YXRlbWVudApiMGNhMDdlIHFvYmplY3Q6IHNwYWNl
cyByZXF1aXJlZCBhcm91bmQgdGhhdCBvcGVyYXRvcnMKMGFkYWU2MCBxb2JqZWN0OiBjb2RlIGlu
ZGVudCBzaG91bGQgbmV2ZXIgdXNlIHRhYnMKNGVlYTk5MSBxb2JqZWN0OiBvcGVuIGJyYWNlICd7
JyBmb2xsb3dpbmcgc3RydWN0IGdvIG9uIHRoZSBzYW1lIGxpbmUKCj09PSBPVVRQVVQgQkVHSU4g
PT09CjEvNCBDaGVja2luZyBjb21taXQgNGVlYTk5MTkzNjFkIChxb2JqZWN0OiBvcGVuIGJyYWNl
ICd7JyBmb2xsb3dpbmcgc3RydWN0IGdvIG9uIHRoZSBzYW1lIGxpbmUpCjIvNCBDaGVja2luZyBj
b21taXQgMGFkYWU2MDc5YjIxIChxb2JqZWN0OiBjb2RlIGluZGVudCBzaG91bGQgbmV2ZXIgdXNl
IHRhYnMpCjMvNCBDaGVja2luZyBjb21taXQgYjBjYTA3ZTZjYWM2IChxb2JqZWN0OiBzcGFjZXMg
cmVxdWlyZWQgYXJvdW5kIHRoYXQgb3BlcmF0b3JzKQpFUlJPUjogYnJhY2VzIHt9IGFyZSBuZWNl
c3NhcnkgZm9yIGFsbCBhcm1zIG9mIHRoaXMgc3RhdGVtZW50CiMyMjogRklMRTogcW9iamVjdC9x
ZGljdC5jOjQ1OgorICAgIGZvciAodmFsdWUgPSAweDIzOEYxM0FGICogc3RybGVuKG5hbWUpLCBp
ID0gMDsgbmFtZVtpXTsgaSsrKQpbLi4uXQoKdG90YWw6IDEgZXJyb3JzLCAwIHdhcm5pbmdzLCAx
MCBsaW5lcyBjaGVja2VkCgpQYXRjaCAzLzQgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2
aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0
aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KCjQv
NCBDaGVja2luZyBjb21taXQgMWNhYTBmZGJjZGE5IChxb2JqZWN0OiBicmFjZXMge30gYXJlIG5l
Y2Vzc2FyeSBmb3IgYWxsIGFybXMgb2YgdGhpcyBzdGF0ZW1lbnQpCj09PSBPVVRQVVQgRU5EID09
PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgpUaGUgZnVsbCBsb2cgaXMgYXZh
aWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMjAxMjI4MDcxMTI5LjI0NTYzLTEt
emhhbmdoYW42NEBodWF3ZWkuY29tL3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlwZT1tZXNzYWdlLgot
LS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRj
aGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVk
aGF0LmNvbQ==

