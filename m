Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC701A850D
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Apr 2020 18:33:07 +0200 (CEST)
Received: from localhost ([::1]:34188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOOUk-0008CK-Jn
	for lists+qemu-devel@lfdr.de; Tue, 14 Apr 2020 12:33:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52949)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1jOOSf-0006R6-PS
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 12:31:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1jOOSe-00010y-Kn
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 12:30:57 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:51599)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1jOOSd-0000xh-Ov; Tue, 14 Apr 2020 12:30:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=BVVXGDXpudVw7nOjZv5M0PlmfT18ZPrVoCl7zON5WTs=; 
 b=IGN3S6SIag6kLBHVv21JHa3MPdNPa95C3cFMr/eAAFmMT36D9J0h0jeZoWM2+VCeTIteWtLnoGYXXaAvdAFmNmuUy24TLRsNZqNgmEtg08iWhEJSAckC9tYrzvwi5I6nrSkrL2vMbvPPD7glxCyu4JEShqyP7F1gG4QjJ2U77CpusvNdTDYk7nRRxXxfAAYey3V8wLqNneUukU6fr79f5FDqv4MEKsrZtpmsqDaN32ymWSpPGfJy0WMFnOiPpOxEp3L4rKbEiHzwqmAvJYKYnFMf9Krs1ZdRwp6HlHyHa1Lr57bTcJc4sRJwgJiwnKtRKLwXWuetIhY3grxrWEtSRg==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1jOOSY-0001YS-1s; Tue, 14 Apr 2020 18:30:50 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1jOOSX-0005pk-No; Tue, 14 Apr 2020 18:30:49 +0200
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 07/30] qcow2: Document the Extended L2 Entries feature
In-Reply-To: <83922517-b5f5-2d4a-6518-c1912942ad27@virtuozzo.com>
References: <cover.1584468723.git.berto@igalia.com>
 <aa1ac3fbb1d42db67d930b76255c9b7b19c07b42.1584468723.git.berto@igalia.com>
 <8c88b96f-c6f5-e06c-73e1-56001089a7ca@redhat.com>
 <781c734c-e53c-76ae-74de-26d9e827e1a2@virtuozzo.com>
 <w51o8ru5dg2.fsf@maestria.local.igalia.com>
 <83922517-b5f5-2d4a-6518-c1912942ad27@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Tue, 14 Apr 2020 18:30:49 +0200
Message-ID: <w51lfmyrpvq.fsf@maestria.local.igalia.com>
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

On Tue 14 Apr 2020 06:19:18 PM CEST, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> wrote:
>>> It still may cache information about zeroed subclusters: gives more
>>> detailed block-status. But we should mention somehow external
>>> files. Hm. not only for raw external files, but it is documented that
>>> cluster can't be unallocated when an external data file is used.
>> 
>> What do you mean by "cluster can't be unallocated" ?
>
> I mean this sentence from qcow2.txt:
>
>                     "The offset may only be 0 with
>                      bit 63 set (indicating a host cluster offset of 0) when an
>                      external data file is used."
>
> In other words, cluster can't be unallocated with data file in use.

I still don't follow... clusters can be unallocated, and when you create
a new image they are indeed unallocated.

Bit 63 (QCOW_OFLAG_COPIED) is what indicates if a cluster is allocated
or not, and you can unmap an allocated cluster with 'write -z -u'.

Berto

