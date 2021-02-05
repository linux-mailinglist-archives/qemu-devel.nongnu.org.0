Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FFA310364
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 04:17:24 +0100 (CET)
Received: from localhost ([::1]:60528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7rcV-0003e7-Rb
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 22:17:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1l7rb9-00038W-P0
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 22:15:55 -0500
Resent-Date: Thu, 04 Feb 2021 22:15:55 -0500
Resent-Message-Id: <E1l7rb9-00038W-P0@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1l7rb5-0000XX-H8
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 22:15:55 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1612494944; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=WaHNqenr+0ECkdKXiN+MsNR6U95PuMlisN4Lgy534W5QY0BwVKHK61C/4/hN2IHmOPYQTTBcT0kx58ah87/6oojIrtJkPqmhZlrONk1gqoL0S8kb73AGzns7qxRFKuiaC6Kk7MeYyQdOksYLB5Nd1GuMKvd7VxV84zfAOmyk3ks=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1612494944;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=ftsWsv0QBt9JYszzvL4hf7BvlSSQyt2LrbSE2TMCDDE=; 
 b=m9KnNn3bZxRuHGnMPZeDJ+S2vYTealNqYhzt4SQmVem+/v3+LjfY3+tHgvgPLxOkcVh/y6C6sxwkGjpxN3WzHUjUrS3ABUuBi++y+mLs3dCnrPCduS2MTtzIIlNQs21mmroD+EoO2yDUEv3wJpxDtOiBlYDZC66K744JL2r6zeM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1612494942885890.6880414297489;
 Thu, 4 Feb 2021 19:15:42 -0800 (PST)
In-Reply-To: <161249464270.1626.1619585641070694953.launchpad@gac.canonical.com>
Subject: Re: [Bug 1914696] [NEW] aarch64: migration failed: Segmentation fault
 (core dumped)
Message-ID: <161249494195.30579.11627832753112113739@c667a6b167f6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: 1914696@bugs.launchpad.net
Date: Thu, 4 Feb 2021 19:15:42 -0800 (PST)
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

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8xNjEyNDk0NjQyNzAuMTYyNi4x
NjE5NTg1NjQxMDcwNjk0OTUzLmxhdW5jaHBhZEBnYWMuY2Fub25pY2FsLmNvbS8KCgoKSGksCgpU
aGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUg
b3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2Ut
aWQ6IDE2MTI0OTQ2NDI3MC4xNjI2LjE2MTk1ODU2NDEwNzA2OTQ5NTMubGF1bmNocGFkQGdhYy5j
YW5vbmljYWwuY29tClN1YmplY3Q6IFtCdWcgMTkxNDY5Nl0gW05FV10gYWFyY2g2NDogbWlncmF0
aW9uIGZhaWxlZDogU2VnbWVudGF0aW9uIGZhdWx0IChjb3JlIGR1bXBlZCkKCj09PSBURVNUIFND
UklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxs
IHx8IGV4aXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25m
aWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdv
cml0aG0gaGlzdG9ncmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4u
Cj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQx
ZGVmN2Y0NGJkODg4NzEzMzg0CkZyb20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVj
dC9xZW11CiAqIFtuZXcgdGFnXSAgICAgICAgIHBhdGNoZXcvMTYxMjQ5NDY0MjcwLjE2MjYuMTYx
OTU4NTY0MTA3MDY5NDk1My5sYXVuY2hwYWRAZ2FjLmNhbm9uaWNhbC5jb20gLT4gcGF0Y2hldy8x
NjEyNDk0NjQyNzAuMTYyNi4xNjE5NTg1NjQxMDcwNjk0OTUzLmxhdW5jaHBhZEBnYWMuY2Fub25p
Y2FsLmNvbQpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCgo9PT0gT1VUUFVUIEJFR0lO
ID09PQpjaGVja3BhdGNoLnBsOiBubyByZXZpc2lvbnMgcmV0dXJuZWQgZm9yIHJldmxpc3QgJ2Jh
c2UuLicKPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTog
MjU1CgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9n
cy8xNjEyNDk0NjQyNzAuMTYyNi4xNjE5NTg1NjQxMDcwNjk0OTUzLmxhdW5jaHBhZEBnYWMuY2Fu
b25pY2FsLmNvbS90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdl
bmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4K
UGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

