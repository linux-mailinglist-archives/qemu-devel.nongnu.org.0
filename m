Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CE02E874E
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 13:42:22 +0100 (CET)
Received: from localhost ([::1]:40238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvgEf-0004SQ-4h
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 07:42:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kvgCh-0003h6-7i
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 07:40:19 -0500
Resent-Date: Sat, 02 Jan 2021 07:40:19 -0500
Resent-Message-Id: <E1kvgCh-0003h6-7i@lists.gnu.org>
Received: from sender4-of-o57.zoho.com ([136.143.188.57]:21716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kvgCY-0004DQ-N0
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 07:40:18 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1609591188; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Eg2dH2Lf8WOxNNTKdGMOwJrThUvRfRPBPBru3Lebxj3RLeTIuTvcnVrlyVbQUvvs9Esu7SwDd+sTdheJ470KXqRsKiIhzsp8rMxFhfVryi0NCyB4dj3fw3fWrH0bxrLtnEaU2heRABsgmDrKlASPIhDCUNh+jEG5QFuJv+DwpZM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1609591188;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=s7WuLTAGr1YAffNbab/yNw+qqLEfq3qJ+W5aTBUjxjk=; 
 b=n4J6402yFps51MNrLufxQeLcqb1R6PNqFX4cY7B1wXMTiCpDeL69Soi7t3srZ3vJGxynwGY75XZ98oTkalUDg2H7HwGxu08PxWrjzoD2SdcUVDOnZZWVs8PdeVrmpW83cvjWW7eHF51yF1LhivqAKPnZiTW0LJpgy06YT8sxcuk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1609591185257181.97628727560402;
 Sat, 2 Jan 2021 04:39:45 -0800 (PST)
In-Reply-To: <20210102122101.39617-1-r.bolshakov@yadro.com>
Subject: Re: [PATCH] tcg: Fix execution on Apple Silicon
Message-ID: <160959118437.17786.1161434866718234364@600e7e483b3a>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: r.bolshakov@yadro.com
Date: Sat, 2 Jan 2021 04:39:45 -0800 (PST)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.57; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o57.zoho.com
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
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org, r.bolshakov@yadro.com,
 agraf@csgraf.de, j@getutm.app, stefanha@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDEwMjEyMjEwMS4zOTYx
Ny0xLXIuYm9sc2hha292QHlhZHJvLmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBo
YXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3Jl
IGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjEwMTAyMTIyMTAxLjM5
NjE3LTEtci5ib2xzaGFrb3ZAeWFkcm8uY29tClN1YmplY3Q6IFtQQVRDSF0gdGNnOiBGaXggZXhl
Y3V0aW9uIG9uIEFwcGxlIFNpbGljb24KCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmlu
L2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQgMApnaXQgY29uZmln
IC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFt
ZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFtCi4vc2Ny
aXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNUIFNDUklQVCBFTkQg
PT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0CkZy
b20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiAtIFt0YWcgdXBkYXRl
XSAgICAgIHBhdGNoZXcvMjAyMDEyMTUwNjQyMDAuMjg3NTEtMS1qaWF4dW4ueWFuZ0BmbHlnb2F0
LmNvbSAtPiBwYXRjaGV3LzIwMjAxMjE1MDY0MjAwLjI4NzUxLTEtamlheHVuLnlhbmdAZmx5Z29h
dC5jb20KIC0gW3RhZyB1cGRhdGVdICAgICAgcGF0Y2hldy8yMDIwMTIyNTIwMTk1Ni42OTI4NjEt
MS1yaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnIC0+IHBhdGNoZXcvMjAyMDEyMjUyMDE5NTYu
NjkyODYxLTEtcmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZwogKiBbbmV3IHRhZ10gICAgICAg
ICBwYXRjaGV3LzIwMjEwMTAyMTIyMTAxLjM5NjE3LTEtci5ib2xzaGFrb3ZAeWFkcm8uY29tIC0+
IHBhdGNoZXcvMjAyMTAxMDIxMjIxMDEuMzk2MTctMS1yLmJvbHNoYWtvdkB5YWRyby5jb20KU3dp
dGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0JwozMjg2YzdlIHRjZzogRml4IGV4ZWN1dGlvbiBv
biBBcHBsZSBTaWxpY29uCgo9PT0gT1VUUFVUIEJFR0lOID09PQpXQVJOSU5HOiBhcmNoaXRlY3R1
cmUgc3BlY2lmaWMgZGVmaW5lcyBzaG91bGQgYmUgYXZvaWRlZAojODA6IEZJTEU6IGFjY2VsL3Rj
Zy90cmFuc2xhdGUtYWxsLmM6MTA3NToKKyNpZiBkZWZpbmVkKF9fQVBQTEVfXykgJiYgZGVmaW5l
ZChfX2FhcmNoNjRfXykKCldBUk5JTkc6IGFyY2hpdGVjdHVyZSBzcGVjaWZpYyBkZWZpbmVzIHNo
b3VsZCBiZSBhdm9pZGVkCiMxMDE6IEZJTEU6IGFjY2VsL3RjZy90cmFuc2xhdGUtYWxsLmM6Mjcz
MToKKyNpZiBkZWZpbmVkKF9fQVBQTEVfXykgJiYgZGVmaW5lZChfX2FhcmNoNjRfXykKCkVSUk9S
OiBzcGFjZSByZXF1aXJlZCBiZWZvcmUgdGhlIG9wZW4gYnJhY2UgJ3snCiMxMDQ6IEZJTEU6IGFj
Y2VsL3RjZy90cmFuc2xhdGUtYWxsLmM6MjczNDoKKyAgICBpZiAocHRocmVhZF9qaXRfd3JpdGVf
cHJvdGVjdF9zdXBwb3J0ZWRfbnAoKSl7Cgp0b3RhbDogMSBlcnJvcnMsIDIgd2FybmluZ3MsIDEw
NCBsaW5lcyBjaGVja2VkCgpDb21taXQgMzI4NmM3ZTRhZWY5ICh0Y2c6IEZpeCBleGVjdXRpb24g
b24gQXBwbGUgU2lsaWNvbikgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYg
YW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRo
ZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KPT09IE9VVFBVVCBF
TkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKClRoZSBmdWxsIGxvZyBp
cyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAyMTAxMDIxMjIxMDEuMzk2
MTctMS1yLmJvbHNoYWtvdkB5YWRyby5jb20vdGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3Nh
Z2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczov
L3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZl
bEByZWRoYXQuY29t

