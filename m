Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D902947B6
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Oct 2020 07:14:01 +0200 (CEST)
Received: from localhost ([::1]:39370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kV6Rk-0000Mo-Kb
	for lists+qemu-devel@lfdr.de; Wed, 21 Oct 2020 01:14:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kV6Ql-0008LP-MV
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 01:12:59 -0400
Resent-Date: Wed, 21 Oct 2020 01:12:59 -0400
Resent-Message-Id: <E1kV6Ql-0008LP-MV@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kV6Qh-0004G1-6X
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 01:12:58 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1603257169; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Gfz/Zl/Yy6m8qtagWiioOUlm6wlhbF7ikO8h6BKH6lg5mEdFIibGkK2p6DXHHl6D7RWTZ/dV4F3TeABnMBL/T2KQIGnbyBs/AcHTElaijquyahLRvmGHyUy5PqAkW3JMS4HYn3JVk6VqWMh4As3Ee+eHsQcq3LDDqlP+FVFRyWU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1603257169;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=lMrPsgzo6J2BosNYlYUZ3JJRx5bWnpuTlM5KalDih8U=; 
 b=Lf5+Jmbiim/TCqvSsdUVDp2PFfHTKNyp9njxo2YQzlPtSk5mKp+1asH4oJzkIQXoaCJ45bIvhJJY5qqOkdk7c1LitPtq9KCJKrwgEzW6uMK5eP/c1VtJ5ZOQXf0hcbx5F+HPP/G07lMse2WNwfVxA0dYdFE83h/jy2PCJE5xWoE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1603257166891824.1905939055705;
 Tue, 20 Oct 2020 22:12:46 -0700 (PDT)
Subject: Re: [RFC PATCH 00/15] softfloat: alternate conversion of
 float128_addsub
Message-ID: <160325716572.32698.11470178782490534065@66eaa9a8a123>
In-Reply-To: <20201021045149.1582203-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: richard.henderson@linaro.org
Date: Tue, 20 Oct 2020 22:12:46 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/21 01:12:53
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
Cc: alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMTAyMTA0NTE0OS4xNTgy
MjAzLTEtcmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZy8KCgoKSGksCgpUaGlzIHNlcmllcyBz
ZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxlIHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93
IGZvcgptb3JlIGluZm9ybWF0aW9uOgoKVHlwZTogc2VyaWVzCk1lc3NhZ2UtaWQ6IDIwMjAxMDIx
MDQ1MTQ5LjE1ODIyMDMtMS1yaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnClN1YmplY3Q6IFtS
RkMgUEFUQ0ggMDAvMTVdIHNvZnRmbG9hdDogYWx0ZXJuYXRlIGNvbnZlcnNpb24gb2YgZmxvYXQx
MjhfYWRkc3ViCgo9PT0gVEVTVCBTQ1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCmdpdCByZXYt
cGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYu
cmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNv
bmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGhtIGhpc3RvZ3JhbQouL3NjcmlwdHMvY2hlY2twYXRj
aC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKVXBkYXRpbmcg
M2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdmNDRiZDg4ODcxMzM4NApGcm9tIGh0dHBzOi8vZ2l0
aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVtdQogKiBbbmV3IHRhZ10gICAgICAgICBwYXRjaGV3
LzIwMjAxMDIxMDQ1MTQ5LjE1ODIyMDMtMS1yaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnIC0+
IHBhdGNoZXcvMjAyMDEwMjEwNDUxNDkuMTU4MjIwMy0xLXJpY2hhcmQuaGVuZGVyc29uQGxpbmFy
by5vcmcKU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0JwphZDEyMGMxIHNvZnRmbG9hdDog
SW1wcm92ZSBzdWJ0cmFjdGlvbiBvZiBlcXVhbCBleHBvbmVudAoxMmViNWE0IHNvZnRmbG9hdDog
VXNlIGZsb2F0X2NtYXNrIGZvciBhZGRzdWJfZmxvYXRzCmEwNGZmN2QgVGVzdCBmbG9hdDEyOF9h
ZGRzdWIKZmM5NTM3ZSBzb2Z0ZmxvYXQ6IFN0cmVhbWxpbmUgRmxvYXRGbXQKOTc5YmViNiBUZXN0
IHNwbGl0IHRvIHNvZnRmbG9hdC1wYXJ0cy5jLmluYwo0MzE3OTkxIHNvZnRmbG9hdDogSW5saW5l
IGZsb2F0X3JhaXNlCjQ2ODliZDIgc29mdGZsb2F0OiBBZGQgZmxvYXRfY21hc2sgYW5kIGNvbnN0
YW50cwpiMTE0MWVlIHNvZnRmbG9hdDogVGlkeSBhICogYiArIGluZiByZXR1cm4KMTk3MjczYyBz
b2Z0ZmxvYXQ6IFVzZSBpbnQxMjguaCBmb3Igc29tZSBvcGVyYXRpb25zCmFhNGFmYTIgc29mdGZs
b2F0OiBVc2UgbXVsdTY0IGZvciBtdWw2NFRvMTI4CjAxN2QyNzYgcWVtdS9pbnQxMjg6IEFkZCBp
bnQxMjhfZ2V1CjcxZGQ1ZjEgcWVtdS9pbnQxMjg6IEFkZCBpbnQxMjhfc2hyCjkxNDRkZjkgcWVt
dS9pbnQxMjg6IFJlbmFtZSBpbnQxMjhfcnNoaWZ0LCBpbnQxMjhfbHNoaWZ0CmI2YzlhZmIgcWVt
dS9pbnQxMjg6IEFkZCBpbnQxMjhfY2x6LCBpbnQxMjhfY3R6CjBjZWZmOWEgcWVtdS9pbnQxMjg6
IEFkZCBpbnQxMjhfb3IKCj09PSBPVVRQVVQgQkVHSU4gPT09CjEvMTUgQ2hlY2tpbmcgY29tbWl0
IDBjZWZmOWExNGFhNiAocWVtdS9pbnQxMjg6IEFkZCBpbnQxMjhfb3IpCjIvMTUgQ2hlY2tpbmcg
Y29tbWl0IGI2YzlhZmI1ODM1NyAocWVtdS9pbnQxMjg6IEFkZCBpbnQxMjhfY2x6LCBpbnQxMjhf
Y3R6KQozLzE1IENoZWNraW5nIGNvbW1pdCA5MTQ0ZGY5OTBiMTcgKHFlbXUvaW50MTI4OiBSZW5h
bWUgaW50MTI4X3JzaGlmdCwgaW50MTI4X2xzaGlmdCkKNC8xNSBDaGVja2luZyBjb21taXQgNzFk
ZDVmMTU3YTM5IChxZW11L2ludDEyODogQWRkIGludDEyOF9zaHIpCjUvMTUgQ2hlY2tpbmcgY29t
bWl0IDAxN2QyNzYyNzExMiAocWVtdS9pbnQxMjg6IEFkZCBpbnQxMjhfZ2V1KQo2LzE1IENoZWNr
aW5nIGNvbW1pdCBhYTRhZmEyMmVlNzggKHNvZnRmbG9hdDogVXNlIG11bHU2NCBmb3IgbXVsNjRU
bzEyOCkKNy8xNSBDaGVja2luZyBjb21taXQgMTk3MjczYzBhZWRhIChzb2Z0ZmxvYXQ6IFVzZSBp
bnQxMjguaCBmb3Igc29tZSBvcGVyYXRpb25zKQo4LzE1IENoZWNraW5nIGNvbW1pdCBiMTE0MWVl
Y2MzNjggKHNvZnRmbG9hdDogVGlkeSBhICogYiArIGluZiByZXR1cm4pCjkvMTUgQ2hlY2tpbmcg
Y29tbWl0IDQ2ODliZDI2ZmQ2NiAoc29mdGZsb2F0OiBBZGQgZmxvYXRfY21hc2sgYW5kIGNvbnN0
YW50cykKMTAvMTUgQ2hlY2tpbmcgY29tbWl0IDQzMTc5OTFkY2JkOCAoc29mdGZsb2F0OiBJbmxp
bmUgZmxvYXRfcmFpc2UpCjExLzE1IENoZWNraW5nIGNvbW1pdCA5NzliZWI2NzZlODkgKFRlc3Qg
c3BsaXQgdG8gc29mdGZsb2F0LXBhcnRzLmMuaW5jKQpXQVJOSU5HOiBCbG9jayBjb21tZW50cyB1
c2UgYSBsZWFkaW5nIC8qIG9uIGEgc2VwYXJhdGUgbGluZQojNTU3OiBGSUxFOiBmcHUvc29mdGZs
b2F0LmM6Njg1OgorICAgICAgICAvKiBOb3RlIHRoYXQgdGhpcyBjaGVjayBpcyBhZnRlciBwaWNr
TmFOTXVsQWRkIHNvIHRoYXQgZnVuY3Rpb24KCkVSUk9SOiBNaXNzaW5nIFNpZ25lZC1vZmYtYnk6
IGxpbmUocykKCnRvdGFsOiAxIGVycm9ycywgMSB3YXJuaW5ncywgNzg2IGxpbmVzIGNoZWNrZWQK
ClBhdGNoIDExLzE1IGhhcyBzdHlsZSBwcm9ibGVtcywgcGxlYXNlIHJldmlldy4gIElmIGFueSBv
ZiB0aGVzZSBlcnJvcnMKYXJlIGZhbHNlIHBvc2l0aXZlcyByZXBvcnQgdGhlbSB0byB0aGUgbWFp
bnRhaW5lciwgc2VlCkNIRUNLUEFUQ0ggaW4gTUFJTlRBSU5FUlMuCgoxMi8xNSBDaGVja2luZyBj
b21taXQgZmM5NTM3ZTY2YjczIChzb2Z0ZmxvYXQ6IFN0cmVhbWxpbmUgRmxvYXRGbXQpCjEzLzE1
IENoZWNraW5nIGNvbW1pdCBhMDRmZjdkY2IwMDMgKFRlc3QgZmxvYXQxMjhfYWRkc3ViKQpFUlJP
UjogTWlzc2luZyBTaWduZWQtb2ZmLWJ5OiBsaW5lKHMpCgp0b3RhbDogMSBlcnJvcnMsIDAgd2Fy
bmluZ3MsIDQwNSBsaW5lcyBjaGVja2VkCgpQYXRjaCAxMy8xNSBoYXMgc3R5bGUgcHJvYmxlbXMs
IHBsZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2
ZXMgcmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5U
QUlORVJTLgoKMTQvMTUgQ2hlY2tpbmcgY29tbWl0IDEyZWI1YTQ4NjcyMCAoc29mdGZsb2F0OiBV
c2UgZmxvYXRfY21hc2sgZm9yIGFkZHN1Yl9mbG9hdHMpCjE1LzE1IENoZWNraW5nIGNvbW1pdCBh
ZDEyMGMxZDFhZTggKHNvZnRmbG9hdDogSW1wcm92ZSBzdWJ0cmFjdGlvbiBvZiBlcXVhbCBleHBv
bmVudCkKPT09IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTog
MQoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3Mv
MjAyMDEwMjEwNDUxNDkuMTU4MjIwMy0xLXJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmcvdGVz
dGluZy5jaGVja3BhdGNoLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21h
dGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlv
dXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

