Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AB4442F66
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 14:51:16 +0100 (CET)
Received: from localhost ([::1]:51464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhuC2-0004wU-VI
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 09:51:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhu1x-0002dG-El
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:40:49 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:37540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhu1u-0005T1-9M
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:40:49 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 y84-20020a1c7d57000000b00330cb84834fso1980394wmc.2
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 06:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HmdqIW1tBD6moq40VnXoNkrbf+LuTBNMLpXJd/iHMSs=;
 b=UyMmVcnxLPdif2AqHVAaxkcaKiW8bmVqZ8p3yAW+K/bKu+xOUABv6hz0T70SFKvnf+
 7ckk+vm1qvJhgzOlRqzzPST3zHnDr1LeyFxLmyRCGZzGKOzaMf19MnPOf9ooiIQniCWx
 Zhp8dnhl4ziQcfgRoAsZDkRPisK5hG1SwOgjhvhdajsQM4tQwLT02eRT0X88gRYJAMp8
 C8QluFX9GaBDk6xpAtT29p0IwtWniB/5i354ocOOJq+1Tump4szJkgP8Y2oFKuYve/yl
 /71ctfkK81WRq4I4lJao2fT6eD6BVq9XmsRKE6VUUCsX6I0ZdyFK+cs2Vy8Xn+z8Ahn8
 YJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HmdqIW1tBD6moq40VnXoNkrbf+LuTBNMLpXJd/iHMSs=;
 b=JeC5bS7OTt0R4x60fve8Zb7orjtUNvhhv1hviLrCa+cZ0Oe7hVFiY1UVgUbwnD8u4T
 vDX5x2h9wcs7zdtLsKn75U33kyXa7OQNoff1BD5nDJOsLob/1gbm6YxIES+u/K3U+7Sn
 dXNY27vkQm1p2+H9gMPqPNhsCNNMoY3ooUg8xBM0AEFTSMBVcg6FqpIu5q1u75PC2L0a
 iqpjtbDoy4PHhA1QJzxr2fjRsbQcYt0lSZnU1WTrk09Z5wIo4AMmXLJjXBSexRue88jG
 Cf54V6S7TcRf9nIlABQJiRClCGi2GE9r3NOuwuhPdZs1qSlZy3MoQFPF0aaNSQHm+Rwx
 +qZQ==
X-Gm-Message-State: AOAM531Ii8S/poDQfGHrUIpn/ZsGPiY8KDAbNxjjNkX5VftpgDQjE0Gz
 7ee1+VcXW2QEkLep1joK5vZWd70EDMILeIaa+MajKdH10f0=
X-Google-Smtp-Source: ABdhPJyms93olYKhNEkrhSGxstkF53eF3xItuthRpbgG98tQkCnAKTzuxMMJZO02ryIjl7333rfC+2JwqyuvtfavyNo=
X-Received: by 2002:a05:600c:198d:: with SMTP id
 t13mr7261061wmq.21.1635860440154; 
 Tue, 02 Nov 2021 06:40:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA9ha4G=AC3p9LKJRC87DkgHVqbrX3X8RPg7vVR_F1Kt1Q@mail.gmail.com>
In-Reply-To: <CAFEAcA9ha4G=AC3p9LKJRC87DkgHVqbrX3X8RPg7vVR_F1Kt1Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Nov 2021 13:40:29 +0000
Message-ID: <CAFEAcA8nF-kDMBwt0EL__Yvk3FZ-z-BwDYxL3ndX2CzrrvkWKQ@mail.gmail.com>
Subject: Re: more bogus meson warnings
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2 Nov 2021 at 13:38, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> I tried my static-system build config today; meson bogus
> complaints include:
>
> WARNING: Static library 'pulse' not found for dependency 'libpulse',
> may not be statically linked
> WARNING: Static library 'pulsecommon-11.1' not found for dependency
> 'libpulse', may not be statically linked
> WARNING: Static library 'asound' not found for dependency 'alsa', may
> not be statically linked

...also this configure passed "--audio-drv-list=" so we
shouldn't be probing for pulse or asound at all.

The resulting build fails at link time because meson is
incorrectly trying to link dynamic libraries into a static
executable.

-- PMM

