Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CEE34FAB7
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 09:50:18 +0200 (CEST)
Received: from localhost ([::1]:42978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRVcH-0000I5-6U
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 03:50:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lRVbH-0008JC-Gw; Wed, 31 Mar 2021 03:49:15 -0400
Resent-Date: Wed, 31 Mar 2021 03:49:15 -0400
Resent-Message-Id: <E1lRVbH-0008JC-Gw@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lRVbF-0001en-D8; Wed, 31 Mar 2021 03:49:15 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1617176929; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=FVfvTGHCzteFKzIK37O/Gd9rYh17fJnLnJBEDeo1bLUexoXkX4c/CtVmx/Zh2mHfuFFuEVNLKyc4SddcSP5hISxIRyeERw8Wj+S/o5Xdpv5uzJH1tMW3h9bzr0drDQxV/SR/x2/YmvATgBDtReIdJD2dYsnm8EFF7ROFUbb8gqw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1617176929;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=YE+QYSpJ6HnTaErdpXTpGLXc+2XD0C1Vz84yXnuzVg4=; 
 b=FqGwY5Lbrnx6r+UZFXv7AIDdzw/ITaf67ZdoSxxPsdBEQNrBX1GKTKen1e1w3MIFg2vdhO9/Bp+PabX8plOrxPlWObag5KBbrrzoRXi1g5J3FSaKVIZZKyguslrqQ6llWFCjlVQ32n+RyMYCbmFkmgssuONhzN8Yu1UjxuDdouk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1617176926717379.8522500416352;
 Wed, 31 Mar 2021 00:48:46 -0700 (PDT)
In-Reply-To: <20210331073233.11198-1-anaidu.gollu@samsung.com>
Subject: Re: [PATCH] hw/block/nvme: add device self test command support
Message-ID: <161717692523.402.15492307678752067290@72b6d80f974b>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: anaidu.gollu@samsung.com
Date: Wed, 31 Mar 2021 00:48:46 -0700 (PDT)
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org,
 anaidu.gollu@samsung.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 kbusch@kernel.org, stefanha@redhat.com, its@irrelevant.dk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDMzMTA3MzIzMy4xMTE5
OC0xLWFuYWlkdS5nb2xsdUBzYW1zdW5nLmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0
byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgpt
b3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjEwMzMxMDczMjMz
LjExMTk4LTEtYW5haWR1LmdvbGx1QHNhbXN1bmcuY29tClN1YmplY3Q6IFtQQVRDSF0gaHcvYmxv
Y2svbnZtZTogYWRkIGRldmljZSBzZWxmIHRlc3QgY29tbWFuZCBzdXBwb3J0Cgo9PT0gVEVTVCBT
Q1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVs
bCB8fCBleGl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29u
ZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxn
b3JpdGhtIGhpc3RvZ3JhbQouL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2Uu
Lgo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRk
MWRlZjdmNDRiZDg4ODcxMzM4NApGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2pl
Y3QvcWVtdQogKiBbbmV3IHRhZ10gICAgICAgICBwYXRjaGV3LzIwMjEwMzMxMDczMjMzLjExMTk4
LTEtYW5haWR1LmdvbGx1QHNhbXN1bmcuY29tIC0+IHBhdGNoZXcvMjAyMTAzMzEwNzMyMzMuMTEx
OTgtMS1hbmFpZHUuZ29sbHVAc2Ftc3VuZy5jb20KU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0
ZXN0JwpkMmY0MDFkIGh3L2Jsb2NrL252bWU6IGFkZCBkZXZpY2Ugc2VsZiB0ZXN0IGNvbW1hbmQg
c3VwcG9ydAoKPT09IE9VVFBVVCBCRUdJTiA9PT0KRVJST1I6IG5hbWVkIFFUQUlMUV9IRUFEIHNo
b3VsZCBiZSB0eXBlZGVmZWQgc2VwYXJhdGVseQojMjEwOiBGSUxFOiBody9ibG9jay9udm1lLmg6
MTY1OgorICAgIFFUQUlMUV9IRUFEKGRzdF9saXN0LCBOdm1lRHN0RW50cnkpICBkc3RfbGlzdDsK
CnRvdGFsOiAxIGVycm9ycywgMCB3YXJuaW5ncywgMjgyIGxpbmVzIGNoZWNrZWQKCkNvbW1pdCBk
MmY0MDFkYWRhZmUgKGh3L2Jsb2NrL252bWU6IGFkZCBkZXZpY2Ugc2VsZiB0ZXN0IGNvbW1hbmQg
c3VwcG9ydCkgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRo
ZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFp
bmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KPT09IE9VVFBVVCBFTkQgPT09CgpU
ZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFi
bGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAyMTAzMzEwNzMyMzMuMTExOTgtMS1hbmFp
ZHUuZ29sbHVAc2Ftc3VuZy5jb20vdGVzdGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0t
LQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNo
ZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRo
YXQuY29t

