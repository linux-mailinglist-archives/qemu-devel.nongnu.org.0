Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88116144A7E
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jan 2020 04:35:32 +0100 (CET)
Received: from localhost ([::1]:36182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iu6nj-00016b-Jn
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 22:35:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49509)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1iu6n1-0000fi-1B
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 22:34:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1iu6mz-0004wf-GV
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 22:34:46 -0500
Resent-Date: Tue, 21 Jan 2020 22:34:46 -0500
Resent-Message-Id: <E1iu6mz-0004wf-GV@eggs.gnu.org>
Received: from sender4-of-o51.zoho.com ([136.143.188.51]:21174)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1iu6mz-0004vx-8W
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 22:34:45 -0500
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1579664076835568.023596618176;
 Tue, 21 Jan 2020 19:34:36 -0800 (PST)
In-Reply-To: <20200122023256.27556-1-richard.henderson@linaro.org>
Subject: Re: [PULL 00/11] target/hppa patch queue
Message-ID: <157966407584.8714.10235144275848665189@f6d1ed32ca6b>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: richard.henderson@linaro.org
Date: Tue, 21 Jan 2020 19:34:36 -0800 (PST)
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDEyMjAyMzI1Ni4yNzU1
Ni0xLXJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmcvCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2Vl
bXMgdG8gaGF2ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBm
b3IKbW9yZSBpbmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIwMDEyMjAy
MzI1Ni4yNzU1Ni0xLXJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmcKU3ViamVjdDogW1BVTEwg
MDAvMTFdIHRhcmdldC9ocHBhIHBhdGNoIHF1ZXVlCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09
CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0
IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlm
Zi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3Jh
bQouL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJ
UFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcx
MzM4NApmYXRhbDogZ2l0IGZldGNoX3BhY2s6IGV4cGVjdGVkIEFDSy9OQUssIGdvdCAnRVJSIHVw
bG9hZC1wYWNrOiBub3Qgb3VyIHJlZiAzYTdiNWE4MzFjMDM5OGU5M2QxMjBkY2M2NTRhY2VmYmI1
MDU2ZWUyJwpmYXRhbDogVGhlIHJlbW90ZSBlbmQgaHVuZyB1cCB1bmV4cGVjdGVkbHkKZXJyb3I6
IENvdWxkIG5vdCBmZXRjaCAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0
ClRyYWNlYmFjayAobW9zdCByZWNlbnQgY2FsbCBsYXN0KToKICBGaWxlICJwYXRjaGV3LXRlc3Rl
ci9zcmMvcGF0Y2hldy1jbGkiLCBsaW5lIDUyMSwgaW4gdGVzdF9vbmUKICAgIGdpdF9jbG9uZV9y
ZXBvKGNsb25lLCByWyJyZXBvIl0sIHJbImhlYWQiXSwgbG9nZiwgVHJ1ZSkKICBGaWxlICJwYXRj
aGV3LXRlc3Rlci9zcmMvcGF0Y2hldy1jbGkiLCBsaW5lIDQ4LCBpbiBnaXRfY2xvbmVfcmVwbwog
ICAgc3Rkb3V0PWxvZ2YsIHN0ZGVycj1sb2dmKQogIEZpbGUgIi9vcHQvcmgvcmgtcHl0aG9uMzYv
cm9vdC91c3IvbGliNjQvcHl0aG9uMy42L3N1YnByb2Nlc3MucHkiLCBsaW5lIDI5MSwgaW4gY2hl
Y2tfY2FsbAogICAgcmFpc2UgQ2FsbGVkUHJvY2Vzc0Vycm9yKHJldGNvZGUsIGNtZCkKc3VicHJv
Y2Vzcy5DYWxsZWRQcm9jZXNzRXJyb3I6IENvbW1hbmQgJ1snZ2l0JywgJ3JlbW90ZScsICdhZGQn
LCAnLWYnLCAnLS1taXJyb3I9ZmV0Y2gnLCAnM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRi
ZDg4ODcxMzM4NCcsICdodHRwczovL2dpdGh1Yi5jb20vcGF0Y2hldy1wcm9qZWN0L3FlbXUnXScg
cmV0dXJuZWQgbm9uLXplcm8gZXhpdCBzdGF0dXMgMS4KCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWls
YWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIwMDEyMjAyMzI1Ni4yNzU1Ni0xLXJp
Y2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmcvdGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3Nh
Z2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczov
L3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZl
bEByZWRoYXQuY29t


