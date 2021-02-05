Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 719B3310AC1
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 12:58:57 +0100 (CET)
Received: from localhost ([::1]:59306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7zlI-00013l-Gw
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 06:58:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7zjS-0008Ul-VT
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 06:57:02 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:33916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7zjR-0003A4-Dk
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 06:57:02 -0500
Received: by mail-ej1-x635.google.com with SMTP id hs11so11598553ejc.1
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 03:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E/It649TNUGLnrkQ3x2eWrdyQch+IfrKT3DNPx2qyzA=;
 b=YiG4D89ZzrDFLRX0nqcdFUMqnsYx9+ajqAFmu6YT7v304Ir/jiYDVAvGOx8xpLXAws
 EIoxRjG5J0qMUNP/0G0uZL13dXvxkTNgz4Vqyh5PU1RcTahHide+o64mBecLNOI34PpL
 tlnndoJdBAP7knbvuc839cdciZiDWgC6x8RTRI17hO7zdBmMnrGMh3U54OTsuCZCajPA
 mCJvjhyW1l5TFOi9nEBTdVcyauSABDOIVewevzLwJ2feO09Ut05HrM7y1aoQFE/UKc4Y
 qZAYkWRIozlI+cCuyuhxS9v9hSx0D5kgV3CJ0k5bbHsuorTWNZ+9xHBqXSQDw+AcmvfA
 DurQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E/It649TNUGLnrkQ3x2eWrdyQch+IfrKT3DNPx2qyzA=;
 b=iz2sE9/7RMl7ChHq3G0HP5UowQYDciHnTqrYyhXAd3NKfpCRtlBb2aTOOJGEKgmfj1
 rjiKFKia4TDjp+q4ULE0IyOg5xeUWnOj3WdSrLTQWuBHanNDcXQQlJvO1k0STDoNw7Uw
 n1/4hKWBYgqNOAnpVAPEHZzVRbfHt2OAf3Iqs4VVJy8oLuFLZjT0+VrI3d3YXQek0lIs
 +H5/Akek7tPePRa/VttpLmdZMeP5zLKOJdmmcyQFwY6q7xyWvUMPQIym/EToJ+F+5jJq
 6H3P6pcS9nGmsWMiybmPCmFkpfycIN1qwDO8AtQdeMdnaCd0KPtm79ikjx/2f0KxWyGn
 LHbg==
X-Gm-Message-State: AOAM530IjxBW2At+NGqPuCplMpvMfdBWZAN5ePmwg0NhzSj2umjTAuO/
 vuUi9PlRUCth/loigB0lMosvNDdMQZgys9oXc0Kzng==
X-Google-Smtp-Source: ABdhPJw2qsgqwnjX6pWFP+sLjuYRhbB4f8p9Ytxvw960uh1CNf9sdlSTCdmLbBbrjU6pfdFRzpZf98RNW71tnuP1Y2k=
X-Received: by 2002:a17:906:3a89:: with SMTP id y9mr3680283ejd.4.1612526219897; 
 Fri, 05 Feb 2021 03:56:59 -0800 (PST)
MIME-Version: 1.0
References: <20210205065620.1726554-1-kraxel@redhat.com>
In-Reply-To: <20210205065620.1726554-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Feb 2021 11:56:48 +0000
Message-ID: <CAFEAcA-QG8GTUywiOTthEZHKMaoTbFoOVN2EkZY=a_2ynWM2bQ@mail.gmail.com>
Subject: Re: [PULL 00/24] Vga ui 20210205 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 5 Feb 2021 at 06:58, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit db754f8ccaf2f073c9aed46a4389e9c0c2080399:
>
>   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210202' in=
> to staging (2021-02-03 19:35:57 +0000)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/vga-ui-20210205-pull-request
>
> for you to fetch changes up to 73240f104dd0169b0637e46fae3c2c39cdfb2eb9:
>
>   tests: add some virtio-gpu & vhost-user-gpu acceptance test (2021-02-04 15:=
> 58:54 +0100)
>
> ----------------------------------------------------------------
> ui+virtio-gpu: opengl cleanups and fixes.
> qxl+spice: bugfixes
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

