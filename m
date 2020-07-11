Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A954D21C452
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jul 2020 14:57:03 +0200 (CEST)
Received: from localhost ([::1]:57566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1juF3u-0002cE-Cw
	for lists+qemu-devel@lfdr.de; Sat, 11 Jul 2020 08:57:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1juF30-0002CV-I1
 for qemu-devel@nongnu.org; Sat, 11 Jul 2020 08:56:06 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:34959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1juF2y-0001pt-LM
 for qemu-devel@nongnu.org; Sat, 11 Jul 2020 08:56:06 -0400
Received: by mail-oi1-x244.google.com with SMTP id k4so7174892oik.2
 for <qemu-devel@nongnu.org>; Sat, 11 Jul 2020 05:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZJPg5Z17FH5U4t1yYW3GccHBuPKfLMJ9juMKvsmQKRc=;
 b=TD5usMerr0CZZbE6FYYXy57WpYl14OxN3GSNzztQeRtXb57HsdHrM9jPrWHHYO9neN
 u66aftFK6vM0e+GY+nH6KtwO76kkkjApd14zfIBSH/aRmNVPHEEqbq/1vOozPWWE8vae
 GLTmTKSLl6edVDqoVS+Jygl+GNXGYfmWJiGTppTDhOaNGBl7I4bOHrGGzADxJ4flRP3g
 03IN6UaDZNXL5sJkHlXGCNbc+Is0cL2oFZw0E903zCVjZ8VnnZu1U6mV+q4Gtjcm1c3P
 fwCIIaIkayV9J8yGEINVLtGwMVw2S8GfiAby7HqnUAIHwsePciYx4Ti/QjwvM4tHd/8O
 8SjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZJPg5Z17FH5U4t1yYW3GccHBuPKfLMJ9juMKvsmQKRc=;
 b=j8kCNTsNE92BUtQb92G/FWsbocE8SAno6p2MHkcNiGiN4H8/SChCODWZJMl1jrqwJq
 OJHb6sISSmcxwW21N1NKfXjknMA8ADg0bkFDYiwCfOF/zTpiXzes1UjHUHPhRS63QgJy
 Oe0UYV598flhaCbI7ACwa+11nLC/oKBoeC5f50TkyckaGNFtOYIA5PvoT9eQrlXy3InC
 thDXItyUX6ITz1qaSoJVTAX6D2bKLbdJrCN8SV1+13sFVuFvGlomtu2lym2nNFMhTQ7b
 drChw4wdV/GY5Xi0cpWUXfgeia/yGq887B1yUpgaLI8WJFc6kxXs061m8XJ35s1KsshR
 T8VA==
X-Gm-Message-State: AOAM532N3XlZz2BUwt7Wximq8lDxJCzdETpwDnyh5i+0YPfxI4bhX4P6
 Ohw92UoEf7aa2MxHiIW8gxgruH/SNZe5P+YRhH5Iyg==
X-Google-Smtp-Source: ABdhPJwyHOlSIt7lPsFQJWP8+0+bhb7cq6MkiH/bnZA8+KHHEvHi5LaZlerdvLprIR4y74TWttDzMoIP1BEBzEmstLk=
X-Received: by 2002:aca:1706:: with SMTP id j6mr7402065oii.146.1594472161790; 
 Sat, 11 Jul 2020 05:56:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200709230330.236699-1-mst@redhat.com>
In-Reply-To: <20200709230330.236699-1-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 11 Jul 2020 13:55:50 +0100
Message-ID: <CAFEAcA9Da5235XtGEzrSkXgVrO65kvrBO4ysruXuAkezyb9w_Q@mail.gmail.com>
Subject: Re: [PULL 0/1] virtio: bugfix
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x244.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

On Fri, 10 Jul 2020 at 00:04, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> Fixes a single bug in vdpa.
>
> The following changes since commit eb2c66b10efd2b914b56b20ae90655914310c925:
>
>   Merge remote-tracking branch 'remotes/maxreitz/tags/pull-block-2020-07-06' into staging (2020-07-07 19:47:26 +0100)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
>
> for you to fetch changes up to 4dc5acc07e88b2776513db75944f2e240116ebda:
>
>   vhost-vdpa: fix the compile issue without kvm (2020-07-08 06:16:48 -0400)
>
> ----------------------------------------------------------------
> virtio: bugfix
>
> fixes vdpa on non-kvm platforms
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.1
for any user-visible changes.

-- PMM

