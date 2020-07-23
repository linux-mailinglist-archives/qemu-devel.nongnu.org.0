Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 885BA22ABDA
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jul 2020 11:39:06 +0200 (CEST)
Received: from localhost ([::1]:47986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jyXgv-0001J6-B4
	for lists+qemu-devel@lfdr.de; Thu, 23 Jul 2020 05:39:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jyXgB-0000sV-Ny
 for qemu-devel@nongnu.org; Thu, 23 Jul 2020 05:38:19 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:42694
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jyXg9-0003mU-Gi
 for qemu-devel@nongnu.org; Thu, 23 Jul 2020 05:38:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595497096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dkcoufi+Qciew64IvzG7GHnsK5TQPYY5rXmkPShC2XY=;
 b=Obyulu6crRxjs+pQDNjqUroV6K4R9bnzOr0GKf1vppwSUmxDohGW5pbsAArfz20xZ9e+ci
 b27u8uDDL/IziRdY6Q4uxaDoWywElIwMx6d4aKhlfsOAt/RsPwBAHXriF93kUhGpz3CrsD
 5hKGIqb+3rMT2xYhSOX61wh8lS9c5Jk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-HGbkhgKlOf-2PfDnYBGHvQ-1; Thu, 23 Jul 2020 05:38:14 -0400
X-MC-Unique: HGbkhgKlOf-2PfDnYBGHvQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29DC31005510;
 Thu, 23 Jul 2020 09:38:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C7B7C1A8F7;
 Thu, 23 Jul 2020 09:38:12 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 48595111CA26; Thu, 23 Jul 2020 11:38:11 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH for-5.1] sd/milkymist-memcard: Fix format string
References: <20200722204054.1400555-1-sw@weilnetz.de>
Date: Thu, 23 Jul 2020 11:38:11 +0200
In-Reply-To: <20200722204054.1400555-1-sw@weilnetz.de> (Stefan Weil's message
 of "Wed, 22 Jul 2020 22:40:54 +0200")
Message-ID: <87k0yuo9ks.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/22 22:13:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Michael Walle <michael@walle.cc>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Stefan Weil <sw@weilnetz.de> writes:

Let's add

  Fixes: b98e8d1230ff7023bb34ddeb7194424dfcbaf789

> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  hw/sd/milkymist-memcard.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/sd/milkymist-memcard.c b/hw/sd/milkymist-memcard.c
> index afdb8aa0c0..11f61294fc 100644
> --- a/hw/sd/milkymist-memcard.c
> +++ b/hw/sd/milkymist-memcard.c
> @@ -281,7 +281,7 @@ static void milkymist_memcard_realize(DeviceState *dev, Error **errp)
>      carddev = qdev_new(TYPE_SD_CARD);
>      qdev_prop_set_drive(carddev, "drive", blk);
>      if (!qdev_realize_and_unref(carddev, BUS(&s->sdbus), &err)) {
> -        error_propagate_prepend(errp, err, "failed to init SD card: %s");
> +        error_propagate_prepend(errp, err, "failed to init SD card");
>          return;
>      }
>      s->enabled = blk && blk_is_inserted(blk);

Reviewed-by: Markus Armbruster <armbru@redhat.com>

Missed because error_propagate_prepend() lacks GCC_FMT_ATTR().  I'll fix
that.  Since the fix needs to be on top of this patch, me taking both
patches through my tree would be easier for me, assuming Michael doesn't
mind.

Thanks for the fix, Stefan!


