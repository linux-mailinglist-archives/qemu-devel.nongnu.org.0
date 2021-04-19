Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35004364812
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 18:17:52 +0200 (CEST)
Received: from localhost ([::1]:59860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYWat-0007BI-95
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 12:17:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYWXI-0003wB-30
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 12:14:09 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:40607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYWXG-0005XQ-2g
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 12:14:07 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so20901771wmy.5
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 09:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=12LmPriBvOcXs90wTLoRP99dZARgYPll9S/WflKhgsU=;
 b=NFytt203wuZ52s4dt/ADdBWsQ/cP2lFschsOhQzIgq2K4+3VUl4I9qQDvVG8R+FkIq
 xez/l2z+APKK+ZjdRQfwJyawXjiWnX1gsMdV3XJR0bPivltXwuXYdsH8QvjsUGI7trjM
 /BgxYi6k0fuCEPas2oG9NfshaAdaD45dsoZ/Qiozc0FGxUc+0KtP2stpa5NHqd8kG4Ud
 kdfArHHJXc4Xuhpg2A+XuqjpeJc3pOdZUuuBeXGwUzYgOCDRsgSiEGgcVyzpDhNtI6X3
 yXOMjEMwqEiEesiVzlAxZAdJnHqGaC/hlzqs1eZ0iN3Lb/WOYn1gJ3jBI2dhWO6M19iy
 wTCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=12LmPriBvOcXs90wTLoRP99dZARgYPll9S/WflKhgsU=;
 b=YdCt9kri83vVQIpZFAdtsLkIpkNXiXIy/dTJMxoeJHkhVzZisnJzgXyA3MdKbG0CWW
 pThqKmeQJhReq3zP15KLnVuJpo3CViGVphVrn//SLclKyYx7xjHd2oR2XmMLJivcmiN4
 a7OSRHJ3FFJkmp1W2UsDeY7ZxQJ7oCpRZTN1YSyFvelBRZteUEewERJVAnG3IthJm0C7
 ucMevquTDxU1E9aUifCc5s/HmUcNnRWKQoa/MOLdBL5x14Ak9pmaU3w7pNodzHCfVjzN
 JcpWiR54XV8BR5/3Kmga9oFntO2U8W1go0DEgl3/efcjQaex7rK3tg7VEFbQ9KJOMiCJ
 uq4w==
X-Gm-Message-State: AOAM5305nWzBOk7uJu2awRU0kG9zCD03yCIcr3KlgtufxC8FDB7v04JA
 r3d8s8iQQYK7PFrQT4o7UBxhkQ==
X-Google-Smtp-Source: ABdhPJxUbueLSS2mTnpg8uCOrGKag6zyjVGWry1GZMsMo+WBvzsFp1tUXxIyXkhj0bC6opnDz4aNzw==
X-Received: by 2002:a1c:7e45:: with SMTP id z66mr21963812wmc.126.1618848844001; 
 Mon, 19 Apr 2021 09:14:04 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p3sm7302324wmq.31.2021.04.19.09.14.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 09:14:03 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B0EAD1FF7E;
 Mon, 19 Apr 2021 17:14:02 +0100 (BST)
References: <20210418233448.1267991-1-f4bug@amsat.org>
 <20210418233448.1267991-15-f4bug@amsat.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH 14/15] gitlab-ci: Allow forks to use different set
 of jobs
Date: Mon, 19 Apr 2021 16:57:55 +0100
In-reply-to: <20210418233448.1267991-15-f4bug@amsat.org>
Message-ID: <877dky9rqt.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Erik Skultety <eskultet@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Forks run the same jobs than mainstream, which might be overkill.
> Allow them to easily rebase their custom set, while keeping using
> the mainstream templates, and ability to pick specific jobs from
> the mainstream set.
>
> To switch to your set, simply add your .gitlab-ci.yml as
> .gitlab-ci.d/${CI_PROJECT_NAMESPACE}.yml (where CI_PROJECT_NAMESPACE
> is your gitlab 'namespace', usually username). This file will be
> used instead of the default mainstream set.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  .gitlab-ci.yml | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 718c8e004be..35fd35075db 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -9,7 +9,12 @@ generate-config:
>      paths:
>        - generated-config.yml
>    script:
> -    - cp .gitlab-ci.d/qemu-project.yml generated-config.yml
> +    - if test -e .gitlab-ci.d/${CI_PROJECT_NAMESPACE}.yml ;
> +      then
> +        cp .gitlab-ci.d/${CI_PROJECT_NAMESPACE}.yml generated-config.yml=
 ;
> +      else
> +        cp .gitlab-ci.d/qemu-project.yml generated-config.yml ;
> +      fi

This is going to be a little clunky. I can see a use for the static
forks that Danial proposes but I guess what is needed is a little
expressiveness. So how to express things like:

 - I've only touched stuff in linux-user, so run only linux-user tests

 - I'm working on KVM, run all KVM enabled builds and tests

 - I've changed the core TCG code, run everything that exercises that

 - I'm working on ARM, only build and run jobs that have ARM targets

This sounds like tags I guess but the documentation indicates they are
used for runner selection. Could we come up with a subset that could be
used to select from all our build fragments when constructing the
generated-config? I could even imagine a script analysing a diffstat and
guessing the tags based on that.

I think we should define a minimum set of lightweight smoke tests that
get the most bang for buck for catching sillies. I think checkpatch and
dco checking should probably be in there - and maybe one of the bog
standard build everything builds (maybe a random ../configure; make;
make check on one of the supported LTS targets).

Then there is the question of defaults. Should we default to a minimised
set unless asked or should the default be the full fat run everything?
We could I guess only switch to running everything for the staging
branch and anything that is associated with a tag or a branch that has
pull in the name?

>=20=20
>  generate-pipeline:
>    stage: test


--=20
Alex Benn=C3=A9e

