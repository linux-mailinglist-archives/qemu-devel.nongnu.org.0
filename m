Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0A2200D13
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jun 2020 16:54:06 +0200 (CEST)
Received: from localhost ([::1]:46818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jmIP7-0000GR-FR
	for lists+qemu-devel@lfdr.de; Fri, 19 Jun 2020 10:54:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1jmIMQ-00049T-09
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 10:51:18 -0400
Resent-Date: Fri, 19 Jun 2020 10:51:18 -0400
Resent-Message-Id: <E1jmIMQ-00049T-09@lists.gnu.org>
Received: from sender4-of-o57.zoho.com ([136.143.188.57]:21758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1jmIMN-0003i4-WF
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 10:51:17 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1592578266; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=UZ/V1bc+sm+Xe6DY78473tobt/gmIgHW7urP9I+0AyXGQ6QIVfuspeHuksDajBbpQ+8M9OLL/Sr37fx3jTuTBj7bl29ZV3lxXXg+kXQExEsXc+UnZlxm6JtrLpjA2eRNgM3eUGnJDt5PpDy/viLTYOos+QujRvKqkJBtRmFtAUc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1592578266;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=5X6iaVlAOazF14naNq+Y+9jlEeaPg6fQXAX7oSV3T3c=; 
 b=OPXu2nw5Q5Zx3pEmQ+d1q3O25aO2EjGemM5lldw29wOSgmcfA4Z1rmaEoF877b31VwESXcRhSYPXe8o1BzENN8syxd7SDSU7aYhvi9NPPdpySLl58Sipe8EypHir+0e3N7eH3/mlU0FnGJ9cXGZcIfbVdPAEPWVZjlcFFBmSxFQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1592578264424678.6168055308967;
 Fri, 19 Jun 2020 07:51:04 -0700 (PDT)
Message-ID: <159257826311.2784.15111363669451514970@d1fd068a5071>
Subject: Re: [RFC PATCH] docs/devel: add some notes on tcg-icount for
 developers
In-Reply-To: <20200619135844.23307-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: alex.bennee@linaro.org
Date: Fri, 19 Jun 2020 07:51:04 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.57; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o57.zoho.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/19 10:14:48
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, dovgaluk@ispras.ru, pbonzini@redhat.com,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDYxOTEzNTg0NC4yMzMw
Ny0xLWFsZXguYmVubmVlQGxpbmFyby5vcmcvCgoKCkhpLAoKVGhpcyBzZXJpZXMgc2VlbXMgdG8g
aGF2ZSBzb21lIGNvZGluZyBzdHlsZSBwcm9ibGVtcy4gU2VlIG91dHB1dCBiZWxvdyBmb3IKbW9y
ZSBpbmZvcm1hdGlvbjoKClN1YmplY3Q6IFtSRkMgUEFUQ0hdIGRvY3MvZGV2ZWw6IGFkZCBzb21l
IG5vdGVzIG9uIHRjZy1pY291bnQgZm9yIGRldmVsb3BlcnMKVHlwZTogc2VyaWVzCk1lc3NhZ2Ut
aWQ6IDIwMjAwNjE5MTM1ODQ0LjIzMzA3LTEtYWxleC5iZW5uZWVAbGluYXJvLm9yZwoKPT09IFRF
U1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaApnaXQgcmV2LXBhcnNlIGJhc2UgPiAvZGV2
L251bGwgfHwgZXhpdCAwCmdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKZ2l0
IGNvbmZpZyAtLWxvY2FsIGRpZmYucmVuYW1lcyBUcnVlCmdpdCBjb25maWcgLS1sb2NhbCBkaWZm
LmFsZ29yaXRobSBoaXN0b2dyYW0KLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFjayBi
YXNlLi4KPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KClN3aXRjaGVkIHRvIGEgbmV3IGJyYW5jaCAn
dGVzdCcKMmNiMTVkYiBkb2NzL2RldmVsOiBhZGQgc29tZSBub3RlcyBvbiB0Y2ctaWNvdW50IGZv
ciBkZXZlbG9wZXJzCgo9PT0gT1VUUFVUIEJFR0lOID09PQpXQVJOSU5HOiBhZGRlZCwgbW92ZWQg
b3IgZGVsZXRlZCBmaWxlKHMpLCBkb2VzIE1BSU5UQUlORVJTIG5lZWQgdXBkYXRpbmc/CiMyMTog
Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CgpFUlJPUjogdHJhaWxpbmcgd2hpdGVzcGFjZQojOTU6IEZJ
TEU6IGRvY3MvZGV2ZWwvdGNnLWljb3VudC5yc3Q6NzA6CisgICQKCkVSUk9SOiB0cmFpbGluZyB3
aGl0ZXNwYWNlCiM5NjogRklMRTogZG9jcy9kZXZlbC90Y2ctaWNvdW50LnJzdDo3MToKKy4uIFsx
XSBzb21ldGltZXMgdHdvIGluc3RydWN0aW9ucyBpZiBkZWFsaW5nIHdpdGggZGVsYXkgc2xvdHMg
ICQKCnRvdGFsOiAyIGVycm9ycywgMSB3YXJuaW5ncywgODYgbGluZXMgY2hlY2tlZAoKQ29tbWl0
IDJjYjE1ZGIyYTk0YyAoZG9jcy9kZXZlbDogYWRkIHNvbWUgbm90ZXMgb24gdGNnLWljb3VudCBm
b3IgZGV2ZWxvcGVycykgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55
IG9mIHRoZXNlIGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBt
YWludGFpbmVyLCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KPT09IE9VVFBVVCBFTkQg
PT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKClRoZSBmdWxsIGxvZyBpcyBh
dmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAyMDA2MTkxMzU4NDQuMjMzMDct
MS1hbGV4LmJlbm5lZUBsaW5hcm8ub3JnL3Rlc3RpbmcuY2hlY2twYXRjaC8/dHlwZT1tZXNzYWdl
LgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9w
YXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxA
cmVkaGF0LmNvbQ==

