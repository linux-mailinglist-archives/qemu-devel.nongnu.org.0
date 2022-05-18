Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A39652BFC9
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 18:38:45 +0200 (CEST)
Received: from localhost ([::1]:55296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrMhA-0007Xh-03
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 12:38:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nrMfq-0006dY-4P
 for qemu-devel@nongnu.org; Wed, 18 May 2022 12:37:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nrMfn-0007El-LR
 for qemu-devel@nongnu.org; Wed, 18 May 2022 12:37:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652891839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oWW1YYkJPEtudh/EsbkaGSxjxEZxjWNE5vEXUbp0UnE=;
 b=ALp/H4EElx6JtG9h9jtlG3Ap4bKIGuYaUjHFmJucmcUmW1ddqkzon6y4S5oktSf6Wyw0TO
 lLVeDbf+pjrfujrIQspCiH/MPUgW31GG1xvApPpdf6gB0kjei12xyBSw2qLbNPI/PlS63t
 xNVoVnJ2OsymR2SFmvd3I1q7gbuyvtw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-ZaLqQqOlPra1F8_6mqGvdQ-1; Wed, 18 May 2022 12:37:15 -0400
X-MC-Unique: ZaLqQqOlPra1F8_6mqGvdQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 82054100BAA1;
 Wed, 18 May 2022 16:37:15 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 99CA7492C14;
 Wed, 18 May 2022 16:37:14 +0000 (UTC)
Date: Wed, 18 May 2022 18:37:13 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: Hanna Reitz <hreitz@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: The fate of iotest 297
Message-ID: <YoUgufuA8/pjYwTE@redhat.com>
References: <CAFn=p-aEc=uWyGi2758wDwJF=St4ZThkvuDqVXoxTtcHLFZkhA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFn=p-aEc=uWyGi2758wDwJF=St4ZThkvuDqVXoxTtcHLFZkhA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 18.05.2022 um 01:28 hat John Snow geschrieben:
> Hi Kevin,
> 
> I remember that you wanted some minimum Niceness threshold in order to
> agree to me removing iotest 297.
> 
> I've already moved it onto GitLab CI in the form of the
> check-python-pipenv job, but I recall you wanted to be able to run it
> locally as well before agreeing to axe 297. I remember that you didn't
> think that running "make check-pipenv" from the python directory was
> sufficiently Nice enough.
> 
> Do you need it to be part of "make check", or are you OK with
> something like "make check-python" from the build directory?
> 
> I have a bit more work to do if you want it to be part of 'make check'
> (if you happen to have the right packages installed), but it's pretty
> easy right now to give you a 'make check-python' (where I just
> forcibly install those packages to the testing venv.)

Hm, what is the reason for 'make check-python' not being part of 'make
check'?

I'm currently running two things locally, 'make check' (which is the
generic one that everyone should run) and iotests (for which it is
reasonable enough that I need to run it separately because it's the
special thing for my own subsystem).

Now adding a third one 'make check-python' certainly isn't the end of
the world, but it's not really something that is tied to my subsystem
any more. Having to run test cases separately for other subsystems
doesn't really scale for me, so I would prefer not to start doing that.
I can usually get away with not running the more special tests of other
subsystems before the pull request because I'm unlikely to break things
in other subsystems, but Python style warnings are easy to get.

If we're going to have 'make check-python' separate, but CI checks it,
we'll get pull requests that don't pass it and would then only be caught
by CI after a long test run, requiring a v2 pull request. I feel for
something that checks things like style (and will fail frequently on
code where nobody ran the check before), that's a bit too unfriendly.

Kevin


