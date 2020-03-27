Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF7B19565F
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Mar 2020 12:30:06 +0100 (CET)
Received: from localhost ([::1]:40516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHnBe-0001i2-1F
	for lists+qemu-devel@lfdr.de; Fri, 27 Mar 2020 07:30:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52529)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1jHnA5-0000XY-MV
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 07:28:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1jHnA4-0005OQ-7y
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 07:28:29 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:44855)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1jHnA3-0005HH-Uw
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 07:28:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585308507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9FqNCdDJBHOW7K9XyEu8xHCtwPj49Eypexf7kyGkedw=;
 b=bSEOUh+pIUquwIILZwQun/Ptsda7LRLk2hSOoFJaKomZYQ7D13VYpu1PA+izH8HQgQIpKT
 YVLc9ClFLU+0qR30DYtPnflhtw8bcj8nUeklxbT77MBWmCp8bwqsLIQPAG/A8VBnNS7e1Z
 9Vi+srVVIGG2Jgl/ff1fTxPW+N9ThXg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-81-0DUJSkJvNLWQ4_ImoxVtHA-1; Fri, 27 Mar 2020 07:28:25 -0400
X-MC-Unique: 0DUJSkJvNLWQ4_ImoxVtHA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9DA3C1083E86;
 Fri, 27 Mar 2020 11:28:19 +0000 (UTC)
Received: from work-vm (ovpn-113-109.ams2.redhat.com [10.36.113.109])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FC2C92FA9;
 Fri, 27 Mar 2020 11:28:17 +0000 (UTC)
Date: Fri, 27 Mar 2020 11:28:14 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH] monitor/hmp-cmds: add units for mirate_parameters.
Message-ID: <20200327112814.GD2786@work-vm>
References: <20200327073210.198080-1-maozhongyi@cmss.chinamobile.com>
 <20200327092951.bu4ju7rh53ig5t3l@steredhat>
MIME-Version: 1.0
In-Reply-To: <20200327092951.bu4ju7rh53ig5t3l@steredhat>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: qemu-devel@nongnu.org, Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Stefano Garzarella (sgarzare@redhat.com) wrote:
> Hi Mao,
>=20
> On Fri, Mar 27, 2020 at 03:32:10PM +0800, Mao Zhongyi wrote:
> > When running:
> > (qemu) info migrate_parameters
> > announce-initial: 50 ms
> > announce-max: 550 ms
> > announce-step: 100 ms
> > compress-wait-thread: on
> > ...
> > max-bandwidth: 33554432 bytes/second
> > downtime-limit: 300 milliseconds
> > x-checkpoint-delay: 20000
> > ...
> > xbzrle-cache-size: 67108864
> >=20
> > add units for the parameters 'x-checkpoint-delay' and
> > 'xbzrle-cache-size', it's easier to read.
> >=20
> > Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
> > ---
> >  monitor/hmp-cmds.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> > index 2a900a528a..8d22f96e57 100644
> > --- a/monitor/hmp-cmds.c
> > +++ b/monitor/hmp-cmds.c
> > @@ -440,7 +440,7 @@ void hmp_info_migrate_parameters(Monitor *mon, cons=
t QDict *qdict)
> >              MigrationParameter_str(MIGRATION_PARAMETER_DOWNTIME_LIMIT)=
,
> >              params->downtime_limit);
> >          assert(params->has_x_checkpoint_delay);
> > -        monitor_printf(mon, "%s: %u\n",
> > +        monitor_printf(mon, "%s: %u" " milliseconds\n",
>                                        ^
> here we can remove the space and use a single string "%s: %u milliseconds=
\n"

Yes.

> I've noticed that we use both ms or milliseconds, if you want to clean up=
 in a
> separate patch, maybe we could use one of these everywhere. (I vote for '=
ms')

I do prefer 'ms', however we do seem to just use milliseconds in
info migrate

so we should probably stick to it.

Dave

> Thanks,
> Stefano
>=20
> >              MigrationParameter_str(MIGRATION_PARAMETER_X_CHECKPOINT_DE=
LAY),
> >              params->x_checkpoint_delay);
> >          assert(params->has_block_incremental);
> > @@ -453,7 +453,7 @@ void hmp_info_migrate_parameters(Monitor *mon, cons=
t QDict *qdict)
> >          monitor_printf(mon, "%s: %s\n",
> >              MigrationParameter_str(MIGRATION_PARAMETER_MULTIFD_COMPRES=
SION),
> >              MultiFDCompression_str(params->multifd_compression));
> > -        monitor_printf(mon, "%s: %" PRIu64 "\n",
> > +        monitor_printf(mon, "%s: %" PRIu64 " bytes\n",
> >              MigrationParameter_str(MIGRATION_PARAMETER_XBZRLE_CACHE_SI=
ZE),
> >              params->xbzrle_cache_size);
> >          monitor_printf(mon, "%s: %" PRIu64 "\n",
> > --=20
> > 2.17.1
> >=20
> >=20
> >=20
> >=20
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


