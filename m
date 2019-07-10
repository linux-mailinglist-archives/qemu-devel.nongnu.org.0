Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 764A36434F
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jul 2019 10:06:35 +0200 (CEST)
Received: from localhost ([::1]:58882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hl7cX-0007ZJ-Ua
	for lists+qemu-devel@lfdr.de; Wed, 10 Jul 2019 04:06:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46760)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <no-reply@patchew.org>) id 1hl7Xv-0006G9-S1
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 04:01:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1hl7Xt-0006DU-PD
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 04:01:47 -0400
Resent-Date: Wed, 10 Jul 2019 04:01:47 -0400
Resent-Message-Id: <E1hl7Xt-0006DU-PD@eggs.gnu.org>
Received: from sender4-of-o55.zoho.com ([136.143.188.55]:21573)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1hl7Xs-00065z-0n
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 04:01:45 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1562745686; cv=none; d=zoho.com; s=zohoarc; 
 b=QIjzXRc/Fyn3fjhCkRrKHbV7OpvAso+gWG3CI1trrJ+F68Y2f/UrK97G156R6Ob1kPgyLNo9tRIpvVMPWJ0GIhPGfL5NN+GpZD/oxbLDZR31jMxiD12owH3K19YvfxEEDt9aXsaQ2NMwWG7ez3YAJhdvCyW1/N5oAQFwSmBoi1Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
 s=zohoarc; t=1562745686;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
 bh=fQE1vMIVUHwWw+8vyChBuRhktnZTVWe/PYJOzdaqBjE=; 
 b=U9OiPeio31FxF+zEj2CeWUOpPSHg6cJ52AxP922RlNHG1QSmWW8fJGy0gHytgV6txWozM8JSGVjwPvco8hrEeTEBl5d7ugDt890rdBzzpGFhlDNy/VrOksZeAVVNV6fmKgXc/2VxJOCzqM6qBvqyPsyW6VlDJmT4HFjj4B4KRMY=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 156274568614918.321931122812884;
 Wed, 10 Jul 2019 01:01:26 -0700 (PDT)
Message-ID: <156274568499.3735.6585989280648335588@c4a48874b076>
In-Reply-To: <1562745044-7838-1-git-send-email-wanpengli@tencent.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: kernellwp@gmail.com
Date: Wed, 10 Jul 2019 01:01:26 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 136.143.188.55
Subject: Re: [Qemu-devel] [PATCH] target-i386: adds PV_SCHED_YIELD CPUID
 feature bit
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
Cc: pbonzini@redhat.com, rkrcmar@redhat.com, qemu-devel@nongnu.org,
 kvm@vger.kernel.org, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8xNTYyNzQ1MDQ0LTc4MzgtMS1n
aXQtc2VuZC1lbWFpbC13YW5wZW5nbGlAdGVuY2VudC5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMg
ZmFpbGVkIHRoZSBhc2FuIGJ1aWxkIHRlc3QuIFBsZWFzZSBmaW5kIHRoZSB0ZXN0aW5nIGNvbW1h
bmRzIGFuZAp0aGVpciBvdXRwdXQgYmVsb3cuIElmIHlvdSBoYXZlIERvY2tlciBpbnN0YWxsZWQs
IHlvdSBjYW4gcHJvYmFibHkgcmVwcm9kdWNlIGl0CmxvY2FsbHkuCgo9PT0gVEVTVCBTQ1JJUFQg
QkVHSU4gPT09CiMhL2Jpbi9iYXNoCm1ha2UgZG9ja2VyLWltYWdlLWZlZG9yYSBWPTEgTkVUV09S
Sz0xCnRpbWUgbWFrZSBkb2NrZXItdGVzdC1kZWJ1Z0BmZWRvcmEgVEFSR0VUX0xJU1Q9eDg2XzY0
LXNvZnRtbXUgSj0xNCBORVRXT1JLPTEKPT09IFRFU1QgU0NSSVBUIEVORCA9PT0KCiAgQ0MgICAg
ICB4ODZfNjQtc29mdG1tdS90cmFjZS9jb250cm9sLXRhcmdldC5vCiAgQ0MgICAgICB4ODZfNjQt
c29mdG1tdS9nZGJzdHViLXhtbC5vCiAgQ0MgICAgICB4ODZfNjQtc29mdG1tdS90cmFjZS9nZW5l
cmF0ZWQtaGVscGVycy5vCi90bXAvcWVtdS10ZXN0L3NyYy90YXJnZXQvaTM4Ni9jcHUuYzo5MDk6
MTk6IGVycm9yOiBtaXNzaW5nIHRlcm1pbmF0aW5nICciJyBjaGFyYWN0ZXIgWy1XZXJyb3IsLVdp
bnZhbGlkLXBwLXRva2VuXQogICAgICAgICAgICBOVUxMLCAia3ZtLXB2LXNjaGVkLXlpZWxkJywg
TlVMTCwgTlVMTCwKICAgICAgICAgICAgICAgICAgXgovdG1wL3FlbXUtdGVzdC9zcmMvdGFyZ2V0
L2kzODYvY3B1LmM6OTA5OjE5OiBlcnJvcjogZXhwZWN0ZWQgZXhwcmVzc2lvbgoyIGVycm9ycyBn
ZW5lcmF0ZWQuCm1ha2VbMV06ICoqKiBbL3RtcC9xZW11LXRlc3Qvc3JjL3J1bGVzLm1hazo2OTog
dGFyZ2V0L2kzODYvY3B1Lm9dIEVycm9yIDEKbWFrZVsxXTogKioqIFdhaXRpbmcgZm9yIHVuZmlu
aXNoZWQgam9icy4uLi4KCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRj
aGV3Lm9yZy9sb2dzLzE1NjI3NDUwNDQtNzgzOC0xLWdpdC1zZW5kLWVtYWlsLXdhbnBlbmdsaUB0
ZW5jZW50LmNvbS90ZXN0aW5nLmFzYW4vP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRl
ZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNl
IHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=


