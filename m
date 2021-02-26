Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2949B325F9E
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 10:06:12 +0100 (CET)
Received: from localhost ([::1]:36676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFZ4c-00034R-UN
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 04:06:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lFZ2k-0002DW-Uq; Fri, 26 Feb 2021 04:04:15 -0500
Resent-Date: Fri, 26 Feb 2021 04:04:14 -0500
Resent-Message-Id: <E1lFZ2k-0002DW-Uq@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lFZ2f-0003iU-Mi; Fri, 26 Feb 2021 04:04:14 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1614330229; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=js3wHQetd50ily9Ulq0P6RB7g9OdIIeulvsu4J2ClurL9oXS1YCz/Mk5vfA774FMCVmCi3jUN+TeyPTDgq+SqCulUcki0SMK+Uf3iMOA9G482ZWM6L8dkkRHhVu98ip4lXlkOquQ8ilIlSKsORg25gFft/xS5uwu19B6lWjSPBI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1614330229;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=eCoRiICaMqO/vATK4Lm5RtZ3bGlqQLfewwZOPX3ZIAo=; 
 b=Uug+Z3GmdvZjHkbvS1oHcXF2bB68sHB8gLse2mdI+gjmfkOF+rOEJjCraLIHRfORFZIWmuzr6NckFvfypFvh8QHmIgoNYvRHm59mWjfyo0KP9h87e4Y9D8xP/IrIlpivNW3FpcaaG+p5tUYUd9s2uEDFSB15hOZQyHLIzlNdSw4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1614330225907131.2715488450459;
 Fri, 26 Feb 2021 01:03:45 -0800 (PST)
In-Reply-To: <1614329353-2124-1-git-send-email-wangxingang5@huawei.com>
Subject: Re: [RFC PATCH 0/4] hw/arm/virt-acpi-build: Introduce iommu option
 for pci root bus
Message-ID: <161433022414.1906.2184533161794400748@c667a6b167f6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: wangxingang5@huawei.com
Date: Fri, 26 Feb 2021 01:03:45 -0800 (PST)
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
Cc: xieyingtai@huawei.com, peter.maydell@linaro.org, cenjiahui@huawei.com,
 wangxingang5@huawei.com, mst@redhat.com, qemu-devel@nongnu.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8xNjE0MzI5MzUzLTIxMjQtMS1n
aXQtc2VuZC1lbWFpbC13YW5neGluZ2FuZzVAaHVhd2VpLmNvbS8KCgoKSGksCgpUaGlzIHNlcmll
cyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJl
bG93IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDE2MTQz
MjkzNTMtMjEyNC0xLWdpdC1zZW5kLWVtYWlsLXdhbmd4aW5nYW5nNUBodWF3ZWkuY29tClN1Ympl
Y3Q6IFtSRkMgUEFUQ0ggMC80XSBody9hcm0vdmlydC1hY3BpLWJ1aWxkOiBJbnRyb2R1Y2UgaW9t
bXUgb3B0aW9uIGZvciBwY2kgcm9vdCBidXMKCj09PSBURVNUIFNDUklQVCBCRUdJTiA9PT0KIyEv
YmluL2Jhc2gKZ2l0IHJldi1wYXJzZSBiYXNlID4gL2Rldi9udWxsIHx8IGV4aXQgMApnaXQgY29u
ZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJl
bmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdvcml0aG0gaGlzdG9ncmFtCi4v
c2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4uCj09PSBURVNUIFNDUklQVCBF
TkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQxZGVmN2Y0NGJkODg4NzEzMzg0
CkZyb20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVjdC9xZW11CiAqIFtuZXcgdGFn
XSAgICAgICAgIHBhdGNoZXcvMTYxNDMyOTM1My0yMTI0LTEtZ2l0LXNlbmQtZW1haWwtd2FuZ3hp
bmdhbmc1QGh1YXdlaS5jb20gLT4gcGF0Y2hldy8xNjE0MzI5MzUzLTIxMjQtMS1naXQtc2VuZC1l
bWFpbC13YW5neGluZ2FuZzVAaHVhd2VpLmNvbQpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rl
c3QnCmJhZWQwYjEgaHcvYXJtL3ZpcnQtYWNwaS1idWlsZDogQWRkIGV4cGxpY2l0IGlkbWFwIGlu
Zm8gaW4gSU9SVCB0YWJsZQpiZjcwODMyIGh3L3BjaTogQWRkIHBjaV9yb290X2J1c19tYXhfYnVz
CmRkZmIwY2MgaHcvcGNpOiBBZGQgaW9tbXUgb3B0aW9uIGZvciBwY2kgcm9vdCBidXMKYWIzMTdk
ZiBwY2k6IEFkZCBQQ0lfQlVTX0lPTU1VIHByb3BlcnR5Cgo9PT0gT1VUUFVUIEJFR0lOID09PQox
LzQgQ2hlY2tpbmcgY29tbWl0IGFiMzE3ZGZmM2I3NiAocGNpOiBBZGQgUENJX0JVU19JT01NVSBw
cm9wZXJ0eSkKMi80IENoZWNraW5nIGNvbW1pdCBkZGZiMGNjYmVkOGIgKGh3L3BjaTogQWRkIGlv
bW11IG9wdGlvbiBmb3IgcGNpIHJvb3QgYnVzKQpFUlJPUjogc3VzcGVjdCBjb2RlIGluZGVudCBm
b3IgY29uZGl0aW9uYWwgc3RhdGVtZW50cyAoNCwgNykKIzEwNTogRklMRTogaHcvcGNpLWJyaWRn
ZS9wY2lfZXhwYW5kZXJfYnJpZGdlLmM6MjU4OgorICAgIGlmIChweGItPmlvbW11KSB7CisgICAg
ICAgYnVzLT5mbGFncyB8PSBQQ0lfQlVTX0lPTU1VOwoKdG90YWw6IDEgZXJyb3JzLCAwIHdhcm5p
bmdzLCA5OCBsaW5lcyBjaGVja2VkCgpQYXRjaCAyLzQgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVh
c2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJl
cG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVS
Uy4KCjMvNCBDaGVja2luZyBjb21taXQgYmY3MDgzMmY0NzQyIChody9wY2k6IEFkZCBwY2lfcm9v
dF9idXNfbWF4X2J1cykKNC80IENoZWNraW5nIGNvbW1pdCBiYWVkMGIxNzljY2MgKGh3L2FybS92
aXJ0LWFjcGktYnVpbGQ6IEFkZCBleHBsaWNpdCBpZG1hcCBpbmZvIGluIElPUlQgdGFibGUpCkVS
Uk9SOiB0cmFpbGluZyBzdGF0ZW1lbnRzIHNob3VsZCBiZSBvbiBuZXh0IGxpbmUKIzUyOiBGSUxF
OiBody9hcm0vdmlydC1hY3BpLWJ1aWxkLmM6MjY5OgorICAgICAgICBpZiAoIXBjaV9idXNfaXNf
cm9vdChidXMpKSBjb250aW51ZTsKCkVSUk9SOiBicmFjZXMge30gYXJlIG5lY2Vzc2FyeSBmb3Ig
YWxsIGFybXMgb2YgdGhpcyBzdGF0ZW1lbnQKIzUyOiBGSUxFOiBody9hcm0vdmlydC1hY3BpLWJ1
aWxkLmM6MjY5OgorICAgICAgICBpZiAoIXBjaV9idXNfaXNfcm9vdChidXMpKSBjb250aW51ZTsK
Wy4uLl0KCkVSUk9SOiB0cmFpbGluZyBzdGF0ZW1lbnRzIHNob3VsZCBiZSBvbiBuZXh0IGxpbmUK
Izk2OiBGSUxFOiBody9hcm0vdmlydC1hY3BpLWJ1aWxkLmM6MzI4OgorICAgICAgICAgICAgaWYg
KCFwY2lfYnVzX2hhc19pb21tdShidXMpKSBjb250aW51ZTsKCkVSUk9SOiBicmFjZXMge30gYXJl
IG5lY2Vzc2FyeSBmb3IgYWxsIGFybXMgb2YgdGhpcyBzdGF0ZW1lbnQKIzk2OiBGSUxFOiBody9h
cm0vdmlydC1hY3BpLWJ1aWxkLmM6MzI4OgorICAgICAgICAgICAgaWYgKCFwY2lfYnVzX2hhc19p
b21tdShidXMpKSBjb250aW51ZTsKWy4uLl0KCnRvdGFsOiA0IGVycm9ycywgMCB3YXJuaW5ncywg
MTM5IGxpbmVzIGNoZWNrZWQKClBhdGNoIDQvNCBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSBy
ZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0
IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgoK
PT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKClRo
ZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMTYxNDMy
OTM1My0yMTI0LTEtZ2l0LXNlbmQtZW1haWwtd2FuZ3hpbmdhbmc1QGh1YXdlaS5jb20vdGVzdGlu
Zy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGlj
YWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIg
ZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

