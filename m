Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F421424645
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 20:50:04 +0200 (CEST)
Received: from localhost ([::1]:53100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYBzP-0002RN-8d
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 14:50:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mYBxK-00011G-W0
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 14:47:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mYBxH-0003XI-Vo
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 14:47:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633546071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qGk7CiIi+oCoyHRQuOh6RZOgSn59Mj3AS3gC9olKMIs=;
 b=YWT0Du9nT8XRctH8VgAht+HQqDg637LPPcIL35NriJQldBfh8dGq2PSh8J1eH8UMdVuukI
 nTEjEaWwaqyPJO79CxU2pzJjPH8sfgZ6khqEu7o16+/O2JWVKVHXjFkBLbwGQp0+JPNtKj
 qt+rCUcPkXRD1bgdTwunfaLkEJMhmuU=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-KqTjt82wOsmu6Ex42_tF9Q-1; Wed, 06 Oct 2021 14:47:50 -0400
X-MC-Unique: KqTjt82wOsmu6Ex42_tF9Q-1
Received: by mail-pg1-f199.google.com with SMTP id
 b5-20020a6541c5000000b002661347cfbcso2072335pgq.1
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 11:47:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qGk7CiIi+oCoyHRQuOh6RZOgSn59Mj3AS3gC9olKMIs=;
 b=iETHzvFGyrc7pjPqib8suPDAMDzo9Ji32GIYgx+lDLP3PWL8P2PAs65Y5vJwaKRabf
 w6K4emGa5LhhvnXGA9RLFTj2f3u0i1z2680MA6HrB49RNfoKTEpYJ/2UVxSqVssvu99z
 R6sGt9YxoHtWFrtaMW2+xV3ckfw5Laqd/5sQH5FETCojYeXYwWTJPjTV7nWu2CkrAQKT
 Aae1HH3hAoo46a+Ne/21zpDUksuBxx5+spcX4i18xwMhoh59CvW8qbN0OVuZ8xEEHzwN
 M+KtWsa/XYj2ouUGTwRitBBKUk7ZlIq4j3J82IVi2Y4sK3Ajln7wjnZeOj5MsO84bvah
 xLUQ==
X-Gm-Message-State: AOAM533ZVdLYNOs+Ii+G4mBckaijBqVMPoPQHaiSu9pMm1oKghV4suIz
 cF72fEJXD2ovCtmxnyzH56PKVgLu+ZzyaxVX3v/cPcZUODH/wc2iw0opxxGM5OHz8pZT/qS/FbJ
 V/ZYDutw5NFfMlDKZN0OeZdZbvqNf9+4=
X-Received: by 2002:a17:90b:4c86:: with SMTP id
 my6mr238045pjb.203.1633546068819; 
 Wed, 06 Oct 2021 11:47:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnuxMkL02mmSm+dd5EolT9zBFvUx8rsL5fcD+eh/EP9YFTRxdc8kUdq2LZGYEDSHxq/oWe/VIdhCyKdDa7X+M=
X-Received: by 2002:a17:90b:4c86:: with SMTP id
 my6mr238004pjb.203.1633546068510; 
 Wed, 06 Oct 2021 11:47:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210924185506.2542588-1-crosa@redhat.com>
 <20210924185506.2542588-4-crosa@redhat.com>
In-Reply-To: <20210924185506.2542588-4-crosa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 6 Oct 2021 15:47:22 -0300
Message-ID: <CAKJDGDZOVo+RhaD80ZEiNW3Y7=94CWQNd_qHqTkyfP6hYaj93A@mail.gmail.com>
Subject: Re: [PATCH 03/16] Acceptance Tests: add mechanism for listing tests
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) DKIMWL_WL_HIGH=-0.05, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Greg Kurz <groug@kaod.org>,
 Auger Eric <eric.auger@redhat.com>, Kamil Rytarowski <kamil@netbsd.org>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Ryo ONODERA <ryoon@netbsd.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 24, 2021 at 3:57 PM Cleber Rosa <crosa@redhat.com> wrote:
>
> It is helpful to know the tests that would be executed with a "make
> check-acceptance" without executing them.  Let's introduce a "make
> list-acceptance" rule for that purpose.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/Makefile.include | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index 2c03256ae8..d1f90572a7 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -17,6 +17,7 @@ ifneq ($(filter $(all-check-targets), check-softfloat),)
>         @echo " $(MAKE) check-softfloat      Run FPU emulation tests"
>  endif
>         @echo " $(MAKE) check-acceptance     Run acceptance (functional) tests for currently configured targets"
> +       @echo " $(MAKE) check-acceptance     List acceptance (functional) tests for currently configured targets"

s/check-acceptance/list-acceptance/

>         @echo
>         @echo " $(MAKE) check-report.tap     Generates an aggregated TAP test report"
>         @echo " $(MAKE) check-venv           Creates a Python venv for tests"
> @@ -135,6 +136,13 @@ check-acceptance: check-venv $(TESTS_RESULTS_DIR) get-vm-images
>              $(if $(GITLAB_CI),,--failfast) tests/acceptance, \
>              "AVOCADO", "tests/acceptance")
>
> +list-acceptance: check-venv
> +       $(call quiet-command, \
> +            $(TESTS_VENV_DIR)/bin/python -m avocado list \
> +            --filter-by-tags-include-empty --filter-by-tags-include-empty-key \
> +            $(AVOCADO_TAGS) tests/acceptance, \

It would be interesting to adjust the command to use the
$(AVOCADO_CMDLINE_TAGS) and allow users to restrict the tests listed
by its tags.

> +            "AVOCADO", "list tests/acceptance")
> +
>  # Consolidated targets
>
>  .PHONY: check-block check check-clean get-vm-images
> --
> 2.31.1
>


