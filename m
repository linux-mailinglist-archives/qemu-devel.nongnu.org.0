Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 751113C270C
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 17:47:04 +0200 (CEST)
Received: from localhost ([::1]:45084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1siV-0007pX-GZ
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 11:47:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1shQ-000750-7F
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 11:45:56 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:37471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1shO-0006Vl-Ko
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 11:45:55 -0400
Received: by mail-ej1-x62a.google.com with SMTP id i20so16982281ejw.4
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 08:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H1PTYtBri0Ev9+RXXtQ5rwXmADgTHRmYvYIYjzB8wIQ=;
 b=laWWO7llCp687zkn70kOBnwOCiUEkKqeU+kQJQ7h92CXVb5ZuUKB+51PUDGXAYEFhU
 8maTzF88yN0VqIY4XfO2wyHr6YfkcLL3oCsH+KKe1qTnInMPPECUke4oi2UUZO9Jkkm6
 XZEDhP7x9qn78krygIoPVx0kQULzKG+trtDuo4DxBcGmj3SZ7YWNlCxAfYHNLw9agdsv
 ParYQrEw4nLWZ0W/TZ6LqHBHQmSN+3n3+OHuUlYk42whk0Udjib9uvfufeNDBFZtIVsM
 OOJlgF1stOOK6B5IKUsZtvoDH9AxLimRGPBbw9I1lsfC1+DkAQh6kHeTrGYYLTcTi4Yw
 NxuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H1PTYtBri0Ev9+RXXtQ5rwXmADgTHRmYvYIYjzB8wIQ=;
 b=sHVFMFxWYZ+0dGUZV/0PGOlZkBOJoTskwehBNhszGxyxA3jhSMK2GDdUWunmNgU6+j
 U13HKbqp8k54W5Oc1NX3nJEGqMBBPrc6CmdwdVIavnhiJdXMUyWWBwIckHdtFgyEk4gX
 Cvaka7Dp5ayOP/J1ygRLQRP9mou1HYypORMsonYex6guwytzf4D7gBIrbjPTD6r2a7qv
 lVAWH+GTAwC9eX1FoiP+YyUUtD963wYCJ2z1ruA64Q6LvSkRjTwvxGuo9GFU1r7147TK
 cP4zF1uS2Zt0Y+yz/i8wYL89f4soQbLwjunMlYcsolAAfsLXfTrOSGqxh6uv2lws1K4x
 saSw==
X-Gm-Message-State: AOAM533FoWEVYk55JzjOGYUDr4Sy9xPI6uBw1H9Op4ita7sDY+Idt1Y5
 d4Ak4f5YtUYGC4hYk/1B0eNFPMjfRc/v97ZQvRYoOg==
X-Google-Smtp-Source: ABdhPJzVOWdrwyPYhe1wEc5JlskTUDFgQKv0ndqeoaOLvIkJV/WjiMBWXxCCimoRtzCzpVF5kZEFQhsTKMRjFWbPUmk=
X-Received: by 2002:a17:906:924a:: with SMTP id
 c10mr20913786ejx.85.1625845553099; 
 Fri, 09 Jul 2021 08:45:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210708151748.408754-1-pbonzini@redhat.com>
In-Reply-To: <20210708151748.408754-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 9 Jul 2021 16:45:14 +0100
Message-ID: <CAFEAcA_jiK+scAPgAO2tQB1Uwgvy4F3fVbwvpDK+nx4Sa2cJEQ@mail.gmail.com>
Subject: Re: [PULL 00/48] Misc patches for QEMU 6.1 soft freeze
To: Paolo Bonzini <pbonzini@redhat.com>
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

On Thu, 8 Jul 2021 at 16:21, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 9aef0954195cc592e86846dbbe7f3c2c5603690a:
>
>   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2021-07-06 11:24:58 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 81224eaca6675978489cd7c6172f17ca1f54b494:
>
>   configure: allow the selection of alternate config in the build (2021-07-08 14:01:52 +0200)
>
> ----------------------------------------------------------------
> * More SVM fixes (Lara)
> * Module annotation database (Gerd)
> * Memory leak fixes (myself)
> * Build fixes (myself)
> * --with-devices-* support (Alex)
>

New warnings in the docs build:

/home/pm/qemu/docs/../include/qemu/module.h:127: warning: Function
parameter or member 'name' not described in 'module_arch'
/home/pm/qemu/docs/../include/qemu/module.h:127: warning: Excess
function parameter 'arch' description in 'module_arch'

The macro parameter and the name used in the doc comment
don't match.

thanks
-- PMM

