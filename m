Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5838A37BB70
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 13:07:36 +0200 (CEST)
Received: from localhost ([::1]:39524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgmiF-0003vD-Fh
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 07:07:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgmfd-00029b-HI
 for qemu-devel@nongnu.org; Wed, 12 May 2021 07:04:53 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:43721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgmfb-0004Kw-2m
 for qemu-devel@nongnu.org; Wed, 12 May 2021 07:04:53 -0400
Received: by mail-ed1-x531.google.com with SMTP id s6so26503810edu.10
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 04:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QwT480Ss6qwoth8rc0//EezPFJAIuWXxVMlCKTHHUUw=;
 b=fRbobRCcQYsm3+ror8VqjAmMCH/ECAnG6f8MWPR9PoHHXHUU4qCvB+oRZGLb9ZgEHu
 VAinFX7VrYmwyA0CItrKOrVfi6khW0dh02L40zuEcd/Z90VwFJyFU4oyH1to2RzKFmju
 uWNKOHAKvctP39AAXiWgBwHWn3x+MFNYDdqhUmSbwhy06seBOiFoUCLNKPkV4C3AESqL
 88hllizwRXgay6NT9bY4l3pZ4CfwYyESabSvo2DnicSiSCIuoGyv9Xppg++fuYl31WiH
 3rWXS9UkXK2/Os5LOF8CjUQs3Igt9sBXXwnj9zEvF0EbOHSVJ/glQgswRjoIznE4rUst
 EvsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QwT480Ss6qwoth8rc0//EezPFJAIuWXxVMlCKTHHUUw=;
 b=ObGLv0/QYzaO280BzZMkYy2tzne7ExR3gs9zROjiI25EfNJPpCIvAxI2D+dFSU+5wb
 D1ZcZa69OmVcq8QpN1ccS631tV7QMgjJwIqOmXY3Qip1NFyROoCDMbxXG565XuHF00yz
 yyHc+y6y8R7KjUvXQ5J5dMzMhSLRTgmh+OHyYbLP2YPRFA6GpvMaduTU3hfRKIRvRHta
 Yzjex31NfJXxsT5Q6mzb4v+c+Ka2YV7xwopg7PSCcKRA/8C98aRZx/fcZSZgLKPno9Bi
 8Ez93E+Uwob1S4xzPcfyU3ELl/BDoPKEvy0R0X0AoXwYSC9MWcAaW16giT7hzVrU2K4f
 XVJA==
X-Gm-Message-State: AOAM531J4Du+8gtMl8K76NCMoO1nKaS3OAPlBvD1o8M4ZJm57FOl1Mhh
 Jd3wlQWsGj4k1iT6/m2MzjgNF1nv18oOVUkVu6RprDklGj0=
X-Google-Smtp-Source: ABdhPJz4hGFm7Cg/DlVWC6zWGe4WptPEY/QhB+HWDx7crvwtf+bPkKZyBOKPxphLxnY/y/deLSaC7+U81jf620FaYEI=
X-Received: by 2002:a05:6402:416:: with SMTP id
 q22mr42656067edv.204.1620817489446; 
 Wed, 12 May 2021 04:04:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210510125340.903323-1-anthony.perard@citrix.com>
In-Reply-To: <20210510125340.903323-1-anthony.perard@citrix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 May 2021 12:03:36 +0100
Message-ID: <CAFEAcA_Tu0NMZfVG44MUscDBX5i9Uz5rwqPWn5Gku8zN+T8ZpQ@mail.gmail.com>
Subject: Re: [PULL 0/3] xen queue 2021-05-10
To: Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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

On Mon, 10 May 2021 at 13:53, Anthony PERARD <anthony.perard@citrix.com> wrote:
>
> The following changes since commit 4cc10cae64c51e17844dc4358481c393d7bf1ed4:
>
>   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2021-05-06 18:56:17 +0100)
>
> are available in the Git repository at:
>
>   https://xenbits.xen.org/git-http/people/aperard/qemu-dm.git tags/pull-xen-20210510
>
> for you to fetch changes up to 1898293990702c5601e225dac9afd2402fc46e2d:
>
>   xen-block: Use specific blockdev driver (2021-05-10 13:43:58 +0100)
>
> ----------------------------------------------------------------
> Xen patches
>
> - Avoid mmap race involving Xen's mapcache
> - Fix xenforeignmemory_resource leak at exit
> - Fix xen-block to choose a driver for the disk image when created via
>   xenstore.
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

