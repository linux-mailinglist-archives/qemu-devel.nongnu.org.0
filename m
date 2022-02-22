Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 060D34BF996
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 14:41:20 +0100 (CET)
Received: from localhost ([::1]:49502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMVPq-0007Ba-H2
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 08:41:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMV7O-0001u8-P4
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 08:22:15 -0500
Received: from [2607:f8b0:4864:20::112e] (port=33703
 helo=mail-yw1-x112e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMV7I-00062i-Pj
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 08:22:10 -0500
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-2d66f95f1d1so173179577b3.0
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 05:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PgWFmIdWPQO+Ta5768k+RQieYTjl2MqGegeCc2ifkHo=;
 b=ZPA3+AZk/mJP3qb/TG29FpY0kJ+/VRbU1vhil/vwdPwYnacGXVx/8BnqiDb2wfXZ7I
 b4p647MME5uEmktcB2CvikWWEYM0bviB7h4viRiP8NTv4t0JPypfXiLDgExfFqmENwFn
 a/aAgUvhYlg8HwuVpPoza9VGBRwJbGlY/7O0nu3o508jjsgCUCwL7axAH1dILlud1DlF
 jaD9l3zzHYI7E3iH9BE8PBOro6vgpeXQAT7oUNoISgcCqvI4TtAj9SDpFjukyMg0XdVz
 gOxaQ1Cr6t+pbofGjb5zlOxV8EOxJ8bSoIemzM+7AJ3rUu/y4zlHKKzTK6ryChvSNDrl
 Fhxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PgWFmIdWPQO+Ta5768k+RQieYTjl2MqGegeCc2ifkHo=;
 b=LQiShAwaTyiDZ3F4CwJAaBov3JQEBPkg7XGaKXFDV7RPv+GS9jNbR+bxQqYFTvZjUa
 uZAl/GeLls3+VyVz2cNd4qyBarMB9kLn+YFDHMnZ9TytY9JzEAK5bW+wlQaINKOlcAgl
 uaXH7RI/m+5CFzT2JT8P2C7F7q/umJUzBDsKv+KaNzEdqa0eF9cVTOfETSzBLeuAPE1S
 TxIpDz5ye9aGhTN2VBT1CWLoO8kjBlrqGWzFilU+dkd1tzyUDxdAh8vQIzbHFFLgVR9E
 G/A4JxlGz3+ACoLUv97JsHcROgH7IXEEczlGObSCqOvoBdLy8AQfefAuNm9ubNAKDziM
 UZiA==
X-Gm-Message-State: AOAM531CWHLmlHcQ8EGXj2LzoKtNUFBM2Vrg0+SAFiK50PGaKavjFGOW
 55VKb7RyqNkKe6TDOcVDql3HjSISDveVndrcR1PNv5Bfvyj2Xg==
X-Google-Smtp-Source: ABdhPJx1Qn6AOmaOHvUjw6cFvbxqFuyW42K5k/Hc8Ze/ubjbSZrrhtSdzWi75bbqsbQYyc/ql3jKOeWaQsIj2OunY8M=
X-Received: by 2002:a81:a748:0:b0:2d6:1f8b:23a9 with SMTP id
 e69-20020a81a748000000b002d61f8b23a9mr24176343ywh.329.1645536123273; Tue, 22
 Feb 2022 05:22:03 -0800 (PST)
MIME-Version: 1.0
References: <cover.1645114783.git.qemu_oss@crudebyte.com>
 <e64e27d5cb103b7764f1a05b6eda7e7fedd517c5.1645114783.git.qemu_oss@crudebyte.com>
In-Reply-To: <e64e27d5cb103b7764f1a05b6eda7e7fedd517c5.1645114783.git.qemu_oss@crudebyte.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Feb 2022 13:21:52 +0000
Message-ID: <CAFEAcA_=HAUNomKD2wurSVaAHa5mrk22A1oHKLWUDjk7v6Khmg@mail.gmail.com>
Subject: Re: [PULL v2 5/5] 9pfs: Fix segfault in do_readdir_many caused by
 struct dirent overread
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Feb 2022 at 16:43, Christian Schoenebeck
<qemu_oss@crudebyte.com> wrote:
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index d1660d67fa..ce12f64853 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -805,6 +805,19 @@ static inline int platform_does_not_support_system(const char *command)
>  }
>  #endif /* !HAVE_SYSTEM_FUNCTION */
>
> +/**
> + * Duplicate directory entry @dent.
> + *
> + * It is highly recommended to use this function instead of open coding
> + * duplication of @c dirent objects, because the actual @c struct @c dirent
> + * size may be bigger or shorter than @c sizeof(struct dirent) and correct
> + * handling is platform specific (see gitlab issue #841).
> + *
> + * @dent - original directory entry to be duplicated
> + * @returns duplicated directory entry which should be freed with g_free()
> + */
> +struct dirent *qemu_dirent_dup(struct dirent *dent);

Hi; I just noticed this has landed in git recently.
Please don't add new prototypes to osdep.h -- it is
a header included by every single C file in the tree, so
making it bigger slows down compilation. osdep.h is supposed
to contain only:
 * things which everybody needs
 * things without which code would work on most platforms but
   fail to compile or misbehave on a minority of host OSes
   (ie system incompatibility handling)

This prototype is neither of those -- please find or create a more
appropriate header file for it, that can be included only by the
source files that actually need it.

thanks
-- PMM

