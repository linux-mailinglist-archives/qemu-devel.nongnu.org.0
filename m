Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3D137519D
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 11:37:49 +0200 (CEST)
Received: from localhost ([::1]:57304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leaS4-0005Du-Aa
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 05:37:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1leaP7-0003OU-K3
 for qemu-devel@nongnu.org; Thu, 06 May 2021 05:34:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1leaP5-0001RD-5l
 for qemu-devel@nongnu.org; Thu, 06 May 2021 05:34:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620293680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2fvljdMWGQ5xUQG9/YKukKsT4frrzxMPnePVfJAj2EY=;
 b=BNi2ufKvx9DekWeLtCwG1pHcluZ6JL8bsOX6Dcjc7xXZxBlKuzryRScNLzgotZyIlY051I
 TlrOPogJwNgsJg+/a1PJK2rPk4+p1zQrHg1C8w4UKlcUjrGl1FEGYD28kQsXfPxymi66ij
 D1qh2ZuoQ+1h9907EfCkWiTZIinesmU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95-B8ocSQUtNDa8m4CGhi6Qmg-1; Thu, 06 May 2021 05:34:39 -0400
X-MC-Unique: B8ocSQUtNDa8m4CGhi6Qmg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6718D107ACE4;
 Thu,  6 May 2021 09:34:37 +0000 (UTC)
Received: from paraplu.home (ovpn-115-104.ams2.redhat.com [10.36.115.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 14E681002388;
 Thu,  6 May 2021 09:34:29 +0000 (UTC)
Date: Thu, 6 May 2021 11:34:27 +0200
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 2/3] docs/interop/bitmaps: use blockdev-backup
Message-ID: <YJO4I70hD0VsDc7h@paraplu.home>
References: <20210505135803.67896-1-vsementsov@virtuozzo.com>
 <20210505135803.67896-3-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210505135803.67896-3-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: pkrempa@redhat.com, berrange@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, jsnow@redhat.com, xiechanglong.d@gmail.com,
 qemu-devel@nongnu.org, armbru@redhat.com, yur@virtuozzo.com,
 nshirokovskiy@virtuozzo.com, wencongyang2@huawei.com, den@openvz.org,
 dim@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 05, 2021 at 04:58:02PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> We are going to deprecate drive-backup, so use modern interface here.
> In examples where target image creation is shown, show blockdev-add as
> well. If target creation omitted, omit blockdev-add as well.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  docs/interop/bitmaps.rst | 285 +++++++++++++++++++++++++++++----------
>  1 file changed, 215 insertions(+), 70 deletions(-)

Looks fine to me.  I have a couple of nits below, perhaps whoever is
applying the patch can tweak them.  FWIW:

Reviewed-by: Kashyap Chamarthy <kchamart@redhat.com>    

> diff --git a/docs/interop/bitmaps.rst b/docs/interop/bitmaps.rst
> index 059ad67929..ef95090c81 100644
> --- a/docs/interop/bitmaps.rst
> +++ b/docs/interop/bitmaps.rst
> @@ -539,12 +539,11 @@ other partial disk images on top of a base image to reconstruct a full backup
>  from the point in time at which the incremental backup was issued.
>  
>  The "Push Model" here references the fact that QEMU is "pushing" the modified
> -blocks out to a destination. We will be using the `drive-backup
> -<qemu-qmp-ref.html#index-drive_002dbackup>`_ and `blockdev-backup
> -<qemu-qmp-ref.html#index-blockdev_002dbackup>`_ QMP commands to create both
> +blocks out to a destination. We will be using the  `blockdev-backup
> +<qemu-qmp-ref.html#index-blockdev_002dbackup>`_ QMP command to create both
>  full and incremental backups.
>  
> -Both of these commands are jobs, which have their own QMP API for querying and
> +The command is a job, which has its own QMP API for querying and

nit: s/job/background job/

>  management documented in `Background jobs
>  <qemu-qmp-ref.html#Background-jobs>`_.
>  
> @@ -557,6 +556,10 @@ create a new incremental backup chain attached to a drive.
>  This example creates a new, full backup of "drive0" and accompanies it with a
>  new, empty bitmap that records writes from this point in time forward.
>  
> +The target may be created with help of `blockdev-add

It is less ambiguous (at least to my eyes) to replace "may" with "can".

nit: s/with help of/with the help of/

> +<qemu-qmp-ref.html#index-blockdev_002dadd>`_ or `blockdev-create
> +<qemu-qmp-ref.html#index-blockdev_002dcreate>`_ command.
> +
>  .. note:: Any new writes that happen after this command is issued, even while
>            the backup job runs, will be written locally and not to the backup
>            destination. These writes will be recorded in the bitmap
  
[...]

-- 
/kashyap


