Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D29B5ADAB3
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 23:09:36 +0200 (CEST)
Received: from localhost ([::1]:40032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVJLb-0006E5-78
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 17:09:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oVJIt-0002mn-Hu
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 17:06:47 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:42888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oVJIr-0002F4-Um
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 17:06:47 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-3378303138bso78943267b3.9
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 14:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=XNS3k36GwYcGZF9FxLqh3tRnvk1HhNK3At54RF7DTpo=;
 b=YNV6/7+R6v3Gnkh5WzBrMorEJSabL0HFXZQ7HJBcr1g+q9VtMGAqCqFX1z5rcsVzDZ
 FNj7oYUxyha8DOyXAWDZx8t8xL3ZtyRwDZQB9dNt9DPPWHmW3izUzwCM1I16BQKTNwxp
 KuAtU5wU+IsxWnBpTgDDJZAcwuhdmzUJE55KuVtvM94M7NVFlmUjfFCa+oKQfwLDPXmU
 1uPlFF/xVRAjiwAYN+JmpIFtfOFVJlYf5LN+EnRvtogTleIv1iBA+CBwzAhQzoP9Imce
 qAN7RhliYiUcdVxCnq18JMxtt5G3SQiOEcredHLsD4PfR4NZ863AGmyzNNs+s3tcvuMm
 7t9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=XNS3k36GwYcGZF9FxLqh3tRnvk1HhNK3At54RF7DTpo=;
 b=hJmQuM0q3U3JjaXBHhKU9I1pV0C3ZObxJJnRHUQlcP7dGTiQd1tKUVmVgXt+qYLq4Q
 YLwCKPXtMB23t7x6GdC+T7a/345Yy0d4MHNCnxzvknn8YgzjRP86q3tUu23Lv/pjDEKr
 clIR5eEbrdDyiZB+VcMmM3Y6MLZ/lTPrXaTjGKQVydxhKck8WPNCbttvzjSOqYabYWuL
 KjVpUZYJJ+fQLZjwa92Zjx00zB9EPs5PvHp/kNOYx4ZeL1fUs0vRBPRpB69mVX0kuX2o
 jEvDbYAKkv9atB+/CgDBGHtpUuSkeEMq+qH6EqCwbuc69qNILoi7lz7LnvuKcry+jk0Q
 I4OQ==
X-Gm-Message-State: ACgBeo37AQBVwtq5R+/5g/SS2qkCK+4Xsd5v+Ap7ieYFE3gcVT3XWPR7
 xGPR5nfoSC+ROkZ7sOz2/wrXHgq/E9I59ORV4oU=
X-Google-Smtp-Source: AA6agR4GeVvyIWfTkLKkW1GhcymGFe+uJny7kMhFwtovza0BHeNOlbd6YXvXTGBVzhxz9eTsWf99Xd7ETETnvfNM2a4=
X-Received: by 2002:a81:6a54:0:b0:345:4292:4dfe with SMTP id
 f81-20020a816a54000000b0034542924dfemr5256192ywc.62.1662412004259; Mon, 05
 Sep 2022 14:06:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220905204114.208969-1-richard.henderson@linaro.org>
In-Reply-To: <20220905204114.208969-1-richard.henderson@linaro.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 5 Sep 2022 17:06:32 -0400
Message-ID: <CAJSP0QW5JxtthGW9H+kAfgsaXWQ5qYDYg99WA-ui97ttn+RAiw@mail.gmail.com>
Subject: Re: [PATCH] build: Regenerate meson-buildoptions.sh
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, xieyongji@bytedance.com, pbonzini@redhat.com, 
 stefanha@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 5 Sept 2022 at 16:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Regeneration was missed by the previous update.
>
> Fixes: 2a2359b84407 ("vduse-blk: Implement vduse-blk export")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  scripts/meson-buildoptions.sh | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
> index 359b04e0e6..300ba8b212 100644
> --- a/scripts/meson-buildoptions.sh
> +++ b/scripts/meson-buildoptions.sh
> @@ -42,12 +42,13 @@ meson_options_help() {
>    printf "%s\n" '  --enable-trace-backends=CHOICES'
>    printf "%s\n" '                           Set available tracing backends [log] (choices:'
>    printf "%s\n" '                           dtrace/ftrace/log/nop/simple/syslog/ust)'
> -  printf "%s\n" '  --firmwarepath=VALUES    search PATH for firmware files [share/qemu-firmware]'
> +  printf "%s\n" '  --firmwarepath=VALUES    search PATH for firmware files [share/qemu-'
> +  printf "%s\n" '                           firmware]'
>    printf "%s\n" '  --iasl=VALUE             Path to ACPI disassembler'
>    printf "%s\n" '  --includedir=VALUE       Header file directory [include]'
>    printf "%s\n" '  --interp-prefix=VALUE    where to find shared libraries etc., use %M for'
>    printf "%s\n" '                           cpu name [/usr/gnemul/qemu-%M]'
> -  printf "%s\n" '  --libdir=VALUE           Library directory [lib64]'
> +  printf "%s\n" '  --libdir=VALUE           Library directory [lib/x86_64-linux-gnu]'

Uh oh, this is distro-specific. Does this mean meson-buildoptions.sh
output is unstable?

Stefan

