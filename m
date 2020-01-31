Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0518214F124
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jan 2020 18:14:47 +0100 (CET)
Received: from localhost ([::1]:56796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixZsU-00056k-3P
	for lists+qemu-devel@lfdr.de; Fri, 31 Jan 2020 12:14:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59299)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1ixZrG-0004XW-2Z
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 12:13:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1ixZrE-0001Al-2s
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 12:13:28 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:58073)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1ixZrA-0008W9-5J; Fri, 31 Jan 2020 12:13:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=hFtMW8Ja6EVkOdnkKhvShhKJwZX/e0hHBecG2usL4Ns=; 
 b=AzIMiOjWeFzjzmzFX8p6N9VK8f/h30DVic+NDyu1apF3hAbyC4yzO9TAm/7CVQsRYZDbWDAx2IE+tL+ovGWNVUdXqCt2vaoOqeAXhms/Zs+ktXPV4Eqe+FZ/LilWpf9QGke+nLjo6hI3k+tf+zEw0PEpSvZjekaimwHOhU/I7cF0vbD36skcVNaHs+liYTCmz+U9fShH3waYyJrzspBm1NjXNvtrh58nQfwgaMv7n1G5mxJwrrkT9lokp5BNN55svKi+/ITONtlz+6Uhkg4Mm6JCVcMV5tEjIdrngmR44Orx+//xRiDDz5+KRLLzXk65y8Ftq3M8DLB3swpiC/S+IQ==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1ixZqr-00021c-LS; Fri, 31 Jan 2020 18:13:05 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1ixZqr-0006xU-4q; Fri, 31 Jan 2020 18:13:05 +0100
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Subject: Re: [PATCH v11 1/2] docs: improve qcow2 spec about extending image
 header
In-Reply-To: <20200131142219.3264-2-vsementsov@virtuozzo.com>
References: <20200131142219.3264-1-vsementsov@virtuozzo.com>
 <20200131142219.3264-2-vsementsov@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Fri, 31 Jan 2020 18:13:05 +0100
Message-ID: <w51pnezzh0e.fsf@maestria.local.igalia.com>
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, armbru@redhat.com,
 qemu-devel@nongnu.org, dplotnikov@virtuozzo.com, den@openvz.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri 31 Jan 2020 03:22:18 PM CET, Vladimir Sementsov-Ogievskiy wrote:
> Make it more obvious how to add new fields to the version 3 header and
> how to interpret them.
>
> The specification is adjusted so that for new defined optional fields:
>
> 1. Software may support some of these optional fields and ignore the
>    others, which means that features may be backported to downstream
>    Qemu independently.
> 2. If we want to add incompatible field (or a field, for which some its
>    values would be incompatible), it must be accompanied by
>    incompatible feature bit.
>
> Also the concept of "default is zero" is clarified, as it's strange to
> say that the value of the field is assumed to be zero for the software
> version which don't know about the field at all and don't know how to
> treat it be it zero or not.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

