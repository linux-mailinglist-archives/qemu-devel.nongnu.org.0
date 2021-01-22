Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4020930044D
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 14:36:46 +0100 (CET)
Received: from localhost ([::1]:46962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2wcH-0006vo-Bq
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 08:36:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l2wac-0005n6-G5
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 08:35:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l2waY-0006iv-EL
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 08:35:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611322497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bNclccdQVUd0YbPa/AtnAr016qSS8mNPR8QPPTLWSo4=;
 b=Dc2SnVk0bQkhW1fJCd+Hk4r+jIHRgFoLiOEiKL0LKaYYDlT2D4aF9hq77HOL+GIooMI9aI
 bnQ6pFg5igWRrNd+Q47+mwtarsv8UjCd8cJ3xcnFZUhsDGkiIR8MCjQj9k5lOqs9ayH71q
 iR3/dWah29wqfNKCgjmKfv2PwaCq4IY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-waC4E-WQMl2zzxQENaG4cg-1; Fri, 22 Jan 2021 08:34:54 -0500
X-MC-Unique: waC4E-WQMl2zzxQENaG4cg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF7731005504;
 Fri, 22 Jan 2021 13:34:53 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-18.ams2.redhat.com [10.36.115.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E5126EF5A;
 Fri, 22 Jan 2021 13:34:51 +0000 (UTC)
Date: Fri, 22 Jan 2021 14:34:50 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v7 07/11] iotests: add findtests.py
Message-ID: <20210122133450.GF15866@merkur.fritz.box>
References: <20210116134424.82867-1-vsementsov@virtuozzo.com>
 <20210116134424.82867-8-vsementsov@virtuozzo.com>
 <20210122114815.GC15866@merkur.fritz.box>
 <bc7e60f2-11b2-255d-2d69-cbd1563a0e19@virtuozzo.com>
 <20210122124541.GE15866@merkur.fritz.box>
 <f2db3922-6832-25a5-7bb9-ac24dbb32286@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <f2db3922-6832-25a5-7bb9-ac24dbb32286@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 22.01.2021 um 14:16 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 22.01.2021 15:45, Kevin Wolf wrote:
> > Am 22.01.2021 um 12:57 hat Vladimir Sementsov-Ogievskiy geschrieben:
> > > 22.01.2021 14:48, Kevin Wolf wrote:
> > > > Am 16.01.2021 um 14:44 hat Vladimir Sementsov-Ogievskiy geschrieben:
> > > > > +    def add_group_file(self, fname: str) -> None:
> > > > > +        with open(fname) as f:
> > > > > +            for line in f:
> > > > > +                line = line.strip()
> > > > > +
> > > > > +                if (not line) or line[0] == '#':
> > > > > +                    continue
> > > > > +
> > > > > +                words = line.split()
> > > > > +                test_file = self.parse_test_name(words[0])
> > > > > +                groups = words[1:]
> > > > 
> > > > The previous version still had this:
> > > > 
> > > > +                if test_file not in self.all_tests:
> > > > +                    print(f'Warning: {fname}: "{test_file}" test is not found.'
> > > > +                          ' Skip.')
> > > > +                    continue
> > > > 
> > > > Why did you remove it? I found this useful when I had a wrong test name
> > > > in my group.local. Now it's silently ignored.
> > > 
> > > 
> > > Because now we use parse_test_name which will raise ValueError, so we
> > > will not go to this if anyway.
> > > 
> > > So, wrong name will not be silently ignored, check will fail, and
> > > you'll have to fix group file.. It is suitable?
> > 
> > It doesn't, though.
> > 
> > Oh, wait... Is it possible that you lost support for group.local
> > altogether? grep for "group.local" comes up empty, and add_group_file()
> > is only defined, but never called.
> > 
> > So the reason for the behaviour seems to be that it doesn't even try to
> > parse the group file.
> 
> Ooops, you are right :( I've dropped an extra layer of indirection to
> make things simpler and group.local was lost. It's the reason to send
> v8, I'll do it now.

You can wait with sending v8 until I've completed review in case
something else comes up. So far I'm done with the changes to the part
that I reviewed last time and apart from this bug they look good to me.
Now it's the remaining patches.

> In a mean time, reverting 06 for now is OK for me.

Not a big deal if we get it fixed soon, it only becomes a problem if the
rest of this series gets shelved for a longer time. Maybe we can
complete it today, maybe on Monday, and then I'll send a pull request
right away.

Kevin


