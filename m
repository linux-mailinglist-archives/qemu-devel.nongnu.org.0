Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA17462094
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 20:33:36 +0100 (CET)
Received: from localhost ([::1]:55238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrmP9-0003W4-1E
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 14:33:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mrmJM-0001L2-N5
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 14:27:36 -0500
Received: from [2a00:1450:4864:20::32a] (port=52851
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mrmJK-0002ku-Jg
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 14:27:36 -0500
Received: by mail-wm1-x32a.google.com with SMTP id o29so15568852wms.2
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 11:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lX/dQaQM8DTZlFfCoZAk4UKQM+mDAhwKMjQ9VucHbjI=;
 b=s7aINmTXnABIpVHWI2kGN9hg4e36CWEnS9WzI4sEwsltGN+p1Xsl4TzspajDpc388/
 CqXMeRuMYNh7+k9csp4DioJM5Hh+/FgNO58TPTPXPNqyT5oUJ8+9RELL7m/WpQuiwJ+X
 U4+AKnknjEx+xoB/Za2BSfb5D+rB2LY27LHIvf3XjSLZfjanCrOYDSXyBRASYYJ1EEeN
 SCkVYitE4Tk5D9C9Yb1NsdLfmN1wOHuz9dTunm0p1jVnDoRLzUorV3bYinRUxwRZ/+IS
 q46uKMkJ9CnP3bjohdPtnmB/8lDH0i20HS7/GIgBncUijfuLCWi5AsIuZ4H2lKHlWVig
 IGyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lX/dQaQM8DTZlFfCoZAk4UKQM+mDAhwKMjQ9VucHbjI=;
 b=eJj+RH7P1ikinFe6w+DrIFjRL75urERmQfV9+Ps52I5M/e2Be5OcSS6NwYta73zgy0
 Y7qzF0MAoNF1Ug7U1992sYaTRMD1lfD4moooaKHX0CqQEgoeGAWv9ryLjP1SpymldQDn
 YI5kADbiLWDMe78MnUmrmJ9eRZjjZmS10k7ud8BVXMKIfns1xGsS5FxUacZqLZDKom6H
 1ojaFrWkwXmCl6vgSOm6C2u9fNdxM8r0HiurkJHOlO2Q2m2FBHe3Ynzdh2nFwdURdivv
 LAuZpmxLnvg33c989BSQIsOgYErohjBBOA/J8NPZjKQxk1wy8AgU0GEXCikh4cOoLjBs
 xe9Q==
X-Gm-Message-State: AOAM532B6i/j0MwS2xxRWbX3lJ7MyqoxkMzVW6kSrn4yallU//4mq7Kh
 kh/T0XQ4MokDiyS4V/FGsYLJR8wL1MBVxYo7GIY=
X-Google-Smtp-Source: ABdhPJzusH4ooYFQneI6dhAYGDYnnENCb85zASnth9NtU9tjzb2UbK4ScDU/GFwPu3M+G6A/nRryAA==
X-Received: by 2002:a1c:6a0e:: with SMTP id f14mr62319wmc.58.1638214050160;
 Mon, 29 Nov 2021 11:27:30 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id s63sm221875wme.22.2021.11.29.11.27.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Nov 2021 11:27:29 -0800 (PST)
Subject: Re: [PULL for 6.2 0/8] more tcg, plugin, test and build fixes
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
References: <20211129171449.4176301-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6195ec11-8645-0985-85ee-049e635deb27@linaro.org>
Date: Mon, 29 Nov 2021 20:27:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211129171449.4176301-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.317,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/29/21 6:14 PM, Alex Bennée wrote:
> The following changes since commit e750c10167fa8ad3fcc98236a474c46e52e7c18c:
> 
>    Merge tag 'pull-target-arm-20211129' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2021-11-29 11:56:07 +0100)
> 
> are available in the Git repository at:
> 
>    https://github.com/stsquad/qemu.git tags/pull-for-6.2-291121-1
> 
> for you to fetch changes up to d5615bbf9103f01911df683cc3e4e85c49a92593:
> 
>    tests/plugin/syscall.c: fix compiler warnings (2021-11-29 15:13:22 +0000)
> 
> ----------------------------------------------------------------
> TCG, plugin and build fixes:
> 
>    - introduce CF_NOIRQ to avoid watchpoint race
>    - fix avocado plugin test
>    - fix linker issue with weird paths
>    - band-aid for gdbstub race
>    - updates for MAINTAINERS
>    - fix some compiler warning in example plugin
> 
> ----------------------------------------------------------------
> Alex Bennée (5):
>        accel/tcg: introduce CF_NOIRQ
>        accel/tcg: suppress IRQ check for special TBs
>        tests/avocado: fix tcg_plugin mem access count test
>        plugins/meson.build: fix linker issue with weird paths
>        gdbstub: handle a potentially racing TaskState
> 
> Juro Bystricky (1):
>        tests/plugin/syscall.c: fix compiler warnings
> 
> Philippe Mathieu-Daudé (1):
>        MAINTAINERS: Add section for Aarch64 GitLab custom runner
> 
> Willian Rampazzo (1):
>        MAINTAINERS: Remove me as a reviewer for the build and test/avocado
> 
>   include/exec/exec-all.h      |  1 +
>   include/exec/gen-icount.h    | 21 +++++++++++++++++----
>   accel/tcg/cpu-exec.c         |  9 +++++++++
>   accel/tcg/translate-all.c    |  4 ++--
>   gdbstub.c                    |  2 +-
>   softmmu/physmem.c            |  4 ++--
>   tests/plugin/syscall.c       |  8 +++-----
>   MAINTAINERS                  | 10 ++++++++--
>   plugins/meson.build          |  4 ++--
>   tests/avocado/tcg_plugins.py |  2 +-
>   10 files changed, 46 insertions(+), 19 deletions(-)

Applied, thanks.


r~


