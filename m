Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D1831D5A7
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 08:17:10 +0100 (CET)
Received: from localhost ([::1]:52206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCH5B-0008Nf-O0
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 02:17:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lCH4A-0007xs-4v
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 02:16:06 -0500
Resent-Date: Wed, 17 Feb 2021 02:16:06 -0500
Resent-Message-Id: <E1lCH4A-0007xs-4v@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lCH46-0005KT-Nl
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 02:16:05 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1613546149; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=OruICSyIOHiaOC/sQyzG3i49iMPU4Nh6W20xavv0qgh4ZKTEQ5VH/UnH6rWN41O7/AK5h6gQEW57DDVtgs/75TbMreHDzMZAJbSzmUsFRY7FetNccZZWHGvwYNkAhqCYfz0Hwx56xN5IgIHLtN8Eo8rZKa4B45+RRSCo7mV2A20=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1613546149;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=N2DiIHB67dYOcc0RX2/yDht/0EiKm8lB1cSf1fYbJHM=; 
 b=bBdxhzYiolBgAyAbd7sXQgLbkLeYTdapp69SMlvuBcOlVnfEpFkf+9vMksC5mkacHWTFtiVBtsvMRZ1hJqitz9hZSRx7HUZbJca2S/R8qY0lrCJOaSQ8hAFX1zDHXs9182hNAW0lGvGeXf8H56rq70Ck4sGLVAkKBP8baRqBcaU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1613546145000838.6403099070708;
 Tue, 16 Feb 2021 23:15:45 -0800 (PST)
In-Reply-To: <20210217070944.2371327-1-marcandre.lureau@redhat.com>
Subject: Re: [PATCH v2] qga: return a more explicit error on why a command is
 disabled
Message-ID: <161354614357.372.9583027759713506788@c667a6b167f6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: marcandre.lureau@redhat.com
Date: Tue, 16 Feb 2021 23:15:45 -0800 (PST)
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
Cc: michael.roth@amd.com, pkrempa@redhat.com, qemu-devel@nongnu.org,
 marcandre.lureau@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDIxNzA3MDk0NC4yMzcx
MzI3LTEtbWFyY2FuZHJlLmx1cmVhdUByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNl
ZW1zIHRvIGhhdmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cg
Zm9yCm1vcmUgaW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMTAyMTcw
NzA5NDQuMjM3MTMyNy0xLW1hcmNhbmRyZS5sdXJlYXVAcmVkaGF0LmNvbQpTdWJqZWN0OiBbUEFU
Q0ggdjJdIHFnYTogcmV0dXJuIGEgbW9yZSBleHBsaWNpdCBlcnJvciBvbiB3aHkgYSBjb21tYW5k
IGlzIGRpc2FibGVkCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCmdpdCBy
ZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRp
ZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0
IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQouL3NjcmlwdHMvY2hlY2tw
YXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKVXBkYXRp
bmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApGcm9tIGh0dHBzOi8v
Z2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdQogLSBbdGFnIHVwZGF0ZV0gICAgICBwYXRj
aGV3LzIwMjEwMjExMjI1MjQ2LjE3MzE1LTEtZGFuaWVsaGI0MTNAZ21haWwuY29tIC0+IHBhdGNo
ZXcvMjAyMTAyMTEyMjUyNDYuMTczMTUtMS1kYW5pZWxoYjQxM0BnbWFpbC5jb20KIC0gW3RhZyB1
cGRhdGVdICAgICAgcGF0Y2hldy8yMDIxMDIxNjE4MTMxNi43OTQyNzYtMS1hbHhuZHJAYnUuZWR1
IC0+IHBhdGNoZXcvMjAyMTAyMTYxODEzMTYuNzk0Mjc2LTEtYWx4bmRyQGJ1LmVkdQogLSBbdGFn
IHVwZGF0ZV0gICAgICBwYXRjaGV3LzIwMjEwMjE2MjI0NTQzLjE2MTQyLTEtcmViZWNjYUBudXZp
YWluYy5jb20gLT4gcGF0Y2hldy8yMDIxMDIxNjIyNDU0My4xNjE0Mi0xLXJlYmVjY2FAbnV2aWFp
bmMuY29tCiAqIFtuZXcgdGFnXSAgICAgICAgIHBhdGNoZXcvMjAyMTAyMTcwNzA5NDQuMjM3MTMy
Ny0xLW1hcmNhbmRyZS5sdXJlYXVAcmVkaGF0LmNvbSAtPiBwYXRjaGV3LzIwMjEwMjE3MDcwOTQ0
LjIzNzEzMjctMS1tYXJjYW5kcmUubHVyZWF1QHJlZGhhdC5jb20KU3dpdGNoZWQgdG8gYSBuZXcg
YnJhbmNoICd0ZXN0Jwo1NmViMGM5IHFnYTogcmV0dXJuIGEgbW9yZSBleHBsaWNpdCBlcnJvciBv
biB3aHkgYSBjb21tYW5kIGlzIGRpc2FibGVkCgo9PT0gT1VUUFVUIEJFR0lOID09PQpFUlJPUjog
b3BlbiBicmFjZSAneycgZm9sbG93aW5nIGVudW0gZ28gb24gdGhlIHNhbWUgbGluZQojMzI6IEZJ
TEU6IGluY2x1ZGUvcWFwaS9xbXAvZGlzcGF0Y2guaDozMjoKK3R5cGVkZWYgZW51bSBRbXBEaXNh
YmxlZAorewoKdG90YWw6IDEgZXJyb3JzLCAwIHdhcm5pbmdzLCAxMjEgbGluZXMgY2hlY2tlZAoK
Q29tbWl0IDU2ZWIwYzkwY2YyOCAocWdhOiByZXR1cm4gYSBtb3JlIGV4cGxpY2l0IGVycm9yIG9u
IHdoeSBhIGNvbW1hbmQgaXMgZGlzYWJsZWQpIGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJl
dmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQg
dGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCj09
PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgpUaGUg
ZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMjEwMjE3
MDcwOTQ0LjIzNzEzMjctMS1tYXJjYW5kcmUubHVyZWF1QHJlZGhhdC5jb20vdGVzdGluZy5jaGVj
a3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBi
eSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJh
Y2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

