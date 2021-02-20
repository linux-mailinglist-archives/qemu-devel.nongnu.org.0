Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AABE320594
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 14:47:48 +0100 (CET)
Received: from localhost ([::1]:35800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDSbr-0003l8-Nw
	for lists+qemu-devel@lfdr.de; Sat, 20 Feb 2021 08:47:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lDSaC-0002Mb-Jf
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 08:46:05 -0500
Resent-Date: Sat, 20 Feb 2021 08:46:04 -0500
Resent-Message-Id: <E1lDSaC-0002Mb-Jf@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lDSa6-0000WN-UV
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 08:46:04 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1613828748; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=GAxQVSKtoGpUzQJtO4cAuDHU7JhO5v1YSxzuEpSb0ij9tTCYj/9sX+tdaAFEe9IaHzW9bHqnMw+8YrTvSKMT5mpK3uDvTGuTx4R1l0kxykODnNYb9TguKdwSTkZAeLL4U1ECM7lcaKcsDWr7cvGH9bQmq5lD5q00p50lmSryvZc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1613828748;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=uamAaI0yPgYgSCbUBd18n+1XViDrnvfZeVZyWPKlaQU=; 
 b=UfesLzni9TqA4t5oF2HA5KspMTDKOq4sIKZ7QzWE+iEeTozx6N5auk2dwlHq4Op6nQ8xMqUtIi69tFqY4t/7rVmNEXJwnOubLGAKhIxRnbiFbgmNME/Py/XnGzc4Hxiqd9FRJ+cJf7MXc7Xo19/uYtv9SBhNvSLa91OE7abwhJI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1613828745185412.5752742722857;
 Sat, 20 Feb 2021 05:45:45 -0800 (PST)
In-Reply-To: <161382791482.29356.5013965818751172438.malone@soybean.canonical.com>
Subject: Re: [Bug 1916112] Re: Illegal instruction crash of QEMU on Jetson Nano
Message-ID: <161382874416.17078.4255579929581202234@c667a6b167f6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: 1916112@bugs.launchpad.net
Date: Sat, 20 Feb 2021 05:45:45 -0800 (PST)
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8xNjEzODI3OTE0ODIuMjkzNTYu
NTAxMzk2NTgxODc1MTE3MjQzOC5tYWxvbmVAc295YmVhbi5jYW5vbmljYWwuY29tLwoKCgpIaSwK
ClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhhdmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNl
ZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUgaW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2Fn
ZS1pZDogMTYxMzgyNzkxNDgyLjI5MzU2LjUwMTM5NjU4MTg3NTExNzI0MzgubWFsb25lQHNveWJl
YW4uY2Fub25pY2FsLmNvbQpTdWJqZWN0OiBbQnVnIDE5MTYxMTJdIFJlOiBJbGxlZ2FsIGluc3Ry
dWN0aW9uIGNyYXNoIG9mIFFFTVUgb24gSmV0c29uIE5hbm8KCj09PSBURVNUIFNDUklQVCBCRUdJ
TiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQg
MApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2Nh
bCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlz
dG9ncmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNU
IFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJk
ODg4NzEzMzg0CkZyb20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiAq
IFtuZXcgdGFnXSAgICAgICAgIHBhdGNoZXcvMTYxMzgyNzkxNDgyLjI5MzU2LjUwMTM5NjU4MTg3
NTExNzI0MzgubWFsb25lQHNveWJlYW4uY2Fub25pY2FsLmNvbSAtPiBwYXRjaGV3LzE2MTM4Mjc5
MTQ4Mi4yOTM1Ni41MDEzOTY1ODE4NzUxMTcyNDM4Lm1hbG9uZUBzb3liZWFuLmNhbm9uaWNhbC5j
b20KU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0JwoxNTA3YzJhIElsbGVnYWwgaW5zdHJ1
Y3Rpb24gY3Jhc2ggb2YgUUVNVSBvbiBKZXRzb24gTmFubwoKPT09IE9VVFBVVCBCRUdJTiA9PT0K
RVJST1I6IE1pc3NpbmcgU2lnbmVkLW9mZi1ieTogbGluZShzKQoKdG90YWw6IDEgZXJyb3JzLCAw
IHdhcm5pbmdzLCAxMCBsaW5lcyBjaGVja2VkCgpDb21taXQgMTUwN2MyYWMwNzcyIChJbGxlZ2Fs
IGluc3RydWN0aW9uIGNyYXNoIG9mIFFFTVUgb24gSmV0c29uIE5hbm8pIGhhcyBzdHlsZSBwcm9i
bGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBv
c2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4g
TUFJTlRBSU5FUlMuCj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRo
IGNvZGU6IDEKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9y
Zy9sb2dzLzE2MTM4Mjc5MTQ4Mi4yOTM1Ni41MDEzOTY1ODE4NzUxMTcyNDM4Lm1hbG9uZUBzb3li
ZWFuLmNhbm9uaWNhbC5jb20vdGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpF
bWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcu
b3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQu
Y29t

