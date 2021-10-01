Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBCF41F665
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 22:39:07 +0200 (CEST)
Received: from localhost ([::1]:44632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWPJB-0005cv-Ia
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 16:39:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mWPH9-0004ge-Oj
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 16:37:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mWPH5-0008I7-W9
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 16:36:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633120613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p1Zt6JuNyof0Eo+uTRqYqFs5uglrOeDcNbqJQNS+xcA=;
 b=do7kJwHheMpQMdsS7Fkw2mPl26MMns/LrdAKGv9/+VARSdGLBeLruiKA2E8om2Tupuxwxi
 EGEosgfuBnDeSGyyYXaPDjLSe9k7OJD/1gBkwVRmDJRv0fUjqs4ZB8Us4Ht0suH243oI+/
 TUqJbvs5RaE7QjlyMHnwy0E31NDexBM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-99i96gtzPra5LuZP5-nKIQ-1; Fri, 01 Oct 2021 16:36:45 -0400
X-MC-Unique: 99i96gtzPra5LuZP5-nKIQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD4FCA0CAC;
 Fri,  1 Oct 2021 20:36:44 +0000 (UTC)
Received: from redhat.com (ovpn-112-82.phx2.redhat.com [10.3.112.82])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 167B85C1B4;
 Fri,  1 Oct 2021 20:36:44 +0000 (UTC)
Date: Fri, 1 Oct 2021 15:36:42 -0500
From: Eric Blake <eblake@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: Running 297 from GitLab CI
Message-ID: <20211001203642.434ximxqj6h2o5np@redhat.com>
References: <CAFn=p-bYOvg17MQ-NBDyBv_vqPgFH9MaxTO6yyKWpp1hZY4U+Q@mail.gmail.com>
 <YVbFEDOgo4Onb15L@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YVbFEDOgo4Onb15L@redhat.com>
User-Agent: NeoMutt/20210205-802-6cf179
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
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
Cc: Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 01, 2021 at 10:21:36AM +0200, Kevin Wolf wrote:
> Am 30.09.2021 um 23:28 hat John Snow geschrieben:
> > Hiya, I was talking this over with Hanna in review to '[PATCH v3 00/16]
> > python/iotests: Run iotest linters during Python CI' [1] and I have some
> > doubt about what you'd personally like to see happen, here.
> > 
> > In a nutshell, I split out 'linters.py' from 297 and keep all of the
> > iotest-bits in 297 and all of the generic "run the linters" bits in
> > linters.py, then I run linters.py from the GitLab python CI jobs.
> > 
> > I did this so that iotest #297 would continue to work exactly as it had,
> > but trying to serve "two masters" in the form of two test suites means some
> > non-beautiful design decisions. Hanna suggested we just outright drop test
> > 297 to possibly improve the factoring of the tests.
> > 
> > I don't want to do that unless you give it the go-ahead, though. I wanted
> > to hear your feelings on if we still want to keep 297 around or not.
> 
> My basic requirement is that the checks are run somewhere in my local
> testing before I prepare a pull request. This means it could be done by
> iotests in any test that runs for -raw or -qcow2, or in 'make check'.
> 
> So if you have a replacement somewhere in 'make check', dropping 297 is
> fine with me. If I have to run something entirely different, you may
> need to invest a bit more effort to convince me. ;-)

I'll echo that sentiment - if it's easy to automate, we can run it
under 'make check', and then we don't need the duplication of also
running it under iotests (especially since it isn't "really" an
iotest, so much as a test that makes the rest of the iotests more
consistent).  If it's harder to automate, or requires me to run one
more thing, then keeping it in iotests for the short term is not too
drastic of a request, so that I don't accidentally skip it.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


