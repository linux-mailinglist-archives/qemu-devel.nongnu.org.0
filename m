Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBF733AAA5
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 06:04:19 +0100 (CET)
Received: from localhost ([::1]:34286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLfOs-0003jI-Nz
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 01:04:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lLfNe-0003Fd-1M
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 01:03:02 -0400
Resent-Date: Mon, 15 Mar 2021 01:03:02 -0400
Resent-Message-Id: <E1lLfNe-0003Fd-1M@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lLfNY-0000IH-Sx
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 01:03:01 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1615784564; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=OHKC9SXY+O3QVCWkT1YFOENIyB/L5EQi3tSNlhtA1VSxEHI/TuYYLcZ/sDYTtgx7RP2Uy8Buuw8T2+NXzM84j+Fr9j0Vytz3W0Uts9Fq8LNnHoDQGxMFY7yw97959hwnMQSkSBNaFfn3uqXfMthd2EfvCqwJF6sLUGrDI8xx+pg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1615784564;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=Jr8ZkH+vWOIBQAzACahE38fmKZX0ZK4q8Ye+Vg1yT7M=; 
 b=MOw0n8U/3QbJrStEe7/6iwYzPTGT5d9jRyxtZ96r7Ximidtok5/nzXaElDtaKzBpMCebNgAwNZPtjLdLNqxdYh2psitgwQu8yw5CV6bmaHJmjHi+x4kO3RqQtR5TxGIeZuqxBVKBs6dr9w/tYN7qE6XmHhyGZATupfWvKgEZypg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1615784561558694.2079385220821;
 Sun, 14 Mar 2021 22:02:41 -0700 (PDT)
In-Reply-To: <1615784115-26559-1-git-send-email-tsimpson@quicinc.com>
Subject: Re: [PATCH] Hexagon (target/hexagon) fix typo in comment
Message-ID: <161578456017.21225.17777756141807577300@c9d4d6fbb2f1>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: tsimpson@quicinc.com
Date: Sun, 14 Mar 2021 22:02:41 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: richard.henderson@linaro.org, tsimpson@quicinc.com, philmd@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8xNjE1Nzg0MTE1LTI2NTU5LTEt
Z2l0LXNlbmQtZW1haWwtdHNpbXBzb25AcXVpY2luYy5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMg
c2VlbXMgdG8gaGF2ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxv
dyBmb3IKbW9yZSBpbmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAxNjE1Nzg0
MTE1LTI2NTU5LTEtZ2l0LXNlbmQtZW1haWwtdHNpbXBzb25AcXVpY2luYy5jb20KU3ViamVjdDog
W1BBVENIXSBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgZml4IHR5cG8gaW4gY29tbWVudAoKPT09
IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAv
ZGV2L251bGwgfHwgZXhpdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAK
Z2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBk
aWZmLmFsZ29yaXRobSBoaXN0b2dyYW0KLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFj
ayBiYXNlLi4KPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClVwZGF0aW5nIDNjOGNmNWE5YzIxZmY4
NzgyMTY0ZDFkZWY3ZjQ0YmQ4ODg3MTMzODQKU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0
JwpmZmUwYjAxIEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBmaXggdHlwbyBpbiBjb21tZW50Cgo9
PT0gT1VUUFVUIEJFR0lOID09PQpFUlJPUjogTWlzc2luZyBTaWduZWQtb2ZmLWJ5OiBsaW5lKHMp
Cgp0b3RhbDogMSBlcnJvcnMsIDAgd2FybmluZ3MsIDggbGluZXMgY2hlY2tlZAoKQ29tbWl0IGZm
ZTBiMDEzMDU2ZiAoSGV4YWdvbiAodGFyZ2V0L2hleGFnb24pIGZpeCB0eXBvIGluIGNvbW1lbnQp
IGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJv
cnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2Vl
CkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21t
YW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0
dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzE2MTU3ODQxMTUtMjY1NTktMS1naXQtc2VuZC1lbWFpbC10
c2ltcHNvbkBxdWljaW5jLmNvbS90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0t
CkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hl
dy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhh
dC5jb20=

