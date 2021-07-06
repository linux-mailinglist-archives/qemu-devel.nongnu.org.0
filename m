Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C993BDEDE
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 23:21:11 +0200 (CEST)
Received: from localhost ([::1]:41404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0sVC-0004MK-8p
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 17:21:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m0sTV-0003gn-Jg
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 17:19:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m0sTS-0004sB-ML
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 17:19:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625606360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hmh7MG8eNBLqSL2NpfStwNVbs/BVGEVZ6xSuu8GsIx0=;
 b=aZCYAi1pEs7c/wYhb/rJO1fZAcT2MmJTtTtGJ6tpBcBGfMO1cloIzMtbi1El4IVwLF2b+f
 YPyHmT5i75aWI9bAuH9YXXHnAw5WylifCQeGkDEP5noBo3M7/x3ZwsHli7BmrxR0tYlbdM
 LHviCSDP7jiUk6TqMs53wXWW7CE37Ro=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-gdVekEzxOv-4rglCoJEYtA-1; Tue, 06 Jul 2021 17:19:19 -0400
X-MC-Unique: gdVekEzxOv-4rglCoJEYtA-1
Received: by mail-oi1-f197.google.com with SMTP id
 l189-20020acabbc60000b02901f566a77bb8so477221oif.7
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 14:19:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Hmh7MG8eNBLqSL2NpfStwNVbs/BVGEVZ6xSuu8GsIx0=;
 b=M45g4wRZ6Vv1aihR02E6BbNLDqUf1f+Or5I6xxjX5GbBTWeCnDsg2SsUsB2p4Bizl8
 BTFE0OccZG53iteOmrdlyYLSXCWFRO6Z9+M8WrwX8vTMT75RAzbmIz6FXpANKI7nzD0r
 ZGXnbhdEwDRmeGXCDD5KE0d8sxT0s0J4l2rAZOz7P7Z5v7b7anm9NG15SxFyg0Dg5SPG
 E83tzUQuZaKLHzO8mImqvKCHJwg2bXGt5Acm1s9A6Mb0FpFWnztKdA0RVSfNnrgJbQZW
 hwMlvqopNATQmGqQS+ncsrBEnOzDNL018t9XGOexQLbgTJTWVz8wnnhMvPwro1ETUwEu
 POkA==
X-Gm-Message-State: AOAM533IBkb9gMYvEHeIuyqmFSQVxN3bZXJhgUCINutbSW44wXqUwgfE
 rgc1WpB0wTEv0BTC7n9OxHIe+cVI9e4grC4T7IXN6qG2Xc9a02YvOY3y/PU+3cwTwJpkEbYiu5a
 KeaoDopEsdDGzDvPWIud9IxP5gcL4QSQ=
X-Received: by 2002:ab0:20a6:: with SMTP id y6mr18655881ual.133.1625605879967; 
 Tue, 06 Jul 2021 14:11:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6z6cE96xTb4afNydHdvggPD5skv3ig3Ho4GolA6bkvYOmXZ642FMWej+dKR0DWctsezJTffMSkHiH4e9PnUg=
X-Received: by 2002:ab0:20a6:: with SMTP id y6mr18655854ual.133.1625605879801; 
 Tue, 06 Jul 2021 14:11:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210706190646.209440-1-willianr@redhat.com>
 <f2bd3a82-3347-1cb2-f3f4-14bb1f5ede7a@redhat.com>
In-Reply-To: <f2bd3a82-3347-1cb2-f3f4-14bb1f5ede7a@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 6 Jul 2021 18:10:53 -0300
Message-ID: <CAKJDGDYfGTxY3CiYWvU4qJciEU7wXbKrgQQ=ujJuUEFMKMQcdg@mail.gmail.com>
Subject: Re: [PATCH] tests/acceptance: allow control over tags during
 check-acceptance
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Wainer Moschetta <wainersm@redhat.com>,
 Cleber Rosa Junior <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 6, 2021 at 5:46 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> On 7/6/21 9:06 PM, Willian Rampazzo wrote:
> > Although it is possible to run a specific test using the avocado
> > command-line, a user may want to use a specific tag while running the
> > ``make check-acceptance`` during the development or debugging.
> >
> > This allows using the TAGS environment variable where the user takes
> > total control of which tests should run based on the tags defined.
> >
> > This also makes the check-acceptance command flexible to restrict tests
> > based on tags while running on CI.
> >
> > e.g.:
> >
> > TAGS=3D"foo bar baz" make check-acceptance
>
> I'm worried 'TAGS' is a bit too generic...
> Maybe rename AVOCADO_TAGS -> AVOCADO_CMDLINE_TAGS and
> TAGS -> AVOCADO_TAGS?

I'm fine with those changes.

>
> > Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> > ---
> >  docs/devel/testing.rst |  7 +++++++
> >  tests/Makefile.include | 10 ++++++++--
> >  2 files changed, 15 insertions(+), 2 deletions(-)
> >
> > diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
> > index 4e42392810..6e03c3449b 100644
> > --- a/docs/devel/testing.rst
> > +++ b/docs/devel/testing.rst
> > @@ -760,6 +760,13 @@ in the current directory, tagged as "quick", run:
> >
> >    avocado run -t quick .
> >
> > +It is also possible to run tests based on tags using the
> > +``make check-acceptance`` command and the ``TAGS`` environment variabl=
e:
> > +
> > +.. code::
> > +
> > +   TAGS=3Dquick make check-acceptance
> > +
> >  The ``avocado_qemu.Test`` base test class
> >  -----------------------------------------
> >
> > diff --git a/tests/Makefile.include b/tests/Makefile.include
> > index 8f220e15d1..5869ab8a04 100644
> > --- a/tests/Makefile.include
> > +++ b/tests/Makefile.include
> > @@ -92,7 +92,11 @@ TESTS_RESULTS_DIR=3D$(BUILD_DIR)/tests/results
> >  # Any number of command separated loggers are accepted.  For more
> >  # information please refer to "avocado --help".
> >  AVOCADO_SHOW=3Dapp
> > -AVOCADO_TAGS=3D$(patsubst %-softmmu,-t arch:%, $(filter %-softmmu,$(TA=
RGETS)))
> > +ifndef TAGS
> > +     AVOCADO_TAGS=3D$(patsubst %-softmmu,-t arch:%, $(filter %-softmmu=
,$(TARGETS)))
> > +else
> > +     AVOCADO_TAGS=3D$(addprefix -t , $(TAGS))
> > +endif
> >
> >  $(TESTS_VENV_DIR): $(TESTS_VENV_REQ)
> >       $(call quiet-command, \
> > @@ -125,10 +129,12 @@ get-vm-image-fedora-31-%: check-venv
> >  get-vm-images: check-venv $(patsubst %,get-vm-image-fedora-31-%, $(FED=
ORA_31_DOWNLOAD))
> >
> >  check-acceptance: check-venv $(TESTS_RESULTS_DIR) get-vm-images
> > +     @echo "AVOCADO_TAGS $(AVOCADO_TAGS)"
> >       $(call quiet-command, \
> >              $(TESTS_VENV_DIR)/bin/python -m avocado \
> >              --show=3D$(AVOCADO_SHOW) run --job-results-dir=3D$(TESTS_R=
ESULTS_DIR) \
> > -            --filter-by-tags-include-empty --filter-by-tags-include-em=
pty-key \
> > +            $(if $(TAGS),, --filter-by-tags-include-empty \
> > +                     --filter-by-tags-include-empty-key) \
> >              $(AVOCADO_TAGS) \
> >              $(if $(GITLAB_CI),,--failfast) tests/acceptance, \
> >              "AVOCADO", "tests/acceptance")
> >
>


