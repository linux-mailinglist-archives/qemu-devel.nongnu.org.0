Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D0F3A7236
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 00:49:44 +0200 (CEST)
Received: from localhost ([::1]:39714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsvOp-0007yp-NY
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 18:49:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lsvO0-0007KY-Mw
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 18:48:52 -0400
Resent-Date: Mon, 14 Jun 2021 18:48:52 -0400
Resent-Message-Id: <E1lsvO0-0007KY-Mw@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lsvNy-0004kg-8E
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 18:48:52 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1623710922; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=OfALuHCEbimtgfpmbRIArMe0Y/gLI9uCy7DhcnMWzE0Ed9F+VQlrE+oJ4+yUXo0UC0VItaGDDoQBVkhyVFGAx9eiRQy/Ae6iF/jhCVFnYC3VcFi2/aBGdpUyWGKnY2gJRY3WCxX3KVNTW1zGs+wkTE9qnFEeu4F843xnGCqxwJ4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1623710922;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=jNafHJ1DjbvDGIVtnvCTtjvNTxSteD0lDmujgmF3Pno=; 
 b=hUPAmZTaYc10Q0eXD0uV5C9IAa8Us2FrqtT5tyQAWfPn0vc+1Z6MCJv5Bi09wzP5tA/HqwwnTUBaFnqouNdg7llUxo3NZq/t5FIa8q4Cx2CYFZGfYZ7I+5RVDR6CY1tVUZeJdMdqi4jOi+Pda8HfWvbwZ1AgceccKT5LzbDrO+M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 162371092086354.57917207461435;
 Mon, 14 Jun 2021 15:48:40 -0700 (PDT)
In-Reply-To: <20210610224837.670192-1-vivek.kasireddy@intel.com>
Subject: Re: [PATCH v2 0/8] virtio-gpu: Add a default synchronization
 mechanism for blobs
Message-ID: <162371091974.2358.4682953714552544787@7c66fb7bc3ab>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: vivek.kasireddy@intel.com
Date: Mon, 14 Jun 2021 15:48:40 -0700 (PDT)
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
Cc: kraxel@redhat.com, tina.zhang@intel.com, vivek.kasireddy@intel.com,
 qemu-devel@nongnu.org, dongwon.kim@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDYxMDIyNDgzNy42NzAx
OTItMS12aXZlay5rYXNpcmVkZHlAaW50ZWwuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1z
IHRvIGhhdmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9y
Cm1vcmUgaW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMTA2MTAyMjQ4
MzcuNjcwMTkyLTEtdml2ZWsua2FzaXJlZGR5QGludGVsLmNvbQpTdWJqZWN0OiBbUEFUQ0ggdjIg
MC84XSB2aXJ0aW8tZ3B1OiBBZGQgYSBkZWZhdWx0IHN5bmNocm9uaXphdGlvbiBtZWNoYW5pc20g
Zm9yIGJsb2JzCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCmdpdCByZXYt
cGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYu
cmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNv
bmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQouL3NjcmlwdHMvY2hlY2twYXRj
aC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKVXBkYXRpbmcg
M2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApTd2l0Y2hlZCB0byBhIG5l
dyBicmFuY2ggJ3Rlc3QnCmQ3Y2EzNDUgdmlydGlvLWdwdTogQWRkIGdsX2ZsdXNoZWQgY2FsbGJh
Y2sKMmE3M2Q0NyB2aXJ0aW8tZ3B1OiBBZGQgZG1hYnVmIGhlbHBlcnMgZm9yIHN5bmNocm9uaXph
dGlvbgowZDFiZTQ2IHVpL2d0ay1lZ2w6IFdhaXQgZm9yIHRoZSBkcmF3IHNpZ25hbCBmb3IgZG1h
YnVmIGJsb2JzCjNmZDFiNTkgdWk6IENyZWF0ZSBzeW5jIG9iamVjdHMgb25seSBmb3IgYmxvYnMK
MTMwOTViOSB1aS9ndGs6IEltcGxlbWVudCB3YWl0X2RtYWJ1ZiBmdW5jdGlvbgplMmM3ZWM3IHVp
OiBBZGQgYSBoZWxwZXIgdG8gd2FpdCBvbiBhIGRtYWJ1ZiBzeW5jIG9iamVjdApmZmJmZDgyIHVp
L2VnbDogQWRkIGVnbCBoZWxwZXJzIHRvIGhlbHAgd2l0aCBzeW5jaHJvbml6YXRpb24KNDYxMmM2
YSB1aS9ndGs6IENyZWF0ZSBhIGNvbW1vbiByZWxlYXNlX2RtYWJ1ZiBoZWxwZXIKCj09PSBPVVRQ
VVQgQkVHSU4gPT09CjEvOCBDaGVja2luZyBjb21taXQgNDYxMmM2YThlMjgzICh1aS9ndGs6IENy
ZWF0ZSBhIGNvbW1vbiByZWxlYXNlX2RtYWJ1ZiBoZWxwZXIpCjIvOCBDaGVja2luZyBjb21taXQg
ZmZiZmQ4MjcyN2Q5ICh1aS9lZ2w6IEFkZCBlZ2wgaGVscGVycyB0byBoZWxwIHdpdGggc3luY2hy
b25pemF0aW9uKQpFUlJPUjogY29kZSBpbmRlbnQgc2hvdWxkIG5ldmVyIHVzZSB0YWJzCiM2Mzog
RklMRTogdWkvZWdsLWhlbHBlcnMuYzo4ODoKK15JXkleSV5JRUdMX1NZTkNfTkFUSVZFX0ZFTkNF
X0FORFJPSUQsIE5VTEwpOyQKCnRvdGFsOiAxIGVycm9ycywgMCB3YXJuaW5ncywgNjcgbGluZXMg
Y2hlY2tlZAoKUGF0Y2ggMi84IGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElm
IGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0
aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCgozLzggQ2hlY2tp
bmcgY29tbWl0IGUyYzdlYzc4MWIwYyAodWk6IEFkZCBhIGhlbHBlciB0byB3YWl0IG9uIGEgZG1h
YnVmIHN5bmMgb2JqZWN0KQo0LzggQ2hlY2tpbmcgY29tbWl0IDEzMDk1Yjk5NmYxYSAodWkvZ3Rr
OiBJbXBsZW1lbnQgd2FpdF9kbWFidWYgZnVuY3Rpb24pCjUvOCBDaGVja2luZyBjb21taXQgM2Zk
MWI1OTA3Y2JkICh1aTogQ3JlYXRlIHN5bmMgb2JqZWN0cyBvbmx5IGZvciBibG9icykKNi84IENo
ZWNraW5nIGNvbW1pdCAwZDFiZTQ2NzllNmYgKHVpL2d0ay1lZ2w6IFdhaXQgZm9yIHRoZSBkcmF3
IHNpZ25hbCBmb3IgZG1hYnVmIGJsb2JzKQo3LzggQ2hlY2tpbmcgY29tbWl0IDJhNzNkNDdmMjQ1
OCAodmlydGlvLWdwdTogQWRkIGRtYWJ1ZiBoZWxwZXJzIGZvciBzeW5jaHJvbml6YXRpb24pCjgv
OCBDaGVja2luZyBjb21taXQgZDdjYTM0NWM2Y2U4ICh2aXJ0aW8tZ3B1OiBBZGQgZ2xfZmx1c2hl
ZCBjYWxsYmFjaykKPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGgg
Y29kZTogMQoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3Jn
L2xvZ3MvMjAyMTA2MTAyMjQ4MzcuNjcwMTkyLTEtdml2ZWsua2FzaXJlZGR5QGludGVsLmNvbS90
ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRv
bWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQg
eW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

