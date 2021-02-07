Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE6C3120CF
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Feb 2021 03:05:40 +0100 (CET)
Received: from localhost ([::1]:46990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8ZSE-0007WG-Vn
	for lists+qemu-devel@lfdr.de; Sat, 06 Feb 2021 21:05:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1l8ZQe-00074Z-5i
 for qemu-devel@nongnu.org; Sat, 06 Feb 2021 21:04:00 -0500
Resent-Date: Sat, 06 Feb 2021 21:04:00 -0500
Resent-Message-Id: <E1l8ZQe-00074Z-5i@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1l8ZQb-0004lj-Bd
 for qemu-devel@nongnu.org; Sat, 06 Feb 2021 21:03:59 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1612663427; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=JrioPH/xFjy9jWVr0k6mSYW9yNSemUh5ZBgH/+X9944qtZjl/o3BMVC5yRCjTFKfPebS9s/CfjzEkGQCpXVqevJJ9xf2H/mMYkG0mqoTgnXeUeqSsiymi0PSISbAm+5PKVRtVtcmpS6QnZ2nbRZO7V8oQ1nWGOv9Gi6VpGlTKHY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1612663427;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=A/MO61us9ifc/uAJc2fjbo2IPQ1p938KpVVjokGfDf0=; 
 b=K+WPuIVYvLH6XLEoSL1dPFGNDCzkxEjeM3EtnpY4Ratu6hcr8ZIyjXoUXfeLynhDCPWY7+yxiK1elHr1FNGvO1OXd1bTrADDgnrbjn8F+5/vihS80MYkcesFMIkqDuUs5ivEw1lVoprCTI+2EvHf/aJUODPpAJ3OTtt5bXmEDnw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1612663424750405.12886257688467;
 Sat, 6 Feb 2021 18:03:44 -0800 (PST)
In-Reply-To: <20210206232058.4209-1-elias-djossou.git@gmx.de>
Subject: Re: [PATCH] Expose i386 model specific registers via HMP
Message-ID: <161266342313.16607.2283847848949057977@c667a6b167f6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: elias-djossou.git@gmx.de
Date: Sat, 6 Feb 2021 18:03:44 -0800 (PST)
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
Cc: ehabkost@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 dgilbert@redhat.com, elias-djossou.git@gmx.de, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDIwNjIzMjA1OC40MjA5
LTEtZWxpYXMtZGpvc3NvdS5naXRAZ214LmRlLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRv
IGhhdmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1v
cmUgaW5mb3JtYXRpb246CgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAyMTAyMDYyMzIwNTgu
NDIwOS0xLWVsaWFzLWRqb3Nzb3UuZ2l0QGdteC5kZQpTdWJqZWN0OiBbUEFUQ0hdIEV4cG9zZSBp
Mzg2IG1vZGVsIHNwZWNpZmljIHJlZ2lzdGVycyB2aWEgSE1QCgo9PT0gVEVTVCBTQ1JJUFQgQkVH
SU4gPT09CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0
IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9j
YWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhp
c3RvZ3JhbQouL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVT
VCBTQ1JJUFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRi
ZDg4ODcxMzM4NApGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdQog
KiBbbmV3IHRhZ10gICAgICAgICBwYXRjaGV3LzIwMjEwMjA2MjMyMDU4LjQyMDktMS1lbGlhcy1k
am9zc291LmdpdEBnbXguZGUgLT4gcGF0Y2hldy8yMDIxMDIwNjIzMjA1OC40MjA5LTEtZWxpYXMt
ZGpvc3NvdS5naXRAZ214LmRlClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAndGVzdCcKMTEwZDZi
ZSBFeHBvc2UgaTM4NiBtb2RlbCBzcGVjaWZpYyByZWdpc3RlcnMgdmlhIEhNUAoKPT09IE9VVFBV
VCBCRUdJTiA9PT0KRVJST1I6IE1pc3NpbmcgU2lnbmVkLW9mZi1ieTogbGluZShzKQoKdG90YWw6
IDEgZXJyb3JzLCAwIHdhcm5pbmdzLCA4MiBsaW5lcyBjaGVja2VkCgpDb21taXQgMTEwZDZiZTI0
MDA1IChFeHBvc2UgaTM4NiBtb2RlbCBzcGVjaWZpYyByZWdpc3RlcnMgdmlhIEhNUCkgaGFzIHN0
eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUg
ZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQ
QVRDSCBpbiBNQUlOVEFJTkVSUy4KPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhp
dGVkIHdpdGggY29kZTogMQoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3Bh
dGNoZXcub3JnL2xvZ3MvMjAyMTAyMDYyMzIwNTguNDIwOS0xLWVsaWFzLWRqb3Nzb3UuZ2l0QGdt
eC5kZS90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRl
ZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNl
IHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

