Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2602A26FE17
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Sep 2020 15:19:57 +0200 (CEST)
Received: from localhost ([::1]:35724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJGIu-00086J-5Q
	for lists+qemu-devel@lfdr.de; Fri, 18 Sep 2020 09:19:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kJGCf-0001pf-P7
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 09:13:29 -0400
Resent-Date: Fri, 18 Sep 2020 09:13:29 -0400
Resent-Message-Id: <E1kJGCf-0001pf-P7@lists.gnu.org>
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kJGCc-0000SC-Ei
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 09:13:29 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1600434798; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=nYhUEXOsj0YrFVcGwoz9FY4b2k3p9lE+r8JbcF+2MPGWVjIOxyrxy5OEy4uihYXbDJvhvpQi+Lg6YKQPeSUHJ6LbmScR7RMrHQoI6tH30krOkbUID2VgHI2T9CkGAmPrxsGyvKd5ErttUH4Z2UlG1ivM+4dd5ldFhBzwKViGc9A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1600434798;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=lglflkD9ZGIGF5sVnNnCkkJBOE5jIGIipwbd0UWoa6U=; 
 b=lSmZiqIc11+ZvDQwRzzCY96QIneTF2piRfPLvB+vFVWP9EVuNiYDTSSW7ugOibMWqzWJTTD/rrDgGRS170ayFwMEC2dEsTTnbAR18f51Qp1uwrJhCwsKBzzHgk41WCPPnWc+DNiAYL8q62a3LLLeTUZVp8CiJvVQtH1n6Shshyo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1600434797282452.1660778689733;
 Fri, 18 Sep 2020 06:13:17 -0700 (PDT)
Subject: Re: [PATCH] meson: fix installation of keymaps
Message-ID: <160043479618.8478.8648524803144285530@66eaa9a8a123>
In-Reply-To: <20200918130354.1879275-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: qemu-devel@nongnu.org
Date: Fri, 18 Sep 2020 06:13:17 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.53; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o53.zoho.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/18 09:13:24
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
Cc: anthony.perard@citrix.com, pbonzini@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDkxODEzMDM1NC4xODc5
Mjc1LTEtYW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBmYWls
ZWQgdGhlIGRvY2tlci1xdWlja0BjZW50b3M3IGJ1aWxkIHRlc3QuIFBsZWFzZSBmaW5kIHRoZSB0
ZXN0aW5nIGNvbW1hbmRzIGFuZAp0aGVpciBvdXRwdXQgYmVsb3cuIElmIHlvdSBoYXZlIERvY2tl
ciBpbnN0YWxsZWQsIHlvdSBjYW4gcHJvYmFibHkgcmVwcm9kdWNlIGl0CmxvY2FsbHkuCgoKCgoK
ClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAy
MDA5MTgxMzAzNTQuMTg3OTI3NS0xLWFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20vdGVzdGluZy5k
b2NrZXItcXVpY2tAY2VudG9zNy8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1
dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2Vu
ZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

