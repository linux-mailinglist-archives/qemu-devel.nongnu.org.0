Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 617D29FFD1
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Aug 2019 12:26:49 +0200 (CEST)
Received: from localhost ([::1]:34572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2vA8-0001Rd-1A
	for lists+qemu-devel@lfdr.de; Wed, 28 Aug 2019 06:26:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53488)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1i2v8y-000113-Vr
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 06:25:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1i2v8x-0001D3-O8
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 06:25:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59258)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1i2v8x-0001CJ-IX
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 06:25:35 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 09636796FC;
 Wed, 28 Aug 2019 10:25:34 +0000 (UTC)
Received: from gondolin (dhcp-192-222.str.redhat.com [10.33.192.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B6A3E1001B30;
 Wed, 28 Aug 2019 10:25:29 +0000 (UTC)
Date: Wed, 28 Aug 2019 12:25:27 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Message-ID: <20190828122527.59c011c4.cohuck@redhat.com>
In-Reply-To: <20190822115433.12070-1-dgilbert@redhat.com>
References: <20190822115433.12070-1-dgilbert@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Wed, 28 Aug 2019 10:25:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] migration: register_savevm_live doesn't
 need dev
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
Cc: quintela@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org,
 stefanha@redhat.com, samuel.thibault@ens-lyon.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 22 Aug 2019 12:54:33 +0100
"Dr. David Alan Gilbert (git)" <dgilbert@redhat.com> wrote:

> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Commit 78dd48df3 removed the last caller of register_savevm_live for an
> instantiable device (rather than a single system wide device);
> so trim out the parameter.
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  docs/devel/migration.rst       |  3 +--
>  hw/ppc/spapr.c                 |  2 +-
>  hw/s390x/s390-skeys.c          |  2 +-
>  hw/s390x/s390-stattrib.c       |  2 +-
>  hw/s390x/tod.c                 |  2 +-
>  include/migration/register.h   |  3 +--
>  migration/block-dirty-bitmap.c |  2 +-
>  migration/block.c              |  2 +-
>  migration/ram.c                |  2 +-
>  migration/savevm.c             | 23 +----------------------
>  net/slirp.c                    |  2 +-
>  11 files changed, 11 insertions(+), 34 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

