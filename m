Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B322308DAD
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 20:51:50 +0100 (CET)
Received: from localhost ([::1]:40218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Zo5-0003Z1-FZ
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 14:51:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5ZmM-0002hf-GT
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 14:50:02 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:40128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5ZmK-0007hi-JE
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 14:50:02 -0500
Received: by mail-ej1-x635.google.com with SMTP id gx5so14679802ejb.7
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 11:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CSKfa+4ZbFwQK62PGx0EfnJOGa7xOJEVEjRRj8l90vQ=;
 b=B+zxqGtYu+SMz9Uppissmxpcups3QbmXrCuHBq+Ajj+rCDpiLaFN1lJTPkrf0eON9X
 HYLEG3j+U76LJwyVxrV2WNAJTxvw7UVbbyTSEBDgDvLEMjnURc/cZGkihAKKIGk+eevn
 7aktsdZ4davbvlPxzlsjclHW7zaEM3PV0aIqks43IzXDPBwIdBJBsgBLBMC4xwQX/Vym
 8fgIKcAf1tolIlVE/qbHekA0fpPOTBQg562g8pkAk9FFTWvzUOYgV+FIQojCchFVHkfd
 /Jajdb4zufCKbJZGKIMXW6Yb1o02WIEGQkXPzHUSdyr/Pzx3TBkyumSQf5Vff7D4WC5t
 DA5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CSKfa+4ZbFwQK62PGx0EfnJOGa7xOJEVEjRRj8l90vQ=;
 b=dm3+RsSMBWwALoKKOA9MwahcRDlQVlKIkrg25Z0lTPj2CM8A2BjyVtPHhxhDjNXdr3
 M/CUTFk9altNUKPxISMKcqZZQ+pTyL5mCg0LqB4F9rEFvg/M93vkY/LwIeh/JdJBhXME
 Wi7dz3BGVLKJ2M5zF/EMAGbFDa71dJInr24i9BUXffQzWHwW0dTcO5mk3PJkVQv/UhK+
 Iw72ospDCYqHm2hmAxvU5CEMb/sr2/x8ce0RVWZkOxiOb0uniT+vd5ngjAwc0JWj8xAc
 DnU2urZD0gmFnQH111tqIJLU6YKs6rc4HGh2CBchOnZ6vIbJkqjKzjZJ3+EQeBK0mWPK
 NQBA==
X-Gm-Message-State: AOAM531bx3bW6I9qKSbXeDe0JER6j/u64SpaCHvBz58qNQbybm3w7598
 ygVuKQqbnynI+YsGTER/TSCI8nh2FMLcdsAngNw0iA==
X-Google-Smtp-Source: ABdhPJws6E1oUTJQRKHqVnYAK16lKcOWPzdXlXBI6bvn9IH5bHcc8bAVlilX71abRgETBMwzeh6nQ1PUyiZoAxknViY=
X-Received: by 2002:a17:906:4002:: with SMTP id
 v2mr6264423ejj.85.1611949798730; 
 Fri, 29 Jan 2021 11:49:58 -0800 (PST)
MIME-Version: 1.0
References: <20210129111814.566629-1-pbonzini@redhat.com>
In-Reply-To: <20210129111814.566629-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 Jan 2021 19:49:47 +0000
Message-ID: <CAFEAcA-CPcVyo2fzUX3sSdMoS6xJbxn7V4AwRFFSB+mU9bGGYQ@mail.gmail.com>
Subject: Re: [PULL 00/36] Misc patches (buildsys, i386, fuzzing) for 2021-01-29
To: Paolo Bonzini <pbonzini@redhat.com>
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 29 Jan 2021 at 11:33, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 0bcd12fb1513bad44f05f2d3a8eef2a99b3077b6:
>
>   Merge remote-tracking branch 'remotes/kevin/tags/for-upstream' into staging (2021-01-28 12:30:30 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 6c52f4644c9c8a18b8495e169e539632a897f135:
>
>   accel/kvm/kvm-all: Fix wrong return code handling in dirty log code (2021-01-29 10:38:38 +0100)
>
> ----------------------------------------------------------------

Fails to build, OSX:

../../subprojects/libslirp/src/slirp.c:131:17: error: unused variable
'old_stat' [-Werror,-Wunused-variable]
    struct stat old_stat;
                ^
../../subprojects/libslirp/src/slirp.c:143:10: error: unused variable
'buff' [-Werror,-Wunused-variable]
    char buff[512];
         ^

thanks
-- PMM

