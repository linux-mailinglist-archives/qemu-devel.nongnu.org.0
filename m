Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA5E34D362
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 17:11:49 +0200 (CEST)
Received: from localhost ([::1]:41862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQtYS-0006Zq-Qv
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 11:11:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lQtWs-0005vS-Ii
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 11:10:10 -0400
Resent-Date: Mon, 29 Mar 2021 11:10:10 -0400
Resent-Message-Id: <E1lQtWs-0005vS-Ii@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1lQtWp-0006oi-O3
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 11:10:10 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1617030591; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=NAebLenSH/iZ/x9c2O5ShITWtNOV00zc1klE9LezEmdZpNI5Qp+hHqxw4v4AMhNKbKKOoBBQkD64i5PJzG+Svsfd51NkjzRrAKxX05A3me/dY6T6Hdlu7BUTTnWAUrdlEP0GFeh3KT1X0JuEn8/hGz3RkfQgUJ9gT/UH4UqeUNQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1617030591;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=fnAZtITux0ur7uTqB7tCajsqi4bBaQ0sjlQRKlV/UcM=; 
 b=VzNdkurjQ1Y9m31tK5EipAJYSJeSfMFhuL6KgZVIL5tngBPt+jwqr4n7yF6VA6Zf45jUyGkwJD2qwBLDUVnYZDU+Qk1CLVl6RPIjFI9BKTPuZf9DDvaQxhymwKOpXANS4wOJsUFEHHuiQnz4Gu4yhEW0sIwAg9it+T96QoJtbS4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1617030586136237.97204368954942;
 Mon, 29 Mar 2021 08:09:46 -0700 (PDT)
In-Reply-To: <20210329145947.14280-1-alex.bennee@linaro.org>
Subject: Re: [RFC PATCH] docs: rst-ify the record/replay documentation
Message-ID: <161703058464.402.16834002215122078032@72b6d80f974b>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: alex.bennee@linaro.org
Date: Mon, 29 Mar 2021 08:09:46 -0700 (PDT)
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
Cc: pbonzini@redhat.com, alex.bennee@linaro.org, qemu-devel@nongnu.org,
 pavel.dovgaluk@ispras.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIxMDMyOTE0NTk0Ny4xNDI4
MC0xLWFsZXguYmVubmVlQGxpbmFyby5vcmcvCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8g
aGF2ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9y
ZSBpbmZvcm1hdGlvbjoKClR5cGU6IHNlcmllcwpNZXNzYWdlLWlkOiAyMDIxMDMyOTE0NTk0Ny4x
NDI4MC0xLWFsZXguYmVubmVlQGxpbmFyby5vcmcKU3ViamVjdDogW1JGQyBQQVRDSF0gZG9jczog
cnN0LWlmeSB0aGUgcmVjb3JkL3JlcGxheSBkb2N1bWVudGF0aW9uCgo9PT0gVEVTVCBTQ1JJUFQg
QkVHSU4gPT09CiMhL2Jpbi9iYXNoCmdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBl
eGl0IDAKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lbGltaXQgMApnaXQgY29uZmlnIC0t
bG9jYWwgZGlmZi5yZW5hbWVzIFRydWUKZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYuYWxnb3JpdGht
IGhpc3RvZ3JhbQouL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLW1haWxiYWNrIGJhc2UuLgo9PT0g
VEVTVCBTQ1JJUFQgRU5EID09PQoKVXBkYXRpbmcgM2M4Y2Y1YTljMjFmZjg3ODIxNjRkMWRlZjdm
NDRiZDg4ODcxMzM4NApGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXRjaGV3LXByb2plY3QvcWVt
dQogLSBbdGFnIHVwZGF0ZV0gICAgICBwYXRjaGV3LzIwMjEwMzI5MTEwMzAzLjE1MjM1LTEtYWxl
eC5iZW5uZWVAbGluYXJvLm9yZyAtPiBwYXRjaGV3LzIwMjEwMzI5MTEwMzAzLjE1MjM1LTEtYWxl
eC5iZW5uZWVAbGluYXJvLm9yZwogKiBbbmV3IHRhZ10gICAgICAgICBwYXRjaGV3LzIwMjEwMzI5
MTQ1OTQ3LjE0MjgwLTEtYWxleC5iZW5uZWVAbGluYXJvLm9yZyAtPiBwYXRjaGV3LzIwMjEwMzI5
MTQ1OTQ3LjE0MjgwLTEtYWxleC5iZW5uZWVAbGluYXJvLm9yZwpTd2l0Y2hlZCB0byBhIG5ldyBi
cmFuY2ggJ3Rlc3QnCjM4MTZhYzggZG9jczogcnN0LWlmeSB0aGUgcmVjb3JkL3JlcGxheSBkb2N1
bWVudGF0aW9uCgo9PT0gT1VUUFVUIEJFR0lOID09PQpFUlJPUjogdHJhaWxpbmcgd2hpdGVzcGFj
ZQojNjQ6IEZJTEU6IGRvY3MvZGV2ZWwvcmVwbGF5LnJzdDo0OgorICAgJAoKRVJST1I6IHRyYWls
aW5nIHdoaXRlc3BhY2UKIzc2OiBGSUxFOiBkb2NzL2RldmVsL3JlcGxheS5yc3Q6Mjk6CisgICAg
ICQKCkVSUk9SOiB0cmFpbGluZyB3aGl0ZXNwYWNlCiM4NzogRklMRTogZG9jcy9kZXZlbC9yZXBs
YXkucnN0OjM5OgorICAgICAkCgpFUlJPUjogdHJhaWxpbmcgd2hpdGVzcGFjZQojMTE4OiBGSUxF
OiBkb2NzL2RldmVsL3JlcGxheS5yc3Q6NzE6CisgICQKCkVSUk9SOiB0cmFpbGluZyB3aGl0ZXNw
YWNlCiMxNjc6IEZJTEU6IGRvY3MvZGV2ZWwvcmVwbGF5LnJzdDoyNDE6CisgICQKCkVSUk9SOiB0
cmFpbGluZyB3aGl0ZXNwYWNlCiMxODE6IEZJTEU6IGRvY3MvZGV2ZWwvcmVwbGF5LnJzdDoyNjU6
CisgICQKCkVSUk9SOiB0cmFpbGluZyB3aGl0ZXNwYWNlCiMxOTU6IEZJTEU6IGRvY3MvZGV2ZWwv
cmVwbGF5LnJzdDoyNzU6CisgICQKCnRvdGFsOiA3IGVycm9ycywgMCB3YXJuaW5ncywgMzA2IGxp
bmVzIGNoZWNrZWQKCkNvbW1pdCAzODE2YWM4OWUzNjMgKGRvY3M6IHJzdC1pZnkgdGhlIHJlY29y
ZC9yZXBsYXkgZG9jdW1lbnRhdGlvbikgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3
LiAgSWYgYW55IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVt
IHRvIHRoZSBtYWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KPT09IE9V
VFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKClRoZSBmdWxs
IGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAyMTAzMjkxNDU5
NDcuMTQyODAtMS1hbGV4LmJlbm5lZUBsaW5hcm8ub3JnL3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlw
ZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBb
aHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNo
ZXctZGV2ZWxAcmVkaGF0LmNvbQ==

