Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 225A9320BEA
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 18:03:25 +0100 (CET)
Received: from localhost ([::1]:59070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDs8h-0002uk-BI
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 12:03:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lDs3U-0001H7-NR; Sun, 21 Feb 2021 11:58:01 -0500
Resent-Date: Sun, 21 Feb 2021 11:58:00 -0500
Resent-Message-Id: <E1lDs3U-0001H7-NR@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lDs3S-0008SP-Lp; Sun, 21 Feb 2021 11:58:00 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1613926668; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=SyicYV4OIxERQ7FuVydaca5fv6PA0HhXSYZfp+zoKsJ/1AcBl1lBjC/lNLAi48X/oXmyNQvIR5xZVcs00zhke4Icav9i36ySgyh54s64LekgZronfWapwIV5jgjMwVp56ZCi8+I7uXSSU9uiuImJ9CjLy0wnb0bNllkRF8nqLMY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1613926668;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=wVq8BlhMLtTVsuMgLrpKwsHUIJ5zAjanFoVIw9YAvYA=; 
 b=lC71q8RITKjri6EPT6/q5Ty5oN4BxBaFsrE5bnQnvaActWpLJcbh/PFtJXCpNd4bHei08+Smf28bq4vF7yolrRzVMxVrnZw9OV6OxnKjd8kianpBngiOeHyCx1KtBy7BwJziSkl201mUXsj/cOCVpvkBUNMeUeN8HGmEcsKHuNE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1613926665639952.625148546582;
 Sun, 21 Feb 2021 08:57:45 -0800 (PST)
In-Reply-To: <20210221165219.12744-1-zpmarvel@gmail.com>
Subject: Re: [PATCH] ui/gtk: vte: fix sending multiple characeters
Message-ID: <161392666438.21706.4757518764617915041@c667a6b167f6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: zpmarvel@gmail.com
Date: Sun, 21 Feb 2021 08:57:45 -0800 (PST)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, zpmarvel@gmail.com, qemu-devel@nongnu.org,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDIyMTE2NTIxOS4xMjc0
NC0xLXpwbWFydmVsQGdtYWlsLmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZl
IHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3JlIGlu
Zm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjEwMjIxMTY1MjE5LjEyNzQ0
LTEtenBtYXJ2ZWxAZ21haWwuY29tClN1YmplY3Q6IFtQQVRDSF0gdWkvZ3RrOiB2dGU6IGZpeCBz
ZW5kaW5nIG11bHRpcGxlIGNoYXJhY2V0ZXJzCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMh
L2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNv
bmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5y
ZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQou
L3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQg
RU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4
NApGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdQogKiBbbmV3IHRh
Z10gICAgICAgICBwYXRjaGV3LzIwMjEwMjIxMTY1MjE5LjEyNzQ0LTEtenBtYXJ2ZWxAZ21haWwu
Y29tIC0+IHBhdGNoZXcvMjAyMTAyMjExNjUyMTkuMTI3NDQtMS16cG1hcnZlbEBnbWFpbC5jb20K
U3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0JwowMzNlM2RlIHVpL2d0azogdnRlOiBmaXgg
c2VuZGluZyBtdWx0aXBsZSBjaGFyYWNldGVycwoKPT09IE9VVFBVVCBCRUdJTiA9PT0KRVJST1I6
ICIoZm9vKikiIHNob3VsZCBiZSAiKGZvbyAqKSIKIzMyOiBGSUxFOiB1aS9ndGsuYzoxNzkwOgor
ICAgIHVpbnQ4X3QqIHAgPSAodWludDhfdCopdGV4dDsKCnRvdGFsOiAxIGVycm9ycywgMCB3YXJu
aW5ncywgMTcgbGluZXMgY2hlY2tlZAoKQ29tbWl0IDAzM2UzZGUzNzlhNyAodWkvZ3RrOiB2dGU6
IGZpeCBzZW5kaW5nIG11bHRpcGxlIGNoYXJhY2V0ZXJzKSBoYXMgc3R5bGUgcHJvYmxlbXMsIHBs
ZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMg
cmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlO
RVJTLgo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29tbWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAx
CgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8y
MDIxMDIyMTE2NTIxOS4xMjc0NC0xLXpwbWFydmVsQGdtYWlsLmNvbS90ZXN0aW5nLmNoZWNrcGF0
Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBh
dGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0
byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

