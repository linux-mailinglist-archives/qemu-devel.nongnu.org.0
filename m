Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BCB2D2AB7
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 13:28:28 +0100 (CET)
Received: from localhost ([::1]:43516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmc6W-0003B6-1E
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 07:28:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kmc36-0000YV-Py
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 07:24:56 -0500
Resent-Date: Tue, 08 Dec 2020 07:24:56 -0500
Resent-Message-Id: <E1kmc36-0000YV-Py@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kmc32-0006E0-Ul
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 07:24:56 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1607430284; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=enSXYEv0LGDQCu02S4Tl/D7AFAIqJa4m7r8jGJpEzrYWzPk2+E2TDq5IOZ2JXGQsaS1DIYXxONcm2P3uycA2m1yNtxNeuuUbtc6VLaM/rFLS/Ti0cy6zAnCJvpzEQoRJnyCOSZ57gnV4FX2GMG0Nt0sw9N7EEMzyWplURnCTSIg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1607430284;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=evl7WLwXeiNa/7bag2CHU35yqDZ8QByFLFcdjVj8SCg=; 
 b=cIGdiSWJHhtkPdsFgAjQyivznKCb2KQWpkG/GkyIpmKbXbWY0p/YLrV2xMERLc59zfGj/60tearOkVCukqZtOef5z718VoqRxShv7Dzg9Flcjq4t1GCpXjHKc359/cw4L4QtgwqGtgjPL0bs87mU6cQ90Q5CFD2aYpTm9q1ga+8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1607430281790637.167849569087;
 Tue, 8 Dec 2020 04:24:41 -0800 (PST)
In-Reply-To: <20201208115934.3163238-1-berrange@redhat.com>
Subject: Re: [PATCH] hw/input: expand trace info reported for ps2 device
Message-ID: <160743028066.3144.3050305791016015080@600e7e483b3a>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: berrange@redhat.com
Date: Tue, 8 Dec 2020 04:24:41 -0800 (PST)
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
Cc: berrange@redhat.com, qemu-devel@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMTIwODExNTkzNC4zMTYz
MjM4LTEtYmVycmFuZ2VAcmVkaGF0LmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0byBo
YXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgptb3Jl
IGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjAxMjA4MTE1OTM0LjMx
NjMyMzgtMS1iZXJyYW5nZUByZWRoYXQuY29tClN1YmplY3Q6IFtQQVRDSF0gaHcvaW5wdXQ6IGV4
cGFuZCB0cmFjZSBpbmZvIHJlcG9ydGVkIGZvciBwczIgZGV2aWNlCgo9PT0gVEVTVCBTQ1JJUFQg
QkVHSU4gPT09CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBl
eGl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0t
bG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGht
IGhpc3RvZ3JhbQouL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0g
VEVTVCBTQ1JJUFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdm
NDRiZDg4ODcxMzM4NApGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVt
dQogKiBbbmV3IHRhZ10gICAgICAgICBwYXRjaGV3LzIwMjAxMjA4MTE1OTM0LjMxNjMyMzgtMS1i
ZXJyYW5nZUByZWRoYXQuY29tIC0+IHBhdGNoZXcvMjAyMDEyMDgxMTU5MzQuMzE2MzIzOC0xLWJl
cnJhbmdlQHJlZGhhdC5jb20KU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0JwplZjRlYWJm
IGh3L2lucHV0OiBleHBhbmQgdHJhY2UgaW5mbyByZXBvcnRlZCBmb3IgcHMyIGRldmljZQoKPT09
IE9VVFBVVCBCRUdJTiA9PT0KRVJST1I6IGxpbmUgb3ZlciA5MCBjaGFyYWN0ZXJzCiMyMjogRklM
RTogaHcvaW5wdXQvcHMyLmM6Mjk2OgorICAgIHRyYWNlX3BzMl9rZXlib2FyZF9ldmVudChzLCBx
Y29kZSwga2V5LT5kb3duLCBtb2QsIHMtPm1vZGlmaWVycywgcy0+c2NhbmNvZGVfc2V0LCBzLT50
cmFuc2xhdGUpOwoKdG90YWw6IDEgZXJyb3JzLCAwIHdhcm5pbmdzLCAxNiBsaW5lcyBjaGVja2Vk
CgpDb21taXQgZWY0ZWFiZjdiOTU0IChody9pbnB1dDogZXhwYW5kIHRyYWNlIGluZm8gcmVwb3J0
ZWQgZm9yIHBzMiBkZXZpY2UpIGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElm
IGFueSBvZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0
aGUgbWFpbnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCj09PSBPVVRQVVQg
RU5EID09PQoKVGVzdCBjb21tYW5kIGV4aXRlZCB3aXRoIGNvZGU6IDEKCgpUaGUgZnVsbCBsb2cg
aXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMjAxMjA4MTE1OTM0LjMx
NjMyMzgtMS1iZXJyYW5nZUByZWRoYXQuY29tL3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlwZT1tZXNz
YWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6
Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2
ZWxAcmVkaGF0LmNvbQ==

