Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 879173024A2
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 13:05:09 +0100 (CET)
Received: from localhost ([::1]:47060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l40cG-0002BQ-BL
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 07:05:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l40a2-0001MC-Ps
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 07:02:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l40a0-0006xd-9R
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 07:02:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611576166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YPHFWKp1SSjdnxxOSJIC+VVyKn5s/lFM6t0j3UgmenI=;
 b=eYJdtQdQ7cqjF8z4jYmsWFAjOdQvwbhryWMYF2AL6FnExyWVcv0mTIsM2P9f3gWOXBtPj1
 zjTznpDaax8R5EVicwphFuaINvfU8VC0du4dWp4oHEncRbev5sTGp3Ez5Gg5HwEvy+orsq
 /HdO8IWuR4iukAvtmQZZoNB1uWFWSuA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-y5cumIP8MGyvT54K2hIB5A-1; Mon, 25 Jan 2021 07:02:44 -0500
X-MC-Unique: y5cumIP8MGyvT54K2hIB5A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F3BE59;
 Mon, 25 Jan 2021 12:02:43 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-150.ams2.redhat.com [10.36.115.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E93060938;
 Mon, 25 Jan 2021 12:02:41 +0000 (UTC)
Date: Mon, 25 Jan 2021 13:02:40 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v7 10/11] iotests: rewrite check into python
Message-ID: <20210125120240.GA7107@merkur.fritz.box>
References: <20210116134424.82867-1-vsementsov@virtuozzo.com>
 <20210116134424.82867-11-vsementsov@virtuozzo.com>
 <20210122160804.GJ15866@merkur.fritz.box>
 <0cee83d0-c77f-b2ef-3c42-648d217ad9a7@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <0cee83d0-c77f-b2ef-3c42-648d217ad9a7@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 23.01.2021 um 16:08 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 22.01.2021 19:08, Kevin Wolf wrote:
> > Am 16.01.2021 um 14:44 hat Vladimir Sementsov-Ogievskiy geschrieben:
> > > Just use classes introduced in previous three commits. Behavior
> > > difference is described in these three commits.
> > > 
> > > Drop group file, as it becomes unused.
> > > 
> > > Drop common.env: now check is in python, and for tests we use same
> > > python interpreter that runs the check itself. Use build environment
> > > PYTHON in check-block instead, to keep "make check" use the same
> > > python.
> > > 
> > > Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> > 
> > > diff --git a/tests/check-block.sh b/tests/check-block.sh
> > > index fb4c1baae9..26eb1c0a9b 100755
> > > --- a/tests/check-block.sh
> > > +++ b/tests/check-block.sh
> > > @@ -69,7 +69,7 @@ export QEMU_CHECK_BLOCK_AUTO=1
> > >   ret=0
> > >   for fmt in $format_list ; do
> > > -    ./check -makecheck -$fmt $group || ret=1
> > > +    ${PYTHON} ./check -makecheck -$fmt $group || ret=1
> > >   done
> > 
> > When I add an echo to print that command line, it seems that ${PYTHON}
> > is empty for me. Is this expected?
> 
> It seems to be defined defined when called from make check. Did you
> just call check-block directly?
D> 
> It's not intentional, but I think it's OK: if PYTHON is not defined
> let's just execute check as self-executable. And for make-check PYTHON
> is defined and correct python is used.

Hm, where does that happen in 'make check'? It seems the old makefiles
were quite readable in comparison to what we have now...

Anyway, I think 'make check-block' should run just the block-specific
subset of 'make check', without changing the behaviour of the remaining
tests. Anything that can be started through make should respect the
configured Python interpreter.

> > >   exit $ret
> > > diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
> > > index 952762d5ed..914321806a 100755
> > > --- a/tests/qemu-iotests/check
> > > +++ b/tests/qemu-iotests/check
> 
> [..]
> 
> > > -            if [ -x "$binary" ]
> > > -            then
> > > -                export QEMU_PROG="$build_root/$binary"
> > > -                break
> > > -            fi
> > > -        done
> > > -        popd > /dev/null
> > > -        [ "$QEMU_PROG" = "" ] && _init_error "qemu not found"
> > > -    fi
> > 
> > I think this else branch is kind of important (if there is no system
> > emulator binary for the host architecture, find _any_ system emulator
> > binary that was built). I can't find its equivalent in the new code.
> 
> Hmm, I decided testing "first found" emulator is strange.. It seems
> like we have several emulators and user don't care which would be
> tested?

Remember that we're mainly testing the block layer, which is the same in
all qemu-system-* binaries anyway. So yes, any system emulator binary is
good enough for many test cases, and certainly better than having no
system emulator. Differences are only in the supported guest devices,
which may cause some tests to be skipped.

If there are multiple binaries that we could use, we could change the
way to select one instead of just the first one, e.g. by trying x86_64
first because this is what enables the largest set of tests.

But anything is better than failing with "qemu not found".

> Probably we should instead used qemu-system-* binary only if there is
> only one matching binary. And fail if there are many.

No, 'make check' shouldn't fail because I built arm and ppc emulators on
my x86_64 machine without also building a x86_64 emulator. (And I think
this is a case that fails both with the actual patch under review and
with your suggested change.)

Kevin


