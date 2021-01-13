Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF822F5490
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 22:26:39 +0100 (CET)
Received: from localhost ([::1]:35986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kznf4-0005dM-NL
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 16:26:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kzne6-0004hN-OF; Wed, 13 Jan 2021 16:25:38 -0500
Resent-Date: Wed, 13 Jan 2021 16:25:38 -0500
Resent-Message-Id: <E1kzne6-0004hN-OF@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kzne2-0003H1-U5; Wed, 13 Jan 2021 16:25:38 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1610573123; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=OVbpWac0VKyMkPmLPSco0666gfV8D8GoHRazZFBhxW+lsORkvTTlF9QTuCO1OFHGbgLRHhleZATHWD1OFhkdrtT+e8381tJR3LToC1rxplkeQGfbrXJ4nygepXlLKNbnWtfXq3dwt7ERfS4RYwDxdUOkRPV4eqY0cZy7MlJ+3eQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1610573123;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=1g3z7vqm8ITIAO8C93cB08XUAV4+NWXo0MrLzCVZ4Mo=; 
 b=ZFggr7UisgLIoRGwVC55tuL8IiKeQmZR7gmOW3q7PmXbAmMgoZG8SanEoy81vf7pRShnKUtRZ1HApNeqFtG9KLbSmudEEjVMR4txXCSeh5PuxDPFkrSTy/MzfvQUuGJWLpwCKEetiGe36h1eOEg6xtmi/3WEjUYbqhanGuS9dls=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1610573120965593.1616514309517;
 Wed, 13 Jan 2021 13:25:20 -0800 (PST)
In-Reply-To: <20210113205221.32308-1-yaroshchuk2000@gmail.com>
Subject: Re: [PATCH] target/i386/hvf: add vmware-cpuid-freq cpu feature
Message-ID: <161057311959.25322.9932437473449579081@73fb1a5943b8>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: yaroshchuk2000@gmail.com
Date: Wed, 13 Jan 2021 13:25:20 -0800 (PST)
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
Cc: qemu-trivial@nongnu.org, r.bolshakov@yadro.com, qemu-devel@nongnu.org,
 yaroshchuk2000@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDExMzIwNTIyMS4zMjMw
OC0xLXlhcm9zaGNodWsyMDAwQGdtYWlsLmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0
byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgpt
b3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjEwMTEzMjA1MjIx
LjMyMzA4LTEteWFyb3NoY2h1azIwMDBAZ21haWwuY29tClN1YmplY3Q6IFtQQVRDSF0gdGFyZ2V0
L2kzODYvaHZmOiBhZGQgdm13YXJlLWNwdWlkLWZyZXEgY3B1IGZlYXR1cmUKCj09PSBURVNUIFND
UklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxs
IHx8IGV4aXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25m
aWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdv
cml0aG0gaGlzdG9ncmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4u
Cj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQx
ZGVmN2Y0NGJkODg4NzEzMzg0ClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKZjRmNmUy
OSB0YXJnZXQvaTM4Ni9odmY6IGFkZCB2bXdhcmUtY3B1aWQtZnJlcSBjcHUgZmVhdHVyZQoKPT09
IE9VVFBVVCBCRUdJTiA9PT0KV0FSTklORzogbGluZSBvdmVyIDgwIGNoYXJhY3RlcnMKIzUyOiBG
SUxFOiB0YXJnZXQvaTM4Ni9odmYvaHZmLmM6NDcxOgorICAgICAgICAvKiBmcHJpbnRmKHN0ZGVy
ciwgIiVzOiBzeXNjdGwgbWFjaGRlcC50c2MuZnJlcXVlbmN5IGVycm9yZWRcbiIsIF9fZnVuY19f
KTsgKi8KCkVSUk9SOiBzd2l0Y2ggYW5kIGNhc2Ugc2hvdWxkIGJlIGF0IHRoZSBzYW1lIGluZGVu
dAojMTI0OiBGSUxFOiB0YXJnZXQvaTM4Ni9odmYvaHZmLmM6NjcwOgorICAgIHN3aXRjaCAoaW5k
ZXgpIHsKKyAgICAgICAgY2FzZSAweDQwMDAwMDAwOgpbLi4uXQorICAgICAgICBjYXNlIDB4NDAw
MDAwMTA6ClsuLi5dCisgICAgICAgIGRlZmF1bHQ6CgpXQVJOSU5HOiBsaW5lIG92ZXIgODAgY2hh
cmFjdGVycwojMTI3OiBGSUxFOiB0YXJnZXQvaTM4Ni9odmYvaHZmLmM6NjczOgorICAgICAgICAg
ICAgKmVheCA9IDB4NDAwMDAwMTA7ICAgICAgICAgICAgICAgICAgICAgLyogTWF4IGF2YWlsYWJs
ZSBjcHVpZCBsZWFmICovCgp0b3RhbDogMSBlcnJvcnMsIDIgd2FybmluZ3MsIDEyMiBsaW5lcyBj
aGVja2VkCgpDb21taXQgZjRmNmUyOWM1ZDhjICh0YXJnZXQvaTM4Ni9odmY6IGFkZCB2bXdhcmUt
Y3B1aWQtZnJlcSBjcHUgZmVhdHVyZSkgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3
LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVt
IHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KPT09IE9V
VFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKClRoZSBmdWxs
IGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAyMTAxMTMyMDUy
MjEuMzIzMDgtMS15YXJvc2hjaHVrMjAwMEBnbWFpbC5jb20vdGVzdGluZy5jaGVja3BhdGNoLz90
eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3
IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0
Y2hldy1kZXZlbEByZWRoYXQuY29t

