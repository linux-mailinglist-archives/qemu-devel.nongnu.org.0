Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 471803DA728
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 17:08:12 +0200 (CEST)
Received: from localhost ([::1]:52176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m97dr-0002rZ-9m
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 11:08:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m97cj-0001nN-0G
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 11:07:01 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:39902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m97ch-0001tV-ES
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 11:07:00 -0400
Received: by mail-ej1-x62a.google.com with SMTP id go31so11240196ejc.6
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 08:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bbdi17Ps915tTdHshRoZaqRDBkZUTToj1Y1kFfWCPXI=;
 b=jzDFmqIjpUuYn2JlaqiJDpbosJwIziokjhCjQ3v/5+51VYIQnJxUV/21CNyIC+itB9
 ac9JCcKsfgcSNYKsc9oQDSLY5Mf+AUQDSnoY0CbXw4hWKTWiy2fxg01zsGljfso6mOAN
 5Ei0/y6yXjeifT+u6WqwjCgX/bU+yE9sMicDIuaGupfp235IaVpjjWS2k1URUfMYJWNV
 WPCkyBbFzUWNf2YXicv0XtCpiIbPj0R2Pw13i1dDfCfWOAPG0UKS0KxEQx/IxbIWzjAM
 pVa0tu2X4j3JIJM693dDkxX9T9U4rtLZxjfNTRzn2pC9XFo7GnNfevpHnqIy2yNgngGv
 ix0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bbdi17Ps915tTdHshRoZaqRDBkZUTToj1Y1kFfWCPXI=;
 b=LP8c7nI/+xHquQiPZN2b93sDr6iO8VRY7k6WaxUQPPoYOoX8Gz+rd8m6p5op6oCFYA
 65G3LvXiyfE+pHQ9dNtLHLSznl3sKyO5oh/mG7hzrmOBxIf/12mKt3Z+wm6XHNehHaYn
 EOFgAN6KYVidwyAsP6O6vhMZkqL5t/o9pJAl317C8vGrr0uHAzRHOzJZkzTB6S4Sf4TI
 4ICuoEC5dWKsiZMaPmVSVaHa6QkL9bB2UGaNjqWpKDobd+cUheihKNJQOZIgbmVZzxHm
 AFub4BHzglxxxSA+42mqreMnCByhP8D1kwkGN6gc6zMWm3e2Bmt3N0e5QogfwsDGG3Ap
 YRNA==
X-Gm-Message-State: AOAM531WQvKD+mFWEZq8xqgArw0FimznRmMpUeHFt8OWxAc6cohZI8Sd
 Py4ibpwzF0zNJ1NpaemobWrONMaUYfZnioVZv+ZiDg==
X-Google-Smtp-Source: ABdhPJyMaurLXs+vYtu3iC/lVBAWKpir/5guK/7+Abjdk+lSCPv5+eds9dFZ4CvEnQN+m5dJh1TM2lsFU2q9tvr7oEg=
X-Received: by 2002:a17:907:3e02:: with SMTP id
 hp2mr5029666ejc.4.1627571217775; 
 Thu, 29 Jul 2021 08:06:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210729082211.532572-1-thuth@redhat.com>
In-Reply-To: <20210729082211.532572-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Jul 2021 16:06:15 +0100
Message-ID: <CAFEAcA-=T=f38aAQBeBGd0cS_SxTTADq5vS-kxLar3qzSavouQ@mail.gmail.com>
Subject: Re: [PULL 0/9] Gitlab-CI improvements and some other fixes
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 29 Jul 2021 at 09:22, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi Peter!
>
> The following changes since commit 69ea12b19a15ae006521cd5cc0f627f27f738746:
>
>   Merge remote-tracking branch 'remotes/armbru/tags/pull-misc-2021-07-27' into staging (2021-07-28 13:32:12 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/thuth/qemu.git tags/pull-request-2021-07-29
>
> for you to fetch changes up to b8ee198d21c4bab41b8cb8d1729a956d9f648997:
>
>   configure script fix for Haiku (2021-07-29 08:09:32 +0200)
>
> ----------------------------------------------------------------
> * Document GitLab custom CI/CD variables
> * Fix 'when:' condition in gitlab-CI jobs
> * Disable tests in the gitlab-CI that fail due to out-of-memory conditions
> * Allow pushing to "staging" again for maintainers without s390x access
> * Fix migration-test build failure on SPARC
> * Compile without "pie" on Haiku


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

