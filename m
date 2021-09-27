Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 615BF41918F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 11:33:22 +0200 (CEST)
Received: from localhost ([::1]:57834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUn0j-0005SY-1Z
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 05:33:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mUmyw-0004Lt-JD
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 05:31:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mUmyr-0003D1-Ha
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 05:31:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632735081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OordD9n8avuWIeLfa1cfXzvSb76dPxM4Nl5sBoxU+io=;
 b=IQUQZir0+hPRB5NEF8s+sFi1Vnd2m7bokdz6ugHIDBD3tiR8n8380uvF2mdz9IO/JpLjv/
 lxv6vhmfGhIq3wOuT99/cdVQEq3NJeTHYiho4lnR4rzNYvNTRokSfnVev7NkndQvsr+o34
 Pzx1PHzvZrZyxPGoP2cXsQ4OAhI2Zhw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-m8cUP_kQM3WWxo8SvQAl_g-1; Mon, 27 Sep 2021 05:31:19 -0400
X-MC-Unique: m8cUP_kQM3WWxo8SvQAl_g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC92D100C661;
 Mon, 27 Sep 2021 09:31:18 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6180E19D9F;
 Mon, 27 Sep 2021 09:31:17 +0000 (UTC)
Date: Mon, 27 Sep 2021 11:31:16 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 0/6] iotests: update environment and linting
 configuration
Message-ID: <YVGPZJpyhuHdbaMB@redhat.com>
References: <20210923180715.4168522-1-jsnow@redhat.com>
 <CAFn=p-au+c1m8RGn2T7ceYvsk8qDJ=HCkLAPbqFydzN1_F4eWg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFn=p-au+c1m8RGn2T7ceYvsk8qDJ=HCkLAPbqFydzN1_F4eWg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 24.09.2021 um 20:13 hat John Snow geschrieben:
> On Thu, Sep 23, 2021 at 2:07 PM John Snow <jsnow@redhat.com> wrote:
> 
> > GitLab: https://gitlab.com/jsnow/qemu/-/commits/python-package-iotest-pt1
> > CI: https://gitlab.com/jsnow/qemu/-/pipelines/376236687
> >
> > This series partially supersedes:
> >   [PATCH v3 00/16] python/iotests: Run iotest linters during Python CI'
> >
> > Howdy, this is good stuff we want even if we aren't yet in agreement
> > about the best way to run iotest 297 from CI.
> >
> > - Update linting config to tolerate pylint 2.11.1
> > - Eliminate sys.path hacking in individual test files
> > - make mypy execution in test 297 faster
> >
> > The rest of the actual "run at CI time" stuff can get handled separately
> > and later pending some discussion on the other series.
> >
> > V2:
> >
> > 001/6:[0011] [FC] 'iotests: add 'qemu' package location to PYTHONPATH in
> > testenv'
> > 002/6:[0025] [FC] 'iotests: add warning for rogue 'qemu' packages'
> >
> > - Squashed in a small optimization from Vladimir to 001, kept R-Bs.
> > - Fixed the package detection logic to not panic if it can't find
> >   'qemu' at all (kwolf)
> > - Updated commit messages for the first two patches.

> Patch 2 can just be dropped, and everything else is reviewed, so I think
> this can be staged at your leisure.

Thanks, applied to the block branch (without patch 2).

Kevin


