Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B44E3261EA
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 12:23:32 +0100 (CET)
Received: from localhost ([::1]:44394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFbDX-0006DK-9U
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 06:23:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lFbCP-0005n5-2e
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 06:22:22 -0500
Resent-Date: Fri, 26 Feb 2021 06:22:21 -0500
Resent-Message-Id: <E1lFbCP-0005n5-2e@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lFbCH-0005Lh-3u
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 06:22:20 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1614338510; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=J7gWpmAIoeNM7Fg2XsgZrEbpMi5Ccd68ZrN0ct1v9PomUWvPIQkI6ibxKJOFg8h0kzP185tn3sLQr1Pqxz6z9DkelTdx4UJPENh5jfIQgBNUf5RiH5bMz5njyQ3NAXoqOzFsu9tLt+M0Bvcl7tzhjXc6hfUVyzF3lW1UeWHbhkE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1614338510;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=NBR2VpYWFHkcWPTQC3bm1H9SMW/QK+kQN0PC+AmMCMA=; 
 b=mZyUZvuOzpRAqbUUJZX37cKxGkiXhoJCyXPcRc2EbgfU5qR0hYkSyHcMZRumOemdlJF7qBIhbfOv8QZlGQQPTN7amPBDqnuYHdl4yKd0hK84+OTUIeZZ8i2Ukcw2j4rHec7cN5/nHKRsTiQqpk/oyMtUZE3M+ej3gDHycgSjJ/0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1614338508494577.3059995558318;
 Fri, 26 Feb 2021 03:21:48 -0800 (PST)
In-Reply-To: <20210226111619.21178-1-alex.bennee@linaro.org>
Subject: Re: [VHOST USER SPEC PATCH] vhost-user.rst: add clarifying language
 about protocol negotiation
Message-ID: <161433850648.15109.10656343115567123539@c667a6b167f6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: alex.bennee@linaro.org
Date: Fri, 26 Feb 2021 03:21:48 -0800 (PST)
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
Cc: virtio-dev@lists.oasis-open.org, mst@redhat.com, viresh.kumar@linaro.org,
 qemu-devel@nongnu.org, rust-vmm@lists.opendev.org, gerry@linux.alibaba.com,
 alex.bennee@linaro.org, stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDIyNjExMTYxOS4yMTE3
OC0xLWFsZXguYmVubmVlQGxpbmFyby5vcmcvCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8g
aGF2ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9y
ZSBpbmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIxMDIyNjExMTYxOS4y
MTE3OC0xLWFsZXguYmVubmVlQGxpbmFyby5vcmcKU3ViamVjdDogW1ZIT1NUIFVTRVIgU1BFQyBQ
QVRDSF0gdmhvc3QtdXNlci5yc3Q6IGFkZCBjbGFyaWZ5aW5nIGxhbmd1YWdlIGFib3V0IHByb3Rv
Y29sIG5lZ290aWF0aW9uCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCmdp
dCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNvbmZpZyAtLWxvY2Fs
IGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUK
Z2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQouL3NjcmlwdHMvY2hl
Y2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKVXBk
YXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApGcm9tIGh0dHBz
Oi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdQogKiBbbmV3IHRhZ10gICAgICAgICBw
YXRjaGV3LzIwMjEwMjI2MTExNjE5LjIxMTc4LTEtYWxleC5iZW5uZWVAbGluYXJvLm9yZyAtPiBw
YXRjaGV3LzIwMjEwMjI2MTExNjE5LjIxMTc4LTEtYWxleC5iZW5uZWVAbGluYXJvLm9yZwpTd2l0
Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCjkzYmExY2Ugdmhvc3QtdXNlci5yc3Q6IGFkZCBj
bGFyaWZ5aW5nIGxhbmd1YWdlIGFib3V0IHByb3RvY29sIG5lZ290aWF0aW9uCgo9PT0gT1VUUFVU
IEJFR0lOID09PQpFUlJPUjogdHJhaWxpbmcgd2hpdGVzcGFjZQojNDg6IEZJTEU6IGRvY3MvaW50
ZXJvcC92aG9zdC11c2VyLnJzdDozMTk6CisgICQKCnRvdGFsOiAxIGVycm9ycywgMCB3YXJuaW5n
cywgMjQgbGluZXMgY2hlY2tlZAoKQ29tbWl0IDkzYmExY2UwZmIyYSAodmhvc3QtdXNlci5yc3Q6
IGFkZCBjbGFyaWZ5aW5nIGxhbmd1YWdlIGFib3V0IHByb3RvY29sIG5lZ290aWF0aW9uKSBoYXMg
c3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFy
ZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVD
S1BBVENIIGluIE1BSU5UQUlORVJTLgo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBl
eGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8v
cGF0Y2hldy5vcmcvbG9ncy8yMDIxMDIyNjExMTYxOS4yMTE3OC0xLWFsZXguYmVubmVlQGxpbmFy
by5vcmcvdGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0
ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFz
ZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

