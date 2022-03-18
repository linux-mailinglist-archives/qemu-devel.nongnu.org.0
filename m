Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9062A4DD930
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 12:47:23 +0100 (CET)
Received: from localhost ([::1]:54804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVB4k-0004Aa-5v
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 07:47:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVAzL-0003DB-I9
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 07:41:47 -0400
Received: from [2607:f8b0:4864:20::112b] (port=37651
 helo=mail-yw1-x112b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVAzF-0000mG-9P
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 07:41:42 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2e5757b57caso88239977b3.4
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 04:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A3RQbMafMLHH62Wm8oL61/J5I5dP7kcfaW2OxQGVjxs=;
 b=zKveAwC25ThQTeZoVAnvcJc8cTF/RnbCL5CJ+fBpklVF7eYUY/2TC+tMBV36MsyylU
 5WPmSmtwyOYbSwtu8lnyecE8uFaBwB+9LLLU/wdqq1/H1OybVxqMUDTwKB1dRLbrUBfz
 yhKsgKd1jUAEdefgZFMjwZIsqyXFZ7X2llTk9a3uCaigHvA6l0+cSdUIb5ZJWaHT4jwF
 lLTiF4Aswv9JyW0cnfiI4iSzAph5Nw2gVj0QmsB1wAwyKCAo3Q56WJONrg15eEfqMpwD
 /zmsKbYTrksBaWoiB+QEvRkGFh/yQPbXB3cGacD+uhi9J4Kwzcp0l+e6ghkbzg8g5/zr
 GeWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A3RQbMafMLHH62Wm8oL61/J5I5dP7kcfaW2OxQGVjxs=;
 b=Kx5/r3RKWXhDEQinShVvdnI1+0c3efTtwpOu3LtIdbGeMSk8P5EiEJkjmdxvKzNdKJ
 a0KpYWRA9ulvAOqukmVTckR4CkTsLN9Byq93yNfzy3Tb3FpQCEy2UeUHrMPY0nME1zqs
 A2JikZcjApPwaJZMLKtAbXJpzRRUoNbVWUpM40uK8gHgCZRgqlPR8tWyqjXa+cVKpFAo
 skoVfhZt0pBMbExauBHP97wHJ0wSmWHc+sRcNV69fmSWx66RGDeuZ8KX5mZx9rtZeGEW
 gMkuygdJQMpNWc0naTEYAyYgPEqzLx7bV9hERmGduGU7OgkIEvWhgBlDenY4r+eLMgE+
 PZvA==
X-Gm-Message-State: AOAM533ZXIVAzLPnSdVGtLADLVQ6hSm3n7LXva7kadTESv71vxAO7COG
 Dy+Dm0fNefYnwDwLLsOS1spwln2LHI95D3O7vxU2Ug==
X-Google-Smtp-Source: ABdhPJxK8Au2fnW1HqyPzxEa4cWbHESDHFYur3DDF3IQWWRR74O17+HRUygmBitxmgWePxqKpn+PkExq3/psCjC5JBE=
X-Received: by 2002:a0d:f603:0:b0:2d1:57e5:234 with SMTP id
 g3-20020a0df603000000b002d157e50234mr10953974ywf.469.1647603699815; Fri, 18
 Mar 2022 04:41:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220315224519.498463-1-richard.henderson@linaro.org>
In-Reply-To: <20220315224519.498463-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Mar 2022 11:41:28 +0000
Message-ID: <CAFEAcA9KjAtYy7KxjX_1LDafBOj07NHnzKaRzxoaa5JVU+kwzg@mail.gmail.com>
Subject: Re: [PATCH] linux-user: Clean up arg_start/arg_end confusion
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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
Cc: qemu-devel@nongnu.org, Laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 15 Mar 2022 at 22:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We had two sets of variables: arg_start/arg_end, and
> arg_strings/env_strings.  In linuxload.c, we set the
> first pair to the bounds of the argv strings, but in
> elfload.c, we set the first pair to the bounds of the
> argv pointers and the second pair to the bounds of
> the argv strings.
>
> Remove arg_start/arg_end, replacing them with the standard
> argc/argv/envc/envp values.  Retain arg_strings/env_strings.

"Retain arg_strings/env_strings with the meaning we were using
in elfload.c" ? (ie linuxload.c changes to that definition).

> Update linuxload.c, elfload.c, and arm-compat-semi.c to match.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/714
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> --- a/linux-user/linuxload.c
> +++ b/linux-user/linuxload.c
> @@ -92,33 +92,35 @@ abi_ulong loader_build_argptr(int envc, int argc, abi_ulong sp,
>      envp = sp;
>      sp -= (argc + 1) * n;
>      argv = sp;
> +    ts->info->envp = envp;
> +    ts->info->envc = envc;
> +    ts->info->argv = argv;
> +    ts->info->argc = argc;
> +
>      if (push_ptr) {
> -        /* FIXME - handle put_user() failures */

Why are you deleting all these FIXME comments? That seems like an
unrelated change.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

