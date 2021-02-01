Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1717130AC90
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 17:29:38 +0100 (CET)
Received: from localhost ([::1]:43640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6c52-0005Jp-5N
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 11:29:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1l6c3X-000445-A0
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 11:28:04 -0500
Resent-Date: Mon, 01 Feb 2021 11:28:03 -0500
Resent-Message-Id: <E1l6c3X-000445-A0@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1l6c3U-0000Vu-3t
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 11:28:03 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1612196867; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Hq1eqXMZ1Pz18p+r3mLy/GPjvDN6ahqF33j3Ufp6ZBsSY/roYnxPKSmiyIcgkdLEsoNWGvI5YO8K96YbWDUAWgxDab5lJ+T1biexYjbx3huc17kLE++GejFi1+k6ZIp7P4z7UOEQAPGgvTO89x5YPgmBniyX1swYf2NM6Rm5ZAI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1612196867;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=NXujyrgReoJd3wN/YcrxDTmxqfEaSnqsGCtH29G0bZ4=; 
 b=EOZFgk929agmPNU2Y+AkQ7vYiNdhREPA8NIdFXPbTDloEpzRIiBozRNVK6YLmMBzov1FlPXFhLV+b7hYn6YzxMQFDa5xaWY0RLYLleSbofZe2+eg6U3CId5TogAZRcPnb4t5W/fGEB18mQMFMONz1x877rveaOnvuHrN23m6p1U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 161219686529723.622005027802857;
 Mon, 1 Feb 2021 08:27:45 -0800 (PST)
In-Reply-To: <20210201161504.1976989-1-armbru@redhat.com>
Subject: Re: [PATCH 0/3] Maximize QMP availability for OOB commands
Message-ID: <161219686405.10459.15588093804265181941@c667a6b167f6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: armbru@redhat.com
Date: Mon, 1 Feb 2021 08:27:45 -0800 (PST)
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
Cc: kwolf@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDIwMTE2MTUwNC4xOTc2
OTg5LTEtYXJtYnJ1QHJlZGhhdC5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2
ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBp
bmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIxMDIwMTE2MTUwNC4xOTc2
OTg5LTEtYXJtYnJ1QHJlZGhhdC5jb20KU3ViamVjdDogW1BBVENIIDAvM10gTWF4aW1pemUgUU1Q
IGF2YWlsYWJpbGl0eSBmb3IgT09CIGNvbW1hbmRzCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09
CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0
IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlm
Zi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3Jh
bQouL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJ
UFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcx
MzM4NApGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdQogLSBbdGFn
IHVwZGF0ZV0gICAgICBwYXRjaGV3LzIwMjEwMjAxMTYxMDI0LjEyNzkyMS0xLWt3b2xmQHJlZGhh
dC5jb20gLT4gcGF0Y2hldy8yMDIxMDIwMTE2MTAyNC4xMjc5MjEtMS1rd29sZkByZWRoYXQuY29t
CiAqIFtuZXcgdGFnXSAgICAgICAgIHBhdGNoZXcvMjAyMTAyMDExNjE1MDQuMTk3Njk4OS0xLWFy
bWJydUByZWRoYXQuY29tIC0+IHBhdGNoZXcvMjAyMTAyMDExNjE1MDQuMTk3Njk4OS0xLWFybWJy
dUByZWRoYXQuY29tClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKZmFkZmIwNCBxbXA6
IFJlc3VtZSBPT0ItZW5hYmxlZCBtb25pdG9yIGJlZm9yZSBwcm9jZXNzaW5nIHRoZSByZXF1ZXN0
CjFhZDhmMDQgcW1wOiBBZGQgbW9yZSB0cmFjZXBvaW50cwplZTZkZjhmIHFtcDogRml4IHVwIGNv
bW1lbnRzIGFmdGVyIGNvbW1pdCA5Y2U0NGUyY2UyCgo9PT0gT1VUUFVUIEJFR0lOID09PQoxLzMg
Q2hlY2tpbmcgY29tbWl0IGVlNmRmOGYzNmFlZSAocW1wOiBGaXggdXAgY29tbWVudHMgYWZ0ZXIg
Y29tbWl0IDljZTQ0ZTJjZTIpCjIvMyBDaGVja2luZyBjb21taXQgMWFkOGYwNGYxNWZlIChxbXA6
IEFkZCBtb3JlIHRyYWNlcG9pbnRzKQozLzMgQ2hlY2tpbmcgY29tbWl0IGZhZGZiMDQwNTMwOCAo
cW1wOiBSZXN1bWUgT09CLWVuYWJsZWQgbW9uaXRvciBiZWZvcmUgcHJvY2Vzc2luZyB0aGUgcmVx
dWVzdCkKRVJST1I6IHRyYWlsaW5nIHdoaXRlc3BhY2UKIzYxOiBGSUxFOiBtb25pdG9yL3FtcC5j
OjI4OToKKyAgICAgICAgICogICAgUmVzdW1lIG9ubHkgYWZ0ZXIgd2UncmUgZG9uZSBwcm9jZXNz
aW5nIHRoZSByZXF1ZXN0LCAkCgp0b3RhbDogMSBlcnJvcnMsIDAgd2FybmluZ3MsIDU1IGxpbmVz
IGNoZWNrZWQKClBhdGNoIDMvMyBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJ
ZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8g
dGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgoKPT09IE9VVFBV
VCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKClRoZSBmdWxsIGxv
ZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAyMTAyMDExNjE1MDQu
MTk3Njk4OS0xLWFybWJydUByZWRoYXQuY29tL3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlwZT1tZXNz
YWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6
Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2
ZWxAcmVkaGF0LmNvbQ==

