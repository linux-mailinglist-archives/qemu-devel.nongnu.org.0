Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5559F646D31
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 11:40:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3EJd-0007Cb-R4; Thu, 08 Dec 2022 05:39:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p3EJb-00076u-FE
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 05:39:43 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p3EJZ-0007I6-Pw
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 05:39:43 -0500
Received: by mail-pl1-x630.google.com with SMTP id k7so1127995pll.6
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 02:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nskHl7+K6BtZKNa7qSdy1cEcNPFiJFqQD/AOZByUGU0=;
 b=L5g6dNtWdHquk1CrAW3jqkQCFUqb/V8MQppI03+YIWJXP9oEQj1AyTOnvz7egDOvq4
 OflCKgzdC6F7Q3ngMFTKocv4GzU/j9C42z5a+evJ4OMhvIgZB7rlT+c9wrunP+dT2jdU
 kPhnoSoO6lJaGan0Bq/QkStHPgD1IXZtCUf5NNp7eF7i7Pve8cDAxAPw4nAbWsKPJoKQ
 p004tcN5Voozg6ja6i1QMpR22R7Uc7q8WwYEXvzPkVzhYM3vga8EVQ+dJhdFXv/PVI1B
 MiNgImLW8Yu6r7vEbVA7Ms4mPDlGZ21KQJFL5r3R16VxY+nTkmVO38rE7RNGmEGdQe57
 nFQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nskHl7+K6BtZKNa7qSdy1cEcNPFiJFqQD/AOZByUGU0=;
 b=vh7GU/AVtEmnk9rf1wnPRn+xY6gbJsCvRFiH09Yr2Uy2bSZuleUkZ7+R2kHloQmgzQ
 3Om6/mTVoYP+Nr/G9/CFotwhgn+uxlP4s2+dJR0WZKXACvsJT5BYeU76G6kSHqDtQcDg
 lgUbPCqrK8owAnL1ThvTk3fG+HrafRj0eB98sZkn/0tG03hqzuCrJrDOcUpSpFAgPovv
 vEwqQujrTF3BGmwXcR8WQAg6UqGZXxmu14OkOpbsYW+jKqmA3APqp35OMCpLYxX5U7nE
 EogmmGvpLU+22zHsDxxQseGSW1XeNkRx0NKUy2jtdhX3Zi2BpWEIqEyXn6W+yi3nX1gO
 HRcA==
X-Gm-Message-State: ANoB5pnkI90rVeX06KC0b3+zfAuTta7Jvhgsb8BmfWBidNA8Zv8nstfy
 agSrEEMAGv5U8PrUdw72l/n5C6TCCLn9wSDSTVVFRg==
X-Google-Smtp-Source: AA0mqf7nR+4Kbp3+0QxYERgeIz6zowHmezlyuukig2xCXmMo5bPMrkL27X2z0f9wffzrvjYW7bKnqoyuU6GiVIV5U3U=
X-Received: by 2002:a17:902:70c5:b0:189:b0a3:cf4a with SMTP id
 l5-20020a17090270c500b00189b0a3cf4amr34565105plt.60.1670495980399; Thu, 08
 Dec 2022 02:39:40 -0800 (PST)
MIME-Version: 1.0
References: <20210112165750.30475-1-peter.maydell@linaro.org>
 <20210112165750.30475-12-peter.maydell@linaro.org>
 <f418a280-a0c1-0df6-0a8e-b8f8a9eeab49@weilnetz.de>
In-Reply-To: <f418a280-a0c1-0df6-0a8e-b8f8a9eeab49@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Dec 2022 10:39:29 +0000
Message-ID: <CAFEAcA9bDG99C+q8oLD4cyB+xihLbC=k9G7UMVMxBriD_nMxkw@mail.gmail.com>
Subject: Re: [PULL 11/21] docs: Build and install all the docs in a single
 manual
To: Stefan Weil <sw@weilnetz.de>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Thu, 8 Dec 2022 at 06:55, Stefan Weil <sw@weilnetz.de> wrote:
>
> Am 12.01.21 um 17:57 schrieb Peter Maydell:
> [...]
> > diff --git a/docs/meson.build b/docs/meson.build

> > +  sphinxdocs += this_manual
> > +  install_subdir(output_dir, install_dir: qemu_docdir, strip_directory: true)
>
> This line causes a build warning with the latest code:
>
> ../../../docs/meson.build:74: WARNING: Project targets '>=0.61.3' but
> uses feature deprecated since '0.60.0': install_subdir with empty
> directory. It worked by accident and is buggy. Use install_emptydir instead.
>
> It looks like `qemu_docdir` is no longer defined anywhere.

It's defined by the top-level meson.build, in line 39:

qemu_docdir = get_option('docdir') / get_option('qemu_suffix')

The warning from meson is not about the value of install_dir,
though : it's saying "the directory you asked me to install from
the build tree doesn't exist, I'm going to create an empty
subdirectory in the install destination, but there's better ways
to do that if that's what you were intending to do". So the
question is why your build tree doesn't have the documentation
built in it -- it should be in $BUILDDIR/docs/manual/ .

thanks
-- PMM

