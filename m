Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2F1612A22
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 11:33:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1op5cA-0003W5-Sq; Sun, 30 Oct 2022 06:32:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1op5c6-0003UF-T9
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 06:32:24 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1op5c4-0005TG-OT
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 06:32:22 -0400
Received: by mail-pl1-x633.google.com with SMTP id d24so8466746pls.4
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 03:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DYdQx8QtpSWUP6nQTSR73oYUnnZqxGIsKjjT01+1nnc=;
 b=YNJBhfxpty+GHgVkrpkTc8kEZIY2d32nkmb9OUnFnIwFtJ+YpC8HSiBTSE855J1HWH
 nycfwnw2sskMp+XRbpDh4oPg2RkWmVcHEj+ElV6nW+F79o/ztnVy1MnI3kRsTtMfR097
 QU26645BFdNWGxduGZNqM/w2vTWu3l9r/aM6YGkNDhV+sIWJO8Av2aIblhHo15HQIMXG
 FdhOr+yYVKmBk2q5vqyqj2t7xaUzPSw44l8OZElCfKiKmy4rdHBfkibnReiB9RAQWLoT
 LbciNRw8axenFj9NldJtE3gmlAAViZf1kQ1rTqg+BoSmc8oK+lc7HL5KLZwScz/9/W1U
 BzoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DYdQx8QtpSWUP6nQTSR73oYUnnZqxGIsKjjT01+1nnc=;
 b=pc9oYSEltPZD8Uxp89aPgj97dF3Tu0h6MrywWXua/QyCkSL2g7RtkS7UqJfjpN7Ar+
 a3dF6VckA/Zd6ttIM2yvYQbzmC8NChweA26D5wDIZ9G0gWKSrBM6jQvZyITc2y3ffRQ9
 Ek79TLngiv3J94dhe73guwAxhlwxAI+kroqkNbDuqmL1ZGcCfv77Kw+9LfEbU4upyWVr
 bVGm/4WXbluWIttWt6uyC5R/mm7gosxGibtq0AfCwOXQYHkA0iCrzsu5hzNIK240g1e4
 bjIiF25L53wy+0UOxKawqr9zgNo3wD9xVIX5o8feqYGZkLy4g8V2qHhPdZytCT6K6RyZ
 tbUQ==
X-Gm-Message-State: ACrzQf3t/8RqbrivdrgfaxYQhbHHoIQSMoMWs+jVOqz3zNC3qM0x0YR+
 6+fuji24SIrs4qcWubdJW0cteO+C5dUeFDuKpVHTzw==
X-Google-Smtp-Source: AMsMyM4athiYjaZ1ylDer/UFyWeEUXUUevkBK9/k0HFMgosJLWIoqgghNbz4jBdBvyKcZLFA1xRzbMXGW/mpNC3D17c=
X-Received: by 2002:a17:90b:4b81:b0:213:341d:3ea6 with SMTP id
 lr1-20020a17090b4b8100b00213341d3ea6mr9040937pjb.19.1667125938638; Sun, 30
 Oct 2022 03:32:18 -0700 (PDT)
MIME-Version: 1.0
References: <20221029172515.217264-1-sw@weilnetz.de>
In-Reply-To: <20221029172515.217264-1-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 30 Oct 2022 10:32:07 +0000
Message-ID: <CAFEAcA9Z7T=m3WsHs8S8_PtUrzO+pr=SXpvmNPbCVYyFgg3b8w@mail.gmail.com>
Subject: Re: [PATCH] Fix some typos in documentation and comments
To: Stefan Weil <sw@weilnetz.de>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>, 
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Eric Blake <eblake@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Konstantin Kostiuk <kkostiuk@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org, virtio-fs@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x633.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On Sat, 29 Oct 2022 at 18:25, Stefan Weil <sw@weilnetz.de> wrote:
>
> Most of them were found and fixed using codespell.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>
> My focus was fixing typos which are relevant for the generated documentation.
>
> codespell finds many more typos in source code, and adding it to the continuous
> integration checks looks more and more like a good idea.
>
> Stefan
>
>
>  docs/devel/qapi-code-gen.rst        | 2 +-
>  docs/devel/testing.rst              | 2 +-
>  docs/system/arm/cpu-features.rst    | 2 +-
>  docs/system/loongarch/loongson3.rst | 2 +-
>  docs/tools/virtiofsd.rst            | 2 +-
>  include/exec/memory.h               | 2 +-
>  qapi/qom.json                       | 2 +-
>  qemu-options.hx                     | 8 ++++----
>  qga/qapi-schema.json                | 2 +-
>  tests/qtest/libqtest.h              | 2 +-
>  10 files changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
> index cd9b544376..c4c04bf755 100644
> --- a/docs/devel/qapi-code-gen.rst
> +++ b/docs/devel/qapi-code-gen.rst
> @@ -1313,7 +1313,7 @@ Removing "unreachable" stuff like events that can't be triggered
>  anymore, optional return or event data members that can't be sent
>  anymore, and return or event data member (enumeration) values that
>  can't be sent anymore makes no difference to clients, except for
> -introspection.  The latter can conceivably confuse clients, so tread
> +introspection.  The latter can conceivably confuse clients, so treat
>  carefully.

No, the current text is correct: "tread carefully" means "be cautious".

> --- a/docs/system/loongarch/loongson3.rst
> +++ b/docs/system/loongarch/loongson3.rst
> @@ -41,7 +41,7 @@ can be accessed by following steps.
>
>    $ qemu-system-loongarch64 -machine virt -m 4G -cpu la464-loongarch-cpu \
>        -smp 1 -bios QEMU_EFI.fd -kernel vmlinuz.efi -initrd initrd.img \
> -      -append "root=/dev/ram rdinit=/sbin/init consol e=ttyS0,115200" \
> +      -append "root=/dev/ram rdinit=/sbin/init console e=ttyS0,115200" \
>        --nographic

This is an error, but the fix is wrong -- the space between 'l' and 'e'
should just be deleted.


> @@ -5248,7 +5248,7 @@ SRST
>          read the colo-compare git log.
>
>      ``-object cryptodev-backend-builtin,id=id[,queues=queues]``
> -        Creates a cryptodev backend which executes crypto opreation from
> +        Creates a cryptodev backend which executes crypto operation from

Should be "operations"

>          the QEMU cipher APIS. The id parameter is a unique ID that will

This should be "APIs".

The other changes in the patch look good.

thanks
-- PMM

