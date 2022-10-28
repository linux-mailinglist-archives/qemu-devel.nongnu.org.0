Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE6C610E19
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 12:07:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooMGs-0004dQ-TV; Fri, 28 Oct 2022 06:07:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ooMFK-0004ac-4a
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 06:05:58 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ooMFI-0005XY-7g
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 06:05:49 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 l16-20020a05600c4f1000b003c6c0d2a445so3429239wmq.4
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 03:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=x0kz4PrPL3k0X4VeoQsn6GUmJHsaBWXXxB9rRTgast4=;
 b=apV4Lfi5EOtBet7PJkQ+WdUmsPDD1vgYLkbBPAvRyaPjIBAgJDR8+R+ydEmRjUXA8+
 jVK+g+5TXQBv/SQf20c45r2gzHzhNgMzTfQ5qb6RDGtNcXM6MM6K84KRzzRmdW9ogQRH
 eVCmtMJ6pCER5VjUlkEuu6UbhkIlOaLdmHmGBdMBEaJte9/ADYzMiLCJdEPmY9Tw/wSv
 vKFR9sGdrzTdkDJwXR9ewW0DPw6dqBhd+LMojgYNWR0Xu6bwaBRvPtzV+PdxCygvH9Cs
 yMXvDaVta5UFwcfRrUa4Sk5ZDZDITQmMOTJFqC+28IguTdmhiBUG//ZacJwROLt1sDT2
 CZpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x0kz4PrPL3k0X4VeoQsn6GUmJHsaBWXXxB9rRTgast4=;
 b=wYmSx85g/g/RGWO9jN1WWFRXSRXGkc+T6xUhQ4V3VARnG4dEhW0c5EuGCVfAgUQxyy
 D0Rj7UYcbzDgWuSFj4swEdhw/M+qJpddEh8RHUkxCTVFmGJgB5+l46NEPjKVgQ06XlbW
 ZNr5Gacsr0YQPvGYWGsm0Pgn8O6t9gPCdXD4F8hi7cvXL4GTAEwBltBugvhxqqrX7J5w
 KeAC2pBAiQqFS+YYmOMtSGJuxGBb9K5bInPh70IwPhIR+wiLWVB9mMQhG8jPXUdLDzUq
 l7A12Z9dI6gXnnUja9j/W3Hxrc33uqfjYlvMKOraOyYMY5CM25eQEzEH+VDVBq7b3C/u
 8m+w==
X-Gm-Message-State: ACrzQf0vIVzO1GSWCn09JfGzAsbelke3ZTwskqzaQPw+LmS/cbbnYXBd
 Z0WYgIi5ho6t/lS6KRW1K8y5qplcu1F3JvEs
X-Google-Smtp-Source: AMsMyM64rLe7m+Fx4v2mC439L1iCGT5UZ4t+3JV9tdRG3tsA6kN3qWspFVq36hhfCoYiWzDAp4scrw==
X-Received: by 2002:a05:600c:3d10:b0:3c6:e1fb:b336 with SMTP id
 bh16-20020a05600c3d1000b003c6e1fbb336mr8976053wmb.9.1666951546470; 
 Fri, 28 Oct 2022 03:05:46 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 m18-20020adfe952000000b002368f6b56desm4018627wrn.18.2022.10.28.03.05.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 03:05:45 -0700 (PDT)
Message-ID: <ac27d6ef-08ee-962d-4b96-8c7d3076ff39@linaro.org>
Date: Fri, 28 Oct 2022 12:05:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH v5 2/3] tests/lcitool: Refresh to latest libvirt-ci module
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, "Daniel P . Berrange" <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20221028095659.48734-1-philmd@linaro.org>
 <20221028095659.48734-3-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221028095659.48734-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 28/10/22 11:56, Philippe Mathieu-Daudé wrote:
> From: Alex Bennée <alex.bennee@linaro.org>
> 
> We need an updated lcitool for this to deal with the weirdness
> of a 32bit nsis tool for both 32 and 64 bit builds. As a result

s/nsis/NSIS/

> there are some minor whitespace and re-order changes in a bunch
> of the docker files.

Please amend:

All Dockerfile manifests have been automatically re-generated using
'make lcitool-refresh'.

> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20220929114231.583801-10-alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tests/docker/dockerfiles/alpine.docker        |   2 +-
>   tests/docker/dockerfiles/centos8.docker       |   2 +-
>   .../dockerfiles/debian-amd64-cross.docker     | 234 ++++++++---------
>   tests/docker/dockerfiles/debian-amd64.docker  | 236 +++++++++---------
>   .../dockerfiles/debian-arm64-cross.docker     | 232 ++++++++---------
>   .../dockerfiles/debian-armel-cross.docker     | 230 ++++++++---------
>   .../dockerfiles/debian-armhf-cross.docker     | 232 ++++++++---------
>   .../dockerfiles/debian-mips64el-cross.docker  | 226 ++++++++---------
>   .../dockerfiles/debian-mipsel-cross.docker    | 226 ++++++++---------
>   .../dockerfiles/debian-ppc64el-cross.docker   | 230 ++++++++---------
>   .../dockerfiles/debian-s390x-cross.docker     | 228 ++++++++---------
>   tests/docker/dockerfiles/fedora.docker        | 230 ++++++++---------
>   tests/docker/dockerfiles/opensuse-leap.docker |   2 +-
>   tests/docker/dockerfiles/ubuntu2004.docker    | 234 ++++++++---------
>   tests/lcitool/libvirt-ci                      |   2 +-
>   15 files changed, 1273 insertions(+), 1273 deletions(-)


