Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EC0296569
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Oct 2020 21:35:48 +0200 (CEST)
Received: from localhost ([::1]:40698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVgNH-0007Sb-9x
	for lists+qemu-devel@lfdr.de; Thu, 22 Oct 2020 15:35:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kVgLz-00070K-Hq
 for qemu-devel@nongnu.org; Thu, 22 Oct 2020 15:34:27 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:43176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kVgLx-0003ei-P7
 for qemu-devel@nongnu.org; Thu, 22 Oct 2020 15:34:27 -0400
Received: by mail-wr1-x444.google.com with SMTP id g12so4429960wrp.10
 for <qemu-devel@nongnu.org>; Thu, 22 Oct 2020 12:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=dAp5lEZKiIRXZZcH69ZSWKZuhJ0hacdi3rSERInkhBk=;
 b=Cld1PpLRk/5mVwVY6IyZyz1QHIVWzjixXsZrJookjpFx5Ba5Djxh7CTbx9htCrHe21
 wUb+tMElT4psZcXe4bEePEfwpbFIJ6uP5cxdTQ7wHlumfWFld//EWY7x7xMIhjPrNXdb
 Lx3rC1qQPxl1MP0CeCdBWPUWd4Mc5FlDdRf5VBcl7Z2Q+R0Xs5VTJkmTBgwli1iOs438
 3zfrgZJK238a25ZvdHrczcgU0rlOgZM0rkMV9bF6oL4pY2OIyQwXfqssoCbXdbOw3E0+
 knjGflUtByLmmQGP3uMFAravwO8gFBqgwJqa4dSzohBeTZFpR0uXHeB70Srgb0erbRxu
 mg4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=dAp5lEZKiIRXZZcH69ZSWKZuhJ0hacdi3rSERInkhBk=;
 b=HIiRySemz6lL9cwCM4xyuht/4Mm4EmuC4AU14juexUn18H9bN/DIWPWxNXUKTyiMOJ
 oYBHmWkSPwfi6i8aamRhCiFHhwj9L6Q7iFaCyCzdzbSP/u3MClFHRrLxRwUC0ixzymVo
 4ainGHQeVc9IQD9f33XpFEFEVveree1mXuQvTfOfF5hDWW7uoIhH5yy+37IQs+nwFD/Y
 20Zc8wNxhhpH70dKjyck/J6HD8pB0T2SjnuD5teN+Lz4rtY5LHAcJ4HF1CfqvLmjB+PA
 HIAgWkuMQAAknIDDReMuFlrhZsM0+ioVn1QbvVDhvWRrJuAx68pdfujkAx4UpWT2lPxE
 aIjQ==
X-Gm-Message-State: AOAM533GuzKQFFcbyT6EPyQXzqNZnqNkRXFuSrf63gQYiY6CkhfD+3ct
 2sJ4KllcFkfm9R3Pylqpqx/gLW4QkGsz+g==
X-Google-Smtp-Source: ABdhPJwoASjnljWANznHs+9jJgR92HCtLpSw+dfUJdnR79nHdcta3FqOwiSdjbkIjoLisD/weKob2w==
X-Received: by 2002:adf:8541:: with SMTP id 59mr4360474wrh.61.1603395262692;
 Thu, 22 Oct 2020 12:34:22 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t19sm6054104wmi.26.2020.10.22.12.34.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2020 12:34:21 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B881F1FF7E;
 Thu, 22 Oct 2020 20:34:20 +0100 (BST)
References: <20201022123302.2884788-1-philmd@redhat.com>
User-agent: mu4e 1.5.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] gitlab-ci: Clone from GitLab itself
In-reply-to: <20201022123302.2884788-1-philmd@redhat.com>
Date: Thu, 22 Oct 2020 20:34:20 +0100
Message-ID: <87r1pqt5qb.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Let GitLab runners use GitLab repository directly.

Queued to testing/next, thanks.

> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  .gitlab-ci.yml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 66ad7aa5c22..ba77af51f2f 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -24,6 +24,7 @@ include:
>    image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
>    before_script:
>      - JOBS=3D$(expr $(nproc) + 1)
> +    - sed -i s,git.qemu.org/git,gitlab.com/qemu-project, .gitmodules
>    script:
>      - mkdir build
>      - cd build


--=20
Alex Benn=C3=A9e

