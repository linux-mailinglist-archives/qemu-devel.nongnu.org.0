Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 779193A71B1
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 23:59:52 +0200 (CEST)
Received: from localhost ([::1]:54496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsucZ-0000Xg-J5
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 17:59:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lsuax-0007Bz-Kx
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 17:58:11 -0400
Resent-Date: Mon, 14 Jun 2021 17:58:11 -0400
Resent-Message-Id: <E1lsuax-0007Bz-Kx@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lsuav-0005Jw-1B
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 17:58:11 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1623707870; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=F5LlJkcNs3UWR+GZKGmF+nmVpJR1wSTuB6f1uY1abye1G13644LceHsV/MRYne+kolrPRT9Fm4MA5wYIDP8gUlPEgjSugJuN6jOeQqZdLMKEpUcD47fF11Q4ViuhGZTwy/UbWMs264JZea81srvIIaMcBKgZ+8v4apoHGTk7Au8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1623707870;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=qC3Aam15GCMNUiz3LJnDOzjz7mbITQHzP2+u7W127q8=; 
 b=ffAbBHsXZjTz9C4O2qJmNAyTKIfL4M6444QPsSvHuuSajSyzNDIxu6GZ0RRBo36pkveqEdL7vmc03hHmoR/bt1aPwL9sX+yse4sWameEbaz9cbkJxUgTdmh69mZy/DUnPScexpUOXnf49vuFB06ZSp6/5rZIH8n6jnwOBP8HyW0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1623707869317909.5417348931061;
 Mon, 14 Jun 2021 14:57:49 -0700 (PDT)
In-Reply-To: <20210602084106.43186-1-jasowang@redhat.com>
Subject: Re: [PATCH V2 0/2] vhost-vDPA: vq notification map support
Message-ID: <162370786783.2358.12506361070319399669@7c66fb7bc3ab>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: jasowang@redhat.com
Date: Mon, 14 Jun 2021 14:57:49 -0700 (PDT)
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
Cc: mst@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org,
 si-wei.liu@oracle.com, elic@nvidia.com, lingshan.zhu@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDYwMjA4NDEwNi40MzE4
Ni0xLWphc293YW5nQHJlZGhhdC5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2
ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBp
bmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIxMDYwMjA4NDEwNi40MzE4
Ni0xLWphc293YW5nQHJlZGhhdC5jb20KU3ViamVjdDogW1BBVENIIFYyIDAvMl0gdmhvc3QtdkRQ
QTogdnEgbm90aWZpY2F0aW9uIG1hcCBzdXBwb3J0Cgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09
CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0
IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlm
Zi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3Jh
bQouL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJ
UFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcx
MzM4NApGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdQogICBhNDcx
NmZkLi4xZWEwNmFiICBtYXN0ZXIgICAgIC0+IG1hc3RlcgogLSBbdGFnIHVwZGF0ZV0gICAgICBw
YXRjaGV3LzIwMjEwNTA1MTAzNzAyLjUyMTQ1Ny0xLWJlcnJhbmdlQHJlZGhhdC5jb20gLT4gcGF0
Y2hldy8yMDIxMDUwNTEwMzcwMi41MjE0NTctMS1iZXJyYW5nZUByZWRoYXQuY29tCiAtIFt0YWcg
dXBkYXRlXSAgICAgIHBhdGNoZXcvMjAyMTA1MTAxMTQzMjguMjE4MzUtMS1kYXZpZEByZWRoYXQu
Y29tIC0+IHBhdGNoZXcvMjAyMTA1MTAxMTQzMjguMjE4MzUtMS1kYXZpZEByZWRoYXQuY29tCiAt
IFt0YWcgdXBkYXRlXSAgICAgIHBhdGNoZXcvMjAyMTA1MjYxNzA0MzIuMzQzNTg4LTEtcGhpbG1k
QHJlZGhhdC5jb20gLT4gcGF0Y2hldy8yMDIxMDUyNjE3MDQzMi4zNDM1ODgtMS1waGlsbWRAcmVk
aGF0LmNvbQogLSBbdGFnIHVwZGF0ZV0gICAgICBwYXRjaGV3LzIwMjEwNjAxMTQxODA1LjIwNjU4
Mi0xLXBldGVyeEByZWRoYXQuY29tIC0+IHBhdGNoZXcvMjAyMTA2MDExNDE4MDUuMjA2NTgyLTEt
cGV0ZXJ4QHJlZGhhdC5jb20KICogW25ldyB0YWddICAgICAgICAgcGF0Y2hldy8yMDIxMDYwMjA4
NDEwNi40MzE4Ni0xLWphc293YW5nQHJlZGhhdC5jb20gLT4gcGF0Y2hldy8yMDIxMDYwMjA4NDEw
Ni40MzE4Ni0xLWphc293YW5nQHJlZGhhdC5jb20KIC0gW3RhZyB1cGRhdGVdICAgICAgcGF0Y2hl
dy8yMDIxMDYwMjE5MTEyNS41MjU3NDItMS1qb3NlbWFydGluczkwQGdtYWlsLmNvbSAtPiBwYXRj
aGV3LzIwMjEwNjAyMTkxMTI1LjUyNTc0Mi0xLWpvc2VtYXJ0aW5zOTBAZ21haWwuY29tCiAtIFt0
YWcgdXBkYXRlXSAgICAgIHBhdGNoZXcvMjAyMTA2MDMxNzEyNTkuMjc5NjItMS1wZXRlci5tYXlk
ZWxsQGxpbmFyby5vcmcgLT4gcGF0Y2hldy8yMDIxMDYwMzE3MTI1OS4yNzk2Mi0xLXBldGVyLm1h
eWRlbGxAbGluYXJvLm9yZwpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCgo9PT0gT1VU
UFVUIEJFR0lOID09PQpjaGVja3BhdGNoLnBsOiBubyByZXZpc2lvbnMgcmV0dXJuZWQgZm9yIHJl
dmxpc3QgJ2Jhc2UuLicKPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdp
dGggY29kZTogMjU1CgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hl
dy5vcmcvbG9ncy8yMDIxMDYwMjA4NDEwNi40MzE4Ni0xLWphc293YW5nQHJlZGhhdC5jb20vdGVz
dGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21h
dGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlv
dXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

