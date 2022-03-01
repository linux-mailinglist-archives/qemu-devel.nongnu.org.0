Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C95D4C981B
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 23:03:29 +0100 (CET)
Received: from localhost ([::1]:33846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPAad-0004Fk-6V
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 17:03:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPAXG-0001Dk-56
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 16:59:58 -0500
Received: from [2607:f8b0:4864:20::b2a] (port=36632
 helo=mail-yb1-xb2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPAXE-0004j3-EV
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 16:59:57 -0500
Received: by mail-yb1-xb2a.google.com with SMTP id f38so18171793ybi.3
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 13:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8m6W4451GQnE+xmXeZjgAsQN3m0xYTDn8fhfZjazWmo=;
 b=S1tDAFJxX6yub3xP/GXaRMWAB3IJAFLq4pXKKNqDK8fOxyL79Etti1UI1/2YyIksqH
 EeL49WaIk9llm0o41FPZFaRnJSPpM09QWGJrzL/7UM1V8wjc7aKli6TiHz9tSrLql5kC
 g16h/YKfbEWu9mmy8OzBXYrQJd2av38/Xj5Obbj+o/XYVGepKr4SgIr1+H+Ky8v2y0no
 /W2vgbJQBxcMuwHcJZx57JpSz9t1aGVf+H7c+2YK3Aa5fR0jzQbj8gK6zs332swieDJn
 VBGmpk0My/rnYhTVV4oZviLCodlyXWJAhjqFO2CeetROmQ+L8vElxKhMYWvWvujm//8C
 +b2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8m6W4451GQnE+xmXeZjgAsQN3m0xYTDn8fhfZjazWmo=;
 b=H6QElxpJowTzKJhWcok7Sh7FtRfIjB4uiprIdATjBSC3BQhiZMl4aPkbi9mYpMY+Lf
 wcIYbtdCyGES4ZtBdXPtCsDGuVR0JNO2F3WgCIbk8oxKECGX8jHn311kQa9N0Wu+Ihdy
 1OS8btiZnlW1X38ZvJdZRrLd+47so0g7xymsSGJxOvDnvnqHfXOy6vtjv9gdOnnLm0tf
 BBafNThYsWawBIWaVsmc1QKvcf47EPw5scIZ7Z9s5oGIYybGMH2TCuzlFr6iV0bQD+4R
 F8C3/RqUN8zqx2M/zJJwG0orL/c+fWG143st3Jlj9SUNNHXJZW8/RWkWaQpRXtP/m2iH
 x+9A==
X-Gm-Message-State: AOAM5312RUdagQv1l9SggiYFdGiVI0VBlENYQxdNUivlha+S+QlXcVAI
 qRG/DlGrM2aUjuLW7KdbeMk8PJFPVHdoCicTLYQf5xBiuP4=
X-Google-Smtp-Source: ABdhPJxWopusBxDMFUfj/wuoh+BeQNHH+jnQLH3RVl2ZOnRHVc7cQ+19r3yoPZlFt+WkXVnj3nWtbaEWrp4Zs8cqzfQ=
X-Received: by 2002:a05:6902:83:b0:61a:709b:d841 with SMTP id
 h3-20020a056902008300b0061a709bd841mr25113872ybs.140.1646171995194; Tue, 01
 Mar 2022 13:59:55 -0800 (PST)
MIME-Version: 1.0
References: <E1nP9Oz-00043L-KJ@lizzy.crudebyte.com>
In-Reply-To: <E1nP9Oz-00043L-KJ@lizzy.crudebyte.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Mar 2022 21:59:43 +0000
Message-ID: <CAFEAcA89+ENOM6x19OEF53Kd2DWkhN5SN21Va0D7yepJSa3Jyg@mail.gmail.com>
Subject: Re: [PATCH] 9pfs: move qemu_dirent_dup() from osdep -> 9p-util
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
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

On Tue, 1 Mar 2022 at 20:47, Christian Schoenebeck
<qemu_oss@crudebyte.com> wrote:
>
> Function qemu_dirent_dup() is currently only used by 9pfs server, so move
> it from project global header osdep.h to 9pfs specific header 9p-util.h.
>
> Link: https://lore.kernel.org/qemu-devel/CAFEAcA_=HAUNomKD2wurSVaAHa5mrk22A1oHKLWUDjk7v6Khmg@mail.gmail.com/
> Based-on: <20220227223522.91937-12-wwcohen@gmail.com>
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>  hw/9pfs/9p-util.h    | 30 ++++++++++++++++++++++++++++++
>  include/qemu/osdep.h | 13 -------------
>  util/osdep.c         | 21 ---------------------
>  3 files changed, 30 insertions(+), 34 deletions(-)
>
> diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
> index 1f74d37558..8b92614e6c 100644
> --- a/hw/9pfs/9p-util.h
> +++ b/hw/9pfs/9p-util.h
> @@ -112,6 +112,36 @@ static inline off_t qemu_dirent_off(struct dirent *dent)
>  #endif
>  }
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

since it's just code movement, but those "@c"s look a bit weird:
are they really valid kerneldoc comment markup?

thanks
-- PMM

