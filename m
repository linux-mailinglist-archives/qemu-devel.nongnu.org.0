Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC52496530
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 19:38:14 +0100 (CET)
Received: from localhost ([::1]:40276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAync-0004Ia-QW
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 13:38:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nAyAz-00005f-61
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 12:58:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nAyAx-0003Og-D8
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 12:58:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642787894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+qOnJs6dqWHm3E7gbuhFXdkDzTWT6NFwujhp/bbMRI8=;
 b=DyUNkRgVJwHv3onfGHXbsv0OUt7Nq0ihtnX+M7lB/X205nmH0Q2hPm6l3umx3vvN9jSZi5
 Gwd9WWDSQIZx5MOw2E8XSSL8NiR3RIWBGUOc3OGli16xggss/wd5x7h4jvZUvvTNxfrvTV
 nbVtWzJd7kPpop1ZiRtDYUVwr/IOkGE=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-ZB3XDeiRPcOukXfqScPLNA-1; Fri, 21 Jan 2022 12:58:08 -0500
X-MC-Unique: ZB3XDeiRPcOukXfqScPLNA-1
Received: by mail-vk1-f197.google.com with SMTP id
 m79-20020a1fa352000000b0031e4e8688bdso523141vke.22
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 09:58:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+qOnJs6dqWHm3E7gbuhFXdkDzTWT6NFwujhp/bbMRI8=;
 b=tzaplO9d96x+NNwdgtIQI6ug6zZzcjVqKonuNOStjGMxw7tw7mNeO2yDshWjFOKEyZ
 M6WeI33GQ0oRce4LsSNnEDa7T5+JXEjJ5HWHsAyXkO37gu4j8OYNIjViUuLo+2cXCBRC
 eMOlRXeTFmuLWPLm1f96/T/cQg0j5K5qcIg/VwtHl7XAJseueaYFC4qweXk8WM9ua83v
 LetOU2PoylDATNvzqSAenmTCvMAGX6JfQnkhmgAXojlhsITuNjRTTf6bM3t45ysGnM6S
 +6DWLv4r347q4ThirkTNlGZHqqajH1QITayMmOnCwnltc1LhYj2puIqsQM05sOWLfsbv
 zDJQ==
X-Gm-Message-State: AOAM531MXkH8RdSs6Dd3PdBv87kN4bnZ2yag6wWy4Ln+49M0ahlM9VK9
 Q8Yf+/j2K0/F6VC827sCapvCP1i/8HoRnZuIpOwAnROEZLaHmvTcDMsI5FpOYfxYoKjjIpDICKR
 JofE5a3UJrmyYmBkM8vGRPyjDcBeLTHs=
X-Received: by 2002:a05:6102:3566:: with SMTP id
 bh6mr2011784vsb.11.1642787887762; 
 Fri, 21 Jan 2022 09:58:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwbrl4Ik7fwTKeX//AmsYU0hnaYfEBwdLkdAYPXU49iZnv8+iislVa7Na1YJptvQbYCEnEW/IUQW5ZPCbpDF1Y=
X-Received: by 2002:a05:6102:3566:: with SMTP id
 bh6mr2011773vsb.11.1642787887505; 
 Fri, 21 Jan 2022 09:58:07 -0800 (PST)
MIME-Version: 1.0
References: <20220121005221.142236-1-jsnow@redhat.com>
 <20220121175417.rgaldqoqzdcw2igp@laptop.redhat>
In-Reply-To: <20220121175417.rgaldqoqzdcw2igp@laptop.redhat>
From: John Snow <jsnow@redhat.com>
Date: Fri, 21 Jan 2022 12:57:56 -0500
Message-ID: <CAFn=p-YKo6tOLT0mFcsLm7_tjRgFwg46NG=eF1fKsAo+v12Jmg@mail.gmail.com>
Subject: Re: [PATCH] python: pin setuptools below v60.0.0
To: Beraldo Leal <bleal@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-devel <qemu-devel@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 21, 2022 at 12:54 PM Beraldo Leal <bleal@redhat.com> wrote:
>
> On Thu, Jan 20, 2022 at 07:52:21PM -0500, John Snow wrote:
> > setuptools is a package that replaces the python stdlib 'distutils'. It
> > is generally installed by all venv-creating tools "by default". It isn't
> > actually needed at runtime for the qemu package, so our own setup.cfg
> > does not mention it as a dependency.
> >
> > However, tox will create virtual environments that include it, and will
> > upgrade it to the very latest version. the 'venv' tool will also include
> > whichever version your host system happens to have.
> >
> > Unfortunately, setuptools version 60.0.0 and above include a hack to
> > forcibly overwrite python's built-in distutils. The pylint tool that we
> > use to run code analysis checks on this package relies on distutils and
> > suffers regressions when setuptools >= 60.0.0 is present at all, see
> > https://github.com/PyCQA/pylint/issues/5704
> >
> > Instruct tox and the 'check-dev' targets to avoid setuptools packages
> > that are too new, for now. Pipenv is unaffected, because setuptools 60
> > does not offer Python 3.6 support, and our pipenv config is pinned
> > against Python 3.6.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  python/Makefile  | 2 ++
> >  python/setup.cfg | 1 +
> >  2 files changed, 3 insertions(+)
> >
> > diff --git a/python/Makefile b/python/Makefile
> > index 3334311362..949c472624 100644
> > --- a/python/Makefile
> > +++ b/python/Makefile
> > @@ -68,6 +68,8 @@ $(QEMU_VENV_DIR) $(QEMU_VENV_DIR)/bin/activate: setup.cfg
> >               echo "ACTIVATE $(QEMU_VENV_DIR)";               \
> >               . $(QEMU_VENV_DIR)/bin/activate;                \
> >               echo "INSTALL qemu[devel] $(QEMU_VENV_DIR)";    \
> > +             pip install --disable-pip-version-check         \
> > +                     "setuptools<60.0.0" 1>/dev/null;        \
> >               make develop 1>/dev/null;                       \
> >       )
> >       @touch $(QEMU_VENV_DIR)
> > diff --git a/python/setup.cfg b/python/setup.cfg
> > index 417e937839..aa238d8bc9 100644
> > --- a/python/setup.cfg
> > +++ b/python/setup.cfg
> > @@ -163,6 +163,7 @@ deps =
> >      .[devel]
> >      .[fuse]  # Workaround to trigger tox venv rebuild
> >      .[tui]   # Workaround to trigger tox venv rebuild
> > +    setuptools < 60  # Workaround, please see commit msg.
> >  commands =
> >      make check
> >
>
> Reviewed-by: Beraldo Leal <bleal@redhat.com>
>
> --
> Beraldo
>

Thanks a million. I'm staging this right away.

--js


