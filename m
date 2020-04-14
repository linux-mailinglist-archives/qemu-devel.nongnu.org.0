Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4A61A8782
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Apr 2020 19:30:16 +0200 (CEST)
Received: from localhost ([::1]:36244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOPO3-0000H4-2N
	for lists+qemu-devel@lfdr.de; Tue, 14 Apr 2020 13:30:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45402)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1jOP70-0007tE-RO
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 13:12:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1jOP6z-0003fS-KB
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 13:12:38 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:58044)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1jOMtS-0004rk-LO; Tue, 14 Apr 2020 10:50:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=4t+igcXbwunFrUwzmwDdQ17O/PVqJEX8t8fBwmKsAg8=; 
 b=MVY1Zio+S/nKCCGVhnpJEDQAkQNikbmwnVSYCUdQ0R+vMrSREWfkXLjmbSPrLRrgSgsXcOOfXrerd6uze0k1kQ/qIc6yXzTrT0RHe5nVD9Sm/KLJWyWeY227ST6Xgpo+iFOLEWylw0h14Q0iEgW6gE1cHpLXC5frpBc/tWkUZVAaFC8uyydaEIxc1rM2nTKCRTno6tMhxklc4UV4MAK/54WKJ2ZWZafBG1/SaGQ43DnJYgGr+PY/DqcOGHriblCEFY4jxC52nbaLQPNPPr8go/yGRUuWTIv7pzRJaULKTAlYIhthAdHYmpEqizj82up6hNP/RqC0sJHDiP8A/66apA==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1jOMtJ-0005XS-DY; Tue, 14 Apr 2020 16:50:21 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1jOMtJ-0006Je-3F; Tue, 14 Apr 2020 16:50:21 +0200
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 07/30] qcow2: Document the Extended L2 Entries feature
In-Reply-To: <781c734c-e53c-76ae-74de-26d9e827e1a2@virtuozzo.com>
References: <cover.1584468723.git.berto@igalia.com>
 <aa1ac3fbb1d42db67d930b76255c9b7b19c07b42.1584468723.git.berto@igalia.com>
 <8c88b96f-c6f5-e06c-73e1-56001089a7ca@redhat.com>
 <781c734c-e53c-76ae-74de-26d9e827e1a2@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Tue, 14 Apr 2020 16:50:21 +0200
Message-ID: <w51o8ru5dg2.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic] [fuzzy]
X-Received-From: 178.60.130.6
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Denis V . Lunev" <den@openvz.org>,
 Anton Nefedov <anton.nefedov@virtuozzo.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri 10 Apr 2020 11:29:59 AM CEST, Vladimir Sementsov-Ogievskiy wrote:
>> Hmm - raw external files are incompatible with backing files. Should
>> we also document that extended L2 entries are incompatible with raw
>> external files? (The text here reminded me about it, but it would be
>> the text earlier at the incompatible feature bits that we edit if we
>> want that additional restriction; compare to the restriction in the
>> autoclear bit 1). After all, when raw external file is enabled, the
>> entire image is allocated, at which point subclusters don't make much
>> sense.
> It still may cache information about zeroed subclusters: gives more
> detailed block-status. But we should mention somehow external
> files. Hm. not only for raw external files, but it is documented that
> cluster can't be unallocated when an external data file is used.

What do you mean by "cluster can't be unallocated" ?

Berto

