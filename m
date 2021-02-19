Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE6731F79E
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 11:53:28 +0100 (CET)
Received: from localhost ([::1]:47652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD3Pb-0004UU-8Q
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 05:53:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lD3OF-0003uT-Kg
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 05:52:03 -0500
Resent-Date: Fri, 19 Feb 2021 05:52:03 -0500
Resent-Message-Id: <E1lD3OF-0003uT-Kg@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lD3OB-00043R-Dz
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 05:52:02 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1613731907; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=LeaA4ZLyM29L4bNdx0KjuIA8TyyLI9tTVtuoBcZGKb4NR5R4nXwbSoXURMLlA1MG/Uojdu+r1j201L84/KCe106VnJmpK25sptQEAmU9ZPk4tnUR7K1ZTcKw5hHzrVZK+wXeay64GH6svaQw/MTAgasHRSIjYP1NSBNo8Z8uvmg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1613731907;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=10xgMw5b0SZrhMyN1fM4lYo9jzi7SFzKMT4kpWoXL80=; 
 b=IeSExGBtJPRav+z3BBh73rppikxhi2XGgbQ3VsMNBI8Hb50ibwhgp20XVHN3xfaQWmwNXAMIMIh8nl4oqnfgxflJmu6dhlaDZz6nmZRp1NFOYd/KuqbxXtTmc81B/dijNxhKRy5P3p/UpNWKgP2fNbM6fTNx12GtwarBnLQceNY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1613731905336104.61105292387117;
 Fri, 19 Feb 2021 02:51:45 -0800 (PST)
In-Reply-To: <20210219104548.4675-1-stefans@axis.com>
Subject: Re: [PATCH v3] Correct CRIS TCG register lifetime management
Message-ID: <161373190421.28087.10757638169318408155@c667a6b167f6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: stefans@axis.com
Date: Fri, 19 Feb 2021 02:51:45 -0800 (PST)
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
Cc: edgar.iglesias@gmail.com, qemu-devel@nongnu.org, stefans@axis.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDIxOTEwNDU0OC40Njc1
LTEtc3RlZmFuc0BheGlzLmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNv
bWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGluZm9y
bWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjEwMjE5MTA0NTQ4LjQ2NzUtMS1z
dGVmYW5zQGF4aXMuY29tClN1YmplY3Q6IFtQQVRDSCB2M10gQ29ycmVjdCBDUklTIFRDRyByZWdp
c3RlciBsaWZldGltZSBtYW5hZ2VtZW50Cgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jp
bi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNvbmZp
ZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5h
bWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQouL3Nj
cmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQgRU5E
ID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApG
cm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdQogKiBbbmV3IHRhZ10g
ICAgICAgICBwYXRjaGV3LzIwMjEwMjE5MTA0NTQ4LjQ2NzUtMS1zdGVmYW5zQGF4aXMuY29tIC0+
IHBhdGNoZXcvMjAyMTAyMTkxMDQ1NDguNDY3NS0xLXN0ZWZhbnNAYXhpcy5jb20KU3dpdGNoZWQg
dG8gYSBuZXcgYnJhbmNoICd0ZXN0JwpkZTAzNGI1IENvcnJlY3QgQ1JJUyBUQ0cgcmVnaXN0ZXIg
bGlmZXRpbWUgbWFuYWdlbWVudAoKPT09IE9VVFBVVCBCRUdJTiA9PT0KRVJST1I6IE1pc3Npbmcg
U2lnbmVkLW9mZi1ieTogbGluZShzKQoKdG90YWw6IDEgZXJyb3JzLCAwIHdhcm5pbmdzLCA1OTYg
bGluZXMgY2hlY2tlZAoKQ29tbWl0IGRlMDM0YjVjZWQ0MiAoQ29ycmVjdCBDUklTIFRDRyByZWdp
c3RlciBsaWZldGltZSBtYW5hZ2VtZW50KSBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZp
ZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRo
ZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgo9PT0g
T1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAxCgoKVGhlIGZ1
bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIxMDIxOTEw
NDU0OC40Njc1LTEtc3RlZmFuc0BheGlzLmNvbS90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVz
c2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBz
Oi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRl
dmVsQHJlZGhhdC5jb20=

