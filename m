Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C9731CB67
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 14:48:12 +0100 (CET)
Received: from localhost ([::1]:43742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC0i3-0003lg-Cq
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 08:48:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lC0gi-0002wU-4Q
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 08:46:48 -0500
Resent-Date: Tue, 16 Feb 2021 08:46:48 -0500
Resent-Message-Id: <E1lC0gi-0002wU-4Q@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lC0ga-0003zb-T3
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 08:46:47 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1613483188; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=aRc17vA0T8dr6flYfDqP2ZWlihexE17PUdrBz0842iBdZ/J3+1YZNxdPfXeGOQi+tO1i08EnUTCipJvZIR8S6u47vkZD/Cjr0hz8HkulGL/8D3tBWcpUl8VbXZW9JRNSOF8aH8QarkkrDo9sJr33GyjM+HLwuaMiPdD4wLGo5p8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1613483188;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=Gb2KwfAOKRfQUxQ9DAPtDizv/p6YH+wxwyYQ1yx0xiA=; 
 b=QYOrEIiifFL5Nw4u5M8Hs+W5IciD8NpP+ZiYZILfuVJpCnmb2Ny2tpfa4SxJ4vOD5Cmc5wb8Hl9G3bigrMXBtQsJ9lI024NdZkPrpyFzQqZp5kPXLKNWpnshKXyuRidSCNNxsQLTjmTxyqe8su/RqRvyTIYKTwbzkFpVQy1cX8U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1613483182997133.59786879857415;
 Tue, 16 Feb 2021 05:46:22 -0800 (PST)
In-Reply-To: <20210216133837.2347190-1-marcandre.lureau@redhat.com>
Subject: Re: [PATCH] qga: return a more explicit error on why a command is
 disabled
Message-ID: <161348318194.372.15789384963096435721@c667a6b167f6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: marcandre.lureau@redhat.com
Date: Tue, 16 Feb 2021 05:46:22 -0800 (PST)
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
Cc: michael.roth@amd.com, pkrempa@redhat.com, qemu-devel@nongnu.org,
 marcandre.lureau@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDIxNjEzMzgzNy4yMzQ3
MTkwLTEtbWFyY2FuZHJlLmx1cmVhdUByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNl
ZW1zIHRvIGhhdmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cg
Zm9yCm1vcmUgaW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMTAyMTYx
MzM4MzcuMjM0NzE5MC0xLW1hcmNhbmRyZS5sdXJlYXVAcmVkaGF0LmNvbQpTdWJqZWN0OiBbUEFU
Q0hdIHFnYTogcmV0dXJuIGEgbW9yZSBleHBsaWNpdCBlcnJvciBvbiB3aHkgYSBjb21tYW5kIGlz
IGRpc2FibGVkCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCmdpdCByZXYt
cGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYu
cmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNv
bmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQouL3NjcmlwdHMvY2hlY2twYXRj
aC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKVXBkYXRpbmcg
M2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApTd2l0Y2hlZCB0byBhIG5l
dyBicmFuY2ggJ3Rlc3QnCmE3NjIxNzkgcWdhOiByZXR1cm4gYSBtb3JlIGV4cGxpY2l0IGVycm9y
IG9uIHdoeSBhIGNvbW1hbmQgaXMgZGlzYWJsZWQKCj09PSBPVVRQVVQgQkVHSU4gPT09CldBUk5J
Tkc6IGxpbmUgb3ZlciA4MCBjaGFyYWN0ZXJzCiMzOTogRklMRTogaW5jbHVkZS9xYXBpL3FtcC9k
aXNwYXRjaC5oOjQ4Ogordm9pZCBxbXBfZGlzYWJsZV9jb21tYW5kKFFtcENvbW1hbmRMaXN0ICpj
bWRzLCBjb25zdCBjaGFyICpuYW1lLCBjb25zdCBjaGFyICplcnJfbXNnKTsKCldBUk5JTkc6IGxp
bmUgb3ZlciA4MCBjaGFyYWN0ZXJzCiM1MjogRklMRTogcWFwaS9xbXAtZGlzcGF0Y2guYzoxNjA6
CisgICAgICAgICAgICAgICAgICBjbWQtPmVycl9tc2cgPzogIlRoZSBjb21tYW5kICVzIGhhcyBi
ZWVuIGRpc2FibGVkIGZvciB0aGlzIGluc3RhbmNlIiwKCldBUk5JTkc6IGxpbmUgb3ZlciA4MCBj
aGFyYWN0ZXJzCiM3OTogRklMRTogcWFwaS9xbXAtcmVnaXN0cnkuYzo1OToKK3ZvaWQgcW1wX2Rp
c2FibGVfY29tbWFuZChRbXBDb21tYW5kTGlzdCAqY21kcywgY29uc3QgY2hhciAqbmFtZSwgY29u
c3QgY2hhciAqZXJyX21zZykKCkVSUk9SOiBsaW5lIG92ZXIgOTAgY2hhcmFjdGVycwojMTAxOiBG
SUxFOiBxZ2EvbWFpbi5jOjM3ODoKKyAgICAgICAgcW1wX2Rpc2FibGVfY29tbWFuZCgmZ2FfY29t
bWFuZHMsIG5hbWUsICJUaGUgY29tbWFuZCB3YXMgZGlzYWJsZWQgYWZ0ZXIgZnNmcmVlemUuIik7
Cgp0b3RhbDogMSBlcnJvcnMsIDMgd2FybmluZ3MsIDcwIGxpbmVzIGNoZWNrZWQKCkNvbW1pdCBh
NzYyMTc5M2M2ZDYgKHFnYTogcmV0dXJuIGEgbW9yZSBleHBsaWNpdCBlcnJvciBvbiB3aHkgYSBj
b21tYW5kIGlzIGRpc2FibGVkKSBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJ
ZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8g
dGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgo9PT0gT1VUUFVU
IEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9n
IGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIxMDIxNjEzMzgzNy4y
MzQ3MTkwLTEtbWFyY2FuZHJlLmx1cmVhdUByZWRoYXQuY29tL3Rlc3RpbmcuY2hlY2twYXRjaC8/
dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hl
dyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBh
dGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

