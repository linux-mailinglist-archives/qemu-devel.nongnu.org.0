Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 172C63FFFAD
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 14:21:27 +0200 (CEST)
Received: from localhost ([::1]:58086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM8CE-0002VV-4g
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 08:21:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mM80F-0004mQ-J5
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 08:09:03 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:37666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mM80D-000888-OW
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 08:09:03 -0400
Received: by mail-wr1-x431.google.com with SMTP id v10so7917874wrd.4
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 05:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YNUA35scmRz44wy1b0yJMqLDlBcu9KvJh28xgeE+Ar8=;
 b=ZCDRG75dqdX0+Yf0Wp+y0C86cjZvCbrQEH2oVh2r6367BMYo66Wfg2KKpgsveoxsKl
 0tOPbUOMTDj3jIxEXRzp2tGyiCD1uKObBDZ/Y9FREzlfm+M2MAltU2dS8oQRiFekZ1G1
 YsElzwvdUk01rQOBEYxPdm9XYEsYmq5z+9lmGvtwAUPEA/0kk78bvkfXSGTrasrVYygn
 kBWmzd+j3iVEm3LyR5f+RlAPFg4o4TYdbOkW5Kbd8HLiB9pFpNj1x7EhvFWxbLrxFAPF
 HDeYiXEl8uXDK+8gsAe+o4LtGS2Sz0xzhtzs9BEq6B3OrMMIiZA4p6spfdE556HHs1uv
 DXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YNUA35scmRz44wy1b0yJMqLDlBcu9KvJh28xgeE+Ar8=;
 b=gbeCoys8jBZoMLbLWMiBeCdZMttDKMENqFzzNLv+Ya6FkxZ5GqPsv/oIpLiQpleaf1
 E3c7rwAoBfSOVhahL0FY3ya8I+ga+q0bs/GtZ1EfuhU9CxJ9rQQwCF2JvIryXZ73xh1g
 0nUBDAwSH9ZMwh6hXX3CG1xX2ph9z1H4/BNhCv4+jdBZRr4tKbif/ZPcdZhzVdPMjHme
 WSmKFhTQrhr4ulZu0cPmnW3/gmSEQ3e1V7XBBuctm08a++OOQWEJ3kA3kYj1/wswDqgJ
 loYfGkog/cHFI91y9kGqqkjslol907Dj9f25kjY3lBTGfzs3/tiWM6/erAOSrMTZe9z6
 wZGQ==
X-Gm-Message-State: AOAM5326/wzrNaXO3e0rqfOggLL7g2tyTh+fOE6F3lJ+NWwEvXW8YRDt
 GvgUFvA9gkcvMYENA4TCEQ8YlvP5y936BtPzTTt+uQ==
X-Google-Smtp-Source: ABdhPJwsDjn+VkRxDq53FxES0P4obicCUU1Xh/ZdyEaJfLcyWwHuSL62AqUely6VYiJWWTkljNPF3AaXrrbCXS6vkN4=
X-Received: by 2002:adf:fb91:: with SMTP id a17mr3557733wrr.376.1630670940101; 
 Fri, 03 Sep 2021 05:09:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1630582967.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1630582967.git.qemu_oss@crudebyte.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Sep 2021 13:08:11 +0100
Message-ID: <CAFEAcA_wooFNOKedfUN1nkb+yQ23kzj1bmY5Y5UYSkS7tMHEaA@mail.gmail.com>
Subject: Re: [PULL 0/3] 9p queue 2021-09-02
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2 Sept 2021 at 12:50, Christian Schoenebeck
<qemu_oss@crudebyte.com> wrote:
>
> The following changes since commit 59a89510b62ec23dbeab8b02fa4e3526e353d8b6:
>
>   Merge remote-tracking branch 'remotes/stefanberger/tags/pull-tpm-2021-09-01-1' into staging (2021-09-02 08:51:31 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/cschoenebeck/qemu.git tags/pull-9p-20210902
>
> for you to fetch changes up to f83df00900816476cca41bb536e4d532b297d76e:
>
>   9pfs: fix crash in v9fs_walk() (2021-09-02 13:26:22 +0200)
>
> ----------------------------------------------------------------
> 9pfs: misc patches
>
> * Fix an occasional crash when handling 'Twalk' requests.
>
> * Two code cleanup patches.
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM

