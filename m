Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FF4435F70
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 12:41:57 +0200 (CEST)
Received: from localhost ([::1]:34424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdVWG-0000Ds-F8
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 06:41:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mdVTR-0005mn-Ph
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 06:39:01 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:35819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mdVTO-0002ki-RX
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 06:39:01 -0400
Received: by mail-wr1-x432.google.com with SMTP id g25so382977wrb.2
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 03:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=3fIMDL+NHyFRcMDKCUDzLmqy/g4aXnlAQYow8v04UoA=;
 b=Qnu6AhuBA1e4tz7TdA+PeTo/zMqB81H5NpUbx0mi21kAFNc6XO9g0BN5VmuwinvZc2
 sbkRBYXj6JoLQMss2ZrFAgUnpZiH0yYtES/bEWkizmxg54vjWOeXGl28hlutFZUvMA8K
 WfJHuCavUn4fvvuL5HiXxLg2XSxgD152yP3Ejz3XKziGdG297wUvpd1JEv+2Cnv5sUI1
 aqPvL/7ZeC0qbVZsLw3Sfyo8oXDAdeKrXOlIZ2lFqIVwkTYl7SqsxF6rlayr9f3YEBqz
 3DF+yRbVBdqOeRAPlPm+pBrPhMmFE/qrn0YHd9ELPGYlD2t/jzJpc0//OLJ3UTw4V6zn
 j9ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=3fIMDL+NHyFRcMDKCUDzLmqy/g4aXnlAQYow8v04UoA=;
 b=qMbjZ8QN+zhG+pWOiT3UO+BNAEcHcQ4fO9mqagY2JQf0dApGZ9Opt0GnyG2GvxPgyz
 bKfdiBPfyQbUkwOjbjsRfCo1puejlzsa4wt1UamKMLNocKLih+BTbgfPc3wc5XeQvKJ7
 G9LzhasJW9uxK123a6fMmk1dn5PlFw2FB2XFJl7AsS2edQTht3tOI+MIxdreVIH+i2qG
 3yX4hOPeFw8UBo8BgcukppAQ81Pb09dKrDb3DB3XQpQ9ghZw9gJprPNOvk2ZEuuo2Aw/
 POcuYU9yC2pBfT1b67XRvEz4w37CfsMiw02IjRTtpLKD/llFxlkA+AalOnXleqxj5VYz
 dmvg==
X-Gm-Message-State: AOAM531B0NULjDth7aolNI/RfmPXeaKvC0A+yFBpTXD1avQhTXqAyrlH
 QzHI28Qj6HvbmJ1XJ6PJIOYH6w==
X-Google-Smtp-Source: ABdhPJzcXM9fVnjeW8+7fYE0DXqd/x0MQpgAn1akMVkDl/SdxzPc/Ep1e84yJQJM8ELhGFnkxvRcQA==
X-Received: by 2002:adf:8bd2:: with SMTP id w18mr6364859wra.432.1634812735989; 
 Thu, 21 Oct 2021 03:38:55 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g8sm4533259wrx.26.2021.10.21.03.38.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 03:38:55 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7D8061FF96;
 Thu, 21 Oct 2021 11:38:54 +0100 (BST)
References: <163429165642.439576.16356288759891202632.stgit@pc-System-Product-Name>
 <163429171602.439576.8875867021199772041.stgit@pc-System-Product-Name>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: NDNF <arkaisp2021@gmail.com>
Subject: Re: [PATCH v2 1/2] src/plugins: add helper functions for drcov
Date: Thu, 21 Oct 2021 11:35:17 +0100
In-reply-to: <163429171602.439576.8875867021199772041.stgit@pc-System-Product-Name>
Message-ID: <87zgr2u0g1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: qemu-devel@nongnu.org, pavel.dovgaluk@ispras.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


NDNF <arkaisp2021@gmail.com> writes:

> This patch adds helper functions to the drcov plugin.
> Which provide information about:
> - start_code.
> - end_code.
> - entry.
> - path to the executable binary.
>
> Signed-off-by: Ivanov Arkady <arkadiy.ivanov@ispras.ru>
> ---
>  include/qemu/qemu-plugin.h   |    5 +++++
>  plugins/api.c                |   27 +++++++++++++++++++++++++++
>  plugins/qemu-plugins.symbols |    4 ++++
>  3 files changed, 36 insertions(+)
>
> diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
> index 5775e82c4e..807d932e02 100644
> --- a/include/qemu/qemu-plugin.h
> +++ b/include/qemu/qemu-plugin.h
> @@ -405,4 +405,9 @@ int qemu_plugin_n_max_vcpus(void);
>   */
>  void qemu_plugin_outs(const char *string);
>=20=20
> +QEMU_PLUGIN_EXPORT const char *qemu_plugin_path_to_binary(void);
> +QEMU_PLUGIN_EXPORT uint64_t qemu_plugin_start_code(void);
> +QEMU_PLUGIN_EXPORT uint64_t qemu_plugin_end_code(void);
> +QEMU_PLUGIN_EXPORT uint64_t qemu_plugin_entry_code(void);
> +

Could you please add some documentation to these functions to explain
what each one does. Using the jdoc style:

/**
 * foo() - does bar
 * @baz: the amount of bar
 ...

as this gets automatically translated into API documentation in the
developer docs.

>  #endif /* QEMU_PLUGIN_API_H */
> diff --git a/plugins/api.c b/plugins/api.c
> index bbdc5a4eb4..4e8a582d58 100644
> --- a/plugins/api.c
> +++ b/plugins/api.c
> @@ -340,3 +340,30 @@ void qemu_plugin_outs(const char *string)
>  {
>      qemu_log_mask(CPU_LOG_PLUGIN, "%s", string);
>  }
> +
> +#ifdef CONFIG_USER_ONLY
> +#include "qemu.h"
> +const char *qemu_plugin_path_to_binary(void)
> +{
> +    TaskState *ts =3D (TaskState *) current_cpu->opaque;
> +    return ts->bprm->filename;
> +}
> +
> +uint64_t qemu_plugin_start_code(void)
> +{
> +    TaskState *ts =3D (TaskState *) current_cpu->opaque;
> +    return ts->info->start_code;
> +}
> +
> +uint64_t qemu_plugin_end_code(void)
> +{
> +    TaskState *ts =3D (TaskState *) current_cpu->opaque;
> +    return ts->info->end_code;
> +}
> +
> +uint64_t qemu_plugin_entry_code(void)
> +{
> +    TaskState *ts =3D (TaskState *) current_cpu->opaque;
> +    return ts->info->entry;
> +}
> +#endif

You need some stub functions here for system emulation mode although you
might be able to return something useful for the binary path?

> diff --git a/plugins/qemu-plugins.symbols b/plugins/qemu-plugins.symbols
> index 4bdb381f48..021851fb7d 100644
> --- a/plugins/qemu-plugins.symbols
> +++ b/plugins/qemu-plugins.symbols
> @@ -37,4 +37,8 @@
>    qemu_plugin_n_vcpus;
>    qemu_plugin_n_max_vcpus;
>    qemu_plugin_outs;
> +  qemu_plugin_path_to_binary;
> +  qemu_plugin_start_code;
> +  qemu_plugin_end_code;
> +  qemu_plugin_entry_code;

Please maintain the sorted list as it makes it easier to find missing
symbols ;-)

--=20
Alex Benn=C3=A9e

