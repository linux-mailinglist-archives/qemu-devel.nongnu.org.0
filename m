Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2F632ED82
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 15:54:23 +0100 (CET)
Received: from localhost ([::1]:55720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIBqQ-00078b-FQ
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 09:54:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIBoV-00061x-Af
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 09:52:23 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:39763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIBoQ-0000TK-Sm
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 09:52:23 -0500
Received: by mail-ej1-x630.google.com with SMTP id w17so3987941ejc.6
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 06:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2HlzMsulkf1nZK4lCFXC5t1qQhQOsKs3MD2XhO0VRKg=;
 b=btr5qpMYc2BO6QlRHpAObmL0dnuCZqKPv6RmY5+gCwuPt/ML15BTC74IBtoDTOFZVf
 ZkM4pzwjAa0whkXnXAaAd8g/YR8cUJCBAJxxike1FJMSbUOJmnymR1yqDLCFtBC365KH
 w6XDVVtV2h6KPYHPzmmqqGVr0+XW1Op8aZvAszaso3I3ATJCO33iSFjPlbOJKu/hhihB
 bzK8Rj81NQpF65v75I23WczMcn3CfEhHvFiB78QJoxyx/zNkciBtxdNKjk9XcA3KkFzc
 brrCuSd8CYcm4tWpQhOCWHTFw1i15fmusx+x9gy1q0P+11MHyuo3b5FIXxCIkd4vYoQW
 7wOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2HlzMsulkf1nZK4lCFXC5t1qQhQOsKs3MD2XhO0VRKg=;
 b=C4sL4gyqL6Gq/kjotSdDFOc49Lzjb8E2abKBB2nwe1T/3tl+L+6OR77SVysXwL9DN7
 jiqFRtWzvX9I4J07+lr8hNac+AZICExWBd7omBJfniSbXroC+TwKavuBwBDBa4ZacVMr
 fJQOXhnXsfHiHgxQ05/w19na35Y+2vLtUaQbRHq1tVffsdx5IhjhJZHeBEgwkCeGctmv
 AN2m4GQVjfqbdeEfQVi/DUU7mSfcqoVLGV8cJlxJ+OjaKMNzsnR2qmmXdc5QzjWsarwN
 MdpeLn3BGzhDLW/sY+X7N2sP8nAe0IifFTw5I1Ky72Yeg8IXmqr+YUbxHYeZ1azvtaVZ
 3SmQ==
X-Gm-Message-State: AOAM532gBt0+0NNrE4v6OPf+6qfEqU9iKn7pNYVn3GmnhVCEmCNlzQUs
 Zrgoo/whx5inbQoyR55Tl+348ygmj4LpXqVvAk2BXg==
X-Google-Smtp-Source: ABdhPJw8YXUwNXlYz7s8dPzytl2T21BwAyh+BYhCyYlF1IjabU2ZXLOD3IG2FiUqktHWBWF5lku4qA7khXRIfNYWa8U=
X-Received: by 2002:a17:906:16ca:: with SMTP id
 t10mr2549871ejd.85.1614955937280; 
 Fri, 05 Mar 2021 06:52:17 -0800 (PST)
MIME-Version: 1.0
References: <20210305144839.6558-1-alex.bennee@linaro.org>
In-Reply-To: <20210305144839.6558-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Mar 2021 14:52:01 +0000
Message-ID: <CAFEAcA-UVUCd2XgU4anv4c1WH0kzCcB=usPfaBroNSkzq_ST3A@mail.gmail.com>
Subject: Re: [RFC PATCH] .editorconfig: update the automatic mode setting for
 Emacs
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 5 Mar 2021 at 14:50, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> It seems the editor specific keywords have been deprecated in the main
> editorconfig plugin:
>
>   https://github.com/editorconfig/editorconfig-emacs#file-type-file_type_=
ext-file_type_emacs
>
> Update the keywords to the suggested one and point users at the
> extension.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  .editorconfig | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
>
> diff --git a/.editorconfig b/.editorconfig
> index 22681d91c6..22656e849d 100644
> --- a/.editorconfig
> +++ b/.editorconfig
> @@ -4,6 +4,11 @@
>  # plugin.
>  #
>  # Check https://editorconfig.org for details.
> +#
> +# Emacs: you need https://github.com/10sr/editorconfig-custom-majormode-=
el
> +# to automatically enable the appropriate major-mode for your files
> +# that aren't already caught by your exiting config.

"existing".

-- PMM

