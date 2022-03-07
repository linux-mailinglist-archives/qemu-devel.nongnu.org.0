Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7054C4CFE17
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 13:22:13 +0100 (CET)
Received: from localhost ([::1]:60200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRCNQ-0001qV-G5
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 07:22:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nRCEV-0006FN-Aw
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 07:12:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nRCEQ-0007jD-D9
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 07:12:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646655173;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=unTuSTXXzWyT02Kzlwcjl7PZtpXkorxxSgqu+oo86lw=;
 b=g003sOjABEqDe9b9I0Y/M0qdeUTDJ2Ib67Be5GMj3JzTy19cnb/+g3YTOs/M2ogdQJbpuJ
 iptOgkc9VIe5+w6jLddbPRKjTfjFEUKQ3qAI9XMGO9BchzlTtZzbYdIHhFPHh9dP/mtgVz
 2NZkp6zhcwi7zbIbj/wDwDULLrlww+U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-56-Stq0KI2iPXmMQVNxCaQO4A-1; Mon, 07 Mar 2022 07:12:48 -0500
X-MC-Unique: Stq0KI2iPXmMQVNxCaQO4A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA119824FA7;
 Mon,  7 Mar 2022 12:12:46 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.133])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B4CF84943;
 Mon,  7 Mar 2022 12:12:44 +0000 (UTC)
Date: Mon, 7 Mar 2022 12:12:41 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/33] Abstract ArchCPU
Message-ID: <YiX2uVVtuj6+l3R4@redhat.com>
References: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
 <CAFEAcA_Gedun4yL_DcfK9Pk7e5j5gYpHuue139gq3rYH3zbETQ@mail.gmail.com>
 <ad3118f9-0079-16cc-8a9d-51b8e32e7b2c@gmail.com>
 <CAFEAcA_rLaphLoyZNUGOPoj5n2z7X+RJNSpnJGqhu9ujAMduEQ@mail.gmail.com>
 <ec456ba2-71ed-7cbd-ae3a-595131962918@gmail.com>
 <CAFEAcA9tzq6atDCFDSmFZ2FhNgn7dXt21=GazcXZ9+3WYVtWuA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9tzq6atDCFDSmFZ2FhNgn7dXt21=GazcXZ9+3WYVtWuA@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 07, 2022 at 11:51:20AM +0000, Peter Maydell wrote:
> On Sun, 6 Mar 2022 at 21:13, Philippe Mathieu-Daudé
> <philippe.mathieu.daude@gmail.com> wrote:
> >
> > +Daniel/Alex
> >
> > On 6/3/22 20:56, Peter Maydell wrote:
> > > On Sun, 6 Mar 2022 at 19:06, Philippe Mathieu-Daudé
> > > <philippe.mathieu.daude@gmail.com> wrote:
> > >> I see. I only have access to aarch64 Darwin, not x86_64; I was relying
> > >> on our CI for that (my GitLab CI is green). I'll work a fix, thanks.
> > >
> > > This was on my ad-hoc stuff -- I guess our gitlab CI for macos
> > > doesn't build hvf ?
> >
> > No, it does:
> >
> > https://gitlab.com/philmd/qemu/-/jobs/2167582776#L6444
> >
> >    Targets and accelerators
> >      KVM support                  : NO
> >      HAX support                  : YES
> >      HVF support                  : YES
> >      WHPX support                 : NO
> >      NVMM support                 : NO
> >      Xen support                  : NO
> >      TCG support                  : YES
> >
> > But the Cirrus job are allowed to fail:
> 
> Overall I am starting to feel that we should stop having
> these CI jobs that are in the "allowed to fail" category.
> All that happens is that they eat a lot of CPU on our CI
> hosts, but they don't actually find bugs because everybody
> (rightly) treats "allowed-to-fail-and-failed" as "ignore me".
> I think our CI jobs should either be "must pass", or else
> "run only manually", with that latter category being rarely
> used and only where there's a good reason (eg somebody
> specific has taken responsibility for debugging some
> intermittent failure and having it still available in the
> CI UI for them to trigger is helpful).

The cirrus CI jobs were introduced as allow-fail as we were
not sure the cirrus-run integration with gitlab would be
entirely stable. There was a blip a month or so ago due
to Cirrus CI breaking their REST API, but on the QEMU side
we seem to be OK. So I think we can toggle the flag to
make these Cirrus CI jobs gating.

> Plus we really need to get on top of all the intermittent
> failures. The current state of the world is that we have
> some intermittents, which makes it easy for new intermittents
> to get into the tree, because everybody is in the habit of
> "just hit retry"...

A big issue IMHO is that the pain/impact hits the wrong people.
It is most seriously impacts & disrupts Peter when merging, and
less impacts the subsystem maintainers, and even less the
original authors.

If we consider a alternative world where we used merge requests
for subsystem maintainers just to send pull requests. The subsystem
maintainer would open a MR and it would be their responsibility
to get a green pipeline. Peter (or the person approving pulls for
merge at the time) shouldn't even have to consider a MR until it
has got a green pipeline. That would put the primary impact of
unreliable CI onto the subsystem maintainers, blocking their work
from being considered for merge. This creates a direct incentive
on the subsystem maintainers to contribute to ensuring reliable
CI, instead of considering it somebody else's problem.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


