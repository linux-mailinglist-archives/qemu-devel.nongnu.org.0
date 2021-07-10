Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D223C3588
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 18:31:28 +0200 (CEST)
Received: from localhost ([::1]:43050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2Ft1-00049C-PJ
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 12:31:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m2Fri-00030T-L3
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 12:30:06 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:34572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m2Frg-00066p-Tg
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 12:30:06 -0400
Received: by mail-ej1-x62d.google.com with SMTP id hr1so22964243ejc.1
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 09:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ATwMRIIMLw/gSaqYIZdJMf0QKUryf0/sEgzcJt5SJ54=;
 b=fSFEfelT46bfcKXE/1qt4exfbMlvILJy74OQzseAKfI1UP4mLZEMZR+D0yZ+RQPlVh
 g0CgWuF29wzUYhmmDIG7uvlR/vHOptAy4pjCWFugc5CQX3L4wlQJZ9RypMl2KDLBxEad
 +mmsSitJCX4asqoXXtOPp11j6ChfGrfdRuKsUnZvRdXkrYD7DSilsqXsd9C6z6a0gW6m
 K26GsjCR85CjXy5FXKytYt7ZZa7PTnH4mdgwzWSamEmCHaOTkrQtEohQHX4Ui1+7Ynz/
 HkeCqOFQ0no5/AMq4i8GqlC5k2I4kbKWS8/mWafuCoDB8Y/9YOH5P0xUJZ6TgOgB9aL6
 aZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ATwMRIIMLw/gSaqYIZdJMf0QKUryf0/sEgzcJt5SJ54=;
 b=be43Aq/Al3xZAmudTtYyquPfZCl18N9zHW5elujlsIgArA0LhKhWFQQBm0Uh/S+J5t
 zTBVUoX1bRd544q8/068hl35iI+QakiVEaSOjeLGdhnB3A0CwHRkRQRbFLU0ONd33dHw
 9413PRZk8U3oA6JRUX7sJiwHA9SdnKE5IB+eQ8Izt5K9rRcXSg9XBwCO0eP+CmMgR9bj
 tRSWD8yB9tG31n9QuM3LP69mHrFyVIn9wtqVQx1l7Zxbq6p3ozpOM7WCPp9YKYmg4Ag8
 3IEV5C3pZiIcMcY0WXkT4qaq/vVmKQWEAuDn8H7L4TgUT0hVjrOomO6l+VnWNKFn+wwq
 zMZQ==
X-Gm-Message-State: AOAM531RKAjJc/6mqW4J4iyY/iS4dzOzauUgcuXt476pJ6d1WRuRtU2G
 rWflmp/3zpVaR0LHLxm4C9qXPS9a9zODoGwoP4kLW1ykp0HEB7G9
X-Google-Smtp-Source: ABdhPJxOs4/3Gyaq0et3P259ZaL8QadEmiLqVrGGXIw/Qowu5p57LUht9JcFQogTj5e1g6GFp4LRrEParAzaSeNDa50=
X-Received: by 2002:a17:907:a05c:: with SMTP id
 gz28mr2867779ejc.56.1625934603504; 
 Sat, 10 Jul 2021 09:30:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA9ykYzTbuUskdCFkYYdYqZcUM5K2ciuFLKKh9_Y2GW7Dg@mail.gmail.com>
In-Reply-To: <CAFEAcA9ykYzTbuUskdCFkYYdYqZcUM5K2ciuFLKKh9_Y2GW7Dg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 10 Jul 2021 17:29:24 +0100
Message-ID: <CAFEAcA8LvPSUw+x9GhPvKFvZqx6zLtUDYOT7Uh2zYef3RZx-7A@mail.gmail.com>
Subject: Re: retrying failed gitlab CI external jobs (travis)
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 10 Jul 2021 at 14:34, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Hi; we now have travis's CI hooked into gitlab, which is nice. However,
> unlike the gitlab native CI jobs, there's no UI for saying "retry this"
> when the "travis CI" part of the overall gitlab pipeline fails.
> This is awkward because travis seems to be prone to intermittent failures.
> Is there any way we can make the jobs retryable?

Also on the subject of the external travis job, what determines
when it runs? I would expect it to be run always, but if you look
at https://gitlab.com/qemu-project/qemu/-/pipelines
you can see that it didn't get run for the pipeline for
staging commit fc32b91a. It's not just "doesn't run for staging"
because it did run in the pipeline for staging ebd1f710.

-- PMM

