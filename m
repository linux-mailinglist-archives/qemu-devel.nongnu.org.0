Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0FC2E83BF
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jan 2021 13:54:58 +0100 (CET)
Received: from localhost ([::1]:59898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvJxJ-0001q4-DI
	for lists+qemu-devel@lfdr.de; Fri, 01 Jan 2021 07:54:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kvJw8-0001Gx-To
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 07:53:44 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:40750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kvJw7-0002Zc-6D
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 07:53:44 -0500
Received: by mail-ed1-x52e.google.com with SMTP id h16so20173596edt.7
 for <qemu-devel@nongnu.org>; Fri, 01 Jan 2021 04:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hx7TVQu3scBjCHKARvK9jiq4AiaXm4ARmrtn0bg5il8=;
 b=ILCohCzUumsw53xgjY3OgNX/G+77Tuwz87UW4Jhf+ZD+Ok98nu0LK3YHAkUTdkqVR2
 +h9wmwT3DkxVKEpu74viU51ximT5XqPbqqC577n2KHOm7VeRAjU4tjWsFW8x6hVuUblZ
 F1bAEeZc4QTS2Ct/tH7XsfSuw7tuPH1jU9eP31aY+grta4jlJYKx66H7dGk8I4dAaNCG
 3/agQlcf/TBi4f1iglT+VEwjSnKTO2oxD9TNF8NuEaW1Oq7rC3/A9uuNRuH0i0vahYFD
 UoLsZg1DyaOnuDSjDAKuKk+nyFerZI9XyW+0ajiBNwm2BOm/ok9cct/SiZxyn9JeOSQU
 z3rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hx7TVQu3scBjCHKARvK9jiq4AiaXm4ARmrtn0bg5il8=;
 b=N/fpKLQmzsnnmToeRcJrYWOQgPqMcLbF+jlnMBPjX7CjDuuCw0QI1tofiRzH2Eal+7
 hLeW5Td+D6x+orjHpvIudz57UBQB+tzITuWkujoN7eVSpjlFgozUZuYOx3mzsPtdOwqb
 DEX+PgPI/hnQoJJFx9Tql6C2r1NJBP0H7hfKz0n7HEnteRq5xmmA0AUqkc4u9z6Jkjxj
 fvPXAJCvDwLGvi+4Ctk0eY5jc04/bSzbFVg5I2M9dEaLaAlxrA+bNdsnCHQ1g1c3mdtP
 8DdY3zvrLgzAPUuh7dWzaVs9W/v72dB0wu910eko3W1WrDUp4Np9R6qpQUJQzud5xJqj
 9l5Q==
X-Gm-Message-State: AOAM533bY0vonIkw3Ap+kZYwEmQM9L+k+zwjjP1Ube4DeXUQBQu/w/kG
 6mGs+eP/9NNrXE1eUMOGOSKBnNXaI58f8lSR+yqsLA==
X-Google-Smtp-Source: ABdhPJzMFB7flNGQMtCOHG7CiW6MDHKJfiVo7b+8K+hAhuSuYJP4sdoNBmfwYgxqBRuMVp6FyXxv+nPXFBYMcyiFtZo=
X-Received: by 2002:aa7:c353:: with SMTP id j19mr59330892edr.204.1609505621480; 
 Fri, 01 Jan 2021 04:53:41 -0800 (PST)
MIME-Version: 1.0
References: <20201218151249.715731-1-mreitz@redhat.com>
In-Reply-To: <20201218151249.715731-1-mreitz@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Jan 2021 12:53:30 +0000
Message-ID: <CAFEAcA_eUo51Fu8q3m5E7oY_-RWeVNgm1V0ZcJZFGyjCVJ8TVA@mail.gmail.com>
Subject: Re: [PULL 00/30] Block patches
To: Max Reitz <mreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 18 Dec 2020 at 15:12, Max Reitz <mreitz@redhat.com> wrote:
>
> The following changes since commit 75ee62ac606bfc9eb59310b9446df3434bf6e8c2:
>
>   Merge remote-tracking branch 'remotes/ehabkost-gl/tags/x86-next-pull-request' into staging (2020-12-17 18:53:36 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/XanClic/qemu.git tags/pull-block-2020-12-18
>
> for you to fetch changes up to 0e72078128229bf9efb542e396ab44bf91b91340:
>
>   iotests: Fix _send_qemu_cmd with bash 5.1 (2020-12-18 12:47:38 +0100)
>
> ----------------------------------------------------------------
> Block patches:
> - New block filter: preallocate (which, on writes beyond an image file's
>   end, allocates big chunks of data so that such post-EOF writes will
>   occur less frequently)
> - write-zeroes and block-status support for Quorum
> - Implementation of truncate for the nvme block driver similarly to the
>   existing implementations for host block devices and iscsi devices
> - Block layer refactoring: Drop the tighten_restrictions concept in the
>   block permission functions
> - iotest fixes


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

