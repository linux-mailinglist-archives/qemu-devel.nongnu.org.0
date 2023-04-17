Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 328D96E499E
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 15:14:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poOgI-0007y1-Jy; Mon, 17 Apr 2023 09:14:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1poOfz-0007uA-SJ
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 09:13:47 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1poOfy-0007Wt-6R
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 09:13:47 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-94f6c285d92so68446366b.3
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 06:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681737224; x=1684329224;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dgsZ7aFsbSlke3ByoJnweY/9ylVMudlzWGIoB2zV8tc=;
 b=mIKMJ3dpaFgK4Ul1ugyPSk3JS3QvE0TJefBL0VpXowD4j1aBEOQEzbUoFM5NH9oJEy
 IrdvzKpk5QqienlC/aXTDHiYCEJeIzW+YXV95H/YT7LR+BbODhI+AfibTXAFG0aLXYpA
 Zvgmg2pyaFCWqtEf8wr2EuB9KNL/+ylNwRB3BYftUuhqqZCcLzuouB98BupGjIqA7caw
 DaDaccqPSOpsC0Kte9a8D+6LiA+XW32uJ1HWLdWao/KxA41PmmN3Svm77gxpEj8JJ7eR
 S6aeMcCUVhDxMLqwJ8/07ltwah7hsdR08mXmJSfj+/1r0o5I0bAy5qxY6Pr89qRxADQ3
 DOew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681737224; x=1684329224;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dgsZ7aFsbSlke3ByoJnweY/9ylVMudlzWGIoB2zV8tc=;
 b=fyRqvs2i2gTd8y/KE86HXEbVyA2WZgPgwaF8VyCtoovAMSemwuf3GBO19KVnB0Maxn
 Uw0IJNI5BqRfdwhwb9zIQsIgZtMyU3qt9fPU9brcBoLqu+3jHdnRqyFYOZiikiEpYzJw
 Dt+LiK2HRB+S3EjFaflv+rg22bBvy/JxPuZKVdX3rfjPRw5eux4Oz0EKeexga+vQNkBQ
 rKpIdkf0BOPG7i7yQof4f7vWrACawot5ulh8MbThoO6xLZozF8B4y2DSp/I5GkUDqrMF
 j8lEe/UB2DVetBiRNgtb8sGNXoP/jTzOhXBIulCPDnrduW+pWIJRZrNgQO2goFHLGFuL
 8MOQ==
X-Gm-Message-State: AAQBX9fSWlhCLE9sXa6LkZcldHYYOqvut2wE13JsCYcWmVyhbrugDA3U
 B7Lsuwy4PSu6467xSrCBUWrkPlP76t1h8CinAJ1Ecw==
X-Google-Smtp-Source: AKy350YR7QI/eRZ56IViIek3BomT+GHOpq6i9j7DaU6htSfP+lks4Dfurg1edcNATTO70Fbp3jWBlI7duV46DyZc3os=
X-Received: by 2002:a50:d75b:0:b0:506:8d91:89c4 with SMTP id
 i27-20020a50d75b000000b005068d9189c4mr4158286edj.6.1681737224077; Mon, 17 Apr
 2023 06:13:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230417130037.236747-1-thuth@redhat.com>
 <20230417130037.236747-3-thuth@redhat.com>
In-Reply-To: <20230417130037.236747-3-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Apr 2023 14:13:32 +0100
Message-ID: <CAFEAcA_0SMOsHtLxO84OA==B9EH5LcAAPcYFO_jKU7G0DnYDBw@mail.gmail.com>
Subject: Re: [PATCH 2/2] meson_options.txt: Enable qom-cast-debug by default
 again
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, 
 Jonathan Cameron <jonathan.cameron@huawei.com>, Fan Ni <fan.ni@samsung.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 17 Apr 2023 at 14:00, Thomas Huth <thuth@redhat.com> wrote:
>
> This switch had been disabled by default by accident in commit
> c55cf6ab03f. But we should enable it by default instead to avoid
> regressions in the QOM device hierarchy.
>
> Fixes: c55cf6ab03 ("configure, meson: move some default-disabled options to meson_options.txt")
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  meson_options.txt             | 2 +-
>  scripts/meson-buildoptions.sh | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

