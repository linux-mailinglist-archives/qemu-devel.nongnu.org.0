Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E03531F11C
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 21:37:07 +0100 (CET)
Received: from localhost ([::1]:55366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCq2s-00072s-JT
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 15:37:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lCpzw-0005Td-Op; Thu, 18 Feb 2021 15:34:04 -0500
Resent-Date: Thu, 18 Feb 2021 15:34:04 -0500
Resent-Message-Id: <E1lCpzw-0005Td-Op@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lCpzt-0000Pl-Km; Thu, 18 Feb 2021 15:34:04 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1613680430; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=OTGCLK1cfVGBDfGk3wHvC4pKSnZ7cEZxhkw9ip885ihKv3i6JWYAVzrLnPSDJTXimuUBHmQ1LPhCLkO8cuFxeGYdlunfsgxpOWncr4XoWa6U66WGJjXBUCwoB3pm8jeYaBR+/fUMZRSbwpNllO8YVGgAcazolPbyPkeE9IRVd4c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1613680430;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=CiyPDbsJbliS9ftb28FQwcMPyVFFMtOoyvYAGP3rKdA=; 
 b=VOyBnJta6ziHIQI4ef2C1uzi+qPstvNEkulOWyxB4KteoXbU6JdNXXJo+jmx8xKKp3YxeDzAtWW/PnSdC2FEGWDWfR/xc3kRYT7ncbrERzOnKyIeY0eFMQBF6JVoxrEPRze0N6wMhB+1F1FYrvnV2bjrKrbnf+/4Dt48+OdUfO8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1613680428584552.998122482764;
 Thu, 18 Feb 2021 12:33:48 -0800 (PST)
In-Reply-To: <20210218201528.127099-1-eblake@redhat.com>
Subject: Re: [PATCH 0/5] Obey NBD spec regarding block size bounds on reply
Message-ID: <161368042753.24083.12629784076159744291@c667a6b167f6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: eblake@redhat.com
Date: Thu, 18 Feb 2021 12:33:48 -0800 (PST)
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
Cc: vsementsov@virtuozzo.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDIxODIwMTUyOC4xMjcw
OTktMS1lYmxha2VAcmVkaGF0LmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZl
IHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGlu
Zm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjEwMjE4MjAxNTI4LjEyNzA5
OS0xLWVibGFrZUByZWRoYXQuY29tClN1YmplY3Q6IFtQQVRDSCAwLzVdIE9iZXkgTkJEIHNwZWMg
cmVnYXJkaW5nIGJsb2NrIHNpemUgYm91bmRzIG9uIHJlcGx5Cgo9PT0gVEVTVCBTQ1JJUFQgQkVH
SU4gPT09CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0
IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9j
YWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhp
c3RvZ3JhbQouL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVT
VCBTQ1JJUFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRi
ZDg4ODcxMzM4NApGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdQog
KiBbbmV3IHRhZ10gICAgICAgICBwYXRjaGV3LzIwMjEwMjE4MjAxNTI4LjEyNzA5OS0xLWVibGFr
ZUByZWRoYXQuY29tIC0+IHBhdGNoZXcvMjAyMTAyMTgyMDE1MjguMTI3MDk5LTEtZWJsYWtlQHJl
ZGhhdC5jb20KU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0Jwo3YmU2NDFmIGRvIG5vdCBh
cHBseTogUmV2ZXJ0ICJuYmQtY2xpZW50OiBXb3JrIGFyb3VuZCBzZXJ2ZXIgQkxPQ0tfU1RBVFVT
IG1pc2FsaWdubWVudCBhdCBFT0YiCjkzY2FmMmMgbmJkL3NlcnZlcjogQXZvaWQgdW5hbGlnbmVk
IGRpcnR5LWJpdG1hcCBzdGF0dXMKZjliMGI2NCBuYmQvc2VydmVyOiBBdm9pZCB1bmFsaWduZWQg
cmVhZC9ibG9ja19zdGF0dXMgZnJvbSBiYWNraW5nCmM5OTBlMWIgYmxvY2s6IEZpeCBCRFJWX0JM
T0NLX1JBVyBzdGF0dXMgdG8gaG9ub3IgYWxpZ25tZW50CjI0NzYxOWMgaW90ZXN0czogVXBkYXRl
IDI0MSB0byBleHBvc2UgYmFja2luZyBsYXllciBmcmFnbWVudGF0aW9uCgo9PT0gT1VUUFVUIEJF
R0lOID09PQoxLzUgQ2hlY2tpbmcgY29tbWl0IDI0NzYxOWNkNTVjYiAoaW90ZXN0czogVXBkYXRl
IDI0MSB0byBleHBvc2UgYmFja2luZyBsYXllciBmcmFnbWVudGF0aW9uKQoyLzUgQ2hlY2tpbmcg
Y29tbWl0IGM5OTBlMWJjODQ3YiAoYmxvY2s6IEZpeCBCRFJWX0JMT0NLX1JBVyBzdGF0dXMgdG8g
aG9ub3IgYWxpZ25tZW50KQozLzUgQ2hlY2tpbmcgY29tbWl0IGY5YjBiNjQ2MDAyZiAobmJkL3Nl
cnZlcjogQXZvaWQgdW5hbGlnbmVkIHJlYWQvYmxvY2tfc3RhdHVzIGZyb20gYmFja2luZykKNC81
IENoZWNraW5nIGNvbW1pdCA5M2NhZjJjNWQ1NDkgKG5iZC9zZXJ2ZXI6IEF2b2lkIHVuYWxpZ25l
ZCBkaXJ0eS1iaXRtYXAgc3RhdHVzKQo1LzUgQ2hlY2tpbmcgY29tbWl0IDdiZTY0MWZlYTc0OCAo
ZG8gbm90IGFwcGx5OiBSZXZlcnQgIm5iZC1jbGllbnQ6IFdvcmsgYXJvdW5kIHNlcnZlciBCTE9D
S19TVEFUVVMgbWlzYWxpZ25tZW50IGF0IEVPRiIpCkVSUk9SOiBNaXNzaW5nIFNpZ25lZC1vZmYt
Ynk6IGxpbmUocykKCnRvdGFsOiAxIGVycm9ycywgMCB3YXJuaW5ncywgNDEgbGluZXMgY2hlY2tl
ZAoKUGF0Y2ggNS81IGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBv
ZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFp
bnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCgo9PT0gT1VUUFVUIEVORCA9
PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2
YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIxMDIxODIwMTUyOC4xMjcwOTkt
MS1lYmxha2VAcmVkaGF0LmNvbS90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0t
CkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hl
dy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhh
dC5jb20=

