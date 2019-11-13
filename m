Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8621DFBB15
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Nov 2019 22:49:38 +0100 (CET)
Received: from localhost ([::1]:51356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iV0W9-0001le-9U
	for lists+qemu-devel@lfdr.de; Wed, 13 Nov 2019 16:49:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46278)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lekiravi@yandex-team.ru>) id 1iV0V1-0001Jm-KS
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 16:48:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <lekiravi@yandex-team.ru>) id 1iV0Uy-0004cl-HQ
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 16:48:25 -0500
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:46578)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <lekiravi@yandex-team.ru>)
 id 1iV0Uu-0004Zs-TZ
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 16:48:22 -0500
Received: from mxbackcorp2j.mail.yandex.net (mxbackcorp2j.mail.yandex.net
 [IPv6:2a02:6b8:0:1619::119])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 2E1BD2E16C8;
 Thu, 14 Nov 2019 00:48:15 +0300 (MSK)
Received: from localhost (localhost [::1])
 by mxbackcorp2j.mail.yandex.net (mxbackcorp/Yandex) with ESMTP id
 liPR88HdA8-mEtaQ318; Thu, 14 Nov 2019 00:48:15 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1573681695; bh=opMJRFDzo/lGyOBiZ3GwQd8Bgqno9YMLuEx8/SnixVU=;
 h=Cc:Subject:Date:References:To:From:Message-Id;
 b=h9jSULIfNKREsLa8vZuawJpox+niaIYiS4qYqhWwkgA27YysBuYfbz8UkJVNjjJSw
 zMbcD/Ielb8BT+XJqLOCTd2Fe8AnH7Apo6zvK7XaD7Q1OSOSfnY0qg6hCMM0lfGCe3
 mmP/gl5QagO3Q9xvCpuHN0U7fhrPTS0DF41HwhBU=
Authentication-Results: mxbackcorp2j.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000161690
X-Yandex-Avir: 1
Received: from mxbackcorp2j.mail.yandex.net (localhost [::1])
 by mxbackcorp2j.mail.yandex.net with LMTP id eN6ikTim6Y-aOaHXSu8
 for <lekiravi@yandex-team.ru>; Thu, 14 Nov 2019 00:48:04 +0300
Received: by sas1-fc7737ec834f.qloud-c.yandex.net with HTTP;
 Thu, 14 Nov 2019 00:48:04 +0300
From: Alexey Kirillov <lekiravi@yandex-team.ru>
To: Eric Blake <eblake@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Markus Armbruster <armbru@redhat.com>
References: <20191113212516.13606-1-lekiravi@yandex-team.ru>
 <f906f303-54ec-79e2-1943-d172c81d7055@redhat.com>
Subject: Re: [PATCH 0/2] Introducing QMP query-netdevs command
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Thu, 14 Nov 2019 00:48:14 +0300
Message-Id: <1802781573681684@sas1-fc7737ec834f.qloud-c.yandex.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 95.108.205.193
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jan Kiszka <jan.kiszka@siemens.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Vincenzo Maffione <v.maffione@gmail.com>,
 "yc-core@yandex-team.ru" <yc-core@yandex-team.ru>,
 Giuseppe Lettieri <g.lettieri@iet.unipi.it>, Luigi Rizzo <rizzo@iet.unipi.it>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

That's a good idea, thanks! I'll do this in V2.

14.11.2019, 00:32, "Eric Blake" <eblake@redhat.com>:
>
> Can we rewrite the existing HMP command to call into the new QMP command?
>


-- 
Alex Kirillov
Yandex.Cloud


