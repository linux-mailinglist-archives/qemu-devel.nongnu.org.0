Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E631D2F6270
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 14:54:02 +0100 (CET)
Received: from localhost ([::1]:50184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l034b-0003o9-VJ
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 08:54:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l02xj-000533-Az
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:46:55 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:42750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l02xh-0001BW-G8
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:46:55 -0500
Received: by mail-wr1-x434.google.com with SMTP id m4so5804777wrx.9
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 05:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=2j3W696e5MOHC9SR9OOL7/rPmRqgT4sACuZ98lFWd0s=;
 b=SgEKG+qSHavmbXnKXElb/PCkakT7wgPWl9dOpTKZfs7jVeMsVipGkVdwgvvCcnxgns
 jGHE4K0xijnv60PBFBS36b/FgyOYALFPuLfWp66qFdYzoxG/Aak6djvPUN3y79QsYbxC
 yv5/r/RsD5G/06R2DXjh5qUexOS2cJJAEFh8Tujc/oyUMU/ZEfgurKvDV5A3yhdttggl
 aX5HrpEVQjVSiBfvthIj9O4svrUO1882/pn2eJuRxVb1MwTh5SsDmZy6zA0CSbkiLwAY
 dwqcWMQlj23hxb08qZoJ9dKxClpufVfeNw3Petre0FJd3u6E6BYEmV95ZyWcakdPdM/0
 DoUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=2j3W696e5MOHC9SR9OOL7/rPmRqgT4sACuZ98lFWd0s=;
 b=O6XRE/c50sWK5ga+TuyZHuX61TbLDYENN76l9zlOH3La1FsfWB306OpCcT6eMrtUd2
 2fc2nFJlRx4+tJBgVhF65uWo4HJO+5t20djmmadahJE5TKqOOUdvQR+wV8HgHk8fLL3Y
 5E8JYbD3lAKaAIZMXceh6WxvYDxfPKl3xAe6znmASJROwRctuSEuSI+VUD/tcjnoAkmm
 Bk5ZByG6APLFM9EzDkJY+3qdyRWotM/HWVwDjH5ON23z4zMcXAvxkDAePPl3BT6tYg86
 vWtsMDMxT/a4PVth95axm8zOO1RJJICV1mLJC7yYH8J6j13sx7lmbWQmrfikbEyEbgH5
 NpSQ==
X-Gm-Message-State: AOAM530s1I47STmntN1DkIQ4Qs8OaS7nE1Hltw3nZlPcq17zsHx0XECm
 myXEL19L53odyiXMKZX4OGsiig==
X-Google-Smtp-Source: ABdhPJx3/FxRqSfzgdDhHRDT39CMSpDfzUY7yBAFs5oY04BqzQWm9ZpApIz4XunY6Gf4hUWW3GZhSQ==
X-Received: by 2002:adf:dd92:: with SMTP id x18mr8083921wrl.311.1610632011868; 
 Thu, 14 Jan 2021 05:46:51 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a25sm8341728wmb.25.2021.01.14.05.46.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 05:46:50 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7C9ED1FF7E;
 Thu, 14 Jan 2021 13:46:49 +0000 (GMT)
References: <87r1mnlr0a.fsf@linaro.org>
 <20210114141918.5201cc9c@gecko.fritz.box>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Lukas Straub <lukasstraub2@web.de>
Subject: Re: [PATCH] Fix build with new yank feature by adding stubs
Date: Thu, 14 Jan 2021 13:46:17 +0000
In-reply-to: <20210114141918.5201cc9c@gecko.fritz.box>
Message-ID: <87lfcvljg6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Lukas Straub <lukasstraub2@web.de> writes:

> Signed-off-by: Lukas Straub <lukasstraub2@web.de>

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


I'm also going to pull this into my testing/next as I need the fix as a
prerequisite.

> ---
>  stubs/meson.build |  1 +
>  stubs/yank.c      | 29 +++++++++++++++++++++++++++++
>  2 files changed, 30 insertions(+)
>  create mode 100644 stubs/yank.c
>
> diff --git a/stubs/meson.build b/stubs/meson.build
> index 80b1d81a31..1a656cd070 100644
> --- a/stubs/meson.build
> +++ b/stubs/meson.build
> @@ -47,6 +47,7 @@ stub_ss.add(files('vm-stop.c'))
>  stub_ss.add(files('win32-kbd-hook.c'))
>  stub_ss.add(files('cpu-synchronize-state.c'))
>  if have_block
> +  stub_ss.add(files('yank.c'))
>    stub_ss.add(files('replay-tools.c'))
>  endif
>  if have_system
> diff --git a/stubs/yank.c b/stubs/yank.c
> new file mode 100644
> index 0000000000..6090416065
> --- /dev/null
> +++ b/stubs/yank.c
> @@ -0,0 +1,29 @@
> +#include "qemu/osdep.h"
> +#include "qemu/yank.h"
> +
> +bool yank_register_instance(const YankInstance *instance, Error **errp)
> +{
> +    return true;
> +}
> +
> +void yank_unregister_instance(const YankInstance *instance)
> +{
> +}
> +
> +void yank_register_function(const YankInstance *instance,
> +                            YankFn *func,
> +                            void *opaque)
> +{
> +}
> +
> +void yank_unregister_function(const YankInstance *instance,
> +                              YankFn *func,
> +                              void *opaque)
> +{
> +}
> +
> +void yank_generic_iochannel(void *opaque)
> +{
> +}
> +
> +


--=20
Alex Benn=C3=A9e

