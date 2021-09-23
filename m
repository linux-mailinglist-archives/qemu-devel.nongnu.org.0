Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D789415D23
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 13:57:30 +0200 (CEST)
Received: from localhost ([::1]:43556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTNM0-00078E-KQ
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 07:57:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mTNJB-00059e-Gz
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 07:54:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mTNJ6-0001XX-VU
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 07:54:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632398066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E/48hcO3Nl+2Eae9kgz5lKoXIAi1Er9TV0fJgO+ryoc=;
 b=LywgvyOsNGNwqDEXP9o6U5Bu1KFPZDsNxP/qDPvFjRmBj1OOcnyBe6bAYynuzOQyHFYOju
 qBh9VxLaQ30qciSyv2n4M8MKT7IoE6E5zalU53e6iZPtLUhxFl4OKl9q5LF8P+oZBBZGzZ
 g0QjxZyIKMceWNMOojQR6ua3g0cuM5A=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-UMk9pognNaSunFl45_n1Gw-1; Thu, 23 Sep 2021 07:54:20 -0400
X-MC-Unique: UMk9pognNaSunFl45_n1Gw-1
Received: by mail-pj1-f69.google.com with SMTP id
 rm6-20020a17090b3ec600b0019ce1db4eaeso7403443pjb.5
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 04:54:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=E/48hcO3Nl+2Eae9kgz5lKoXIAi1Er9TV0fJgO+ryoc=;
 b=Qtk0byw7AJ1xTlrFuX2sONYgN0p5JB4tbeRaxXrQNuLlYMtJNN8gBQSKElYCkBzGiA
 XrLSov57VV7KxVuTsaHrHtVmiEXdvlSxFXNkWt3df645GVdJMLRj12kY43RijWD/OkMX
 ne1hNhJw/Je+LDmmRygyYQutLoo2Sk6SeOi3K18EId/U/yGiVPkZ3rR6NFHsTqOskJwR
 NzHt082uP9RAAgQ6j/yxkYlWznMHVLNggbb0MAHSJXGwOMgCryKZkgE5dmhSLF7g/ogC
 8AyuHBnQPCBLYLQKAC4cedILh29dfFxIM9vuIzx25lezAkCa1u8uWlnOF/EBBOYiurCL
 G0sQ==
X-Gm-Message-State: AOAM532yKjljkp3KenfKIQZUYulGW2LGRdgnw83ETmNMuo9F4sGjny+G
 ybnqEJTiR20avd2vLRZG3YnYUBBz49uPotj4ptYwpj3452B4Qn4bQ3u2Wrgny5aFwJrBJjHFkDH
 a5ssmWFaCLlRXEXkr+FCfgrxCs4V7gCc=
X-Received: by 2002:a17:90b:1bd2:: with SMTP id
 oa18mr17364524pjb.123.1632398059682; 
 Thu, 23 Sep 2021 04:54:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxR1k4FY3swOjQL5A1HA94ddjYAr7yUTsxA+Dy7Nthjh8h5wwvI9sW7MOPdgK/6aD70mVzIAA/fwrl7PlJVpRI=
X-Received: by 2002:a17:90b:1bd2:: with SMTP id
 oa18mr17364497pjb.123.1632398059316; 
 Thu, 23 Sep 2021 04:54:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210922190324.190227-1-willianr@redhat.com>
 <20210922190324.190227-2-willianr@redhat.com>
 <YUw6akmum97xkT14@redhat.com>
In-Reply-To: <YUw6akmum97xkT14@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Thu, 23 Sep 2021 08:53:53 -0300
Message-ID: <CAKJDGDaF6TgEQDKojHsfR3ZC04uxBxC4_rDMtYqHGbmpuXe21A@mail.gmail.com>
Subject: Re: [PATCH 1/2] docs/devel/testing: add instruction to run a single
 acceptance test
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 23, 2021 at 5:27 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Wed, Sep 22, 2021 at 04:03:23PM -0300, Willian Rampazzo wrote:
> > Add instructions to the Acceptance tests section about running a
> > single test file or a test within the test file.
> >
> > Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> > ---
> >  docs/devel/testing.rst | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
> > index 4a0abbf23d..b03df34f7b 100644
> > --- a/docs/devel/testing.rst
> > +++ b/docs/devel/testing.rst
> > @@ -740,6 +740,20 @@ may be invoked by running:
> >
> >    tests/venv/bin/avocado run $OPTION1 $OPTION2 tests/acceptance/
> >
> > +It is also possible to run tests from a single file or a single test
> > +within a test file. To run tests from a single file within the build
> > +tree, use:
> > +
> > + .. code::
> > +
> > +  tests/venv/bin/avocado run tests/acceptance/$TESTFILE
>
> Before running this users may well need to run
>
>    make check-venv
>
> we can't assume they have previously done "make check-acceptance"
> as they're possibly just reproducing a failure from gitlab
> CI locally, not running the whole suite.

Indeed!

>
> > +
> > +To run a single test within a test file, use:
> > +
> > + .. code::
> > +
> > +  tests/venv/bin/avocado run tests/acceptance/$TESTFILE:$TESTCLASS.$TE=
STNAME
> > +
>
> Valid test names are visible in the output from any previous execution
> of avocado, and can also be queried using
>
>   tests/venv/bin/avocado list tests/acceptance
>

Ack.

> >  Manual Installation
> >  -------------------
> >
> > --
> > 2.31.1
> >
>
> Regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>


