Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 949B23DDFE1
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 21:14:47 +0200 (CEST)
Received: from localhost ([::1]:38094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAdOg-0000mb-Gq
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 15:14:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAdNa-0008UK-LQ
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 15:13:38 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:34693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAdNY-0006mC-Pw
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 15:13:38 -0400
Received: by mail-ej1-x62c.google.com with SMTP id cb3so10579412ejb.1
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 12:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yz8njXrci7eKrS/hqYLh+9AD/Ji9VY8VX3KETq6se7I=;
 b=GBoHW3/BV1tYybuCbtdaLJYqIuOLPCP7CVNCMoKiO5maB92lEStDZF4xz9h832CDmo
 C8+mFBEBjREMmQfjpYSgncbJUItUKObwtKMeEJgAXmWnaAK9aCdLfcXE8Y7AKf8ifD9t
 jmXWZzfthxNX16X2fCq8cz6Ag/IUYnROprehuvIdd8wD8jB3QAycKWg5LYqYDRGsbnlS
 2LbrnXwx2fGpCF2DAyiMCszmh8XyMxjWUbIAkyvWGDkQRweL1jt4AnzRox0KHA1jBx3/
 V8PfYO1g9rHm2etyQYiLwh1m6yZ41+/q9EYt+P9YkBrDQhLeJEhfTjMY8QryPWekN6tJ
 baLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yz8njXrci7eKrS/hqYLh+9AD/Ji9VY8VX3KETq6se7I=;
 b=m7xk99RL/SIl3ZnIAuYEix9gb5m4QV6xOGzEIh9rN0mjO5mhYAepW8vkk/ALkNlUnH
 E3/aB6vFIMBfifNgUECR3fbE6fOezsplvTlzUeNy6Ymuc0j3EMkVKSlc4MTW+VSOJWHy
 LoZHRCgL5GsPfgswZtvD5tFvv9uOKwbAEFP/LHFpD4wdHGSvVi/WpKGIr8la8YEK0FeK
 RsHZBBSTVr1fTo4AEOKqgkymW2Lu9hI+o9K+09ZkKIskZfH0vWpIIb3LSWWSqxrjJ88H
 Kw2P0Hd4MLScL8MoWZb0NeW36HfgR61AFEmDPRyU8qhLscZR2AjgtKexDA9+V4Y/eu7x
 uz/w==
X-Gm-Message-State: AOAM533pwvjePtR2u91EDJlH/bUYMc0lPYc5Cv/tu7VqD5oOGYjn7Hn7
 WQ4yoE6kznjPfLZh9OIfWeSVCIdgjeOncD72aKBk4g==
X-Google-Smtp-Source: ABdhPJzdGmY+SIs6gl1dBmHSmTN8txbTP260JxoYmrzoO7vpuhdjwxHuTuSxTtV6l0mD94XYyxcm1naaMtCRSmACLHM=
X-Received: by 2002:a17:906:948f:: with SMTP id
 t15mr16983917ejx.85.1627931614720; 
 Mon, 02 Aug 2021 12:13:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210802161542.381976-1-pbonzini@redhat.com>
In-Reply-To: <20210802161542.381976-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Aug 2021 20:12:51 +0100
Message-ID: <CAFEAcA8_+PnVx2ZwyV6w6juWgAmb439p-w-f9maYz-P-XARQew@mail.gmail.com>
Subject: Re: [PULL 0/8] vl.c, coverity patches for QEMU 6.1-rc2
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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

On Mon, 2 Aug 2021 at 17:18, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 7742fe64e5c2c2c9f9787d107b693eaac602eaae:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/usb-20210729-pull-request' into staging (2021-07-29 18:49:39 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to e17bdaab2b36db54f0214a14f394fa773cee58df:
>
>   coverity-model: write models fully for non-array allocation functions (2021-07-30 12:04:01 +0200)
>
> ----------------------------------------------------------------
> Fix for smp-opts in configuration file.
> Update Coverity model to what's currently uploaded.
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

