Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67076303742
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 08:21:46 +0100 (CET)
Received: from localhost ([::1]:57264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4IfZ-0005Oy-6f
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 02:21:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1l4Ics-00049y-Vs
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 02:18:59 -0500
Resent-Date: Tue, 26 Jan 2021 02:18:58 -0500
Resent-Message-Id: <E1l4Ics-00049y-Vs@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1l4Icp-0002Ia-7e
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 02:18:58 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1611645526; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=D5vWGEFhnbSN8bbqXZr9pcF9G/ySQelujn1aj/d3uUht9VkUXO0vfK868yVTegYx2LqA3S6TFYdhXCx4byNIp36ePnLMi1z2IQ5XtzmjA7dc9Va8LJ29NHVdSgOdmRUdpr7KENXnHDDjIzk1eeQjfp47sQ5kAhDeervHRCpgudY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1611645526;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=ov2LZF6eepgX8hIP1JUALomon3czO2LaSh9BIhNhPLc=; 
 b=dPb8FaVJMomCxmrTN26v/Eq5Wiyz8NMPUd8MUE2ivSYk7Sw9kcDEkSEqA2vBg/7EvlE3pxC19IJ6pgaqp2ZstmZo/IP5gvMAkf3t7P09ZsjvCC7E3y7XGNmRZSLaMgmkUAtJX3v7x0zMMym8ATH1oxdOsoq6lHKfNSRMTp6GFk8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1611645525032536.1908988430786;
 Mon, 25 Jan 2021 23:18:45 -0800 (PST)
In-Reply-To: <20210126070351.28575-1-lulu@redhat.com>
Subject: Re: [PATCH v2 0/5] vhost-vdpa: add support for configure interrupt
Message-ID: <161164552382.3795.2077064608459871869@c667a6b167f6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: lulu@redhat.com
Date: Mon, 25 Jan 2021 23:18:45 -0800 (PST)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_SBL=1.623 autolearn=no autolearn_force=no
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
Cc: jasowang@redhat.com, qemu-devel@nongnu.org, lulu@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDEyNjA3MDM1MS4yODU3
NS0xLWx1bHVAcmVkaGF0LmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNv
bWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9y
bWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjEwMTI2MDcwMzUxLjI4NTc1LTEt
bHVsdUByZWRoYXQuY29tClN1YmplY3Q6IFtQQVRDSCB2MiAwLzVdIHZob3N0LXZkcGE6IGFkZCBz
dXBwb3J0IGZvciBjb25maWd1cmUgaW50ZXJydXB0Cgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09
CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0
IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlm
Zi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3Jh
bQouL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJ
UFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcx
MzM4NApGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdQogKiBbbmV3
IHRhZ10gICAgICAgICBwYXRjaGV3LzIwMjEwMTI2MDcwMzUxLjI4NTc1LTEtbHVsdUByZWRoYXQu
Y29tIC0+IHBhdGNoZXcvMjAyMTAxMjYwNzAzNTEuMjg1NzUtMS1sdWx1QHJlZGhhdC5jb20KU3dp
dGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0JwphZDg5NDg1IHZob3N0LXZkcGE6IGFkZCBjYWxs
YmFjayBmdW5jdGlvbiBmb3IgY29uZmlndXJlIGludGVycnVwdAo1NDE4ZWJlIHZpcnRpby1tbWlv
OiBhZGQgc3VwcG9ydCBmb3IgY29uZmlndXJlIGludGVycnVwdAoyNTU1NGI5IHZpcnRpby1wY2k6
IGFkZCBzdXBwb3J0IGZvciBjb25maWd1cmUgaW50ZXJydXB0CjcxODFkNWEgdmhvc3RfbmV0OiBl
bmFibGUgY29uZmlndXJlIGludGVycnVwdCB3aGVuIHZob3N0X25ldCBzdGFydAo4OTEyMDk3IHZp
cnRpbzogYWRkIHN1cHBvcnQgZm9yIGNvbmZpZ3VyZSBpbnRlcnJ1cHQKCj09PSBPVVRQVVQgQkVH
SU4gPT09CjEvNSBDaGVja2luZyBjb21taXQgODkxMjA5N2I3MTM5ICh2aXJ0aW86IGFkZCBzdXBw
b3J0IGZvciBjb25maWd1cmUgaW50ZXJydXB0KQoyLzUgQ2hlY2tpbmcgY29tbWl0IDcxODFkNWFi
ZTIyZiAodmhvc3RfbmV0OiBlbmFibGUgY29uZmlndXJlIGludGVycnVwdCB3aGVuIHZob3N0X25l
dCBzdGFydCkKMy81IENoZWNraW5nIGNvbW1pdCAyNTU1NGI5ZmE3M2EgKHZpcnRpby1wY2k6IGFk
ZCBzdXBwb3J0IGZvciBjb25maWd1cmUgaW50ZXJydXB0KQo0LzUgQ2hlY2tpbmcgY29tbWl0IDU0
MThlYmVlOTY5NiAodmlydGlvLW1taW86IGFkZCBzdXBwb3J0IGZvciBjb25maWd1cmUgaW50ZXJy
dXB0KQo1LzUgQ2hlY2tpbmcgY29tbWl0IGFkODk0ODVhMDk2YSAodmhvc3QtdmRwYTogYWRkIGNh
bGxiYWNrIGZ1bmN0aW9uIGZvciBjb25maWd1cmUgaW50ZXJydXB0KQpFUlJPUjogc3BhY2UgcmVx
dWlyZWQgYmVmb3JlIHRoZSBvcGVuIGJyYWNlICd7JwojNTk6IEZJTEU6IGh3L3ZpcnRpby92aG9z
dC12ZHBhLmM6NDg4OgorICAgIGlmICgodmRldi0+dXNlX2NvbmZpZ19ub3RpZmllcikgJiYgKHN0
YXJ0KSl7Cgp0b3RhbDogMSBlcnJvcnMsIDAgd2FybmluZ3MsIDkwIGxpbmVzIGNoZWNrZWQKClBh
dGNoIDUvNSBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhl
c2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWlu
ZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgoKPT09IE9VVFBVVCBFTkQgPT09CgpU
ZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFi
bGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAyMTAxMjYwNzAzNTEuMjg1NzUtMS1sdWx1
QHJlZGhhdC5jb20vdGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBn
ZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10u
ClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

