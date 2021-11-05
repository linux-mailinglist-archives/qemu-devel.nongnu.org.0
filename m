Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48473446846
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 19:08:57 +0100 (CET)
Received: from localhost ([::1]:39808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj3e3-00066U-VK
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 14:08:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mj3cl-0005PI-Al
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 14:07:35 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:37547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mj3ce-00026K-H3
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 14:07:34 -0400
Received: by mail-qt1-x82d.google.com with SMTP id o12so7914341qtv.4
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 11:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xXasLkl5uQFAxdTNUE82mTJdVTrQyHCB1jfIs11qfME=;
 b=PVLVpYqrQ/Xb3wTqrfFpwHCZZ7GHImD30VKSQJW/fZX+q4B0icEdGCaJe8on5zSKST
 qR9eHOcG7gs3WA6WwVXXVybUhi97sTqA/3hfSuV1ekkOuW+fJlkaFBjmJbYJsImYd5Aa
 luUbwlrENQgQ/rL5Y/3bOxKDxYmT/+UMLK08P0fuoA3pIL43gGuqoNwKtA+2Xew0Yutm
 X7Ka3QDyeH/bK4c7zM7HwaOALQ8edl6Hf18zTBoEjbhr1Aum62SnMRtXBoUCBgfNOqa9
 /kA1/F1MS8NS8PwAXRr6lNYMK4ItfnDJt/nIwzqsS2rIekyJTBHB/fQFARqoMNVHJLXy
 ORjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xXasLkl5uQFAxdTNUE82mTJdVTrQyHCB1jfIs11qfME=;
 b=5ciKi973BmpOdV9sigZvVRuFm4F9HFHtY7VX8lQEfq4+mXeQpZNn8bAdBU8FkYDUHK
 PUZaJj61vATcwT390ZXwrzKlPqxww/ER1ft4EzWpZc1dGmePZ0w8r71v8rRD+y7Hd5/K
 KYVgpvmT0zcyk0TN9Kmpd5OtYmhNHU6sTrnABXV7ZALvi0CbBB9uGozne/Ln6oQz8uv6
 QheA+ry1dAGAubfjiOBVIC5/rn3Ka3W8axVuOs5mm+11xOL9e7rRlinCgENADhgtH0Ic
 6az3IcSUQHt1sSzGFsnSnPNiFRDPuFH3dUs/B0YiSCgLJcHCZmtDwpeYeNSCWzuH1jRE
 CuPQ==
X-Gm-Message-State: AOAM530+kE3P2xCudJ7A890Zn3+1qsJu2rWEm2D7nI0sGlkm0WW6PWtk
 lNglR+YLDTHnWoDpbmRKce1z5Q==
X-Google-Smtp-Source: ABdhPJwLcQhkq0faPkYhuKzCiRva3iuD0qcNVduo5e7pofWeQOyirGG5wIE+8AHSU2OMHpGw0QYczg==
X-Received: by 2002:a05:622a:50a:: with SMTP id
 l10mr64397611qtx.73.1636135646683; 
 Fri, 05 Nov 2021 11:07:26 -0700 (PDT)
Received: from [10.200.5.34] ([38.66.81.217])
 by smtp.gmail.com with ESMTPSA id c8sm6154161qtb.29.2021.11.05.11.07.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Nov 2021 11:07:26 -0700 (PDT)
Subject: Re: [PULL 00/11] Sphinx patches
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20211105133222.184722-1-marcandre.lureau@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a27ebb31-cd29-4af8-6600-379e0abf5bd9@linaro.org>
Date: Fri, 5 Nov 2021 14:07:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211105133222.184722-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82d.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.093,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/5/21 9:32 AM, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> The following changes since commit 18e356a53a2926a15343b914db64324d63748f25:
> 
>    Merge remote-tracking branch 'remotes/stsquad/tags/pull-for-6.2-041121-2' into staging (2021-11-04 08:33:46 -0400)
> 
> are available in the Git repository at:
> 
>    git@gitlab.com:marcandre.lureau/qemu.git tags/sphinx-pull-request
> 
> for you to fetch changes up to e6e89422ed6907d14ea67f2b99269e6b5554d6be:
> 
>    docs/sphinx: change default role to "any" (2021-11-05 17:22:04 +0400)
> 
> ----------------------------------------------------------------
> Some Sphinx improvements
> 
> PR for 2 series:
> https://patchew.org/QEMU/20211015105344.152591-1-marcandre.lureau@redhat.com/
> https://patchew.org/QEMU/20211004215238.1523082-1-jsnow@redhat.com/
> 
> ----------------------------------------------------------------
> 
> John Snow (3):
>    docs: remove non-reference uses of single backticks
>    docs: (further) remove non-reference uses of single backticks
>    docs/sphinx: change default role to "any"
> 
> Marc-André Lureau (8):
>    docs/sphinx: add loaded modules to generated depfile
>    docs/sphinx: add static files to generated depfile
>    docs/sphinx: add templates files to generated depfile
>    tests/qapi-schema/meson: add depfile to sphinx doc
>    meson: drop sphinx_extn_depends
>    meson: drop sphinx_template_files
>    docs/sphinx: set navigation_with_keys=True
>    docs/sphinx: add 's' keyboard binding to focus search
> 
>   docs/conf.py                           | 12 +++++++++++-
>   docs/devel/build-system.rst            | 16 ++++++++--------
>   docs/devel/fuzzing.rst                 |  9 +++++----
>   docs/devel/tcg-plugins.rst             |  2 +-
>   docs/interop/live-block-operations.rst |  2 +-
>   docs/meson.build                       | 10 ----------
>   docs/sphinx-static/custom.js           |  9 +++++++++
>   docs/sphinx/depfile.py                 | 19 +++++++++++++++++--
>   docs/system/guest-loader.rst           |  2 +-
>   docs/system/i386/sgx.rst               |  6 +++---
>   qapi/block-core.json                   |  4 ++--
>   include/qemu/module.h                  |  6 +++---
>   qemu-options.hx                        |  4 ++--
>   tests/qapi-schema/meson.build          |  6 ++++--
>   14 files changed, 67 insertions(+), 40 deletions(-)
>   create mode 100644 docs/sphinx-static/custom.js

One of the meson.build changes creates something that ninja does not like:

ninja: error: build.ninja:47298: multiple outputs aren't (yet?) supported by depslog; 
bring this up on the mailing list if it affects you

Makefile:162: recipe for target 'run-ninja' failed
make: *** [run-ninja] Error 1

which fails across multiple CI jobs:

https://gitlab.com/qemu-project/qemu/-/pipelines/403133805/failures


r~

