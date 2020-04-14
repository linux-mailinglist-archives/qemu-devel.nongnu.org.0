Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AABC91A88D9
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Apr 2020 20:16:20 +0200 (CEST)
Received: from localhost ([::1]:36970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOQ6d-0003Uk-6y
	for lists+qemu-devel@lfdr.de; Tue, 14 Apr 2020 14:16:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57114)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1jOQ4Z-00027Q-Dm
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 14:14:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1jOQ4X-0007ST-Be
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 14:14:10 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:49535)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1jOQ4W-0007Ib-Nu; Tue, 14 Apr 2020 14:14:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=gDpXkzNzsvU345GogXYNDjW3mv0RXkGt8x/+wrkTnxg=; 
 b=jMsnVOi0yHyjaAVKRoJD6N3v7YXfGbrmHCSN6alk7onMbXHa5/QNcBLgBTruXtmmd2xvyGlCtlLfLDdWiMNn7Bzc6cas73/spp5yzOO7cg3GCn8AkjdOeXecBiFqbC61vze/sJ2WQW8dRYPerlFRtj1twteesBdeDRuIISqz+03voDeYB3SOT7hOclErX39Or12iq1Ko0Z5ZQAOPv98R4pggArOTVDR/w2rrC4eMkJRQlMPDMpVkKGfSJf5gUMkvhgREyPRJDqb/A04gGR2NeRturr/9h6eTQ4Yywkfz1rY/+opJ2DscfKCgnwe4UzQnC5rkDsKdjrGhIUIqjyOj7g==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1jOQ4B-00075u-1V; Tue, 14 Apr 2020 20:13:47 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1jOQ4A-0004pp-OK; Tue, 14 Apr 2020 20:13:46 +0200
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 07/30] qcow2: Document the Extended L2 Entries feature
In-Reply-To: <094350fe-736a-d566-7dd7-716fd87eee81@virtuozzo.com>
References: <cover.1584468723.git.berto@igalia.com>
 <aa1ac3fbb1d42db67d930b76255c9b7b19c07b42.1584468723.git.berto@igalia.com>
 <8c88b96f-c6f5-e06c-73e1-56001089a7ca@redhat.com>
 <781c734c-e53c-76ae-74de-26d9e827e1a2@virtuozzo.com>
 <w51o8ru5dg2.fsf@maestria.local.igalia.com>
 <83922517-b5f5-2d4a-6518-c1912942ad27@virtuozzo.com>
 <w51lfmyrpvq.fsf@maestria.local.igalia.com>
 <094350fe-736a-d566-7dd7-716fd87eee81@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Tue, 14 Apr 2020 20:13:46 +0200
Message-ID: <w51imi2rl45.fsf@maestria.local.igalia.com>
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

On Tue 14 Apr 2020 08:06:38 PM CEST, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> wrote:
>>> In other words, cluster can't be unallocated with data file in use.
>> 
>> I still don't follow... clusters can be unallocated, and when you
>> create a new image they are indeed unallocated.
>
> with external data file? Than we probably need to fix spec..
>
> unallocated mean that offset is 0, and bit 63 is unset. But this can't
> be when and exernal data file is used, accordingly to the spec.
>
> Or what am I missing?

   $ qemu-img create -f qcow2 -o data_file=data.raw img.qcow2 1M
   $ qemu-io -c 'write 0 192k' img.qcow2 
   $ qemu-io -c 'write -z -u 64k 64k' img.qcow2 

Clusters #0 and #2 are allocated (offsets 0x00000 and 0x20000), cluster
#1 is unallocated (offset 0, bit 63 unset, bit 0 -all zeroes- set).

Berto

