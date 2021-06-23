Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9153B1EC5
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 18:37:05 +0200 (CEST)
Received: from localhost ([::1]:47222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw5s9-0004AK-0K
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 12:37:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1lw5r8-0003VT-QE
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 12:36:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1lw5r7-0005pZ-1S
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 12:36:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624466160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n/dWfaQfyowEjINr7q6r0QQcJKVQk94b0OLmOEtmrO4=;
 b=S4feQRkyan19AdCJbTKaFWaw3i6bRyp4th4zr3PxNRq6VCHswdgWMZ4wrWzI13bFycrvdH
 3GAMyJogq3YtwMemAoVd2FviPx671a+Dqoua0DnR8FayM8/hMAv9MaqUGDOFbdTpFEVrgd
 TZc9ZhMqt7Isbe0TGiHTPegijS2S+Mw=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-Yl6jkDwbOVGQrTtU0u8cig-1; Wed, 23 Jun 2021 12:35:59 -0400
X-MC-Unique: Yl6jkDwbOVGQrTtU0u8cig-1
Received: by mail-oi1-f200.google.com with SMTP id
 k11-20020a54440b0000b02901f3e6a011b4so2005735oiw.23
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 09:35:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n/dWfaQfyowEjINr7q6r0QQcJKVQk94b0OLmOEtmrO4=;
 b=IMAdKu2GW9fXD+0/EiXT0YLiVMMeEt320HGTXKrPPteeJvfHULm96BqXkGRkiyFQ09
 3kgZZ2T/8Ij7fLL16z8HCzSo95PfJSZuKa6pOeRs5Befr7oVoXEqIS2+ZUVag3Z2+kLf
 TJX2ia1OJURfOZ0eSzFpO6FD/pcnsE7ZEwlJBOFpFQuI4M4LR4k9h3D5L7yueieit2gs
 TS3nNK+KwiPSVPwQE83F2hb2YR2g147++V1sKWQBEdSoV6hOst6hgq5FgcY24aVSyZTG
 mziQweXXMR4XoaOb4Qd/A5ERwXs0mhVR7vUUBgEuXUUjHTHzv6YmoXcRgUN4S+HBPYct
 CK7g==
X-Gm-Message-State: AOAM533hAv3uhP/xgdMgIZl7qqA0KVQVswTRadRCGU3Sf7O/8vhDJ3RY
 RwBQPRJkc/TZ3zNBDkAsoxFmiQc3QOgy9CfLptMQyob0YVv7dEpSiQXBDPf1xVgz+Q9ETf9tcJO
 grMwH3c+1pM0lT0V53tVKm5gCgEiTk24=
X-Received: by 2002:a9d:6250:: with SMTP id i16mr707859otk.170.1624466158360; 
 Wed, 23 Jun 2021 09:35:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGzhswfHswbEgJDKDqFbU5PPXS36mxFTpEld/cr6KwltfGAvONLZq9Rz93bcZDgLNUCWfKWINcnyplVy0T0rw=
X-Received: by 2002:a9d:6250:: with SMTP id i16mr707840otk.170.1624466158172; 
 Wed, 23 Jun 2021 09:35:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210611140157.1366738-1-eblake@redhat.com>
 <20210611190316.1424729-1-eblake@redhat.com>
 <YNID9rbo+RdwklCf@redhat.com>
 <CAMRbyyt5qsVan8dOF=HHvqqo92zwTBRucnfA_UEOOmRMqiyaAQ@mail.gmail.com>
 <YNL3kpqnhi15glTC@redhat.com>
 <CAMRbyyuik1Q=WMSpePz6T+0bEnau0CFWbA4VA9GBf6+mrCZS3Q@mail.gmail.com>
 <YNNbg6jU2dD8VNiU@redhat.com>
In-Reply-To: <YNNbg6jU2dD8VNiU@redhat.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Wed, 23 Jun 2021 19:35:42 +0300
Message-ID: <CAMRbyyusxxze3=2e0qWvL9KJQ1ViR-zJtP7DtaZ+PwCZyxx2-A@mail.gmail.com>
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

On Wed, Jun 23, 2021 at 7:04 PM Kevin Wolf <kwolf@redhat.com> wrote:
>
> Am 23.06.2021 um 15:58 hat Nir Soffer geschrieben:
> > On Wed, Jun 23, 2021 at 11:58 AM Kevin Wolf <kwolf@redhat.com> wrote:
> > >
> > > Am 22.06.2021 um 18:56 hat Nir Soffer geschrieben:
> > > > On Tue, Jun 22, 2021 at 6:38 PM Kevin Wolf <kwolf@redhat.com> wrote:
> > > > >
> > > > > Am 11.06.2021 um 21:03 hat Eric Blake geschrieben:
> > > > > > To save the user from having to check 'qemu-img info --backing-chain'
> > > > > > or other followup command to determine which "depth":n goes beyond the
> > > > > > chain, add a boolean field "backing" that is set only for unallocated
> > > > > > portions of the disk.
> > > > > >
> > > > > > Signed-off-by: Eric Blake <eblake@redhat.com>
> > > > > > ---
> > > > > >
> > > > > > Touches the same iotest output as 1/1.  If we decide that switching to
> > > > > > "depth":n+1 is too risky, and that the mere addition of "backing":true
> > > > > > while keeping "depth":n is good enough, then we'd have just one patch,
> > > > > > instead of this double churn.  Preferences?
> > > > >
> > > > > I think the additional flag is better because it's guaranteed to be
> > > > > backwards compatible, and because you don't need to know the number of
> > > > > layers to infer whether a cluster was allocated in the whole backing
> > > > > chain. And by exposing ALLOCATED we definitely give access to the whole
> > > > > information that exists in QEMU.
> > > > >
> > > > > However, to continue with the bike shedding: I won't insist on
> > > > > "allocated" even if that is what the flag is called internally and
> > > > > consistency is usually helpful, but "backing" is misleading, too,
> > > > > because intuitively it doesn't cover the top layer or standalone images
> > > > > without a backing file. How about something like "present"?
> > > >
> > > > Looks hard to document:
> > > >
> > > > # @present: if present and false, the range is not allocated within the
> > > > #           backing chain (since 6.1)
> > >
> > > I'm not sure why you would document it with a double negative.
> > >
> > > > And is not consistent with "offset". It would work better as:
> > > >
> > > > # @present: if present, the range is allocated within the backing
> > > > #           chain (since 6.1)
> > >
> > > Completely ignoring the value? I would have documented it like this, but
> > > with "if true..." instead of "if present...".
> >
> > This is fine, but it means that this flag will present in all ranges,
> > instead of only in unallocated ranges (what this patch is doing).
>
> An argument for always having the flag would be that it's probably
> useful for a tool to know whether a given block is actually absent or
> whether it's just running an old qemu-img.

Good point, this is the best option. The disadvantage is a bigger output but
if you use json you don't care about the size of the output.

> If we didn't care about this, I would still define the actual value, but
> also document a default.
>
> Kevin
>


