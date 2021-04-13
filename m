Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B7C35DA49
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 10:47:16 +0200 (CEST)
Received: from localhost ([::1]:55834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWEhX-0002X7-5U
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 04:47:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lWEgM-00027u-1E
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 04:46:02 -0400
Resent-Date: Tue, 13 Apr 2021 04:46:02 -0400
Resent-Message-Id: <E1lWEgM-00027u-1E@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lWEgH-0004A9-Fh
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 04:46:01 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1618303547; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=IicR6U21YUBvFZ5Ufm32DiyHezMQrGWS1c2u+3WbQqVCwm06WTRQGQ1vtxjMTVjTcO/Jhcl+6/PP0/UkD8QcANN4rg6EhrzDdqS1gIXKvP2vrfLdBfpnyDJIZSew+L9ixprGDt6SI8oVa787EEAHq4CF7NMI6+OMLrJu7/XcdcY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1618303547;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=8eSUjC3c/OV4+paan7Oi5kjZArOobafflxZo2WwTsvw=; 
 b=N5tPkqTgt9tgnVPRLXWt2v9PHdj/5+sHoe6OppykOO8Rp1TUWsmlNYcpKzvlpWbsk2Ia8e7Ln0eABLePiZKlTfEol+4HH5ng/4gLHmQG8E+yRC+g7fWy10OvZMc9xpgxH3TIaj8LkI3gqd2Zlh5EOtoISPGYfrPYQCyeEb1Yags=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1618303544834961.9426491510101;
 Tue, 13 Apr 2021 01:45:44 -0700 (PDT)
In-Reply-To: <161830261172.29345.7866671962411605196.malonedeb@wampee.canonical.com>
Subject: Re: [Bug 1923583] [NEW] colo: pvm flush failed after svm killed
Message-ID: <161830354377.7886.1088668944082795480@72b6d80f974b>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: 1923583@bugs.launchpad.net
Date: Tue, 13 Apr 2021 01:45:44 -0700 (PDT)
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8xNjE4MzAyNjExNzIuMjkzNDUu
Nzg2NjY3MTk2MjQxMTYwNTE5Ni5tYWxvbmVkZWJAd2FtcGVlLmNhbm9uaWNhbC5jb20vCgoKCkhp
LAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4g
U2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBpbmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNz
YWdlLWlkOiAxNjE4MzAyNjExNzIuMjkzNDUuNzg2NjY3MTk2MjQxMTYwNTE5Ni5tYWxvbmVkZWJA
d2FtcGVlLmNhbm9uaWNhbC5jb20KU3ViamVjdDogW0J1ZyAxOTIzNTgzXSBbTkVXXSBjb2xvOiBw
dm0gZmx1c2ggZmFpbGVkIGFmdGVyIHN2bSBraWxsZWQKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9
PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQgMApn
aXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBk
aWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9n
cmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNUIFND
UklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4
NzEzMzg0CkZyb20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiAqIFtu
ZXcgdGFnXSAgICAgICAgIHBhdGNoZXcvMTYxODMwMjYxMTcyLjI5MzQ1Ljc4NjY2NzE5NjI0MTE2
MDUxOTYubWFsb25lZGViQHdhbXBlZS5jYW5vbmljYWwuY29tIC0+IHBhdGNoZXcvMTYxODMwMjYx
MTcyLjI5MzQ1Ljc4NjY2NzE5NjI0MTE2MDUxOTYubWFsb25lZGViQHdhbXBlZS5jYW5vbmljYWwu
Y29tCiAtIFt0YWcgdXBkYXRlXSAgICAgIHBhdGNoZXcvMjAyMTA0MTMwODEwMDguMzQwOTQ1OS0x
LWY0YnVnQGFtc2F0Lm9yZyAtPiBwYXRjaGV3LzIwMjEwNDEzMDgxMDA4LjM0MDk0NTktMS1mNGJ1
Z0BhbXNhdC5vcmcKU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0JwpmNDM4ODVkIGNvbG86
IHB2bSBmbHVzaCBmYWlsZWQgYWZ0ZXIgc3ZtIGtpbGxlZAoKPT09IE9VVFBVVCBCRUdJTiA9PT0K
RVJST1I6IE1pc3NpbmcgU2lnbmVkLW9mZi1ieTogbGluZShzKQoKdG90YWw6IDEgZXJyb3JzLCAw
IHdhcm5pbmdzLCA4IGxpbmVzIGNoZWNrZWQKCkNvbW1pdCBmNDM4ODVkM2E3ZTkgKGNvbG86IHB2
bSBmbHVzaCBmYWlsZWQgYWZ0ZXIgc3ZtIGtpbGxlZCkgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVh
c2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJl
cG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVS
Uy4KPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoK
ClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMTYx
ODMwMjYxMTcyLjI5MzQ1Ljc4NjY2NzE5NjI0MTE2MDUxOTYubWFsb25lZGViQHdhbXBlZS5jYW5v
bmljYWwuY29tL3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2Vu
ZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQ
bGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

