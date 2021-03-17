Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B1733F400
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 16:36:21 +0100 (CET)
Received: from localhost ([::1]:59510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMYDc-0004si-47
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 11:36:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lMXty-0005ch-4y
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:16:02 -0400
Resent-Date: Wed, 17 Mar 2021 11:16:02 -0400
Resent-Message-Id: <E1lMXty-0005ch-4y@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lMXtu-0004Xb-QX
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:16:01 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1615994150; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=I8Hs1zZajuXAALGJEMR1mYVTIlHR9BEmt21KCyQbg3FojYJZkTe360spmjHfrUxIjC1W+zcUyoeRh3UuUjRqhMjp+oNLA+qpAuQ89ZBPVA2pYyTg3g1a39SlUocgSo50wYXCRrGWUPmyLFnEIy2deixlEdAd7pge1WPFsCC144E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1615994150;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=YCqbnZ86+AQn6Z97LhYrncrwYcyuVco2DJVTIqN7FB8=; 
 b=H4viaspbeWoL/rsxyUGxdleEt37fap2laRVnr9hDGrnAnCOxwpRQ5VwfdYEBeITj82wm/IOzEKYSwfwdDuk4OQWanD/vCU87A5EDuiT6AUN6i7yWUMblMvgBULFn5awdWb4h0bpfObMx12M0VRfcG/YWDZiC6WAuFZNCE0DuZBQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1615994147086870.0646714968727;
 Wed, 17 Mar 2021 08:15:47 -0700 (PDT)
In-Reply-To: <20210317143325.2165821-1-eblake@redhat.com>
Subject: Re: [PATCH 0/2] More qemu_strtosz fixes
Message-ID: <161599414593.29996.8944585512631660040@c9d4d6fbb2f1>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: eblake@redhat.com
Date: Wed, 17 Mar 2021 08:15:47 -0700 (PDT)
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
Cc: berrange@redhat.com, thuth@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDMxNzE0MzMyNS4yMTY1
ODIxLTEtZWJsYWtlQHJlZGhhdC5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2
ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBp
bmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIxMDMxNzE0MzMyNS4yMTY1
ODIxLTEtZWJsYWtlQHJlZGhhdC5jb20KU3ViamVjdDogW1BBVENIIDAvMl0gTW9yZSBxZW11X3N0
cnRvc3ogZml4ZXMKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJl
di1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlm
Zi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQg
Y29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFtCi4vc2NyaXB0cy9jaGVja3Bh
dGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpVcGRhdGlu
ZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0CkZyb20gaHR0cHM6Ly9n
aXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiAgIDVkMTQyOGQuLjI1YTc3NTEgIG1hc3Rl
ciAgICAgLT4gbWFzdGVyCiAtIFt0YWcgdXBkYXRlXSAgICAgIHBhdGNoZXcvMjAyMTAzMTUyMzA4
MzguMjk3MzEwMy0xLWY0YnVnQGFtc2F0Lm9yZyAtPiBwYXRjaGV3LzIwMjEwMzE1MjMwODM4LjI5
NzMxMDMtMS1mNGJ1Z0BhbXNhdC5vcmcKIC0gW3RhZyB1cGRhdGVdICAgICAgcGF0Y2hldy8yMDIx
MDMxNTIzMzUyNy4yOTg4NDgzLTEtcGhpbG1kQHJlZGhhdC5jb20gLT4gcGF0Y2hldy8yMDIxMDMx
NTIzMzUyNy4yOTg4NDgzLTEtcGhpbG1kQHJlZGhhdC5jb20KIC0gW3RhZyB1cGRhdGVdICAgICAg
cGF0Y2hldy8yMDIxMDMxNjIyMDczNS4yMDQ4MTM3LTEtcmljaGFyZC5oZW5kZXJzb25AbGluYXJv
Lm9yZyAtPiBwYXRjaGV3LzIwMjEwMzE2MjIwNzM1LjIwNDgxMzctMS1yaWNoYXJkLmhlbmRlcnNv
bkBsaW5hcm8ub3JnCiAqIFtuZXcgdGFnXSAgICAgICAgIHBhdGNoZXcvMjAyMTAzMTcxNDMzMjUu
MjE2NTgyMS0xLWVibGFrZUByZWRoYXQuY29tIC0+IHBhdGNoZXcvMjAyMTAzMTcxNDMzMjUuMjE2
NTgyMS0xLWVibGFrZUByZWRoYXQuY29tClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcK
MzZjOWE4ZiB1dGlsczogV29yayBhcm91bmQgbWluZ3cgc3RydG8qbCBidWcgd2l0aCAweAo4MWFm
NjNlIHV0aWxzOiBUaWdodGVyIHRlc3RzIGZvciBxZW11X3N0cnRvc3oKCj09PSBPVVRQVVQgQkVH
SU4gPT09CjEvMiBDaGVja2luZyBjb21taXQgODFhZjYzZTUzODQxICh1dGlsczogVGlnaHRlciB0
ZXN0cyBmb3IgcWVtdV9zdHJ0b3N6KQoyLzIgQ2hlY2tpbmcgY29tbWl0IDM2YzlhOGY0MjAxMCAo
dXRpbHM6IFdvcmsgYXJvdW5kIG1pbmd3IHN0cnRvKmwgYnVnIHdpdGggMHgpCkVSUk9SOiBjb25z
aWRlciB1c2luZyBxZW11X3N0cnRvbCBpbiBwcmVmZXJlbmNlIHRvIHN0cnRvbAojMTQxOiBGSUxF
OiB1dGlsL2N1dGlscy5jOjQwOToKKyAgICAgICAgaWYgKHN0cnRvbChucHRyLCAmdG1wLCAxMCkg
PT0gMCAmJiBlcnJubyA9PSAwICYmCgp0b3RhbDogMSBlcnJvcnMsIDAgd2FybmluZ3MsIDE2OSBs
aW5lcyBjaGVja2VkCgpQYXRjaCAyLzIgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3
LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVt
IHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KCj09PSBP
VVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgpUaGUgZnVs
bCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMjEwMzE3MTQz
MzI1LjIxNjU4MjEtMS1lYmxha2VAcmVkaGF0LmNvbS90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9
bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0
dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3
LWRldmVsQHJlZGhhdC5jb20=

