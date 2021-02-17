Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A87031D92B
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 13:09:15 +0100 (CET)
Received: from localhost ([::1]:57694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCLdq-0006g7-D5
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 07:09:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCLcU-0006Ft-Jm
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 07:07:50 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:32779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCLcS-0005QQ-Bw
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 07:07:50 -0500
Received: by mail-wr1-x42a.google.com with SMTP id 7so17212328wrz.0
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 04:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=DeoUqEuTnDFMqUKUEsLfGfQ4p/G3qMndAMsJ6CCR248=;
 b=bnH++70huQFscYWfMTGDiorDAQhhEd7YWgQ+RwX3X9fk94gyPTjSXp2VMNIHBGm43y
 FAYWBFcldkT3ojfaqAUtzdrMia2QG6P1NGw/KkzG+7IJlWG3jv1B0ge7g8hO5Ya7hiLL
 LiGLXsGCx+8GcrA/TtzSHIHULLq1rUzXrkEdnZQcl2xgl+yHwn+AKdUzdVf8VuSFVyWU
 t3cqof6IRnN5AX1YmtgWstFbHdZOIlaqtnNt2bSHDOmrs9c3c0zbsel/606HvsxsOe7g
 MoqTrmUS5lDgI38qlP5owx+MAPHoX1dHmLsqHTsskTPOaqAzR13E4F98Xu78iUbxLJJi
 sZpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=DeoUqEuTnDFMqUKUEsLfGfQ4p/G3qMndAMsJ6CCR248=;
 b=YMCBZLICuktthn+epsswp/ENR1fkHMw1rbwhT+k30zLenRj+HuRiJI/XqxvciyYXoB
 uH64FQztq1On5JtzC/0oUGypGJi1vQg2DBwgBIkRghAdwfIIvze/oZtWS8s91jqyF2aC
 dAZCklCe79MdQO81eCoOt8DnfCIZwUM8mcIQHU5IeG3JerXoe/t9G3sVg6FMWpYXNEEW
 ZRJaiBduGYqtta/0F6w6+sejV7kxuYMKOb3clT7AUGJFrGYzIWkZc2fq85g/Bx/q8xu6
 EG+pDld0lvJ/EjTDztKVszsIMcGtSlDkmOo9xpLnIIv6xQKZluUBakKgrStPlNLYlywD
 7neA==
X-Gm-Message-State: AOAM532GS2X614IQqKMolFs6TVzoO8K1rmFy3cSl1EM7mdcZ2OXCq/aL
 dtQGrhs2pPE+KBvnjp/9HJ8V7IMjTBYkww==
X-Google-Smtp-Source: ABdhPJzIO/LFeqbrlZyq+PVfPKPFGJzVF8fviRSqfE9RWbc2fxgapQYeAuv1Zxjezg6RsdyZOffQQw==
X-Received: by 2002:adf:ec89:: with SMTP id z9mr28753416wrn.410.1613563665609; 
 Wed, 17 Feb 2021 04:07:45 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 101sm4259990wrk.4.2021.02.17.04.07.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 04:07:44 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B7B7A1FF7E;
 Wed, 17 Feb 2021 12:07:43 +0000 (GMT)
References: <20210215171438.935665-1-philmd@redhat.com>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] gitlab-ci: Display Avocado log content when tests timeout
Date: Wed, 17 Feb 2021 12:07:30 +0000
In-reply-to: <20210215171438.935665-1-philmd@redhat.com>
Message-ID: <87a6s2ucc0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Since commit ba2232bae6d ("gitlab-ci: Refactor code that show logs
> of failed acceptances") we display the log content of failing tests
> (Avocado "FAIL" event).
>
> Since we are also interested in tests timeouting, update our global
> Avocado config to display log content for the "INTERRUPT" event,
> "possible when the timeout is reached" (See [*]).
>
> [*] https://avocado-framework.readthedocs.io/en/latest/guides/writer/chap=
ters/writing.html#test-statuses
>
> Suggested-by: Willian Rampazzo <willianr@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Queued to testing/next, thanks.

> ---
>  .gitlab-ci.yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 7adb9a4cef0..234cead60c2 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -64,7 +64,7 @@ include:
>      - echo "[datadir.paths]" > ~/.config/avocado/avocado.conf
>      - echo "cache_dirs =3D ['${CI_PROJECT_DIR}/avocado-cache']"
>             >> ~/.config/avocado/avocado.conf
> -    - echo -e '[job.output.testlogs]\nstatuses =3D ["FAIL"]'
> +    - echo -e '[job.output.testlogs]\nstatuses =3D ["FAIL", "INTERRUPT"]'
>             >> ~/.config/avocado/avocado.conf
>      - if [ -d ${CI_PROJECT_DIR}/avocado-cache ]; then
>          du -chs ${CI_PROJECT_DIR}/avocado-cache ;


--=20
Alex Benn=C3=A9e

