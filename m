Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 389EF41505F
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 21:12:40 +0200 (CEST)
Received: from localhost ([::1]:34114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT7fb-0000Ky-26
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 15:12:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mT74Z-0001XG-ML
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 14:34:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mT74V-0001si-R9
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 14:34:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632335658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YyV9imeJVAa6YznlgQqaTiSDDL9YhSR9BBmvHXWBy8o=;
 b=XqiQLhBlTp9hLFfS8/YjHMXGPGNSXFqvhNs3y5GKkU//qxRspYhltMpXyOYCo4XMC+2F0d
 eQSrOdY+joRLYxStKsnTAVL2npybbRMVgjwuJh6s45ugvyoetIf/Dgj4nsa3vs9FsKLTv9
 vl1atcQGSNSyZrsmNKyf1AgiZ850ggQ=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-JICIiu_CO8extHIZmNBTdQ-1; Wed, 22 Sep 2021 14:34:15 -0400
X-MC-Unique: JICIiu_CO8extHIZmNBTdQ-1
Received: by mail-vk1-f197.google.com with SMTP id
 bi54-20020a05612218b600b0029578be32dfso427225vkb.18
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 11:34:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=YyV9imeJVAa6YznlgQqaTiSDDL9YhSR9BBmvHXWBy8o=;
 b=CRRWmsaLdx9hH7uvjMXJ09CclxgSh5juMUC9JdDYLc4i+jgbP0jLIPdpZHaA82Rj1Q
 OyByejXBEe6ii8CV6NskMfPPR8xwcdMAef+7ryIKbXmgJ6hWiw3lgoNnKAylPMm5QUS9
 qZOSAcI+2JPp5SyV+0kiNBZpS58VltrVCqwXTyAkTgO48G9SSSVUZHVs3Jl8bWL6n5Kg
 XMkURLkMhPv+sJDUs3rXvPQtykWO1P0raPC3i60Iyhlb3HUgW2r52qYIOsdvM0rsspiA
 GMiUD7l2g/avk9idwZDw2Ax4RdUkR62E3uriLITLIKqeccZp+fUma0cth1GBhCO+9wQY
 FAbA==
X-Gm-Message-State: AOAM533KKOhFbm0QwmHoFJf39qeXvy+Diz7qj2n8X6gjU2PyuoL0xIkz
 WNBgHzcX4dsg0ifTS0HsetxSbaaICEk/7rIMbeQJBQw3o/laosKkEo5X3cvZ/A7cadd/2fuXvzV
 q7r62b61Y3KU7LhN/3NkuARYyyP90HAo=
X-Received: by 2002:a67:2201:: with SMTP id i1mr736801vsi.9.1632335654473;
 Wed, 22 Sep 2021 11:34:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvNTHoIVdQd8pt131h8xG0TiaJ9GXs94GSBmBEmOSvGnKKv3pKDZjTIGbZd+MyEXoTLt0XvP1kjBJMCcjrRfQ=
X-Received: by 2002:a67:2201:: with SMTP id i1mr736769vsi.9.1632335654055;
 Wed, 22 Sep 2021 11:34:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210713210111.173349-1-willianr@redhat.com>
In-Reply-To: <20210713210111.173349-1-willianr@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 22 Sep 2021 15:33:46 -0300
Message-ID: <CAKJDGDZZyEMqjYycD8+raCp2RJn+ymqMWgWsxy-pHoRc5cu9AA@mail.gmail.com>
Subject: Re: [PATCH v3] tests/acceptance: allow control over tags during
 check-acceptance
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Philippe Mathieu Daude <philmd@redhat.com>,
 Cleber Rosa Junior <crosa@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-devel <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>, 
 Wainer Moschetta <wainersm@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping? Any good soul to send a pull request?

On Tue, Jul 13, 2021 at 6:03 PM Willian Rampazzo <willianr@redhat.com> wrote:
>
> Although it is possible to run a specific test using the avocado
> command-line, a user may want to use a specific tag while running the
> ``make check-acceptance`` during the development or debugging.
>
> This allows using the AVOCADO_TAGS environment variable where the user
> takes total control of which tests should run based on the tags defined.
>
> This also makes the check-acceptance command flexible to restrict tests
> based on tags while running on CI.
>
> e.g.:
>
> AVOCADO_TAGS="foo bar baz" make check-acceptance
>
> Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> Tested-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> ---
>  docs/devel/testing.rst | 14 ++++++++++++++
>  tests/Makefile.include | 12 +++++++++---
>  2 files changed, 23 insertions(+), 3 deletions(-)
>
> diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
> index 4e42392810..a81b44cf18 100644
> --- a/docs/devel/testing.rst
> +++ b/docs/devel/testing.rst
> @@ -760,6 +760,20 @@ in the current directory, tagged as "quick", run:
>
>    avocado run -t quick .
>
> +It is also possible to run tests based on tags using the
> +``make check-acceptance`` command and the ``AVOCADO_TAGS`` environment
> +variable:
> +
> +.. code::
> +
> +   AVOCADO_TAGS=quick make check-acceptance
> +
> +Note that tags separated with commas have an AND behavior, while tags
> +separated by spaces have an OR behavior. For more information on Avocado
> +tags, see:
> +
> + https://avocado-framework.readthedocs.io/en/latest/guides/user/chapters/tags.html
> +
>  The ``avocado_qemu.Test`` base test class
>  -----------------------------------------
>
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index e4dcb17329..0ce331f9a9 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -92,7 +92,12 @@ TESTS_RESULTS_DIR=$(BUILD_DIR)/tests/results
>  # Any number of command separated loggers are accepted.  For more
>  # information please refer to "avocado --help".
>  AVOCADO_SHOW=app
> -AVOCADO_TAGS=$(patsubst %-softmmu,-t arch:%, $(filter %-softmmu,$(TARGETS)))
> +ifndef AVOCADO_TAGS
> +       AVOCADO_CMDLINE_TAGS=$(patsubst %-softmmu,-t arch:%, \
> +                                                $(filter %-softmmu,$(TARGETS)))
> +else
> +       AVOCADO_CMDLINE_TAGS=$(addprefix -t , $(AVOCADO_TAGS))
> +endif
>
>  $(TESTS_VENV_DIR): $(TESTS_VENV_REQ)
>         $(call quiet-command, \
> @@ -128,8 +133,9 @@ check-acceptance: check-venv $(TESTS_RESULTS_DIR) get-vm-images
>         $(call quiet-command, \
>              $(TESTS_VENV_DIR)/bin/python -m avocado \
>              --show=$(AVOCADO_SHOW) run --job-results-dir=$(TESTS_RESULTS_DIR) \
> -            --filter-by-tags-include-empty --filter-by-tags-include-empty-key \
> -            $(AVOCADO_TAGS) \
> +            $(if $(AVOCADO_TAGS),, --filter-by-tags-include-empty \
> +                       --filter-by-tags-include-empty-key) \
> +            $(AVOCADO_CMDLINE_TAGS) \
>              $(if $(GITLAB_CI),,--failfast) tests/acceptance, \
>              "AVOCADO", "tests/acceptance")
>
> --
> 2.31.1
>
>


