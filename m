Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EED26E046
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Sep 2020 18:08:24 +0200 (CEST)
Received: from localhost ([::1]:44892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIwSN-0004Tw-5P
	for lists+qemu-devel@lfdr.de; Thu, 17 Sep 2020 12:08:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kIwO3-0000Ht-44
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 12:03:55 -0400
Resent-Date: Thu, 17 Sep 2020 12:03:55 -0400
Resent-Message-Id: <E1kIwO3-0000Ht-44@lists.gnu.org>
Received: from sender4-of-o57.zoho.com ([136.143.188.57]:21798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kIwO0-0004Ub-0I
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 12:03:54 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1600358619; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Wl+14Qw37Yh6nlBqBlgF1Y/dxtY7uPN+IQnBWE24qzYo1rRb5ISIOW0slCXF2q4RBaXS+EdsbC1ECZ4vkiKYYOuA515L92TRT5Jd+Z6cmzMp7fxasNkrhtNHPel0IckEm4VFq/aCW8IdNYH6of/e0i8YiVeKgb6CZkVi6ZwvGy4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1600358619;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=aEpmrd+eb5zHSiS/AKElwwldrxWnzLODPC8XNi0PSkQ=; 
 b=ItqhMw17jAQ0setVTGIeXNfX3aZjKFZg70jsbvuD16sBnMcmtcIJDqq6m8yQnl2XU1f0QYrn4q6yDxV5EazxS/Bb0d8OdagXVoXN054GI0W3633ZxgK35j3snAL26A6tiQ9aA+D/GP1IjwoasDSf8vRiInz0HeEfV2bg9/jlmaI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1600358616358270.22960269451323;
 Thu, 17 Sep 2020 09:03:36 -0700 (PDT)
Subject: Re: [PATCH] docs: simplify and clarify the platform support rules
Message-ID: <160035861418.8478.212178184531337619@66eaa9a8a123>
In-Reply-To: <20200917155606.1623795-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: berrange@redhat.com
Date: Thu, 17 Sep 2020 09:03:36 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.57; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o57.zoho.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/17 04:07:10
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDkxNzE1NTYwNi4xNjIz
Nzk1LTEtYmVycmFuZ2VAcmVkaGF0LmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBmYWlsZWQgYnVp
bGQgdGVzdCBvbiBGcmVlQlNEIGhvc3QuIFBsZWFzZSBmaW5kIHRoZSBkZXRhaWxzIGJlbG93LgoK
CgoKCgpUaGUgZnVsbCBsb2cgaXMgYXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dz
LzIwMjAwOTE3MTU1NjA2LjE2MjM3OTUtMS1iZXJyYW5nZUByZWRoYXQuY29tL3Rlc3RpbmcuRnJl
ZUJTRC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkg
UGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNr
IHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

