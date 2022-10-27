Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C827D60F8D1
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 15:15:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo2hi-0004VN-U5; Thu, 27 Oct 2022 09:13:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oo2hb-0004VC-JE
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 09:13:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oo2hZ-0005LT-IH
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 09:13:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666876420;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R8Rhij1kBLZ8FbgoPOuySZtlzd4HAzv1wT5oSUMZv+s=;
 b=BpWOeFjUX7gS5D3cg0Sp7zZxJSb7i5gDQlsNvZhkBngu0p/5k28IEIAvizloczRkfyFk99
 1eT/HpO4xrS2Sy5hNYQUIRFzPy6LUMI5pvDV2cTiMV6VCVPXF9JfcunJ0AfC0ur4Yzr2V8
 2/vgtDMrMI9/clKK8RvzWzw4rRcHjOU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-21--UA_3KXQNzSZ9TmUfklDrg-1; Thu, 27 Oct 2022 09:13:38 -0400
X-MC-Unique: -UA_3KXQNzSZ9TmUfklDrg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D3FF101A54E;
 Thu, 27 Oct 2022 13:13:38 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 988AFC15BA8;
 Thu, 27 Oct 2022 13:13:37 +0000 (UTC)
Date: Thu, 27 Oct 2022 14:13:35 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: QEMU Summit Minutes
Message-ID: <Y1qD//rEJ9vAFedm@redhat.com>
References: <CAFEAcA-7oY=988uLFEDgdSS8CjSSmyeZOYKsq9Vm-9vKXLms8A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA-7oY=988uLFEDgdSS8CjSSmyeZOYKsq9Vm-9vKXLms8A@mail.gmail.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Oct 27, 2022 at 01:50:37PM +0100, Peter Maydell wrote:
> Infrastructure
> ==============

snip

> Alex Bennee has successfully signed the QEMU project up for the GitLab
> Open Source Program, which grants Ultimate tier features. This includes
> 50,000 CI minutes per month, 500 GB of transfer per month, and 250 GB of
> storage. I have not seen confirmation yet that personal forks of
> qemu.git share the CI minutes but Daniel Berrangé, Alex Bennée, and I
> believe this should be the case.

NB, in case anymore missed discussion since the summit, this
is *NOT* the case for forks.

Standard user accounts or group namespaces on gitlab.com get 400
CI minutes and cost factor of 1.0 by default. NB some users / groups
might be grandfathered into a 2000 CI minute quota, but its not
clear if that's going to remain so.

With joining the OSP, QEMU gets its quota increased to 50,000 CI
minutes, and the cost factor reduced to 0.5

Forks of QEMU still consume from the user's own CI quota, but
they benefit from a reduced cost factor of 0.008.

For further details see here:

  https://lists.gnu.org/archive/html/qemu-devel/2022-10/msg00244.html

> Bug Tracking System
> ===================
> 
> We discussed the state of our bug tracker now we've had time
> to see how the migration from Launchpad to Gitlab has gone.
> 
> At point of conversion we had about ~450 bugs; we're up to
> ~650 open bugs now. Gitlab doesn't have the same kind of
> automated close-stale-bugs machinery that Launchpad did, so
> we probably have more stale bugs than we did. There was
> no consensus about whether we should be more active/automated
> about closing old bugs.
> 
> 
> It was noted that it's now harder to CC somebody on a bug
> because you can't just cc them on a reply on the mailing list.
> We agreed that we should have some way (probably in MAINTAINERS)
> for developers to note their gitlab user ID, so it's easier to
> find out the right ID to @ to get somebody's attention on a bug.

I would like to see at minimum, *all* people acting as subsystem
MAINTAINERS (ie 'Status == Supported/Maintained) having a gitlab.com
account, and be added to the /qemu-project membership list. It is
pretty unhelpful to have maintainers of subsystems be uncontactable
via / ignoring the project's official bug tracker, as that puts a
bigger burden on people doing bug triage and will lead to growing
backlog.

We've got 44 people as members in gitlab.com/qemu-project right
now.

We have 167 distinct maintainer email addrs in MAINTAINERS.

We have 192 subsystems listed as 'maintained' and 96 as 'supported',
81 'odd fixes' and '12' orphan.

This suggests there is a big gap in our gitlab.com membership wrt
supported /maintained subsystems.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


