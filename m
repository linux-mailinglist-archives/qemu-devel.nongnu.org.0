Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAA7401068
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 16:51:02 +0200 (CEST)
Received: from localhost ([::1]:38786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMtU5-0004um-66
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 10:51:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mMtRw-00049Z-N1
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 10:48:48 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:33386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mMtRr-0005NP-DH
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 10:48:48 -0400
Received: by mail-wr1-x434.google.com with SMTP id b10so5910047wru.0
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 07:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MXpRvpdbFcz8E6EXOmEVhnKDpBtpnYf8KdUDDcHQ/cw=;
 b=M4fKuCra9OW7wc7KM9UTKp5g1VrhS/iuyB6MD5p5MxUgG/Un+Wm1O3GK+HIY9XtGPm
 youFeuuvi2inkOAGvEJxfjt56ff1WulNFnV0vz5E1pCMDQE3Tmu7aXcX+S8/kvjRLQ8H
 9gKPCvTNIOr6wzWjYo0ZXrJdOKx07cy1Bs0LvlbfrQq08pCHPSJJG2mqJtcc+zU8EyAS
 sEdCMA8tE+ojQ7aFVT3aTDwKh2bTQoo1FresddjUoQhmLh+zG6BcqnMJKwngnBxyNEmi
 06tU6+Xw42mRuB45tLoZwVh+S8RIoWN+Qbu8dT8+reSs/foisJqL2dTzuEMkqGWjXuAT
 JEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MXpRvpdbFcz8E6EXOmEVhnKDpBtpnYf8KdUDDcHQ/cw=;
 b=kzlsMV/lI6NXzVc6msboYVoYn6+Y2JW5xOF6vafBvcUbIB+cHgtyxo1YBS9/90k8Xz
 bOSJYA4872wHLoyc0vY/B6xAqU7414HiPA2F4hrSRjScXwCEMzh/r8PX8wqR58Q3ko6a
 3NEsEpth0H8cThzC11+QU2oBUZoqBjDFLjgsfhVdpLMUHLQQB3GcBIy1F0x8OzhHGfBO
 RraYwGiLMPqLwD65mjogWXJjjB/neOSFvJGRHlcyY8v7WxOjsqKgBt/FH8mhHO8eOwFX
 WGhcMOFGLlA4smtcfJPObDK1U2q3FtXpfPDH9BJJLaoLt/lfScXNFM7seJFvIXUSVypz
 Gsaw==
X-Gm-Message-State: AOAM5331/7Y9xB+xzrM3j27sQgayEyYzNcIE+Zvk70MHLmsgVEAIbUJw
 YgURGGFeK8ZJO3U+fbbnwwkw5W5Qai5DFK8Osj7c1w==
X-Google-Smtp-Source: ABdhPJzbTg+kxDpe/shy9tI4QrC8qbswhq/r+XEn61PMKtMaurTvEo2MSqP8F9iBKvgXc1bTtNpqTXwcSKP39c8hLhw=
X-Received: by 2002:a5d:4a08:: with SMTP id m8mr8558922wrq.263.1630853321752; 
 Sun, 05 Sep 2021 07:48:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210903193209.1426791-1-armbru@redhat.com>
In-Reply-To: <20210903193209.1426791-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 5 Sep 2021 15:47:53 +0100
Message-ID: <CAFEAcA_+OPL7PTMu8Qtx3pyz7c0SGCjU+0gq3+TuE4hV2tAtRw@mail.gmail.com>
Subject: Re: [PULL 00/13] QAPI patches patches for 2021-09-03
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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

On Fri, 3 Sept 2021 at 20:32, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit 8880cc4362fde4ecdac0b2092318893118206fcf:
>
>   Merge remote-tracking branch 'remotes/cschoenebeck/tags/pull-9p-20210902' into staging (2021-09-03 08:27:38 +0100)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2021-09-03
>
> for you to fetch changes up to 34f7b25e575a93182b7c0a3558caac34e26227cf:
>
>   qapi: Tweak error messages for unknown / conflicting 'if' keys (2021-09-03 17:09:10 +0200)
>
> ----------------------------------------------------------------
> QAPI patches patches for 2021-09-03
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM

