Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C36BF4BEA57
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 20:22:43 +0100 (CET)
Received: from localhost ([::1]:53860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMEGf-00075V-O5
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 14:22:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nMECS-0005PD-FA
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 14:18:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nMECP-00022u-BY
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 14:18:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645471096;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DBp+AAXJ973ifqj36rFcPdycYIymZk5MKwclyG0sCIU=;
 b=XL2Zgj88im8nyzEfYDI6/SXea14UB16kzg/10EWpcQptwm7zHpM+QVG7mc5W7Bdy1ny24l
 yppwBvIEo8MmpdmqTL9C2/p7snjpI+D8QiV5LRLVH9hUsdj8UgFPtK2GikB+DBmY37RXhC
 eUBB8EoqfcSp7q2Ln5RIsVfP9iuPo/w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-164-ooQDiUGnMS2ZMw9zWxHb7g-1; Mon, 21 Feb 2022 14:18:08 -0500
X-MC-Unique: ooQDiUGnMS2ZMw9zWxHb7g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B2421006AA5;
 Mon, 21 Feb 2022 19:18:07 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.93])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 24B222E054;
 Mon, 21 Feb 2022 19:17:49 +0000 (UTC)
Date: Mon, 21 Feb 2022 19:17:46 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/10] Misc next patches
Message-ID: <YhPlWnkN5Nf009yC@redhat.com>
References: <20220217115723.1782616-1-berrange@redhat.com>
 <CAFEAcA9vQUAYPHU6KOwVJRxY=SOa2iipPR-5s0JU79MPEmvQBA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9vQUAYPHU6KOwVJRxY=SOa2iipPR-5s0JU79MPEmvQBA@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Kashyap Chamarthy <kchamart@redhat.com>, qemu-devel@nongnu.org,
 "Richard W.M. Jones" <rjones@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 18, 2022 at 08:05:12PM +0000, Peter Maydell wrote:
> On Thu, 17 Feb 2022 at 12:01, Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > The following changes since commit ad38520bdeb2b1e0b487db317f29119e94c1c88d:
> >
> >   Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/block-pull-request' into staging (2022-02-15 19:30:33 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.com/berrange/qemu tags/misc-next-pull-request
> >
> > for you to fetch changes up to 2720ceda0521bc43139cfdf45e3e470559e11ce3:
> >
> >   docs: expand firmware descriptor to allow flash without NVRAM (2022-02-16 18:53:26 +0000)
> >
> > ----------------------------------------------------------------
> > This misc series of changes:
> >
> >  - Improves documentation of SSH fingerprint checking
> >  - Fixes SHA256 fingerprints with non-blockdev usage
> >  - Blocks the clone3, setns, unshare & execveat syscalls
> >    with seccomp
> >  - Blocks process spawning via clone syscall, but allows
> >    threads, with seccomp
> >  - Takes over seccomp maintainer role
> >  - Expands firmware descriptor spec to allow flash
> >    without NVRAM
> 
> Hi; this series seems to cause the x64-freebsd-13-build to fail:
> https://gitlab.com/qemu-project/qemu/-/jobs/2112237501
> 
> 1/1 qemu:block / qemu-iotests qcow2 ERROR 155.99s exit status 1
> ▶ 469/707 /or1k/qmp/x-query-opcount OK
> ▶ 493/707 /ppc64/pnv-xscom/cfam_id/POWER8NVL OK
> Summary of Failures:
> 1/1 qemu:block / qemu-iotests qcow2 ERROR 155.99s exit status 1
> Ok: 0
> Expected Fail: 0
> Fail: 1
> Unexpected Pass: 0
> Skipped: 0
> Timeout: 0
> Full log written to /tmp/cirrus-ci-build/build/meson-logs/iotestslog.txt
> 
> This is an allowed-to-fail job, so I could in theory allow the
> merge, but OTOH the job was passing previously and the failure
> is block-related and this is a block-related pullreq...

AFAIK, the block jobs run in CI don't cover the SSH driver at all.

I had a CI pipeline before submitting, which covered Free BSD 13
which passed. To be sure I just rebased to git master and tried
another pipeline which passed too:

  https://gitlab.com/berrange/qemu/-/jobs/2119118096

so I'm thinking the failure you got is a transient. Could you retry
this PULL

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


