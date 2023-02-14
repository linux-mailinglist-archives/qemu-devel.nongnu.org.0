Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1586A6962AD
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 12:50:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRto6-0004MO-Af; Tue, 14 Feb 2023 06:49:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pRto4-0004M8-Dn
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 06:49:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pRto2-00056j-Ay
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 06:49:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676375345;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XvRJpfHTx9reVLSZG6eswjOgmLB9On1eeP0PjTgPK0Y=;
 b=VgnZX7sG6P0NT9XvxvXOHR/96cvZJd056ZFfyNDp9+lqcUm6+UaET3Ocf1D12D3mo1Z2is
 hM7l6ELXQe8B8upH3YEAE2Evep8gDg7VGW5gZipig3F4DVA2QTC6TN8rv9UZD3FrXb5PHo
 rE2JJzJroGKH2ZBpr8eluIOrQE7ZlAQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-42-fHaRkVoaOl2QtYHbDeGSig-1; Tue, 14 Feb 2023 06:49:02 -0500
X-MC-Unique: fHaRkVoaOl2QtYHbDeGSig-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 849743828892;
 Tue, 14 Feb 2023 11:49:01 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.149])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B120492B15;
 Tue, 14 Feb 2023 11:48:58 +0000 (UTC)
Date: Tue, 14 Feb 2023 11:48:55 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Hanna Reitz <hreitz@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 6/7] CI: Stop building docs on centos8
Message-ID: <Y+t1J72iMsLWXHne@redhat.com>
References: <20230210003147.1309376-1-jsnow@redhat.com>
 <20230210003147.1309376-7-jsnow@redhat.com>
 <CAFEAcA-c5y0TR8vYg_FYEmGv3mOOmBgeD0cyb+mVotsP=r-Dsw@mail.gmail.com>
 <CAFn=p-aDV9=vG6hjTWRE6c52TpYSjDBU22nthTuejDCv_XrYMQ@mail.gmail.com>
 <CAFEAcA_eGvz_BQVLhVWtedRh2mcBuMEhv0RKF+6DW4t+9FdPAw@mail.gmail.com>
 <Y+Z2Kcq17HGWuoTV@redhat.com> <87cz6cpue3.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87cz6cpue3.fsf@pond.sub.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Feb 14, 2023 at 08:40:20AM +0100, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> [...]
> 
> > We don't have to drop python 3.6. It is a choice because
> > of a desire to be able to use some shiny new python
> > features without caring about back compat.
> 
> I read this on Friday, and decided to let it sit until after the
> weekend.  Well, it's now Tuesday, and to be frank, it's still as
> offensively flippant as it was on Friday.  It shows either ignorance of
> or cavalier disregard for the sheer amount of work some of us have had
> to put into keeping old versions of Python viable.
> 
> The latter would be quite unlike you, so it must be the former.

I'm sorry, I don't mean it to be offensive. I'm genuinely not seeing
from the descriptions in the series what the functional benefits are
from dropping 3.6.

> John has sunk *man-months* into keeping old versions of Python viable.
> I've put in a lot less myself, but still enough to be painfully aware of
> it.  I figure Cleber and Beraldo are somewhere in between
> 
> Insinuating John's proposal is motivated by "a desire to be able to use
> some shiny new python features without caring about back compat"
> disrespects all this work.

I'm writing my comments based on what is described in the cover letter
as the motivations for the change:

[quote]
The motivation for this series is that Python 3.6 was EOL at the end of
2021; upstream tools are beginning to drop support for it, including
setuptools, pylint, mypy, etc. As time goes by, it becomes more
difficult to support and test against the full range of Python versions
that QEMU supports. The closer we get to Python 3.12, the harder it will
be to cover that full spread of versions.
[/quote]

this is all about new/eol versions of software upstream, and I don't
think that's a justification. QEMU explicitly aims to use distro provided
versions and upstream EOL status is not relevant in that context. Even
if using "pip" to install it is possible to limit yourself to upstream
releases which still support 3.6.

There is the separate issue of Meson dropping python 3.6 which motivates
Paolo's series. Again though, we don't have to increase our minimum meson
version, because meson is working today. It is our choice to to increase
it to use latest available meson features. At some point we can decide
what we have is good enough and we don't have to keep chasing the latest
features. Maybe we're not there yet, but we should think about when that
would be.

[quote]
The qemu.qmp library and the avocado testing framework both have
motivations for dropping 3.6 support, but are committed to not doing so
until QEMU drops support.
[/quote]

I suspect that this is more of a driver for the drop of 3.6, but I
don't see any details.

IOW overall justification come across as wanting to use new features,
and follow upstream EOL, without any real detail of what we're going
to gain from a functional POV.

> We should have a sober discussion on which versions of Python to work
> with, and the tradeoffs involved.  But before I engage in that, I insist
> on resetting the frame: no, this is not about shiny, new Python
> features.  It is about stopping the bleeding.  It is about reducing what
> feels more and more like bullshit work to me, so we can actually
> accomplish stuff that matters.

Every applications developer chooses an arbitrary cut off points for
minimum software versions, depending on their particular needs. With
our support policy we tried to express a reasonable tradeoff between
keeping back compat, and being able to adopt new features.

Obviously that tradeoff is not currently looking acceptable on the
python side, but it is not clear why that is ?

Can someone simply explain what we wil see as the benefit from dropping
3.6 / adopting 3.7 as the baseline ? 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


