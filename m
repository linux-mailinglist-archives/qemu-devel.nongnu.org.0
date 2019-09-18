Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EEDB5E29
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Sep 2019 09:34:52 +0200 (CEST)
Received: from localhost ([::1]:55352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAUUF-0002Bq-AY
	for lists+qemu-devel@lfdr.de; Wed, 18 Sep 2019 03:34:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41338)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iAUT7-0001Lg-Rb
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 03:33:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iAUT6-0001Zz-Pi
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 03:33:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40520)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1iAUT2-0001Yr-FJ; Wed, 18 Sep 2019 03:33:36 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0C3528980EA;
 Wed, 18 Sep 2019 07:33:35 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-230.ams2.redhat.com
 [10.36.116.230])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A08D60606;
 Wed, 18 Sep 2019 07:33:13 +0000 (UTC)
Date: Wed, 18 Sep 2019 09:33:12 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: John Snow <jsnow@redhat.com>
Message-ID: <20190918073312.GA5207@localhost.localdomain>
References: <156871562997.196432.17776290406203122029.stgit@bahia.lan>
 <156871564329.196432.5930574495661947805.stgit@bahia.lan>
 <19e78ae8-96dc-6154-6572-d7176057eeb7@redhat.com>
 <20190917144631.GF4824@localhost.localdomain>
 <8cbb8459-a4bb-2efc-c9f8-d9e95230b3ac@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8cbb8459-a4bb-2efc-c9f8-d9e95230b3ac@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Wed, 18 Sep 2019 07:33:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 02/17] block: Pass local error object
 pointer to error_append_hint()
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Eric Farman <farman@linux.ibm.com>,
 Greg Kurz <groug@kaod.org>, Yuval Shaia <yuval.shaia@oracle.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <rth@twiddle.net>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 17.09.2019 um 21:10 hat John Snow geschrieben:
> 
> 
> On 9/17/19 10:46 AM, Kevin Wolf wrote:
> > Am 17.09.2019 um 16:39 hat Eric Blake geschrieben:
> >> On 9/17/19 5:20 AM, Greg Kurz wrote:
> >>> Ensure that hints are added even if errp is &error_fatal or &error_abort.
> >>>
> >>> Signed-off-by: Greg Kurz <groug@kaod.org>
> >>> ---
> >>>  block/backup.c       |    7 +++++--
> >>>  block/dirty-bitmap.c |    7 +++++--
> >>>  block/file-posix.c   |   20 +++++++++++++-------
> >>>  block/gluster.c      |   23 +++++++++++++++--------
> >>>  block/qcow.c         |   10 ++++++----
> >>>  block/qcow2.c        |    7 +++++--
> >>>  block/vhdx-log.c     |    7 +++++--
> >>>  block/vpc.c          |    7 +++++--
> >>>  8 files changed, 59 insertions(+), 29 deletions(-)
> >>>
> >>> diff --git a/block/backup.c b/block/backup.c
> >>> index 763f0d7ff6db..d8c422a0e3bc 100644
> >>> --- a/block/backup.c
> >>> +++ b/block/backup.c
> >>> @@ -602,11 +602,14 @@ static int64_t backup_calculate_cluster_size(BlockDriverState *target,
> >>>                      BACKUP_CLUSTER_SIZE_DEFAULT);
> >>>          return BACKUP_CLUSTER_SIZE_DEFAULT;
> >>>      } else if (ret < 0 && !target->backing) {
> >>> -        error_setg_errno(errp, -ret,
> >>> +        Error *local_err = NULL;
> >>
> >> Can we go with the shorter name 'err' instead of 'local_err'?  I know,
> >> we aren't consistent (both styles appear throughout the tree), but the
> >> shorter style is more appealing to me.
> > 
> > I like local_err better because it's easier to distinguish from errp.
> > The compiler might catch it if you use the wrong one because one is
> > Error* and the other is Error**, but as a reviewer, I can still get
> > confused.
> 
> Doesn't that sound like a striking reason for condemnation of this
> entire model?

Might be, but do you have a better idea?

Kevin

