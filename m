Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BEB26E1C6
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Sep 2020 19:08:05 +0200 (CEST)
Received: from localhost ([::1]:58234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIxO8-0001Ws-5g
	for lists+qemu-devel@lfdr.de; Thu, 17 Sep 2020 13:08:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kIxMy-0000RR-Nn
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 13:06:52 -0400
Resent-Date: Thu, 17 Sep 2020 13:06:52 -0400
Resent-Message-Id: <E1kIxMy-0000RR-Nn@lists.gnu.org>
Received: from sender4-of-o57.zoho.com ([136.143.188.57]:21718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kIxMw-00065e-93
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 13:06:52 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1600362400; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=N7yqbK7Nt4godrTKophopylwrQJDa0XOWFwIq8tvbBtCumq46/iE3tAZ1IGTPjugYe7b4ERayQK1i2usmJuom/1dK3oS5rnKrrLhFE7uF5IcqaSoZUt88JuiD3ghYHAdyw3M1cExR58+E9xWn4F95r85oMDYz0d6HyfCYAxauwc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1600362400;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=+U1hM3bd7ClMXYijud1cGapIUbeQsgT6d+vhFoe/MiA=; 
 b=TqevRHujIK3DGfxFMXtM8hPSyI6JtqrsAcYTBUk4/Og9czdotm9mkh3ARrIBYygVBt8P9ZjQHqR9KtM2HH858vx00a3YqrDg4BVM8+FC03oAUDfl7XoovJClsXuoOfoHuxdJ0QEQNrJN2wlrSCE6QwKVXo4tiw9bAiwgwoDBtPw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1600362398694686.947421376232;
 Thu, 17 Sep 2020 10:06:38 -0700 (PDT)
Subject: Re: [PATCH] tests/acceptance: Disable tests dependent of unreliable
 apt.armbian.com
Message-ID: <160036239659.8478.9529658265350711467@66eaa9a8a123>
In-Reply-To: <20200917163954.50514-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: philmd@redhat.com
Date: Thu, 17 Sep 2020 10:06:38 -0700 (PDT)
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
Cc: ehabkost@redhat.com, qemu-devel@nongnu.org, wainersm@redhat.com,
 kraxel@redhat.com, pavel.dovgaluk@ispras.ru, crosa@redhat.com,
 pbonzini@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDkxNzE2Mzk1NC41MDUx
NC0xLXBoaWxtZEByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIGZhaWxlZCBidWlsZCB0
ZXN0IG9uIEZyZWVCU0QgaG9zdC4gUGxlYXNlIGZpbmQgdGhlIGRldGFpbHMgYmVsb3cuCgoKCgoK
ClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAy
MDA5MTcxNjM5NTQuNTA1MTQtMS1waGlsbWRAcmVkaGF0LmNvbS90ZXN0aW5nLkZyZWVCU0QvP3R5
cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcg
W2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRj
aGV3LWRldmVsQHJlZGhhdC5jb20=

