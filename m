Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id A488D1C502F
	for <lists+qemu-devel@lfdr.de>; Tue,  5 May 2020 10:24:12 +0200 (CEST)
Received: from localhost ([::1]:59896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jVss7-00010v-Oa
	for lists+qemu-devel@lfdr.de; Tue, 05 May 2020 04:24:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1jVsrA-0000QJ-7V; Tue, 05 May 2020 04:23:12 -0400
Resent-Date: Tue, 05 May 2020 04:23:12 -0400
Resent-Message-Id: <E1jVsrA-0000QJ-7V@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1jVsr8-0002y8-RY; Tue, 05 May 2020 04:23:11 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1588666981; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=kbmFShSVKTIGq0tKj7vbv15tAoUXts7IXAUQ4bMV9ix7cfMCXJxhwGI7qbOhFUAgvqdu4WgxB8I+L36l7XpzzEkazXVN1Tn0s+ccrDmZGub0lG9NHUWEayu/9jCf1uArdrzhHPCgdygCdHMUUTcWMOVPn9/NqUVUyIO0RN/9t2w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1588666981;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=aIvjXq04Rw4hy9YQhZ4Dmu0HZCFrvWNnlr/YbLB65nE=; 
 b=M2nuJSr32MLzkMVZx9RvLbMOzBt/leWlJXa77X9ysTCa+UmPmag6yKFfPg1wgRR11z84VggZ9s0psjwlYT8iZMNhr7PMah6sqTEUxGkqAYpQunMg1B2h72ZzgYSoKKesBAJkxyUDnZFbT7+81FTELxmG3XPwT+fZ/xyum+4TxrQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1588666980454536.6761728748419;
 Tue, 5 May 2020 01:23:00 -0700 (PDT)
Message-ID: <158866697911.24779.10379729195167772893@45ef0f9c86ae>
In-Reply-To: <20200504142125.31180-1-edgar.iglesias@gmail.com>
Subject: Re: [PATCH v2 0/1] target/arm: Remove access_el3_aa32ns()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: edgar.iglesias@gmail.com
Date: Tue, 5 May 2020 01:23:00 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/05 04:16:46
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 laurent.desnogues@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDUwNDE0MjEyNS4zMTE4
MC0xLWVkZ2FyLmlnbGVzaWFzQGdtYWlsLmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBmYWlsZWQg
dGhlIGRvY2tlci1taW5nd0BmZWRvcmEgYnVpbGQgdGVzdC4gUGxlYXNlIGZpbmQgdGhlIHRlc3Rp
bmcgY29tbWFuZHMgYW5kCnRoZWlyIG91dHB1dCBiZWxvdy4gSWYgeW91IGhhdmUgRG9ja2VyIGlu
c3RhbGxlZCwgeW91IGNhbiBwcm9iYWJseSByZXByb2R1Y2UgaXQKbG9jYWxseS4KCj09PSBURVNU
IFNDUklQVCBCRUdJTiA9PT0KIyEgL2Jpbi9iYXNoCmV4cG9ydCBBUkNIPXg4Nl82NAptYWtlIGRv
Y2tlci1pbWFnZS1mZWRvcmEgVj0xIE5FVFdPUks9MQp0aW1lIG1ha2UgZG9ja2VyLXRlc3QtbWlu
Z3dAZmVkb3JhIEo9MTQgTkVUV09SSz0xCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgoKCgpUaGUg
ZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMjAwNTA0
MTQyMTI1LjMxMTgwLTEtZWRnYXIuaWdsZXNpYXNAZ21haWwuY29tL3Rlc3RpbmcuZG9ja2VyLW1p
bmd3QGZlZG9yYS8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2Fs
bHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZl
ZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

