Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 214FB318A5F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 13:26:24 +0100 (CET)
Received: from localhost ([::1]:47798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAB38-00022J-Mj
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 07:26:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lAB1j-00018H-Km; Thu, 11 Feb 2021 07:24:55 -0500
Resent-Date: Thu, 11 Feb 2021 07:24:55 -0500
Resent-Message-Id: <E1lAB1j-00018H-Km@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lAB1g-0002UR-UI; Thu, 11 Feb 2021 07:24:55 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1613046288; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=j3CNmyD1Gi0pDrVWDwdgG80uO93qpe0wPiTnUOSUddVcvuHCa24DJPfyxuzdh9q2Doca66gbxSrlbrRSAebwttiuO6w1ZcRrX/sFusefeaM4pYES6PaTndCOUA9znQK4lVmvVlM/ExaoQA5ZxEpdvJGdMKdni2ZOlgLYlj0mPWc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1613046288;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=43w0QTP1+6y4RDUpDC9OTwjYf5gXPOQn7ZtGy6rufZ8=; 
 b=UMgs6C3klOTQKnVKDhk0WlGDRWp+ZnIxs97bDMS/Y57Qo+ULjg/CM8Ke/H3WlMAI9eJA+rBlozkEVNYm1iWHwlid8rHScQKfKmuhJBTscaOlAxAiPV9yJk0NUfEH2evrN+rr/1v/u93ecj+/JcI8GZZeZpcYRywRrXS5Bek8Chg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 161304628474188.67714073728234;
 Thu, 11 Feb 2021 04:24:44 -0800 (PST)
In-Reply-To: <20210211122022.1811362-1-marcin.juszkiewicz@linaro.org>
Subject: Re: [PATCH] sbsa-ref: remove cortex-a53 from list of supported cpus
Message-ID: <161304628314.26113.9499404564443721717@c667a6b167f6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: marcin.juszkiewicz@linaro.org
Date: Thu, 11 Feb 2021 04:24:44 -0800 (PST)
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
Cc: peter.maydell@linaro.org, rad@semihalf.com, qemu-devel@nongnu.org,
 marcin.juszkiewicz@linaro.org, qemu-arm@nongnu.org, leif@nuviainc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDIxMTEyMjAyMi4xODEx
MzYyLTEtbWFyY2luLmp1c3praWV3aWN6QGxpbmFyby5vcmcvCgoKCkhpLAoKVGhpcyBzZXJpZXMg
c2VlbXMgdG8gaGF2ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxv
dyBmb3IKbW9yZSBpbmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIxMDIx
MTEyMjAyMi4xODExMzYyLTEtbWFyY2luLmp1c3praWV3aWN6QGxpbmFyby5vcmcKU3ViamVjdDog
W1BBVENIXSBzYnNhLXJlZjogcmVtb3ZlIGNvcnRleC1hNTMgZnJvbSBsaXN0IG9mIHN1cHBvcnRl
ZCBjcHVzCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFy
c2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVu
YW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZp
ZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQouL3NjcmlwdHMvY2hlY2twYXRjaC5w
bCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKVXBkYXRpbmcgM2M4
Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApGcm9tIGh0dHBzOi8vZ2l0aHVi
LmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdQogKiBbbmV3IHRhZ10gICAgICAgICBwYXRjaGV3LzIw
MjEwMjExMTIyMDIyLjE4MTEzNjItMS1tYXJjaW4uanVzemtpZXdpY3pAbGluYXJvLm9yZyAtPiBw
YXRjaGV3LzIwMjEwMjExMTIyMDIyLjE4MTEzNjItMS1tYXJjaW4uanVzemtpZXdpY3pAbGluYXJv
Lm9yZwpTd2l0Y2hlZCB0byBhIG5ldyBicmFuY2ggJ3Rlc3QnCjgxZWE3NWIgc2JzYS1yZWY6IHJl
bW92ZSBjb3J0ZXgtYTUzIGZyb20gbGlzdCBvZiBzdXBwb3J0ZWQgY3B1cwoKPT09IE9VVFBVVCBC
RUdJTiA9PT0KRVJST1I6IE1pc3NpbmcgU2lnbmVkLW9mZi1ieTogbGluZShzKQoKdG90YWw6IDEg
ZXJyb3JzLCAwIHdhcm5pbmdzLCA3IGxpbmVzIGNoZWNrZWQKCkNvbW1pdCA4MWVhNzViN2U4YmIg
KHNic2EtcmVmOiByZW1vdmUgY29ydGV4LWE1MyBmcm9tIGxpc3Qgb2Ygc3VwcG9ydGVkIGNwdXMp
IGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBvZiB0aGVzZSBlcnJv
cnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFpbnRhaW5lciwgc2Vl
CkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCj09PSBPVVRQVVQgRU5EID09PQoKVGVzdCBjb21t
YW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0
dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMjEwMjExMTIyMDIyLjE4MTEzNjItMS1tYXJjaW4uanVz
emtpZXdpY3pAbGluYXJvLm9yZy90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0t
CkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hl
dy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhh
dC5jb20=

