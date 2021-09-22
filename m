Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C653C414F39
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 19:36:24 +0200 (CEST)
Received: from localhost ([::1]:39940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT6AQ-0002KZ-Rv
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 13:36:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mT67g-0008EX-OB
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 13:33:32 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:46816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mT67f-0001Pe-2z
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 13:33:32 -0400
Received: by mail-wr1-x430.google.com with SMTP id t7so9058728wrw.13
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 10:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LuHOtbpjl7U3RpmrPs3rpowDqeOj/YPTp4rDXMp3zD4=;
 b=jqh66/j06tRCD9eSeLc0RLXnvFa8BN9MT8BTu9RHcYBIuRaG+bHpYm0tDxNQ2vasjm
 zJo6q+Gr26KoS7NhUhMTXgcnN6wFB+68dNGwI+eKg/kTuP9Kt8752uMu4liBorr90DCs
 fMmiNzo4PoBIxRJlS6CqBFk0sOeIKcCFZGuEflJOsyZfbHH5rhL+yEe0YyxPwO9Q0Dhc
 rq4nZvVBxpSDoApA8LyqjrvPucFvoiVcMpysxKRSJ15n9iDFp5jHJFFYyYtPIQTIOdEs
 8hZdS0UjX7wRdd/OKJbAVMxXLqDGlM8npFn4UTYn/AXL8G9TYeLXDFFbIcNpNTQCeeNs
 n2Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LuHOtbpjl7U3RpmrPs3rpowDqeOj/YPTp4rDXMp3zD4=;
 b=mR8Yd/AhDHxcjbfTzNrJ0iuRvv5lkKSQyLS8S75bi53hbJSy3Rh6+1bfOBnw/+rOP2
 9RS5qv5PX3FQZtBJWj1YVmHjcEDd5iQAnggl6Iq2a1BFKbp4R0pEaWexTu2Lwmji2Kd5
 Wzr/fN+EZ2r75crfwCmNm+yYLz65ZPojOuUbmw7V4sUW/85dUXUXGIn8q7fzUzLHIib1
 NjNQZcMFaE2jIp9tnqlmu2tpi41rpgTf8ghjwETv/Ub5JfLL/XjXdugY7WoU6twckjNB
 pkEmKsznzfU8kG7jfOzjg7MNL6G7R2jKqUc9zKgkcfiolZf5WR087cQ1cSLN92pWxpPd
 H14w==
X-Gm-Message-State: AOAM532SMvUIQh1l1MTRv/M5JIVwdDFy6ufYw7onnOPzkXUxs5Z6iYos
 sVq6lq8iaXMPEkPYjWuKL04=
X-Google-Smtp-Source: ABdhPJwNmMxywYPwaPKW7mI01WTn1jahtHTs6/FapHWmDXMk2GxFzcitfnccT4iVQKZKCuwWzy+awA==
X-Received: by 2002:a1c:2246:: with SMTP id i67mr222330wmi.157.1632332009041; 
 Wed, 22 Sep 2021 10:33:29 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id r4sm2836905wma.48.2021.09.22.10.33.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 10:33:28 -0700 (PDT)
Message-ID: <a311ab77-50bb-1d4b-f1ec-2d52d7a9546c@amsat.org>
Date: Wed, 22 Sep 2021 19:33:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH] tests/docker: add a debian-native image and make
 available
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210922151528.2192966-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210922151528.2192966-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Anders Roxell <anders.roxell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/22/21 17:15, Alex Bennée wrote:
> This image is intended for building whatever the native versions of
> QEMU are for the host architecture. This will hopefully be an aid for
> 3rd parties who want to be able to build QEMU themselves without
> redoing all the dependencies themselves.
> 
> We disable the registry because we currently don't have multi-arch
> support there.

Appreciated!

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Anders Roxell <anders.roxell@linaro.org>
> ---
>   tests/docker/Makefile.include                 |  4 ++
>   tests/docker/common.rc                        | 10 +++-
>   tests/docker/dockerfiles/debian-native.docker | 49 +++++++++++++++++++
>   3 files changed, 61 insertions(+), 2 deletions(-)
>   create mode 100644 tests/docker/dockerfiles/debian-native.docker

