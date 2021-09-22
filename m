Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E085C4150B0
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 21:49:42 +0200 (CEST)
Received: from localhost ([::1]:48490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT8FR-0000zH-Qg
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 15:49:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mT8D4-0007th-Hz
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 15:47:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mT8Cn-0004JA-Tf
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 15:47:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632340015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QzMHkwqHCbU0txdLaJ3+8LJotvfdqsBk28mtOxl/yrA=;
 b=SimIHWx+9JDo2+cuaFoR/yfax+GB5WqW5lWnp8+/96O1Zp2s+gVpn5n26+BnJM+Qqj6tDz
 olzu8lyyfEILIEKtOKyspesQtnH6CR/iHNZjP9A4hSzMoPXnJL/Cu/9SpPc0pE1m9jaMpU
 WUbrHnLv9BelMIalwSsKrV1zDcw36+o=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-pT9KGztfMT6onMuJvHo9TQ-1; Wed, 22 Sep 2021 15:46:54 -0400
X-MC-Unique: pT9KGztfMT6onMuJvHo9TQ-1
Received: by mail-pf1-f199.google.com with SMTP id
 a188-20020a627fc5000000b004446be17615so2374423pfd.7
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 12:46:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QzMHkwqHCbU0txdLaJ3+8LJotvfdqsBk28mtOxl/yrA=;
 b=1HI9RtCwGgHO7lxFUNWcq093XmEfhd0XtdN27CcfUOEEd9uFSMOxzHA02c/akOxa0m
 zmh5UlqOvsmRuu8/bRM88wa4TrIvB5EWkhz2O3gY33L8MgQ8lU/t+LXCrUDc4Dm3q56g
 cR0fnADlogePqL3wxAJ+S/lTjVv1MMoAlmHN3nxfDr/v3ZEcxxkA9f55/Rg57GDdJfV+
 jgEfiT8AQZG2sJqaavRaEvjUsphnlqXuPwWLIQ8aBcW1/o7s4qDCaGTv+HuRqXy6zKnD
 3YEtludVLdg3nyO8yfV2EhQC60CkhsKImwHDLkJkgSn6FE7hkNrqrk2Ngm6q8Bd8gKp6
 QvgQ==
X-Gm-Message-State: AOAM533DJr775DBbfjJsAXk7qBuKddMI+pnS1JHtwZ+Ix7bCqlPmcXxa
 i7UOH4VPA9TmmrTjfE8gKOsQnVQOmhN+CcjYQbFcDMhPqAd7YuxkHr7XFdKidgfL+wSzklNe6jv
 jBHcsVxEqfO0Fy3eKOheqt+trLfT/1F8=
X-Received: by 2002:a65:47cd:: with SMTP id f13mr538513pgs.439.1632340013490; 
 Wed, 22 Sep 2021 12:46:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkBEXUsyVMoRVfWbs1kXTZ9zNIXAr4hE1VVivhar15ZFUAd723rtYvRnPn1Njmvd1BkcF0WgC27AS91Auf0ns=
X-Received: by 2002:a65:47cd:: with SMTP id f13mr538494pgs.439.1632340013184; 
 Wed, 22 Sep 2021 12:46:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210922190324.190227-1-willianr@redhat.com>
 <20210922190324.190227-3-willianr@redhat.com>
 <1fba1ffa-559b-7c5b-24e0-817f4b855fc5@redhat.com>
In-Reply-To: <1fba1ffa-559b-7c5b-24e0-817f4b855fc5@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 22 Sep 2021 16:46:26 -0300
Message-ID: <CAKJDGDbu_DeP25QtvQcM6C0Kt+tXE-7caZaoGL0rcJObZgprKg@mail.gmail.com>
Subject: Re: [PATCH 2/2] tests/Makefile: add TESTFILES option to make
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
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 22, 2021 at 4:08 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> On 9/22/21 21:03, Willian Rampazzo wrote:
> > Add the possibility of running all the tests from a single file, or
> > multiple files, running a single test within a file or multiple tests
> > within multiple files using `make check-acceptance` and the TESTFILES
> > environment variable.
> >
> > Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> > ---
> >   docs/devel/testing.rst | 27 +++++++++++++++++++++++++++
> >   tests/Makefile.include |  5 ++++-
> >   2 files changed, 31 insertions(+), 1 deletion(-)
>
> > diff --git a/tests/Makefile.include b/tests/Makefile.include
> > index 6e16c05f10..82d7ef7a20 100644
> > --- a/tests/Makefile.include
> > +++ b/tests/Makefile.include
> > @@ -88,6 +88,9 @@ clean-tcg: $(CLEAN_TCG_TARGET_RULES)
> >   TESTS_VENV_DIR=3D$(BUILD_DIR)/tests/venv
> >   TESTS_VENV_REQ=3D$(SRC_PATH)/tests/requirements.txt
> >   TESTS_RESULTS_DIR=3D$(BUILD_DIR)/tests/results
> > +ifndef TESTFILES
> > +     TESTFILES=3Dtests/acceptance
> > +endif
> >   # Controls the output generated by Avocado when running tests.
> >   # Any number of command separated loggers are accepted.  For more
> >   # information please refer to "avocado --help".
> > @@ -130,7 +133,7 @@ check-acceptance: check-venv $(TESTS_RESULTS_DIR) g=
et-vm-images
> >               --show=3D$(AVOCADO_SHOW) run --job-results-dir=3D$(TESTS_=
RESULTS_DIR) \
> >               --filter-by-tags-include-empty --filter-by-tags-include-e=
mpty-key \
> >               $(AVOCADO_TAGS) \
> > -            $(if $(GITLAB_CI),,--failfast) tests/acceptance, \
> > +            $(if $(GITLAB_CI),,--failfast) $(TESTFILES), \
>
> Since this is Avocado specific, maybe call the variable
> AVOCADO_TESTFILES (similar to AVOCADO_TAGS)?

I don't see a problem with changing that to AVOCADO_TESTFILES. I was
trying to make things shorter and easy to remember. If the too-long
variable name is not a problem, I can change that.

>
> >               "AVOCADO", "tests/acceptance")
> >
> >   # Consolidated targets
> >
>


