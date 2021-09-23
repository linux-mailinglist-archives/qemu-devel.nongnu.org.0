Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 656DF415D97
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 14:02:34 +0200 (CEST)
Received: from localhost ([::1]:48474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTNQv-00020c-EE
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 08:02:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mTNKH-0005nO-Nk
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 07:55:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mTNK4-0002Oh-B4
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 07:55:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632398125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pwt6kwWDNoZEAI/l88WiLwKn2L2wTvAW80Lith94m2U=;
 b=ZdgNRLLe3gejEK0eQZToKQgirGNLdEAXP+Kw61zAyY1LIqZi2HNya4Le7MdRgEupXVBXr4
 fr1da9UELvy0kUUsA+bqHTBz5VAUn5u9PyKrf4Uf74YeoX01OBCS8oVdhEzlnYa1VzWgsd
 ZqGLGz3qt5faVOHOIhBXXBUol8Qgs7k=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-tk_pAryaNfK2TICN0ObJkQ-1; Thu, 23 Sep 2021 07:55:24 -0400
X-MC-Unique: tk_pAryaNfK2TICN0ObJkQ-1
Received: by mail-pf1-f197.google.com with SMTP id
 z2-20020a626502000000b003fe1e4314d2so3716139pfb.0
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 04:55:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pwt6kwWDNoZEAI/l88WiLwKn2L2wTvAW80Lith94m2U=;
 b=40f9T7tvufMvTozjPLGfYw73PpGM5IopZsBrfOyqYq+EeZvAt9rXYGeau8waGWtBZK
 dd9i8GV0Ya7Tba1fFSyyvqnAL5XU39shg8qmp2TQh02QT4qh/zOvbZTZSTTT9UNX2LB2
 NGJ80DBFvBPTVkAZ8Hof1I81KAjq9hf15w59q/8MT36EaStXdkHueFkeku9KumDA5PXK
 clk3CQMnKAK2UHAe5ZymAYnH0LgRnj6Z9c/8vxAgLu2brIblJsF0yYPtMAXrAPBTb+pO
 DyP3JgF+SUwWmULTBmppaJXYJDt3Rl3yagAxWziCp/bMowAoBxpZ2+zIK57yhifpSfZU
 x4PQ==
X-Gm-Message-State: AOAM530vOB0RxGyMn/uicG+vTOwLgCB/2dBh/0Ly+4sY95dvjw5T20U7
 ZVqHh5dU9JDKOPk4qWbvSveMMV0ZZLq0jRVBrD22p1nc1bszCA/8mO5DKGhQQeYqwBAhYD/4ojW
 iBKrvyPN+kuTjqvk5AbZjzeL1Uwb3HKk=
X-Received: by 2002:a17:90a:5d0f:: with SMTP id
 s15mr4993198pji.10.1632398123241; 
 Thu, 23 Sep 2021 04:55:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBmNozi4ghIzYVxUOj2OXloEbcdtBsR9FuL/wPiulLKOVAZPnqbicmbbZNndGk9AhWtCPOqKIbQQwBUB04EtE=
X-Received: by 2002:a17:90a:5d0f:: with SMTP id
 s15mr4993176pji.10.1632398123010; 
 Thu, 23 Sep 2021 04:55:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210922190324.190227-1-willianr@redhat.com>
 <20210922190324.190227-3-willianr@redhat.com>
 <1fba1ffa-559b-7c5b-24e0-817f4b855fc5@redhat.com>
 <CAKJDGDbu_DeP25QtvQcM6C0Kt+tXE-7caZaoGL0rcJObZgprKg@mail.gmail.com>
 <2235e846-cfd6-6c67-1e03-dd1ecc38d198@redhat.com>
 <YUxMAJiCW+llt5ml@redhat.com>
In-Reply-To: <YUxMAJiCW+llt5ml@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Thu, 23 Sep 2021 08:54:56 -0300
Message-ID: <CAKJDGDYAoh7YaJPkQRSQ8g1YCaW98Chz2bVwNaezP54ikA-tRA@mail.gmail.com>
Subject: Re: [PATCH 2/2] tests/Makefile: add TESTFILES option to make
 check-acceptance
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 23, 2021 at 6:42 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Thu, Sep 23, 2021 at 11:34:18AM +0200, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > On 9/22/21 21:46, Willian Rampazzo wrote:
> > > On Wed, Sep 22, 2021 at 4:08 PM Philippe Mathieu-Daud=C3=A9
> > > <philmd@redhat.com> wrote:
> > > >
> > > > On 9/22/21 21:03, Willian Rampazzo wrote:
> > > > > Add the possibility of running all the tests from a single file, =
or
> > > > > multiple files, running a single test within a file or multiple t=
ests
> > > > > within multiple files using `make check-acceptance` and the TESTF=
ILES
> > > > > environment variable.
> > > > >
> > > > > Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> > > > > ---
> > > > >    docs/devel/testing.rst | 27 +++++++++++++++++++++++++++
> > > > >    tests/Makefile.include |  5 ++++-
> > > > >    2 files changed, 31 insertions(+), 1 deletion(-)
> > > >
> > > > > diff --git a/tests/Makefile.include b/tests/Makefile.include
> > > > > index 6e16c05f10..82d7ef7a20 100644
> > > > > --- a/tests/Makefile.include
> > > > > +++ b/tests/Makefile.include
> > > > > @@ -88,6 +88,9 @@ clean-tcg: $(CLEAN_TCG_TARGET_RULES)
> > > > >    TESTS_VENV_DIR=3D$(BUILD_DIR)/tests/venv
> > > > >    TESTS_VENV_REQ=3D$(SRC_PATH)/tests/requirements.txt
> > > > >    TESTS_RESULTS_DIR=3D$(BUILD_DIR)/tests/results
> > > > > +ifndef TESTFILES
> > > > > +     TESTFILES=3Dtests/acceptance
> > > > > +endif
> > > > >    # Controls the output generated by Avocado when running tests.
> > > > >    # Any number of command separated loggers are accepted.  For m=
ore
> > > > >    # information please refer to "avocado --help".
> > > > > @@ -130,7 +133,7 @@ check-acceptance: check-venv $(TESTS_RESULTS_=
DIR) get-vm-images
> > > > >                --show=3D$(AVOCADO_SHOW) run --job-results-dir=3D$=
(TESTS_RESULTS_DIR) \
> > > > >                --filter-by-tags-include-empty --filter-by-tags-in=
clude-empty-key \
> > > > >                $(AVOCADO_TAGS) \
> > > > > -            $(if $(GITLAB_CI),,--failfast) tests/acceptance, \
> > > > > +            $(if $(GITLAB_CI),,--failfast) $(TESTFILES), \
> > > >
> > > > Since this is Avocado specific, maybe call the variable
> > > > AVOCADO_TESTFILES (similar to AVOCADO_TAGS)?
> > >
> > > I don't see a problem with changing that to AVOCADO_TESTFILES. I was
> > > trying to make things shorter and easy to remember. If the too-long
> > > variable name is not a problem, I can change that.
> >
> > This is the generic tests/Makefile, so $TESTFILES might be confusing,
> > which is why I prefer the explicit AVOCADO_ prefix (AVOCADO_SHOW,
> > AVOCADO_TAGS).
>
> IIUC, this is not actually just test files - it is test files plus the
> test names. So better just  $(AVOCADO_TESTS)
>

Ack. I'll send another version soon.

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


