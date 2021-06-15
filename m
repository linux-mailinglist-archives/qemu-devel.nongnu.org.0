Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1B23A7EB8
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 15:10:56 +0200 (CEST)
Received: from localhost ([::1]:48112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt8qF-00026y-7j
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 09:10:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1lt8oy-0000QA-UM
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:09:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1lt8ow-0001Dx-BP
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:09:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623762573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4fXtvlUIPN8J8qt1Pk3rSk3V0kFIhQ2xwTwfwfM2O7U=;
 b=ddwZf+T3UQhrYOxxXE1i6aY0dNI5auHn95kp/voqVXwd9/O+2JxBasEOWFVy6yrUl9HIUo
 hyDAzhTHOVSqO9BbtOwQr3mTZWPVHzsfCe26UW62NewuvL334arD7b46Vhtjz9bn5Is5sn
 S+J6kEfoX1aRlDZU93x+C8XABQJtvSk=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-NSj3ofKPPnesHSZCno6YDw-1; Tue, 15 Jun 2021 09:09:32 -0400
X-MC-Unique: NSj3ofKPPnesHSZCno6YDw-1
Received: by mail-oi1-f199.google.com with SMTP id
 j20-20020aca17140000b02901f3ef48ce7dso7577265oii.12
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 06:09:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4fXtvlUIPN8J8qt1Pk3rSk3V0kFIhQ2xwTwfwfM2O7U=;
 b=bIaMdpXXI+T+4a3lIfv0+9hWOGTGugEhT09y8h22IDpUliYomGG6ZEJlDrq0junyvC
 FkbowMDakcQmKzuUiMf93qoJi4guGO5hg7jn4fZ3dQcVYJ8HvYlJY02+aaTZf6Pl/a57
 gixgRylYLzAUIpkP4Mhfvnzpr5BvhiiUIbZ1hZN6+0PHCSMhFyIMNRP7I4XVdFOguBKL
 AlxoDdSVonTO99vFaEArfPSMIl4sqsLb3I4WOfKNrJxli0PHCdxASGyA5dqZNWUuhh2n
 3Y4aEUnvu7lNUzAI2xuf+W1gzhP2ZpdE1PjrDyV1fPhwuN4m1/sTDLxO2T8HrHp/dEFq
 ZQew==
X-Gm-Message-State: AOAM5317inCu8O2QxiMOU14Z5Gsd0uQiHVucQlk49AQdx/rBS3cbaf/K
 kaaEdp1Js1gudt6yo/DN9Ov/FQP8JmE39dHoMn/uFKiZX7nHNfVLF+0oxwNaFbP+qifUpcP+bJ9
 E4zx+KDmqfSzi+eOuqTpgNOSGkCYcDuQ=
X-Received: by 2002:a54:4e93:: with SMTP id c19mr14347204oiy.56.1623762571329; 
 Tue, 15 Jun 2021 06:09:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7zuogo2EMcRwXHV26huDSPNrCNRA12mvfwfQthXzYLi8fLw252bx9vaToHfBUBxV8DbonIxDJhI/xTPkUess=
X-Received: by 2002:a54:4e93:: with SMTP id c19mr14347190oiy.56.1623762571134; 
 Tue, 15 Jun 2021 06:09:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210611140157.1366738-1-eblake@redhat.com>
 <20210611190316.1424729-1-eblake@redhat.com>
 <6e5ca689-cc2d-067a-7299-dd2813c1db2b@virtuozzo.com>
In-Reply-To: <6e5ca689-cc2d-067a-7299-dd2813c1db2b@virtuozzo.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Tue, 15 Jun 2021 16:09:15 +0300
Message-ID: <CAMRbyyvCrAcV9EeSgaZRfNoEondXpZn1jgphMgSDZFe_ce=Y0g@mail.gmail.com>
Subject: Re: [PATCH v2 2/1] qemu-img: Add "backing":true to unallocated map
 segments
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsoffer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 15, 2021 at 11:54 AM Vladimir Sementsov-Ogievskiy
<vsementsov@virtuozzo.com> wrote:
>
> 11.06.2021 22:03, Eric Blake wrote:
> > To save the user from having to check 'qemu-img info --backing-chain'
> > or other followup command to determine which "depth":n goes beyond the
> > chain, add a boolean field "backing" that is set only for unallocated
> > portions of the disk.
> >
> > Signed-off-by: Eric Blake<eblake@redhat.com>
> > ---
> >
> > Touches the same iotest output as 1/1.  If we decide that switching to
> > "depth":n+1 is too risky, and that the mere addition of "backing":true
> > while keeping "depth":n is good enough, then we'd have just one patch,
> > instead of this double churn.  Preferences?
>
> If change something, this one patch seems safer. Still, Nir said he don't use qemu-img map, so probably we don't need to modify qemu-img at all? Even our iotests change shows that this change may be incompatible with at least tests..
>
> I'm not against the patch and don't have strict opinion.
>
> And what I really think, is that qemu-img is outdated thing and we'd better develop QMP interface, which can be used with qemu binary or with qemu-storage-daemon.

I don't think qemu-storage-daemon can replace qemu-img. Having an easy
to use command
line tool is important. Using qmp with qemu-storage-daemon sounds like
a better option
for programs that want ultimate control.

Adding only "backing: true" seems a safe change that should not break
existing users
and make qemu-img map better.

The tests are broken because they compare strings instead of parsing
the json. A program
parsing qemu-img json output will not be broken by adding a new key.

Nir


