Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3657A3AB4CB
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 15:31:38 +0200 (CEST)
Received: from localhost ([::1]:33198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lts7N-00072z-1z
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 09:31:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lts12-0002J5-2V
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 09:25:04 -0400
Resent-Date: Thu, 17 Jun 2021 09:25:04 -0400
Resent-Message-Id: <E1lts12-0002J5-2V@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lts0z-000764-7n
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 09:25:03 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1623936289; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=MwcGlP9FpA/YtfLVHy3jCtpsRO+nMfjQVCoZWJfi6NbCN+FdSA82Px1m9VFsAZIiTtJkgf4gFJ9rVeKXW32hEDqefJh3pjQ9njHHPXa4dVb2g03ikurGTXIdETlHJJJmGTh/ui1iwK94qt4czmq8Mtd4k2gH1Wu+AllTQ4W6MHw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1623936289;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=lEkpZLhf6yCmgY8YOCx+m5exwKz8vqeKJ+IDRljDloY=; 
 b=kWIjdQT2iXtMZwSz4lLyfBqXUdRilZoDTz2LtCqn9FdBkIpsWEy39uBj/h0lQ11AGT1FCoWCg/NR4J8rS3voAcQ/PmtWfcW/Ywmp8n4WsyPZVQde0MbDd5u2tn1AlFLRVuRM29usC7LGXCFHuIt0ML6SGTobtwTzpjcV0yHolQo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1623936287440952.887465832725;
 Thu, 17 Jun 2021 06:24:47 -0700 (PDT)
In-Reply-To: <20210617124107.2386073-1-kraxel@redhat.com>
Subject: Re: [PULL 0/7] Audio 20210617 patches
Message-ID: <162393628607.30552.4386973132022674577@7c66fb7bc3ab>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: kraxel@redhat.com
Date: Thu, 17 Jun 2021 06:24:47 -0700 (PDT)
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
Cc: lvivier@redhat.com, thuth@redhat.com, qemu-devel@nongnu.org, alxndr@bu.edu,
 bsd@redhat.com, kraxel@redhat.com, stefanha@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDYxNzEyNDEwNy4yMzg2
MDczLTEta3JheGVsQHJlZGhhdC5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8gaGF2
ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9yZSBp
bmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIxMDYxNzEyNDEwNy4yMzg2
MDczLTEta3JheGVsQHJlZGhhdC5jb20KU3ViamVjdDogW1BVTEwgMC83XSBBdWRpbyAyMDIxMDYx
NyBwYXRjaGVzCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCmdpdCByZXYt
cGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYu
cmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNv
bmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQouL3NjcmlwdHMvY2hlY2twYXRj
aC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKVXBkYXRpbmcg
M2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApGcm9tIGh0dHBzOi8vZ2l0
aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdQogLSBbdGFnIHVwZGF0ZV0gICAgICBwYXRjaGV3
LzIwMjEwNjE3MTIxNjI4LjIwMTE2LTEtcGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnIC0+IHBhdGNo
ZXcvMjAyMTA2MTcxMjE2MjguMjAxMTYtMS1wZXRlci5tYXlkZWxsQGxpbmFyby5vcmcKICogW25l
dyB0YWddICAgICAgICAgcGF0Y2hldy8yMDIxMDYxNzEyNDEwNy4yMzg2MDczLTEta3JheGVsQHJl
ZGhhdC5jb20gLT4gcGF0Y2hldy8yMDIxMDYxNzEyNDEwNy4yMzg2MDczLTEta3JheGVsQHJlZGhh
dC5jb20KU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0JwphNmM5ODQ2IGNvcmVhdWRpbzog
Rml4IG91dHB1dCBzdHJlYW0gZm9ybWF0IHNldHRpbmdzCjMyZjNmMWUgYXVkaW86IEZpeCBmb3Jt
YXQgc3BlY2lmaWNhdGlvbnMgb2YgZGVidWcgbG9ncwpiNTEyNzlkIGh3L2F1ZGlvL3NiMTY6IEF2
b2lkIGFzc2VydGlvbiBieSByZXN0cmljdGluZyBJL08gc2FtcGxpbmcgcmF0ZSByYW5nZQplODY0
YTI5IGphY2thdWRpbzogYXZvaWQgdGhhdCB0aGUgY2xpZW50IG5hbWUgY29udGFpbnMgdGhlIHdv
cmQgKE5VTEwpCmM0YTg2YTcgYXVkaW86IG1vdmUgY29kZSB0byBhdWRpby9hdWRpby5jCjI4MDBk
YjAgcGFhdWRpbzogcmVtb3ZlIHVudXNlZCBzdHJlYW0gZmxhZ3MKMGIzZmQzYyBhbHNhYXVkaW86
IHJlbW92ZSAjaWZkZWYgREVCVUcgdG8gYXZvaWQgYml0IHJvdAoKPT09IE9VVFBVVCBCRUdJTiA9
PT0KMS83IENoZWNraW5nIGNvbW1pdCAwYjNmZDNjYTVmOTggKGFsc2FhdWRpbzogcmVtb3ZlICNp
ZmRlZiBERUJVRyB0byBhdm9pZCBiaXQgcm90KQoyLzcgQ2hlY2tpbmcgY29tbWl0IDI4MDBkYjA3
OWRkMyAocGFhdWRpbzogcmVtb3ZlIHVudXNlZCBzdHJlYW0gZmxhZ3MpCjMvNyBDaGVja2luZyBj
b21taXQgYzRhODZhNzU1NzAxIChhdWRpbzogbW92ZSBjb2RlIHRvIGF1ZGlvL2F1ZGlvLmMpCjQv
NyBDaGVja2luZyBjb21taXQgZTg2NGEyOWNiMGMyIChqYWNrYXVkaW86IGF2b2lkIHRoYXQgdGhl
IGNsaWVudCBuYW1lIGNvbnRhaW5zIHRoZSB3b3JkIChOVUxMKSkKNS83IENoZWNraW5nIGNvbW1p
dCBiNTEyNzlkMjc3ZTYgKGh3L2F1ZGlvL3NiMTY6IEF2b2lkIGFzc2VydGlvbiBieSByZXN0cmlj
dGluZyBJL08gc2FtcGxpbmcgcmF0ZSByYW5nZSkKNi83IENoZWNraW5nIGNvbW1pdCAzMmYzZjFl
N2I5YzQgKGF1ZGlvOiBGaXggZm9ybWF0IHNwZWNpZmljYXRpb25zIG9mIGRlYnVnIGxvZ3MpCkVS
Uk9SOiBzcGFjZSBwcm9oaWJpdGVkIGJldHdlZW4gZnVuY3Rpb24gbmFtZSBhbmQgb3BlbiBwYXJl
bnRoZXNpcyAnKCcKIzI1OiBGSUxFOiBhdWRpby9hdWRpby5jOjcwODoKKyAgICAgICAgZG9sb2cg
KCIlcyBpcyBmdWxsICV6dVxuIiwgc3ctPm5hbWUsIGxpdmUpOwoKRVJST1I6IHNwYWNlIHByb2hp
Yml0ZWQgYmV0d2VlbiBmdW5jdGlvbiBuYW1lIGFuZCBvcGVuIHBhcmVudGhlc2lzICcoJwojNDM6
IEZJTEU6IGF1ZGlvL2F1ZGlvLmM6MTAyNToKKyAgICBkb2xvZyAoIiVzOiBnZXRfZnJlZSBsaXZl
ICV6dSBkZWFkICV6dSByZXQgJSIgUFJJZDY0ICJcbiIsCgp0b3RhbDogMiBlcnJvcnMsIDAgd2Fy
bmluZ3MsIDI0IGxpbmVzIGNoZWNrZWQKClBhdGNoIDYvNyBoYXMgc3R5bGUgcHJvYmxlbXMsIHBs
ZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMg
cmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlO
RVJTLgoKNy83IENoZWNraW5nIGNvbW1pdCBhNmM5ODQ2M2U3OWIgKGNvcmVhdWRpbzogRml4IG91
dHB1dCBzdHJlYW0gZm9ybWF0IHNldHRpbmdzKQo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29t
bWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApo
dHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIxMDYxNzEyNDEwNy4yMzg2MDczLTEta3JheGVsQHJl
ZGhhdC5jb20vdGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5l
cmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBs
ZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

