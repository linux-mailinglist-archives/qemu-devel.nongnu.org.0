Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3AA1626C3
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Feb 2020 14:05:38 +0100 (CET)
Received: from localhost ([::1]:34379 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j42ZF-0008Ml-R9
	for lists+qemu-devel@lfdr.de; Tue, 18 Feb 2020 08:05:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40259)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1j42Hl-0003vF-W3
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 07:47:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1j42Hk-0003az-W9
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 07:47:33 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:29338
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1j42Hk-0003ad-So
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 07:47:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582030051;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nNfLoJ3DaY3UOWBIwgxG3fSeou/ayuvuxmGuZdRCgII=;
 b=TA4lVPba3qLyQJ7WO9fdwJT57fFQIwPnsNHlhWUJj1gVLQi0AVBa9vEnWgcEBGe5EkRHCQ
 A+fR8AmS8Y4WqT+ZhvJz09CfsLZokvnZeSSVKL8CZcywk97XJ0c1KfCCw8C06VF9jpbJ/d
 PL7REFP1/Uvp/zeH3smSY4g1H1mP0AQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-dP-RcCD0ND6gq_HYbI1fgQ-1; Tue, 18 Feb 2020 07:47:27 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4C04100550E;
 Tue, 18 Feb 2020 12:47:26 +0000 (UTC)
Received: from redhat.com (ovpn-117-81.ams2.redhat.com [10.36.117.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 89CBC85748;
 Tue, 18 Feb 2020 12:47:23 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] migration/block: rename BLOCK_SIZE macro
In-Reply-To: <20200218110209.800294-1-stefanha@redhat.com> (Stefan Hajnoczi's
 message of "Tue, 18 Feb 2020 11:02:09 +0000")
References: <20200218110209.800294-1-stefanha@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Tue, 18 Feb 2020 13:47:20 +0100
Message-ID: <87blpwm59j.fsf@secure.laptop>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: dP-RcCD0ND6gq_HYbI1fgQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Reply-To: quintela@redhat.com
Cc: Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Stefan Hajnoczi <stefanha@redhat.com> wrote:
> Both <linux/fs.h> and <sys/mount.h> define BLOCK_SIZE macros.  Avoiding
> using that name in block/migration.c.
>
> I noticed this when including <liburing.h> (Linux io_uring) from
> "block/aio.h" and compilation failed.  Although patches adding that
> include haven't been sent yet, it makes sense to rename the macro now in
> case someone else stumbles on it in the meantime.
>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


