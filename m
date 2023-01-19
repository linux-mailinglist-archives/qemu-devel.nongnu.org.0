Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BD56742EF
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 20:36:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIaht-0003z3-UK; Thu, 19 Jan 2023 14:36:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIahs-0003yh-Gt
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 14:36:16 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIahq-0003hc-Ua
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 14:36:16 -0500
Received: by mail-ej1-x633.google.com with SMTP id mg12so8444658ejc.5
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 11:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=B6QLQoOr6pU3C1WE3P9FMKCie6IMD0C9P79c0GAMSSg=;
 b=clOWgUxrUYwBPpj2bEKAJ3b65fzhlvaF7rSHgy5wwM0U2MAuReYMwpxIJmtITPp6yy
 sOssn7ifLFjXoHMTX42/SNPtUabuNocVAwwmPvnqfufAUK72i9V3hjhUufc/+DRVNH8d
 JfMJZG3wsFjZbB+F94FTEcQJxz3ix7jJXMMp1OFw+GcgzvfI98wiX1jbuwBtJFAElDpU
 P5s9Mv784rsYwZ2FZ5WEZwz/EJPQk1SvM3fk9AB01MkGe+wseWIdtYkAIVtnCz5MGAQk
 e/Os+7mriTWjvyw6hTcqElgIoFqGKduS12Owy8IWM7yGgotUqFZyRlx58OxqKtASNaro
 OQLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B6QLQoOr6pU3C1WE3P9FMKCie6IMD0C9P79c0GAMSSg=;
 b=kctW/LM7hjtyFfycC8+iQdeEbXVUd0AEfX4N0mOeAH0SI1RKSeb45M94VHeSrnTjja
 5FzPFB0W6/WHJo4QrfPqGCjMvhU9PINe7HxBtO0Q8VrJi3npyOjayOgBJbT+3ACqqrei
 8sY6mDzsEvKyu7SD8RpOAQWBM03jh0MC3d9VJxzdutuDoeF1ryFOQK2Z4Ol/r3owZoTE
 mBsPLeN/0d/lS17stGaZJvulPurkWAB6/3dj6M4RKngyDWC2HgacNPFMD65didbpj1As
 KxgFsTXKVjgbf6ji3JIqD4a+Fekfew8AW+thYmgRMs6shqA48tHnUikhD1qocxV+DunJ
 Ca6g==
X-Gm-Message-State: AFqh2kpnFdnF8bQg3OmYOu7/78G4gHvv1Hk/rCgkxBii5ASge3IkUrzh
 r+og/aL6kJNK0B3cRoFo7dJNYw==
X-Google-Smtp-Source: AMrXdXukOR7sE/9RXyAv5G7NQOTyWLOkZg/aM4lkkmH+9PQmnYu9yMlwe+jv98uueI4EKO4d2Dpqvg==
X-Received: by 2002:a17:907:1257:b0:86c:a3fc:597c with SMTP id
 wc23-20020a170907125700b0086ca3fc597cmr10743343ejb.27.1674156973291; 
 Thu, 19 Jan 2023 11:36:13 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 ab15-20020a170907340f00b0087329ff591esm4092662ejc.132.2023.01.19.11.36.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 11:36:12 -0800 (PST)
Message-ID: <0419b78e-fa8a-ccfc-921d-54c5efba9308@linaro.org>
Date: Thu, 19 Jan 2023 20:36:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 11/18] lcitool: drop perl from QEMU project/dependencies
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Bandan Das <bsd@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Cleber Rosa <crosa@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Darren Kenny <darren.kenny@oracle.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <20230119180419.30304-1-alex.bennee@linaro.org>
 <20230119180419.30304-12-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230119180419.30304-12-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 19/1/23 19:04, Alex Bennée wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Message-Id: <20230110132700.833690-8-marcandre.lureau@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/cirrus/freebsd-12.vars                   | 2 +-
>   .gitlab-ci.d/cirrus/freebsd-13.vars                   | 2 +-
>   .gitlab-ci.d/cirrus/macos-12.vars                     | 2 +-
>   scripts/ci/setup/build-environment.yml                | 1 -
>   tests/docker/dockerfiles/alpine.docker                | 1 -
>   tests/docker/dockerfiles/centos8.docker               | 1 -
>   tests/docker/dockerfiles/debian-amd64-cross.docker    | 1 -
>   tests/docker/dockerfiles/debian-amd64.docker          | 1 -
>   tests/docker/dockerfiles/debian-arm64-cross.docker    | 1 -
>   tests/docker/dockerfiles/debian-armel-cross.docker    | 1 -
>   tests/docker/dockerfiles/debian-armhf-cross.docker    | 1 -
>   tests/docker/dockerfiles/debian-mips64el-cross.docker | 1 -
>   tests/docker/dockerfiles/debian-mipsel-cross.docker   | 1 -
>   tests/docker/dockerfiles/debian-ppc64el-cross.docker  | 1 -
>   tests/docker/dockerfiles/debian-s390x-cross.docker    | 1 -
>   tests/docker/dockerfiles/debian-tricore-cross.docker  | 1 -
>   tests/docker/dockerfiles/fedora-win32-cross.docker    | 1 -
>   tests/docker/dockerfiles/fedora-win64-cross.docker    | 1 -
>   tests/docker/dockerfiles/fedora.docker                | 1 -
>   tests/docker/dockerfiles/opensuse-leap.docker         | 1 -
>   tests/docker/dockerfiles/ubuntu2004.docker            | 1 -
>   tests/lcitool/projects/qemu.yml                       | 1 -
>   tests/vm/centos.aarch64                               | 2 +-
>   23 files changed, 4 insertions(+), 23 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


