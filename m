Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FD128BD47
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Oct 2020 18:09:51 +0200 (CEST)
Received: from localhost ([::1]:58928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kS0OU-0004Mt-Kj
	for lists+qemu-devel@lfdr.de; Mon, 12 Oct 2020 12:09:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kS01F-0005BY-Uj; Mon, 12 Oct 2020 11:45:50 -0400
Resent-Date: Mon, 12 Oct 2020 11:45:49 -0400
Resent-Message-Id: <E1kS01F-0005BY-Uj@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kS01D-0000Ia-79; Mon, 12 Oct 2020 11:45:49 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1602517538; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=UgGbukkUR/wPfH3MzH0MrRTdzVHItqjSM63KgpsGWuzSfs4gpIprLd7bxLmN5MZNGWnBydO/S3M1buLTCkTWOaErnr2iFpo4xgSD0BWBnoRugPqqrQkYpHmRGmlPBe3R4oBjw20xV79XdRdxeghc5CJMC4bhjSXUUJPH+o0ZsG4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1602517538;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=PQ8yhp4woezLcxoQtPoIMtAa2Sr9dgUSvEI1e5BHmic=; 
 b=ChBSW0YXoVifVUY+KAUCETrVj/Jtoi6H1oz+UxqzyiHLNYZclm0aFMytGlEcEgcMuvK/5r1tPoWypMpVjFjXSAlkeK4Hx98zMfiKgi5Ygoctg8uKgRBqwzweYVmqnt+ZrsSIbrGwGRb10Sg93SpHZuWgc81bfCJuwyZneBJrDm0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1602517537003574.3528256154505;
 Mon, 12 Oct 2020 08:45:37 -0700 (PDT)
Subject: Re: [PATCH for-5.1] docs/system/arm/virt: Document mte machine option
Message-ID: <160251753567.18344.11052124400267344488@66eaa9a8a123>
In-Reply-To: <20201012153408.9747-10-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: peter.maydell@linaro.org
Date: Mon, 12 Oct 2020 08:45:37 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/12 11:45:43
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Cc: qemu-arm@nongnu.org, richard.henderson@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMTAxMjE1MzQwOC45NzQ3
LTEwLXBldGVyLm1heWRlbGxAbGluYXJvLm9yZy8KCgoKSGksCgpUaGlzIHNlcmllcyBzZWVtcyB0
byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgpt
b3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjAxMDEyMTUzNDA4
Ljk3NDctMTAtcGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnClN1YmplY3Q6IFtQQVRDSCBmb3ItNS4x
XSBkb2NzL3N5c3RlbS9hcm0vdmlydDogRG9jdW1lbnQgbXRlIG1hY2hpbmUgb3B0aW9uCgo9PT0g
VEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9k
ZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApn
aXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRp
ZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQouL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNr
IGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3
ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3
LXByb2plY3QvcWVtdQogKiBbbmV3IHRhZ10gICAgICAgICBwYXRjaGV3LzIwMjAxMDEyMTUzNDA4
Ljk3NDctMTAtcGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnIC0+IHBhdGNoZXcvMjAyMDEwMTIxNTM0
MDguOTc0Ny0xMC1wZXRlci5tYXlkZWxsQGxpbmFyby5vcmcKU3dpdGNoZWQgdG8gYSBuZXcgYnJh
bmNoICd0ZXN0JwoKPT09IE9VVFBVVCBCRUdJTiA9PT0KY2hlY2twYXRjaC5wbDogbm8gcmV2aXNp
b25zIHJldHVybmVkIGZvciByZXZsaXN0ICcxJwo9PT0gT1VUUFVUIEVORCA9PT0KClRlc3QgY29t
bWFuZCBleGl0ZWQgd2l0aCBjb2RlOiAyNTUKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0
Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMjAxMDEyMTUzNDA4Ljk3NDctMTAtcGV0ZXIubWF5
ZGVsbEBsaW5hcm8ub3JnL3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlwZT1tZXNzYWdlLgotLS0KRW1h
aWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9y
Zy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNv
bQ==

