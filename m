Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C95D81F6F24
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jun 2020 23:05:58 +0200 (CEST)
Received: from localhost ([::1]:57270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjUOb-0001P7-OB
	for lists+qemu-devel@lfdr.de; Thu, 11 Jun 2020 17:05:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jjTfh-0004hX-MG
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 16:19:33 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:36754)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jjTff-0000P0-O9
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 16:19:33 -0400
Received: by mail-oi1-x236.google.com with SMTP id a137so6639133oii.3
 for <qemu-devel@nongnu.org>; Thu, 11 Jun 2020 13:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UO9jNOJcrGLnu+xPTHjw7Zicxd2c3/XqSzYAC5XnoWw=;
 b=MSj0SWr/OOt5XNgFLUvUPWp4S8wFozrxCwdAWVZ+QKo5ZXiJP4We0MPW5lz0Wlg2nT
 Xx2tQ2qKKm8YnP+OdU1vr+frXjfTyVIAikx3nSBzuINEFb4h0wV7xYhXagyk0/4rjbPI
 zfICrgWTYwtJpFlDtJKGBfbYj2f9TfqnecpF0joV/syGlcfU34fTqgfeYrVnKl09vDSf
 I3TBtBxuqFwLX/vHKQCw9hh9X06Wh2ywwPG7wVsOc24v5Q4QoTqrcCUDxIAtPv8L7Je4
 dETvBIWZKJC3gZ5piEXwAVK1W+71LTzwMPt59oUIXuXEkRBhY0ryYpQlOVYmk8WKIAmS
 +YUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UO9jNOJcrGLnu+xPTHjw7Zicxd2c3/XqSzYAC5XnoWw=;
 b=RG1ReMX3HKom+K7BfrPQRqwUXvnC0E09i27/Gq9ZRQgwIY9rfcmwGjFXBEVi7cjYol
 2FFGxdVEy6WIoQJ0h63v/5vKgfPO3z687gRZFIfnwzND8+KsL9C9O7+RMY2WMtU3D/O6
 S1dLN7HH9VEUrD/g0+VuK5rrqBvTcukpWp1uWxG7ok37hZ+4xC+YgEWR8xCD1nlRkj4j
 yh1EHu7cY99ijt6o59KuYCWkbfvHXl/gjaW2fT2GtUUIwVOcpUcDTq8juRub+YqqRklG
 oS5I2QX/wZNS3gCDfHJFqsjdbtxz1ZpjQEdV91w6Mj3bI7x6xJMzmn6fx8XWL5SnLxII
 DXMg==
X-Gm-Message-State: AOAM531YGWNwh6Z8MTCeHtVhkQlhNTZCeu0vL3rQQN3Kr5E3WBt3aDbv
 5BnbV4PN8HR5Fr//rsh5U3KokWgmoDeWLZ3+fPCIquSp5P8=
X-Google-Smtp-Source: ABdhPJx0m7+dZFlC528Ymb3jrxHICqoq85DWCjkNpo1qhJVNgJhpZwcV6sYdV9uyf6RhhEcLemAgWwmgy8NpYmyRBww=
X-Received: by 2002:aca:5152:: with SMTP id f79mr7464387oib.146.1591906762767; 
 Thu, 11 Jun 2020 13:19:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200610131011.1941209-1-laurent@vivier.eu>
In-Reply-To: <20200610131011.1941209-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Jun 2020 21:19:11 +0100
Message-ID: <CAFEAcA9TJAKR+FWNt6P3J9B70dK2LyhUY4m8dkvKz3LxGYAy5g@mail.gmail.com>
Subject: Re: [PULL v2 00/16] Trivial branch for 5.1 patches
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x236.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 10 Jun 2020 at 14:12, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 49ee11555262a256afec592dfed7c5902d5eefd2:
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-5.1-pull-=
> request' into staging (2020-06-08 11:04:57 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-branch-for-5.1-pull-request
>
> for you to fetch changes up to fe18e6eecdd45d3dff0c8968cbb07c5e02fbe4c8:
>
>   semihosting: remove the pthread include which seems unused (2020-06-10 11:2=
> 9:44 +0200)
>
> ----------------------------------------------------------------
> Trivial branch pull request 20200610
>
> Convert DPRINTF() to traces or qemu_logs
> Use IEC binary prefix definitions
> Use qemu_semihosting_log_out() in target/unicore32
> Some code and doc cleanup


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.1
for any user-visible changes.

-- PMM

