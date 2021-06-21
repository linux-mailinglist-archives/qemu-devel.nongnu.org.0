Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F073AF676
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 21:50:48 +0200 (CEST)
Received: from localhost ([::1]:46030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvPwV-00012R-8n
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 15:50:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lvPuz-0008H8-Vz
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 15:49:14 -0400
Resent-Date: Mon, 21 Jun 2021 15:49:13 -0400
Resent-Message-Id: <E1lvPuz-0008H8-Vz@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lvPuw-0006pa-79
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 15:49:13 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1624304930; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=VfCUgOM6wxXiyYfoJFU3t7MvV5Hl7JpWqzZfhn75gAX+ai3KXXYSSTM4YAfHFJwBjUoJ0/niirYWp9IcKv4wirucQdvAex2W3O+Fg793s8eiISeCGUhnhCTiDh4YIUMd0CRW1GBa9vhwl9kRqhRwtfdgJGLTxu87d4X+rV3rnrM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1624304930;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=LUIukb4TNVaJVL5F1reydFhHNQLC/qnaMENPi8qU8Ao=; 
 b=Q6d75gDoKsbwfmXT8O88nCfNSfzLJdOBnzBz8AZZSPLoLWhNdGUvrIsJE3/3/r9vAGkYqyO9IHk05XrboNA9oZc/f8cgHeDs33Tb1pwhwOWVknRg9zXHy0sfAisFtUr0DHaUHUp3+nVP2FUonjQYcEzUmO1nN/zNVMrnj9mTTfY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1624304928170773.2833817147193;
 Mon, 21 Jun 2021 12:48:48 -0700 (PDT)
In-Reply-To: <20210621192425.1188442-1-vivek.kasireddy@intel.com>
Subject: Re: [PATCH v3 0/5] virtio-gpu: Add a default synchronization
 mechanism for blobs
Message-ID: <162430492699.9906.5200735106125585154@7c66fb7bc3ab>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: vivek.kasireddy@intel.com
Date: Mon, 21 Jun 2021 12:48:48 -0700 (PDT)
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

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDYyMTE5MjQyNS4xMTg4
NDQyLTEtdml2ZWsua2FzaXJlZGR5QGludGVsLmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVt
cyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZv
cgptb3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjEwNjIxMTky
NDI1LjExODg0NDItMS12aXZlay5rYXNpcmVkZHlAaW50ZWwuY29tClN1YmplY3Q6IFtQQVRDSCB2
MyAwLzVdIHZpcnRpby1ncHU6IEFkZCBhIGRlZmF1bHQgc3luY2hyb25pemF0aW9uIG1lY2hhbmlz
bSBmb3IgYmxvYnMKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJl
di1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlm
Zi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQg
Y29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFtCi4vc2NyaXB0cy9jaGVja3Bh
dGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpVcGRhdGlu
ZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0CkZyb20gaHR0cHM6Ly9n
aXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiAgIDUzZjMwNmYuLjBhZGQ5OWUgIG1hc3Rl
ciAgICAgLT4gbWFzdGVyCiAtIFt0YWcgdXBkYXRlXSAgICAgIHBhdGNoZXcvMjAyMTA2MjExNzEw
MjEuMTgxOTg4MS0xLXJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmcgLT4gcGF0Y2hldy8yMDIx
MDYyMTE3MTAyMS4xODE5ODgxLTEtcmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZwogKiBbbmV3
IHRhZ10gICAgICAgICBwYXRjaGV3LzIwMjEwNjIxMTkyNDI1LjExODg0NDItMS12aXZlay5rYXNp
cmVkZHlAaW50ZWwuY29tIC0+IHBhdGNoZXcvMjAyMTA2MjExOTI0MjUuMTE4ODQ0Mi0xLXZpdmVr
Lmthc2lyZWRkeUBpbnRlbC5jb20KU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0JwozMzEw
NWRlIHZpcnRpby1ncHU6IEFkZCBnbF9mbHVzaGVkIGNhbGxiYWNrCmMyNTNmOWYgdWkvZ3RrLWVn
bDogV2FpdCBmb3IgdGhlIGRyYXcgc2lnbmFsIGZvciBkbWFidWYgYmxvYnMKNTkwOWRmNCB1aTog
Q3JlYXRlIHN5bmMgb2JqZWN0cyBhbmQgZmVuY2VzIG9ubHkgZm9yIGJsb2JzCjRmN2Q0YjYgdWkv
ZWdsOiBBZGQgZWdsIGhlbHBlcnMgdG8gaGVscCB3aXRoIHN5bmNocm9uaXphdGlvbgphMTUzZmVk
IHVpL2d0azogQ3JlYXRlIGEgY29tbW9uIHJlbGVhc2VfZG1hYnVmIGhlbHBlcgoKPT09IE9VVFBV
VCBCRUdJTiA9PT0KMS81IENoZWNraW5nIGNvbW1pdCBhMTUzZmVkMmM0ZTIgKHVpL2d0azogQ3Jl
YXRlIGEgY29tbW9uIHJlbGVhc2VfZG1hYnVmIGhlbHBlcikKMi81IENoZWNraW5nIGNvbW1pdCA0
ZjdkNGI2NTk2YWUgKHVpL2VnbDogQWRkIGVnbCBoZWxwZXJzIHRvIGhlbHAgd2l0aCBzeW5jaHJv
bml6YXRpb24pCkVSUk9SOiBjb2RlIGluZGVudCBzaG91bGQgbmV2ZXIgdXNlIHRhYnMKIzYyOiBG
SUxFOiB1aS9lZ2wtaGVscGVycy5jOjg4OgorXkleSV5JXklFR0xfU1lOQ19OQVRJVkVfRkVOQ0Vf
QU5EUk9JRCwgTlVMTCk7JAoKdG90YWw6IDEgZXJyb3JzLCAwIHdhcm5pbmdzLCA0OCBsaW5lcyBj
aGVja2VkCgpQYXRjaCAyLzUgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYg
YW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRo
ZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KCjMvNSBDaGVja2lu
ZyBjb21taXQgNTkwOWRmNDBmYmM4ICh1aTogQ3JlYXRlIHN5bmMgb2JqZWN0cyBhbmQgZmVuY2Vz
IG9ubHkgZm9yIGJsb2JzKQo0LzUgQ2hlY2tpbmcgY29tbWl0IGMyNTNmOWYyODFhZSAodWkvZ3Rr
LWVnbDogV2FpdCBmb3IgdGhlIGRyYXcgc2lnbmFsIGZvciBkbWFidWYgYmxvYnMpCjUvNSBDaGVj
a2luZyBjb21taXQgMzMxMDVkZTI4YTUyICh2aXJ0aW8tZ3B1OiBBZGQgZ2xfZmx1c2hlZCBjYWxs
YmFjaykKPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTog
MQoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3Mv
MjAyMTA2MjExOTI0MjUuMTE4ODQ0Mi0xLXZpdmVrLmthc2lyZWRkeUBpbnRlbC5jb20vdGVzdGlu
Zy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGlj
YWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIg
ZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

