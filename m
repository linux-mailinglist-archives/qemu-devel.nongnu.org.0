Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3EB2B513A
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 20:33:46 +0100 (CET)
Received: from localhost ([::1]:56268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kekG1-0008SX-I9
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 14:33:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kejt4-0003Sk-Af
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 14:10:02 -0500
Resent-Date: Mon, 16 Nov 2020 14:10:02 -0500
Resent-Message-Id: <E1kejt4-0003Sk-Af@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kejt1-0001o7-DS
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 14:10:01 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1605553786; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=lsJVoCfz9KoSfD+4zFD7uhZvARh/Eb3zZ1xbI5XX7CXgybC8axJjIZvC6xMXa8DVzTxfwSQUzty9wDEP1ybIHEJuOVzsFKSRtviygk7142Iek7AHZY7y30PcHsUwx/UkZxNdTkCvgMg9TfqEiuHR0HrUksMqSohJ60SK/5bRZII=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1605553786;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=LTEk98C/YVIiZws4fAZh5iowfNN2mFmpByrARCLzLtI=; 
 b=kImzpogoaXDSbFgEwKUOfn4q41cnVS9/phrjS4l+naS9ZFzSW2ppEljyc6fOyxf3NJO56JjX61ZUs0j+Jc1hAQdE+vgYykbTSZC6vCdEkQ4e/cp5Ty/LvVxUnBl73bViOBLekwy6efysb562xkdS/seHw4RpV4z3Z7IVuwWeZRg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1605553783214579.4290026479174;
 Mon, 16 Nov 2020 11:09:43 -0800 (PST)
Subject: Re: [PATCH 0/3] scsi: infinite guest hangs with scsi-disk
Message-ID: <160555378198.21390.8082089215852279633@d9ec01ea6314>
In-Reply-To: <20201116183114.55703-1-hare@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: hare@suse.de
Date: Mon, 16 Nov 2020 11:09:43 -0800 (PST)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 14:09:55
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, hare@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMTExNjE4MzExNC41NTcw
My0xLWhhcmVAc3VzZS5kZS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUg
Y29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9ybWF0
aW9uOgoKTWVzc2FnZS1pZDogMjAyMDExMTYxODMxMTQuNTU3MDMtMS1oYXJlQHN1c2UuZGUKVHlw
ZTogc2VyaWVzClN1YmplY3Q6IFtQQVRDSCAwLzNdIHNjc2k6IGluZmluaXRlIGd1ZXN0IGhhbmdz
IHdpdGggc2NzaS1kaXNrCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCmdp
dCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNvbmZpZyAtLWxvY2Fs
IGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUK
Z2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQouL3NjcmlwdHMvY2hl
Y2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKVXBk
YXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApGcm9tIGh0dHBz
Oi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdQogLSBbdGFnIHVwZGF0ZV0gICAgICBw
YXRjaGV3LzIwMjAxMTE2MTA0NjE3LjE4MzMzLTEtcGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnIC0+
IHBhdGNoZXcvMjAyMDExMTYxMDQ2MTcuMTgzMzMtMS1wZXRlci5tYXlkZWxsQGxpbmFyby5vcmcK
IC0gW3RhZyB1cGRhdGVdICAgICAgcGF0Y2hldy8yMDIwMTExNjE2NTUwNi4zMTMxNS0xLWVwZXJl
em1hQHJlZGhhdC5jb20gLT4gcGF0Y2hldy8yMDIwMTExNjE2NTUwNi4zMTMxNS0xLWVwZXJlem1h
QHJlZGhhdC5jb20KICogW25ldyB0YWddICAgICAgICAgcGF0Y2hldy8yMDIwMTExNjE4MzExNC41
NTcwMy0xLWhhcmVAc3VzZS5kZSAtPiBwYXRjaGV3LzIwMjAxMTE2MTgzMTE0LjU1NzAzLTEtaGFy
ZUBzdXNlLmRlClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKMzUwYmNmMSBzY3NpOiBh
ZGQgdHJhY2luZyBmb3IgU0dfSU8gY29tbWFuZHMKN2VjZjViNiBzY3NpOiBtYWtlIGlvX3RpbWVv
dXQgY29uZmlndXJhYmxlCjQ1MGMwMDggdmlydGlvLXNjc2k6IHRyYWNlIGV2ZW50cwoKPT09IE9V
VFBVVCBCRUdJTiA9PT0KMS8zIENoZWNraW5nIGNvbW1pdCA0NTBjMDA4ODQzZTUgKHZpcnRpby1z
Y3NpOiB0cmFjZSBldmVudHMpCkVSUk9SOiB0cmFpbGluZyB3aGl0ZXNwYWNlCiMxMTY6IEZJTEU6
IGh3L3Njc2kvdmlydGlvLXNjc2kuYzo3OTc6CisgICAgICQKCnRvdGFsOiAxIGVycm9ycywgMCB3
YXJuaW5ncywgOTIgbGluZXMgY2hlY2tlZAoKUGF0Y2ggMS8zIGhhcyBzdHlsZSBwcm9ibGVtcywg
cGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZl
cyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRB
SU5FUlMuCgoyLzMgQ2hlY2tpbmcgY29tbWl0IDdlY2Y1YjYxMWE1YiAoc2NzaTogbWFrZSBpb190
aW1lb3V0IGNvbmZpZ3VyYWJsZSkKMy8zIENoZWNraW5nIGNvbW1pdCAzNTBiY2YxMjExNzggKHNj
c2k6IGFkZCB0cmFjaW5nIGZvciBTR19JTyBjb21tYW5kcykKPT09IE9VVFBVVCBFTkQgPT09CgpU
ZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFi
bGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAyMDExMTYxODMxMTQuNTU3MDMtMS1oYXJl
QHN1c2UuZGUvdGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5l
cmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBs
ZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

