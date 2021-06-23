Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DD93B1BD2
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 15:59:57 +0200 (CEST)
Received: from localhost ([::1]:38562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw3Q4-0003C5-H6
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 09:59:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1lw3P1-0001n7-TM
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 09:58:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1lw3Oz-0002L9-4U
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 09:58:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624456727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+va21f1pZH7v+zV9ZrwMIs+bCiqMQawd4O28bwxJYCM=;
 b=CZ9wBBv8wqnVmFnPYGxacb/RVXQXRh3EpiORRXHg1KsilI1juTt+Uw0xmqycfz4pW4vHDa
 qJjRDBMu9j4J8GY6L+bdz4BWiOK1CpcwXnXp3NdV97hfmjzbN2DF/bwhDdiOuJp/enOL+Q
 D8agS5zek54ZF5tSnxe5IbJrR9TCpa0=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-MMTdZM6pMV-lGRPkG8rQBQ-1; Wed, 23 Jun 2021 09:58:45 -0400
X-MC-Unique: MMTdZM6pMV-lGRPkG8rQBQ-1
Received: by mail-oo1-f72.google.com with SMTP id
 h12-20020a4add8c0000b029024bea4e22afso1743916oov.19
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 06:58:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+va21f1pZH7v+zV9ZrwMIs+bCiqMQawd4O28bwxJYCM=;
 b=hG1RjASprEov6KMkNHsUDUQvkoHRHJywiQMmGoK3O58Vvr+JMVtXhy7ezFNxpn64Tt
 vyZmfiVTKLQtCBhUnlTWr5PuqS3EROIXn1k60RGb2vB8YNd5z72ib6/GFs3eJRYno/Ms
 7/uU2MdATJrA+689siXBouHIAQ/g/PWBHZ4Rj4gStI31sfrgtnHZERGizUJ+gDtzRo7X
 PTAO0YGCcbdifEXk5ZE6zDNsPPY/17CI7JtufDOUJNx+78MMtKnoD71xsUvd9S+hwANR
 vVWyYjWz1WBnq7OzIAzJSj6LaeSJumnLBFsyyHeB6xRLmsuPFkosoh10Y2ZL9DpCI6MH
 vt3w==
X-Gm-Message-State: AOAM531drv2XCTZotYO0SSQqWZqMj7hUl++6ENwtdZz4ti1DInxHYVO/
 O+zbXIlxlusnYa3GGdXuLO2gn68l4U+SLpo1IYnP2S7qt6Y6J4L2AwpHGcp05HkYUDosOvHFCL8
 YmGEDr/OGRt44ioZvAhNKumzvpwG+IfU=
X-Received: by 2002:a9d:6081:: with SMTP id m1mr36604otj.226.1624456725098;
 Wed, 23 Jun 2021 06:58:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzsV5PUbf3EmTzlwQd7+unzVgnxaWBhMc5TzGWCoOcNIb9rXSk/MPb92kfX7yyv0yGBNuMFeV5g7pLBnojW6w=
X-Received: by 2002:a9d:6081:: with SMTP id m1mr36590otj.226.1624456724917;
 Wed, 23 Jun 2021 06:58:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210611140157.1366738-1-eblake@redhat.com>
 <20210611190316.1424729-1-eblake@redhat.com>
 <YNID9rbo+RdwklCf@redhat.com>
 <CAMRbyyt5qsVan8dOF=HHvqqo92zwTBRucnfA_UEOOmRMqiyaAQ@mail.gmail.com>
 <YNL3kpqnhi15glTC@redhat.com>
In-Reply-To: <YNL3kpqnhi15glTC@redhat.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Wed, 23 Jun 2021 16:58:28 +0300
Message-ID: <CAMRbyyuik1Q=WMSpePz6T+0bEnau0CFWbA4VA9GBf6+mrCZS3Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/1] qemu-img: Add "backing":true to unallocated map
 segments
To: Kevin Wolf <kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsoffer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 23, 2021 at 11:58 AM Kevin Wolf <kwolf@redhat.com> wrote:
>
> Am 22.06.2021 um 18:56 hat Nir Soffer geschrieben:
> > On Tue, Jun 22, 2021 at 6:38 PM Kevin Wolf <kwolf@redhat.com> wrote:
> > >
> > > Am 11.06.2021 um 21:03 hat Eric Blake geschrieben:
> > > > To save the user from having to check 'qemu-img info --backing-chain'
> > > > or other followup command to determine which "depth":n goes beyond the
> > > > chain, add a boolean field "backing" that is set only for unallocated
> > > > portions of the disk.
> > > >
> > > > Signed-off-by: Eric Blake <eblake@redhat.com>
> > > > ---
> > > >
> > > > Touches the same iotest output as 1/1.  If we decide that switching to
> > > > "depth":n+1 is too risky, and that the mere addition of "backing":true
> > > > while keeping "depth":n is good enough, then we'd have just one patch,
> > > > instead of this double churn.  Preferences?
> > >
> > > I think the additional flag is better because it's guaranteed to be
> > > backwards compatible, and because you don't need to know the number of
> > > layers to infer whether a cluster was allocated in the whole backing
> > > chain. And by exposing ALLOCATED we definitely give access to the whole
> > > information that exists in QEMU.
> > >
> > > However, to continue with the bike shedding: I won't insist on
> > > "allocated" even if that is what the flag is called internally and
> > > consistency is usually helpful, but "backing" is misleading, too,
> > > because intuitively it doesn't cover the top layer or standalone images
> > > without a backing file. How about something like "present"?
> >
> > Looks hard to document:
> >
> > # @present: if present and false, the range is not allocated within the
> > #           backing chain (since 6.1)
>
> I'm not sure why you would document it with a double negative.
>
> > And is not consistent with "offset". It would work better as:
> >
> > # @present: if present, the range is allocated within the backing
> > #           chain (since 6.1)
>
> Completely ignoring the value? I would have documented it like this, but
> with "if true..." instead of "if present...".

This is fine, but it means that this flag will present in all ranges,
instead of
only in unallocated ranges (what this patch is doing).

>
> > Or:
> >
> > # @absent: if present, the range is not allocated within the backing
> > #           chain (since 6.1)
>
> This is possible, too, but generally positive flags are preferable to
> negative ones, and the internal one is already positive.
>
> > This is used by libnbd now:
> > https://github.com/libguestfs/libnbd/commit/1d01d2ac4f6443b160b7d81119d555e1aaedb56d
> >
> > But I'm fine with "backing", It is consistent with BLK_BACKING_FILE,
> > meaning this area exposes data from a backing file (if one exists).
> >
> > We use "backing" internally to be consistent with future qemu-img.
>
> I just realised that I actually misunderstood "backing" to mean the
> opposite of what it is in this patch!
>
> It really means "the data comes from some imaginary additional backing
> file that doesn't exist in the backing chain", while I understood it as
> "something in the (real) backing chain contains the data".
>
> "present" or "absent" should be much less prone to such
> misunderstandings.
>
> Kevin
>


