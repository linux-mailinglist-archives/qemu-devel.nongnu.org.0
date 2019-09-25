Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4712BBD8D9
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Sep 2019 09:14:12 +0200 (CEST)
Received: from localhost ([::1]:46248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iD1V5-0007g2-9Y
	for lists+qemu-devel@lfdr.de; Wed, 25 Sep 2019 03:14:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40131)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1iD1Ct-0007cs-94
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 02:55:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1iD1Cs-0008Jj-0Y
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 02:55:23 -0400
Resent-Date: Wed, 25 Sep 2019 02:55:23 -0400
Resent-Message-Id: <E1iD1Cs-0008Jj-0Y@eggs.gnu.org>
Received: from sender4-of-o55.zoho.com ([136.143.188.55]:21543)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1iD1Cp-0008Bv-1J; Wed, 25 Sep 2019 02:55:19 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1569394499; cv=none; d=zoho.com; s=zohoarc; 
 b=G9fwlLYhaCLgMp4Wfx8ck+IPbQ7Puhu10Gba3XsosLq/2xcQVJZFO+CDcZynGncYl3PpY+cqYwXY5Dk5+3YoCDTmSUdjn4SEex/Ek4AojODKApmK1AKSSDlhhM4lSb0IwX+H5hBUI53h8eBF9CjjmPT7A2dLJrdHurK6ZhnLUlk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
 s=zohoarc; t=1569394499;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
 bh=oeqeulBf4Vwbu+50L48ehygqO8U7uSyqvJgVC9qTLRw=; 
 b=WmnqH0n+vesLrDZWLG4nHEZMjGLHX+7C7UMQZEcdQQOUgR5mKKR/Q8A7zOvtWQ7hmbFu058UPp8SvAednFyZKGc9N55d6FmzJWuOzE4i7ko9cH5lRAVxOXdeeOa7XSXtKJ3WA2912OIz+NW5fVxjQ2P1GWW3fCRym4reqpVe8WE=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 156939449744494.24444381336264;
 Tue, 24 Sep 2019 23:54:57 -0700 (PDT)
Subject: Re: [RFC PATCH 00/12] Add SDEI support for arm64
In-Reply-To: <1569338511-3572-1-git-send-email-guoheyi@huawei.com>
Message-ID: <156939449538.4188.158567627991892527@8230166b0665>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: guoheyi@huawei.com
Date: Tue, 24 Sep 2019 23:54:57 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 136.143.188.55
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
Cc: mark.rutland@arm.com, peter.maydell@linaro.org, marc.zyngier@arm.com,
 qemu-devel@nongnu.org, Dave.Martin@arm.com, qemu-arm@nongnu.org,
 james.morse@arm.com, guoheyi@huawei.com, wanghaibin.wang@huawei.com,
 kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8xNTY5MzM4NTExLTM1NzItMS1n
aXQtc2VuZC1lbWFpbC1ndW9oZXlpQGh1YXdlaS5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgZmFp
bGVkIHRoZSBkb2NrZXItcXVpY2tAY2VudG9zNyBidWlsZCB0ZXN0LiBQbGVhc2UgZmluZCB0aGUg
dGVzdGluZyBjb21tYW5kcyBhbmQKdGhlaXIgb3V0cHV0IGJlbG93LiBJZiB5b3UgaGF2ZSBEb2Nr
ZXIgaW5zdGFsbGVkLCB5b3UgY2FuIHByb2JhYmx5IHJlcHJvZHVjZSBpdApsb2NhbGx5LgoKPT09
IFRFU1QgU0NSSVBUIEJFR0lOID09PQojIS9iaW4vYmFzaAptYWtlIGRvY2tlci1pbWFnZS1jZW50
b3M3IFY9MSBORVRXT1JLPTEKdGltZSBtYWtlIGRvY2tlci10ZXN0LXF1aWNrQGNlbnRvczcgU0hP
V19FTlY9MSBKPTE0IE5FVFdPUks9MQo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKbGlidWRldiAg
ICAgICAgICAgbm8KZGVmYXVsdCBkZXZpY2VzICAgeWVzCgp3YXJuaW5nOiBQeXRob24gMiBzdXBw
b3J0IGlzIGRlcHJlY2F0ZWQKd2FybmluZzogUHl0aG9uIDMgd2lsbCBiZSByZXF1aXJlZCBmb3Ig
YnVpbGRpbmcgZnV0dXJlIHZlcnNpb25zIG9mIFFFTVUKY3Jvc3MgY29udGFpbmVycyAgbm8KCk5P
VEU6IGd1ZXN0IGNyb3NzLWNvbXBpbGVycyBlbmFibGVkOiBjYwotLS0KICBMSU5LICAgIGFhcmNo
NjQtc29mdG1tdS9xZW11LXN5c3RlbS1hYXJjaDY0Cmh3L2FybS92aXJ0LWFjcGktYnVpbGQubzog
SW4gZnVuY3Rpb24gYHZpcnRfYWNwaV9idWlsZCc6Ci90bXAvcWVtdS10ZXN0L3NyYy9ody9hcm0v
dmlydC1hY3BpLWJ1aWxkLmM6ODEwOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBzZGVpX2VuYWJs
ZWQnCmNvbGxlY3QyOiBlcnJvcjogbGQgcmV0dXJuZWQgMSBleGl0IHN0YXR1cwptYWtlWzFdOiAq
KiogW3FlbXUtc3lzdGVtLWFhcmNoNjRdIEVycm9yIDEKbWFrZTogKioqIFthYXJjaDY0LXNvZnRt
bXUvYWxsXSBFcnJvciAyClRyYWNlYmFjayAobW9zdCByZWNlbnQgY2FsbCBsYXN0KToKCgpUaGUg
ZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzE1NjkzMzg1
MTEtMzU3Mi0xLWdpdC1zZW5kLWVtYWlsLWd1b2hleWlAaHVhd2VpLmNvbS90ZXN0aW5nLmRvY2tl
ci1xdWlja0BjZW50b3M3Lz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21h
dGljYWxseSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlv
dXIgZmVlZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t


