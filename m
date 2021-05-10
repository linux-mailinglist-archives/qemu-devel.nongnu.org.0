Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 924DE3797D1
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 21:40:48 +0200 (CEST)
Received: from localhost ([::1]:33262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgBln-0006LG-M7
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 15:40:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgBk0-0005Kw-Rd
 for qemu-devel@nongnu.org; Mon, 10 May 2021 15:38:56 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:45651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgBju-0004oS-Rp
 for qemu-devel@nongnu.org; Mon, 10 May 2021 15:38:53 -0400
Received: by mail-ed1-x52e.google.com with SMTP id s7so15406470edq.12
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 12:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MpLfVT1Eovb727ZrYKvMaxlw90H+YnhTbdd9um9EEGY=;
 b=MKccqMsE66J3aX6GXf4AgVUfXxkJvWfsZAgVnPbl9HBw2g5e74grBgksXvA6X4zXIS
 YQfqToAdPwm/6gAE+eqS1PNEgs3pvxIri6YewjM6aNP1+lKi+f7Ya+J3wDyjZSql9oTE
 ytxAjIbziEFxc+YpkcU7XcxyCndg+OrOBh1mEFqdg6gMwTVnN25FqlJS/lAJJslDCl9q
 4Y767rjF0nJzbLM79OzdV7DfO8AWE2+dq5aQF0NBoWsKF+5IbgWMwuFZYv5/7QImId2N
 bE9j6IGG+WqHEiBASUb64aaxo5Nrbr6dKbRLCHLO4MiqmgDvggxmsST90KKIn4Tq3p7e
 dxhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MpLfVT1Eovb727ZrYKvMaxlw90H+YnhTbdd9um9EEGY=;
 b=Gr+MW5Gd3F2oK6B5m0f+GPCOoxMRs3Je50G2xEWAhRvHp/1xvQ61P2xpoGrkyk0DGP
 ZhccW42DUceylyLHI2TLhJqkrh/kPyjHf4znYgmNxWdL7b2i8r/IRY1t4lCntDj5tdbs
 X1V+jGq4eSBYGvFII2qVlwB8bPbs28o6T5Gs9Am3avh76uNq5ojptcOWAbmWoYUp+0y1
 yOpBF+fYcqcHOc2OPU+Zy+rf8cpXo5prHkwhSM1OXsObr/pHUZbb0gBWpr2Temqtnmis
 yWPIdvt3FNZv9PANMjHw+T7zlOfvshoeDhfkE+nZOa0PoOpCWSwaJdoILyp5me4MNC8V
 G2+Q==
X-Gm-Message-State: AOAM532C1UK28t6ROI1WKjrjaQFeXa9OACUX+AY/KU1ikgHbiYZttMBy
 tgwqAt1WogN8tpM8pWM3Dy0=
X-Google-Smtp-Source: ABdhPJwfqBzWUKewOTEsPxrE3XCmRXFdCT1ddvlSt8LDElZlcvs+oLCPTeUXyv7Bx0+lbMyh3N+VNw==
X-Received: by 2002:aa7:cd0c:: with SMTP id b12mr31145887edw.236.1620675529008; 
 Mon, 10 May 2021 12:38:49 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id v26sm10265386ejk.66.2021.05.10.12.38.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 May 2021 12:38:48 -0700 (PDT)
Subject: Re: [PATCH 3/4] gitlab-ci: Run GNU make via the $MAKE variable
To: qemu-devel@nongnu.org
References: <20210510152254.2543047-1-f4bug@amsat.org>
 <20210510152254.2543047-4-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3c682d11-35f8-39e2-54dc-3743e5c0b62c@amsat.org>
Date: Mon, 10 May 2021 21:38:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210510152254.2543047-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/10/21 5:22 PM, Philippe Mathieu-Daudé wrote:
> Add the $MAKE variable to call GNU make, and set it to 'gmake'
> on FreeBSD to avoid:
> 
>   $ make -j"$JOBS"
>   make: Unknown modifier ','
>   make: "/builds/dTyar424/0/qemu/build/Makefile" line 3: Need an operator
>   make: "/builds/dTyar424/0/qemu/build/Makefile" line 4: Missing dependency operator
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  .gitlab-ci.yml | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index aceaac5a398..a33e51bf453 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -19,9 +19,11 @@ include:
>          test $(uname) = "FreeBSD"
>          ;
>        then
> +        MAKE=gmake
>          JOBS=$(sysctl -n hw.ncpu)
>          ;
>        else
> +        MAKE=make
>          JOBS=$(expr $(nproc) + 1)
>          ;
>        fi
> @@ -44,22 +46,23 @@ include:
>        then
>          meson configure . -Dbackend_max_links="$LD_JOBS" ;
>        fi || exit 1;
> -    - make -j"$JOBS"
> +    - $MAKE -j"$JOBS"
>      - if test -n "$MAKE_CHECK_ARGS";
>        then
> -        make -j"$JOBS" $MAKE_CHECK_ARGS ;
> +        $MAKE -j"$JOBS" $MAKE_CHECK_ARGS ;
>        fi
>  
>  .native_test_job_template:
>    stage: test
>    image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
> +  extends: .environment_variables_template
>    script:
>      - scripts/git-submodule.sh update
>          $(sed -n '/GIT_SUBMODULES=/ s/.*=// p' build/config-host.mak)
>      - cd build
>      - find . -type f -exec touch {} +
>      # Avoid recompiling by hiding ninja with NINJA=":"
> -    - make NINJA=":" $MAKE_CHECK_ARGS
> +    - $MAKE NINJA=":" $MAKE_CHECK_ARGS
>  
>  .acceptance_template: &acceptance_definition
>    cache:

I forgot this hunk:

-- >8 --
@@ -70,6 +70,7 @@ include:
     - $MAKE NINJA=":" $MAKE_CHECK_ARGS

 .acceptance_template: &acceptance_definition
+  extends: .environment_variables_template
   cache:
     key: "${CI_JOB_NAME}-cache"
     paths:
---

> @@ -833,17 +836,18 @@ build-tools-and-docs-debian:
>  pages:
>    image: $CI_REGISTRY_IMAGE/qemu/debian-amd64:latest
>    stage: test
> +  extends: .environment_variables_template
>    needs:
>      - job: build-tools-and-docs-debian
>    script:
>      - mkdir -p public
>      # HTML-ised source tree
> -    - make gtags
> +    - $MAKE gtags
>      - htags -anT --tree-view=filetree -m qemu_init
>          -t "Welcome to the QEMU sourcecode"
>      - mv HTML public/src
>      # Project documentation
> -    - make -C build install DESTDIR=$(pwd)/temp-install
> +    - $MAKE -C build install DESTDIR=$(pwd)/temp-install
>      - mv temp-install/usr/local/share/doc/qemu/* public/
>    artifacts:
>      paths:
> 

