Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C214445404
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 14:37:18 +0100 (CET)
Received: from localhost ([::1]:35356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1micvd-0007wM-2J
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 09:37:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1micah-000225-5a
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 09:15:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1micae-00036P-2x
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 09:15:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636031735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a9NM+x8KecaJ9aR4sYtnU2DnCNIjRQZIv6/Z2BnnPqs=;
 b=B05XCXUmNjdoojBxIebfK6hfTcYg/vSlSfadDfqhwe1dHNlW9QfTryFz+ltc88NdXCLfzI
 /jcD0QzIJWSkL8xVGi1ztfOqHYmLv2LaF9L84oBqolhShAT9+jfYuXq8/ukClqa+1n+B0Z
 /CWfh0n8Uf3gcYnlPPSWJcT7jqumQts=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-eWO5iRE8OGq3gaQG6A10aw-1; Thu, 04 Nov 2021 09:15:32 -0400
X-MC-Unique: eWO5iRE8OGq3gaQG6A10aw-1
Received: by mail-pf1-f197.google.com with SMTP id
 m26-20020a62a21a000000b0041361973ba7so3775281pff.15
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 06:15:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=a9NM+x8KecaJ9aR4sYtnU2DnCNIjRQZIv6/Z2BnnPqs=;
 b=Pg3JVd05/vEuT3ysCCLlMSsTie9qwB3XCF82/IoEbYNZPIbRU9fcVSs+AKlkkVZuVB
 oqm0EaPcXE+mPG1Il5b83fObEzoh79VbOIEVPfI1+jZVn7jyrLNDxlnV6xcCJJi/w3mv
 ghiXOpITzueEg+ZJ5ZzZ9IpW88F+QBmhwIbsBlXYWzwJK+jUt00csS2YHIOlHPCbyo11
 BiXVnIxktyLG0r1LDv4BQVWLsM6wZcLi01R49kdyqy1hUZG2OWjU3G4iLsYXN+7J1c/e
 yE3yglUAbn/6cWuGXp5DErf9OJ+oklbpVbl3Li+L6jR3ZFj4DSKs/Tz5bvIzps5qM/00
 jd8g==
X-Gm-Message-State: AOAM5326OhxEMu+jBgs5IkqD5DAvWmy51JtT0iakogkF5BbG8Wmf6CW7
 jGXnSqSswCUPoeJjQ8baaMMGPem5RhpCN/lEmOQyeQsLGCnuPBlndRcBlZqtWRn3m1Wbh3mrIl1
 JrB7iSMNtSzrkwkkW7RVlkz0IBPIhPKI=
X-Received: by 2002:a17:90a:d515:: with SMTP id
 t21mr22297742pju.123.1636031731772; 
 Thu, 04 Nov 2021 06:15:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgvlD4OTDwYqwcXmAi5NUO1flMfvydKggTHaGcqYbTlzVomCHamjHEDcsETqqk8j4GAnX3hkWnYEKB9s5tqyk=
X-Received: by 2002:a17:90a:d515:: with SMTP id
 t21mr22297695pju.123.1636031731444; 
 Thu, 04 Nov 2021 06:15:31 -0700 (PDT)
MIME-Version: 1.0
References: <20211103211404.79953-1-willianr@redhat.com>
 <20211103211404.79953-2-willianr@redhat.com>
 <3f261dc1-aa3c-affe-1d56-1e41e2ccf6fa@redhat.com>
In-Reply-To: <3f261dc1-aa3c-affe-1d56-1e41e2ccf6fa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Thu, 4 Nov 2021 10:15:05 -0300
Message-ID: <CAKJDGDaZjZSJpxeHMOJw6iKfChuSNnZyfJfg+DcoXAKRWCZkFw@mail.gmail.com>
Subject: Re: [PATCH 1/1] tests/acceptance: rename tests acceptance to tests
 avocado
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Michael Rolnik <mrolnik@gmail.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 4, 2021 at 9:50 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> On 11/3/21 22:14, Willian Rampazzo wrote:
> > In the discussion about renaming the `tests/acceptance` [1], the
> > conclusion was that the folders inside `tests` are related to the
> > framework running the tests and not directly related to the type of
> > the tests.
> >
> > This changes the folder to `tests/avocado` and adjusts the MAKEFILE, th=
e
> > CI related files and the documentation.
> >
> > [1] https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg06553.html
> >
> > Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> > ---
> >  64 files changed, 113 insertions(+), 118 deletions(-)
>
> > --- a/tests/Makefile.include
> > +++ b/tests/Makefile.include
>
> > -.PHONY: check-venv check-acceptance
> > +.PHONY: check-venv check-avocado
>
> > -check-acceptance: check-venv $(TESTS_RESULTS_DIR) get-vm-images
> > +check-avocado: check-venv $(TESTS_RESULTS_DIR) get-vm-images
> >       $(call quiet-command, \
> >              $(TESTS_VENV_DIR)/bin/python -m avocado \
> >              --show=3D$(AVOCADO_SHOW) run --job-results-dir=3D$(TESTS_R=
ESULTS_DIR) \
>
> We should keep check-acceptance, eventually printing a deprecation
> message. Smth like:
>
>   check-acceptance: check-avocado a
>       @echo "Note 'make $@' is deprecated, use 'make $<' instead" >&2
>

I agree.

> > --- a/tests/acceptance/ppc_prep_40p.py
> > +++ b/tests/avocado/ppc_prep_40p.py
> > @@ -13,6 +13,10 @@
> >
> >
> >  class IbmPrep40pMachine(Test):
> > +    """
> > +    :avocado: tags=3Darch:ppc
> > +    :avocado: tags=3Dmachine:40p
> > +    """
> >
> >      timeout =3D 60
> >
> > @@ -24,8 +28,6 @@ class IbmPrep40pMachine(Test):
> >      @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted =
code')
> >      def test_factory_firmware_and_netbsd(self):
> >          """
> > -        :avocado: tags=3Darch:ppc
> > -        :avocado: tags=3Dmachine:40p
> >          :avocado: tags=3Dos:netbsd
> >          :avocado: tags=3Dslowness:high
> >          """
> > @@ -48,10 +50,6 @@ def test_factory_firmware_and_netbsd(self):
> >          wait_for_console_pattern(self, 'Model: IBM PPS Model 6015')
> >
> >      def test_openbios_192m(self):
> > -        """
> > -        :avocado: tags=3Darch:ppc
> > -        :avocado: tags=3Dmachine:40p
> > -        """
> >          self.vm.set_console()
> >          self.vm.add_args('-m', '192') # test fw_cfg
> >
> > @@ -62,8 +60,6 @@ def test_openbios_192m(self):
> >
> >      def test_openbios_and_netbsd(self):
> >          """
> > -        :avocado: tags=3Darch:ppc
> > -        :avocado: tags=3Dmachine:40p
> >          :avocado: tags=3Dos:netbsd
> >          """
> >          drive_url =3D ('https://archive.netbsd.org/pub/NetBSD-archive/=
'
>
> Unrelated change, otherwise:

Ouch, looks like I took one of my test changes. I'll wait for some
more comments and remove this change on a v2.

>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>

Thanks!


