Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20939695ABD
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 08:41:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRpvU-0008WJ-1O; Tue, 14 Feb 2023 02:40:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pRpvR-0008VG-Hv
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 02:40:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pRpvP-0003MP-O7
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 02:40:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676360426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wj1i92AU4ax3NfIkghc8kj0b8nckRjLCMxTzHf00wcw=;
 b=WpgzBVbyQ9uxQAlcZ3tJZcqkO0/WuP1dTzfBWYlt0X5vWzSo1J4AuquR33IRNIV8VYCmv0
 7v/8SWnavK0g7yLJr1xspqWDcbRHKXe0BksPdLs42svz09PoukusAQ5zMy//ZZJ6gQ56++
 F9bSbQ6kITOWcCTSUWq6n+qrvCq1Peo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-HxbIWJhyOn2olAOsezWTfg-1; Tue, 14 Feb 2023 02:40:22 -0500
X-MC-Unique: HxbIWJhyOn2olAOsezWTfg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 717693811F24;
 Tue, 14 Feb 2023 07:40:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.124])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 489201415108;
 Tue, 14 Feb 2023 07:40:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 39FD821E6A1F; Tue, 14 Feb 2023 08:40:21 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,  John Snow <jsnow@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,  Cleber Rosa <crosa@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Thomas Huth
 <thuth@redhat.com>,  Beraldo Leal <bleal@redhat.com>,  Michael Roth
 <michael.roth@amd.com>,  Wainer dos Santos Moschetta
 <wainersm@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,  Qemu-block
 <qemu-block@nongnu.org>,  Hanna Reitz <hreitz@redhat.com>,  Alex
 =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,  Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 6/7] CI: Stop building docs on centos8
References: <20230210003147.1309376-1-jsnow@redhat.com>
 <20230210003147.1309376-7-jsnow@redhat.com>
 <CAFEAcA-c5y0TR8vYg_FYEmGv3mOOmBgeD0cyb+mVotsP=r-Dsw@mail.gmail.com>
 <CAFn=p-aDV9=vG6hjTWRE6c52TpYSjDBU22nthTuejDCv_XrYMQ@mail.gmail.com>
 <CAFEAcA_eGvz_BQVLhVWtedRh2mcBuMEhv0RKF+6DW4t+9FdPAw@mail.gmail.com>
 <Y+Z2Kcq17HGWuoTV@redhat.com>
Date: Tue, 14 Feb 2023 08:40:20 +0100
In-Reply-To: <Y+Z2Kcq17HGWuoTV@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Fri, 10 Feb 2023 16:51:53 +0000")
Message-ID: <87cz6cpue3.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

[...]

> We don't have to drop python 3.6. It is a choice because
> of a desire to be able to use some shiny new python
> features without caring about back compat.

I read this on Friday, and decided to let it sit until after the
weekend.  Well, it's now Tuesday, and to be frank, it's still as
offensively flippant as it was on Friday.  It shows either ignorance of
or cavalier disregard for the sheer amount of work some of us have had
to put into keeping old versions of Python viable.

The latter would be quite unlike you, so it must be the former.

John has sunk *man-months* into keeping old versions of Python viable.
I've put in a lot less myself, but still enough to be painfully aware of
it.  I figure Cleber and Beraldo are somewhere in between.

Insinuating John's proposal is motivated by "a desire to be able to use
some shiny new python features without caring about back compat"
disrespects all this work.

We should have a sober discussion on which versions of Python to work
with, and the tradeoffs involved.  But before I engage in that, I insist
on resetting the frame: no, this is not about shiny, new Python
features.  It is about stopping the bleeding.  It is about reducing what
feels more and more like bullshit work to me, so we can actually
accomplish stuff that matters.

And let's give the people who have been doing the actual work the
benefit of the doubt.

[...]


