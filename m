Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF832EF5F2
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 17:45:48 +0100 (CET)
Received: from localhost ([::1]:40772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxutW-0002Mr-Ks
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 11:45:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kxur5-0001JB-5g
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 11:43:15 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:37731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kxuqv-0002YT-UY
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 11:43:14 -0500
Received: by mail-wr1-x431.google.com with SMTP id i9so9639806wrc.4
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 08:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=23ITMa9qYF8J1hqdv86eK/WSJnJeHcMqTX9V1jd9Oyg=;
 b=xW5DmjxFxeqGjV+HfIqYv4m0tnd4iJzD8rSLnkXYpXhlyIPdr6gOyNUzn8NUBKk+gZ
 8znHBM3TdVN4SP8RwmBBEkbu6yiXZu/EGXdD6lPB+MMq33714LEX0xG0km6fdy83MEaM
 69bgOHFZs/jTqjVgrnw/pZtZIhoURqE0x6NPQengM0ByVQwUPwk1eyfg/YVh6lTus+58
 5De5F3gw+qiYAsdcq76SSly0sdSTu0pk8XuDzsu8s4TFxp5hFXM6O/nmfrMQHjlb3+ok
 q3093+yV+1TcNzNZkOTPJLJdOmT1YXr3wCHs8toI++M5acBqTCgRDez9aG8R7rVG62fk
 jtCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=23ITMa9qYF8J1hqdv86eK/WSJnJeHcMqTX9V1jd9Oyg=;
 b=hQceyzC2zOWyhxKJLnouLnRrVKhBjbshAIjdSbOhO6r929PH8r2xmi8Xu/7+AFxgn9
 mQH2tqEtDYva/h9tnaeYjz8NEBgvk+xmdIbs3TmDBnya9Q72KBYGywYMZyN8WuNXiYHL
 eTUEXngm4pupap4OR0r+H80wjEJP4W9JqBTtH5j+vgOVG/rNWzLMFrIzQ7N+VPH3z2go
 uu7zj5wYW5YS/rHlOKF+aktDgz6kcrEv6on7AMEOBiyc4Y7ClbVfwPQgiTYXqSPBiz+f
 d8oynvh81oyABGpdPJxn3W9Scqlod8ju4Y2n0/alMO7OCn/f9oNzS2iH3vfBOj5DJ6vP
 MMiQ==
X-Gm-Message-State: AOAM530ZUwZUFNa7QYT54301/9smy/f2v3OrhN9ppoG2VbcRC1LaEEw/
 zCLwZ5bHGY23CQRXR7gVTuA4uQ==
X-Google-Smtp-Source: ABdhPJyaFXSjnK5FnwBm5rloeqn49gzjEZC6M8OptQF/5s36h7mgm0kmsfPKmhLCz9RvHhDPM3K4LQ==
X-Received: by 2002:a05:6000:1082:: with SMTP id
 y2mr4405807wrw.233.1610124184209; 
 Fri, 08 Jan 2021 08:43:04 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q15sm13400110wrw.75.2021.01.08.08.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 08:43:02 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3B3F21FF7E;
 Fri,  8 Jan 2021 16:43:02 +0000 (GMT)
References: <20210108145103.269353-1-f4bug@amsat.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH] shippable.yml: Remove jobs duplicated on Gitlab-CI
Date: Fri, 08 Jan 2021 16:42:57 +0000
In-reply-to: <20210108145103.269353-1-f4bug@amsat.org>
Message-ID: <8735zb1isp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Danie?= =?utf-8?Q?l_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> The following jobs are duplicated on Gitlab-CI since commit
> 6bcb5fc0f7a ("gitlab-ci: Add cross-compiling build tests"):
>
> - IMAGE=3Ddebian-armel-cross
>
>   TARGET_LIST=3Darm-softmmu               -> cross-armel-system
>   TARGET_LIST=3Darm-linux-user            -> cross-armel-user
>   TARGET_LIST=3Darmeb-linux-user          -> cross-armel-user
>
> - IMAGE=3Ddebian-armhf-cross
>
>   TARGET_LIST=3Darm-softmmu               -> cross-armhf-system
>   TARGET_LIST=3Darm-linux-user            -> cross-armhf-user
>   TARGET_LIST=3Darmeb-linux-user          -> cross-armhf-user
>
> - IMAGE=3Ddebian-arm64-cross
>
>   TARGET_LIST=3Daarch64-softmmu           -> cross-arm64-system
>   TARGET_LIST=3Daarch64-linux-user        -> cross-arm64-user
>
> - IMAGE=3Ddebian-s390x-cross
>
>   TARGET_LIST=3Ds390x-softmmu             -> cross-s390x-system
>   TARGET_LIST=3Ds390x-linux-user          -> cross-s390x-user
>
> - IMAGE=3Ddebian-mips-cross
>
>   TARGET_LIST=3Dmipsel-linux-user         -> cross-mips-user
>
> - IMAGE=3Ddebian-mips64el-cross
>
>   TARGET_LIST=3Dmips64el-softmmu          -> cross-mips64el-system
>   TARGET_LIST=3Dmips64el-linux-user       -> cross-mips64el-user
>
> - IMAGE=3Ddebian-ppc64el-cross
>
>   TARGET_LIST=3Dppc64-softmmu             -> cross-ppc64el-system
>   TARGET_LIST=3Dppc64-linux-user          -> cross-ppc64el-user
>   TARGET_LIST=3Dppc64abi32-linux-user     -> cross-ppc64el-user
>
> Remove them from Shippable CI.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  .shippable.yml | 14 +-------------
>  1 file changed, 1 insertion(+), 13 deletions(-)
>
> diff --git a/.shippable.yml b/.shippable.yml
> index 14350e6de8a..97bfa2a0f38 100644
> --- a/.shippable.yml
> +++ b/.shippable.yml
> @@ -7,20 +7,8 @@ env:
>    matrix:
>      - IMAGE=3Ddebian-amd64
>        TARGET_LIST=3Dx86_64-softmmu,x86_64-linux-user
> -    - IMAGE=3Ddebian-armel-cross
> -      TARGET_LIST=3Darm-softmmu,arm-linux-user,armeb-linux-user
> -    - IMAGE=3Ddebian-armhf-cross
> -      TARGET_LIST=3Darm-softmmu,arm-linux-user,armeb-linux-user
> -    - IMAGE=3Ddebian-arm64-cross
> -      TARGET_LIST=3Daarch64-softmmu,aarch64-linux-user
> -    - IMAGE=3Ddebian-s390x-cross
> -      TARGET_LIST=3Ds390x-softmmu,s390x-linux-user
>      - IMAGE=3Ddebian-mips-cross
> -      TARGET_LIST=3Dmips-softmmu,mipsel-linux-user
> -    - IMAGE=3Ddebian-mips64el-cross
> -      TARGET_LIST=3Dmips64el-softmmu,mips64el-linux-user
> -    - IMAGE=3Ddebian-ppc64el-cross
> -      TARGET_LIST=3Dppc64-softmmu,ppc64-linux-user,ppc64abi32-linux-user
> +      TARGET_LIST=3Dmips-softmmu
>  build:
>    pre_ci_boot:
>      image_name: registry.gitlab.com/qemu-project/qemu/qemu/${IMAGE}

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

