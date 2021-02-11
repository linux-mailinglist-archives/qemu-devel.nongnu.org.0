Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F77D319146
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 18:42:40 +0100 (CET)
Received: from localhost ([::1]:54738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAFzD-0002ci-3Y
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 12:42:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lAFo0-0007AD-0l; Thu, 11 Feb 2021 12:31:04 -0500
Resent-Date: Thu, 11 Feb 2021 12:31:04 -0500
Resent-Message-Id: <E1lAFo0-0007AD-0l@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lAFnv-0001N5-AV; Thu, 11 Feb 2021 12:31:03 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1613064643; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=T6O5nM8SYcCmic+oW8iXCUkDem9unWpJmf1a3VcEkI6DJQpq16ByYN0HdAzjCgUh0BNEQTg8woZ8af1X7qmapWfEUoOBPPXuzPvTsI76FpVsfqAWNHQYoY8uQce8GkkFBcWGTt5kw2DspaRWv6m28w6erpgMZUVVBN6JxGtt7Eo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1613064643;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=hQcM/uWMpCYYl9yzFnzBWJBe0IGg16O1umIrefIjIZA=; 
 b=IvKjqjG7bBf/shPhmC/h6Jo+nufgu4/EEJ+7ZUGnxhL1Q0VmaGNL4wlWfVIzLJ7VaMMd77Py9X87wPgW/dpZ37OcTrCECwjFsDa8zjTBnpPWZyknn5oR2YXPDg6b9oRrSpF7RQ5OE/b//YEBowzb1yZx7u3gW8kCRwesJa2qCA0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1613064640095807.5504989079695;
 Thu, 11 Feb 2021 09:30:40 -0800 (PST)
In-Reply-To: <20210211152139.1004257-1-its@irrelevant.dk>
Subject: Re: [PULL v2 0/3] emulated nvme fixes
Message-ID: <161306463866.26113.14983447799770798086@c667a6b167f6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: its@irrelevant.dk
Date: Thu, 11 Feb 2021 09:30:40 -0800 (PST)
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-block@nongnu.org,
 k.jensen@samsung.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 its@irrelevant.dk, kbusch@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDIxMTE1MjEzOS4xMDA0
MjU3LTEtaXRzQGlycmVsZXZhbnQuZGsvCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2
ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBp
bmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIxMDIxMTE1MjEzOS4xMDA0
MjU3LTEtaXRzQGlycmVsZXZhbnQuZGsKU3ViamVjdDogW1BVTEwgdjIgMC8zXSBlbXVsYXRlZCBu
dm1lIGZpeGVzCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCmdpdCByZXYt
cGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYu
cmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNv
bmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQouL3NjcmlwdHMvY2hlY2twYXRj
aC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKVXBkYXRpbmcg
M2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApGcm9tIGh0dHBzOi8vZ2l0
aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdQogKiBbbmV3IHRhZ10gICAgICAgICBwYXRjaGV3
LzIwMjEwMjExMTUyMTM5LjEwMDQyNTctMS1pdHNAaXJyZWxldmFudC5kayAtPiBwYXRjaGV3LzIw
MjEwMjExMTUyMTM5LjEwMDQyNTctMS1pdHNAaXJyZWxldmFudC5kawpTd2l0Y2hlZCB0byBhIG5l
dyBicmFuY2ggJ3Rlc3QnCgo9PT0gT1VUUFVUIEJFR0lOID09PQpjaGVja3BhdGNoLnBsOiBubyBy
ZXZpc2lvbnMgcmV0dXJuZWQgZm9yIHJldmxpc3QgJ2Jhc2UuLicKPT09IE9VVFBVVCBFTkQgPT09
CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMjU1CgoKVGhlIGZ1bGwgbG9nIGlzIGF2
YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIxMDIxMTE1MjEzOS4xMDA0MjU3
LTEtaXRzQGlycmVsZXZhbnQuZGsvdGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0t
LQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNo
ZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRo
YXQuY29t

