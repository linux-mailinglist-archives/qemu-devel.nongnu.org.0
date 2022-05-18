Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 059EB52BFB3
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 18:14:22 +0200 (CEST)
Received: from localhost ([::1]:49132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrMJY-0006nK-MY
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 12:14:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nrMI8-0005y7-3t
 for qemu-devel@nongnu.org; Wed, 18 May 2022 12:12:52 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:38443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nrMI2-0003Xd-59
 for qemu-devel@nongnu.org; Wed, 18 May 2022 12:12:49 -0400
Received: by mail-pl1-x631.google.com with SMTP id n18so2228827plg.5
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 09:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=3v2Qn6NjiprYx46mz2MgJytsnHXDVtugXeNXu93/h24=;
 b=dYAM6Mtur252xVglQ0s//vsXDTKwkpYoOl4CPnZNgEdqyEs0LJC/Adq5QxoNr3+9Wa
 iuXSCK3rENp/JHEF09ggA/WtCGeAt4+fD31/9C6wYXhzeIdQNuLqCk9h8ZppWM1dk/Y9
 MaoGDHIoU9KfQGBZEteEwlWlrWBlb5DZoVQKkaHfMiD08PJaWs8zMdxlnIARTo0xSMQg
 WKpBglbn5ZqEZSWmXEnNPsxY6gTR8G6PQig9Opcy1scTDs2l3ix/6JoPUd+zS9WgZZ4g
 fls7jCYGSyOvQeMleFtgqAkHY19/3pWxFN7C1GX6m+IzJS2wg493yBLzAoLlvwL3/EEU
 Kqxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3v2Qn6NjiprYx46mz2MgJytsnHXDVtugXeNXu93/h24=;
 b=Dkr/Nf9UX/4rlrRFe0pBqsXmlaAGTtX3r8lAhuz2l/Da/ayOF22/KtcEzGVx2z8qUk
 slzPxvZo4cire8iBZ0jta1lVIVBBPSe5YdKE6QkNJrZ9XEVtkPN8+MXFCnOsy5uhGXoy
 9/hIzaEZtrpNMBvchQFpaG8Ei59g2EKUTUXrydIMF6HwYAJuO54rdKvxiRQzJ8gm2CEu
 AWfLb+4anG1jhI0PhUwBOTwolECvYp5ytukDt2GLZY58NSYlxjrGZW57dwnyuZ36KgyL
 gzm1BSzvIBDsy1dsVOuWPA6o8by9J6v9ZxpcPwV2XARzYV3KmgsGvyZ0YrMFdRKKfsVD
 L//Q==
X-Gm-Message-State: AOAM533rCbHz112Q6s3I5byijinnpbHqOxtlq4zAR0YfdehrB4FLxL7I
 abhf2CXxU8MbKwsTZHcD3ZZ9kg==
X-Google-Smtp-Source: ABdhPJzEdx1kRCwoLb3jngVQrvqBQ1L+XK7c4kUqn82GKOc9V3qoMcoahWT2OBb6E4hBf0QX1Y4q4g==
X-Received: by 2002:a17:902:e5c3:b0:161:c96e:93d0 with SMTP id
 u3-20020a170902e5c300b00161c96e93d0mr381963plf.101.1652890364427; 
 Wed, 18 May 2022 09:12:44 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 d7-20020a056a00244700b00512ee2f2363sm2305536pfj.99.2022.05.18.09.12.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 09:12:43 -0700 (PDT)
Message-ID: <c3fdc5fa-9bb1-dfb8-d763-1a0946f15aa5@linaro.org>
Date: Wed, 18 May 2022 09:12:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 0/8] Misc patches (Gitlab-CI, qtest, Capstone, ...)
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20220518090438.158475-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220518090438.158475-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/18/22 02:04, Thomas Huth wrote:
>   Hi Richard!
> 
> The following changes since commit eec398119fc6911d99412c37af06a6bc27871f85:
> 
>    Merge tag 'for_upstream' of git://git.kernel.org/pub/scm/virt/kvm/mst/qemu into staging (2022-05-16 16:31:01 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/thuth/qemu.git tags/pull-request-2022-05-18
> 
> for you to fetch changes up to 83602083b4ada6ceb86bfb327e83556ebab120fc:
> 
>    capstone: Remove the capstone submodule (2022-05-18 08:54:22 +0200)
> 
> ----------------------------------------------------------------
> * Remove Ubuntu 18.04 containers (not supported anymore)
> * Improve the cleanup of the QEMU binary in case of failing qtests
> * Update the Windows support statement
> * Remove the capstone submodule (and rely on Capstone of the distros instead)

Fails centos-stream-8-x86_64 test,

Run-time dependency capstone found: NO (tried pkgconfig)
../meson.build:2539:2: ERROR: Dependency "capstone" not found, tried pkgconfig

https://gitlab.com/qemu-project/qemu/-/jobs/2473935684


r~



> 
> ----------------------------------------------------------------
> Daniel P. Berrangé (2):
>        tests/qtest: fix registration of ABRT handler for QEMU cleanup
>        tests/qtest: use prctl(PR_SET_PDEATHSIG) as fallback to kill QEMU
> 
> Thomas Huth (6):
>        gitlab-ci: Switch the container of the 'check-patch' & 'check-dco' jobs
>        Remove Ubuntu 18.04 container support from the repository
>        docs/about: Update the support statement for Windows
>        tests/vm: Add capstone to the NetBSD and OpenBSD VMs
>        capstone: Allow version 3.0.5 again
>        capstone: Remove the capstone submodule
> 
>   docs/about/build-platforms.rst                     |  14 +-
>   configure                                          |  23 +---
>   meson.build                                        | 115 +---------------
>   include/qemu/osdep.h                               |   2 +-
>   tests/qtest/libqtest.c                             |  21 ++-
>   .gitlab-ci.d/buildtest.yml                         |   3 +-
>   .gitlab-ci.d/containers.yml                        |   5 -
>   .../custom-runners/ubuntu-20.04-aarch32.yml        |   2 +-
>   .../custom-runners/ubuntu-20.04-aarch64.yml        |   2 +-
>   .gitlab-ci.d/static_checks.yml                     |  14 +-
>   .gitlab-ci.d/windows.yml                           |   5 +-
>   .gitmodules                                        |   3 -
>   capstone                                           |   1 -
>   meson_options.txt                                  |   3 +-
>   scripts/ci/setup/build-environment.yml             |  14 +-
>   scripts/meson-buildoptions.sh                      |   5 +-
>   tests/docker/dockerfiles/ubuntu1804.docker         | 144 ---------------------
>   tests/lcitool/refresh                              |   7 -
>   tests/vm/netbsd                                    |   3 +-
>   tests/vm/openbsd                                   |   3 +-
>   20 files changed, 59 insertions(+), 330 deletions(-)
>   delete mode 160000 capstone
>   delete mode 100644 tests/docker/dockerfiles/ubuntu1804.docker
> 


